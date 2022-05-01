Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3B51648F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 15:19:46 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl9UH-0003I9-Aw
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 09:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0009df31cb51cb2be681f4eebd58a9776d75a580@lizzy.crudebyte.com>)
 id 1nl9SH-00010w-S6
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:17:42 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0009df31cb51cb2be681f4eebd58a9776d75a580@lizzy.crudebyte.com>)
 id 1nl9SA-0005Gp-3i
 for qemu-devel@nongnu.org; Sun, 01 May 2022 09:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=hytBxthYet9DFawcgXKMYZNCCM1++ItNvinKuyVuDJ0=; b=KaoDY
 sWnTwx0JATiXmUpmP/zRmYkuuMuJudZfVcGqI35zcznYUjpb0MODaZ8mhQWaPG0yK3Xf96yNc8BxB
 zav/m1WRY/jRnwUcrnDWXoWq5Zmp6QGt0H0+kSCBCX7/C8fv2JdipYu0nxFTA+9jlSBh7t6Pgc/Ri
 sZGREum4CdBctG+UMahYTSsg5CZ3nVFczjYS6KMrcTM1vCvcD8KFTsxxej0SnlUZaAUWHVLjasHR3
 BzpulJf0UFZ5nQE7PleraaSyzNrjKSb2wgkUYc/ChxCXYLCYR4D23kx71K2dsNiEIQH+g2615yXyf
 nImhVHcKDjpiivmusAHFt8IWNr9Hw==;
Message-Id: <0009df31cb51cb2be681f4eebd58a9776d75a580.1651410615.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1651410615.git.qemu_oss@crudebyte.com>
References: <cover.1651410615.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 01 May 2022 15:10:16 +0200
Subject: [PULL v2 1/7] 9pfs: fix inode sequencing in 'synth' driver
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0009df31cb51cb2be681f4eebd58a9776d75a580@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1nTpyU-0000yR-9o@lizzy.crudebyte.com>
---
 hw/9pfs/9p-synth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index d99d263985..1c5813e4dd 100644
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
     node = g_new0(V9fsSynthNode, 1);
     node->attr         = &node->actual_attr;
-    node->attr->inode  = synth_node_count++;
+    node->attr->inode  = ++synth_node_count;
     node->attr->nlink  = 1;
     node->attr->read   = read;
     node->attr->write  = write;
-- 
2.30.2


