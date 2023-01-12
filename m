Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7E666D06
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:53:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtK9-0006OI-2h; Thu, 12 Jan 2023 03:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJC-0005n2-S5; Thu, 12 Jan 2023 03:51:41 -0500
Received: from mail-dm6nam10on2087.outbound.protection.outlook.com
 ([40.107.93.87] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJ5-0007bb-KD; Thu, 12 Jan 2023 03:51:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kga0OF3pB7jJyiDQS0a6VYwNTKo1P7F2ODWOemp2qavYhXYO+XXlhmqrhpjzkQQyZRmoOKSxLWSXg0kfWNfdME0BrnXNlTrqwJvLGbo/LcJKZRhm6e0WXJP+JGzWFkoBjRSyajFbahUz3YNvV9HD8kdrQfY7tPWSOR3qFHnVBY4FrYIMKGZVULwUQkfdntiMg7RfvVEVuDYGB6CCsqYCYoL0st7ZwVI1N3unmJZ+F6zdFVq36l0pQeQ6X3uGP+oVDef8uRVz5ZwnwwXZ7YMxF50WfamD7w39SgeekVZoxizn5yYSAb8hAEFfmBfYNJXhxM3B3nI/8WZRbS2cOFPzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bben1VXLG/RMcQQ8cjrMqxVhmeSsSOy123chhAe9p+0=;
 b=gS88biQgDJUEz2pGt/Sl9B9ZbmcWSwRPYgErpbiUuvXX5u5wZ0wJxb2/g0lHwEU6+/O0E/4VfRB4AGXRG1RGnGY9KRgMPgJXFaMD4+b3WTQpk0suS86TLY6cTMwJcLOyj+ylpiZxLZDXFlu/rgG6zWxIG+CoUTXxoigvlaPN50D0CscrShIfYyyMA1Ucy4JCPoQVosuGrL/H2t1MG6kW/Wp3uvKFQ0xKs+uZvBOTPsH+Kruw0AYlD8YMjYZ1rEG1ekrITbNxIN9s4pqyjF6N2IMVtDEYXgdYBu+xCXktcOhUlt2PTaL9wP/fQVkQfjJdGRaVQQfI0k0J/J8t7fTSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bben1VXLG/RMcQQ8cjrMqxVhmeSsSOy123chhAe9p+0=;
 b=eI2a2qC0Y/wbsLBNg/rtN8j2e6J0tg8ITYSOd4BSBrSblVXX0sGyE9xbMtE6HhBFs5JlXA1NPco/VZiFpUnJTEJ29yosNZCiufx1OA3wfwZaQjouUeBY8zxnnPRxlUDMyD8RJQvV7D+gONgzoIHASXkZ1tGp6igg3MYDTDHRBehei3Pyy7uBigFMIHJU1qQL27vWGDypesKO6AY757CVTSQtJX532k5DUtN6JiBYBvKcC8K1voaLuZlQT0hsmA4AsK5j+pq/fCUaDBNPKaqwIaq0D9KDawOAdxa4WRz35XUWtHFt/gvKMNA9uw/vUeWwcuu0lLNkE7EE6GK9CR8Y7g==
Received: from DS7PR03CA0004.namprd03.prod.outlook.com (2603:10b6:5:3b8::9) by
 DM6PR12MB4499.namprd12.prod.outlook.com (2603:10b6:5:2ab::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Thu, 12 Jan 2023 08:51:24 +0000
Received: from DS1PEPF0000E635.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::42) by DS7PR03CA0004.outlook.office365.com
 (2603:10b6:5:3b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E635.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:51:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:51:08 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:51:08 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:51:02 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v6 06/13] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Thu, 12 Jan 2023 10:50:13 +0200
Message-ID: <20230112085020.15866-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E635:EE_|DM6PR12MB4499:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1fc7c9-2a13-4226-80a8-08daf47a2f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smNU9sMz+d4yqZXimxo6aqWdzz0KVUihlZ0wgh59LhVwulvvvkjzEu6+4ZKiPN/tfb5LaC/ieDp+/eYgNAknkPuo62kBgcVE9+l86WvqlB0aWkykvMh02oqt3Cs++TEa6bqUVLy5JYmLfycEmKNOsFlL32oLM8+KXN8Owjp+hZnHYOOU5DMTZgMe+0Vvdcbe2hwzkn25A6GOpHQp6UujeOUKtirHdAjyYOX3txqqagN96f8aAStkpM1BIIRWdmKE7nMaoHWAklOsWT8sXNT6oJWhVxBhC3ezvkZv4s7OR20kAalrahOb6XQsWyrxAiiCvAeEKHPpp1dWtVR/522PkJLyH92ryWKXlC6vPcyReW5Y/1yeFiuIDclBx0yfKXuR1oJ56hvwcB5VMO+CgXddwG8iSvblyKGWf+V61KHUoNjjVkY+9ni22CZUO5MW6Y3Wdx/OJe1xoabuzgToEu6Kb8a1luwxGCPaXSDHFiSdRojATO7hMNzsDMHYImWydSkwdDC/g4qAd+4hL2zvDXJmF06kP3MvUbN2cXJNjB2Axsv/nQcumZXyvaVP6lSupvsdh2w0wWH7tAe6Z2uSTMO2TlkXb5fVCecCJcyZo/b0Nt0wE12FBF7C4AoZVI1NeIPgpvAiqBLKSc1zo2zwNJouyVMUR48nKu6ORqfd15dJSFNWwQzvRTFWuG/IywnVxUvzvfO4NrDlw8lB9rNDhxql3g==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(478600001)(82740400003)(41300700001)(356005)(7636003)(47076005)(1076003)(86362001)(316002)(54906003)(2616005)(40460700003)(70586007)(26005)(336012)(40480700001)(186003)(7696005)(82310400005)(426003)(4326008)(36756003)(70206006)(5660300002)(36860700001)(7416002)(2906002)(6666004)(83380400001)(8676002)(6916009)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:51:23.9442 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1fc7c9-2a13-4226-80a8-08daf47a2f2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4499
Received-SPF: softfail client-ip=40.107.93.87; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

vfio_devices_all_running_and_saving() is used to check if migration is
in pre-copy phase. This is done by checking if migration is in setup or
active states and if all VFIO devices are in pre-copy state, i.e.
_SAVING | _RUNNING.

In VFIO migration protocol v2 pre-copy support is made optional. Hence,
a matching v2 protocol pre-copy state can't be used here.

As preparation for adding v2 protocol, change
vfio_devices_all_running_and_saving() logic such that it doesn't use the
VFIO pre-copy state.

The new equivalent logic checks if migration is in active state and if
all VFIO devices are in running state [1]. No functional changes
intended.

[1] Note that checking if migration is in setup or active states and if
all VFIO devices are in running state doesn't guarantee that we are in
pre-copy phase, thus we check if migration is only in active state.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f6dd571549..3a35f4afad 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "migration/misc.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -363,13 +364,16 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
     return true;
 }
 
-static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
+/*
+ * Check if all VFIO devices are running and migration is active, which is
+ * essentially equivalent to the migration being in pre-copy phase.
+ */
+static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
-    MigrationState *ms = migrate_get_current();
 
-    if (!migration_is_setup_or_active(ms->state)) {
+    if (!migration_is_active(migrate_get_current())) {
         return false;
     }
 
@@ -381,8 +385,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
-                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
@@ -461,7 +464,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     };
 
     if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+        vfio_devices_all_running_and_mig_active(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
@@ -488,7 +491,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
-    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
         cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
                                             tcg_enabled() ? DIRTY_CLIENTS_ALL :
                                             DIRTY_CLIENTS_NOCODE);
-- 
2.26.3


