Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127234F19C2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 20:24:48 +0200 (CEST)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbRNf-00008I-54
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 14:24:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nbRGt-0008Vn-Kh; Mon, 04 Apr 2022 14:17:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48312
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nbRGr-0007G6-SX; Mon, 04 Apr 2022 14:17:47 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 234GVnAK007186; 
 Mon, 4 Apr 2022 18:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=K98ROeBUgGP1C5opDw71Y7FJ+ZPPUocmL+qKSqUy5T8=;
 b=bXhtBGwNiCv+EIASen60UZRHusvhAddriveh60uvu5lgzJ+k1d3TLUFq6g7hsJyLD7K6
 r2dB34/pgnB2dEc/riwL6HVxYoCzNGW9NCKzCavgRmVCzo42hqB+CDKbWqfhlX8rMVsT
 2zi9UnCoO6Qe1CM0NAYD66nAH2hK2r3UrhzR+vTQqqaEZeW9L4CsZutRI1+MUxteRSjA
 aLsoUfLTq+NEuLHzog8bVMKb6Kvk5vi8tj2jovspGzhq4a8KMG488GBwB4UbFv4AdncX
 U/FXGrp2RdS49uOeMkzEiPBiwB+pJ9iLSYcGB5tITyUpuRTAqv6irpFHW/Uk3ebejpkg cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f6yupdwbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:44 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 234HKmR4006671;
 Mon, 4 Apr 2022 18:17:43 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f6yupdwbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:43 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 234IGv5X029328;
 Mon, 4 Apr 2022 18:17:42 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3f6e49dpwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 18:17:42 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 234IHfUZ56885616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 18:17:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C77DBAE066;
 Mon,  4 Apr 2022 18:17:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A601AE05F;
 Mon,  4 Apr 2022 18:17:39 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.125]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 18:17:38 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v5 2/9] vfio: tolerate migration protocol v1 uapi renames
Date: Mon,  4 Apr 2022 14:17:19 -0400
Message-Id: <20220404181726.60291-3-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220404181726.60291-1-mjrosato@linux.ibm.com>
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ioOMX-iz1SKRc0VmjWgQFYq-AllvTkeB
X-Proofpoint-ORIG-GUID: SMEZkbRAUTN0t7GnLVn0VuL3BSnVpvN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204040103
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The v1 uapi is deprecated and will be replaced by v2 at some point;
this patch just tolerates the renaming of uapi fields to reflect
v1 / deprecated status.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/vfio/common.c    |  2 +-
 hw/vfio/migration.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e3f5..7b1e12fb69 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -380,7 +380,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
+            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
                 (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
                 continue;
             } else {
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ff6b45de6b..e109cee551 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     }
 
     ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_SAVING);
+                                   VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state SAVING", vbasedev->name);
         return ret;
@@ -532,7 +532,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     int ret;
 
     ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
-                                   VFIO_DEVICE_STATE_SAVING);
+                                   VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state STOP and SAVING",
                      vbasedev->name);
@@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
+    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
@@ -730,7 +730,7 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          * start saving data.
          */
         if (state == RUN_STATE_SAVE_VM) {
-            value = VFIO_DEVICE_STATE_SAVING;
+            value = VFIO_DEVICE_STATE_V1_SAVING;
         } else {
             value = 0;
         }
@@ -768,8 +768,9 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
         ret = vfio_migration_set_state(vbasedev,
-                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
-                      VFIO_DEVICE_STATE_RUNNING);
+                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                         VFIO_DEVICE_STATE_RESUMING),
+                                       VFIO_DEVICE_STATE_RUNNING);
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
@@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
-                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
     if (ret) {
         goto add_blocker;
     }
-- 
2.27.0


