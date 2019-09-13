Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3EB1E1A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 15:03:35 +0200 (CEST)
Received: from localhost ([::1]:43652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8lEc-0000mK-Fh
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 09:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i8lAb-00070E-AJ
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 08:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i8lAZ-0001pZ-Pb
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 08:59:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34022)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i8lAW-0001lD-Nh; Fri, 13 Sep 2019 08:59:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC58C18C4260;
 Fri, 13 Sep 2019 12:59:19 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A6EA51C60;
 Fri, 13 Sep 2019 12:59:17 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Sep 2019 15:59:08 +0300
Message-Id: <20190913125909.15348-3-mlevitsk@redhat.com>
In-Reply-To: <20190913125909.15348-1-mlevitsk@redhat.com>
References: <20190913125909.15348-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 13 Sep 2019 12:59:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 2/3] block/qcow2: fix the corruption when
 rebasing luks encrypted files
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes subtle corruption introduced by luks threaded encryption
in commit 8ac0f15f335

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1745922

The corruption happens when we do a write that
   * writes to two or more unallocated clusters at once
   * doesn't fully cover the first sector
   * doesn't fully cover the last sector

In this case, when allocating the new clusters we COW both areas
prior to the write and after the write, and we encrypt them.

The above mentioned commit accidentally made it so we encrypt the
second COW area using the physical cluster offset of the first area.

Fix this by:
 * Remove the offset_in_cluster parameter of do_perform_cow_encrypt,
   since it is misleading. That offset can be larger than cluster size
   currently.

   Instead just add the start and the end COW area offsets to both host
   and guest offsets that do_perform_cow_encrypt receives.

*  in do_perform_cow_encrypt, remove the cluster offset from the host_offset,
   and thus pass correctly to the qcow2_co_encrypt, the host cluster offset
   and full guest offset

In the bugreport that was triggered by rebasing a luks image to new,
zero filled base, which lot of such writes, and causes some files
with zero areas to contain garbage there instead.
But as described above it can happen elsewhere as well


Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-cluster.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 46b0854d7e..47ec3511a5 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -463,21 +463,21 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
 }
 
 static bool coroutine_fn do_perform_cow_encrypt(BlockDriverState *bs,
-                                                uint64_t guest_cluster_offset,
-                                                uint64_t host_cluster_offset,
-                                                unsigned offset_in_cluster,
+                                                uint64_t guest_offset,
+                                                uint64_t host_offset,
                                                 uint8_t *buffer,
                                                 unsigned bytes)
 {
     if (bytes && bs->encrypted) {
         BDRVQcow2State *s = bs->opaque;
-        assert((offset_in_cluster & ~BDRV_SECTOR_MASK) == 0);
-        assert((bytes & ~BDRV_SECTOR_MASK) == 0);
+
+        assert(QEMU_IS_ALIGNED(guest_offset, BDRV_SECTOR_SIZE));
+        assert(QEMU_IS_ALIGNED(host_offset, BDRV_SECTOR_SIZE));
+        assert(QEMU_IS_ALIGNED(bytes, BDRV_SECTOR_SIZE));
         assert(s->crypto);
-        if (qcow2_co_encrypt(bs,
-                             host_cluster_offset + offset_in_cluster,
-                             guest_cluster_offset + offset_in_cluster,
-                             buffer, bytes) < 0) {
+
+        if (qcow2_co_encrypt(bs, host_offset, guest_offset,
+            buffer, bytes) < 0) {
             return false;
         }
     }
@@ -891,11 +891,15 @@ static int perform_cow(BlockDriverState *bs, QCowL2Meta *m)
 
     /* Encrypt the data if necessary before writing it */
     if (bs->encrypted) {
-        if (!do_perform_cow_encrypt(bs, m->offset, m->alloc_offset,
-                                    start->offset, start_buffer,
+        if (!do_perform_cow_encrypt(bs,
+                                    m->offset + start->offset,
+                                    m->alloc_offset + start->offset,
+                                    start_buffer,
                                     start->nb_bytes) ||
-            !do_perform_cow_encrypt(bs, m->offset, m->alloc_offset,
-                                    end->offset, end_buffer, end->nb_bytes)) {
+            !do_perform_cow_encrypt(bs,
+                                    m->offset + end->offset,
+                                    m->alloc_offset + end->offset,
+                                    end_buffer, end->nb_bytes)) {
             ret = -EIO;
             goto fail;
         }
-- 
2.17.2


