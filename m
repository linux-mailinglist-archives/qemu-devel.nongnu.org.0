Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FAA1D0D95
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 11:54:32 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYo5v-0003Wq-JE
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 05:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2i-0005yI-90; Wed, 13 May 2020 05:51:12 -0400
Received: from relay.sw.ru ([185.231.240.75]:54020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2f-0003ZH-53; Wed, 13 May 2020 05:51:11 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jYo2W-0001e4-AE; Wed, 13 May 2020 12:51:00 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 13/15] qapi: add filter-node-name to block-stream
Date: Wed, 13 May 2020 12:50:54 +0300
Message-Id: <1589363456-1035571-14-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589363456-1035571-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1589363456-1035571-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 05:51:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the possibility to pass the 'filter-node-name' parameter to the
block-stream job as it is done for the commit block job. That will be
needed for further iotests implementations.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/monitor/block-hmp-cmds.c | 4 ++--
 block/stream.c                 | 4 +++-
 blockdev.c                     | 8 +++++++-
 include/block/block_int.h      | 7 ++++++-
 qapi/block-core.json           | 6 ++++++
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 4c8c375..6f6636b 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -507,8 +507,8 @@ void hmp_block_stream(Monitor *mon, const QDict *qdict)
 
     qmp_block_stream(true, device, device, base != NULL, base, false, NULL,
                      false, NULL, qdict_haskey(qdict, "speed"), speed, true,
-                     BLOCKDEV_ON_ERROR_REPORT, false, false, false, false,
-                     &error);
+                     BLOCKDEV_ON_ERROR_REPORT, false, NULL, false, false, false,
+                     false, &error);
 
     hmp_handle_error(mon, error);
 }
diff --git a/block/stream.c b/block/stream.c
index 3cca1f9..e0b35f8 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -217,7 +217,9 @@ static const BlockJobDriver stream_job_driver = {
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
                   int creation_flags, int64_t speed,
-                  BlockdevOnError on_error, Error **errp)
+                  BlockdevOnError on_error,
+                  const char *filter_node_name,
+                  Error **errp)
 {
     StreamBlockJob *s;
     BlockDriverState *iter;
diff --git a/blockdev.c b/blockdev.c
index 97c2ba2..67918fc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2753,6 +2753,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_backing_file, const char *backing_file,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
+                      bool has_filter_node_name, const char *filter_node_name,
                       bool has_auto_finalize, bool auto_finalize,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
@@ -2769,6 +2770,10 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         on_error = BLOCKDEV_ON_ERROR_REPORT;
     }
 
+    if (!has_filter_node_name) {
+        filter_node_name = NULL;
+    }
+
     bs = bdrv_lookup_bs(device, device, errp);
     if (!bs) {
         return;
@@ -2840,7 +2845,8 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     }
 
     stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
-                 job_flags, has_speed ? speed : 0, on_error, &local_err);
+                 job_flags, has_speed ? speed : 0, on_error,
+                 filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         goto out;
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 86f7666..0fdfa9c 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1094,6 +1094,9 @@ int is_windows_drive(const char *filename);
  *                  See @BlockJobCreateFlags
  * @speed: The maximum speed, in bytes per second, or 0 for unlimited.
  * @on_error: The action to take upon error.
+ * @filter_node_name: The node name that should be assigned to the filter
+ * driver that the commit job inserts into the graph above @bs. NULL means
+ * that a node name should be autogenerated.
  * @errp: Error object.
  *
  * Start a streaming operation on @bs.  Clusters that are unallocated
@@ -1106,7 +1109,9 @@ int is_windows_drive(const char *filename);
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
                   int creation_flags, int64_t speed,
-                  BlockdevOnError on_error, Error **errp);
+                  BlockdevOnError on_error,
+                  const char *filter_node_name,
+                  Error **errp);
 
 /**
  * commit_start:
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 943df19..df6981e 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2509,6 +2509,11 @@
 #            'stop' and 'enospc' can only be used if the block device
 #            supports io-status (see BlockInfo).  Since 1.3.
 #
+# @filter-node-name: the node name that should be assigned to the
+#                    filter driver that the stream job inserts into the graph
+#                    above @device. If this option is not given, a node name is
+#                    autogenerated. (Since: 5.1)
+#
 # @auto-finalize: When false, this job will wait in a PENDING state after it has
 #                 finished its work, waiting for @block-job-finalize before
 #                 making any block graph changes.
@@ -2539,6 +2544,7 @@
   'data': { '*job-id': 'str', 'device': 'str', '*base': 'str',
             '*base-node': 'str', '*backing-file': 'str', '*speed': 'int',
             '*on-error': 'BlockdevOnError',
+            '*filter-node-name': 'str',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
 
 ##
-- 
1.8.3.1


