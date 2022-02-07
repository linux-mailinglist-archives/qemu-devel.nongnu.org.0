Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7299C4AC92D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:08:22 +0100 (CET)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9N7-0005v0-Cn
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:08:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8nd-0004CJ-Ea; Mon, 07 Feb 2022 13:31:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8n3-0001I3-8i; Mon, 07 Feb 2022 13:31:26 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IQ4Tq027532; 
 Mon, 7 Feb 2022 18:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kG5mAFcBzJ051mELjI/TVTyAzPzzPszj9xGwiCccZ4k=;
 b=eSxKdBETuCeQv6jz13ckzhdXQ3zHgONhWp1ASQ4hEb1FlIvKdQcLh7ZDnrjIxnX1t+jx
 V5AeGiIwy8BpOtOjo5UHRCLvQmByJXofEoInROtKoEztn2Rd3efpW8ZDXm2T2G9kkK5X
 DSrxVwHHt9Ha4m+7ezcb1hotk+x//PfrETc9WMtqkrYP875lVK1Sjqd/Xp5mhZRhciOb
 z9qHTAQ7VgJbX37ihF+l8ZO1/YDnMcO8DkDlj76yVb33Y/PCYOwZjQzx7nPy0zlJZivI
 fhx3r5UQ9FFxvzdLUivENJWy3Sr72vgqxPm+4U7YKE47LFIRS4U7rDdU26jFtqgkF7QQ 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22q142gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:52 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217IRgjt002450;
 Mon, 7 Feb 2022 18:30:51 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22q142g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:51 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217I87Zg029591;
 Mon, 7 Feb 2022 18:30:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3e1gvakt4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217IUnOe36176250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 18:30:49 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2243BE059;
 Mon,  7 Feb 2022 18:30:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23964BE04F;
 Mon,  7 Feb 2022 18:30:48 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.16.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 18:30:47 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/ppc: Assert if MSR bits differ from msr_mask
 during exceptions
Date: Mon,  7 Feb 2022 15:30:35 -0300
Message-Id: <20220207183036.1507882-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207183036.1507882-1-farosas@linux.ibm.com>
References: <20220207183036.1507882-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EPmYEC4L4L5u7F6z6Gbyu93PPby6AfmN
X-Proofpoint-ORIG-GUID: KxhwvzGF71RPW3POe5I7Xw3-haJxaicd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=901
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070111
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

We currently abort QEMU during the dispatch of an interrupt if we try
to set MSR_HV without having MSR_HVB in the msr_mask. I think we
should verify this for all MSR bits. There is no reason to ever have a
MSR bit set if the corresponding bit is not set in that CPU's
msr_mask.

Note that this is not about the emulated code setting reserved
bits. We clear the new_msr when starting to dispatch an exception, so
if we end up with bits not present in the msr_mask that is a QEMU
programming error.

I kept the HSRR verification for BookS because it is the only CPU
family that has HSRRs.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 64 ++++------------------------------------
 1 file changed, 6 insertions(+), 58 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 206314aaa2..861b7fc24d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -364,6 +364,8 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
+    assert((msr & env->msr_mask) == msr);
+
     /*
      * We don't use hreg_store_msr here as already have treated any
      * special case that could occur. Just store MSR and update hflags
@@ -372,7 +374,7 @@ static void powerpc_set_excp_state(PowerPCCPU *cpu,
      * will prevent setting of the HV bit which some exceptions might need
      * to do.
      */
-    env->msr = msr & env->msr_mask;
+    env->msr = msr;
     hreg_compute_hflags(env);
     env->nip = vector;
     /* Reset exception state */
@@ -519,18 +521,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
     /* Save PC */
     env->spr[srr0] = env->nip;
 
@@ -699,14 +689,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -871,14 +853,6 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1057,14 +1031,6 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
     /*
      * Sort out endianness of interrupt, this differs depending on the
      * CPU, the HV mode, etc...
@@ -1269,18 +1235,6 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         break;
     }
 
-    /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
-    }
-
 #if defined(TARGET_PPC64)
     if (env->spr[SPR_BOOKE_EPCR] & EPCR_ICM) {
         /* Cat.64-bit: EPCR.ICM is copied to MSR.CM */
@@ -1551,15 +1505,9 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     }
 
     /* Sanity check */
-    if (!(env->msr_mask & MSR_HVB)) {
-        if (new_msr & MSR_HVB) {
-            cpu_abort(cs, "Trying to deliver HV exception (MSR) %d with "
-                      "no HV support\n", excp);
-        }
-        if (srr0 == SPR_HSRR0) {
-            cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
-                      "no HV support\n", excp);
-        }
+    if (!(env->msr_mask & MSR_HVB) && srr0 == SPR_HSRR0) {
+        cpu_abort(cs, "Trying to deliver HV exception (HSRR) %d with "
+                  "no HV support\n", excp);
     }
 
     /*
-- 
2.34.1


