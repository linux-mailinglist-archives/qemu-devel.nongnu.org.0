Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AC23DB08
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3gYd-0000dV-Ml
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 10:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1k3gXp-0008Lu-KJ; Thu, 06 Aug 2020 10:06:57 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:34966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1k3gXn-0006WA-1F; Thu, 06 Aug 2020 10:06:57 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 5B82543766;
 Thu,  6 Aug 2020 15:58:06 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/block-copy: always align copied region to cluster size
Date: Thu,  6 Aug 2020 15:57:40 +0200
Message-Id: <20200806135740.24420-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:58:06
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
count if the backing image's last cluster end is not aligned to the
bitmap's granularity.

Always ALIGN_UP the resulting bytes value to satisfy block_copy_do_copy,
which requires the 'bytes' parameter to be aligned to cluster size.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---

This causes backups with unaligned image sizes to fail on the last block in my
testing (e.g. a backup job with 4k cluster size fails on a drive with 4097
bytes).

Alternatively one could remove the
  assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
from block_copy_do_copy, but I'd wager that's there for a reason?

 block/block-copy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/block-copy.c b/block/block-copy.c
index f7428a7c08..023cb03200 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -142,6 +142,8 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         return NULL;
     }
 
+    bytes = QEMU_ALIGN_UP(bytes, s->cluster_size);
+
     /* region is dirty, so no existent tasks possible in it */
     assert(!find_conflicting_task(s, offset, bytes));
 
-- 
2.20.1



