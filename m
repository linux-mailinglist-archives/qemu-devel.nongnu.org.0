Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F573108D8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:19:56 +0100 (CET)
Received: from localhost ([::1]:53210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yDT-0008Rx-Va
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7a-0002yE-CD; Fri, 05 Feb 2021 05:13:50 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1l7y7W-000768-EH; Fri, 05 Feb 2021 05:13:50 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DXB6n5szCzjKVY;
 Fri,  5 Feb 2021 18:12:17 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 18:13:32 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 6/9] block: Add error retry param setting
Date: Fri, 5 Feb 2021 18:13:12 +0800
Message-ID: <20210205101315.13042-7-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205101315.13042-1-cenjiahui@huawei.com>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, cenjiahui@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 fangying1@huawei.com, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add "retry_interval" and "retry_timeout" parameter for drive and device
option. These parameter are valid only when werror/rerror=retry.

eg. --drive file=image,rerror=retry,retry_interval=1000,retry_timeout=5000

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 block/block-backend.c          | 13 +++--
 blockdev.c                     | 50 ++++++++++++++++++++
 hw/block/block.c               | 10 ++++
 include/hw/block/block.h       |  7 ++-
 include/sysemu/block-backend.h |  5 ++
 5 files changed, 81 insertions(+), 4 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 8ad1e5105d..b97aba7110 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -35,9 +35,6 @@
 
 static AioContext *blk_aiocb_get_aio_context(BlockAIOCB *acb);
 
-/* block backend default retry interval */
-#define BLOCK_BACKEND_DEFAULT_RETRY_INTERVAL   1000
-
 typedef struct BlockBackendAioNotifier {
     void (*attached_aio_context)(AioContext *new_context, void *opaque);
     void (*detach_aio_context)(void *opaque);
@@ -1776,6 +1773,16 @@ void blk_drain_all(void)
     bdrv_drain_all_end();
 }
 
+void blk_set_on_error_retry_interval(BlockBackend *blk, int64_t interval)
+{
+    blk->retry_interval = interval;
+}
+
+void blk_set_on_error_retry_timeout(BlockBackend *blk, int64_t timeout)
+{
+    blk->retry_timeout = timeout;
+}
+
 static bool blk_error_retry_timeout(BlockBackend *blk)
 {
     /* No timeout set, infinite retries. */
diff --git a/blockdev.c b/blockdev.c
index ece1d8ae58..9b2cfdef78 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -489,6 +489,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
     const char *buf;
     int bdrv_flags = 0;
     int on_read_error, on_write_error;
+    int64_t retry_interval, retry_timeout;
     bool account_invalid, account_failed;
     bool writethrough, read_only;
     BlockBackend *blk;
@@ -581,6 +582,10 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
         }
     }
 
+    retry_interval = qemu_opt_get_number(opts, "retry_interval",
+                                         BLOCK_BACKEND_DEFAULT_RETRY_INTERVAL);
+    retry_timeout = qemu_opt_get_number(opts, "retry_timeout", 0);
+
     if (snapshot) {
         bdrv_flags |= BDRV_O_SNAPSHOT;
     }
@@ -645,6 +650,11 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
 
     blk_set_enable_write_cache(blk, !writethrough);
     blk_set_on_error(blk, on_read_error, on_write_error);
+    if (on_read_error == BLOCKDEV_ON_ERROR_RETRY ||
+        on_write_error == BLOCKDEV_ON_ERROR_RETRY) {
+        blk_set_on_error_retry_interval(blk, retry_interval);
+        blk_set_on_error_retry_timeout(blk, retry_timeout);
+    }
 
     if (!monitor_add_blk(blk, id, errp)) {
         blk_unref(blk);
@@ -771,6 +781,14 @@ QemuOptsList qemu_legacy_drive_opts = {
             .name = "werror",
             .type = QEMU_OPT_STRING,
             .help = "write error action",
+        },{
+            .name = "retry_interval",
+            .type = QEMU_OPT_NUMBER,
+            .help = "interval for retry action in millisecond",
+        },{
+            .name = "retry_timeout",
+            .type = QEMU_OPT_NUMBER,
+            .help = "timeout for retry action in millisecond",
         },{
             .name = "copy-on-read",
             .type = QEMU_OPT_BOOL,
@@ -793,6 +811,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
     BlockInterfaceType type;
     int max_devs, bus_id, unit_id, index;
     const char *werror, *rerror;
+    int64_t retry_interval, retry_timeout;
     bool read_only = false;
     bool copy_on_read;
     const char *filename;
@@ -1004,6 +1023,29 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
         qdict_put_str(bs_opts, "rerror", rerror);
     }
 
+    if (qemu_opt_find(legacy_opts, "retry_interval")) {
+        if ((werror == NULL || strcmp(werror, "retry")) &&
+            (rerror == NULL || strcmp(rerror, "retry"))) {
+            error_setg(errp, "retry_interval is only supported "
+                             "by werror/rerror=retry");
+            goto fail;
+        }
+        retry_interval = qemu_opt_get_number(legacy_opts, "retry_interval",
+                             BLOCK_BACKEND_DEFAULT_RETRY_INTERVAL);
+        qdict_put_int(bs_opts, "retry_interval", retry_interval);
+    }
+
+    if (qemu_opt_find(legacy_opts, "retry_timeout")) {
+        if ((werror == NULL || strcmp(werror, "retry")) &&
+            (rerror == NULL || strcmp(rerror, "retry"))) {
+            error_setg(errp, "retry_timeout is only supported "
+                             "by werror/rerror=retry");
+            goto fail;
+        }
+        retry_timeout = qemu_opt_get_number(legacy_opts, "retry_timeout", 0);
+        qdict_put_int(bs_opts, "retry_timeout", retry_timeout);
+    }
+
     /* Actual block device init: Functionality shared with blockdev-add */
     blk = blockdev_init(filename, bs_opts, errp);
     bs_opts = NULL;
@@ -3820,6 +3862,14 @@ QemuOptsList qemu_common_drive_opts = {
             .name = "werror",
             .type = QEMU_OPT_STRING,
             .help = "write error action",
+        },{
+            .name = "retry_interval",
+            .type = QEMU_OPT_NUMBER,
+            .help = "interval for retry action in millisecond",
+        },{
+            .name = "retry_timeout",
+            .type = QEMU_OPT_NUMBER,
+            .help = "timeout for retry action in millisecond",
         },{
             .name = BDRV_OPT_READ_ONLY,
             .type = QEMU_OPT_BOOL,
diff --git a/hw/block/block.c b/hw/block/block.c
index 1e34573da7..d2f35dc465 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -172,6 +172,16 @@ bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
     blk_set_enable_write_cache(blk, wce);
     blk_set_on_error(blk, rerror, werror);
 
+    if (rerror == BLOCKDEV_ON_ERROR_RETRY ||
+        werror == BLOCKDEV_ON_ERROR_RETRY) {
+        if (conf->retry_interval >= 0) {
+            blk_set_on_error_retry_interval(blk, conf->retry_interval);
+        }
+        if (conf->retry_timeout >= 0) {
+            blk_set_on_error_retry_timeout(blk, conf->retry_timeout);
+        }
+    }
+
     return true;
 }
 
diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index c172cbe65f..a8e77fae68 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -32,6 +32,8 @@ typedef struct BlockConf {
     bool share_rw;
     BlockdevOnError rerror;
     BlockdevOnError werror;
+    int64_t retry_interval;
+    int64_t retry_timeout;
 } BlockConf;
 
 static inline unsigned int get_physical_block_exp(BlockConf *conf)
@@ -76,7 +78,10 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
     DEFINE_PROP_BLOCKDEV_ON_ERROR("rerror", _state, _conf.rerror,       \
                                   BLOCKDEV_ON_ERROR_AUTO),              \
     DEFINE_PROP_BLOCKDEV_ON_ERROR("werror", _state, _conf.werror,       \
-                                  BLOCKDEV_ON_ERROR_AUTO)
+                                  BLOCKDEV_ON_ERROR_AUTO),              \
+    DEFINE_PROP_INT64("retry_interval", _state, _conf.retry_interval,   \
+                      -1),                                              \
+    DEFINE_PROP_INT64("retry_timeout", _state, _conf.retry_timeout, -1)
 
 /* Backend access helpers */
 
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 286d2db918..aecfa25b33 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -25,6 +25,9 @@
  */
 #include "block/block.h"
 
+/* block backend default retry interval */
+#define BLOCK_BACKEND_DEFAULT_RETRY_INTERVAL   1000
+
 /* Callbacks for block device models */
 typedef struct BlockDevOps {
     /*
@@ -188,6 +191,8 @@ void blk_inc_in_flight(BlockBackend *blk);
 void blk_dec_in_flight(BlockBackend *blk);
 void blk_drain(BlockBackend *blk);
 void blk_drain_all(void);
+void blk_set_on_error_retry_interval(BlockBackend *blk, int64_t interval);
+void blk_set_on_error_retry_timeout(BlockBackend *blk, int64_t timeout);
 void blk_error_retry_reset_timeout(BlockBackend *blk);
 void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
                       BlockdevOnError on_write_error);
-- 
2.29.2


