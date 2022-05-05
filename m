Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F551BBB8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 11:17:04 +0200 (CEST)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXbb-0001uk-Vg
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 05:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nmWtl-0008Nh-FJ; Thu, 05 May 2022 04:31:48 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:17508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nmWti-0002ms-Bk; Thu, 05 May 2022 04:31:43 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3583C43179;
 Thu,  5 May 2022 10:31:31 +0200 (CEST)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 integration@gluster.org, qemu-stable@nongnu.org, vsementsov@virtuozzo.com
Subject: [PATCH] block/gluster: correctly set max_pdiscard which is int64_t
Date: Thu,  5 May 2022 10:31:24 +0200
Message-Id: <20220505083124.163404-1-f.ebner@proxmox.com>
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

Previously, max_pdiscard would be zero in the following assertion:
qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
`max_pdiscard >= bs->bl.request_alignment' failed.

Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
Cc: qemu-stable@nongnu.org
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---
 block/gluster.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/gluster.c b/block/gluster.c
index 398976bc66..592e71b22a 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -891,7 +891,7 @@ out:
 static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
 {
     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
-    bs->bl.max_pdiscard = SIZE_MAX;
+    bs->bl.max_pdiscard = INT64_MAX;
 }
 
 static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
@@ -1304,7 +1304,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
     GlusterAIOCB acb;
     BDRVGlusterState *s = bs->opaque;
 
-    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
+    assert(bytes <= INT64_MAX); /* rely on max_pdiscard */
 
     acb.size = 0;
     acb.ret = 0;
-- 
2.30.2



