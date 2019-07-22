Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93770155
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:43:01 +0200 (CEST)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYai-0005kD-Qr
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54730)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hpYZF-0007r5-7e
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hpYZE-0005IG-1J
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hpYZD-0005HK-PB; Mon, 22 Jul 2019 09:41:27 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D3BF430917F1;
 Mon, 22 Jul 2019 13:41:26 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-75.ams2.redhat.com [10.36.116.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 544BC1001B14;
 Mon, 22 Jul 2019 13:41:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 15:41:06 +0200
Message-Id: <20190722134108.22151-5-david@redhat.com>
In-Reply-To: <20190722134108.22151-1-david@redhat.com>
References: <20190722134108.22151-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 22 Jul 2019 13:41:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v3 4/6] virtio-balloon: Better names
 for offset variables in inflate/deflate code
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

"host_page_base" is really confusing, let's make this clearer, also
rename the other offsets to indicate to which base they apply.

offset -> mr_offset
ram_offset -> rb_offset
host_page_base -> rb_aligned_offset

While at it, use QEMU_ALIGN_DOWN() instead of a handcrafted computation
and move the computation to the place where it is needed.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 04a7e6c772..f206cc8bf7 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -41,24 +41,23 @@ struct PartiallyBalloonedPage {
 };
=20
 static void balloon_inflate_page(VirtIOBalloon *balloon,
-                                 MemoryRegion *mr, hwaddr offset)
+                                 MemoryRegion *mr, hwaddr mr_offset)
 {
-    void *addr =3D memory_region_get_ram_ptr(mr) + offset;
+    void *addr =3D memory_region_get_ram_ptr(mr) + mr_offset;
+    ram_addr_t rb_offset, rb_aligned_offset;
     RAMBlock *rb;
     size_t rb_page_size;
     int subpages;
-    ram_addr_t ram_offset, host_page_base;
=20
     /* XXX is there a better way to get to the RAMBlock than via a
      * host address? */
-    rb =3D qemu_ram_block_from_host(addr, false, &ram_offset);
+    rb =3D qemu_ram_block_from_host(addr, false, &rb_offset);
     rb_page_size =3D qemu_ram_pagesize(rb);
-    host_page_base =3D ram_offset & ~(rb_page_size - 1);
=20
     if (rb_page_size =3D=3D BALLOON_PAGE_SIZE) {
         /* Easy case */
=20
-        ram_block_discard_range(rb, ram_offset, rb_page_size);
+        ram_block_discard_range(rb, rb_offset, rb_page_size);
         /* We ignore errors from ram_block_discard_range(), because it
          * has already reported them, and failing to discard a balloon
          * page is not fatal */
@@ -74,11 +73,12 @@ static void balloon_inflate_page(VirtIOBalloon *ballo=
on,
     warn_report_once(
 "Balloon used with backing page size > 4kiB, this may not be reliable");
=20
+    rb_aligned_offset =3D QEMU_ALIGN_DOWN(rb_offset, rb_page_size);
     subpages =3D rb_page_size / BALLOON_PAGE_SIZE;
=20
     if (balloon->pbp
         && (rb !=3D balloon->pbp->rb
-            || host_page_base !=3D balloon->pbp->base)) {
+            || rb_aligned_offset !=3D balloon->pbp->base)) {
         /* We've partially ballooned part of a host page, but now
          * we're trying to balloon part of a different one.  Too hard,
          * give up on the old partial page */
@@ -91,10 +91,10 @@ static void balloon_inflate_page(VirtIOBalloon *ballo=
on,
         size_t bitlen =3D BITS_TO_LONGS(subpages) * sizeof(unsigned long=
);
         balloon->pbp =3D g_malloc0(sizeof(PartiallyBalloonedPage) + bitl=
en);
         balloon->pbp->rb =3D rb;
-        balloon->pbp->base =3D host_page_base;
+        balloon->pbp->base =3D rb_aligned_offset;
     }
=20
-    set_bit((ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
+    set_bit((rb_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
             balloon->pbp->bitmap);
=20
     if (bitmap_full(balloon->pbp->bitmap, subpages)) {
@@ -112,18 +112,18 @@ static void balloon_inflate_page(VirtIOBalloon *bal=
loon,
 }
=20
 static void balloon_deflate_page(VirtIOBalloon *balloon,
-                                 MemoryRegion *mr, hwaddr offset)
+                                 MemoryRegion *mr, hwaddr mr_offset)
 {
-    void *addr =3D memory_region_get_ram_ptr(mr) + offset;
+    void *addr =3D memory_region_get_ram_ptr(mr) + mr_offset;
+    ram_addr_t rb_offset;
     RAMBlock *rb;
     size_t rb_page_size;
-    ram_addr_t ram_offset;
     void *host_addr;
     int ret;
=20
     /* XXX is there a better way to get to the RAMBlock than via a
      * host address? */
-    rb =3D qemu_ram_block_from_host(addr, false, &ram_offset);
+    rb =3D qemu_ram_block_from_host(addr, false, &rb_offset);
     rb_page_size =3D qemu_ram_pagesize(rb);
=20
     if (balloon->pbp) {
--=20
2.21.0


