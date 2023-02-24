Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D96A1DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNY-0007jE-1C; Fri, 24 Feb 2023 09:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNU-0007gA-IE; Fri, 24 Feb 2023 09:48:52 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNS-0002rA-01; Fri, 24 Feb 2023 09:48:52 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 65D1E48526;
 Fri, 24 Feb 2023 15:48:36 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 7/9] mirror: return mirror-specific information upon query
Date: Fri, 24 Feb 2023 15:48:23 +0100
Message-Id: <20230224144825.466375-8-f.ebner@proxmox.com>
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

To start out, only actively-synced is returned.

For example, this is useful for jobs that started out in background
mode and switched to active mode. Once actively-synced is true, it's
clear that the mode switch has been completed. Note that completion of
the switch might happen much earlier, e.g. if the switch happens
before the job is ready, once all background operations have finished.
It's assumed that whether the disks are actively-synced or not is more
interesting than whether the mode switch completed. That information
can still be added if required in the future.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 block/mirror.c       | 10 ++++++++++
 qapi/block-core.json | 15 ++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/block/mirror.c b/block/mirror.c
index 961aaa5cd6..02b5bd8bd2 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1253,6 +1253,15 @@ static void mirror_change(BlockJob *job, BlockJobChangeOptions *opts,
     s->in_drain = false;
 }
 
+static void mirror_query(BlockJob *job, BlockJobInfo *info)
+{
+    MirrorBlockJob *s = container_of(job, MirrorBlockJob, common);
+
+    info->u.mirror = (BlockJobInfoMirror) {
+        .actively_synced = s->actively_synced,
+    };
+}
+
 static const BlockJobDriver mirror_job_driver = {
     .job_driver = {
         .instance_size          = sizeof(MirrorBlockJob),
@@ -1268,6 +1277,7 @@ static const BlockJobDriver mirror_job_driver = {
     },
     .drained_poll           = mirror_drained_poll,
     .change                 = mirror_change,
+    .query                  = mirror_query,
 };
 
 static const BlockJobDriver commit_active_job_driver = {
diff --git a/qapi/block-core.json b/qapi/block-core.json
index adb43a4592..07e0f30492 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1300,6 +1300,19 @@
 { 'enum': 'MirrorCopyMode',
   'data': ['background', 'write-blocking'] }
 
+##
+# @BlockJobInfoMirror:
+#
+# Information specific to mirror block jobs.
+#
+# @actively-synced: Whether the source is actively synced to the target, i.e.
+#                   same data and new writes are done synchronously to both.
+#
+# Since 8.0
+##
+{ 'struct': 'BlockJobInfoMirror',
+  'data': { 'actively-synced': 'bool' } }
+
 ##
 # @BlockJobInfo:
 #
@@ -1350,7 +1363,7 @@
            'auto-finalize': 'bool', 'auto-dismiss': 'bool',
            '*error': 'str' },
   'discriminator': 'type',
-  'data': {} }
+  'data': { 'mirror': 'BlockJobInfoMirror' } }
 
 ##
 # @query-block-jobs:
-- 
2.30.2



