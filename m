Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EBF485A2D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:44:00 +0100 (CET)
Received: from localhost ([::1]:39432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5D8Z-0006J5-E1
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5l-0002pa-Jy; Wed, 05 Jan 2022 15:41:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5i-00018F-BR; Wed, 05 Jan 2022 15:41:04 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205KGeDH024825; 
 Wed, 5 Jan 2022 20:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xk8tJvQbRbE+NX3dSR9+qFkYHn4lJ9qMfGgLJb0VRK4=;
 b=iWPnx0olG6/LvZ/TveoBA9YanMCLq156FQMl0JxBJ/0YC45uti3LApS7gXiRClideQfZ
 uyT7hmZxZcQovRIQHpsFcMH2E9BWjLMoMnoe0gSa+hdcDdfJ3OObLYsxImXa5CZipxho
 thlXeyN9Tc1/zqIRjlLZUy8Ci3Flbyg9WzzliI2XCogDvGfFSwL21gpFbW4h44voupYS
 UxSwJUKwF9Jj5nYNaHb0/j5gFn6DIK99p+W0paqP7lgPLeihAj9hfYYT41W0pnDzedMd
 KiHE2uS/3a7Urf+f/9IsxrWDsICrmLldlASl64ga5joD1eopobT5bWKteToqrL/54ssw 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckxtadk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:49 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KQ9i8013752;
 Wed, 5 Jan 2022 20:40:49 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckxtadjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KVplM023622;
 Wed, 5 Jan 2022 20:40:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3daekbpq5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205KekJs27460074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A35878063;
 Wed,  5 Jan 2022 20:40:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59D2478064;
 Wed,  5 Jan 2022 20:40:44 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:44 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] target/ppc: Add HV support to
 ppc_interrupts_little_endian
Date: Wed,  5 Jan 2022 17:40:26 -0300
Message-Id: <20220105204029.4058500-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uMSrUdFnrZOT54j0xzD6mjfSwUx0wI1d
X-Proofpoint-ORIG-GUID: bMUa5dRdGyA_jhvUxBF33xoEysr1Akuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=911 priorityscore=1501 spamscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050133
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc_interrupts_little_endian function could be used for interrupts
delivered in Hypervisor mode, so add support for powernv8 and powernv9
to it.

Also drop the comment because it is inaccurate, all CPUs that can run
little endian can have interrupts in little endian. The point is
whether they can take interrupts in an endianness different from
MSR_LE.

This change has no functional impact.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/arch_dump.c   |  2 +-
 target/ppc/cpu.h         | 23 +++++++++++++++--------
 target/ppc/excp_helper.c |  2 +-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index bb392f6d88..12cde198a3 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
 
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         info->d_endian = ELFDATA2LSB;
     } else {
         info->d_endian = ELFDATA2MSB;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f20d4ffa6d..a6fc857ad4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2728,20 +2728,27 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
     return cpu->env.spr_cb[spr].name != NULL;
 }
 
-static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
+#if !defined(CONFIG_USER_ONLY)
+static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+    bool ile = false;
 
-    /*
-     * Only models that have an LPCR and know about LPCR_ILE can do little
-     * endian.
-     */
-    if (pcc->lpcr_mask & LPCR_ILE) {
-        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
+    if (hv && env->has_hv_mode) {
+        if (is_isa300(pcc)) {
+            ile = !!(env->spr[SPR_HID0] & HID0_POWER9_HILE);
+        } else {
+            ile = !!(env->spr[SPR_HID0] & HID0_HILE);
+        }
+
+    } else if (pcc->lpcr_mask & LPCR_ILE) {
+        ile = !!(env->spr[SPR_LPCR] & LPCR_ILE);
     }
 
-    return false;
+    return ile;
 }
+#endif
 
 void dump_mmu(CPUPPCState *env);
 
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fa41f8048d..92953af896 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1071,7 +1071,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
      */
     msr = (1ULL << MSR_ME);
     msr |= env->msr & (1ULL << MSR_SF);
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         msr |= (1ULL << MSR_LE);
     }
 
-- 
2.33.1


