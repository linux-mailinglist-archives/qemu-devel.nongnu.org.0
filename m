Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA504D8D85
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:55:27 +0100 (CET)
Received: from localhost ([::1]:50518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqms-0002jJ-HD
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:55:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhv-0002CC-AG; Mon, 14 Mar 2022 15:50:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqht-0003L2-Kp; Mon, 14 Mar 2022 15:50:19 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlVvM035035; 
 Mon, 14 Mar 2022 19:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aXvx6PyzZldBHixFGOuJEyHVe3aRM30bqORsujKWtaE=;
 b=MtKzs5cQOMx/96y9bMPqwWVZ0cZQc/K8Prj+TCpibFWEZW9HB7Yg1ej6po509MMusLUh
 re6jTkyXte0RSXCwAauyXwL/bT3H9VJwDo0Wb31zTgMA+tkp+ZSGO5W1XRRcaEBK/YVF
 yJSgW+antnj38s5VEKi80TkKzQD9eO46jGVBya/qrHiJJ78t8j9vpK1AkIqC4+SE3U+q
 lnSDE3uRhNAmXGjQ0XaHS48iEzebLuSAtiOL3fDGdTcO2yyopr6CZ8cEiep1oR9FjvMa
 R4hHM0rp+vqmvi7oLAVh1mwWM9Z3fVh77LA9id7H4s6o+nAEfTxZ09Yw9z3pKHaes5Jx Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6d9gqd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:16 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJlql3035819;
 Mon, 14 Mar 2022 19:50:15 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6d9gqct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:15 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlCxF009569;
 Mon, 14 Mar 2022 19:50:14 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3erk59ccf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJoCr811272674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:50:12 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89CBC11206B;
 Mon, 14 Mar 2022 19:50:12 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23032112069;
 Mon, 14 Mar 2022 19:50:07 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:50:06 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 08/11] s390x/pci: use KVM-managed IOMMU for interpretation
Date: Mon, 14 Mar 2022 15:49:17 -0400
Message-Id: <20220314194920.58888-9-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314194920.58888-1-mjrosato@linux.ibm.com>
References: <20220314194920.58888-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qqQOzCgN7a76QUnleGULRcEGONjE3Gxn
X-Proofpoint-ORIG-GUID: PooLvps3kk9YHOM0rwBrdSlf8YLAq4Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140116
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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

When interpreting zPCI instructions, KVM will control the IOMMU mappings
in response to RPCIT instructions rather than relying on mapping ioctls
from userspace.  Mark the vfio device in pre_plug so that the appropriate
iommu domain will be allocated on the host during VFIO_SET_IOMMU.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c          | 11 +++++++++++
 hw/s390x/s390-pci-vfio.c         | 22 ++++++++++++++++++++++
 include/hw/s390x/s390-pci-vfio.h |  5 +++++
 3 files changed, 38 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 5043b8c85c..513a276711 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -950,6 +950,17 @@ static void s390_pcihost_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             error_setg(errp, "multifunction not supported in s390");
             return;
         }
+        /*
+         * If we have a vfio-pci device that wishes to use interpretation
+         * we must update the host IOMMU domain ops.
+         */
+        if (s390_pci_kvm_zpciop_allowed() &&
+            object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
+            if (s390_pci_set_kvm_iommu(s, dev)) {
+                error_setg(errp, "KVM IOMMU not available for interpretation");
+                return;
+            }
+        }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_S390_PCI_DEVICE)) {
         S390PCIBusDevice *pbdev = S390_PCI_DEVICE(dev);
 
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 4bf0a7e22d..7808e8d939 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -324,3 +324,25 @@ void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
 
     return;
 }
+
+/*
+ * This function will determine if the specified VFIOPCIDevice is linked to a
+ * zPCI device that requests interpretation support.  In this case, we must
+ * inform vfio that the KVM-managed IOMMU should be requested when the
+ * VFIO_SET_IOMMU ioctl is issued.
+ */
+int s390_pci_set_kvm_iommu(S390pciState *s, DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI(dev);
+    S390PCIBusDevice *pbdev = s390_pci_find_dev_by_target(s, dev->id);
+
+    if (!pbdev) {
+        return -ENODEV;
+    }
+
+    if (pbdev->interp) {
+        vdev->kvm_managed_iommu = true;
+    }
+
+    return 0;
+}
diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index 0c2e4b5175..5026f978c2 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -22,6 +22,7 @@ S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
 void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
 bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh);
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
+int s390_pci_set_kvm_iommu(S390pciState *s, DeviceState *dev);
 #else
 static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
 {
@@ -40,6 +41,10 @@ static inline bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev,
     return false;
 }
 static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
+static inline int s390_pci_set_kvm_iommu(S390pciState *s, DeviceState *dev)
+{
+    return -EINVAL;
+}
 #endif
 
 #endif
-- 
2.27.0


