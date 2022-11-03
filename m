Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D40618428
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwk-0005e8-14; Thu, 03 Nov 2022 12:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcvh-0001cK-BU; Thu, 03 Nov 2022 12:18:59 -0400
Received: from mail-sn1anam02on2050.outbound.protection.outlook.com
 ([40.107.96.50] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcvf-0008K5-1j; Thu, 03 Nov 2022 12:18:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjLd67zYEaEbqrIhjhIeYUkA7y+e0Oaw0fNmX4LdsilQLVwEuN+fls1deGCyVgpD1w8KpZdxZDTysG+Lz03ahF/YOqk45Ew/iJKe7g/hPN+gx89ydalfsd0zeRI+e8FrruygTzlmpvhCYt2dPwqnAyzelBElYytPclgDoDbFume4EIuVcuNgLAxj4Em0M4WmWbuTnAv7uzUNcr4ic3Ukrs9hrLjc01wsihPGneyuXeu2w8yLju9r6srafa2t8VgXtuTUkjfe5WIK9v+RJkawHrm9+uUUBJgYiFmPdnmfa7NqS1aRBs35mF0sfGL8ZJAkzLeyU09mC3VmVGCLEQ9CTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rShIJnG7YAGu3zdDEePp439THE+u/jJkUvwts6qsDg8=;
 b=VEwZ/LjDytYDvt0A/8wzTcyRsfo3g5VMugbct9l+D82iPdE+krRzKRhnM+1FTHVZtJYoCs3yAI+MNNFyKQ20QGmeCfdEXI1XEUCAvySO5e2/PPj/EMDoTpBFW14gmkYrybFlRk6no4ZY355w4NffpffyAxPwuoc46EGwODgdaaW5ByFoRxmVaOwDDcqoz5jSZmx4nHxw8nAw8WAP5O1RrR+1Nj5OHdS61PLM0AuMgcq3j4ILWRSISldP6/E4LLuIrF/RF35r8/+ks5wHDG2QVeGHZIuDNMnC1YEo/5bojq1SSMJsved9+ZgmE6crAOVRnZX6AcZWzXVba7zZScNJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rShIJnG7YAGu3zdDEePp439THE+u/jJkUvwts6qsDg8=;
 b=MLk490j0FJ+WPbKwvwphUp7BmH3qZDQ4speAqGGCwTZTocjwi2r6MFTfyMc/n7N/hOwsfYXp/MHlSW6q1ntOwu4PcPmHT2s8nbpGbAT7edLxo47oqVPKVyNgZw+GHuQqcgbDW96zf08or4e02eAJCQ7zXmaqhsw7WWQAaS/HLq7labWRtpgBw6RMYS/scE/KyHAXYJyBhj5phc7GIakvv3RzxMRratMzrDGGT6+K0d7NuTB1EAxgXX/lupq9lY69z0mg3iSCWxqmXwmpfZtibHpnWYJw0ZK46JxST9Tuju8oZloD88chrnzc7jeD+LgVGQ95mKGRsbvyyNhJcwj3nw==
Received: from MW4PR03CA0136.namprd03.prod.outlook.com (2603:10b6:303:8c::21)
 by CH0PR12MB5186.namprd12.prod.outlook.com (2603:10b6:610:b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Thu, 3 Nov
 2022 16:18:47 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::bd) by MW4PR03CA0136.outlook.office365.com
 (2603:10b6:303:8c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Thu, 3 Nov 2022 16:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:18:47 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:18:39 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:18:39 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:18:32 -0700
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
Subject: [PATCH v3 17/17] vfio/migration: Query device data size in
 vfio_save_pending()
Date: Thu, 3 Nov 2022 18:16:20 +0200
Message-ID: <20221103161620.13120-18-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|CH0PR12MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: ab337005-8327-4c9a-a34d-08dabdb7161b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lZ73Up8VJj8SkN7Xt5HBWr2SGXjGwkX6JLhIyK2K9yEtYbSRp4nF0VFR1VXG667r48ekoMEU5rCyDPjh0nLT7JdkGd9FCXBFTB1LdSA+LIqE4LEPPpH3qMi2pEvkj9c0Hh4nJq0y6FU0773hTQd/0bQZXCgnuFEoaInz9QAJdH+KoE6wnLGb+hHWNIHBYAM9hDe0U9ZbyZ4F0SUfUlJ24DMmaTT1UPEtBzDZStnn+2LJtBj/0fu47+o02z8cYTDE7WZFHFuCl9J58H/sReFlSvJLD+SuqNkKsUdhC+Gckvt38iqE+DFn5frVDJ+zRRKD6qWqEk+ojHXSK3Rv2vDR4EK93L/OzqNzxks+qWuCw0VEJ8rQc3ygvlafDSKV22OiForIXSAqJbBPohrxFDn/c8s0ZUmqd7viCbHEkfuilion+gB+hh13TnytECD5EglAhiGj8j99Fb3Z8YUMs9yQTb19AKjFh8tktKq0RlHxaHGOaTQ5hlrVPiXw5iV9OxdJ4IjpoT0yrGdAhaxn/mgxOd7kg8OuHPoIY7qTf2Yp8iZ9dco340kss4Ki9IfNLUSPXTl81ff/Z4Ekg+qkf/fYrxbZjGR4WKHsSswsNObM4HGZBwydc4qjFDFgUgNjzRgQ6+ztIU7IsDNvAmOH93WeRRqUADTE2b25OCL0jVcrAwwfgvgvIFNaUkoExBggnyNIpfWkfolqRSshLBrl3GOWTO3nGeAvf/SEHYIeKt5cJDgHPWn97PgnC5h2PT8F9C0iIFdWPJ7UeisLSI8doaIv1g==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(82740400003)(36860700001)(336012)(2906002)(426003)(47076005)(6916009)(40480700001)(186003)(8676002)(70206006)(4326008)(2616005)(478600001)(70586007)(82310400005)(41300700001)(1076003)(356005)(7416002)(86362001)(7696005)(36756003)(6666004)(26005)(8936002)(7636003)(5660300002)(54906003)(40460700003)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:18:47.2983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab337005-8327-4c9a-a34d-08dabdb7161b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5186
Received-SPF: softfail client-ip=40.107.96.50; envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

Use VFIO_DEVICE_FEATURE_MIG_DATA_SIZE uAPI to query the device data size
and report it in vfio_save_pending() instead of the hardcoded value that
is currently used.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c        | 27 ++++++++++++++++++++-------
 linux-headers/linux/vfio.h | 13 +++++++++++++
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e8068b9147..8ade901383 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -225,14 +225,27 @@ static void vfio_save_pending(void *opaque, uint64_t threshold_size,
                               uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                              sizeof(struct vfio_device_feature_mig_data_size),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (void *)buf;
+    struct vfio_device_feature_mig_data_size *mig_data_size =
+        (void *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
 
-    /*
-     * VFIO migration protocol v2 currently doesn't have an API to get pending
-     * device state size. Until such API is introduced, report some big
-     * arbitrary pending size so the device will be taken into account for
-     * downtime limit calculations.
-     */
-    *res_postcopy += VFIO_MIG_PENDING_SIZE;
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        if (errno != ENOTTY) {
+            return;
+        }
+
+        /* Kernel doesn't support VFIO_DEVICE_FEATURE_MIG_DATA_SIZE */
+        *res_postcopy += VFIO_MIG_PENDING_SIZE;
+    } else {
+        *res_postcopy += mig_data_size->stop_copy_length;
+    }
 
     trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
 }
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index ede44b5572..5c4ddf424f 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -986,6 +986,19 @@ enum vfio_device_mig_state {
 	VFIO_DEVICE_STATE_RUNNING_P2P = 5,
 };
 
+/*
+ * Upon VFIO_DEVICE_FEATURE_GET read back the estimated data length that will
+ * be required to complete stop copy.
+ *
+ * Note: Can be called on each device state.
+ */
+
+struct vfio_device_feature_mig_data_size {
+	__aligned_u64 stop_copy_length;
+};
+
+#define VFIO_DEVICE_FEATURE_MIG_DATA_SIZE 9
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.21.3


