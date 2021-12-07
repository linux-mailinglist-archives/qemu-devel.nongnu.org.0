Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7228746C65D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 22:09:36 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muhiR-0001rf-GX
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 16:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1muheR-0002rk-0A; Tue, 07 Dec 2021 16:05:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1muheJ-0000Hw-Hl; Tue, 07 Dec 2021 16:05:26 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7JfONG004181; 
 Tue, 7 Dec 2021 21:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aRh/YQqOJ8W7+VEA5GLBqez9/eSsxsaG2cHcBNqFhQg=;
 b=riTlezKCFEUhrYUgyOAxtu7BZ840xFLJMa4jxJOugthBjHva/XAyd6KioNbJtdJ6/gYS
 0qpT7MQp0E3WBwJiIEQtCurzZAHBwo1tWsN1uxUWw3u2g1PtAYYPrPiustU+YhirC+aa
 lp+elcT6NO9O7Jp5PHYeysn7cx0R0HJPYMwLIpzioOqVzCMuXlV6IaRU71ahVUo1WaPQ
 kA+lxt63owHwRp2BtfxuNeIDF3CGr2c6j6B0MvMGamiKCiexIXo9HwfRA8Fv+2UYm6dE
 sz7Z2KnAf3O8QN9zBC7OwFbcl0dAdTJZtWfcP2urXwMLWDSBzrm8wxRC2zg+kz3/cnzQ Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctd9kj98x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 21:05:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7Kmxdm025921;
 Tue, 7 Dec 2021 21:05:16 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctd9kj98k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 21:05:16 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7KvqKt022114;
 Tue, 7 Dec 2021 21:05:15 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3cqyyb394j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 21:05:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7L5DGu1049188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 21:05:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB447AE06D;
 Tue,  7 Dec 2021 21:05:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 758D2AE05C;
 Tue,  7 Dec 2021 21:05:10 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.152.43]) by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 21:05:10 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH 10/12] s390x/pci: use I/O Address Translation assist when
 interpreting
Date: Tue,  7 Dec 2021 16:04:23 -0500
Message-Id: <20211207210425.150923-11-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211207210425.150923-1-mjrosato@linux.ibm.com>
References: <20211207210425.150923-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EE8fP-l_AT6oxH7pWJVzwJqTy7OeFuoL
X-Proofpoint-ORIG-GUID: 254mLnO7B_s3B2LU-YXTyC5-vMYBsSxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_08,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070128
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Allow the underlying kvm host to handle the Refresh PCI Translation
instruction intercepts.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c          |  6 ++--
 hw/s390x/s390-pci-inst.c         | 51 ++++++++++++++++++++++++++++++--
 hw/s390x/s390-pci-vfio.c         | 33 +++++++++++++++++++++
 include/hw/s390x/s390-pci-inst.h |  2 +-
 include/hw/s390x/s390-pci-vfio.h | 10 +++++++
 5 files changed, 95 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 1ae8792a26..ab442f17fb 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -196,7 +196,7 @@ void s390_pci_sclp_deconfigure(SCCB *sccb)
             pci_dereg_irqs(pbdev);
         }
         if (pbdev->iommu->enabled) {
-            pci_dereg_ioat(pbdev->iommu);
+            pci_dereg_ioat(pbdev);
         }
         pbdev->state = ZPCI_FS_STANDBY;
         rc = SCLP_RC_NORMAL_COMPLETION;
@@ -1261,7 +1261,7 @@ static void s390_pcihost_reset(DeviceState *dev)
                 pci_dereg_irqs(pbdev);
             }
             if (pbdev->iommu->enabled) {
-                pci_dereg_ioat(pbdev->iommu);
+                pci_dereg_ioat(pbdev);
             }
             pbdev->state = ZPCI_FS_STANDBY;
             s390_pci_perform_unplug(pbdev);
@@ -1402,7 +1402,7 @@ static void s390_pci_device_reset(DeviceState *dev)
         pci_dereg_irqs(pbdev);
     }
     if (pbdev->iommu->enabled) {
-        pci_dereg_ioat(pbdev->iommu);
+        pci_dereg_ioat(pbdev);
     }
 
     fmb_timer_free(pbdev);
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 02093e82f9..598e5a5d52 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -978,6 +978,24 @@ int pci_dereg_irqs(S390PCIBusDevice *pbdev)
     return 0;
 }
 
+static int reg_ioat_interp(S390PCIBusDevice *pbdev, uint64_t iota)
+{
+    int rc;
+
+    rc = s390_pci_probe_ioat(pbdev);
+    if (rc) {
+        return rc;
+    }
+
+    rc = s390_pci_set_ioat(pbdev, iota);
+    if (rc) {
+        return rc;
+    }
+
+    pbdev->iommu->enabled = true;
+    return 0;
+}
+
 static int reg_ioat(CPUS390XState *env, S390PCIBusDevice *pbdev, ZpciFib fib,
                     uintptr_t ra)
 {
@@ -995,6 +1013,16 @@ static int reg_ioat(CPUS390XState *env, S390PCIBusDevice *pbdev, ZpciFib fib,
         return -EINVAL;
     }
 
+    /* If this is an interpreted device, we must use the IOAT assist */
+    if (pbdev->interp) {
+        if (reg_ioat_interp(pbdev, g_iota)) {
+            error_report("failure starting ioat assist");
+            s390_program_interrupt(env, PGM_OPERAND, ra);
+            return -EINVAL;
+        }
+        return 0;
+    }
+
     /* currently we only support designation type 1 with translation */
     if (!(dt == ZPCI_IOTA_RTTO && t)) {
         error_report("unsupported ioat dt %d t %d", dt, t);
@@ -1011,8 +1039,25 @@ static int reg_ioat(CPUS390XState *env, S390PCIBusDevice *pbdev, ZpciFib fib,
     return 0;
 }
 
-void pci_dereg_ioat(S390PCIIOMMU *iommu)
+static void dereg_ioat_interp(S390PCIBusDevice *pbdev)
 {
+    if (s390_pci_probe_ioat(pbdev) != 0) {
+        return;
+    }
+
+    s390_pci_set_ioat(pbdev, 0);
+    pbdev->iommu->enabled = false;
+}
+
+void pci_dereg_ioat(S390PCIBusDevice *pbdev)
+{
+    S390PCIIOMMU *iommu = pbdev->iommu;
+
+    if (pbdev->interp) {
+        dereg_ioat_interp(pbdev);
+        return;
+    }
+
     s390_pci_iommu_disable(iommu);
     iommu->pba = 0;
     iommu->pal = 0;
@@ -1251,7 +1296,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
             cc = ZPCI_PCI_LS_ERR;
             s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
         } else {
-            pci_dereg_ioat(pbdev->iommu);
+            pci_dereg_ioat(pbdev);
         }
         break;
     case ZPCI_MOD_FC_REREG_IOAT:
@@ -1262,7 +1307,7 @@ int mpcifc_service_call(S390CPU *cpu, uint8_t r1, uint64_t fiba, uint8_t ar,
             cc = ZPCI_PCI_LS_ERR;
             s390_set_status_code(env, r1, ZPCI_MOD_ST_SEQUENCE);
         } else {
-            pci_dereg_ioat(pbdev->iommu);
+            pci_dereg_ioat(pbdev);
             if (reg_ioat(env, pbdev, fib, ra)) {
                 cc = ZPCI_PCI_LS_ERR;
                 s390_set_status_code(env, r1, ZPCI_MOD_ST_INSUF_RES);
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 6f9271df87..6fc03a858a 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -240,6 +240,39 @@ int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable, bool assist)
     return rc;
 }
 
+int s390_pci_probe_ioat(S390PCIBusDevice *pbdev)
+{
+    VFIOPCIDevice *vdev = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+    struct vfio_device_feature feat = {
+        .argsz = sizeof(struct vfio_device_feature),
+        .flags = VFIO_DEVICE_FEATURE_PROBE + VFIO_DEVICE_FEATURE_ZPCI_IOAT
+    };
+
+    assert(vdev);
+
+    return ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, &feat);
+}
+
+int s390_pci_set_ioat(S390PCIBusDevice *pbdev, uint64_t iota)
+{
+    VFIOPCIDevice *vdev = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+    g_autofree struct vfio_device_feature *feat;
+    struct vfio_device_zpci_ioat *data;
+    int size;
+
+    assert(vdev);
+
+    size = sizeof(*feat) + sizeof(*data);
+    feat = g_malloc0(size);
+    feat->argsz = size;
+    feat->flags = VFIO_DEVICE_FEATURE_SET + VFIO_DEVICE_FEATURE_ZPCI_IOAT;
+
+    data = (struct vfio_device_zpci_ioat *)&feat->data;
+    data->iota = iota;
+
+    return ioctl(vdev->vbasedev.fd, VFIO_DEVICE_FEATURE, feat);
+}
+
 static void s390_pci_read_base(S390PCIBusDevice *pbdev,
                                struct vfio_device_info *info)
 {
diff --git a/include/hw/s390x/s390-pci-inst.h b/include/hw/s390x/s390-pci-inst.h
index a55c448aad..13566fb7b4 100644
--- a/include/hw/s390x/s390-pci-inst.h
+++ b/include/hw/s390x/s390-pci-inst.h
@@ -99,7 +99,7 @@ typedef struct ZpciFib {
 } QEMU_PACKED ZpciFib;
 
 int pci_dereg_irqs(S390PCIBusDevice *pbdev);
-void pci_dereg_ioat(S390PCIIOMMU *iommu);
+void pci_dereg_ioat(S390PCIBusDevice *pbdev);
 int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra);
 int pcilg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
 int pcistg_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra);
diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index 6cec38a863..e7a2d8ff77 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -28,6 +28,8 @@ int s390_pci_probe_aif(S390PCIBusDevice *pbdev);
 int s390_pci_set_aif(S390PCIBusDevice *pbdev, ZpciFib *fib, bool enable,
                      bool assist);
 int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable, bool assist);
+int s390_pci_probe_ioat(S390PCIBusDevice *pbdev);
+int s390_pci_set_ioat(S390PCIBusDevice *pbdev, uint64_t iota);
 
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
 #else
@@ -68,6 +70,14 @@ static inline int s390_pci_get_aif(S390PCIBusDevice *pbdev, bool enable,
 {
     return -EINVAL;
 }
+static inline int s390_pci_probe_ioat(S390PCIBusDevice *pbdev)
+{
+    return -EINVAL;
+}
+static inline int s390_pci_set_ioat(S390PCIBusDevice *pbdev, uint64_t iota)
+{
+    return -EINVAL;
+}
 static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
 #endif
 
-- 
2.27.0


