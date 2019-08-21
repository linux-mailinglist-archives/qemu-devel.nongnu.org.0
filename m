Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0C9744D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:01:24 +0200 (CEST)
Received: from localhost ([::1]:44784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LYZ-0003xP-2A
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0q-0005Bg-35
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0o-0008S5-AZ
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:31 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60269)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0n-00087E-Qv; Wed, 21 Aug 2019 03:26:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjF0wFdz9sQw; Wed, 21 Aug 2019 17:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372353;
 bh=hIig2nTissNaV4C54zIncxf4ubr2zTLoxwEtdCEGU1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aoIxHV/dADnQFl6QGTRf0DrVbigzQcJ9auJGeHn7V+KZ1/UrxH8awG2I/F0pAdUl+
 zmlRLRwxeD6qWV50JoEyQvVCqbJJ6MNMz59ke+itpg46MQzlkX5H7OjC5pZAMeLwot
 GRq/YKvKZFE1fzHojRu3aiCWKbxtzyubLC/ufwsc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:25 +1000
Message-Id: <20190821072542.23090-26-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 25/42] ppc/xive: Provide escalation support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

If the XIVE presenter can not find the NVT dispatched on any of the HW
threads, it can not deliver the interrupt. XIVE offers an escalation
mechanism to handle such scenarios and inform the hypervisor that an
action should be taken.

Escalation is configured by setting the 'e' bit and the EAS in word 4
& 5 to let the HW look for the escalation END on which to trigger a
new event.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190718115420.19919-6-clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/xive.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index f27b4e3328..12f0d09df6 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1549,6 +1549,22 @@ static void xive_router_end_notify(XiveRouter *xrt=
r, uint8_t end_blk,
          * On HW, follows a "Broadcast Backlog" to IVPEs
          */
     }
+
+    /*
+     * If activated, escalate notification using the ESe PQ bits and
+     * the EAS in w4-5
+     */
+    if (!xive_end_is_escalate(&end)) {
+        return;
+    }
+
+    /*
+     * The END trigger becomes an Escalation trigger
+     */
+    xive_router_end_notify(xrtr,
+                           xive_get_field32(END_W4_ESC_END_BLOCK, end.w4=
),
+                           xive_get_field32(END_W4_ESC_END_INDEX, end.w4=
),
+                           xive_get_field32(END_W5_ESC_END_DATA,  end.w5=
));
 }
=20
 void xive_router_notify(XiveNotifier *xn, uint32_t lisn)
--=20
2.21.0


