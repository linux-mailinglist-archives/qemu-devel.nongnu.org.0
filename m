Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A16F31C9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:04:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU6v-00052h-3x; Mon, 01 May 2023 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6a-0004bp-Dx
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:16 -0400
Received: from mail-bn8nam12on20630.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::630]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6Y-0006cu-12
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2Bam4i0932SjmwBWYuohhHoWqGYl59oFay7o7xr1VMdCyDJPYOXanBItGEKQ1XgHZr27Dw2VYHzN0kPrJAqDeK4PQZ+sxbnIhZf0zrXezQnu51E7n7caI7+cJQENEDIA5B4okrJDXg1KqFK2OELgiJCWCu9zcio5F0Ktk0IgbEmNQbytgxfl5zwjw6fYmWz+cgssrQf54R76mTMcrbVeQcvyHgReHF3yln6Sx+ZkTbIWqRi5AjKejqqdcw/3gJYwNMqBLKC12LhOWTc/iAdsM0z7hWAq83CFZhivGP39aRKU328rqm58Mn5mrpw0/xZYgj2quNuZIFMWTVjrinlvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkC3MkkLTfP/MUY8J0V0d2aqwjxvhrrgyVYHS0AZowM=;
 b=eoFAvmYVZu7FneWdl/JBr8WUUdPi6JY5qhNmhG+InUIYRD4llIJqY5PyrP3HAnXZOKGvlbC+pwidi1dTFKk4Wj41xAWiBtOWyFBWDJpUpYt34xbBiMlpnlip5NjOlGvCnT++yrB7lk0GUpiZPcedOs/9D7ARNjyTdnM4S3JF6VkHP4LeP2zQZSlobuelk0WwqelhUpu7b0mxJ0vd0ytzqINepi88ZzjBYnjqKnmKJWKETIYszGVz1i7VfXRGXMB4Y/Ut6eDhHY687iINvXs23wf6UNcFdGIrKQwsEuU+i/ScSzfz4LjwWVoqrIw+3ZzCeMVfA8Eqx8tVhX/2Rgm/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkC3MkkLTfP/MUY8J0V0d2aqwjxvhrrgyVYHS0AZowM=;
 b=KJFU8QmKBkaBKrblGXJRix1r3U+hrzNPzbG0EuhmY1SovEZXqa2KbFu0A4ReyVBjsmaImT09YrvUtRywoGJjnKLkrSrcNpc96vYMhDO5+vZnoMOjwtWkly2k6FubrYc0JbB3yQBGlvUhfP2kjz3nXYaD0LKcGTYLBxO78tc7V3xg6h3LNxuIYFhmem73UI975nC/i+4AuJ45wauGAfNBipvegce3tz7CaLIAXA8pLUi7f49iinZCeRbEY1Ba6ai8EIy/d2ziWZw569BvZdx9vkxGB1IVBJ+2qPRltLj0fc5FyPeP7q3a+XoQm8WfEijY6CXFr4CFdI0CqeXyxK/RgQ==
Received: from DM5PR07CA0066.namprd07.prod.outlook.com (2603:10b6:4:ad::31) by
 CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.30; Mon, 1 May 2023 14:02:10 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::ac) by DM5PR07CA0066.outlook.office365.com
 (2603:10b6:4:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 14:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:02:09 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:02:01 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:02:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:01:56 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH 3/8] migration: Add precopy initial data loaded ACK
 functionality
Date: Mon, 1 May 2023 17:01:36 +0300
Message-ID: <20230501140141.11743-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT051:EE_|CH2PR12MB4072:EE_
X-MS-Office365-Filtering-Correlation-Id: 561df61f-d7ed-4432-f84b-08db4a4ca810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5CQD6PkrZe5pgSHd93AYxh0gzsu+BAT4wJ9fubAXoAaNG1Hdg9zLGQLDaWPNkqJ3wZj6sHVradsnPKmDAmgcpwGsxpvPJkMa4e7JlMKHvf00ADoHIU6nkdPQAV5TAtOW/AagovtVoZ4kmDypShNMFablJcMHB/TCjPyKUXsxwNpuRBWFjCMO4KT7KE/6ZeURJutEpkr68MYAXavdK60Rlb+4vc5MoHJZB2+c9GEjahUyILuJs7XLUOfMNqzdZbhoEbV4qrOm0zGSiMPdjRIjYwpyBNUR9MwYFJCbq8AmA2xtkfC2jBbImM4YqZd4BO0NQqzg3iARFuXIaNxm46d1773KXe/N7QdGH32XE7Q/blalPs9BCml+LDPglHCyoqiSaCRImaW1b+vm/Egnwo71T9vKKTn0hkIBgjCYJSYoAm775ed6O/MDK5GTa5Su76/f19DBJWgt+s7ZxT9n3rRzpro76WotrRD9YgHA84gBczb/9LseJHmI5ZzHHaH8K2Jyqqhxq08mtkFslYpHSbfx9p31qQ2WAdAwb2QpZ23WED17IB01JHaFuc6Ra2JJhMBJHeDa5ol9Ar751XEdo1TqcKVpf+s64ZduTfJannmpdxoCc3eA8gwbzlGFpDVpIyMBkO90lHAmmIUFb47cLm+DVrCYm6vVo4nonA/lhdlqY9T/qbJ7KPWnzPtGhncvdquwbTDqz6ongAo4MMF7d51UA==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(82310400005)(86362001)(36756003)(7636003)(82740400003)(356005)(7416002)(8676002)(5660300002)(4326008)(8936002)(316002)(6916009)(41300700001)(70206006)(2906002)(40480700001)(70586007)(83380400001)(426003)(336012)(40460700003)(2616005)(47076005)(36860700001)(6666004)(7696005)(54906003)(478600001)(26005)(186003)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:09.9305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 561df61f-d7ed-4432-f84b-08db4a4ca810
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::630;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add the core functionality of precopy initial data, which allows the
destination to ACK that initial data has been loaded and the source to
wait for this ACK before completing the migration.

A new return path command MIG_RP_MSG_INITIAL_DATA_LOADED_ACK is added.
It is sent by the destination after precopy initial data is loaded to
ACK to the source that precopy initial data has been loaded.

In addition, two new SaveVMHandlers handlers are added:
1. is_initial_data_active which indicates whether precopy initial data
   is used for this migration user (i.e., SaveStateEntry).
2. initial_data_loaded which indicates whether precopy initial data has
   been loaded by this migration user.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/migration/register.h |  7 ++++++
 migration/migration.h        | 12 +++++++++++
 migration/migration.c        | 41 ++++++++++++++++++++++++++++++++++--
 migration/savevm.c           | 39 ++++++++++++++++++++++++++++++++++
 migration/trace-events       |  2 ++
 5 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index 0a73f3883e..297bbe9f73 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -77,6 +77,13 @@ typedef struct SaveVMHandlers {
      * true if it's supported or false otherwise. Called both in src and dest.
      */
     bool (*initial_data_advise)(void *opaque);
+    /*
+     * Checks if precopy initial data is active. If it's inactive,
+     * initial_data_loaded check is skipped.
+     */
+    bool (*is_initial_data_active)(void *opaque);
+    /* Checks if precopy initial data has been loaded in dest */
+    bool (*initial_data_loaded)(void *opaque);
 } SaveVMHandlers;
 
 int register_savevm_live(const char *idstr,
diff --git a/migration/migration.h b/migration/migration.h
index 4f615e9dbc..d865c23d87 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -207,6 +207,11 @@ struct MigrationIncomingState {
 
     /* Indicates whether precopy initial data was enabled and should be used */
     bool initial_data_enabled;
+    /*
+     * Indicates whether an ACK that precopy initial data was loaded has been
+     * sent to source.
+     */
+    bool initial_data_loaded_ack_sent;
 };
 
 MigrationIncomingState *migration_incoming_get_current(void);
@@ -435,6 +440,12 @@ struct MigrationState {
 
     /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
     JSONWriter *vmdesc;
+
+    /*
+     * Indicates whether an ACK that precopy initial data was loaded in
+     * destination has been received.
+     */
+    bool initial_data_loaded_acked;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
@@ -475,6 +486,7 @@ int migrate_send_rp_message_req_pages(MigrationIncomingState *mis,
 void migrate_send_rp_recv_bitmap(MigrationIncomingState *mis,
                                  char *block_name);
 void migrate_send_rp_resume_ack(MigrationIncomingState *mis, uint32_t value);
+int migrate_send_rp_initial_data_loaded_ack(MigrationIncomingState *mis);
 
 void dirty_bitmap_mig_before_vm_start(void);
 void dirty_bitmap_mig_cancel_outgoing(void);
diff --git a/migration/migration.c b/migration/migration.c
index 68cdf5b184..304cab2fa1 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -77,6 +77,11 @@ enum mig_rp_message_type {
     MIG_RP_MSG_RECV_BITMAP,  /* send recved_bitmap back to source */
     MIG_RP_MSG_RESUME_ACK,   /* tell source that we are ready to resume */
 
+    MIG_RP_MSG_INITIAL_DATA_LOADED_ACK, /*
+                                         * Tell source precopy initial data is
+                                         * loaded.
+                                         */
+
     MIG_RP_MSG_MAX
 };
 
@@ -756,6 +761,12 @@ bool migration_has_all_channels(void)
     return true;
 }
 
+int migrate_send_rp_initial_data_loaded_ack(MigrationIncomingState *mis)
+{
+    return migrate_send_rp_message(mis, MIG_RP_MSG_INITIAL_DATA_LOADED_ACK, 0,
+                                   NULL);
+}
+
 /*
  * Send a 'SHUT' message on the return channel with the given value
  * to indicate that we've finished with the RP.  Non-0 value indicates
@@ -1401,6 +1412,8 @@ void migrate_init(MigrationState *s)
     s->vm_was_running = false;
     s->iteration_initial_bytes = 0;
     s->threshold_size = 0;
+
+    s->initial_data_loaded_acked = false;
 }
 
 int migrate_add_blocker_internal(Error *reason, Error **errp)
@@ -1717,6 +1730,9 @@ static struct rp_cmd_args {
     [MIG_RP_MSG_REQ_PAGES_ID]   = { .len = -1, .name = "REQ_PAGES_ID" },
     [MIG_RP_MSG_RECV_BITMAP]    = { .len = -1, .name = "RECV_BITMAP" },
     [MIG_RP_MSG_RESUME_ACK]     = { .len =  4, .name = "RESUME_ACK" },
+    [MIG_RP_MSG_INITIAL_DATA_LOADED_ACK] = { .len = 0,
+                                             .name =
+                                                 "INITIAL_DATA_LOADED_ACK" },
     [MIG_RP_MSG_MAX]            = { .len = -1, .name = "MAX" },
 };
 
@@ -1955,6 +1971,11 @@ retry:
             }
             break;
 
+        case MIG_RP_MSG_INITIAL_DATA_LOADED_ACK:
+            ms->initial_data_loaded_acked = true;
+            trace_source_return_path_thread_initial_data_loaded_ack();
+            break;
+
         default:
             break;
         }
@@ -2704,6 +2725,20 @@ static void migration_update_counters(MigrationState *s,
                               bandwidth, s->threshold_size);
 }
 
+static bool initial_data_loaded_acked(MigrationState *s)
+{
+    if (!migrate_precopy_initial_data()) {
+        return true;
+    }
+
+    /* No reason to wait for precopy initial data loaded ACK if VM is stopped */
+    if (!runstate_is_running()) {
+        return true;
+    }
+
+    return s->initial_data_loaded_acked;
+}
+
 /* Migration thread iteration status */
 typedef enum {
     MIG_ITERATE_RESUME,         /* Resume current iteration */
@@ -2719,6 +2754,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
 {
     uint64_t must_precopy, can_postcopy;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
+    bool initial_data_loaded = initial_data_loaded_acked(s);
 
     qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
     uint64_t pending_size = must_precopy + can_postcopy;
@@ -2731,7 +2767,8 @@ static MigIterateState migration_iteration_run(MigrationState *s)
         trace_migrate_pending_exact(pending_size, must_precopy, can_postcopy);
     }
 
-    if (!pending_size || pending_size < s->threshold_size) {
+    if ((!pending_size || pending_size < s->threshold_size) &&
+        initial_data_loaded) {
         trace_migration_thread_low_pending(pending_size);
         migration_completion(s);
         return MIG_ITERATE_BREAK;
@@ -2739,7 +2776,7 @@ static MigIterateState migration_iteration_run(MigrationState *s)
 
     /* Still a significant amount to transfer */
     if (!in_postcopy && must_precopy <= s->threshold_size &&
-        qatomic_read(&s->start_postcopy)) {
+        initial_data_loaded && qatomic_read(&s->start_postcopy)) {
         if (postcopy_start(s)) {
             error_report("%s: postcopy failed to start", __func__);
         }
diff --git a/migration/savevm.c b/migration/savevm.c
index 2740defdf0..7a94deda3b 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2504,6 +2504,39 @@ static int loadvm_process_command(QEMUFile *f)
     return 0;
 }
 
+static int qemu_loadvm_initial_data_loaded_ack(MigrationIncomingState *mis)
+{
+    SaveStateEntry *se;
+    int ret;
+
+    if (!mis->initial_data_enabled || mis->initial_data_loaded_ack_sent) {
+        return 0;
+    }
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->ops || !se->ops->initial_data_loaded) {
+            continue;
+        }
+
+        if (!se->ops->is_initial_data_active ||
+            !se->ops->is_initial_data_active(se->opaque)) {
+            continue;
+        }
+
+        if (!se->ops->initial_data_loaded(se->opaque)) {
+            return 0;
+        }
+    }
+
+    ret = migrate_send_rp_initial_data_loaded_ack(mis);
+    if (!ret) {
+        mis->initial_data_loaded_ack_sent = true;
+        trace_loadvm_initial_data_loaded_acked();
+    }
+
+    return ret;
+}
+
 /*
  * Read a footer off the wire and check that it matches the expected section
  *
@@ -2826,6 +2859,12 @@ retry:
             if (ret < 0) {
                 goto out;
             }
+
+            ret = qemu_loadvm_initial_data_loaded_ack(mis);
+            if (ret < 0) {
+                goto out;
+            }
+
             break;
         case QEMU_VM_COMMAND:
             ret = loadvm_process_command(f);
diff --git a/migration/trace-events b/migration/trace-events
index 21ae471126..a0e1d3b2fd 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -24,6 +24,7 @@ loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s:
 loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
 loadvm_process_command_ping(uint32_t val) "0x%x"
 loadvm_handle_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
+loadvm_initial_data_loaded_acked(void) ""
 postcopy_ram_listen_thread_exit(void) ""
 postcopy_ram_listen_thread_start(void) ""
 qemu_savevm_send_postcopy_advise(void) ""
@@ -182,6 +183,7 @@ source_return_path_thread_loop_top(void) ""
 source_return_path_thread_pong(uint32_t val) "0x%x"
 source_return_path_thread_shut(uint32_t val) "0x%x"
 source_return_path_thread_resume_ack(uint32_t v) "%"PRIu32
+source_return_path_thread_initial_data_loaded_ack(void) ""
 migration_thread_low_pending(uint64_t pending) "%" PRIu64
 migrate_transferred(uint64_t tranferred, uint64_t time_spent, uint64_t bandwidth, uint64_t size) "transferred %" PRIu64 " time_spent %" PRIu64 " bandwidth %" PRIu64 " max_size %" PRId64
 process_incoming_migration_co_end(int ret, int ps) "ret=%d postcopy-state=%d"
-- 
2.26.3


