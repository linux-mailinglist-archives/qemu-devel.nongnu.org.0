Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544572483A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSySV-0006RR-EC
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:41:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHV-0005sj-Re
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHU-0007mg-H4
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56457 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHU-0007hW-4m; Tue, 21 May 2019 02:29:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpf6xz7z9sNp; Tue, 21 May 2019 16:29:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420170;
	bh=ytv6+2Za7txhjhng8BTf4vmasxIQT6D/X9uDYVn1uXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qb6S8crd/ep/ZFbgYlur0SGUxUDprCHpxUmY6HgXwt5FgqUSQsXEvYOnwSkwvYKhK
	A8qk+KCzG9X5i74K2ty7JgEFriUyFuvmOmArYDRyZS1gGAvfWQdasWET0Oh7dx2p3i
	ne/IwSWhqzPAJeimPXSLcp5cuSyDfvzVhweC5vbM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:28:59 +1000
Message-Id: <20190521062924.6930-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 13/38] spapr/xive: EQ page should be naturally
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
Cc: lvivier@redhat.com, gkurz@kaod.org, Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
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


