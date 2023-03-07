Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23476AD45D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMgJ-000744-16; Mon, 06 Mar 2023 21:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMgH-00073M-9s
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:57 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMgF-0004zL-Lp
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:57 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NxYsO030050; Tue, 7 Mar 2023 02:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=xuofWDdTaohhml0uhXqEE2pCYISUUN5doa0iJ2TR+A4=;
 b=3bPA832MBknOsHxs9b5W6FcLHbPOx7+wDJrCjVNCleotkxcMyxyDG0jL8XsCDtHN/sao
 FbPi3Da62A6cIKW92SuOLl+Y5PakmSkviVoEQlTWNdTvAvs70z77a/YVkgamWvqNKpVS
 l0ml21tSUDtP//SYVcCROB7GXyuhgJE15EDD0fxmLoJoHlNFyv5CJgnpt6DJPuo2euOQ
 7tozlK1cxUsko/oo50IQHivjHTwkDu/AfjPrkzx9N4cp0t6KOcmWlW5jlAt9Y62UZK3a
 lM8GjL9BirkbbD5UNT1dAMYq4DOaa9eV6Xws+87/fwoNmf2ww6MMeM+GfZ6SRKEdO3xM 7g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xvfev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:53 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32721G9J037277; Tue, 7 Mar 2023 02:03:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txduc5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356O016763;
 Tue, 7 Mar 2023 02:03:51 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-14; Tue, 07 Mar 2023 02:03:51 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 13/14] vfio/migration: Query device dirty page tracking
 support
Date: Tue,  7 Mar 2023 02:02:57 +0000
Message-Id: <20230307020258.58215-14-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070017
X-Proofpoint-GUID: U3Nld0kBtYK4Fvs_4zoe6AYttJ5CSIY3
X-Proofpoint-ORIG-GUID: U3Nld0kBtYK4Fvs_4zoe6AYttJ5CSIY3
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Now that everything has been set up for device dirty page tracking,
query the device for device dirty page tracking support.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/migration.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 776fd2d7cdf3..127a44ccaf19 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -555,6 +555,19 @@ static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
     return 0;
 }
 
+static bool vfio_dma_logging_supported(VFIODevice *vbasedev)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
+                              sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_PROBE | VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
+
+    return !ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
+}
+
 static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
@@ -589,6 +602,8 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     migration->device_state = VFIO_DEVICE_STATE_RUNNING;
     migration->data_fd = -1;
 
+    vbasedev->dirty_pages_supported = vfio_dma_logging_supported(vbasedev);
+
     oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
     if (oid) {
         path = g_strdup_printf("%s/vfio", oid);
-- 
2.17.2


