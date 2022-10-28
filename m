Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19F611B2B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:49:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVLx-00083Q-9C; Fri, 28 Oct 2022 15:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVKu-0007sc-Tt; Fri, 28 Oct 2022 15:48:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVKs-00084N-Gc; Fri, 28 Oct 2022 15:48:12 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SJiIbQ007068;
 Fri, 28 Oct 2022 19:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pjuDXaF8RyohrXvfJmk+1y+Q4Pz6Xe0BzfZQouZ6zQA=;
 b=dNYGq/LvjmPDIQAsMSTt2ljoMkOB7il+M/HKQAwuLQzaQ01Y4xUee/ns2Hg6Q9z9DTTh
 35/wrmGm0XVUptItz200h9mCWW0RUZdn5s93JCJwB1oEuz19smUafjtzmDQKX0TyvUZW
 I4SGhrHqsGvozNerxzRVnaFKISXiUgQqdwaU77W8YU5w6syL8eTLZ/I/M0NW4+xkWNqH
 gKb/qAUa1R9wI4lyBB/36KX8zhpBQN0+L3F9/MAetqvXbFismL+xApcKz2Dg0s7ZJQEE
 GS0Cz7PYPAS9iLRneO7TabraeWrrkClMCh1Fh3UPw1jtY9sZ9Lq3vgPUBqCQQ0gEIllA 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgngc830q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:06 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SJkhAE016760;
 Fri, 28 Oct 2022 19:48:05 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgngc830a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:05 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SJa3Tj008805;
 Fri, 28 Oct 2022 19:48:05 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3kfah7wjdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SJm2XV60817798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 19:48:02 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98A455805A;
 Fri, 28 Oct 2022 19:48:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A494558068;
 Fri, 28 Oct 2022 19:48:02 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.93.208]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 19:48:02 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 3/3] s390x/pci: shrink DMA aperture to be bound by vfio DMA
 limit
Date: Fri, 28 Oct 2022 15:47:58 -0400
Message-Id: <20221028194758.204007-4-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028194758.204007-1-mjrosato@linux.ibm.com>
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6jUOY68sg8K535nzbjugr4MLO7k65yQJ
X-Proofpoint-ORIG-GUID: -GaIcLVmAIDqhjgmE7pJLvM1xcxYoipk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=989 clxscore=1015
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280123
Received-SPF: pass client-ip=148.163.158.5;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, s390x-pci performs accounting against the vfio DMA
limit and triggers the guest to clean up mappings when the limit
is reached. Let's go a step further and also limit the size of
the supported DMA aperture reported to the guest based upon the
initial vfio DMA limit reported for the container (if less than
than the size reported by the firmware/host zPCI layer).  This
avoids processing sections of the guest DMA table during global
refresh that, for common use cases, will never be used anway, and
makes exhausting the vfio DMA limit due to mismatch between guest
aperture size and host limit far less likely and more indicitive
of an error.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-vfio.c        | 11 +++++++++++
 include/hw/s390x/s390-pci-bus.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 2aefa508a0..99806e2a84 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -84,6 +84,7 @@ S390PCIDMACount *s390_pci_start_dma_count(S390pciState *s,
     cnt->users = 1;
     cnt->avail = avail;
     QTAILQ_INSERT_TAIL(&s->zpci_dma_limit, cnt, link);
+    pbdev->iommu->max_dma_limit = avail;
     return cnt;
 }
 
@@ -103,6 +104,7 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     struct vfio_info_cap_header *hdr;
     struct vfio_device_info_cap_zpci_base *cap;
     VFIOPCIDevice *vpci =  container_of(pbdev->pdev, VFIOPCIDevice, pdev);
+    uint64_t vfio_size;
 
     hdr = vfio_get_device_info_cap(info, VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
 
@@ -122,6 +124,15 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
     /* The following values remain 0 until we support other FMB formats */
     pbdev->zpci_fn.fmbl = 0;
     pbdev->zpci_fn.pft = 0;
+
+    /*
+     * If appropriate, reduce the size of the supported DMA aperture reported
+     * to the guest based upon the vfio DMA limit.
+     */
+    vfio_size = pbdev->iommu->max_dma_limit << TARGET_PAGE_BITS;
+    if (vfio_size < (cap->end_dma - cap->start_dma + 1)) {
+        pbdev->zpci_fn.edma = cap->start_dma + vfio_size - 1;
+    }
 }
 
 static bool get_host_fh(S390PCIBusDevice *pbdev, struct vfio_device_info *info,
diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index 0605fcea24..1c46e3a269 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -278,6 +278,7 @@ struct S390PCIIOMMU {
     uint64_t g_iota;
     uint64_t pba;
     uint64_t pal;
+    uint64_t max_dma_limit;
     GHashTable *iotlb;
     S390PCIDMACount *dma_limit;
 };
-- 
2.37.3


