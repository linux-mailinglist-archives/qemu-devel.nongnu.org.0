Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882DA53F065
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 22:45:18 +0200 (CEST)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyJb9-0000wB-2O
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 16:45:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nyJSp-0000X2-9H; Mon, 06 Jun 2022 16:36:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34038
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nyJSm-0006Yb-JS; Mon, 06 Jun 2022 16:36:38 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256KZQqV009240;
 Mon, 6 Jun 2022 20:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RmEBmyYM5Gz9ciSMbGWfakRuAQqPIc32fcku6p/KEm4=;
 b=kWd6X10mau2IskdvnFi22P6FQjrPg5HV0zOboMVmok9F1dqtBNUXoARGcN7v7iNzEx0u
 OTd4cyUEnu4o5omdtIBEsVcdMtZcvWNX7quJWAdW6yf9Y+U+M5+i7DfgqAbR75kIEKaq
 npw53CW12IqlkvO0t0C43r27fiZid1A9WQLOHB5tgiQ0SIIAqPc6gEUcB773AXLAD14k
 P1eH/wKg5wLplMcpumTjJFNMWC8dPmwydxcWyaTBqEnmsFzEquJvfQonAIbDpphGhDm4
 4CsmhcrwV0bUIZ++FjUls/6Z6yllXoB6clC4M/Har5gPMTJoXlWoHkCyRwZBU2vHm3P9 tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ghrreg0bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 20:36:34 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 256KaY92010912;
 Mon, 6 Jun 2022 20:36:34 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ghrreg0bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 20:36:34 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 256KKFQf030474;
 Mon, 6 Jun 2022 20:36:33 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 3gfy19fvy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 20:36:33 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 256KaXi462718276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jun 2022 20:36:33 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDBF728058;
 Mon,  6 Jun 2022 20:36:32 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EBC928059;
 Mon,  6 Jun 2022 20:36:28 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.163.20.188]) by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jun 2022 20:36:28 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v7 2/8] s390x/pci: add routine to get host function handle
 from CLP info
Date: Mon,  6 Jun 2022 16:36:08 -0400
Message-Id: <20220606203614.110928-3-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220606203614.110928-1-mjrosato@linux.ibm.com>
References: <20220606203614.110928-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DubxEMt6VQbrHw4ErxHAYhMaVIdA2Ebi
X-Proofpoint-ORIG-GUID: EBEzr3D_Dy-rNyz3QTnVacrVhMzQTrvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_06,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxlogscore=973 mlxscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206060081
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to interface with the underlying host zPCI device, we need
to know it's function handle.  Add a routine to grab this from the
vfio CLP capabilities chain.

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-vfio.c         | 83 ++++++++++++++++++++++++++------
 include/hw/s390x/s390-pci-vfio.h |  5 ++
 2 files changed, 72 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 6f80a47e29..4bf0a7e22d 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -124,6 +124,27 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     pbdev->zpci_fn.pft = 0;
 }
 
+static bool get_host_fh(S390PCIBusDevice *pbdev, struct vfio_device_info *info,
+                        uint32_t *fh)
+{
+    struct vfio_info_cap_header *hdr;
+    struct vfio_device_info_cap_zpci_base *cap;
+    VFIOPCIDevice *vpci =  container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+
+    hdr = vfio_get_device_info_cap(info, VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
+
+    /* Can only get the host fh with version 2 or greater */
+    if (hdr == NULL || hdr->version < 2) {
+        trace_s390_pci_clp_cap(vpci->vbasedev.name,
+                               VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
+        return false;
+    }
+    cap = (void *) hdr;
+
+    *fh = cap->fh;
+    return true;
+}
+
 static void s390_pci_read_group(S390PCIBusDevice *pbdev,
                                 struct vfio_device_info *info)
 {
@@ -217,25 +238,13 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
     memcpy(pbdev->zpci_fn.pfip, cap->pfip, CLP_PFIP_NR_SEGMENTS);
 }
 
-/*
- * This function will issue the VFIO_DEVICE_GET_INFO ioctl and look for
- * capabilities that contain information about CLP features provided by the
- * underlying host.
- * On entry, defaults have already been placed into the guest CLP response
- * buffers.  On exit, defaults will have been overwritten for any CLP features
- * found in the capability chain; defaults will remain for any CLP features not
- * found in the chain.
- */
-void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
+static struct vfio_device_info *get_device_info(S390PCIBusDevice *pbdev,
+                                                uint32_t argsz)
 {
-    g_autofree struct vfio_device_info *info = NULL;
+    struct vfio_device_info *info = g_malloc0(argsz);
     VFIOPCIDevice *vfio_pci;
-    uint32_t argsz;
     int fd;
 
-    argsz = sizeof(*info);
-    info = g_malloc0(argsz);
-
     vfio_pci = container_of(pbdev->pdev, VFIOPCIDevice, pdev);
     fd = vfio_pci->vbasedev.fd;
 
@@ -250,7 +259,8 @@ retry:
 
     if (ioctl(fd, VFIO_DEVICE_GET_INFO, info)) {
         trace_s390_pci_clp_dev_info(vfio_pci->vbasedev.name);
-        return;
+        free(info);
+        return NULL;
     }
 
     if (info->argsz > argsz) {
@@ -259,6 +269,47 @@ retry:
         goto retry;
     }
 
+    return info;
+}
+
+/*
+ * Get the host function handle from the vfio CLP capabilities chain.  Returns
+ * true if a fh value was placed into the provided buffer.  Returns false
+ * if a fh could not be obtained (ioctl failed or capabilitiy version does
+ * not include the fh)
+ */
+bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
+{
+    g_autofree struct vfio_device_info *info = NULL;
+
+    assert(fh);
+
+    info = get_device_info(pbdev, sizeof(*info));
+    if (!info) {
+        return false;
+    }
+
+    return get_host_fh(pbdev, info, fh);
+}
+
+/*
+ * This function will issue the VFIO_DEVICE_GET_INFO ioctl and look for
+ * capabilities that contain information about CLP features provided by the
+ * underlying host.
+ * On entry, defaults have already been placed into the guest CLP response
+ * buffers.  On exit, defaults will have been overwritten for any CLP features
+ * found in the capability chain; defaults will remain for any CLP features not
+ * found in the chain.
+ */
+void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
+{
+    g_autofree struct vfio_device_info *info = NULL;
+
+    info = get_device_info(pbdev, sizeof(*info));
+    if (!info) {
+        return;
+    }
+
     /*
      * Find the CLP features provided and fill in the guest CLP responses.
      * Always call s390_pci_read_base first as information from this could
diff --git a/include/hw/s390x/s390-pci-vfio.h b/include/hw/s390x/s390-pci-vfio.h
index ff708aef50..ae1b126ff7 100644
--- a/include/hw/s390x/s390-pci-vfio.h
+++ b/include/hw/s390x/s390-pci-vfio.h
@@ -20,6 +20,7 @@ bool s390_pci_update_dma_avail(int fd, unsigned int *avail);
 S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
                                           S390PCIBusDevice *pbdev);
 void s390_pci_end_dma_count(S390pciState *s, S390PCIDMACount *cnt);
+bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh);
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev);
 #else
 static inline bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
@@ -33,6 +34,10 @@ static inline S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
 }
 static inline void s390_pci_end_dma_count(S390pciState *s,
                                           S390PCIDMACount *cnt) { }
+static inline bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
+{
+    return false;
+}
 static inline void s390_pci_get_clp_info(S390PCIBusDevice *pbdev) { }
 #endif
 
-- 
2.27.0


