Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC51A2DDB3C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:18:48 +0100 (CET)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq1bj-0002X1-SG
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kq1Zu-0001Ds-PJ; Thu, 17 Dec 2020 17:16:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:6662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kq1Zo-00032R-3b; Thu, 17 Dec 2020 17:16:54 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHMBTH8035504; Thu, 17 Dec 2020 17:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=NqV8Pq1HUKwZb/iAteyrlOi5/s2o5CEqSRp1v53RnTI=;
 b=AdrbU7finpj5PPhYz4DSa8H1E5QIWh8UV0j3Up6gB+OHgmjSbkfeQib/852IRKJCUdgk
 th4wDWzUQMDsKe0giBYU/RCOgaJ5yEQMvTlxoSi9quW5Pw6BO5y8VXG0xnpuTMmgV6vK
 bIB7gbGwtcpanIBC3T5+zc8q3phJcz+VN7LsxILOTRndZdF9w9zDDg+UIzO1TdFM4IBu
 zRmXDiW10wWKiRe3ySj8UgJamYmXUs29rMH+966JYUYrkef17GC0m9jBO5BCXVNp87ni
 q/MQBo6NdcwVD0mIkMBA2flBSSXs+ZfurDnR//6yXBeazVJQSdAh6YZInsBSUjF2wh+q aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gfwfg37v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 17:16:46 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BHMBeiu035788;
 Thu, 17 Dec 2020 17:16:46 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35gfwfg37n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 17:16:46 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHM9jBF025740;
 Thu, 17 Dec 2020 22:16:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 35cng9aj8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 22:16:45 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHMGib530933492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 22:16:44 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 290836A047;
 Thu, 17 Dec 2020 22:16:44 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09C4F6A07C;
 Thu, 17 Dec 2020 22:16:43 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.143.229])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 22:16:42 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
Date: Thu, 17 Dec 2020 17:16:37 -0500
Message-Id: <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_14:2020-12-17,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=903 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170142
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In pcistb_service_handler, a call is made to validate that the memory
region can be accessed.  However, the call is made using the entire length
of the pcistb operation, which can be larger than the allowed memory
access size (8).  Since we already know that the provided buffer is a
multiple of 8, fix the call to memory_region_access_valid to iterate
over the memory region in the same way as the subsequent call to
memory_region_dispatch_write.

Fixes: 863f6f52b7 ("s390: implement pci instructions")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index e230293..76b08a3 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
 
-    if (!memory_region_access_valid(mr, offset, len, true,
-                                    MEMTXATTRS_UNSPECIFIED)) {
-        s390_program_interrupt(env, PGM_OPERAND, ra);
-        return 0;
+    for (i = 0; i < len; i += 8) {
+        if (!memory_region_access_valid(mr, offset + i, 8, true,
+                                        MEMTXATTRS_UNSPECIFIED)) {
+            s390_program_interrupt(env, PGM_OPERAND, ra);
+            return 0;
+        }
     }
 
     if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
-- 
1.8.3.1


