Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995AE6F31D0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:05:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU7d-0005zI-15; Mon, 01 May 2023 10:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU75-0005eM-LN
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:48 -0400
Received: from mail-mw2nam12on20626.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::626]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ptU73-0006hI-B4
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:02:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGd8yY2g8D5gD8WU7nIHBZsbfPJAYiABlsiEIXEyjJbx9u2iFPME+dy6C6xnD6n0Xz1WeeWl8nHVnDK0xBvVDuvepKQ3Mv4mY28n1dCsfBRuSdYgdiE8OgtbvgL/WKIjQbFsGmGk0lpc3yz1BSujb1RzDY5fvbA/KEzhpreUFUz4KbuN93nKEMzUVUT0/PegaWnsO6T5hAvz2g7nBRVXhgvUV15M0516woV6Rrw6fQik/owJbmdUQbciZbC9pYf/zMMeF1bgVUsnbn38yKZ+fvyFVOv9TAnIlDyGf4X6eEaB+0Hlo/SFp4CfwhDNA8fEtKclA1tLLzHPJ1WIaq5Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mei7l4emdoKlPtLh2wmucZw9iYajU0TQamA9f7tTGt0=;
 b=fDAgophXO9L9uA37oEWk8uEjrmGozZWsuG4i1QoghkExFprZh2iRLyvwnOks5o76TuBkRweMz7WtpTSRwppHpZcJulSTHb3kWkDgJyYUnftDK6RMmbP4les0e3lPPYDpQqBjP9rLcWJocJMLZwnB2dWDlpJRTmxx3pCEXEjsODHMOWqWMrTp1MXVFQvabYr7CBjrNzcz5p+74k7ER8N4qzFf5Eb2qwdY9uyRafH87LiToPpQND4ThJ/akyPlsGnWvoZXCncuzjfQCaXKYzMIregGYSpoFlKKUMXDXrk0SEyxTu1f9Shk88GC/1OVB9fZn+5NsOlE6RKWw9Ik3PQJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mei7l4emdoKlPtLh2wmucZw9iYajU0TQamA9f7tTGt0=;
 b=cV0fRBdMGGH5IhWR8dOlFCbccvUJz3BeI4wecqrM8n0I22LHO1dr6jz3Nze7rtBohLCn1DRYBhgo+qDP5VKMbhU+FA2SP53/I6Xxn4uxQy3FaTpFt6HfWj6+oKNCdMyHUbixcojXUzJ3INr740ZJJnI1IuwFt8/+UPZ7A8nK6sDDDEqxUvoKn3Fu40H5IJ0G1FsmL6vEe22Jg3fw5TITWTkcnFInrbS09ypTm44O9/yRf8oVYXkBbwBWo9YqX/3j7R6Gy6UDGYe+d3yaXY7hcy6L6QU7D1+JI0f01Kt//ySj3Z9ERiu2gXmG634dmNOC+EuWZMRhku4hrdk2DYGlAQ==
Received: from DM6PR02CA0052.namprd02.prod.outlook.com (2603:10b6:5:177::29)
 by PH7PR12MB6587.namprd12.prod.outlook.com (2603:10b6:510:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.28; Mon, 1 May
 2023 14:02:38 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::97) by DM6PR02CA0052.outlook.office365.com
 (2603:10b6:5:177::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 14:02:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 14:02:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 1 May 2023
 07:02:26 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 1 May 2023
 07:02:25 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Mon, 1 May
 2023 07:02:21 -0700
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
Subject: [PATCH 8/8] vfio/migration: Add support for precopy initial data
 capability
Date: Mon, 1 May 2023 17:01:41 +0300
Message-ID: <20230501140141.11743-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230501140141.11743-1-avihaih@nvidia.com>
References: <20230501140141.11743-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT048:EE_|PH7PR12MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba094be-2c0b-4695-dcbe-08db4a4cb8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6Rd8mWWWykI+mjMJwbXr1pG0cNqqkrOwJPRXVqX/AZt4/jNMl2vb0NSZNMKOkpuEwMp3trEx/A8nsU7zqg6E9X/OMPgjamzfbRGtJaSHJMZDOX3ncaGFn+L+PPIgsRIJBBAtw54TI1WDCQTid3TxlZVoP097wYKExCUL42bzmLnM/uxpO4hQ3/vjPz/25NuyLVsJTrgjjJIhEv0iIvJ48RUVj2aruYzuazO/7IPLhelCxvqrWk8Ua7TYRU8U/WrzaLWqfaz8DpFOg5iWWNk1Li2IaAdUZ38uMv4anTlZ10H4L2YK3EZcTkPvLHVAzrwBTi/Vm5uA5rMQJ6PIqFXW4vpqkajymlb+jiCt0hp980OxdpoXJHClfh4NuHOho2XTdVyGt3oY90E0XCdgk8NxmFJU/0TpCHRboVg+7ChBNb7EJtV+8FsUxa9/e/qd7KEKcM6JVtinFSEzfqP3qOHOfQCgLTNYYbjf+095gcKcrWpHi46yENiIy8eYbX+vo8vnbx/1FdLh+b6N5p8JUsu1eUx5OEszFW9CQJIbuVOVSKjmglYABczl+ceY0zgqAESvscGNr3xLwUqIrajzK7An6Tw41IZZvQMOnz8pNrOWiftyJIg1mgwxijaQ+H9dO/fY6WYClQvFRoP9CCOmkpu7KG/c9JNzYUnl6u6znZJfZFY0abT6iZjsUsZEMe5fMk2MHUQagQ+b7aJ9vX+ANKqWw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(7416002)(5660300002)(356005)(7636003)(8676002)(40460700003)(82740400003)(8936002)(41300700001)(316002)(40480700001)(36756003)(82310400005)(86362001)(2906002)(36860700001)(186003)(2616005)(478600001)(83380400001)(6666004)(7696005)(426003)(336012)(47076005)(26005)(1076003)(54906003)(4326008)(6916009)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 14:02:38.3134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba094be-2c0b-4695-dcbe-08db4a4cb8fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6587
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::626;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

Loading of a VFIO device's data can take a substantial amount of time as
the device may need to allocate resources, prepare internal data
structures, etc. This can increase migration downtime, especially for
VFIO devices with a lot of resources.

To solve this, VFIO migration uAPI defines "initial bytes" as part of
its precopy data stream. Initial bytes can be used in various ways to
improve VFIO migration performance. For example, it can be used to
transfer device metadata to pre-allocate resources in the destination.
However, for this to work we need to make sure that all initial bytes
are sent and loaded in the destination before the source VM is stopped.

Use migration precopy initial data capability to make sure a VFIO
device's initial bytes are sent and loaded in the destination before the
source stops the VM and attempts to complete the migration.
This can significantly reduce migration downtime.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/hw/vfio/vfio-common.h |  3 +++
 hw/vfio/migration.c           | 48 ++++++++++++++++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index fa42955d4c..dd3b052682 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -69,6 +69,9 @@ typedef struct VFIOMigration {
     uint64_t precopy_init_size;
     uint64_t precopy_dirty_size;
     uint64_t mig_flags;
+    bool initial_data_active;
+    bool initial_data_sent;
+    bool initial_data_loaded;
 } VFIOMigration;
 
 typedef struct VFIOAddressSpace {
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 980be1f614..23f4f1f8a5 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -45,6 +45,7 @@
 #define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
 #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
 #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
+#define VFIO_MIG_FLAG_DEV_INIT_DATA_SENT (0xffffffffef100005ULL)
 
 /*
  * This is an arbitrary size based on migration of mlx5 devices, where typically
@@ -372,6 +373,8 @@ static void vfio_save_cleanup(void *opaque)
 
     g_free(migration->data_buffer);
     migration->data_buffer = NULL;
+    migration->initial_data_sent = false;
+    migration->initial_data_active = false;
     vfio_migration_cleanup(vbasedev);
     trace_vfio_save_cleanup(vbasedev->name);
 }
@@ -447,10 +450,17 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     if (data_size < 0) {
         return data_size;
     }
-    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
 
     vfio_update_estimated_pending_data(migration, data_size);
 
+    if (migration->initial_data_active && !migration->precopy_init_size &&
+        !migration->initial_data_sent) {
+        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_INIT_DATA_SENT);
+        migration->initial_data_sent = true;
+    } else {
+        qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
+    }
+
     trace_vfio_save_iterate(vbasedev->name);
 
     /*
@@ -568,6 +578,12 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             }
             break;
         }
+        case VFIO_MIG_FLAG_DEV_INIT_DATA_SENT:
+        {
+            vbasedev->migration->initial_data_loaded = true;
+
+            return 0;
+        }
         default:
             error_report("%s: Unknown tag 0x%"PRIx64, vbasedev->name, data);
             return -EINVAL;
@@ -582,6 +598,33 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
+static bool vfio_initial_data_advise(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    migration->initial_data_active =
+        migration->mig_flags & VFIO_MIGRATION_PRE_COPY;
+
+    return migration->initial_data_active;
+}
+
+static bool vfio_is_initial_data_active(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    return migration->initial_data_active;
+}
+
+static bool vfio_initial_data_loaded(void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+
+    return migration->initial_data_loaded;
+}
+
 static const SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
@@ -594,6 +637,9 @@ static const SaveVMHandlers savevm_vfio_handlers = {
     .load_setup = vfio_load_setup,
     .load_cleanup = vfio_load_cleanup,
     .load_state = vfio_load_state,
+    .initial_data_advise = vfio_initial_data_advise,
+    .is_initial_data_active = vfio_is_initial_data_active,
+    .initial_data_loaded = vfio_initial_data_loaded,
 };
 
 /* ---------------------------------------------------------------------- */
-- 
2.26.3


