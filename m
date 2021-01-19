Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749C2FC1AA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:57:06 +0100 (CET)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1y3l-0005H0-Eu
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrr-0002nI-ST; Tue, 19 Jan 2021 15:44:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1l1xrq-0002Rc-2B; Tue, 19 Jan 2021 15:44:47 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JKXUgC131447; Tue, 19 Jan 2021 15:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=s2Q4hmWhLkwN5I1+JF1RVcICAPJ5Ov01oaWoQ9doJyA=;
 b=EgX+WMPf7yXhk99fBywG/iSaFsTEinoGbWc6xwE/tugvwOFv8QD+JYC1NavCaVqYJ1lr
 lsBaqxUgM0cgSNI4cEacXH7s8YSa5D23/y1AzOwlgXXdxiMm5WE6kTIc1P8cXhQWXCrt
 +nrqs5VgAWIgUATE26U3wNHm6ibGj+VB9VCfym27cEOSkOHsm3xPT3tDO3GuNChKFaxA
 E2muLjIhQeJcHjzlqHJgF8zuy60P4p7I11QNkqSgywIflHRhxy702B4w8PXfXeRKtxuj
 IH8xBHkt51zC303g+hmsxOgA5gMTb9ORNDLaIs5hpX2aJO7zs7ELrOklyFFkQj3F+54r gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31cew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:43 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JKXc2A132054;
 Tue, 19 Jan 2021 15:44:43 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665y31ce3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 15:44:43 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JKaUFs006595;
 Tue, 19 Jan 2021 20:44:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 363qs90wxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 20:44:41 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JKieec12583508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:44:40 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C098136051;
 Tue, 19 Jan 2021 20:44:40 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EEF813604F;
 Tue, 19 Jan 2021 20:44:38 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.56.144])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 20:44:38 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 8/8] s390x/pci: Prevent ISM device passthrough on older host
 kernels
Date: Tue, 19 Jan 2021 15:44:19 -0500
Message-Id: <1611089059-6468-9-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190114
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the underlying host does not provide CLP capabilities, we cannot tell
what type of function is being passed through, which means for ISM devices
we can't properly tell if the vfio I/O region is necessary.  If the ISM
device is allowed to pass through erroneously, it will not function
properly without the I/O region.  Therefore, check for unclassified devices
that do not have MSI-X support and still disallow these from being passed
through, using the same error as known ISM devices when the vfio I/O region
is unavailable.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c         | 13 +++++++++++++
 include/hw/s390x/s390-pci-bus.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 9d5c2c5..0dfdc88 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1037,6 +1037,19 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             if (pbdev->pft == ZPCI_PFT_ISM) {
                 ret = s390_pci_get_zpci_io_region(pbdev);
             }
+            /*
+             * If the device type is unclassified, it may be due to the fact
+             * that CLP info was not provided by vfio -- Which means we cannot
+             * tell if this is actually an ISM device, which will not be able
+             * to function properly without proper identification and the I/O
+             * region.  Therefore, attempt to identify the ISM device via the
+             * lack of MSI-X and only in this case prevent the device from
+             * being passed through.
+             */
+            else if (pbdev->pft == ZPCI_PFT_UNCLASSIFIED &&
+                     !pci_find_capability(pbdev->pdev, PCI_CAP_ID_MSIX)) {
+                ret = -EINVAL;
+            }
             if (ret) {
                 error_setg(errp, "vfio zPCI I/O region support is mandatory "
                            "for %02x:%02x.%01x", pci_dev_bus_num(pdev),
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index aaef890..d75aad8 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -44,6 +44,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBusDevice, S390_PCI_DEVICE)
 OBJECT_DECLARE_SIMPLE_TYPE(S390PCIIOMMU, S390_PCI_IOMMU)
 
 /* PCI Function Types */
+#define ZPCI_PFT_UNCLASSIFIED 0
 #define ZPCI_PFT_ISM 5
 
 #define HP_EVENT_TO_CONFIGURED        0x0301
-- 
1.8.3.1


