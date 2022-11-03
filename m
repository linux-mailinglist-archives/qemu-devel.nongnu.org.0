Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A50618409
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqctm-0000QT-7x; Thu, 03 Nov 2022 12:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqctg-0000F8-5H; Thu, 03 Nov 2022 12:16:55 -0400
Received: from mail-bn8nam12on2041.outbound.protection.outlook.com
 ([40.107.237.41] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqctd-00081M-B6; Thu, 03 Nov 2022 12:16:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaIgGE1Y38GEaiWw04WNS2Hc6inUly/SiZ1/3uDkouxvfkoEOSCUoRI22hjssU/4fVVllfQFhbPkbh5z94EJZukUg7fUN0JXkCKqVE/DMly2T5d/kjfIJ8/kt8fM7JrsxHIL4Cd1imBZNVWNExVh+EmOSXF7CpKNUm+nZiLpLGTZq7wxaIgG3sNG0FbdJLyMmZrhjL6HR5zlo1azZB2Q2QKJb36oTkXfk1JnDhWI14TYlcVdEW8iw3PhoI3TuVyvDgvafXtSp+ykaBHZifL8J0OhDXOIqWiHQ2Hh8Ke45G/Aa7ZqozhNDrs7MNmSxRlnUfjmRZ9O2jR3bR4cObfvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojSbGep+UgJPkv1W2MpwnqwZEPV+cTBk7M4f4wct/Lo=;
 b=kN+dHolsFLgNvwGjyAR2A9YU5vwlaElVc3ycT7ljQhSLwwKc4Z3MEnxkofxBMZdymZKjgBYRozkSm6x4Vx+5PDF9QMFeplcWlqxKbKhDVdMarjB5ZroEg2xHvFCEA4UpjhSyLgAT73ZZ+frRNfDCg3ZO/koqEOSFe0LkgAyhDs9/qehdRhLp2Mzt6G4/GAH64kt+XNO5OqzJYFuovQXXzBAz8zavsCTa8W77gxtLA10xtqLCrgGxpVbEHSg7MRc+ATSIm6lGBSLUyWiG0DEIh1jyigQDh1KEQV2kKHrsBHuPPoZI1fPomMBhJxBP4iBkUWzh2JceveDF4Ow8jokJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojSbGep+UgJPkv1W2MpwnqwZEPV+cTBk7M4f4wct/Lo=;
 b=cb8JGgulhdiPSkI9hZtsFcvlR/oYsZgkeHxAEPtJYLaYfzyPMhsNKn/iRJWS96zpRKydNW82LD0dAE6cl3cK3Yn+3CJpk4CRh/7jWKRdnwAEX/SC+8Ji4VP1AVqbG9rpR+6hy6EOAw6c2hxFwADcGxCmQmNB/uJI+NXRXiF+BSJYxc0gtrvvCnPZJLLXEBsLXPB62r5UQfdZiAdXqvSkXEDDGT2/soq1I38FbsCF32CJBAzO4p4TkbbsSc9BC4kP4U+lcVutmW9UkWDY08Pk2w+rACndLULcXFX9p9KN99lyNjZM3JfFj/21tAajSj8TuYCQh1rK0yIyLnqNl07mgA==
Received: from BN8PR03CA0012.namprd03.prod.outlook.com (2603:10b6:408:94::25)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 3 Nov
 2022 16:16:45 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::38) by BN8PR03CA0012.outlook.office365.com
 (2603:10b6:408:94::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:16:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:16:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:16:36 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:16:36 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:16:29 -0700
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
Subject: [PATCH v3 01/17] migration: Remove res_compatible parameter
Date: Thu, 3 Nov 2022 18:16:04 +0200
Message-ID: <20221103161620.13120-2-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: b25c24e3-2262-47e5-daf1-08dabdb6ccec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hwZCvR01G4VLxOD+4AnF1m09QisLjBRNxBSZ/NzbBb9hsof9VfnqRkeT7ZZLW8b3j32v5ovrTKJ0ymdswnn1JAY8qpX8rbTWAP5e6gweIEWMBdSHvVuFtfe7d5dJy2kKLom8x0EBX6t2UBe8vqQFqo0TVNUAgfnn966uthNbrd717hnn7/OLAPtup0lH3h0b15GuCKXphNRCqWX4ORr+q4Sjlba+hEp/9bYTh0HVMJD9hBzqwLjuK95puRhQiwPi2oiR4KZlls5lv2LNOlTpnF2Q+gfN+ItE43nKjsm9V572Ef1KvlODMcnVg8lErgiXLPGVSqX3Cp8JAMlfMkpf4Dqe+7QCApeFyyA7eFe4f6eEV1AChTdOBmquB4iJD6fCrOmUVa0G7NNX1QMlp3ZxqK8/0nfOEuFhH5o+yk3LGF/yJJyUZn42DDP0+QcoELdRC7s3TZ6BKnwy6XlY1+YabRR12ikEYcf6wRD7ijBVclrLNKOxm3IiL+7xrQL8Tb7MzIlTKVvY49d/uo3KdXCYzdlSst18yexuf3SUfwGDCloaMjuPUeI9Pfr09xZ5k66RIoS2H0FrAcEIq366GXBEnIZI8UrBzoDdoRcTLoeLRThfyT0/RmGhTPs96/nC0wI1aQ9utVR5tG4BqENyW+YDXE9dGnE7K6hByUKKNX7NMt+OGaIeJAC0Q4WDZhUPFf1JjAKFCfz0MyYKZ+prC8gIaHQPR1U6p10OS+zJYWtEzJQt7IbVz3BxGoBz13IFrgejgjUNBvlmZOdM0pG0jYn/qg==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(356005)(40460700003)(336012)(1076003)(7636003)(2906002)(186003)(478600001)(82740400003)(41300700001)(8676002)(36756003)(36860700001)(426003)(7416002)(54906003)(6666004)(70586007)(70206006)(6916009)(7696005)(82310400005)(5660300002)(2616005)(316002)(47076005)(40480700001)(26005)(8936002)(30864003)(4326008)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:16:44.4243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25c24e3-2262-47e5-daf1-08dabdb6ccec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357
Received-SPF: softfail client-ip=40.107.237.41;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

From: Juan Quintela <quintela@redhat.com>

It was only used for RAM, and in that case, it means that this amount
of data was sent for memory.  Just delete the field in all callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/s390x/s390-stattrib.c       |  6 ++----
 hw/vfio/migration.c            | 10 ++++------
 hw/vfio/trace-events           |  2 +-
 include/migration/register.h   | 20 ++++++++++----------
 migration/block-dirty-bitmap.c |  7 +++----
 migration/block.c              |  7 +++----
 migration/migration.c          |  9 ++++-----
 migration/ram.c                |  8 +++-----
 migration/savevm.c             | 14 +++++---------
 migration/savevm.h             |  4 +---
 migration/trace-events         |  2 +-
 11 files changed, 37 insertions(+), 52 deletions(-)

diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index 9eda1c3b2a..ee60b53da4 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -183,16 +183,14 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
 }
 
 static void cmma_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+                              uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
     long long res = sac->get_dirtycount(sas);
 
     if (res >= 0) {
-        *res_precopy_only += res;
+        *res_precopy += res;
     }
 }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3de4252111..3423f113f0 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -458,9 +458,8 @@ static void vfio_save_cleanup(void *opaque)
 
 static void vfio_save_pending(QEMUFile *f, void *opaque,
                               uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+                              uint64_t *res_precopy,
+                              uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -471,10 +470,9 @@ static void vfio_save_pending(QEMUFile *f, void *opaque,
         return;
     }
 
-    *res_precopy_only += migration->pending_bytes;
+    *res_precopy += migration->pending_bytes;
 
-    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only, *res_compatible);
+    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9e00..a21cbd2a56 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -157,7 +157,7 @@ vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
+vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
diff --git a/include/migration/register.h b/include/migration/register.h
index c1dcff0f90..1950fee6a8 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -48,18 +48,18 @@ typedef struct SaveVMHandlers {
     int (*save_setup)(QEMUFile *f, void *opaque);
     void (*save_live_pending)(QEMUFile *f, void *opaque,
                               uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only);
+                              uint64_t *rest_precopy,
+                              uint64_t *rest_postcopy);
     /* Note for save_live_pending:
-     * - res_precopy_only is for data which must be migrated in precopy phase
-     *     or in stopped state, in other words - before target vm start
-     * - res_compatible is for data which may be migrated in any phase
-     * - res_postcopy_only is for data which must be migrated in postcopy phase
-     *     or in stopped state, in other words - after source vm stop
+     * - res_precopy is for data which must be migrated in precopy
+     *     phase or in stopped state, in other words - before target
+     *     vm start
+     * - res_postcopy is for data which must be migrated in postcopy
+     *     phase or in stopped state, in other words - after source vm
+     *     stop
      *
-     * Sum of res_postcopy_only, res_compatible and res_postcopy_only is the
-     * whole amount of pending data.
+     * Sum of res_precopy and res_postcopy is the whole amount of
+     * pending data.
      */
 
 
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 9aba7d9c22..dfea546330 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -763,9 +763,8 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
 
 static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
                                       uint64_t max_size,
-                                      uint64_t *res_precopy_only,
-                                      uint64_t *res_compatible,
-                                      uint64_t *res_postcopy_only)
+                                      uint64_t *res_precopy,
+                                      uint64_t *res_postcopy)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms;
@@ -785,7 +784,7 @@ static void dirty_bitmap_save_pending(QEMUFile *f, void *opaque,
 
     trace_dirty_bitmap_save_pending(pending, max_size);
 
-    *res_postcopy_only += pending;
+    *res_postcopy += pending;
 }
 
 /* First occurrence of this bitmap. It should be created if doesn't exist */
diff --git a/migration/block.c b/migration/block.c
index 3577c815a9..4ae8f837b0 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -863,9 +863,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+                               uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
@@ -886,7 +885,7 @@ static void block_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
 
     trace_migration_block_save_pending(pending);
     /* We don't do postcopy */
-    *res_precopy_only += pending;
+    *res_precopy += pending;
 }
 
 static int block_load(QEMUFile *f, void *opaque, int version_id)
diff --git a/migration/migration.c b/migration/migration.c
index 739bb683f3..a4a18228c6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3735,15 +3735,14 @@ typedef enum {
  */
 static MigIterateState migration_iteration_run(MigrationState *s)
 {
-    uint64_t pending_size, pend_pre, pend_compat, pend_post;
+    uint64_t pending_size, pend_pre, pend_post;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
     qemu_savevm_state_pending(s->to_dst_file, s->threshold_size, &pend_pre,
-                              &pend_compat, &pend_post);
-    pending_size = pend_pre + pend_compat + pend_post;
+                              &pend_post);
+    pending_size = pend_pre + pend_post;
 
-    trace_migrate_pending(pending_size, s->threshold_size,
-                          pend_pre, pend_compat, pend_post);
+    trace_migrate_pending(pending_size, s->threshold_size, pend_pre, pend_post);
 
     if (pending_size && pending_size >= s->threshold_size) {
         /* Still a significant amount to transfer */
diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc..20167e1102 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3435,9 +3435,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-                             uint64_t *res_precopy_only,
-                             uint64_t *res_compatible,
-                             uint64_t *res_postcopy_only)
+                             uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     RAMState **temp = opaque;
     RAMState *rs = *temp;
@@ -3457,9 +3455,9 @@ static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
 
     if (migrate_postcopy_ram()) {
         /* We can do postcopy, and all the data is postcopiable */
-        *res_compatible += remaining_size;
+        *res_postcopy += remaining_size;
     } else {
-        *res_precopy_only += remaining_size;
+        *res_precopy += remaining_size;
     }
 }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..4d02887f25 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1472,16 +1472,13 @@ flush:
  * for units that can't do postcopy.
  */
 void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only)
+                               uint64_t *res_precopy,
+                               uint64_t *res_postcopy)
 {
     SaveStateEntry *se;
 
-    *res_precopy_only = 0;
-    *res_compatible = 0;
-    *res_postcopy_only = 0;
-
+    *res_precopy = 0;
+    *res_postcopy = 0;
 
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->save_live_pending) {
@@ -1493,8 +1490,7 @@ void qemu_savevm_state_pending(QEMUFile *f, uint64_t threshold_size,
             }
         }
         se->ops->save_live_pending(f, se->opaque, threshold_size,
-                                   res_precopy_only, res_compatible,
-                                   res_postcopy_only);
+                                   res_precopy, res_postcopy);
     }
 }
 
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..9bd55c336c 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -41,9 +41,7 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
 void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
-                               uint64_t *res_precopy_only,
-                               uint64_t *res_compatible,
-                               uint64_t *res_postcopy_only);
+                               uint64_t *res_precopy, uint64_t *res_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
 int qemu_savevm_send_packaged(QEMUFile *f, const uint8_t *buf, size_t len);
diff --git a/migration/trace-events b/migration/trace-events
index 57003edcbd..f2a873fd6c 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -150,7 +150,7 @@ migrate_fd_cleanup(void) ""
 migrate_fd_error(const char *error_desc) "error=%s"
 migrate_fd_cancel(void) ""
 migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
-migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " compat=%" PRIu64 " post=%" PRIu64 ")"
+migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t post) "pending size %" PRIu64 " max %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
-- 
2.21.3


