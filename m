Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AC12D5BD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:53:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsSa-0001fZ-GC
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:53:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ0-0008Dn-IC
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsPz-0002YB-Cl
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:36 -0400
Received: from ozlabs.org ([203.11.71.1]:41027)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsPz-0002WO-29; Wed, 29 May 2019 02:50:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv24llpz9sNy; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112622;
	bh=ytv6+2Za7txhjhng8BTf4vmasxIQT6D/X9uDYVn1uXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJ2bd7ulby/dX+GTUchLdBTHVWauVDV/yA0kMbbzMo34TjFDS8/6lIqUM+YRLJTCN
	n2P6mD+pGgYvgYxhnggnj44CGyOqyYhKZmko6OQWGaVvQUqY778vPUWLCaVoFg76nD
	WG15NDjg+RRQLQxCYZmLBrpGqJlgsc2QJDDy97sA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:47 +1000
Message-Id: <20190529065017.15149-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 14/44] spapr/xive: EQ page should be naturally
 aligned
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: C=C3=A9dric Le Goater <clg@kaod.org>

When the OS configures the EQ page in which to receive event
notifications from the XIVE interrupt controller, the page should be
naturally aligned. Add this check.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190508171946.657-2-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
[dwg: Minor change for printf warning on some platforms]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 097f88d460..33da1a52c6 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -993,6 +993,12 @@ static target_ulong h_int_set_queue_config(PowerPCCP=
U *cpu,
     case 16:
     case 21:
     case 24:
+        if (!QEMU_IS_ALIGNED(qpage, 1ul << qsize)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: EQ @0x%" HWADDR_PRIx
+                          " is not naturally aligned with %" HWADDR_PRIx=
 "\n",
+                          qpage, (hwaddr)1 << qsize);
+            return H_P4;
+        }
         end.w2 =3D cpu_to_be32((qpage >> 32) & 0x0fffffff);
         end.w3 =3D cpu_to_be32(qpage & 0xffffffff);
         end.w0 |=3D cpu_to_be32(END_W0_ENQUEUE);
--=20
2.21.0


