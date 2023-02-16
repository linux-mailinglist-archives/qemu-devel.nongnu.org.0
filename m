Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221B16999C6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:20:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgzB-00014k-77; Thu, 16 Feb 2023 11:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pSgz8-0000hk-DH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:50 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pSgz5-00056r-VJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:50 -0500
HMM_SOURCE_IP: 172.18.0.188:50698.1319324123
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.27 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id E536D2800E5;
 Fri, 17 Feb 2023 00:19:27 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([118.116.19.27])
 by app0023 with ESMTP id 4ba4661da9464483a51dfe42991691a4 for
 qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:19:31 CST
X-Transaction-ID: 4ba4661da9464483a51dfe42991691a4
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.27
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v4 06/10] migration: Introduce dirty-limit capability
Date: Fri, 17 Feb 2023 00:18:35 +0800
Message-Id: <a9952eaa2bf3c8066b0e8dee066b57395ffa37b1.1676563222.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Introduce migration dirty-limit capability, which can
be turned on before live migration and limit dirty
page rate durty live migration.

Introduce migrate_dirty_limit function to help check
if dirty-limit capability enabled during live migration.

Meanwhile, refactor vcpu_dirty_rate_stat_collect
so that period can be configured instead of hardcoded.

dirty-limit capability is kind of like auto-converge
but using dirty limit instead of traditional cpu-throttle
to throttle guest down. To enable this feature, turn on
the dirty-limit capability before live migration using
migrate-set-capabilities, and set the parameters
"x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
to speed up convergence.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Acked-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 25 +++++++++++++++++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  4 +++-
 softmmu/dirtylimit.c  | 11 ++++++++++-
 4 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e479c86575..f890e5966a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -64,6 +64,7 @@
 #include "yank_functions.h"
 #include "sysemu/qtest.h"
 #include "ui/qemu-spice.h"
+#include "sysemu/kvm.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -1444,6 +1445,20 @@ static bool migrate_caps_check(bool *cap_list,
         }
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_DIRTY_LIMIT]) {
+        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
+            error_setg(errp, "dirty-limit conflicts with auto-converge"
+                       " either of then available currently");
+            return false;
+        }
+
+        if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
+            error_setg(errp, "dirty-limit requires KVM with accelerator"
+                   " property 'dirty-ring-size' set");
+            return false;
+        }
+    }
+
     return true;
 }
 
@@ -2635,6 +2650,15 @@ bool migrate_auto_converge(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_AUTO_CONVERGE];
 }
 
+bool migrate_dirty_limit(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_LIMIT];
+}
+
 bool migrate_zero_blocks(void)
 {
     MigrationState *s;
@@ -4583,6 +4607,7 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
 #endif
+    DEFINE_PROP_MIG_CAP("x-dirty-limit", MIGRATION_CAPABILITY_DIRTY_LIMIT),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/migration/migration.h b/migration/migration.h
index 2da2f8a164..cd2e9bfeea 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -418,6 +418,7 @@ bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 
 bool migrate_auto_converge(void);
+bool migrate_dirty_limit(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
diff --git a/qapi/migration.json b/qapi/migration.json
index d33cc2d582..b7a92be055 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -477,6 +477,8 @@
 #                    will be handled faster.  This is a performance feature and
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
+# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
+#               (since 8.0)
 #
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
@@ -492,7 +494,7 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send', 'postcopy-preempt'] }
+           'zero-copy-send', 'postcopy-preempt', 'dirty-limit'] }
 
 ##
 # @MigrationCapabilityStatus:
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index dcab9bf2b1..52d1b2c6fa 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -22,6 +22,8 @@
 #include "exec/memory.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
+#include "migration/misc.h"
+#include "migration/migration.h"
 #include "trace.h"
 
 /*
@@ -74,11 +76,18 @@ static bool dirtylimit_quit;
 
 static void vcpu_dirty_rate_stat_collect(void)
 {
+    MigrationState *s = migrate_get_current();
     VcpuStat stat;
     int i = 0;
+    int64_t period = DIRTYLIMIT_CALC_TIME_MS;
+
+    if (migrate_dirty_limit() &&
+        migration_is_active(s)) {
+        period = s->parameters.x_vcpu_dirty_limit_period;
+    }
 
     /* calculate vcpu dirtyrate */
-    vcpu_calculate_dirtyrate(DIRTYLIMIT_CALC_TIME_MS,
+    vcpu_calculate_dirtyrate(period,
                              &stat,
                              GLOBAL_DIRTY_LIMIT,
                              false);
-- 
2.17.1


