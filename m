Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82968BCDF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0g8-0003vL-Bs; Mon, 06 Feb 2023 07:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0g6-0003hu-2Q; Mon, 06 Feb 2023 07:32:58 -0500
Received: from mail-mw2nam12on2061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::61c]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0g3-0000Z2-Nt; Mon, 06 Feb 2023 07:32:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oT10MgU12Jj2RbQqmloqB/hypnftWZtkCaX+3qnBF1qkIPrTT46zId9hCQaHnBlvjXzBWnk5lsMLtKidABWNuR4qbtseTpuhu9bHCe/XLlXIZxbT2OSamJrgHrpVmbW/Hzye5MgEYd0n626DKVR5WmlGzIlgP+aiUfziQ4d+iMZzhARAeiug/VOOtlKJjcR27XRmuiQX/AzZIMOFQV2Ndz2bWkItqQEZU1/D17kOez6JcvwCkqTkMa6OWQrBqY1GPxpadco1vYzj9AZc8UcqpOR+pan+jiqBRX0ZhqBUniE+RI6JpcnIwjlrTpxSB8fjfHGnxLiwjeLV1AB3NZufcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9muwuHUKNRpSuMJd4KvW//7z9qHoDEToDY35/BiWaY=;
 b=gK49D6CUxZWu/QhXVwtXgOs1s6sqGfgmCgVyk0oloD4QEMXt3aWOrPpzafjs6j/t0KwWHsFRAIxjnzUZ8fqXm8gVAvbYMOnRsfmqlV88vR0+W8ZV0ATp62Or7YzDh1XakhS0uloSVgqrvSpREmf54oAwr3U0+niTvyEU2B4DI668zujS7cRHxpILOSAps2h+GAufQhK6bms++ClYvrWw1kvRu4z9QnwNbBo22T/gb3pMUVH3HWwPKcoT8bdvAsLer1mNqifP509ys//AP/O8ytjcByloC96Mb7yLXXLPTMBhbHFLbbu7N5c6/X+lcVlR0pUlPt2ISwu4P1+vR6S45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9muwuHUKNRpSuMJd4KvW//7z9qHoDEToDY35/BiWaY=;
 b=Nv8TAamYQv3xbNL9H0MUSnzjH6OIzna0e4piG6BRDQsPC/lkjdy1uyJJfay8f+4yceDelXIMhO5YU33CDxhAcqJcVdguyW/9OfmDftWWfMuy5Ph4dNju0/YD7f5PriyMjsAAArCO93pgdApT0xYOmVPgEnwjUZb0gPJ/ibwxpleCvko1ZN4ryuDTsHl66/w7m7HbTkAkQoTWy6tr5EgQj9d9jK1u3b4FUPHURALgx+qucX4UNp+IK8dYYA7rEbqs4gZM4e9Aq/rfndjMRNY3FXIJyjqyZATUsI9JUqcEVl1QG2DyosAuxUKDkP6rwuRHJx9jiscz4sztEHe++6ZK0A==
Received: from BL1PR13CA0141.namprd13.prod.outlook.com (2603:10b6:208:2bb::26)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:32:50 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::8) by BL1PR13CA0141.outlook.office365.com
 (2603:10b6:208:2bb::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15 via Frontend
 Transport; Mon, 6 Feb 2023 12:32:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.17 via Frontend Transport; Mon, 6 Feb 2023 12:32:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:33 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:32 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:32:24 -0800
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
Subject: [PATCH v9 06/14] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Mon, 6 Feb 2023 14:31:29 +0200
Message-ID: <20230206123137.31149-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|DM6PR12MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4e820e-4c74-46cf-00b3-08db083e42ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8+ypF7snNbp++6EqyJnAudD1CZD4Qia7XzJei7XyEbROczmBN/LvIFSjrfTjicZkpjYsnevpzWFhto5yEHVJjXIW5SAwQFLFMN1Zo4G6TetAMmPvlKs1hn9JoQgdGJ2a3YNFlKcl7i8Pto9s17tp5I0jJhhTCKOsWPMyzjdPYh5FCz+oI907BSCE/BjPHcl/nsoCtOG5fW1SrF/JtXRLZoRfXXkigiMDphjTU1JMDibmV25lg0t0PNKboqfcBuzr77/9zb2lNgAzfnVFoBJUR8kqtI4/hg4KZFpEsK0EkDRxAti5V0HZomMir7EP+8mK2kN9PE6G8Wh0IwcqsTYcmsT5vrIbuKZQGXlPS6GGAH+Hu8go/lM2erViq/b0eABImDtHwuRjiZajZX9N0smkVVHnEBLIPac0tV+C0Beu2VrMWFWAkx1m/CPmqhb2Zr0rv0xE8Xa4hg+rMnUxd1pxAnKuRnR4o34Yzj+gSjprLAxXJgdXgbzQehI/RE4WDItIZGDpOBvGN3cxx+4bYpQ+BdFvqOWUbulSXXiO2dmBlTJBiy3ERDkVz1NWVQ4sw17AMhV4FmHruszcE6n0g6CoSxajEqkXCIUSVSX5T9t9Rqj04o7yZEPC2erUAANSGpzow4AFjl7enhg9AuwonDLrpOgVQQ613xbdeM98/K++88nYtLpriMDtTk3Vcc5v7ZW2MXz/vz3IF6mINiGCW7Rww==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(86362001)(36756003)(36860700001)(7636003)(82740400003)(356005)(316002)(41300700001)(8936002)(5660300002)(6916009)(70206006)(54906003)(4326008)(70586007)(8676002)(82310400005)(40480700001)(40460700003)(7416002)(2906002)(83380400001)(336012)(66574015)(426003)(2616005)(47076005)(478600001)(7696005)(26005)(1076003)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:32:50.4849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4e820e-4c74-46cf-00b3-08db083e42ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::61c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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


