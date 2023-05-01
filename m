Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60996F31C3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:03:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU6p-0004gW-1w; Mon, 01 May 2023 10:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6Z-0004YY-J4
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:15 -0400
Received: from mail-dm6nam12on20600.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::600]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU6W-0006ce-Ta
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6XpmzUZTYWZ+0bS5lkU4Z4bdYFkkMWD0bqHDM89ZcrtVLXECB9SYEmgTlSFEMQ/d6F6StQulOApCLhFM/hDeqrnGREWtOKNWxoN2Q2j3WOEZfge1xAB6ev62YbkF20Wxs2SLFL6FtLqDDwy5RuNuhq+Y3F0IKccdl2mfPmIm5TA80IMhuTvejIYHIjukkec9X4H8jlQqp/t3ZmKTk1CJS6KA3/lFc9nej73U50wDOkmtzvKTyN9/yMJYnJEEvJbS8nDZ9XN9pxEO5qAMIH8Qsm+1NzQ+ZIN9KKP3wQfLpvBvbCnOuDHR13/0pGfaPpY40hnGjnCpuGaWqGqroLyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SF43iDpgEWDoLPcClIWjZNLYo6aeKbWHvGiaqhP6P8=;
 b=mIh11qUvy6PlEHjYJl5ms61PJ9QHQ25kYnsDYCTBQyRwrI4hW8I24sSnC9w5l4qJOIjz7pHkxT2rwUSQQYQbQX1PUEjoldrBf4NsMcNkTf5EinBQCdsr7DFfgHxBzdin2mwgvq2R78g7Yqn+o0lnGpyU6osebkQjF86IWzcdC+AhyGUzF0t6yaKc7O/BTIOztdaZbQfjqAi6HGmNi7cNZhhxa6nXs1oJuT989qeQbv3NDq5yjpz1f/KCpHURRaLhDrtWxVcnd778W64Xkuq0B2LfteTcqvG2r8HjnDctnqtCyi41dDDF0A6iJvK6O9xKMlp/ohBzlP+nGGfnqa55BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SF43iDpgEWDoLPcClIWjZNLYo6aeKbWHvGiaqhP6P8=;
 b=tXNAdlGyR+qeGtnyvM2p9+/9UK+bx7NcYj/Pi5msWUgNizLCBqlvomZXD/djpQd/BMLujqLt0m+f73JrfLp6NqVMQdPVMZrKYCnt0nLZdP5F2KjK51/m86l/EqoG+UlTPhirrUR+ADvDMgT6/dDOY17+vQ/vBksgtQ8Q4rLPZTQVWPvNJGpW84xVd2JAXMyNVLXp78SycFbimSNv7iT968VhuDHT9DbmdZJGKgphl+PTcBQu+V2xnQaqUAj6Y+Y4IjSsCpe6gfXjzE+QOft173oqEPDhvAeRxfkENDYAcc4aGeu1IBBtzSdBJ2vVev/EFzwPL2My74TyAQedcNUZ3A==
Received: from DM5PR07CA0065.namprd07.prod.outlook.com (2603:10b6:4:ad::30) by
 CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.30; Mon, 1 May 2023 14:02:06 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::77) by DM5PR07CA0065.outlook.office365.com
 (2603:10b6:4:ad::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Mon, 1 May 2023 14:02:06 +0000
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
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:02:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:01:56 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:01:56 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:01:52 -0700
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
Subject: [PATCH 2/8] migration: Add precopy initial data handshake
Date: Mon, 1 May 2023 17:01:35 +0300
Message-ID: <20230501140141.11743-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT051:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: a26143c2-be10-4371-177e-08db4a4ca621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLUPFQjTt2rfWhuIg7c394X4ztyIY9bO7gcnwtoGFUaaD55DIh98j1fLMROPF2/IH9BCmjJEWN6U7J0l9i2DfiN5DfBw1dufJkNPdILMit2Mbi2I6d/9YfoMyAIdc1jKqMUc0Yje3F69eYk2zollWCubZ/2ikucFECAnj4neqtgLzUSGaiazLvIeLQrDOFfSXLJMsCqZHMlSAbrOTsOT78eX4g9KqzHn8RT7nbO2lui+EYYcHMk7iWMy52AMJLSngAZbpkDJGCec/twSfq+JioiWS6+yg4I0jpgZuZM9QmU5W7flcZKcfwRbcd//jO1OtJxwU/VHqRAWMtHQbzXR4ymrQtiuM3DfA2ZzTidl+JbQn3OHmsEdEK+HQlPIp41JHS/HNuvU15HyGdrztzriVzbSeiHB3SV61NpEC0obA+Wv2gYe9VtvIGBctylVYEYetekIKJ3xZS86EWs3xDe6R3ZvtPKmxi9AhGlZ+nyzyG7pTVD9pz8TalBG/PILCBDMAspBz43T8P5hXPt9gwfKivAPj32X4MdtZ47EmulHkFhYZyLFRqDxIsIeLi+B1uKkUzU904JnOjsbZJ/3VQAoRbCiyeR7VYvYlQmBpplNTpgqf8vlnnzXT6bE6Ic6IMtvr7QdSBYg689Ns7cEY+rWM1FJ359IRhfEnQO15HV//WqNtLXero8+P/EcZaD2L9VoVLryW1sEwpJA7Ruvl0vXIw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(36840700001)(46966006)(40470700004)(2616005)(40460700003)(36860700001)(6666004)(7696005)(82310400005)(40480700001)(26005)(1076003)(186003)(36756003)(86362001)(5660300002)(83380400001)(7416002)(8676002)(8936002)(2906002)(478600001)(70206006)(70586007)(47076005)(356005)(7636003)(41300700001)(54906003)(6916009)(82740400003)(4326008)(316002)(336012)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:06.6651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a26143c2-be10-4371-177e-08db4a4ca621
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
Received-SPF: softfail client-ip=2a01:111:f400:fe59::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

Add precopy initial data handshake between source and destination upon
migration setup. The purpose of the handshake is to notify the
destination that precopy initial data is used and which migration users
(i.e., SaveStateEntry) are going to use it.

The handshake is done in two levels. First, a general enable command is
sent to notify the destination migration code that precopy initial data
is used.
Then, for each migration user in the source that supports precopy
initial data, an enable command is sent to its counterpart in the
destination:
If both support it, precopy initial data will be used for them.
If source doesn't support it, precopy initial data will not be used for
them.
If source supports it and destination doesn't, migration will be failed.

To implement it, a new migration command MIG_CMD_INITIAL_DATA_ENABLE is
added, as well as a new SaveVMHandlers handler initial_data_advise.
Calling the handler advises the migration user that precopy initial data
is used and its return value indicates whether precopy initial data is
supported by it.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/migration/register.h |   6 +++
 migration/migration.h        |   3 ++
 migration/savevm.h           |   1 +
 migration/migration.c        |   4 ++
 migration/savevm.c           | 102 +++++++++++++++++++++++++++++++++++
 migration/trace-events       |   2 +
 6 files changed, 118 insertions(+)

diff --git a/include/migration/register.h b/include/migration/register.h
index a8dfd8fefd..0a73f3883e 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -71,6 +71,12 @@ typedef struct SaveVMHandlers {
     int (*load_cleanup)(void *opaque);
     /* Called when postcopy migration wants to resume from failure */
     int (*resume_prepare)(MigrationState *s, void *opaque);
+
+    /*
+     * Advises that precopy initial data was requested to be enabled. Returns
+     * true if it's supported or false otherwise. Called both in src and dest.
+     */
+    bool (*initial_data_advise)(void *opaque);
 } SaveVMHandlers;
 
 int register_savevm_live(const char *idstr,
diff --git a/migration/migration.h b/migration/migration.h
index 3a918514e7..4f615e9dbc 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -204,6 +204,9 @@ struct MigrationIncomingState {
      * contains valid information.
      */
     QemuMutex page_request_mutex;
+
+    /* Indicates whether precopy initial data was enabled and should be used */
+    bool initial_data_enabled;
 };
 
 MigrationIncomingState *migration_incoming_get_current(void);
diff --git a/migration/savevm.h b/migration/savevm.h
index fb636735f0..d47ab4ad18 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -58,6 +58,7 @@ void qemu_savevm_send_postcopy_ram_discard(QEMUFile *f, const char *name,
                                            uint64_t *start_list,
                                            uint64_t *length_list);
 void qemu_savevm_send_colo_enable(QEMUFile *f);
+void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f);
 void qemu_savevm_live_state(QEMUFile *f);
 int qemu_save_device_state(QEMUFile *f);
 
diff --git a/migration/migration.c b/migration/migration.c
index abcadbb619..68cdf5b184 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2964,6 +2964,10 @@ static void *migration_thread(void *opaque)
         qemu_savevm_send_colo_enable(s->to_dst_file);
     }
 
+    if (migrate_precopy_initial_data()) {
+        qemu_savevm_send_initial_data_enable(s, s->to_dst_file);
+    }
+
     qemu_savevm_state_setup(s->to_dst_file);
 
     qemu_savevm_wait_unplug(s, MIGRATION_STATUS_SETUP,
diff --git a/migration/savevm.c b/migration/savevm.c
index a9181b444b..2740defdf0 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -71,6 +71,13 @@
 
 const unsigned int postcopy_ram_discard_version;
 
+typedef struct {
+    uint8_t general_enable;
+    uint8_t reserved[7];
+    uint8_t idstr[256];
+    uint32_t instance_id;
+} InitialDataInfo;
+
 /* Subcommands for QEMU_VM_COMMAND */
 enum qemu_vm_cmd {
     MIG_CMD_INVALID = 0,   /* Must be 0 */
@@ -90,6 +97,8 @@ enum qemu_vm_cmd {
     MIG_CMD_ENABLE_COLO,       /* Enable COLO */
     MIG_CMD_POSTCOPY_RESUME,   /* resume postcopy on dest */
     MIG_CMD_RECV_BITMAP,       /* Request for recved bitmap on dst */
+
+    MIG_CMD_INITIAL_DATA_ENABLE, /* Enable precopy initial data in dest */
     MIG_CMD_MAX
 };
 
@@ -109,6 +118,8 @@ static struct mig_cmd_args {
     [MIG_CMD_POSTCOPY_RESUME]  = { .len =  0, .name = "POSTCOPY_RESUME" },
     [MIG_CMD_PACKAGED]         = { .len =  4, .name = "PACKAGED" },
     [MIG_CMD_RECV_BITMAP]      = { .len = -1, .name = "RECV_BITMAP" },
+    [MIG_CMD_INITIAL_DATA_ENABLE] = { .len = sizeof(InitialDataInfo),
+                                      .name = "INITIAL_DATA_ENABLE" },
     [MIG_CMD_MAX]              = { .len = -1, .name = "MAX" },
 };
 
@@ -1036,6 +1047,40 @@ static void qemu_savevm_command_send(QEMUFile *f,
     qemu_fflush(f);
 }
 
+void qemu_savevm_send_initial_data_enable(MigrationState *ms, QEMUFile *f)
+{
+    SaveStateEntry *se;
+    InitialDataInfo buf;
+
+    /* Enable precopy initial data generally in the migration */
+    memset(&buf, 0, sizeof(buf));
+    buf.general_enable = 1;
+    qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
+                             (uint8_t *)&buf);
+    trace_savevm_send_initial_data_enable(buf.general_enable, (char *)buf.idstr,
+                                          buf.instance_id);
+
+    /* Enable precopy initial data for each migration user that supports it */
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->ops || !se->ops->initial_data_advise) {
+            continue;
+        }
+
+        if (!se->ops->initial_data_advise(se->opaque)) {
+            continue;
+        }
+
+        memset(&buf, 0, sizeof(buf));
+        memcpy(buf.idstr, se->idstr, sizeof(buf.idstr));
+        buf.instance_id = se->instance_id;
+
+        qemu_savevm_command_send(f, MIG_CMD_INITIAL_DATA_ENABLE, sizeof(buf),
+                                 (uint8_t *)&buf);
+        trace_savevm_send_initial_data_enable(
+            buf.general_enable, (char *)buf.idstr, buf.instance_id);
+    }
+}
+
 void qemu_savevm_send_colo_enable(QEMUFile *f)
 {
     trace_savevm_send_colo_enable();
@@ -2314,6 +2359,60 @@ static int loadvm_process_enable_colo(MigrationIncomingState *mis)
     return ret;
 }
 
+static int loadvm_handle_initial_data_enable(MigrationIncomingState *mis)
+{
+    InitialDataInfo buf;
+    SaveStateEntry *se;
+    ssize_t read_size;
+
+    read_size = qemu_get_buffer(mis->from_src_file, (void *)&buf, sizeof(buf));
+    if (read_size != sizeof(buf)) {
+        error_report("%s: Could not get data buffer, read_size %ld, len %lu",
+                     __func__, read_size, sizeof(buf));
+
+        return -EIO;
+    }
+
+    /* Enable precopy initial data generally in the migration */
+    if (buf.general_enable) {
+        mis->initial_data_enabled = true;
+        trace_loadvm_handle_initial_data_enable(
+            buf.general_enable, (char *)buf.idstr, buf.instance_id);
+
+        return 0;
+    }
+
+    /* Enable precopy initial data for a specific migration user */
+    se = find_se((char *)buf.idstr, buf.instance_id);
+    if (!se) {
+        error_report("%s: Could not find SaveStateEntry, idstr '%s', "
+                     "instance_id %" PRIu32,
+                     __func__, buf.idstr, buf.instance_id);
+
+        return -ENOENT;
+    }
+
+    if (!se->ops || !se->ops->initial_data_advise) {
+        error_report("%s: '%s' doesn't have required "
+                     "initial_data_advise op",
+                     __func__, buf.idstr);
+
+        return -EOPNOTSUPP;
+    }
+
+    if (!se->ops->initial_data_advise(se->opaque)) {
+        error_report("%s: '%s' doesn't support precopy initial data", __func__,
+                     buf.idstr);
+
+        return -EOPNOTSUPP;
+    }
+
+    trace_loadvm_handle_initial_data_enable(buf.general_enable,
+                                            (char *)buf.idstr, buf.instance_id);
+
+    return 0;
+}
+
 /*
  * Process an incoming 'QEMU_VM_COMMAND'
  * 0           just a normal return
@@ -2397,6 +2496,9 @@ static int loadvm_process_command(QEMUFile *f)
 
     case MIG_CMD_ENABLE_COLO:
         return loadvm_process_enable_colo(mis);
+
+    case MIG_CMD_INITIAL_DATA_ENABLE:
+        return loadvm_handle_initial_data_enable(mis);
     }
 
     return 0;
diff --git a/migration/trace-events b/migration/trace-events
index 92161eeac5..21ae471126 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -23,6 +23,7 @@ loadvm_postcopy_ram_handle_discard_end(void) ""
 loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
 loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
 loadvm_process_command_ping(uint32_t val) "0x%x"
+loadvm_handle_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
 postcopy_ram_listen_thread_exit(void) ""
 postcopy_ram_listen_thread_start(void) ""
 qemu_savevm_send_postcopy_advise(void) ""
@@ -38,6 +39,7 @@ savevm_send_postcopy_run(void) ""
 savevm_send_postcopy_resume(void) ""
 savevm_send_colo_enable(void) ""
 savevm_send_recv_bitmap(char *name) "%s"
+savevm_send_initial_data_enable(uint8_t general_enable, const char *idstr, int instance_id) "general_enable=%u, idstr=%s, instance_id=%u"
 savevm_state_setup(void) ""
 savevm_state_resume_prepare(void) ""
 savevm_state_header(void) ""
-- 
2.26.3


