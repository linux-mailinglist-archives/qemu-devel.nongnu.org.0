Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388257ECA5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 10:09:39 +0200 (CEST)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFACe-0008Uo-Kh
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 04:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oF9tT-0001YJ-SV
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:49 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53114
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oF9tN-0000Pn-OU
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:45 -0400
HMM_SOURCE_IP: 172.18.0.218:34686.1353564676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.4 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id D3F6D2800BE;
 Sat, 23 Jul 2022 15:49:33 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 57683ab35c8448a9848f1a03cd4f88ec for
 qemu-devel@nongnu.org; Sat, 23 Jul 2022 15:49:35 CST
X-Transaction-ID: 57683ab35c8448a9848f1a03cd4f88ec
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, peterx@redhat.com,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH 3/8] migration: Introduce dirty-limit capability
Date: Sat, 23 Jul 2022 15:49:15 +0800
Message-Id: <f65af19c43e8a26898ad68e87d3ce6268aaf4ec7.1658561555.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1658561555.git.huangy81@chinatelecom.cn>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
migratioin-set-capabilities, and set the parameters
"x-vcpu-dirty-limit-period", "vcpu-dirty-limit" suitably
to speed up convergence.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/migration.c | 10 ++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  4 +++-
 softmmu/dirtylimit.c  | 11 ++++++++++-
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index ed1a47b..84b592e 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2508,6 +2508,15 @@ bool migrate_auto_converge(void)
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
@@ -4436,6 +4445,7 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-zero-copy-send",
             MIGRATION_CAPABILITY_ZERO_COPY_SEND),
 #endif
+    DEFINE_PROP_MIG_CAP("x-dirty-limit", MIGRATION_CAPABILITY_DIRTY_LIMIT),
 
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/migration/migration.h b/migration/migration.h
index cdad8ac..7fbb9f8 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -409,6 +409,7 @@ bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 
 bool migrate_auto_converge(void);
+bool migrate_dirty_limit(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
diff --git a/qapi/migration.json b/qapi/migration.json
index 0963bab..39e5f5e 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -477,6 +477,8 @@
 #                    will be handled faster.  This is a performance feature and
 #                    should not affect the correctness of postcopy migration.
 #                    (since 7.1)
+# @dirty-limit: Use dirty-limit to throttle down guest if enabled.
+#               (since 7.1)
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
index 8d98cb7..1fdd8c6 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -23,6 +23,8 @@
 #include "exec/memory.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
+#include "migration/misc.h"
+#include "migration/migration.h"
 #include "trace.h"
 
 /*
@@ -75,11 +77,18 @@ static bool dirtylimit_quit;
 
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
1.8.3.1


