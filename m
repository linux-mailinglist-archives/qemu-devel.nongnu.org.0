Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5359D7CB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:00:14 +0200 (CEST)
Received: from localhost ([::1]:44870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQhh-0007JD-3x
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQQf6-0001Qc-IG; Tue, 23 Aug 2022 05:57:32 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:46324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQQf3-0001vl-Nb; Tue, 23 Aug 2022 05:57:32 -0400
Received: from [192.168.16.122] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oQQdQ-00H9Gd-6T;
 Tue, 23 Aug 2022 11:57:11 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 2/2] block: add missed block_acct_setup with new block device
 init procedure
Date: Tue, 23 Aug 2022 11:57:19 +0200
Message-Id: <20220823095719.105387-3-den@openvz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220823095719.105387-1-den@openvz.org>
References: <20220823095719.105387-1-den@openvz.org>
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

Commit 5f76a7aac156ca75680dad5df4a385fd0b58f6b1 is looking harmless from
the first glance, but it has changed things a lot. 'libvirt' uses it to
detect that it should follow new initialization way and this changes
things considerably. With this procedure followed, blockdev_init() is
not called anymore and thus block_acct_setup() helper is not called.

This means in particular that defaults for block accounting statistics
are changed and account_invalid/account_failed are actually initialized
as false instead of true originally.

This commit changes things to match original world. There are the following
constraints:
* new default value in block_acct_init() is set to true
* block_acct_setup() inside blockdev_init() is called before
  blkconf_apply_backend_options()
* thus newly created option in block device properties has precedence if
  specified

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Peter Krempa <pkrempa@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/accounting.c         |  8 +++-
 hw/block/block.c           |  2 +
 include/hw/block/block.h   |  7 +++-
 qapi/misc.json             |  9 +----
 tests/qemu-iotests/172.out | 76 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 6b300c5129..2829745377 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -38,6 +38,8 @@ void block_acct_init(BlockAcctStats *stats)
     if (qtest_enabled()) {
         clock_type = QEMU_CLOCK_VIRTUAL;
     }
+    stats->account_invalid = true;
+    stats->account_failed = true;
 }
 
 static bool bool_from_onoffauto(OnOffAuto val, bool def)
@@ -57,8 +59,10 @@ static bool bool_from_onoffauto(OnOffAuto val, bool def)
 void block_acct_setup(BlockAcctStats *stats, enum OnOffAuto account_invalid,
                       enum OnOffAuto account_failed)
 {
-    stats->account_invalid = bool_from_onoffauto(account_invalid, true);
-    stats->account_failed = bool_from_onoffauto(account_failed, true);
+    stats->account_invalid = bool_from_onoffauto(account_invalid,
+                                                 stats->account_invalid);
+    stats->account_failed = bool_from_onoffauto(account_failed,
+                                                stats->account_failed);
 }
 
 void block_acct_cleanup(BlockAcctStats *stats)
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


