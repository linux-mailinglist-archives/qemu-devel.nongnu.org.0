Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8EE2D5F4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:11:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsjn-00084R-8o
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ2-0008Fx-E6
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ0-0002Za-Ga
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:38 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57579 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsPz-0002Wc-O6; Wed, 29 May 2019 02:50:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv23zSDz9sNK; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112622;
	bh=BDmxZb8/fuq570SYItgaSbQcITu2aaOYY38yS/5ivek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNZ+Rb7ax7EwdmEnHRbIVdAsxLePKquZ/8TcKRK8u6NPvtolC8WrWgFWOS9sAgPYG
	J5QhJGZz+50+o3b89lvS84qss+g8H+d6Ue53ZLD7Z72yntztErO5gmwBe4whnFmLrk
	FeNFDNBjuNl9c+11LQ920xPYIM3uz0x8QLt83LDg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:48 +1000
Message-Id: <20190529065017.15149-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 15/44] spapr/xive: fix EQ page addresses above
 64GB
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

The high order bits of the address of the OS event queue is stored in
bits [4-31] of word2 of the XIVE END internal structures and the low
order bits in word3. This structure is using Big Endian ordering and
computing the value requires some simple arithmetic which happens to
be wrong. The mask removing bits [0-3] of word2 is applied to the
wrong value and the resulting address is bogus when above 64GB.

Guests with more than 64GB of RAM will allocate pages for the OS event
queues which will reside above the 64GB limit. In this case, the XIVE
device model will wake up the CPUs in case of a notification, such as
IPIs, but the update of the event queue will be written at the wrong
place in memory. The result is uncertain as the guest memory is
trashed and IPI are not delivered.

Introduce a helper xive_end_qaddr() to compute this value correctly in
all places where it is used.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20190508171946.657-3-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c       | 3 +--
 hw/intc/xive.c             | 9 +++------
 include/hw/ppc/xive_regs.h | 6 ++++++
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 33da1a52c6..a19e998093 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1150,8 +1150,7 @@ static target_ulong h_int_get_queue_config(PowerPCC=
PU *cpu,
     }
=20
     if (xive_end_is_enqueue(end)) {
-        args[1] =3D (uint64_t) be32_to_cpu(end->w2 & 0x0fffffff) << 32
-            | be32_to_cpu(end->w3);
+        args[1] =3D xive_end_qaddr(end);
         args[2] =3D xive_get_field32(END_W0_QSIZE, end->w0) + 12;
     } else {
         args[1] =3D 0;
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index a0b87001da..dcf2fcd108 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -1042,8 +1042,7 @@ static const TypeInfo xive_source_info =3D {
=20
 void xive_end_queue_pic_print_info(XiveEND *end, uint32_t width, Monitor=
 *mon)
 {
-    uint64_t qaddr_base =3D (uint64_t) be32_to_cpu(end->w2 & 0x0fffffff)=
 << 32
-        | be32_to_cpu(end->w3);
+    uint64_t qaddr_base =3D xive_end_qaddr(end);
     uint32_t qsize =3D xive_get_field32(END_W0_QSIZE, end->w0);
     uint32_t qindex =3D xive_get_field32(END_W1_PAGE_OFF, end->w1);
     uint32_t qentries =3D 1 << (qsize + 10);
@@ -1072,8 +1071,7 @@ void xive_end_queue_pic_print_info(XiveEND *end, ui=
nt32_t width, Monitor *mon)
=20
 void xive_end_pic_print_info(XiveEND *end, uint32_t end_idx, Monitor *mo=
n)
 {
-    uint64_t qaddr_base =3D (uint64_t) be32_to_cpu(end->w2 & 0x0fffffff)=
 << 32
-        | be32_to_cpu(end->w3);
+    uint64_t qaddr_base =3D xive_end_qaddr(end);
     uint32_t qindex =3D xive_get_field32(END_W1_PAGE_OFF, end->w1);
     uint32_t qgen =3D xive_get_field32(END_W1_GENERATION, end->w1);
     uint32_t qsize =3D xive_get_field32(END_W0_QSIZE, end->w0);
@@ -1101,8 +1099,7 @@ void xive_end_pic_print_info(XiveEND *end, uint32_t=
 end_idx, Monitor *mon)
=20
 static void xive_end_enqueue(XiveEND *end, uint32_t data)
 {
-    uint64_t qaddr_base =3D (uint64_t) be32_to_cpu(end->w2 & 0x0fffffff)=
 << 32
-        | be32_to_cpu(end->w3);
+    uint64_t qaddr_base =3D xive_end_qaddr(end);
     uint32_t qsize =3D xive_get_field32(END_W0_QSIZE, end->w0);
     uint32_t qindex =3D xive_get_field32(END_W1_PAGE_OFF, end->w1);
     uint32_t qgen =3D xive_get_field32(END_W1_GENERATION, end->w1);
diff --git a/include/hw/ppc/xive_regs.h b/include/hw/ppc/xive_regs.h
index bf36678a24..1a8c5b5e64 100644
--- a/include/hw/ppc/xive_regs.h
+++ b/include/hw/ppc/xive_regs.h
@@ -208,6 +208,12 @@ typedef struct XiveEND {
 #define xive_end_is_backlog(end)  (be32_to_cpu((end)->w0) & END_W0_BACKL=
OG)
 #define xive_end_is_escalate(end) (be32_to_cpu((end)->w0) & END_W0_ESCAL=
ATE_CTL)
=20
+static inline uint64_t xive_end_qaddr(XiveEND *end)
+{
+    return ((uint64_t) be32_to_cpu(end->w2) & 0x0fffffff) << 32 |
+        be32_to_cpu(end->w3);
+}
+
 /* Notification Virtual Target (NVT) */
 typedef struct XiveNVT {
         uint32_t        w0;
--=20
2.21.0


