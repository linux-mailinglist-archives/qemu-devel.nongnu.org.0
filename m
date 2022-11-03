Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E581161841A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwb-0004RN-KS; Thu, 03 Nov 2022 12:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuj-0000vI-VH; Thu, 03 Nov 2022 12:18:01 -0400
Received: from mail-dm6nam11on2062.outbound.protection.outlook.com
 ([40.107.223.62] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuf-00088Y-Rv; Thu, 03 Nov 2022 12:17:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L38ghwLVKP7Pb8fnqT9TbK/YZiQJnmB/zxm5QIrTvPngI8OASi+Fjbgkc3E5fX9vYOHJiE85E+HtZ+0UyMQAFw4RrhZe4pYXZdT3Tydd+BHd/LLG0mRxPjYhWOvoQX/kvfLPr5aB+l7a8KV/tR7b84vkQYOX3npbW2OLZRoaYiy+oAPGahP6w8YQQo9RRkHqtk7pGo7oDz2DdJpnrne1Yu3Mb5ZZWFAFx4x9cftOZyaUUuKgJxluMzQ7CAt08fQw07KSJRDgPeCiKGmYV7KO1JqmoP8RwafNBNBAUGOUlU9TsupHEk/vqyXVJJHMGdm+0myZJN6LZq5WlO6WlBNV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1D7d3pOPMGY/tNHEs+LTS6neD46wPx5fhmpsdXfnFXg=;
 b=nlHGz062vUEwOJl8KcMnXF+FYvgW8zUVBURmPVQ/dlb0kLMYQgN+IE9U3WVOqiFJXGOTSGepb1r84+RGzrbK/y+vMVsA/2kc2I7LSPIcQZxl0IWf9DU/RU8J0+9TJ11iOvNrfOOS16R8sYflsBXaEG0niJEAV3KV1eKLyI5RvJo6xBZjuVopajiWzMt058VJKTw5eVN5UFU5OtodzBjOlCuYTB5JK/mb2vhQG9tNVIsPKtpZUVzY5px+lgLx4WmBAAFj7Mtjwlv97RUBx060+Zjn8xGc0hKI/eotWGJcIvXrHYYiC6F5di2itaCncssfK/KSAOR/ZQeE+pBZtOMRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1D7d3pOPMGY/tNHEs+LTS6neD46wPx5fhmpsdXfnFXg=;
 b=fZIL281It1dpBNeXSEApLYX+twrIY3Au23HntxM5k5xi9IFofGObArOoLPZRQ3MBmvK4sX/lv88VAF2hvTjwQgf7tmIn+Zjl++mbF4uXkAqstOhJrPtT6+zXb2F15OFP7tYIiYOfRvolYQ2wYLE/yK4L+oIRW6RaEUanTCamexa2tx6d4o2KNEHzqdvLLXN4olK5sXR3JPejsUz/ABNi1ixxR2QaoAn1+gHkrMfAB/ABRbo7+xPsr3h4UV58ApNIWGGqd9u8q0Hgg37iOECtYrSWBBOhucAXUpNYkahzjA6TMDgP9f9CE5wNCPYjsk7sXX1VsUmAvbQJGQab+85fPA==
Received: from BN9PR03CA0895.namprd03.prod.outlook.com (2603:10b6:408:13c::30)
 by LV2PR12MB5989.namprd12.prod.outlook.com (2603:10b6:408:171::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 3 Nov
 2022 16:17:45 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::e7) by BN9PR03CA0895.outlook.office365.com
 (2603:10b6:408:13c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:45 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:38 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:17:37 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:30 -0700
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 09/17] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Thu, 3 Nov 2022 18:16:12 +0200
Message-ID: <20221103161620.13120-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT031:EE_|LV2PR12MB5989:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d7439c-9720-4e82-3b5c-08dabdb6f113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZedL3krLN0ItulejuEM3P3xkjFVbJOpQBIehKRy9Jue2s7QFEItkDaFfLR+imkem63ax+ii6K8xBaOKTyJrwHIyBfl8lOXdxh1juKOD8e9YfbuwKU3b8XkDdaeUEEheVSeYC53ZH6gI2v/H21W4MNftpDhIcf943xtzkopj4r8fWGzsFVhLzxPcdSJUX8DfzT4T5Z3CjSWdFj24Dv481+FxtuuGjXKUOwOOelRCr56rqL8RaE3ThH8zdj4CmRtOEAsQ1nnUQMAXNssnCR4JyoaFNbsoG2FEy9GLx5vBlZ6Nikvs3DKVepIVk5KNzEp7kLWcuN/+2Fuf1uyJsSSrAjY34jdBuZQ9+MAVkHEOqsW1n791vG4t/9w4hwHFNfrl9eqYXCmRT/F/tBxbQFVLKABpZ3bCQXtHg1x1yzbhVts7QKMoSL0ieZilUY+MfPSPA5D6HlmUgR4fY6GsvZaaRLe9OkfA81qHNIyE9+LL2bdUPdhzHDthfAIn8rMAb4jjt5i4hUodeGYPapz6sNmF+o+Axmv1WUg0Wp8do//LxTE+9dydRX/rNFLyWDbCDc8rWzVQwn16AaK30lGvX9pNozsmpYqLKNqURtPwb/CcBtxF+lgaguQrSPI+ivRzpjNye+5O1yXTYCvcDmRUoo9LPOLaoM5Fs4+Lg1RSn+bBR8TJDteW7mStxlSDy1+bYwLg2oqAaML2DGLpssmfRlnUlK9PsuFMIJ7CilkqVYM1C15j6K+n2hrT4gr7We72N9JoQRwmtF4hkcTIEmjFOdEO+ow==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(356005)(7636003)(83380400001)(26005)(8676002)(36860700001)(478600001)(86362001)(40480700001)(426003)(5660300002)(7416002)(2906002)(47076005)(1076003)(6666004)(336012)(186003)(82310400005)(7696005)(70206006)(54906003)(316002)(40460700003)(6916009)(2616005)(4326008)(41300700001)(8936002)(36756003)(70586007)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:45.0738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d7439c-9720-4e82-3b5c-08dabdb6f113
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5989
Received-SPF: softfail client-ip=40.107.223.62;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

vfio_devices_all_running_and_saving() is used to check if migration is
in pre-copy phase. This is done by checking if migration is in setup or
active states and if all VFIO devices are in pre-copy state, i.e.
_SAVING | _RUNNING.

VFIO migration v2 protocol currently doesn't support pre-copy, so it
doesn't have an equivalent VFIO pre-copy state like v1 protocol.

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
 hw/vfio/common.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5470dbcb04..47116ba668 100644
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
@@ -499,7 +502,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
-    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-- 
2.21.3


