Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D509A2CC578
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:42:31 +0100 (CET)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkX5C-00045S-Pa
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuW-0001uD-QF; Wed, 02 Dec 2020 13:31:30 -0500
Received: from relay.sw.ru ([185.231.240.75]:49912 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuV-0000zw-1a; Wed, 02 Dec 2020 13:31:28 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWtu-00BTPZ-IO; Wed, 02 Dec 2020 21:30:50 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v13 09/10] stream: skip filters when writing backing file name
 to QCOW2 header
Date: Wed,  2 Dec 2020 21:31:00 +0300
Message-Id: <1606933861-297777-10-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

Avoid writing a filter JSON file name and a filter format name to QCOW2
image when the backing file is being changed after the block stream
job. It can occur due to a concurrent commit job on the same backing
chain.
A user is still able to assign the 'backing-file' parameter for a
block-stream job keeping in mind the possible issue mentioned above.
If the user does not specify the 'backing-file' parameter, QEMU will
assign it automatically.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/stream.c | 21 +++++++++++++++++++--
 blockdev.c     |  8 +-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 6e281c7..061268b 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -17,6 +17,7 @@
 #include "block/blockjob_int.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
 
@@ -65,6 +66,8 @@ static int stream_prepare(Job *job)
     BlockDriverState *bs = blk_bs(bjob->blk);
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
     BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
+    BlockDriverState *base_unfiltered;
+    BlockDriverState *backing_bs;
     Error *local_err = NULL;
     int ret = 0;
 
@@ -75,8 +78,22 @@ static int stream_prepare(Job *job)
         const char *base_id = NULL, *base_fmt = NULL;
         if (base) {
             base_id = s->backing_file_str;
-            if (base->drv) {
-                base_fmt = base->drv->format_name;
+            if (base_id) {
+                backing_bs = bdrv_find_backing_image(bs, base_id);
+                if (backing_bs && backing_bs->drv) {
+                    base_fmt = backing_bs->drv->format_name;
+                } else {
+                    error_report("Format not found for backing file %s",
+                                 s->backing_file_str);
+                }
+            } else {
+                base_unfiltered = bdrv_skip_filters(base);
+                if (base_unfiltered) {
+                    base_id = base_unfiltered->filename;
+                    if (base_unfiltered->drv) {
+                        base_fmt = base_unfiltered->drv->format_name;
+                    }
+                }
             }
         }
         bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
diff --git a/blockdev.c b/blockdev.c
index c917625..70900f4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2508,7 +2508,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     BlockDriverState *base_bs = NULL;
     AioContext *aio_context;
     Error *local_err = NULL;
-    const char *base_name = NULL;
     int job_flags = JOB_DEFAULT;
 
     if (!has_on_error) {
@@ -2536,7 +2535,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
             goto out;
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
-        base_name = base;
     }
 
     if (has_base_node) {
@@ -2551,7 +2549,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         }
         assert(bdrv_get_aio_context(base_bs) == aio_context);
         bdrv_refresh_filename(base_bs);
-        base_name = base_bs->filename;
     }
 
     /* Check for op blockers in the whole chain between bs and base */
@@ -2571,9 +2568,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         goto out;
     }
 
-    /* backing_file string overrides base bs filename */
-    base_name = has_backing_file ? backing_file : base_name;
-
     if (has_auto_finalize && !auto_finalize) {
         job_flags |= JOB_MANUAL_FINALIZE;
     }
@@ -2581,7 +2575,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         job_flags |= JOB_MANUAL_DISMISS;
     }
 
-    stream_start(has_job_id ? job_id : NULL, bs, base_bs, base_name,
+    stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
                  job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
-- 
1.8.3.1


