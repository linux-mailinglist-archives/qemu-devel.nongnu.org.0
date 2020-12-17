Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836512DD427
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:28:37 +0100 (CET)
Received: from localhost ([::1]:37682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvCm-0002af-In
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kpulZ-00048n-U1; Thu, 17 Dec 2020 10:00:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kpulW-0007fu-VF; Thu, 17 Dec 2020 10:00:28 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BHEVr0Z129773; Thu, 17 Dec 2020 10:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=2hHjAsYNeO3VDmOsMoaF2fCOAvAkCmD3evtAlrh1DDo=;
 b=Wb+HTUiCc0WjenpKXZQdA+wq2Fkxf5GPnWEqkG0f0pbq7f7QrixS3iCDyGJdH5twtxiq
 DMjZQxKGHRJlwNBCBIrX9/BLL852b2mGOWaCwTx45DpsZ707KtvOxulGc2eJHQOrzs5e
 gC1atL7CivWxXUO7lgQlm9nqH9JZ47Q0cQgGbLrYOt19MJqlHW13Uz7VCGutvC8hX2Be
 IabO49ef/3kbHAhNqXjxwvVtda7I5QCTskjhuQzkBjpNELRW6nRxKs7vliskZ0+lyqvP
 fuy0Q+BzY5tOpMP4JLTmvJCu5uhdmTwNSuk0HEe8+FJdSX5jhsenD2+02CiPbYNrUMC0 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g8k0t5x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 10:00:22 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BHEWVm2132469;
 Thu, 17 Dec 2020 10:00:21 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35g8k0t5vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 10:00:21 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BHEwmAW008963;
 Thu, 17 Dec 2020 15:00:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 35cng97gy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 15:00:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BHEx3H216318910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 14:59:03 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E4736E052;
 Thu, 17 Dec 2020 14:59:03 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 420C16E04E;
 Thu, 17 Dec 2020 14:59:02 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.143.229])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Dec 2020 14:59:02 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH 2/2] s390x/pci: Fix memory_region_access_valid call
Date: Thu, 17 Dec 2020 09:58:56 -0500
Message-Id: <1608217136-5690-3-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1608217136-5690-1-git-send-email-mjrosato@linux.ibm.com>
References: <1608217136-5690-1-git-send-email-mjrosato@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_09:2020-12-15,
 2020-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=903
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012170099
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
index e230293..f93f8ba 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
 
-    if (!memory_region_access_valid(mr, offset, len, true,
-                                    MEMTXATTRS_UNSPECIFIED)) {
-        s390_program_interrupt(env, PGM_OPERAND, ra);
-        return 0;
+    for (i = 0; i < len / 8; i++) {
+        if (!memory_region_access_valid(mr, offset + i * 8, 8, true,
+                                        MEMTXATTRS_UNSPECIFIED)) {
+            s390_program_interrupt(env, PGM_OPERAND, ra);
+            return 0;
+        }
     }
 
     if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
-- 
1.8.3.1


