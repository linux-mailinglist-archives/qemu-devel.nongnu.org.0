Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799316D0D6C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:08:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwdd-0003MI-9X; Thu, 30 Mar 2023 14:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdS-0003JC-L7
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:30 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdR-000262-14
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:30 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA8641F86C;
 Thu, 30 Mar 2023 18:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KK/TQbf2mnwP6VHEO79Vdk2BgwveWe5Obtn01e1sCM4=;
 b=UQdjHBs/99rN/nMpP9kbvjNNhG/+2Rp1Gu5P+vKDVpYncm2TVnNF11T+GUIkgsomPZzELr
 pEx23bWrPpb2UVEENK1x+yLsJ6hBhgdHH2BqE95AnUL4OTucQV5buI9mnTxZyhiH4rXOOD
 vU1I7rMkxqXAa0OIf3aA6EgjUm9UfIw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KK/TQbf2mnwP6VHEO79Vdk2BgwveWe5Obtn01e1sCM4=;
 b=jm2KF97cUfEcM1gE39C+zuuAOMzfd5zCTbME9IFgNXosVQOVo25jx50TdHJuK8NHiIDRYJ
 YZy3FT/Zx5le2bDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 984D51348E;
 Thu, 30 Mar 2023 18:04:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QI6cFyXPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [RFC PATCH v1 14/26] migration: Add completion tracepoint
Date: Thu, 30 Mar 2023 15:03:24 -0300
Message-Id: <20230330180336.2791-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Add a completion tracepoint that provides basic stats for
debug. Displays throughput (MB/s and pages/s) and total time (ms).

Usage:
  $QEMU ... -trace migration_status

Output:
  migration_status 1506 MB/s, 436725 pages/s, 8698 ms

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 migration/migration.c  | 6 +++---
 migration/migration.h  | 4 +++-
 migration/savevm.c     | 4 ++++
 migration/trace-events | 1 +
 4 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 29630523e2..17b26c1808 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3811,7 +3811,7 @@ static uint64_t migration_total_bytes(MigrationState *s)
         ram_counters.multifd_bytes;
 }
 
-static void migration_calculate_complete(MigrationState *s)
+void migration_calculate_complete(MigrationState *s)
 {
     uint64_t bytes = migration_total_bytes(s);
     int64_t end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
@@ -3843,8 +3843,7 @@ static void update_iteration_initial_status(MigrationState *s)
     s->iteration_initial_pages = ram_get_total_transferred_pages();
 }
 
-static void migration_update_counters(MigrationState *s,
-                                      int64_t current_time)
+void migration_update_counters(MigrationState *s, int64_t current_time)
 {
     uint64_t transferred, transferred_pages, time_spent;
     uint64_t current_bytes; /* bytes transferred since the beginning */
@@ -3941,6 +3940,7 @@ static void migration_iteration_finish(MigrationState *s)
     case MIGRATION_STATUS_COMPLETED:
         migration_calculate_complete(s);
         runstate_set(RUN_STATE_POSTMIGRATE);
+        trace_migration_status((int)s->mbps / 8, (int)s->pages_per_second, s->total_time);
         break;
     case MIGRATION_STATUS_COLO:
         if (!migrate_colo_enabled()) {
diff --git a/migration/migration.h b/migration/migration.h
index 84be34587f..01c8201cfa 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -387,7 +387,9 @@ struct MigrationState {
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
-
+void migration_calculate_complete(MigrationState *s);
+void migration_update_counters(MigrationState *s,
+                               int64_t current_time);
 void migration_fd_process_incoming(QEMUFile *f, Error **errp);
 void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp);
 void migration_incoming_process(void);
diff --git a/migration/savevm.c b/migration/savevm.c
index 1f1bc19224..b369d11b19 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1638,6 +1638,7 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     qemu_mutex_lock_iothread();
 
     while (qemu_file_get_error(f) == 0) {
+        migration_update_counters(ms, qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
         if (qemu_savevm_state_iterate(f, false) > 0) {
             break;
         }
@@ -1660,6 +1661,9 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     }
     migrate_set_state(&ms->state, MIGRATION_STATUS_SETUP, status);
 
+    migration_calculate_complete(ms);
+    trace_migration_status((int)ms->mbps / 8, (int)ms->pages_per_second, ms->total_time);
+
     /* f is outer parameter, it should not stay in global migration state after
      * this function finished */
     ms->to_dst_file = NULL;
diff --git a/migration/trace-events b/migration/trace-events
index 92161eeac5..23e4dad1ec 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -165,6 +165,7 @@ migration_return_path_end_after(int rp_error) "%d"
 migration_thread_after_loop(void) ""
 migration_thread_file_err(void) ""
 migration_thread_setup_complete(void) ""
+migration_status(int mpbs, int pages_per_second, int64_t total_time) "%d MB/s, %d pages/s, %ld ms"
 open_return_path_on_source(void) ""
 open_return_path_on_source_continue(void) ""
 postcopy_start(void) ""
-- 
2.35.3


