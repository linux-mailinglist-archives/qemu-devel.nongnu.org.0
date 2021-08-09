Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA543E46D7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:43:09 +0200 (CEST)
Received: from localhost ([::1]:49726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5Ya-0004mh-9d
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tiberiu.georgescu@nutanix.com>)
 id 1mD5WL-0001iT-GX; Mon, 09 Aug 2021 09:40:49 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:30622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tiberiu.georgescu@nutanix.com>)
 id 1mD5WI-0004yv-Q8; Mon, 09 Aug 2021 09:40:49 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179Dbv8L013026; Mon, 9 Aug 2021 06:40:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=rFiKEAy+hvqzKl08vrG/l8AsuLvvpXHPwP/RYpFv1Aw=;
 b=QKXe0GKU1KmnmZVxbHRA2/lQqzWFCSOH7YPEPA+vE4KCIBp7H2TxQi4yjKz/NdXTlwff
 lk79qgzJTXvV/o+x5PDe3XtsZIQBmJ1YAPScJJetXwEbz+XMdrwg+G0UjlJBMfqyrv3k
 secw1BTvp+oyb75dYwnevOZVHRLPPkb9A4t5Bapg4UAMcmHgfPt72NbSdDJazDg/BHHs
 eGKj2bAM93G/q3iCvALxTYqg31nJsX6vflRF1Wa/z0KVY76wVZ9Fw8mKYg5EXorwNrGx
 eeaeHpRh3l8BPVqBp7tJ8Az036/4sQqanLZsPCOhcj3kDkCjdp9abhU/Pp/TOvTnVUb8 ng== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3aawvg8uev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Aug 2021 06:40:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NteEVe0ScaMcN3KXn0GcSABOvNlE06qBYvHjomyfrO7DJ9LSe34OA1QWYAfE7iuicwqKfKUoMxAn9UGHhuMMXxIPoBuxcIwuPTSuwk9wUi31m3moapuTcIQ0meBN//BzVbgMZkphSOiAy9NXNOIKOSb0kfoqkLr6S4ci/CVWY047vjVydfjsl+ecngd1+XgADJRrYv6NgaASyoJTzyCEIcsli+s3vOCL7PDxFrdAK0cddA/q+3FIkUuFyQrigvUO2w42ejWipTOOx9qG2ngexDQKlUC4QLKQhZ8JSScrgyyApD/MvQ2pDf3x7hSjeiYWGkgOxUvVR34gsXbVuvpYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFiKEAy+hvqzKl08vrG/l8AsuLvvpXHPwP/RYpFv1Aw=;
 b=mIl16Hp6Ki3jtMe+QnTNmSgxqvTZlUZd9iYmXd7Ept+OBPZMasV4Nv6cC7nszj0qDlMuSqkSfMKHe200C63RdZEI1eI7lkdqBDe2Bq40u4LN+kJXGf37eRURutCbbBpAFeB7B0PB9NgWCny7ejr4cXKyCPbcr7v+TtSY7pn9WmuNqU2zaycdQdQxVmSfBKz5MZBJq3UxrtcyZG4Dsx7L5NPmPAVcDX/JIvtbIUAopshg8VG88WrQ7V4cc0LH3SvzeL4GtXGWIymZGNL94APL1krADuTYZKrY5RObt291ZDO6JboUoYl7onFVCDXLEgeHQMMcOp6+oqozxLQx4edZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
Received: from DM6PR02MB5578.namprd02.prod.outlook.com (2603:10b6:5:79::13) by
 DM6PR02MB6281.namprd02.prod.outlook.com (2603:10b6:5:1fa::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16; Mon, 9 Aug 2021 13:40:40 +0000
Received: from DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::5116:80a5:77d9:fcc4]) by DM6PR02MB5578.namprd02.prod.outlook.com
 ([fe80::5116:80a5:77d9:fcc4%7]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 13:40:40 +0000
From: Tiberiu A Georgescu <tiberiu.georgescu@nutanix.com>
To: mst@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: [PATCH] hw/virtio: move vhost_set_backend_type() to vhost.c
Date: Mon,  9 Aug 2021 13:40:15 +0000
Message-Id: <20210809134015.67941-1-tiberiu.georgescu@nutanix.com>
X-Mailer: git-send-email 2.32.0.380.geb27b338a3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:510:4::8) To DM6PR02MB5578.namprd02.prod.outlook.com
 (2603:10b6:5:79::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tiberiu-georgescu.ubvm.nutanix.com (192.146.154.243) by
 PH0PR07CA0093.namprd07.prod.outlook.com (2603:10b6:510:4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Mon, 9 Aug 2021 13:40:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7636bf1e-b623-482c-7be1-08d95b3b46cf
X-MS-TrafficTypeDiagnostic: DM6PR02MB6281:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR02MB62812466DB5F44DCE6A99EA9E6F69@DM6PR02MB6281.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Obv6YLPOH2udJZz2MDFG2NkmQQ6MdLuZXwFRJEfSLPZww0mccobfnoa2sJne8pl0mF3gWJhQFwgwyPslYSKG9sFgT8i08DNz6W0ktV+Hokvu8l+vtP2ymflC7/WOdYqVeQJiMc314tD033hrEt5g9c+78f7Na0EqFwYXMjfO7b3HO5pVKSAfflyXiwgs9bGwIbizDBdHSidVNASuNpPT7zATjNnQhy7PaQ6Rsi5SY9P67q+zBOy1mfQsGdYkFrmKz9tmwms2E7Yeao7FbAGZ7W4jLankuKytT0+fxoWm1CHxE95vUpfsFNj55GT4B5VAEARlfNIoSQWDxn+4/HToSfQm/1TsM2o/H5xoewgKH/ljRKjRnxo7RHKookaizdIcSuEB16/53B8jpOBaKKRZQBO7IEFOxMjxMY4EsgIv68WXpDS+OA0OLF67tiBCj+LFjJ0KC0VPVkoAC/s/FvvUJOwDgScyFF+TzsBWLN6sORHDQHKpzC/7u4iDF/WkB31enDlEQkKyNc62Dj/2KBZO9xX1FEzca4E4s+jsnJVsmz5HCnzc1sI0osExBvNhUUHyM7CbfDoxpRo8dD72b8pQE4jQepmG4BeWpX8APvuFMyBj0NXIZ36U6XLqfzK8W+QbuYARzB8yDi6lVg+jwn8EFrJ5AiSPX08/CyNc6nT4Q9mRpMhMhQ1gt0yv3b7B3lUG5wXpsD3g/ReclXZKRsD2WQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR02MB5578.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(346002)(366004)(376002)(39860400002)(186003)(26005)(36756003)(52116002)(7696005)(6666004)(956004)(38350700002)(6486002)(2906002)(2616005)(478600001)(38100700002)(5660300002)(107886003)(316002)(66946007)(66476007)(66556008)(8676002)(86362001)(1076003)(4326008)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+Yc3oETmHnF5sIxJB9mynTZVUQs6BNuAeFLffZTeSyWIvT2oRGP83MsewM0?=
 =?us-ascii?Q?Nd3+RgjWdb8PoAHUNoOpLlPtOhEg1W0MAVx7KUQC8Dwc7070nDRD44ZAC2S0?=
 =?us-ascii?Q?9JLtvZoFRJgefbqyicWUeGJBqgyeZi1DfiuOBqIgFZ5hf1+7NFgml0LBgaPE?=
 =?us-ascii?Q?7EJ8T1O6nivUH4zVUf0MOL5DcmSTmDWJWDF2Qkte+/E3Bz3526xeAdL4IcBo?=
 =?us-ascii?Q?HUSph1Q+HbGqqn3Ws4t0DBy/YK0vtbcpaJ2hd3pmMSm7NaLzYHeUD1cwB6Pr?=
 =?us-ascii?Q?NNN0L88kwt/pH+9f/fKQCgSU0m4tC0yJgUr0UDCqzv9BoNf5NFj6J7GgWIk5?=
 =?us-ascii?Q?r8a6FKmRRNyF8mvdBRyHWp/t/q6gbq1E09AjmuMnVWESbZpnEK8XLulrOcbs?=
 =?us-ascii?Q?h8vTLNsV3saqw3YYQ1eJ7IyiXnnHoiSQoG1F7gwkw+m6LoGadqsS9suXcQfY?=
 =?us-ascii?Q?fMQFW7vVXZEFgky7DZHYv3O1/ZeV4QEsH0NWzcs+nMlm2bw26v/pOZzeDyxI?=
 =?us-ascii?Q?gygNUNy+i/nr8giytqtKy38O9ZDYXSwmAxZfuSEglI3pbQpNmPEnzdqkwjqy?=
 =?us-ascii?Q?jNMl+/+FdaDKIBFeuvG1cxY7o2hPanqZFcmT5r04nDPxG9ARGrYWHcWrftiK?=
 =?us-ascii?Q?/JOH5K6RDqMFzMsC8mfIaXtxHi7MDTPWdU0VpDAqVGE49nGcwVXCVhf0FaYY?=
 =?us-ascii?Q?ncrLnb4oPv5jUZZsEInxxER+VkrzV1NcHP2NCOXqmi6ONIfLyh1O2EjiGUqs?=
 =?us-ascii?Q?tsBA3M7AQjdKikLA7zbGeptKoQIEmlv+JAzinOXEE4KXFm6AFHhcbcVcDpbS?=
 =?us-ascii?Q?CKyYY2yNer/okojdWWzDpYDWJKWWvYJ2330YQZQS0ESfFJrLbzVqZWtMjB6O?=
 =?us-ascii?Q?emZGd41xPjPtuG0GpRz4PQJfvRu5kdr23euAoPQEdmPtEwVxWzwO7yMHl2y0?=
 =?us-ascii?Q?GAqkzU+espa2jXSz5bREevrLtx8i4kJA6jkcgZMoXYaZJHz+aPgK0/Z8aH+B?=
 =?us-ascii?Q?Xj1tauQFeHnggdbSQnLNop7Mp3EKSAqREqiB6TUncRjmRiUuxhAsOc+4OKh+?=
 =?us-ascii?Q?nrtNNTyotJRA6QWDWQ2uzoCj8/tZ5SYTHVDfIGlUMelAzb2ilxhOkDzjbDNu?=
 =?us-ascii?Q?H6qsHCu2iHTT3aKKeqkuNcmpd6d9Fh95Q1vStEbzCOiTwuHijYlmlHQAWLVZ?=
 =?us-ascii?Q?tF6tsV8FrCwOprqXwB/qwTvlXUNloqTq3ioMQNXEPI6Tcy2zfeE8VtRle0uG?=
 =?us-ascii?Q?yD0rxfILRcQatnpTuNbal3aC4rBmubaVmAovZwRczVK3+sNn9Nt5VNwdocHu?=
 =?us-ascii?Q?irt+y157XD5eJMrz65PVBqtA?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7636bf1e-b623-482c-7be1-08d95b3b46cf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5578.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 13:40:40.1505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hl++z94Sz7KmS+GFdhyWmHaiIHndQ1dgsgMTY6N/ZuXwaD3iWc8Rjz5zvy4boJ2rmwfOQ196NM2pdWioS47YKdrhxcZ9tWUDTjSqTTnjIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6281
X-Proofpoint-GUID: 2H4mBgsoQBljMuoFz_XL_AlxKMrT7xyf
X-Proofpoint-ORIG-GUID: 2H4mBgsoQBljMuoFz_XL_AlxKMrT7xyf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_04:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=tiberiu.georgescu@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>

Just a small refactor patch.

vhost_set_backend_type() gets called only in vhost.c, so we can move the
function there and make it static. We can then extern the visibility of
kernel_ops, to match the other VhostOps in vhost-backend.h.
The VhostOps constants now make more sense in vhost.h

Suggested-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
---
 hw/virtio/vhost-backend.c         | 30 +-----------------------------
 hw/virtio/vhost.c                 | 29 +++++++++++++++++++++++++++++
 include/hw/virtio/vhost-backend.h |  6 ------
 include/hw/virtio/vhost.h         |  4 ++++
 4 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 594d770b75..b65f8f7e97 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -293,7 +293,7 @@ static void vhost_kernel_set_iotlb_callback(struct vhost_dev *dev,
         qemu_set_fd_handler((uintptr_t)dev->opaque, NULL, NULL, NULL);
 }
 
-static const VhostOps kernel_ops = {
+const VhostOps kernel_ops = {
         .backend_type = VHOST_BACKEND_TYPE_KERNEL,
         .vhost_backend_init = vhost_kernel_init,
         .vhost_backend_cleanup = vhost_kernel_cleanup,
@@ -328,34 +328,6 @@ static const VhostOps kernel_ops = {
 };
 #endif
 
-int vhost_set_backend_type(struct vhost_dev *dev, VhostBackendType backend_type)
-{
-    int r = 0;
-
-    switch (backend_type) {
-#ifdef CONFIG_VHOST_KERNEL
-    case VHOST_BACKEND_TYPE_KERNEL:
-        dev->vhost_ops = &kernel_ops;
-        break;
-#endif
-#ifdef CONFIG_VHOST_USER
-    case VHOST_BACKEND_TYPE_USER:
-        dev->vhost_ops = &user_ops;
-        break;
-#endif
-#ifdef CONFIG_VHOST_VDPA
-    case VHOST_BACKEND_TYPE_VDPA:
-        dev->vhost_ops = &vdpa_ops;
-        break;
-#endif
-    default:
-        error_report("Unknown vhost backend type");
-        r = -1;
-    }
-
-    return r;
-}
-
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
                                              uint64_t iova, uint64_t uaddr,
                                              uint64_t len,
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e8f85a5d2d..53fccc0ce2 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -174,6 +174,35 @@ static uint64_t vhost_get_log_size(struct vhost_dev *dev)
     return log_size;
 }
 
+static int vhost_set_backend_type(struct vhost_dev *dev,
+                                  VhostBackendType backend_type)
+{
+    int r = 0;
+
+    switch (backend_type) {
+#ifdef CONFIG_VHOST_KERNEL
+    case VHOST_BACKEND_TYPE_KERNEL:
+        dev->vhost_ops = &kernel_ops;
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER
+    case VHOST_BACKEND_TYPE_USER:
+        dev->vhost_ops = &user_ops;
+        break;
+#endif
+#ifdef CONFIG_VHOST_VDPA
+    case VHOST_BACKEND_TYPE_VDPA:
+        dev->vhost_ops = &vdpa_ops;
+        break;
+#endif
+    default:
+        error_report("Unknown vhost backend type");
+        r = -1;
+    }
+
+    return r;
+}
+
 static struct vhost_log *vhost_log_alloc(uint64_t size, bool share)
 {
     Error *err = NULL;
diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8475c5a29d..81bf3109f8 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -173,12 +173,6 @@ typedef struct VhostOps {
     vhost_force_iommu_op vhost_force_iommu;
 } VhostOps;
 
-extern const VhostOps user_ops;
-extern const VhostOps vdpa_ops;
-
-int vhost_set_backend_type(struct vhost_dev *dev,
-                           VhostBackendType backend_type);
-
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
                                              uint64_t iova, uint64_t uaddr,
                                              uint64_t len,
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 045d0fd9f2..5ee306568b 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -95,6 +95,10 @@ struct vhost_dev {
     const VhostDevConfigOps *config_ops;
 };
 
+extern const VhostOps kernel_ops;
+extern const VhostOps user_ops;
+extern const VhostOps vdpa_ops;
+
 struct vhost_net {
     struct vhost_dev dev;
     struct vhost_virtqueue vqs[2];
-- 
2.32.0.380.geb27b338a3


