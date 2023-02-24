Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E406A1DCF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:51:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNX-0007j9-Tu; Fri, 24 Feb 2023 09:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNU-0007gO-Jw; Fri, 24 Feb 2023 09:48:52 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNS-0002sy-TE; Fri, 24 Feb 2023 09:48:52 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9AFBE48528;
 Fri, 24 Feb 2023 15:48:36 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 9/9] mirror: return the total number of bytes sent upon query
Date: Fri, 24 Feb 2023 15:48:25 +0100
Message-Id: <20230224144825.466375-10-f.ebner@proxmox.com>
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

While the same information is already there, as the job-agnostic
@offset, it's not clear to users what the value means for mirror: it's
documentet to be relative to @len only and @len is documented to be
able to change in both directions while the job runs.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 block/mirror.c       | 6 ++++++
 qapi/block-core.json | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index ac83309b82..e7b4905b70 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -86,6 +86,9 @@ typedef struct MirrorBlockJob {
     int64_t active_write_bytes_in_flight;
     bool prepared;
     bool in_drain;
+
+    /* Additional information intended for users (returned in mirror_query) */
+    int64_t data_sent;
 } MirrorBlockJob;
 
 typedef struct MirrorBDSOpaque {
@@ -215,6 +218,7 @@ static void coroutine_fn mirror_iteration_done(MirrorOp *op, int ret)
         }
         if (!s->initial_zeroing_ongoing) {
             job_progress_update(&s->common.job, op->bytes);
+            s->data_sent += op->bytes;
         }
     }
     qemu_iovec_destroy(&op->qiov);
@@ -1259,6 +1263,7 @@ static void mirror_query(BlockJob *job, BlockJobInfo *info)
 
     info->u.mirror = (BlockJobInfoMirror) {
         .actively_synced = s->actively_synced,
+        .data_sent       = s->data_sent,
         .remaining_dirty = bdrv_get_dirty_count(s->dirty_bitmap),
     };
 }
@@ -1384,6 +1389,7 @@ do_sync_target_write(MirrorBlockJob *job, MirrorMethod method,
     job->active_write_bytes_in_flight -= bytes;
     if (ret >= 0) {
         job_progress_update(&job->common.job, bytes);
+        job->data_sent += bytes;
     } else {
         BlockErrorAction action;
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 91594eace4..656be5ce2e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1308,12 +1308,15 @@
 # @actively-synced: Whether the source is actively synced to the target, i.e.
 #                   same data and new writes are done synchronously to both.
 #
+# @data-sent: How much data was sent in total until now.
+#
 # @remaining-dirty: How much of the source is dirty relative to the target.
 #
 # Since 8.0
 ##
 { 'struct': 'BlockJobInfoMirror',
-  'data': { 'actively-synced': 'bool', 'remaining-dirty': 'int64' } }
+  'data': { 'actively-synced': 'bool', 'data-sent': 'int64',
+            'remaining-dirty': 'int64' } }
 
 ##
 # @BlockJobInfo:
-- 
2.30.2



