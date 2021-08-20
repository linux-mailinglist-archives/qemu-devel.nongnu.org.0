Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1FE3F3128
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 18:09:44 +0200 (CEST)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH75T-0002ZV-5e
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 12:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elish.jiang@ucloud.cn>)
 id 1mH73o-0000Lw-MX
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:08:01 -0400
Received: from mail-m2456.qiye.163.com ([220.194.24.56]:33900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elish.jiang@ucloud.cn>)
 id 1mH73l-0003Cf-Bz
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 12:07:59 -0400
Received: from localhost.localdomain (unknown [106.75.220.3])
 by mail-m2456.qiye.163.com (Hmail) with ESMTPA id BE6227000DF;
 Fri, 20 Aug 2021 23:57:56 +0800 (CST)
From: Zhiwei Jiang <elish.jiang@ucloud.cn>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH] migration: RDMA registrations interval optimization
Date: Fri, 20 Aug 2021 23:57:56 +0800
Message-Id: <20210820155756.3899605-1-elish.jiang@ucloud.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUNPTU1WTUNNT01CTRoeSk
 hIVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6IQw5DjNPNzUNFRNPGSgU
 CD1PCRNVSlVKTUlCT0xOS0xMS0NNVTMWGhIXVR4XEggTVRESGhUcOw4YFxQOH1UYFUVZV1kSC1lB
 WUpLTVVMTlVJSUtVSFlXWQgBWUFOS0xMNwY+
X-HM-Tid: 0a7b64487b008c15kuqtbe6227000df
Received-SPF: pass client-ip=220.194.24.56; envelope-from=elish.jiang@ucloud.cn;
 helo=mail-m2456.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RDMA migration very hard to complete when VM run mysql
benchmark on 1G host hugepage.I think the time between
ram_control_before_iterate(f, RAM_CONTROL_ROUND) and
after_iterate is too large when 1G host pagesize,so 1M
buffer size match with mlx driver that will be good.
after this patch,it will work as normal on my situation.

Signed-off-by: Zhiwei Jiang <elish.jiang@ucloud.cn>
---
 migration/migration.c | 13 +++++++++++++
 migration/migration.h |  6 ++++++
 migration/ram.c       |  6 +++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 041b8451a6..934916b161 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -457,6 +457,8 @@ void migrate_add_address(SocketAddress *address)
 static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
+    MigrationState *s = migrate_get_current();
+    s->enabled_rdma_migration = false;
 
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
@@ -465,6 +467,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
+        s->enabled_rdma_migration = true;
         rdma_start_incoming_migration(p, errp);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
@@ -2040,6 +2043,7 @@ void migrate_init(MigrationState *s)
     s->start_postcopy = false;
     s->postcopy_after_devices = false;
     s->migration_thread_running = false;
+    s->enabled_rdma_migration = false;
     error_free(s->error);
     s->error = NULL;
     s->hostname = NULL;
@@ -2300,6 +2304,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
+        s->enabled_rdma_migration = true;
         rdma_start_outgoing_migration(s, p, &local_err);
 #endif
     } else if (strstart(uri, "exec:", &p)) {
@@ -2475,6 +2480,14 @@ bool migrate_use_events(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_EVENTS];
 }
 
+bool migrate_use_rdma(void)
+{
+    MigrationState *s;
+    s = migrate_get_current();
+
+    return s->enabled_rdma_migration;
+}
+
 bool migrate_use_multifd(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index 7a5aa8c2fd..860dc93df1 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -296,6 +296,11 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+
+    /*
+     * Enable RDMA migration
+     */
+    bool enabled_rdma_migration;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -332,6 +337,7 @@ bool migrate_ignore_shared(void);
 bool migrate_validate_uuid(void);
 
 bool migrate_auto_converge(void);
+bool migrate_use_rdma(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
 int migrate_multifd_channels(void);
diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..dc0c0e2565 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2043,7 +2043,11 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
     unsigned long hostpage_boundary =
         QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);
+    /* Set RDMA boundary default 256*4K=1M that driver delivery more effective*/
+    unsigned long rdma_boundary =
+        QEMU_ALIGN_UP(pss->page + 1, 256);
     unsigned long start_page = pss->page;
+    bool use_rdma = migrate_use_rdma();
     int res;
 
     if (ramblock_is_ignored(pss->block)) {
@@ -2069,7 +2073,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
             }
         }
         pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
-    } while ((pss->page < hostpage_boundary) &&
+    } while ((pss->page < (use_rdma ? rdma_boundary : hostpage_boundary)) &&
              offset_in_ramblock(pss->block,
                                 ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
     /* The offset we leave with is the min boundary of host page and block */
-- 
2.25.1


