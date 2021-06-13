Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03773A5901
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 16:20:05 +0200 (CEST)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsQy4-0001tp-OW
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 10:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elish.jiang@ucloud.cn>)
 id 1lsMiN-00028Z-Vg; Sun, 13 Jun 2021 05:47:35 -0400
Received: from mail-m2839.qiye.163.com ([103.74.28.39]:28926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elish.jiang@ucloud.cn>)
 id 1lsMiJ-0000Mq-Ti; Sun, 13 Jun 2021 05:47:34 -0400
Received: from localhost.localdomain (unknown [106.75.220.3])
 by mail-m2839.qiye.163.com (Hmail) with ESMTPA id C4B7EC00AF;
 Sun, 13 Jun 2021 17:38:21 +0800 (CST)
From: Zhiwei Jiang <elish.jiang@ucloud.cn>
To: kwolf@redhat.com, mreitz@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] block: fix build waring
Date: Sun, 13 Jun 2021 17:38:21 +0800
Message-Id: <20210613093821.774562-1-elish.jiang@ucloud.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSUI3V1ktWUFJV1kPCR
 oVCBIfWUFZGR4aHVZJSU5CTU5ITkoaHx5VGRETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRA6KDo6Cz00ARE#IR8LEz0i
 ETAKC1FVSlVKTUlITkxMSktJSkpKVTMWGhIXVR4XEggTVRESGhUcOw4YFxQOH1UYFUVZV1kSC1lB
 WUpLTVVMTlVJSUtVSFlXWQgBWUFKTU1ONwY+
X-HM-Tid: 0a7a04bc86668421kuqwc4b7ec00af
Received-SPF: pass client-ip=103.74.28.39; envelope-from=elish.jiang@ucloud.cn;
 helo=mail-m2839.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 13 Jun 2021 10:13:03 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

when i compile this file with some error message
../block.c: In function ‘bdrv_replace_node_common’:
../block.c:4903:9: error: ‘to_cow_parent’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
         bdrv_remove_filter_or_cow_child(to_cow_parent, tran);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Signed-off-by: Zhiwei Jiang <elish.jiang@ucloud.cn>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 3f456892d0..08f29e6b65 100644
--- a/block.c
+++ b/block.c
@@ -4866,7 +4866,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     Transaction *tran = tran_new();
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
-    BlockDriverState *to_cow_parent;
+    BlockDriverState *to_cow_parent = NULL;
     int ret;
 
     if (detach_subchain) {
-- 
2.25.1


