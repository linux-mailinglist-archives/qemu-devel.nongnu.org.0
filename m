Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A167D648948
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 20:57:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3jUf-0000I2-QO; Fri, 09 Dec 2022 14:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1p3jUe-0000Ha-8r; Fri, 09 Dec 2022 14:57:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1p3jUb-0003Em-Qr; Fri, 09 Dec 2022 14:57:12 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B9IhHB1014979; Fri, 9 Dec 2022 19:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZPlC0CwzNqYkIhjmuuZBPdXp3sR0wa9Ejv/ZhemKrtE=;
 b=H8VGPbbUCpW2IdDxe5ZXbWI4M505c61JGY/6hm0r6ESWPMjNL7Rn9q4Nexc08i4JZEl3
 qwPy/bf8X28SkYs+KBBj8vi2S5SLjZ8t7mpb3o8ZKu/6Ze6wF38yUKC8E/wtUpJXiANG
 kUgbpHiabaCnYghLP7LFI+lPEuGZwWIY89gsnpPaprY3lbRYquIJEAw31Zl2PhCiCDDP
 l49EztX0NcsSIz0qf9iGmfi+CDvzYn9jIQS48sNZn9icfXCGHVrdprPK2KVdBWt0dYWi
 1igECFiSLe0sfPK1LfZD5TnD6sVtROAsLSSCnrbl9ayrWRloRd1AC35LkW/ZYpsVZEg/ 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mc10r09kr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 19:57:04 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B9JrXL0008848;
 Fri, 9 Dec 2022 19:57:04 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mc10r09kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 19:57:04 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B9J5ke4032031;
 Fri, 9 Dec 2022 19:57:03 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3m9pdafvby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Dec 2022 19:57:03 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B9Jv11T58786252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Dec 2022 19:57:01 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCE7358056;
 Fri,  9 Dec 2022 19:57:01 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A982A58052;
 Fri,  9 Dec 2022 19:57:00 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.69.73]) by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  9 Dec 2022 19:57:00 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 thuth@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Subject: [PATCH] s390x/pci: reset ISM passthrough devices on shutdown and
 system reset
Date: Fri,  9 Dec 2022 14:57:00 -0500
Message-Id: <20221209195700.263824-1-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N84R-4WK-spHN1yutVFlPBUg5cf-QrVY
X-Proofpoint-ORIG-GUID: bMwFXGEqfulMMand9t2MmhYj_B9tNUZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_11,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090159
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ISM device firmware stores unique state information that can
can cause a wholesale unmap of the associated IOMMU (e.g. when
we get a termination signal for QEMU) to trigger firmware errors
because firmware believes we are attempting to invalidate entries
that are still in-use by the guest OS (when in fact that guest is
in the process of being terminated or rebooted).
To alleviate this, register both a shutdown notifier (for unexpected
termination cases e.g. virsh destroy) as well as a reset callback
(for cases like guest OS reboot).  For each of these scenarios, trigger
PCI device reset; this is enough to indicate to firmware that the IOMMU
is no longer in-use by the guest OS, making it safe to invalidate any
associated IOMMU entries.

Fixes: 15d0e7942d3b ("s390x/pci: don't fence interpreted devices without MSI-X")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c         | 28 ++++++++++++++++++++++++++++
 hw/s390x/s390-pci-vfio.c        |  2 ++
 include/hw/s390x/s390-pci-bus.h |  5 +++++
 3 files changed, 35 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 977e7daa15..02751f3597 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -24,6 +24,8 @@
 #include "hw/pci/msi.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
 
 #ifndef DEBUG_S390PCI_BUS
 #define DEBUG_S390PCI_BUS  0
@@ -150,10 +152,30 @@ out:
     psccb->header.response_code = cpu_to_be16(rc);
 }
 
+static void s390_pci_shutdown_notifier(Notifier *n, void *opaque)
+{
+    S390PCIBusDevice *pbdev = container_of(n, S390PCIBusDevice,
+                                           shutdown_notifier);
+
+    pci_device_reset(pbdev->pdev);
+}
+
+static void s390_pci_reset_cb(void *opaque)
+{
+    S390PCIBusDevice *pbdev = opaque;
+
+    pci_device_reset(pbdev->pdev);
+}
+
 static void s390_pci_perform_unplug(S390PCIBusDevice *pbdev)
 {
     HotplugHandler *hotplug_ctrl;
 
+    if (pbdev->pft == ZPCI_PFT_ISM) {
+        notifier_remove(&pbdev->shutdown_notifier);
+        qemu_unregister_reset(s390_pci_reset_cb, pbdev);
+    }
+
     /* Unplug the PCI device */
     if (pbdev->pdev) {
         DeviceState *pdev = DEVICE(pbdev->pdev);
@@ -1111,6 +1133,12 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                 pbdev->fh |= FH_SHM_VFIO;
                 pbdev->forwarding_assist = false;
             }
+            /* Register shutdown notifier and reset callback for ISM devices */
+            if (pbdev->pft == ZPCI_PFT_ISM) {
+                pbdev->shutdown_notifier.notify = s390_pci_shutdown_notifier;
+                qemu_register_shutdown_notifier(&pbdev->shutdown_notifier);
+                qemu_register_reset(s390_pci_reset_cb, pbdev);
+            }
         } else {
             pbdev->fh |= FH_SHM_EMUL;
             /* Always intercept emulated devices */
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 5f0adb0b4a..419763f829 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -122,6 +122,8 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     /* The following values remain 0 until we support other FMB formats */
     pbdev->zpci_fn.fmbl = 0;
     pbdev->zpci_fn.pft = 0;
+    /* Store function type separately for type-specific behavior */
+    pbdev->pft = cap->pft;
 }
 
 static bool get_host_fh(S390PCIBusDevice *pbdev, struct vfio_device_info *info,
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 0605fcea24..4c812c65db 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -39,6 +39,9 @@
 #define UID_CHECKING_ENABLED 0x01
 #define ZPCI_DTSM 0x40
 
+/* zPCI Function Types */
+#define ZPCI_PFT_ISM 5
+
 OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBusDevice, S390_PCI_DEVICE)
@@ -343,6 +346,7 @@ struct S390PCIBusDevice {
     uint16_t noi;
     uint16_t maxstbl;
     uint8_t sum;
+    uint8_t pft;
     S390PCIGroup *pci_group;
     ClpRspQueryPci zpci_fn;
     S390MsixInfo msix;
@@ -351,6 +355,7 @@ struct S390PCIBusDevice {
     MemoryRegion msix_notify_mr;
     IndAddr *summary_ind;
     IndAddr *indicator;
+    Notifier shutdown_notifier;
     bool pci_unplug_request_processed;
     bool unplug_requested;
     bool interp;
-- 
2.38.1


