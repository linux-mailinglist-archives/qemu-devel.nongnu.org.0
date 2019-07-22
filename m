Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9D7014A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:42:20 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYa3-0001xs-91
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hpYZJ-00087I-4k
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hpYZH-0005Lx-UG
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hpYZH-0005LT-Mk; Mon, 22 Jul 2019 09:41:31 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 026884ACDF;
 Mon, 22 Jul 2019 13:41:31 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-75.ams2.redhat.com [10.36.116.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 280D9101E240;
 Mon, 22 Jul 2019 13:41:27 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 15:41:07 +0200
Message-Id: <20190722134108.22151-6-david@redhat.com>
In-Reply-To: <20190722134108.22151-1-david@redhat.com>
References: <20190722134108.22151-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 22 Jul 2019 13:41:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v3 5/6] virtio-balloon: Rework pbp
 tracking data
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-stable@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the address of a RAMBlock to test for a matching pbp is not really
safe. Instead, let's use the guest physical address of the base page
along with the page size (via the number of subpages).

Also, let's allocate the bitmap separately. This makes the code
easier to read and maintain - we can reuse bitmap_new().

Prepare the code to move the PBP out of the device.

Fixes: ed48c59875b6 ("virtio-balloon: Safely handle BALLOON_PAGE_SIZE <
                     host page size")
Fixes: b27b32391404 ("virtio-balloon: Fix possible guest memory corruptio=
n
                     with inflates & deflates")
Cc: qemu-stable@nongnu.org #v4.0.0
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 69 +++++++++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index f206cc8bf7..40d493a31a 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -35,16 +35,44 @@
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
=20
 struct PartiallyBalloonedPage {
-    RAMBlock *rb;
-    ram_addr_t base;
-    unsigned long bitmap[];
+    ram_addr_t base_gpa;
+    long subpages;
+    unsigned long *bitmap;
 };
=20
+static void virtio_balloon_pbp_free(PartiallyBalloonedPage *pbp)
+{
+    if (!pbp) {
+        return;
+    }
+    g_free(pbp->bitmap);
+    g_free(pbp);
+}
+
+static PartiallyBalloonedPage *virtio_balloon_pbp_alloc(ram_addr_t base_=
gpa,
+                                                        long subpages)
+{
+    PartiallyBalloonedPage *pbp =3D g_new0(PartiallyBalloonedPage, 1);
+
+    pbp->base_gpa =3D base_gpa;
+    pbp->subpages =3D subpages;
+    pbp->bitmap =3D bitmap_new(subpages);
+
+    return pbp;
+}
+
+static bool virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
+                                       ram_addr_t base_gpa, long subpage=
s)
+{
+    return pbp->subpages =3D=3D subpages && pbp->base_gpa =3D=3D base_gp=
a;
+}
+
 static void balloon_inflate_page(VirtIOBalloon *balloon,
                                  MemoryRegion *mr, hwaddr mr_offset)
 {
     void *addr =3D memory_region_get_ram_ptr(mr) + mr_offset;
-    ram_addr_t rb_offset, rb_aligned_offset;
+    ram_addr_t rb_offset, rb_aligned_offset, base_gpa;
+    PartiallyBalloonedPage **pbp =3D &balloon->pbp;
     RAMBlock *rb;
     size_t rb_page_size;
     int subpages;
@@ -75,39 +103,34 @@ static void balloon_inflate_page(VirtIOBalloon *ball=
oon,
=20
     rb_aligned_offset =3D QEMU_ALIGN_DOWN(rb_offset, rb_page_size);
     subpages =3D rb_page_size / BALLOON_PAGE_SIZE;
+    base_gpa =3D memory_region_get_ram_addr(mr) + mr_offset -
+               (rb_offset - rb_aligned_offset);
=20
-    if (balloon->pbp
-        && (rb !=3D balloon->pbp->rb
-            || rb_aligned_offset !=3D balloon->pbp->base)) {
+    if (*pbp && !virtio_balloon_pbp_matches(*pbp, base_gpa, subpages)) {
         /* We've partially ballooned part of a host page, but now
          * we're trying to balloon part of a different one.  Too hard,
          * give up on the old partial page */
-        g_free(balloon->pbp);
-        balloon->pbp =3D NULL;
+        virtio_balloon_pbp_free(*pbp);
+        *pbp =3D NULL;
     }
=20
-    if (!balloon->pbp) {
-        /* Starting on a new host page */
-        size_t bitlen =3D BITS_TO_LONGS(subpages) * sizeof(unsigned long=
);
-        balloon->pbp =3D g_malloc0(sizeof(PartiallyBalloonedPage) + bitl=
en);
-        balloon->pbp->rb =3D rb;
-        balloon->pbp->base =3D rb_aligned_offset;
+    if (!*pbp) {
+        *pbp =3D virtio_balloon_pbp_alloc(base_gpa, subpages);
     }
=20
-    set_bit((rb_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
-            balloon->pbp->bitmap);
+    set_bit((rb_offset - rb_aligned_offset) / BALLOON_PAGE_SIZE,
+            (*pbp)->bitmap);
=20
-    if (bitmap_full(balloon->pbp->bitmap, subpages)) {
+    if (bitmap_full((*pbp)->bitmap, subpages)) {
         /* We've accumulated a full host page, we can actually discard
          * it now */
=20
-        ram_block_discard_range(rb, balloon->pbp->base, rb_page_size);
+        ram_block_discard_range(rb, rb_aligned_offset, rb_page_size);
         /* We ignore errors from ram_block_discard_range(), because it
          * has already reported them, and failing to discard a balloon
          * page is not fatal */
-
-        g_free(balloon->pbp);
-        balloon->pbp =3D NULL;
+        virtio_balloon_pbp_free(*pbp);
+        *pbp =3D NULL;
     }
 }
=20
@@ -128,7 +151,7 @@ static void balloon_deflate_page(VirtIOBalloon *ballo=
on,
=20
     if (balloon->pbp) {
         /* Let's play safe and always reset the pbp on deflation request=
s. */
-        g_free(balloon->pbp);
+        virtio_balloon_pbp_free(balloon->pbp);
         balloon->pbp =3D NULL;
     }
=20
--=20
2.21.0


