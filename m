Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8B0487EF5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:34:00 +0100 (CET)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xo8-0002zV-0l
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:34:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgv-0002b6-LW; Fri, 07 Jan 2022 17:26:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgs-0006hJ-6k; Fri, 07 Jan 2022 17:26:33 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207LcD8s004426; 
 Fri, 7 Jan 2022 22:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=p/eE3an0OzOlZIoAOoc5I+o/PofhW8JU21YhMi33SiE=;
 b=UgZINlPLCp+O+AMyanQXq1J2LjKj1MDLYl+rN/bWgeQfejovtTITz6Ue0NvrL/XqSaTk
 rR8UxoDwz7/ly/tCWfMVRlPnZj0WXKAlWiqz+67q7dVkp0He/WJzaFAeO2dvqPWxAyYU
 oBX0fvbTboLxWg6gXmgQ8foWuifMT24rJ5PquTWOmnePJykATSoEa0VtEUrPwfFWEAa6
 TBfNrFf7cCSJX2i3fh3QF9wEvidfmWZnDbcWLMCxIjZ5CnleLVBlYSDpndwTtM4b5hPy
 AgqCQx4aW8ddgo/tjlOE1GuTY5tXbK+B7LJx/KchqlPLleJJE5rHM3YlQ2CGulOh90C3 Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wg2v3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:20 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207MQJEE007957;
 Fri, 7 Jan 2022 22:26:19 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de4wg2v3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:19 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MIERP019347;
 Fri, 7 Jan 2022 22:26:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3de53c0he5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:18 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQHfb36765954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:17 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A895CBE053;
 Fri,  7 Jan 2022 22:26:17 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0423BE056;
 Fri,  7 Jan 2022 22:26:15 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:15 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] target/ppc: Add HV support to
 ppc_interrupts_little_endian
Date: Fri,  7 Jan 2022 19:25:57 -0300
Message-Id: <20220107222601.4101511-5-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107222601.4101511-1-farosas@linux.ibm.com>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FdPx3uVT-lP9ErwR64uwmxuXx2toIuv6
X-Proofpoint-GUID: pChPubclLdZ5cW-AKhjFPowt36JWTTE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxlogscore=960 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070130
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
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
index a52340ac0a..3a430f23d6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1070,7 +1070,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
      */
     msr = (1ULL << MSR_ME);
     msr |= env->msr & (1ULL << MSR_SF);
-    if (ppc_interrupts_little_endian(cpu)) {
+    if (ppc_interrupts_little_endian(cpu, false)) {
         msr |= (1ULL << MSR_LE);
     }
 
-- 
2.33.1


