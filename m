Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C374A4D8C09
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:06:30 +0100 (CET)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTq1V-00017v-4B
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:06:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8053872006a4f18068bfb1825f21a108643f242e@lizzy.crudebyte.com>)
 id 1nTpzW-00008N-WA
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:04:27 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:56821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <8053872006a4f18068bfb1825f21a108643f242e@lizzy.crudebyte.com>)
 id 1nTpzV-0004ig-1s
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=M6ewKKtFxas3C9txmsGWiOoZhKeVCxeGfx7klVYpVMk=; b=P013M
 F6u2rwjyWyhc00yEW/vRzTiqKlgwfZDuys7EcVUyDd+16X7CATCQ41CAPd1u5AXU49TfQQEaimHTa
 UvT0RHFxTWkErAl1onZDEv+2wEekJ7+G1XZNowXB3/5BeMV2SOZhP6ongTzB7CgRlJN+ITfP7Rq+h
 FdcbUHhz5qOZ8nmF6eJGbcFvc65f8V5hVGjcbVjxMRzGhe69XYsx8Ge9IOe5/N1iz0xLMRQ7JpzBQ
 HDqraKF9w07IDUYUF3ikH2kBfvpTpn32a2mXhiIZ8TDdoFNaZuyjwjR4xK8rnQgbf2UEti0L9hyr6
 9QzrnQckGIpPaZ8FkDp8W8+owkqGQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 14 Mar 2022 19:58:11 +0100
Subject: [PATCH] 9pfs: fix inode sequencing in 'synth' driver
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Message-Id: <E1nTpyU-0000yR-9o@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=8053872006a4f18068bfb1825f21a108643f242e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The 'synth' driver's root node and the 'synth' driver's first
subdirectory node falsely share the same inode number (zero), which
makes it impossible for 9p clients (i.e. 9p test cases) to distinguish
root node and first subdirectory from each other by comparing their QIDs
(which are derived by 9p server from driver's inode numbers).

Fix this issue by using prefix-increment instead of postfix-increment
operator while generating new inode numbers for subdirectories and files.

Link: https://lore.kernel.org/qemu-devel/3859307.hTDP4D0zbi@silver/
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b3080e415b..f3c73d3b0b 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -92,7 +92,7 @@ int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
         }
     }
     /* Add the name */
-    node = v9fs_add_dir_node(parent, mode, name, NULL, synth_node_count++);
+    node = v9fs_add_dir_node(parent, mode, name, NULL, ++synth_node_count);
     v9fs_add_dir_node(node, parent->attr->mode, "..",
                       parent->attr, parent->attr->inode);
     v9fs_add_dir_node(node, node->attr->mode, ".",
@@ -130,7 +130,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
     mode = ((mode & 0777) | S_IFREG);
     node = g_malloc0(sizeof(V9fsSynthNode));
     node->attr         = &node->actual_attr;
-    node->attr->inode  = synth_node_count++;
+    node->attr->inode  = ++synth_node_count;
     node->attr->nlink  = 1;
     node->attr->read   = read;
     node->attr->write  = write;
-- 
2.30.2


