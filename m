Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309759D8B0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 12:04:33 +0200 (CEST)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQls-0002Xp-2O
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 06:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQQf5-0001Nv-Ki; Tue, 23 Aug 2022 05:57:31 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:46325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oQQf3-0001vm-Me; Tue, 23 Aug 2022 05:57:31 -0400
Received: from [192.168.16.122] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oQQdP-00H9Gd-Sl;
 Tue, 23 Aug 2022 11:57:11 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 1/2] block: pass OnOffAuto instead of bool to
 block_acct_setup()
Date: Tue, 23 Aug 2022 11:57:18 +0200
Message-Id: <20220823095719.105387-2-den@openvz.org>
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
 block/accounting.c         | 22 ++++++++++++++++++----
 blockdev.c                 | 17 ++++++++++++++---
 include/block/accounting.h |  6 +++---
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 2030851d79..6b300c5129 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -40,11 +40,25 @@ void block_acct_init(BlockAcctStats *stats)
     }
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
+    stats->account_invalid = bool_from_onoffauto(account_invalid, true);
+    stats->account_failed = bool_from_onoffauto(account_failed, true);
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
-- 
2.32.0


