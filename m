Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0A63296D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9do-0000f3-56; Mon, 21 Nov 2022 11:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ox9dl-0000eW-SU
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:25 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.226] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ox9dj-0001uI-1h
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:27:25 -0500
HMM_SOURCE_IP: 172.18.0.218:59746.263116816
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.159 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id A60052800CA;
 Tue, 22 Nov 2022 00:27:18 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([125.69.40.159])
 by app0025 with ESMTP id cff7564a3b5e484ba6b4d280f53ca994 for
 qemu-devel@nongnu.org; Tue, 22 Nov 2022 00:27:20 CST
X-Transaction-ID: cff7564a3b5e484ba6b4d280f53ca994
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 125.69.40.159
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v2 07/11] migration: Implement dirty-limit convergence algo
Date: Mon, 21 Nov 2022 11:26:39 -0500
Message-Id: <5727cd0876e1a8d3db451feb46afb3281875cca3.1669047366.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1669047366.git.huangy81@chinatelecom.cn>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1669047366.git.huangy81@chinatelecom.cn>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
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
---
 migration/migration.c  |  1 +
 migration/ram.c        | 62 +++++++++++++++++++++++++++++++++++++++-----------
 migration/trace-events |  1 +
 softmmu/dirtylimit.c   | 22 ++++++++++++++++++
 4 files changed, 73 insertions(+), 13 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 86950a1..096b61a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -240,6 +240,7 @@ void migration_cancel(const Error *error)
     if (error) {
         migrate_set_error(current_migration, error);
     }
+    qmp_cancel_vcpu_dirty_limit(false, -1, NULL);
     migrate_fd_cancel(current_migration);
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index dc1de9d..94516b7 100644
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
 
@@ -1139,6 +1142,30 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
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
@@ -1148,22 +1175,31 @@ static void migration_trigger_throttle(RAMState *rs)
     uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
     uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
 
-    /* During block migration the auto-converge logic incorrectly detects
-     * that ram migration makes no progress. Avoid this by disabling the
-     * throttling logic during the bulk phase of block migration. */
-    if (migrate_auto_converge() && !blk_mig_bulk_active()) {
-        /* The following detection logic can be refined later. For now:
-           Check to see if the ratio between dirtied bytes and the approx.
-           amount of bytes that just got transferred since the last time
-           we were in this routine reaches the threshold. If that happens
-           twice, start or increase throttling. */
-
-        if ((bytes_dirty_period > bytes_dirty_threshold) &&
-            (++rs->dirty_rate_high_cnt >= 2)) {
+    /*
+     * The following detection logic can be refined later. For now:
+     * Check to see if the ratio between dirtied bytes and the approx.
+     * amount of bytes that just got transferred since the last time
+     * we were in this routine reaches the threshold. If that happens
+     * twice, start or increase throttling.
+     */
+
+    if ((bytes_dirty_period > bytes_dirty_threshold) &&
+        (++rs->dirty_rate_high_cnt >= 2)) {
+        rs->dirty_rate_high_cnt = 0;
+        /*
+         * During block migration the auto-converge logic incorrectly detects
+         * that ram migration makes no progress. Avoid this by disabling the
+         * throttling logic during the bulk phase of block migration
+         */
+
+        if (migrate_auto_converge() && !blk_mig_bulk_active()) {
             trace_migration_throttle();
-            rs->dirty_rate_high_cnt = 0;
             mig_throttle_guest_down(bytes_dirty_period,
                                     bytes_dirty_threshold);
+        } else if (migrate_dirty_limit() &&
+                   kvm_dirty_ring_enabled() &&
+                   migration_is_active(s)) {
+            migration_dirty_limit_guest();
         }
     }
 }
diff --git a/migration/trace-events b/migration/trace-events
index 57003ed..33a2666 100644
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
index 4537c51..3f3c405 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -439,6 +439,8 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
                                  int64_t cpu_index,
                                  Error **errp)
 {
+    MigrationState *ms = migrate_get_current();
+
     if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
         return;
     }
@@ -452,6 +454,15 @@ void qmp_cancel_vcpu_dirty_limit(bool has_cpu_index,
         return;
     }
 
+    if (migration_is_running(ms->state) &&
+        (!qemu_thread_is_self(&ms->thread)) &&
+        migrate_dirty_limit() &&
+        dirtylimit_in_service()) {
+        error_setg(errp, "dirty-limit live migration is running, not"
+                   " allowing dirty page limit being canceled manually");
+        return;
+    }
+
     dirtylimit_state_lock();
 
     if (has_cpu_index) {
@@ -487,6 +498,8 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
                               uint64_t dirty_rate,
                               Error **errp)
 {
+    MigrationState *ms = migrate_get_current();
+
     if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
         error_setg(errp, "dirty page limit feature requires KVM with"
                    " accelerator property 'dirty-ring-size' set'");
@@ -503,6 +516,15 @@ void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
         return;
     }
 
+    if (migration_is_running(ms->state) &&
+        (!qemu_thread_is_self(&ms->thread)) &&
+        migrate_dirty_limit() &&
+        dirtylimit_in_service()) {
+        error_setg(errp, "dirty-limit live migration is running, not"
+                   " allowing dirty page limit being configured manually");
+        return;
+    }
+
     dirtylimit_state_lock();
 
     if (!dirtylimit_in_service()) {
-- 
1.8.3.1


