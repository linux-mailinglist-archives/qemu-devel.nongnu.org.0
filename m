Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20F5F1057
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:57:46 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJKb-0003mW-6Z
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFj-0006Pc-N0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFi-0006dQ-3I
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aASNzx6vzvLXk2mGxt/KUFBXbNZquZNmyGOY1kC3vWo=;
 b=OAwob0lIhUb1uORHepOyIw3BLtW3cgutR20DpxMbFraOD7XrLtNH9mRKdbVnNKfuWHr9zy
 c8PbzKwuozNQtsjxXue6bYE5DRJZYHORRZH/+csPugheEhGgwTH8kZFkxYMq7oGMYRD2jY
 4pyYsZ5J6S0cyPY5ZNO23JbMAnJ31+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-AKU2OuQhOOqeyjnAerX4IQ-1; Fri, 30 Sep 2022 12:52:38 -0400
X-MC-Unique: AKU2OuQhOOqeyjnAerX4IQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9AEA29A9CCB;
 Fri, 30 Sep 2022 16:52:37 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 349DA17582;
 Fri, 30 Sep 2022 16:52:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 04/18] block: pass OnOffAuto instead of bool to
 block_acct_setup()
Date: Fri, 30 Sep 2022 18:52:08 +0200
Message-Id: <20220930165222.249716-5-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We would have one more place for block_acct_setup() calling, which should
not corrupt original value.

Signed-off-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
CC: Peter Krempa <pkrempa@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220824095044.166009-2-den@openvz.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/accounting.h |  6 +++---
 block/accounting.c         | 22 ++++++++++++++++++----
 blockdev.c                 | 17 ++++++++++++++---
 3 files changed, 35 insertions(+), 10 deletions(-)

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
 
-- 
2.37.3


