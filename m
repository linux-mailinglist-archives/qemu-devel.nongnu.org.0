Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ACF6AD465
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMgf-0007Eb-3Y; Mon, 06 Mar 2023 21:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMgK-00074W-Pv
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:04:00 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMgI-0004zj-Ub
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:04:00 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NxnVi030307; Tue, 7 Mar 2023 02:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=Xel4ecbEPawZ38P8TKB/h9sUQWvBI6R7FLZBmhXQ7Bw=;
 b=hPRgIJaLIwcfnDBw8ueurXO6SILpIY5pBbLPFAm3PBc6K+jdN3SE89eveuqGreTnU0VJ
 A2JEYBL6oMHGKDCmCfiYvrBgVaq/R3ff7e9i33WVd2L8gX57JQpwTkLjc6Bn6dEDdV6R
 SdQwdUSZ/Hr+SZXjd/5dF2pqkGQaW8E/PwTyj8FZaGQxxfbQgQLOeA5gCSla+7B4WOyY
 w96rUBM6ZwwqaRWNcIgWe//rszFvowiPiouiZKI7FouM6Qa8pbiyYmI6ME08fnEHR39d
 1xkxbcXoN2kewjaevBf/PmPczriLCKZkUKd99v2BDbLoJIybfkgl4ZxkfUHYF503Q7h1 vw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xvfex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:57 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271eQQu037536; Tue, 7 Mar 2023 02:03:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txduc7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:56 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356Q016763;
 Tue, 7 Mar 2023 02:03:55 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-15; Tue, 07 Mar 2023 02:03:54 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 14/14] docs/devel: Document VFIO device dirty page tracking
Date: Tue,  7 Mar 2023 02:02:58 +0000
Message-Id: <20230307020258.58215-15-joao.m.martins@oracle.com>
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
 spamscore=0 suspectscore=0 mlxlogscore=990 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070017
X-Proofpoint-GUID: tT8tCkpw35mj0MITeMgMeQZ7X9aga_YS
X-Proofpoint-ORIG-GUID: tT8tCkpw35mj0MITeMgMeQZ7X9aga_YS
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

From: Avihai Horon <avihaih@nvidia.com>

Adjust the VFIO dirty page tracking documentation and add a section to
describe device dirty page tracking.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 docs/devel/vfio-migration.rst | 46 +++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index c214c73e2818..1b68ccf11529 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -59,22 +59,37 @@ System memory dirty pages tracking
 ----------------------------------
 
 A ``log_global_start`` and ``log_global_stop`` memory listener callback informs
-the VFIO IOMMU module to start and stop dirty page tracking. A ``log_sync``
-memory listener callback marks those system memory pages as dirty which are
-used for DMA by the VFIO device. The dirty pages bitmap is queried per
-container. All pages pinned by the vendor driver through external APIs have to
-be marked as dirty during migration. When there are CPU writes, CPU dirty page
-tracking can identify dirtied pages, but any page pinned by the vendor driver
-can also be written by the device. There is currently no device or IOMMU
-support for dirty page tracking in hardware.
+the VFIO dirty tracking module to start and stop dirty page tracking. A
+``log_sync`` memory listener callback queries the dirty page bitmap from the
+dirty tracking module and marks system memory pages which were DMA-ed by the
+VFIO device as dirty. The dirty page bitmap is queried per container.
+
+Currently there are two ways dirty page tracking can be done:
+(1) Device dirty tracking:
+In this method the device is responsible to log and report its DMAs. This
+method can be used only if the device is capable of tracking its DMAs.
+Discovering device capability, starting and stopping dirty tracking, and
+syncing the dirty bitmaps from the device are done using the DMA logging uAPI.
+More info about the uAPI can be found in the comments of the
+``vfio_device_feature_dma_logging_control`` and
+``vfio_device_feature_dma_logging_report`` structures in the header file
+linux-headers/linux/vfio.h.
+
+(2) VFIO IOMMU module:
+In this method dirty tracking is done by IOMMU. However, there is currently no
+IOMMU support for dirty page tracking. For this reason, all pages are
+perpetually marked dirty, unless the device driver pins pages through external
+APIs in which case only those pinned pages are perpetually marked dirty.
+
+If the above two methods are not supported, all pages are perpetually marked
+dirty by QEMU.
 
 By default, dirty pages are tracked during pre-copy as well as stop-and-copy
-phase. So, a page pinned by the vendor driver will be copied to the destination
-in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
-it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
-finding dirty pages continuously, then it understands that even in stop-and-copy
-phase, it is likely to find dirty pages and can predict the downtime
-accordingly.
+phase. So, a page marked as dirty will be copied to the destination in both
+phases. Copying dirty pages in pre-copy phase helps QEMU to predict if it can
+achieve its downtime tolerances. If QEMU during pre-copy phase keeps finding
+dirty pages continuously, then it understands that even in stop-and-copy phase,
+it is likely to find dirty pages and can predict the downtime accordingly.
 
 QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
 which disables querying the dirty bitmap during pre-copy phase. If it is set to
@@ -89,7 +104,8 @@ phase of migration. In that case, the unmap ioctl returns any dirty pages in
 that range and QEMU reports corresponding guest physical pages dirty. During
 stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
 pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
-mapped ranges.
+mapped ranges. If device dirty tracking is enabled with vIOMMU, live migration
+will be blocked.
 
 Flow of state changes during Live migration
 ===========================================
-- 
2.17.2


