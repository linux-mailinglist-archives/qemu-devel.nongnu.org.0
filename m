Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741A757EC9A
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 09:59:47 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFA38-0002gJ-Ho
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 03:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oF9tT-0001YI-Sp
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:49 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:53319
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oF9tN-0000QA-Ey
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 03:49:45 -0400
HMM_SOURCE_IP: 172.18.0.218:34686.1353564676
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.4 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id CFA682800C0;
 Sat, 23 Jul 2022 15:49:36 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 84bcf62c3eb04ff5a2bbdc7a1906b26d for
 qemu-devel@nongnu.org; Sat, 23 Jul 2022 15:49:38 CST
X-Transaction-ID: 84bcf62c3eb04ff5a2bbdc7a1906b26d
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
Subject: [PATCH 4/8] migration: Implement dirty-limit convergence algo
Date: Sat, 23 Jul 2022 15:49:16 +0800
Message-Id: <a2fc4b9a622fbefcad1750b13fcb924caf60ec0b.1658561555.git.huangy81@chinatelecom.cn>
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

Implement dirty-limit convergence algo for live migration,
which is kind of like auto-converge algo but using dirty-limit
instead of cpu throttle to make migration convergent.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 migration/ram.c        | 53 +++++++++++++++++++++++++++++++++++++-------------
 migration/trace-events |  1 +
 2 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index b94669b..2a5cd23 100644
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
 
@@ -1139,6 +1142,21 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
     }
 }
 
+/*
+ * Enable dirty-limit to throttle down the guest
+ */
+static void migration_dirty_limit_guest(void)
+{
+    if (!dirtylimit_in_service()) {
+        MigrationState *s = migrate_get_current();
+        int64_t quota_dirtyrate = s->parameters.vcpu_dirty_limit;
+
+        /* Set quota dirtyrate if dirty limit not in service */
+        qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
+        trace_migration_dirty_limit_guest(quota_dirtyrate);
+    }
+}
+
 static void migration_trigger_throttle(RAMState *rs)
 {
     MigrationState *s = migrate_get_current();
@@ -1148,22 +1166,31 @@ static void migration_trigger_throttle(RAMState *rs)
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
index a34afe7..3eb4b0d 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -89,6 +89,7 @@ migration_bitmap_sync_start(void) ""
 migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
 migration_throttle(void) ""
+migration_dirty_limit_guest(int64_t dirtyrate) "guest dirty page rate limit %" PRIi64 " MB/s"
 ram_discard_range(const char *rbname, uint64_t start, size_t len) "%s: start: %" PRIx64 " %zx"
 ram_load_loop(const char *rbname, uint64_t addr, int flags, void *host) "%s: addr: 0x%" PRIx64 " flags: 0x%x host: %p"
 ram_load_postcopy_loop(int channel, uint64_t addr, int flags) "chan=%d addr=0x%" PRIx64 " flags=0x%x"
-- 
1.8.3.1


