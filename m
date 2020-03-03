Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E04176DB1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 04:50:39 +0100 (CET)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8yZq-0000zR-WC
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 22:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTW-0004iM-Bv
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j8yTV-0002GN-2w
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 22:44:06 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34783)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j8yTU-0002DR-OA; Mon, 02 Mar 2020 22:44:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WjY63P2Yz9sT0; Tue,  3 Mar 2020 14:43:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583207034;
 bh=ftj0R5rS8cF1e2cJbYfuxZHaB3qmUGTO1ycLuCLqpv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LevHqPLjSV+Heocm7vaB6ME1m+7TLqufN3dfhApHTDG3DUW8Y9Dgsuso/Whwt8SM5
 U7LyZJCsBwWtj+o20/9tivXuJo5hCqiQIIH1cYars3a5OByqvGcqbhVOanAc1jMehE
 ZrZwXFn+NeZzQTVk07QPiWLk7Adw2Y2WGdf4EioI=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org, clg@kaod.org, qemu-devel@nongnu.org, groug@kaod.org
Subject: [PATCH v7 12/17] spapr: Don't use weird units for MIN_RMA_SLOF
Date: Tue,  3 Mar 2020 14:43:46 +1100
Message-Id: <20200303034351.333043-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200303034351.333043-1-david@gibson.dropbear.id.au>
References: <20200303034351.333043-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, farosas@linux.ibm.com,
 aik@ozlabs.ru, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, paulus@samba.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cc10798be4..510494ad87 100644
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
@@ -2956,10 +2956,10 @@ static void spapr_machine_init(MachineState *mach=
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


