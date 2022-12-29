Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BB658C0A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:05:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqib-00078b-Uw; Thu, 29 Dec 2022 06:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiZ-00076t-7d; Thu, 29 Dec 2022 06:04:59 -0500
Received: from mail-dm3nam02on2085.outbound.protection.outlook.com
 ([40.107.95.85] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiX-0006WA-Fi; Thu, 29 Dec 2022 06:04:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/K2APIvHDzSj4oc60ExqIJe9bOSUd2QSkyMy0HxHWlSE5d+XC1E+tjt9wtinJFqDNzLEVE+sN5KWn5HrBn2svROVb0C+Dlu4IynGPRcghnRAIbVXtJGo/09X35IWJyuNZefPIS6QUVm7TplfaOUs4PD4DHBSSerkaUXdUgBFciLtrIBtcbGdweQ0LxMLDbMBTXq/hNG09BFZUMr7LZ1STWrvwB9VApw1Lmtezyw7L0+BSBfTgtwcLlbWmByA+yZ4jCShBouD7aPsGBdkkWe7p8aA8yb3qMy15VEn/rRA7V5KvLRgF3fgNpTTS7VC71gVwHonOXY1xyfd1Ezm8cUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMUTneDX00Am4uPOHJaEs/D16Sk+RJ172M1/EeGTLbI=;
 b=JQJ/xqZsDXQU1rpqKrHrFY12I2GgT0AB3ZPAyolgmdJwA4woXsMtEtFKeBhIoIZxgezHzvRGag6o0nMJcvTXXDt1o0cLlOeqRKN1mxJxatUsJ3wBcTJi1ccULHPDa18huv23sMYnmws4dCp6nYxMyiqEuoIVkx7pd84JvbyrWlRKnw/6IjX2UdyzCkgCWu7nh4Xfex9smB6W0NI+QZSZENlawyCMsszexKLWiZsMbz90xs20YReG1odt3IiGD0JvVHzh2t3gOW5Z25SXnyqwAVEj2ydZcCFULHr2FuND5fVnToBXQDVIroLuVkiH5xZwgJWOOQ7h3QP3b3QXaNzlsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMUTneDX00Am4uPOHJaEs/D16Sk+RJ172M1/EeGTLbI=;
 b=N7VQrwsAGW7vpAx/CsLmB5w1lUpqaVnzncvAsMm6zQUOi96aAzu0+1V3I+rYfamrZiWan4oXhcslpJ/KdOJ7o92+BZWGoq0p5n2Lf9/JFuxYUJtJORIIjjvK2rEENk2NfLQ6ZmtUdsbq4gWKFxlIeqHFxOY9vpksoG5D8tTuR7MUsTFynd70J8TVLaFzAKDmoy5tA966h4zLOZBn3r2PVIzaslsOmX6JTnOBloN0bu37qqAGVoEtPhTxWMLsg7AKMC5PD69RvDajnvBCA6Tyj/ASdg7/xA+mmoVGnPVvnZ7E7gAQ1qNIdZexY7A7oL4mRt8ndzX6C3afyWbjUNo9jQ==
Received: from DS7PR03CA0186.namprd03.prod.outlook.com (2603:10b6:5:3b6::11)
 by PH7PR12MB5998.namprd12.prod.outlook.com (2603:10b6:510:1da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 11:04:53 +0000
Received: from DS1PEPF0000E646.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::b7) by DS7PR03CA0186.outlook.office365.com
 (2603:10b6:5:3b6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E646.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:53 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:47 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:46 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:39 -0800
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v5 07/14] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Thu, 29 Dec 2022 13:03:38 +0200
Message-ID: <20221229110345.12480-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E646:EE_|PH7PR12MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9927b8-5d1b-47ee-b281-08dae98c8344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJFkLi9fx1642OrNhxJyCZiBEBbFnHgjmgHc3jN835GSU+FlUrobx0IrFjiKNdIZyCuF9tdWs33wr14RO26h85USK6wDjnORPe1ZR117sxVivtKQe9tYdegdeu0+A5xMqd9sE/y87vi1xG0Z57f97McmsdZGPeJ2edBlq8Nn97yl4SlOcvlpaRI8BtATc+I0rMotmMYY/YEbjRyOGjimRzT9OA0bueQWwNHIuZSCgJZESoi2pPr8DU4agpxwd2IQEM0zvC3VLoLLFa2El6DZ4YgiWCa+YpXP/Z7+qcxezmsCjHENV4w2k28nch4J2a0JLelRBIc2OFV16+wY/EbWu8IBwlrOl+tRexoAdmo4/iIoCEYLxME3sq5LVLBsT1kuNdh1NgdVyDmVEMlQnc82iZa7tzvPHCy28mCt+DgcE0KfRcLFovfz6IG94dpCovcvQMjtl+gLpmkTFXRr674DfqvfPrnKwC0iS9HfBfjQDAJ1Tj8eST785oTejRDV0/P4d91LjRfUTUxX4vrh7CWAjDXe6HpvmubgwSc1LcCwxibKlU/GsbL0/3w0etcbGVp2hUj8pVDhSKBhogHkTEcCENqppzBeXoTGbq3cMKrClDzRBEYMF+7bOFCErFjXUB5xEvslDGJ/e9VTDFftecYksyhBDB38DNwVp4w/fj0GwHsoww53VLZWM0YKfz00/aAJn7IV6gt5oaUXio/xwypEvw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(356005)(40480700001)(40460700003)(316002)(6916009)(86362001)(54906003)(478600001)(7416002)(8936002)(2906002)(5660300002)(70586007)(4326008)(8676002)(70206006)(41300700001)(36860700001)(82740400003)(7636003)(82310400005)(2616005)(1076003)(336012)(7696005)(426003)(47076005)(186003)(26005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:53.1794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9927b8-5d1b-47ee-b281-08dae98c8344
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E646.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5998
Received-SPF: permerror client-ip=40.107.95.85;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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
 hw/vfio/common.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 67104e2fc2..7a35edb0e9 100644
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
@@ -470,7 +473,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
-    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-- 
2.26.3


