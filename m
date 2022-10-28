Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59755611B29
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:49:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooVLz-000067-Dk; Fri, 28 Oct 2022 15:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVKw-0007tD-H0; Fri, 28 Oct 2022 15:48:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1ooVKv-00084F-1e; Fri, 28 Oct 2022 15:48:14 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SJIqEI013693;
 Fri, 28 Oct 2022 19:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oMxIFN5RtppHnUAuO9brjKZYjERmcYxV//XuqwD6q8A=;
 b=h9zDzNdgq60zkEt5XVfJBJhnBXgey4Eek1U4E2Vnayp0vcKUrgK7SheuDeIz41e1fFYD
 rPD3giqftMNG66MQJZmjqmSnNJuQ/YPS3McAZjt2QSxvfKxAmikET4BYBoGYgtYLfz7l
 APTNVqEOSQthJTqG2YS4kdKLkCp0hYk0eIvLiMC+mNaEFEemWko6QTXyQtaQ06BU9AhK
 6JhgpCx3LsqoCMFCAPFKr0OXbEaXyPXHM+aUYbYcp7Rqk18716ePP63cptLjvknFDQzD
 vbUJasNKfH9CgqOSyj2kv1jCVLGRw3SqdCU/pTC4lldi65wvcL12rrrcOho7kVaCE5Xg XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgn4p0t41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:05 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SJJBl7015626;
 Fri, 28 Oct 2022 19:48:04 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kgn4p0t3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:04 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SJZURY030058;
 Fri, 28 Oct 2022 19:48:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3kfah2p378-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Oct 2022 19:48:04 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29SJm1xi17957424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 19:48:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83E9958061;
 Fri, 28 Oct 2022 19:48:02 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5784458063;
 Fri, 28 Oct 2022 19:48:01 +0000 (GMT)
Received: from li-2311da4c-2e09-11b2-a85c-c003041e9174.ibm.com.com (unknown
 [9.160.93.208]) by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Oct 2022 19:48:01 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 2/3] s390x/pci: coalesce unmap operations
Date: Fri, 28 Oct 2022 15:47:57 -0400
Message-Id: <20221028194758.204007-3-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028194758.204007-1-mjrosato@linux.ibm.com>
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rKu1RKWBHGPxww929r_wvjIlMytpakZD
X-Proofpoint-GUID: 1LdIqpb8KGND4TKKomYS14MdNSLL8jdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_10,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2210280123
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

Currently, each unmapped page is handled as an individual iommu
region notification.  Attempt to group contiguous unmap operations
into fewer notifications to reduce overhead.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 7cc4bcf850..66e764f901 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -640,6 +640,8 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
         }
         g_hash_table_remove(iommu->iotlb, &entry->iova);
         inc_dma_avail(iommu);
+        /* Don't notify the iommu yet, maybe we can bundle contiguous unmaps */
+        goto out;
     } else {
         if (cache) {
             if (cache->perm == entry->perm &&
@@ -663,15 +665,44 @@ static uint32_t s390_pci_update_iotlb(S390PCIIOMMU *iommu,
         dec_dma_avail(iommu);
     }
 
+    /*
+     * All associated iotlb entries have already been cleared, trigger the
+     * unmaps.
+     */
     memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
 
 out:
     return iommu->dma_limit ? iommu->dma_limit->avail : 1;
 }
 
+static void s390_pci_batch_unmap(S390PCIIOMMU *iommu, uint64_t iova,
+                                 uint64_t len)
+{
+    uint64_t remain = len, start = iova, end = start + len - 1, mask, size;
+    IOMMUTLBEvent event = {
+        .type = IOMMU_NOTIFIER_UNMAP,
+        .entry = {
+            .target_as = &address_space_memory,
+            .translated_addr = 0,
+            .perm = IOMMU_NONE,
+        },
+    };
+
+    while (remain >= TARGET_PAGE_SIZE) {
+        mask = dma_aligned_pow2_mask(start, end, 64);
+        size = mask + 1;
+        event.entry.iova = start;
+        event.entry.addr_mask = mask;
+        memory_region_notify_iommu(&iommu->iommu_mr, 0, event);
+        start += size;
+        remain -= size;
+    }
+}
+
 int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
 {
     CPUS390XState *env = &cpu->env;
+    uint64_t iova, coalesce = 0;
     uint32_t fh;
     uint16_t error = 0;
     S390PCIBusDevice *pbdev;
@@ -742,6 +773,21 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
             break;
         }
 
+        /*
+         * If this is an unmap of a PTE, let's try to coalesce multiple unmaps
+         * into as few notifier events as possible.
+         */
+        if (entry.perm == IOMMU_NONE && entry.len == TARGET_PAGE_SIZE) {
+            if (coalesce == 0) {
+                iova = entry.iova;
+            }
+            coalesce += entry.len;
+        } else if (coalesce > 0) {
+            /* Unleash the coalesced unmap before processing a new map */
+            s390_pci_batch_unmap(iommu, iova, coalesce);
+            coalesce = 0;
+        }
+
         start += entry.len;
         while (entry.iova < start && entry.iova < end) {
             if (dma_avail > 0 || entry.perm == IOMMU_NONE) {
@@ -759,6 +805,11 @@ int rpcit_service_call(S390CPU *cpu, uint8_t r1, uint8_t r2, uintptr_t ra)
             }
         }
     }
+    if (coalesce) {
+            /* Unleash the coalesced unmap before finishing rpcit */
+            s390_pci_batch_unmap(iommu, iova, coalesce);
+            coalesce = 0;
+    }
     if (again && dma_avail > 0)
         goto retry;
 err:
-- 
2.37.3


