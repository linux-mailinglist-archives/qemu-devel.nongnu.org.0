Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE2B1655A7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 04:30:09 +0100 (CET)
Received: from localhost ([::1]:35328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4cXQ-00086Y-4W
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 22:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cRA-0004hW-6Z
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j4cR8-0008OL-RD
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 22:23:40 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54247 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j4cR8-0008Lu-EH; Wed, 19 Feb 2020 22:23:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48NKg14yzfz9sSh; Thu, 20 Feb 2020 14:23:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582169005;
 bh=aBsVfkPLqtLYAJVvSFLlYU9uQn9tdTvG94/i9S6mjsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LPb+al20cCFacYersPRalufjTqONeNU/DZV7uLBy99XtsjdqDveCO4qmJKZXWAtVm
 NmY6I9d8uJF8nZVyKat600DJNRnszh1Dw3Mv1PNP3JOqao8CMmv6JuKjhGjgREBuZp
 +wXsRdv3R5y1oQMqeiWA2xSauvSErJ/E1WquWrQg=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org,
	groug@kaod.org,
	clg@kaod.org
Subject: [PATCH v5 13/18] spapr: Don't use weird units for MIN_RMA_SLOF
Date: Thu, 20 Feb 2020 14:23:11 +1100
Message-Id: <20200220032317.96884-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220032317.96884-1-david@gibson.dropbear.id.au>
References: <20200220032317.96884-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, paulus@samba.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIN_RMA_SLOF records the minimum about of RMA that the SLOF firmware
requires.  It lets us give a meaningful error if the RMA ends up too smal=
l,
rather than just letting SLOF crash.

It's currently stored as a number of megabytes, which is strange for glob=
al
constants.  Move that megabyte scaling into the definition of the constan=
t
like most other things use.

Change from M to MiB in the associated message while we're at it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 828e2cc135..272a270b7a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -103,7 +103,7 @@
 #define FW_OVERHEAD             0x2800000
 #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
=20
-#define MIN_RMA_SLOF            128UL
+#define MIN_RMA_SLOF            (128 * MiB)
=20
 #define PHANDLE_INTC            0x00001111
=20
@@ -2959,10 +2959,10 @@ static void spapr_machine_init(MachineState *mach=
ine)
         }
     }
=20
-    if (spapr->rma_size < (MIN_RMA_SLOF * MiB)) {
+    if (spapr->rma_size < MIN_RMA_SLOF) {
         error_report(
-            "pSeries SLOF firmware requires >=3D %ldM guest RMA (Real Mo=
de Area memory)",
-            MIN_RMA_SLOF);
+            "pSeries SLOF firmware requires >=3D %ldMiB guest RMA (Real =
Mode Area memory)",
+            MIN_RMA_SLOF / MiB);
         exit(1);
     }
=20
--=20
2.24.1


