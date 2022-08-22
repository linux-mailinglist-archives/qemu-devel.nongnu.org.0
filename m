Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A0E59BDA8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:36:13 +0200 (CEST)
Received: from localhost ([::1]:34988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ4my-000211-WA
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:36:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQ4iv-0004ky-W2; Mon, 22 Aug 2022 06:32:02 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:56074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQ4ir-00053c-Oz; Mon, 22 Aug 2022 06:32:01 -0400
Received: from [192.168.16.115] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oQ4gz-00GyKO-Px;
 Mon, 22 Aug 2022 12:31:25 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 2/2] block: pass OnOffAuto instead of bool to
 block_acct_setup()
Date: Mon, 22 Aug 2022 12:31:31 +0200
Message-Id: <20220822103131.381075-3-den@openvz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220822103131.381075-1-den@openvz.org>
References: <20220822103131.381075-1-den@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We would have one more place for block_acct_setup() calling, which should
not corrupt original value.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Peter Krempa <pkrempa@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/accounting.c         | 26 +++++++++++--
 blockdev.c                 | 17 +++++++--
 hw/block/block.c           |  2 +
 include/block/accounting.h |  6 +--
 include/hw/block/block.h   |  7 +++-
 qapi/misc.json             |  9 +----
 tests/qemu-iotests/172.out | 76 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 124 insertions(+), 19 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 2030851d79..2829745377 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -38,13 +38,31 @@ void block_acct_init(BlockAcctStats *stats)
     if (qtest_enabled()) {
         clock_type = QEMU_CLOCK_VIRTUAL;
     }
+    stats->account_invalid = true;
+    stats->account_failed = true;
 }
 
-void block_acct_setup(BlockAcctStats *stats, bool account_invalid,
-                      bool account_failed)
+static bool bool_from_onoffauto(OnOffAuto val, bool def)
 {
-    stats->account_invalid = account_invalid;
-    stats->account_failed = account_failed;
+    switch (val) {
+    case ON_OFF_AUTO_AUTO:
+        return def;
+    case ON_OFF_AUTO_ON:
+        return true;
+    case ON_OFF_AUTO_OFF:
+        return false;
+    default:
+        abort();
+    }
+}
+
+void block_acct_setup(BlockAcctStats *stats, enum OnOffAuto account_invalid,
+                      enum OnOffAuto account_failed)
+{
+    stats->account_invalid = bool_from_onoffauto(account_invalid,
+                                                 stats->account_invalid);
+    stats->account_failed = bool_from_onoffauto(account_failed,
+                                                stats->account_failed);
 }
 
 void block_acct_cleanup(BlockAcctStats *stats)
diff --git a/blockdev.c b/blockdev.c
index 9230888e34..392d9476e6 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -455,6 +455,17 @@ static void extract_common_blockdev_options(QemuOpts *opts, int *bdrv_flags,
     }
 }
 
+static OnOffAuto account_get_opt(QemuOpts *opts, const char *name)
+{
+    if (!qemu_opt_find(opts, name)) {
+        return ON_OFF_AUTO_AUTO;
+    }
+    if (qemu_opt_get_bool(opts, name, true)) {
+        return ON_OFF_AUTO_ON;
+    }
+    return ON_OFF_AUTO_OFF;
+}
+
 /* Takes the ownership of bs_opts */
 static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
                                    Error **errp)
@@ -462,7 +473,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
     const char *buf;
     int bdrv_flags = 0;
     int on_read_error, on_write_error;
-    bool account_invalid, account_failed;
+    OnOffAuto account_invalid, account_failed;
     bool writethrough, read_only;
     BlockBackend *blk;
     BlockDriverState *bs;
@@ -496,8 +507,8 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
     /* extract parameters */
     snapshot = qemu_opt_get_bool(opts, "snapshot", 0);
 
-    account_invalid = qemu_opt_get_bool(opts, "stats-account-invalid", true);
-    account_failed = qemu_opt_get_bool(opts, "stats-account-failed", true);
+    account_invalid = account_get_opt(opts, "stats-account-invalid");
+    account_failed = account_get_opt(opts, "stats-account-failed");
 
     writethrough = !qemu_opt_get_bool(opts, BDRV_OPT_CACHE_WB, true);
 
diff --git a/hw/block/block.c b/hw/block/block.c
index 04279166ee..f9c4fe6767 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -205,6 +205,8 @@ bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
     blk_set_enable_write_cache(blk, wce);
     blk_set_on_error(blk, rerror, werror);
 
+    block_acct_setup(blk_get_stats(blk), conf->account_invalid,
+                     conf->account_failed);
     return true;
 }
 
diff --git a/include/block/accounting.h b/include/block/accounting.h
index 878b4c3581..b9caad60d5 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -27,7 +27,7 @@
 
 #include "qemu/timed-average.h"
 #include "qemu/thread.h"
-#include "qapi/qapi-builtin-types.h"
+#include "qapi/qapi-types-common.h"
 
 typedef struct BlockAcctTimedStats BlockAcctTimedStats;
 typedef struct BlockAcctStats BlockAcctStats;
@@ -100,8 +100,8 @@ typedef struct BlockAcctCookie {
 } BlockAcctCookie;
 
 void block_acct_init(BlockAcctStats *stats);
-void block_acct_setup(BlockAcctStats *stats, bool account_invalid,
-                     bool account_failed);
+void block_acct_setup(BlockAcctStats *stats, enum OnOffAuto account_invalid,
+                      enum OnOffAuto account_failed);
 void block_acct_cleanup(BlockAcctStats *stats);
 void block_acct_add_interval(BlockAcctStats *stats, unsigned interval_length);
 BlockAcctTimedStats *block_acct_interval_next(BlockAcctStats *stats,
diff --git a/include/hw/block/block.h b/include/hw/block/block.h
index 5902c0440a..15fff66435 100644
--- a/include/hw/block/block.h
+++ b/include/hw/block/block.h
@@ -31,6 +31,7 @@ typedef struct BlockConf {
     uint32_t lcyls, lheads, lsecs;
     OnOffAuto wce;
     bool share_rw;
+    OnOffAuto account_invalid, account_failed;
     BlockdevOnError rerror;
     BlockdevOnError werror;
 } BlockConf;
@@ -61,7 +62,11 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
                        _conf.discard_granularity, -1),                  \
     DEFINE_PROP_ON_OFF_AUTO("write-cache", _state, _conf.wce,           \
                             ON_OFF_AUTO_AUTO),                          \
-    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false)
+    DEFINE_PROP_BOOL("share-rw", _state, _conf.share_rw, false),        \
+    DEFINE_PROP_ON_OFF_AUTO("account-invalid", _state,                  \
+                            _conf.account_invalid, ON_OFF_AUTO_AUTO),   \
+    DEFINE_PROP_ON_OFF_AUTO("account-failed", _state,                   \
+                            _conf.account_failed, ON_OFF_AUTO_AUTO)
 
 #define DEFINE_BLOCK_PROPERTIES(_state, _conf)                          \
     DEFINE_PROP_DRIVE("drive", _state, _conf.blk),                      \
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..f469cd0ded 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -210,12 +210,6 @@
 #
 # @cpu-index: The CPU to use for commands that require an implicit CPU
 #
-# Features:
-# @savevm-monitor-nodes: If present, HMP command savevm only snapshots
-#                        monitor-owned nodes if they have no parents.
-#                        This allows the use of 'savevm' with
-#                        -blockdev. (since 4.2)
-#
 # Returns: the output of the command as a string
 #
 # Since: 0.14
@@ -243,8 +237,7 @@
 ##
 { 'command': 'human-monitor-command',
   'data': {'command-line': 'str', '*cpu-index': 'int'},
-  'returns': 'str',
-  'features': [ 'savevm-monitor-nodes' ] }
+  'returns': 'str' }
 
 ##
 # @getfd:
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 9479b92185..07eebf3583 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -28,6 +28,8 @@ Formatting 'TEST_DIR/t.IMGFMT.3', fmt=IMGFMT size=737280
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 
 
@@ -55,6 +57,8 @@ Testing: -fda TEST_DIR/t.qcow2
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -92,6 +96,8 @@ Testing: -fdb TEST_DIR/t.qcow2
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -104,6 +110,8 @@ Testing: -fdb TEST_DIR/t.qcow2
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -145,6 +153,8 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -157,6 +167,8 @@ Testing: -fda TEST_DIR/t.qcow2 -fdb TEST_DIR/t.qcow2.2
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -199,6 +211,8 @@ Testing: -fdb
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -211,6 +225,8 @@ Testing: -fdb
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 
 
@@ -238,6 +254,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -275,6 +293,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -287,6 +307,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2,index=1
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -328,6 +350,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -340,6 +364,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=floppy,file=TEST_DIR/t
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -385,6 +411,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -422,6 +450,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,unit=1
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -459,6 +489,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -471,6 +503,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qco
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -522,6 +556,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -534,6 +570,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -576,6 +614,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -588,6 +628,8 @@ Testing: -fda TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -630,6 +672,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 1 (0x1)
@@ -642,6 +686,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -684,6 +730,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 1 (0x1)
@@ -696,6 +744,8 @@ Testing: -fdb TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.qcow2.2 -device fl
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy1 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -747,6 +797,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -759,6 +811,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -801,6 +855,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
               dev: floppy, id ""
                 unit = 0 (0x0)
@@ -813,6 +869,8 @@ Testing: -drive if=floppy,file=TEST_DIR/t.qcow2 -drive if=none,file=TEST_DIR/t.q
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 floppy0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/unattached/device[N]
@@ -861,6 +919,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -global floppy.drive=none0 -device
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -928,6 +988,8 @@ Testing: -device floppy
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 
 Testing: -device floppy,drive-type=120
@@ -952,6 +1014,8 @@ Testing: -device floppy,drive-type=120
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "120"
 
 Testing: -device floppy,drive-type=144
@@ -976,6 +1040,8 @@ Testing: -device floppy,drive-type=144
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 
 Testing: -device floppy,drive-type=288
@@ -1000,6 +1066,8 @@ Testing: -device floppy,drive-type=288
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 
 
@@ -1027,6 +1095,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "120"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -1064,6 +1134,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,drive-t
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "288"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -1104,6 +1176,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,logical
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
@@ -1141,6 +1215,8 @@ Testing: -drive if=none,file=TEST_DIR/t.qcow2 -device floppy,drive=none0,physica
                 discard_granularity = 4294967295 (4 GiB)
                 write-cache = "auto"
                 share-rw = false
+                account-invalid = "auto"
+                account-failed = "auto"
                 drive-type = "144"
 none0 (NODE_NAME): TEST_DIR/t.qcow2 (qcow2)
     Attached to:      /machine/peripheral-anon/device[N]
-- 
2.32.0


