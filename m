Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA968E0C6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTEm-0005zC-DB; Tue, 07 Feb 2023 14:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTEk-0005yk-V4
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:02:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPTEj-0003eF-EV
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:02:38 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317IxCYa022129; Tue, 7 Feb 2023 19:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=C1gJ4/0ID3mkA4Z8M0FW1oSzvYM9LhWvwk5Ts35pM7k=;
 b=DCUItn6D71cfX4qVhUpqfdBKgkFN8NRn6v7gLZRNhh7A+PGs6bdrBcKBzfp82JQqx3vE
 YQfjpKTwUHh2D5ihYYD9ibP9pflwkR0+IjxkxsDuHsgGamg95+9jhqcVSlLTGL849P7T
 NBy90ZKpbmj5GfKYieGrkG94ccEGmBjOAaK+GLolmUxK35H3WLYzOS95yGPxh1RcPmQZ
 QgB0ojSX5jdu++i8yiXkvhTCDBRJjMJI2OoGJMhF/vdy69WjG+MuMTWnuORZqjlFbwrk
 9IeQZBe0HHWHY8nNW8yC5MrkmiBkrzPf9QCj8njCtL5Vr5KNo/DpEdh8xk5T+mjgduAh Cg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu6adt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:02:35 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317I2R4D024894; Tue, 7 Feb 2023 19:02:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrbama64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 19:02:34 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 317J2Yce001107;
 Tue, 7 Feb 2023 19:02:34 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3njrbama5h-1; Tue, 07 Feb 2023 19:02:34 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Steve Sistare <steven.sistare@oracle.com>
Subject: [PATCH V2] migration: fix populate_vfio_info
Date: Tue,  7 Feb 2023 11:02:33 -0800
Message-Id: <1675796553-235469-1-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_11,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070169
X-Proofpoint-GUID: w71a_wH0d1b6OwpJWBb04t21qFAypQKo
X-Proofpoint-ORIG-GUID: w71a_wH0d1b6OwpJWBb04t21qFAypQKo
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
CONFIG_VFIO.  Without it, the 'info migrate' command never returns
info about vfio.

Fixes: 43bd0bf30f ("migration: Move populate_vfio_info() into a separate file")
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 migration/target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/target.c b/migration/target.c
index 907ebf0..00ca007 100644
--- a/migration/target.c
+++ b/migration/target.c
@@ -8,6 +8,7 @@
 #include "qemu/osdep.h"
 #include "qapi/qapi-types-migration.h"
 #include "migration.h"
+#include CONFIG_DEVICES
 
 #ifdef CONFIG_VFIO
 #include "hw/vfio/vfio-common.h"
@@ -17,7 +18,6 @@ void populate_vfio_info(MigrationInfo *info)
 {
 #ifdef CONFIG_VFIO
     if (vfio_mig_active()) {
-        info->has_vfio = true;
         info->vfio = g_malloc0(sizeof(*info->vfio));
         info->vfio->transferred = vfio_mig_bytes_transferred();
     }
-- 
1.8.3.1


