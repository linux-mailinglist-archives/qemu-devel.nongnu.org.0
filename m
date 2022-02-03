Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15D64A90EB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:54:36 +0100 (CET)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFkzr-0002zO-Mp
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkpD-0001FP-Gh; Thu, 03 Feb 2022 17:43:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32225
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkpB-0004W8-EW; Thu, 03 Feb 2022 17:43:35 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213MW7Xc024429; 
 Thu, 3 Feb 2022 22:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tVFh5N4tR+PiU9Mugw8BgLE9CY5BbpRMmZl77DYpxeY=;
 b=MHFDALLcBWb5tjZ20+0kHvztVQVdek8axZJ0PFScKBA0VnOSd2vYWozaRewzJYJyxsbe
 BSMiQWWfJ0msDJQqNOgMpx/nFzXJ6A9VjM48gmNeVMtIzqFZ0TLzOAA1fqeSneALF8Xz
 IYmprTOtMD2b0oQ2aIUN4dZ1zqHze1k7c9rNCUJyvwWXRp5fItwe7rzB//tAa1mLh4gA
 ESyfBn0YEtr1A1DNbxFKP8GszMhUtK6zJ/VNo5NTSMKFVTmT57ZDQ3FcLtNsIpwM9zW9
 xQG21v4wqYLDVtgl3PcBUAtIcnVmzc+4w9m7o5u1YWgVhYRAI63mqNjhSJvaj4MKhZSX vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qx7r6pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:14 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213MWKTn024961;
 Thu, 3 Feb 2022 22:43:13 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qx7r6pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:13 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213MgcYQ015062;
 Thu, 3 Feb 2022 22:43:13 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3e0r0kg2ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:13 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213MhCpD35586420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 22:43:12 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CA6CBE051;
 Thu,  3 Feb 2022 22:43:12 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEFFDBE056;
 Thu,  3 Feb 2022 22:43:10 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 22:43:10 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] target/ppc: 7xx: Set SRRs directly in exception code
Date: Thu,  3 Feb 2022 19:42:46 -0300
Message-Id: <20220203224246.1446652-11-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203224246.1446652-1-farosas@linux.ibm.com>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cs4ob87X-alnHWh6BnZJiLqnOXuzlH0C
X-Proofpoint-ORIG-GUID: y7c7kLKax-c2fVKsdaVZQTGrd4eoKjHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=679 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030135
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 7xx CPUs don't have alternate/hypervisor Save and Restore
Registers, so we can set SRR0 and SRR1 directly.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 3872f3b7ad..0050c8447f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -746,7 +746,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1;
 
     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -765,10 +764,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
      */
     new_msr = env->msr & ((target_ulong)1 << MSR_ME);
 
-    /* target registers */
-    srr0 = SPR_SRR0;
-    srr1 = SPR_SRR1;
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
      * arch 2.05 server or later.
@@ -907,10 +902,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
             cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
                       "no HV support\n", excp);
         }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
     }
 
     /*
@@ -922,10 +913,10 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     }
 
     /* Save PC */
-    env->spr[srr0] = env->nip;
+    env->spr[SPR_SRR0] = env->nip;
 
     /* Save MSR */
-    env->spr[srr1] = msr;
+    env->spr[SPR_SRR1] = msr;
 
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
-- 
2.34.1


