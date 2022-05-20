Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04C52E6E3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 10:04:08 +0200 (CEST)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrxcF-00059g-9s
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 04:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nrxXy-00039M-5G; Fri, 20 May 2022 03:59:46 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:20345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nrxXv-000158-5U; Fri, 20 May 2022 03:59:40 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 812F442F61;
 Fri, 20 May 2022 09:59:26 +0200 (CEST)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 integration@gluster.org, qemu-stable@nongnu.org, eblake@redhat.com,
 vsementsov@virtuozzo.com, sgarzare@redhat.com
Subject: [PATCH v3] block/gluster: correctly set max_pdiscard
Date: Fri, 20 May 2022 09:59:22 +0200
Message-Id: <20220520075922.43972-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 64-bit platforms, assigning SIZE_MAX to the int64_t max_pdiscard
results in a negative value, and the following assertion would trigger
down the line (it's not the same max_pdiscard, but computed from the
other one):
qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
`max_pdiscard >= bs->bl.request_alignment' failed.

On 32-bit platforms, it's fine to keep using SIZE_MAX.

The assertion in qemu_gluster_co_pdiscard() is checking that the value
of 'bytes' can safely be passed to glfs_discard_async(), which takes a
size_t for the argument in question, so it is kept as is. And since
max_pdiscard is still <= SIZE_MAX, relying on max_pdiscard is still
fine.

Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---

v2 -> v3:
    * Keep assertion in qemu_gluster_co_pdiscard() as is.
    * Improve commit message.

v1 -> v2:
    * Use an expression that works for both 64-bit and 32-bit platforms.

 block/gluster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/gluster.c b/block/gluster.c
index 398976bc66..b60213ab80 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -891,7 +891,7 @@ out:
 static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
-    bs->bl.max_pdiscard = SIZE_MAX;
+    bs->bl.max_pdiscard = MIN(SIZE_MAX, INT64_MAX);
 }
 
 static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
-- 
2.30.2



