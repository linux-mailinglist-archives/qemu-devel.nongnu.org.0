Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309563D264
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:48:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jfw-0004qk-1S; Wed, 30 Nov 2022 04:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JfX-0004gj-Pw; Wed, 30 Nov 2022 04:46:19 -0500
Received: from mail-bn8nam12on2073.outbound.protection.outlook.com
 ([40.107.237.73] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JfU-0003JF-6Y; Wed, 30 Nov 2022 04:46:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HorLk1dexk1ydNX36/oQs5m9Be092tJ57pXOaaGdscQ3QHtrMm62mCYmcwCv0y1Bid9xyzv4FDxGm7vS0yqh1oSuFjfMd+KeZkxJSIg9/D3dwE0l3FAFD5TyHxN64rcdrMQqHDZsORK0nUtMm0KJDSNF8hUsy2RfcYszkpmWJVMsJhqAlEF89gXcDGlxhXO0iQQBYmXVWAVWp8Stim1FURBkdQcLuMzu1QiAARl1JfKk/r0PRBEIHfHlqGGKU9D/s21YZ/rKChHW2kzXd8y1g+/sOWtRT+hcYx5wblfTvZUSD1pkNwFZg0RBA9d+MWZTfTsms8a1Nv/Wvdd7Mb+ARw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1cRiwR81+VR725i0ZuMtZb5jIgHzWXXG2RJCT8K7kM=;
 b=AC9JjZg2xRX05LOtqx5UPh/80pQcW8V+G27ZrwPaj+Cxh5z/kV0HVw/SgzpzegUd1F0CxwjAZcO4B6HPh1vpd9ifj43X4FHqaPO8EUMdO5xuKDnyYK6OJH2nMHqkOx9X2JKTHiqFKr5pozuF+URYKEOXyrHsrF4+EsZngH1x+YxAfNHrb3WM+/INwPAdyMhnKd9UspqmLhTS3wW20J4iqkd2wCnuRzJnkKsiJqu++wJzLNn3SKu9MTeaAKJ+Lzpg2slIrk2TX8Q64qFKuuQJzsPBvskA+bQBZSGvON1SWXl0FgLeGzdLmVTAlzqxYXfT0ftTQ5Z/S36g5U0ue3fiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1cRiwR81+VR725i0ZuMtZb5jIgHzWXXG2RJCT8K7kM=;
 b=ePozXXGowpOFi/a6Ao4J+anLuQx3ihZ2w69lfm0QcYJIKz9DdCDrx0JOOMQrzzGIe6bd+jlOh2wYMIFSS8gslzxidtKQu0URc9s37P5AePiaNMDSX8/JvkxLifUUQp1ZXzkONi52JS4+m/Q+jqFw1Ep4Uo+L0OvCkWfrXFmbfMxOVlNZn1vG3hfEGCvolih0/8YFdssB6myp+bemmTwAibZ24hVassKQNxwH1DqJM+IfnWGeusWttUf9Ul6CNF789mNZunBXOjhC0dBTLAqA7MvIpUubnTZMqInEumyacex9CYy/ti46gCqUSGd2SBLfkAaexK0rVxqeyhcS9+RL4Q==
Received: from MW4PR04CA0329.namprd04.prod.outlook.com (2603:10b6:303:82::34)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:46:12 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::19) by MW4PR04CA0329.outlook.office365.com
 (2603:10b6:303:82::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17 via Frontend Transport; Wed, 30 Nov 2022 09:46:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:59 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:45:58 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:45:51 -0800
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
Subject: [PATCH v4 13/14] vfio/migration: Use
 VFIO_DEVICE_FEATURE_MIG_DATA_SIZE ioctl
Date: Wed, 30 Nov 2022 11:44:13 +0200
Message-ID: <20221130094414.27247-14-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT053:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8277a5-41d8-41cf-39ce-08dad2b7b6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FxzvgIFyZ0VH9FQtz2OrwpPLjEWXZiYiyKu91T25KgfMD5g8sBpi08c100zG6GfSw+0qP3cfN9mindDlwU/0ScOg/1pSi1Upf83XhyoJmzrgj/MT1m5O7u0AXnGaEB6+hx5iR0EtJq418a6LbwQbqvj6EkSHWJdm2/Qb5/RoAv0ZA4dNwscFl9JUE0lmMoOYEIRQS3LKYGKstIxqj7iYqvMmwHORMZ+W/gwYCe13VMX3AXaMPVt2dEWJ70HC5tjBI8wpBpPduMtVY/XmwrUXS661YN1tenHgRsavmrYY56ZI25ag7MTHFpjS8TBGpvj9+EzCYzR3WnYbuozQFC269NlEjNO32kvXoyZVgyOHkXCqDM+G7tjxB587Obz0OE5dVz5Be5AWHuZIVkf5Ahmlb0DhgmooBHwwbOaTHkjm1fGPoO5fRtyHORxV0k/oPLMDdFyz5qW8aEiGAsM123sMLrba6lHwpBYmZptl3fUT1+rQY7GAXC0wmHUsO0Gk4uuE8SI+jI1YjKCmTWugrVAhVOTVWPXIFbA3cM1XgFNb3tDGjstrSShsAIIeVTkl/5BhqALaNrUXjsEsgWRSOdVZdHS9fQrpA50YmV2LM9rwambkXnPPEUuqWbJHcKeHGqrDDTka7OHZ/jnNoXwVR04dYncWJDGTk7GOurey6QvYqQpWHJUO+R34+SpmSvwQZGtCHb/V5401YCmrq9zc5PtQSA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(7636003)(82310400005)(36756003)(40480700001)(26005)(6666004)(186003)(7696005)(40460700003)(41300700001)(70206006)(8676002)(356005)(70586007)(478600001)(86362001)(4326008)(316002)(7416002)(54906003)(6916009)(5660300002)(8936002)(426003)(336012)(47076005)(2616005)(1076003)(83380400001)(2906002)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:46:11.3160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8277a5-41d8-41cf-39ce-08dad2b7b6cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
Received-SPF: softfail client-ip=40.107.237.73;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Use VFIO_DEVICE_FEATURE_MIG_DATA_SIZE ioctl to query the device stop
copy data size and report this value in vfio_save_pending() instead of
the hardcoded value that is currently used.

Use this ioctl in vfio_save_setup() as well, to adjust the migration
data buffer size.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c        | 49 +++++++++++++++++++++++++++++++-------
 hw/vfio/trace-events       |  2 +-
 linux-headers/linux/vfio.h | 13 ++++++++++
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 98bde4a517..9285746183 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -208,13 +208,42 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
+static int vfio_query_stop_copy_size(VFIODevice *vbasedev,
+                                     uint64_t *stop_copy_size)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                              sizeof(struct vfio_device_feature_mig_data_size),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    struct vfio_device_feature_mig_data_size *mig_data_size =
+        (struct vfio_device_feature_mig_data_size *)feature->data;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIG_DATA_SIZE;
+
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        return -errno;
+    }
+
+    *stop_copy_size = mig_data_size->stop_copy_length;
+
+    return 0;
+}
+
 static int vfio_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
+    uint64_t stop_copy_size;
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
 
+    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
+        stop_copy_size = VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE;
+    }
+    migration->data_buffer_size = MIN(VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE,
+                                      stop_copy_size);
     migration->data_buffer = g_try_malloc0(migration->data_buffer_size);
     if (!migration->data_buffer) {
         error_report("%s: Failed to allocate migration data buffer",
@@ -222,7 +251,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         return -ENOMEM;
     }
 
-    trace_vfio_save_setup(vbasedev->name);
+    trace_vfio_save_setup(vbasedev->name, migration->data_buffer_size);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
 
@@ -251,18 +280,20 @@ static void vfio_save_pending(void *opaque, uint64_t threshold_size,
                               uint64_t *res_postcopy_only)
 {
     VFIODevice *vbasedev = opaque;
+    uint64_t stop_copy_size;
 
-    /*
-     * VFIO migration protocol v2 currently doesn't have an API to get pending
-     * migration size. Until such an API is introduced, report big pending size
-     * so the device migration size will be taken into account and downtime
-     * limit won't be violated.
-     */
-    *res_precopy_only += VFIO_MIG_STOP_COPY_SIZE;
+    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
+        /*
+         * Failed to get pending migration size. Report big pending size so
+         * downtime limit won't be violated.
+         */
+        stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
+    }
 
+    *res_precopy_only += stop_copy_size;
     trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
                             *res_postcopy_only, *res_compatible,
-                            VFIO_MIG_STOP_COPY_SIZE);
+                            stop_copy_size);
 }
 
 /* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 6c1db71a1e..2723a5d1aa 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -162,5 +162,5 @@ vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
 vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
-vfio_save_setup(const char *name) " (%s)"
+vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
 vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
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
2.26.3


