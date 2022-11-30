Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6E63D283
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:53:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jeu-0003ff-Fl; Wed, 30 Nov 2022 04:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Jei-0003d3-Vw; Wed, 30 Nov 2022 04:45:29 -0500
Received: from mail-mw2nam10on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61a]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Jeg-000373-Ji; Wed, 30 Nov 2022 04:45:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwXXdbYY+Oilay/QyCK63PbTqNSoxxu2ZmtuS7byJMhqOGNViE1Oh6gu66BPEakawN8HqIKYozTN+GtUmQLNznVexyoWklHB9ilU1xF+Z/qmJbKtjCIFnEnBD+qT5MVHxUVQLa9OhlJc772CB9NvMOGOJjfeCkAW9+ysJsDi+oA+t87mq8+Ndub8QAQVAUcuXkpYumdpJbFZ2RuNSsSCsUFDYKgdrdh/yuMsU5Xof/8Dh1A4sKlDgf3Uffgp6GSFIJddzpBpuaG6G0o8vYqf7U9PIqIRBJjmqkJ/touqsimnQQPf0XazibnGUGwU6mepqp9th2/yBAtkI82ZFk09Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMUTneDX00Am4uPOHJaEs/D16Sk+RJ172M1/EeGTLbI=;
 b=c/LGaplpQAgnOX07E+LCCZca8sxjzdqdeSXxA3m/yXT1FfMla7aR/GWPHQHjS5+Kbwwzi5KH5e17mzCe2/kvAwvmDl5pPRFMUVz1Hdqpkg5IUdIqHxfKOtsDknsPkMDTaBBfcm3KIRsMOX9pavwj9zLn1wB4ILQHVbaFRLNV4lzYnFsmN9E+8vVdbkG34JFJzXI63vjzg/ixel4YggUm5fSr8L2i71z8YT/rm/G7mND2hHvoWU+uVcsiImXF4iIE5YWTJD3vY/6JCtR6D636GZXp+ryK8jMiCYchfCKhOngWIpTlKtBtAumSU2HpkZIG9dmHZuF/3VLVZYy7/s8v+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMUTneDX00Am4uPOHJaEs/D16Sk+RJ172M1/EeGTLbI=;
 b=au/Kbk4CuIlgAIICgn3ZuAefsIO3CWLxcMs60ljOj35K3bYbEEr1mlx1OOpDT1VhKnBB68RqF0CqIBzJ/EFlpqNFXnZPhwGg4/tVmBba/wilms2GxJK7phAUiPOAyW24S/DuIbslhdJN4JBAvIiaHKXciD+qI8YWxP/oXePbmc5z7DJPUqSr9Lp+D7eWZgj1LJfNaunWW8YEHYTPAz732cS5apB24+WUereF3vbJZXRs7oqMfCVOIrjdbEPr3YvWwklDViyQJnX1gUGU2sF9+XaKQ8HWpsZHSm8jvq8hov9RW2P3k3Uq+EYmNMQJj/eaLJfHf4HINUqG0UmtUvbB6w==
Received: from MW4PR04CA0306.namprd04.prod.outlook.com (2603:10b6:303:82::11)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 30 Nov
 2022 09:45:22 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::bd) by MW4PR04CA0306.outlook.office365.com
 (2603:10b6:303:82::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8 via Frontend Transport; Wed, 30 Nov 2022 09:45:20 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:06 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:06 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:44:59 -0800
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
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 06/14] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Wed, 30 Nov 2022 11:44:06 +0200
Message-ID: <20221130094414.27247-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d806de-8e01-471e-af98-08dad2b79867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3kp+yaeyw/CSmPLGHai5IP04s6mrdjqu8PYDrmWFkrUlyRCyJ6HFu/BgDWcU57mh7gjq/BPLliZAE+MwlxrvfGJ9UVQhIqtqecwJeceKwXS0jBIW12gE0RJt4ovIsA6dl8X6SOJIpFvYUeWfuoyCJWC0EiXL613ekGWh281xEvAzsUSTXkXY3AYleIYrqmh1ocPrHXlUE/9WkiTB/Ol20nVpNuKCOFG3/X9OhnPotFE9YBf4Qkhqvf9u7vCmbA+cVHXqP46S0Hsqtn/9FP85WCAYlsmK7/vVgDesXrG+OBjQ6OXTEXxOKlJs5XOleiMm9A23zfJLWaVOOgkB/G9aFrXyUcMtpABKRDXls1UPAed4st26HeqiZJR0C+IzKIuWNXQIKJ55geTJ9ftlCoGAc91aphumn4l8ZNi0+fN6Af5mJ45grrmR99bXAtHg8a6FJ7WX3qYQCxB6Sfyfcgye+pygCP0P6zrvhmdecgX3cTIV7JtAbJpKGvxjFN/0cO74FMunUD8EZv8GrVN5bjd2zIXP9/dYao2/gpU3wClV7ngW4AaKwnFtMCOK7KqU6IpMMKrSytW0fEOwl6ygYJb5EmAOv1s0P09LM5/e1h+ZZ4/rQkoczMogfP6vQywZfYoNIUv+CsbiJckmVQj0vl/PhRdZBoLerwQSqRoUSCBO+lHgl6BTX4REyZZEaRoIxIdgFRNhbyo88Q9xtGhOsJCTQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(356005)(7636003)(86362001)(82740400003)(82310400005)(36860700001)(2906002)(40460700003)(8936002)(8676002)(40480700001)(5660300002)(4326008)(41300700001)(7416002)(70586007)(70206006)(316002)(83380400001)(54906003)(6916009)(47076005)(36756003)(7696005)(2616005)(1076003)(186003)(26005)(426003)(478600001)(6666004)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:45:20.2720 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d806de-8e01-471e-af98-08dad2b79867
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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


