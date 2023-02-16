Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939146999D1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:21:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgzE-0001gW-Cj; Thu, 16 Feb 2023 11:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pSgzB-0001Hy-B1
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:53 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pSgz5-00057T-Uo
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:53 -0500
HMM_SOURCE_IP: 172.18.0.188:50698.1319324123
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.27 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 9F1492800E9;
 Fri, 17 Feb 2023 00:19:36 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([118.116.19.27])
 by app0023 with ESMTP id 7f2bdb0d682a4716855b3fe0cd6ad4d2 for
 qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:19:41 CST
X-Transaction-ID: 7f2bdb0d682a4716855b3fe0cd6ad4d2
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
Subject: [PATCH v4 08/10] migration: Implement dirty-limit convergence algo
Date: Fri, 17 Feb 2023 00:18:37 +0800
Message-Id: <9166468b7365583486b48314254ab11a5e687780.1676563222.git.huangy81@chinatelecom.cn>
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

Implement dirty-limit convergence algo for live migration,
which is kind of like auto-converge algo but using dirty-limit
instead of cpu throttle to make migration convergent.

Enable dirty page limit if dirty_rate_high_cnt greater than 2
when dirty-limit capability enabled, Disable dirty-limit if
migration be cancled.

Note that "set_vcpu_dirty_limit", "cancel_vcpu_dirty_limit"
commands are not allowed during dirty-limit live migration.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 migration/migration.c  |  3 ++
 migration/ram.c        | 63 ++++++++++++++++++++++++++++++++----------
 migration/trace-events |  1 +
 softmmu/dirtylimit.c   | 22 +++++++++++++++
 4 files changed, 74 insertions(+), 15 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index f890e5966a..7ccbc07257 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -256,6 +256,9 @@ void migration_cancel(const Error *error)
     if (error) {
         migrate_set_error(current_migration, error);
     }
+    if (migrate_dirty_limit()) {
+        qmp_cancel_vcpu_dirty_limit(false, -1, NULL);
+    }
     migrate_fd_cancel(current_migration);
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index 3e5dff4068..24d26b5135 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -45,6 +45,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-types-migration.h"
 #include "qapi/qapi-events-migration.h"
+#include "qapi/qapi-commands-migration.h"
 #include "qapi/qmp/qerror.h"
 #include "trace.h"
 #include "exec/ram_addr.h"
@@ -57,6 +58,8 @@
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
+#include "sysemu/dirtylimit.h"
+#include "sysemu/kvm.h"
 
 #include "hw/boards.h" /* for machine_dump_guest_core() */
 
@@ -1188,6 +1191,30 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
     }
 }
 
+/*
+ * Enable dirty-limit to throttle down the guest
+ */
+static void migration_dirty_limit_guest(void)
+{
+    static int64_t quota_dirtyrate;
+    MigrationState *s = migrate_get_current();
+
+    /*
+     * If dirty limit already enabled and migration parameter
+     * vcpu-dirty-limit untouched.
+     */
+    if (dirtylimit_in_service() &&
+        quota_dirtyrate == s->parameters.vcpu_dirty_limit) {
+        return;
+    }
+
+    quota_dirtyrate = s->parameters.vcpu_dirty_limit;
+
+    /* Set or update quota dirty limit */
+    qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
+    trace_migration_dirty_limit_guest(quota_dirtyrate);
+}
+
 static void migration_trigger_throttle(RAMState *rs)
 {
     MigrationState *s = migrate_get_current();
@@ -1197,26 +1224,32 @@ static void migration_trigger_throttle(RAMState *rs)
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
-    /* During block migration the auto-converge logic incorrectly detects
-     * that ram migration makes no progress. Avoid this by disabling the
-     * throttling logic during the bulk phase of block migration. */
-    if (blk_mig_bulk_active()) {
-        return;
-    }
+    /*
+     * The following detection logic can be refined later. For now:
+     * Check to see if the ratio between dirtied bytes and the approx.
+     * amount of bytes that just got transferred since the last time
+     * we were in this routine reaches the threshold. If that happens
+     * twice, start or increase throttling.
+     */
 
-    if (migrate_auto_converge()) {
-        /* The following detection logic can be refined later. For now:
-           Check to see if the ratio between dirtied bytes and the approx.
-           amount of bytes that just got transferred since the last time
-           we were in this routine reaches the threshold. If that happens
-           twice, start or increase throttling. */
+    if ((bytes_dirty_period > bytes_dirty_threshold) &&
+        (++rs->dirty_rate_high_cnt >= 2)) {
+        rs->dirty_rate_high_cnt = 0;
+        /*
+         * During block migration the auto-converge logic incorrectly detects
+         * that ram migration makes no progress. Avoid this by disabling the
+         * throttling logic during the bulk phase of block migration
+         */
+        if (blk_mig_bulk_active()) {
+            return;
+        }
 
-        if ((bytes_dirty_period > bytes_dirty_threshold) &&
-            (++rs->dirty_rate_high_cnt >= 2)) {
+        if (migrate_auto_converge()) {
             trace_migration_throttle();
-            rs->dirty_rate_high_cnt = 0;
             mig_throttle_guest_down(bytes_dirty_period,
                                     bytes_dirty_threshold);
+        } else if (migrate_dirty_limit()) {
+            migration_dirty_limit_guest();
         }
     }
 }
diff --git a/migration/trace-events b/migration/trace-events
index 67b65a70ff..a689807a49 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -91,6 +91,7 @@ migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
 migration_throttle(void) ""
+migration_dirty_limit_guest(int64_t dirtyrate) "guest dirty page rate limit %" PRIi64 " MB/s"
 ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s: start: %" PRIx64 " %zx"
 ram_load_loop(const char *rbname, uint64_t addr, int flags, void *host) "%s: addr: 0x%" PRIx64 " flags: 0x%x host: %p"
 ram_load_postcopy_loop(int channel, uint64_t addr, int flags) "chan=%d addr=0x%" PRIx64 " flags=0x%x"
diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 52d1b2c6fa..ae77ebe5c5 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -438,6 +438,8 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
                                  int64_t cpu_index,
                                  Error **errp)
 {
+    MigrationState *ms = migrate_get_current();
+
     if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
         return;
     }
@@ -451,6 +453,15 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
         return;
     }
 
+    if (migration_is_running(ms->state) &&
+        (!qemu_thread_is_self(&ms->thread)) &&
+        migrate_dirty_limit() &&
+        dirtylimit_in_service()) {
+        error_setg(errp, "can't cancel dirty page limit while"
+                   " migration is running");
+        return;
+    }
+
     dirtylimit_state_lock();
 
     if (has_cpu_index) {
@@ -486,6 +497,8 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
                               uint64_t dirty_rate,
                               Error **errp)
 {
+    MigrationState *ms = migrate_get_current();
+
     if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
         error_setg(errp, "dirty page limit feature requires KVM with"
                    " accelerator property 'dirty-ring-size' set'");
@@ -502,6 +515,15 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
         return;
     }
 
+    if (migration_is_running(ms->state) &&
+        (!qemu_thread_is_self(&ms->thread)) &&
+        migrate_dirty_limit() &&
+        dirtylimit_in_service()) {
+        error_setg(errp, "can't cancel dirty page limit while"
+                   " migration is running");
+        return;
+    }
+
     dirtylimit_state_lock();
 
     if (!dirtylimit_in_service()) {
-- 
2.17.1


