Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46570150
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:42:31 +0200 (CEST)
Received: from localhost ([::1]:33746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpYaE-0002vq-F6
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54687)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david@redhat.com>) id 1hpYZD-0007kn-R2
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1hpYZC-0005Gi-0g
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:41:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1hpYZB-0005G2-RD; Mon, 22 Jul 2019 09:41:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E08785363;
 Mon, 22 Jul 2019 13:41:25 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-75.ams2.redhat.com [10.36.116.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8231B1001B12;
 Mon, 22 Jul 2019 13:41:23 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 15:41:05 +0200
Message-Id: <20190722134108.22151-4-david@redhat.com>
In-Reply-To: <20190722134108.22151-1-david@redhat.com>
References: <20190722134108.22151-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 22 Jul 2019 13:41:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v3 3/6] virtio-balloon: Simplify
 deflate with pbp
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

Let's simplify this - the case we are optimizing for is very hard to
trigger and not worth the effort. If we're switching from inflation to
deflation, let's reset the pbp.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index a78d2d2184..04a7e6c772 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -117,7 +117,7 @@ static void balloon_deflate_page(VirtIOBalloon *ballo=
on,
     void *addr =3D memory_region_get_ram_ptr(mr) + offset;
     RAMBlock *rb;
     size_t rb_page_size;
-    ram_addr_t ram_offset, host_page_base;
+    ram_addr_t ram_offset;
     void *host_addr;
     int ret;
=20
@@ -125,27 +125,11 @@ static void balloon_deflate_page(VirtIOBalloon *bal=
loon,
      * host address? */
     rb =3D qemu_ram_block_from_host(addr, false, &ram_offset);
     rb_page_size =3D qemu_ram_pagesize(rb);
-    host_page_base =3D ram_offset & ~(rb_page_size - 1);
-
-    if (balloon->pbp
-        && rb =3D=3D balloon->pbp->rb
-        && host_page_base =3D=3D balloon->pbp->base) {
-        int subpages =3D rb_page_size / BALLOON_PAGE_SIZE;
=20
-        /*
-         * This means the guest has asked to discard some of the 4kiB
-         * subpages of a host page, but then changed its mind and
-         * asked to keep them after all.  It's exceedingly unlikely
-         * for a guest to do this in practice, but handle it anyway,
-         * since getting it wrong could mean discarding memory the
-         * guest is still using. */
-        clear_bit((ram_offset - balloon->pbp->base) / BALLOON_PAGE_SIZE,
-                  balloon->pbp->bitmap);
-
-        if (bitmap_empty(balloon->pbp->bitmap, subpages)) {
-            g_free(balloon->pbp);
-            balloon->pbp =3D NULL;
-        }
+    if (balloon->pbp) {
+        /* Let's play safe and always reset the pbp on deflation request=
s. */
+        g_free(balloon->pbp);
+        balloon->pbp =3D NULL;
     }
=20
     host_addr =3D (void *)((uintptr_t)addr & ~(rb_page_size - 1));
--=20
2.21.0


