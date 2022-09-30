Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03495F105F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:59:43 +0200 (CEST)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJMU-0006kN-Tq
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFk-0006Px-6Z
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFh-0006dJ-JV
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GVvM5Ui7pZBsCCpmGMZXJzA0mbCyjEhrcqk60+ymJkk=;
 b=I4pqFEo6oAO8W7u59UXolPCBOIIxP5dinCOnmWkF4kQOx+bBiSHCGYht8D9HdX5B50N8cl
 tId0FEc9zyrfQBQGGAb07EWRB8LoHZnhIu1k6Vk1H3/gbZkmrL9ZPiorNrrxSzOTxTbmzY
 X3neyzcC/4H9//hO0WP462dstGx0bx0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-IKhrMvGTNyW7oHhZN4IvSg-1; Fri, 30 Sep 2022 12:52:39 -0400
X-MC-Unique: IKhrMvGTNyW7oHhZN4IvSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C1773C10224;
 Fri, 30 Sep 2022 16:52:39 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1CB17582;
 Fri, 30 Sep 2022 16:52:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/18] block: add missed block_acct_setup with new block device
 init procedure
Date: Fri, 30 Sep 2022 18:52:09 +0200
Message-Id: <20220930165222.249716-6-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Denis V. Lunev" <den@openvz.org>

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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
CC: Peter Krempa <pkrempa@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220824095044.166009-3-den@openvz.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/block/block.h   |  7 +++-
 block/accounting.c         |  8 +++-
 hw/block/block.c           |  2 +
 tests/qemu-iotests/172.out | 76 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/227.out |  4 +-
 5 files changed, 92 insertions(+), 5 deletions(-)

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
 
diff --git a/tests/qemu-iotests/172.out b/tests/qemu-iotests/172.out
index 9479b92185..07eebf3583 100644
--- a/tests/qemu-iotests/172.out
+++ b/tests/qemu-iotests/172.out
@@ -28,6 +28,8 @@ Testing:
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
diff --git a/tests/qemu-iotests/227.out b/tests/qemu-iotests/227.out
index 9c09ee3917..378c1b8fb1 100644
--- a/tests/qemu-iotests/227.out
+++ b/tests/qemu-iotests/227.out
@@ -188,7 +188,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-b
                 ],
                 "failed_unmap_operations": 0,
                 "failed_flush_operations": 0,
-                "account_invalid": false,
+                "account_invalid": true,
                 "rd_total_time_ns": 0,
                 "invalid_unmap_operations": 0,
                 "flush_operations": 0,
@@ -198,7 +198,7 @@ Testing: -blockdev driver=null-co,read-zeroes=on,node-name=null -device virtio-b
                 "rd_bytes": 0,
                 "unmap_total_time_ns": 0,
                 "invalid_flush_operations": 0,
-                "account_failed": false,
+                "account_failed": true,
                 "rd_operations": 0,
                 "invalid_wr_operations": 0,
                 "invalid_rd_operations": 0
-- 
2.37.3


