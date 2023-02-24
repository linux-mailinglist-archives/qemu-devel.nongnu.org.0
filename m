Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB6D6A1DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNX-0007iz-C5; Fri, 24 Feb 2023 09:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNU-0007fz-D6; Fri, 24 Feb 2023 09:48:52 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNR-0002rB-W2; Fri, 24 Feb 2023 09:48:52 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4EB0B4851F;
 Fri, 24 Feb 2023 15:48:36 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 8/9] mirror: return the remaining dirty bytes upon query
Date: Fri, 24 Feb 2023 15:48:24 +0100
Message-Id: <20230224144825.466375-9-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224144825.466375-1-f.ebner@proxmox.com>
References: <20230224144825.466375-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This can be used by management applications starting with a job in
background mode to determine when the switch to active mode should
happen.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 block/mirror.c       | 1 +
 qapi/block-core.json | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index 02b5bd8bd2..ac83309b82 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1259,6 +1259,7 @@ static void mirror_query(BlockJob *job, BlockJobInfo *info)
 
     info->u.mirror = (BlockJobInfoMirror) {
         .actively_synced = s->actively_synced,
+        .remaining_dirty = bdrv_get_dirty_count(s->dirty_bitmap),
     };
 }
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 07e0f30492..91594eace4 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1308,10 +1308,12 @@
 # @actively-synced: Whether the source is actively synced to the target, i.e.
 #                   same data and new writes are done synchronously to both.
 #
+# @remaining-dirty: How much of the source is dirty relative to the target.
+#
 # Since 8.0
 ##
 { 'struct': 'BlockJobInfoMirror',
-  'data': { 'actively-synced': 'bool' } }
+  'data': { 'actively-synced': 'bool', 'remaining-dirty': 'int64' } }
 
 ##
 # @BlockJobInfo:
-- 
2.30.2



