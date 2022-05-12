Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F03524A7A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:39:49 +0200 (CEST)
Received: from localhost ([::1]:44718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np6EW-0000Hv-Kt
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1np66A-0001w3-Tn; Thu, 12 May 2022 06:31:11 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:62016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1np668-0001BP-DQ; Thu, 12 May 2022 06:31:10 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 15F3443487;
 Thu, 12 May 2022 12:30:56 +0200 (CEST)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 integration@gluster.org, qemu-stable@nongnu.org, eblake@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v2] block/gluster: correctly set max_pdiscard
Date: Thu, 12 May 2022 12:30:48 +0200
Message-Id: <20220512103048.214100-1-f.ebner@proxmox.com>
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

On 64-bit platforms, SIZE_MAX is too large for max_pdiscard, which is
int64_t, and the following assertion would be triggered:
qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
`max_pdiscard >= bs->bl.request_alignment' failed.

Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---
 block/gluster.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index 398976bc66..f711bf0bd6 100644
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
@@ -1304,7 +1304,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;
 
-    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
+    assert(bytes <= MIN(SIZE_MAX, INT64_MAX)); /* rely on max_pdiscard */
 
     acb.size = 0;
     acb.ret = 0;
-- 
2.30.2



