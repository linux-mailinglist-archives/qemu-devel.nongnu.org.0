Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4126A1DCE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:51:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZNT-0007eN-Mv; Fri, 24 Feb 2023 09:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNQ-0007bk-JB; Fri, 24 Feb 2023 09:48:48 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pVZNO-0002pH-Dk; Fri, 24 Feb 2023 09:48:48 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C20D14852A;
 Fri, 24 Feb 2023 15:48:35 +0100 (CET)
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@yandex-team.ru,
 jsnow@redhat.com, den@virtuozzo.com, t.lamprecht@proxmox.com,
 alexander.ivanov@virtuozzo.com
Subject: [PATCH 4/9] qapi/block-core: use JobType for BlockJobInfo's type
Date: Fri, 24 Feb 2023 15:48:20 +0100
Message-Id: <20230224144825.466375-5-f.ebner@proxmox.com>
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

In preparation to turn BlockJobInfo into a union with @type as the
discriminator. That requires it to be an enum.

No functional change is intended.

Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
---
 block/monitor/block-hmp-cmds.c | 4 ++--
 blockjob.c                     | 2 +-
 qapi/block-core.json           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 6aa5f1be0c..76e3254e93 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -840,7 +840,7 @@ void hmp_info_block_jobs(Monitor *mon, const QDict *qdict)
     }
 
     while (list) {
-        if (strcmp(list->value->type, "stream") == 0) {
+        if (list->value->type == JOB_TYPE_STREAM) {
             monitor_printf(mon, "Streaming device %s: Completed %" PRId64
                            " of %" PRId64 " bytes, speed limit %" PRId64
                            " bytes/s\n",
@@ -852,7 +852,7 @@ void hmp_info_block_jobs(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "Type %s, device %s: Completed %" PRId64
                            " of %" PRId64 " bytes, speed limit %" PRId64
                            " bytes/s\n",
-                           list->value->type,
+                           JobType_str(list->value->type),
                            list->value->device,
                            list->value->offset,
                            list->value->len,
diff --git a/blockjob.c b/blockjob.c
index b933d1c631..9bd51bc6ae 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -361,7 +361,7 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
                           &progress_total);
 
     info = g_new0(BlockJobInfo, 1);
-    info->type      = g_strdup(job_type_str(&job->job));
+    info->type      = job_type(&job->job);
     info->device    = g_strdup(job->job.id);
     info->busy      = job->job.busy;
     info->paused    = job->job.pause_count > 0;
diff --git a/qapi/block-core.json b/qapi/block-core.json
index f9f464b25a..c1ac6de238 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1343,7 +1343,7 @@
 # Since: 1.1
 ##
 { 'struct': 'BlockJobInfo',
-  'data': {'type': 'str', 'device': 'str', 'len': 'int',
+  'data': {'type': 'JobType', 'device': 'str', 'len': 'int',
            'offset': 'int', 'busy': 'bool', 'paused': 'bool', 'speed': 'int',
            'io-status': 'BlockDeviceIoStatus', 'ready': 'bool',
            'status': 'JobStatus',
-- 
2.30.2



