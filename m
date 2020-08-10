Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1338E240455
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 11:56:44 +0200 (CEST)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k54Xr-0003GW-4P
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 05:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1k54Wy-0002MT-Ni; Mon, 10 Aug 2020 05:55:48 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:34032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1k54Wv-0003yj-HM; Mon, 10 Aug 2020 05:55:48 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C7F9544574;
 Mon, 10 Aug 2020 11:55:30 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.1 v2 1/2] block/block-copy: always align copied region
 to cluster size
Date: Mon, 10 Aug 2020 11:55:22 +0200
Message-Id: <20200810095523.15071-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 05:55:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 42ac214406e0 (block/block-copy: refactor task creation)
block_copy_task_create calculates the area to be copied via
bdrv_dirty_bitmap_next_dirty_area, but that can return an unaligned byte
count if the image's last cluster end is not aligned to the bitmap's
granularity.

Always ALIGN_UP the resulting bytes value to satisfy block_copy_do_copy,
which requires the 'bytes' parameter to be aligned to cluster size.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

I've now marked it for-5.1 since it is just a fix, but it's probably okay if
done later as well.

v2:
* add assert on offset alignment
* remove 'backing image' wording from commit
* collect R-b

 block/block-copy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/block-copy.c b/block/block-copy.c
index f7428a7c08..a30b9097ef 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -142,6 +142,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         return NULL;
     }
 
+    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
+    bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
+
     /* region is dirty, so no existent tasks possible in it */
     assert(!find_conflicting_task(s, offset, bytes));
 
-- 
2.20.1



