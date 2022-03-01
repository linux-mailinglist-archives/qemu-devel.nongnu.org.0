Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06884C8D5A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:10:30 +0100 (CET)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Cv-0007RE-Ot
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:10:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP30B-0006R0-7M; Tue, 01 Mar 2022 08:57:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39076
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP307-00027r-W1; Tue, 01 Mar 2022 08:57:18 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DgPP7003018; 
 Tue, 1 Mar 2022 13:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KaprR9n1LG75YBCialneF91syiLGt3SpQXEd2GbKgLg=;
 b=bRNt/h8lnwqbHgvavNDfLjF15jxZlof4grYSOzNx5up5cYdku/DTyTvTgtBXABFlXSyd
 MmI8LD6ao1/xP+k8lI8gfuC0OgfNAt8l6PcFshqBnLatOWLMMH/oLv8GiUsWnPBT1ynn
 Vtr6dboaJJEnoqyP0I7XdDC8QNipC7MXg98aZE+P0C+HuiLXK9n21Xioo1LUI1ZIokXA
 t1tTTRpSTwtDFy01TmsRxRqxybpPd5f/CXVpeS52HAL6nfgP7JaC1hAOQaOfx3RXZIzV
 SgGN7iCVBKEaQ2uetBnlEA1QD88Oq++biK1pHMXBNQzSjEB/jTAsGNunYPb/RRexBMOH ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmku0a21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:57:03 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DgccN003536;
 Tue, 1 Mar 2022 13:57:03 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmku0a1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:57:03 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtsHf002621;
 Tue, 1 Mar 2022 13:57:02 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3eftrreust-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:57:02 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221Dv1Um33095948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:57:01 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CBAEBE053;
 Tue,  1 Mar 2022 13:57:01 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4054BE04F;
 Tue,  1 Mar 2022 13:56:59 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] target/ppc: Move powerpc_excp* to the PowerPCCPU Class
Date: Tue,  1 Mar 2022 10:56:20 -0300
Message-Id: <20220301135620.2411952-18-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iP4OcgDiMN8aIJheLZ_EaTcL2fsQfi60
X-Proofpoint-ORIG-GUID: 4A2x9XvV5R-ZpcomD6Zxew36zh90We88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010074
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

Now that all the powerpc_excp* functions are in their appropriate C
files, we can drop the excp_model switch and just use a QOM class
method.

This will allow us to remove the excp_model enum once we've figured
out the last two remaining usages outside of excp_helper.c

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu-qom.h     |  1 +
 target/ppc/cpu.h         |  6 ------
 target/ppc/cpu_40x.c     |  5 +++--
 target/ppc/cpu_6xx.c     | 13 +++++++++++--
 target/ppc/cpu_74xx.c    | 12 ++++++++++--
 target/ppc/cpu_7xx.c     | 12 ++++++++++--
 target/ppc/cpu_booke.c   | 15 +++++++++++++--
 target/ppc/cpu_books.c   |  8 +++++++-
 target/ppc/excp_helper.c | 30 ++----------------------------
 9 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 98facee9fa..1d0fa314c3 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -184,6 +184,7 @@ struct PowerPCCPUClass {
     int n_host_threads;
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
+    void (*dispatch_excp)(PowerPCCPU *cpu, int excp);
 };
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 30d06d2ef2..d21a952ab4 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -180,12 +180,6 @@ void powerpc_set_excp_state(PowerPCCPU *cpu,
                             target_ulong vector, target_ulong msr);
 void powerpc_reset_excp_state(PowerPCCPU *cpu);
 void ppc_excp_debug_sw_tlb(CPUPPCState *env, int excp);
-void powerpc_excp_40x(PowerPCCPU *cpu, int excp);
-void powerpc_excp_6xx(PowerPCCPU *cpu, int excp);
-void powerpc_excp_7xx(PowerPCCPU *cpu, int excp);
-void powerpc_excp_74xx(PowerPCCPU *cpu, int excp);
-void powerpc_excp_booke(PowerPCCPU *cpu, int excp);
-void powerpc_excp_books(PowerPCCPU *cpu, int excp);
 
 #define PPC_INPUT(env) ((env)->bus_model)
 
diff --git a/target/ppc/cpu_40x.c b/target/ppc/cpu_40x.c
index 4b7bbeb28c..241c7e14bd 100644
--- a/target/ppc/cpu_40x.c
+++ b/target/ppc/cpu_40x.c
@@ -16,7 +16,7 @@
 #include "helper_regs.h"
 
 #if !defined(CONFIG_USER_ONLY)
-void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -154,7 +154,7 @@ void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 #else
-void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
 {
     g_assert_not_reached();
 }
@@ -385,6 +385,7 @@ POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 405";
     pcc->init_proc = init_proc_405;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_40x;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_DCR | PPC_WRTEE |
                        PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
diff --git a/target/ppc/cpu_6xx.c b/target/ppc/cpu_6xx.c
index b6a4909dbf..b066e96c91 100644
--- a/target/ppc/cpu_6xx.c
+++ b/target/ppc/cpu_6xx.c
@@ -27,7 +27,7 @@ static int check_pow_hid0(CPUPPCState *env)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -202,7 +202,7 @@ void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 #else
-void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
 {
     g_assert_not_reached();
 }
@@ -1002,6 +1002,7 @@ POWERPC_FAMILY(MPC5xx)(ObjectClass *oc, void *data)
     dc->desc = "Freescale 5xx cores (aka RCPU)";
     pcc->init_proc = init_proc_MPC5xx;
     pcc->check_pow = check_pow_none;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
                        PPC_MEM_EIEIO | PPC_MEM_SYNC |
                        PPC_CACHE_ICBI | PPC_FLOAT | PPC_FLOAT_STFIWX |
@@ -1034,6 +1035,7 @@ POWERPC_FAMILY(MPC8xx)(ObjectClass *oc, void *data)
     dc->desc = "Freescale 8xx cores (aka PowerQUICC)";
     pcc->init_proc = init_proc_MPC8xx;
     pcc->check_pow = check_pow_none;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING  |
                        PPC_MEM_EIEIO | PPC_MEM_SYNC |
                        PPC_CACHE_ICBI | PPC_MFTB;
@@ -1065,6 +1067,7 @@ POWERPC_FAMILY(G2)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC G2";
     pcc->init_proc = init_proc_G2;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_STFIWX |
@@ -1103,6 +1106,7 @@ POWERPC_FAMILY(G2LE)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC G2LE";
     pcc->init_proc = init_proc_G2;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_STFIWX |
@@ -1143,6 +1147,7 @@ POWERPC_FAMILY(603)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 603";
     pcc->init_proc = init_proc_603;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -1182,6 +1187,7 @@ POWERPC_FAMILY(603E)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 603e";
     pcc->init_proc = init_proc_603;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -1221,6 +1227,7 @@ POWERPC_FAMILY(e300)(ObjectClass *oc, void *data)
     dc->desc = "e300 core";
     pcc->init_proc = init_proc_e300;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_STFIWX |
@@ -1261,6 +1268,7 @@ POWERPC_FAMILY(604)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 604";
     pcc->init_proc = init_proc_604;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -1300,6 +1308,7 @@ POWERPC_FAMILY(604E)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 604E";
     pcc->init_proc = init_proc_604E;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_6xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
diff --git a/target/ppc/cpu_74xx.c b/target/ppc/cpu_74xx.c
index 07715cadb5..0ee53833b0 100644
--- a/target/ppc/cpu_74xx.c
+++ b/target/ppc/cpu_74xx.c
@@ -36,7 +36,7 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -209,7 +209,7 @@ void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 #else
-void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 {
     g_assert_not_reached();
 }
@@ -996,6 +996,7 @@ POWERPC_FAMILY(7400)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7400 (aka G4)";
     pcc->init_proc = init_proc_7400;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1041,6 +1042,7 @@ POWERPC_FAMILY(7410)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7410 (aka G4)";
     pcc->init_proc = init_proc_7410;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1086,6 +1088,7 @@ POWERPC_FAMILY(7440)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7440 (aka G4)";
     pcc->init_proc = init_proc_7440;
     pcc->check_pow = check_pow_hid0_74xx;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1131,6 +1134,7 @@ POWERPC_FAMILY(7450)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7450 (aka G4)";
     pcc->init_proc = init_proc_7450;
     pcc->check_pow = check_pow_hid0_74xx;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1176,6 +1180,7 @@ POWERPC_FAMILY(7445)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7445 (aka G4)";
     pcc->init_proc = init_proc_7445;
     pcc->check_pow = check_pow_hid0_74xx;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1221,6 +1226,7 @@ POWERPC_FAMILY(7455)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7455 (aka G4)";
     pcc->init_proc = init_proc_7455;
     pcc->check_pow = check_pow_hid0_74xx;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1266,6 +1272,7 @@ POWERPC_FAMILY(7457)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 7457 (aka G4)";
     pcc->init_proc = init_proc_7457;
     pcc->check_pow = check_pow_hid0_74xx;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1311,6 +1318,7 @@ POWERPC_FAMILY(e600)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC e600";
     pcc->init_proc = init_proc_e600;
     pcc->check_pow = check_pow_hid0_74xx;
+    pcc->dispatch_excp = powerpc_excp_74xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
diff --git a/target/ppc/cpu_7xx.c b/target/ppc/cpu_7xx.c
index 6f99521aba..03b10906c9 100644
--- a/target/ppc/cpu_7xx.c
+++ b/target/ppc/cpu_7xx.c
@@ -17,7 +17,7 @@
 #include "helper_regs.h"
 
 #if !defined(CONFIG_USER_ONLY)
-void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -198,7 +198,7 @@ void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 #else
-void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 {
     g_assert_not_reached();
 }
@@ -743,6 +743,7 @@ POWERPC_FAMILY(740)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 740";
     pcc->init_proc = init_proc_740;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -782,6 +783,7 @@ POWERPC_FAMILY(750)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 750";
     pcc->init_proc = init_proc_750;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -821,6 +823,7 @@ POWERPC_FAMILY(750cl)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 750 CL";
     pcc->init_proc = init_proc_750cl;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     /*
      * XXX: not implemented:
      * cache lock instructions:
@@ -899,6 +902,7 @@ POWERPC_FAMILY(750cx)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 750CX";
     pcc->init_proc = init_proc_750cx;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -938,6 +942,7 @@ POWERPC_FAMILY(750fx)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 750FX";
     pcc->init_proc = init_proc_750fx;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -977,6 +982,7 @@ POWERPC_FAMILY(750gx)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 750GX";
     pcc->init_proc = init_proc_750gx;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -1016,6 +1022,7 @@ POWERPC_FAMILY(745)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 745";
     pcc->init_proc = init_proc_745;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
@@ -1055,6 +1062,7 @@ POWERPC_FAMILY(755)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 755";
     pcc->init_proc = init_proc_755;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_7xx;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FRSQRTE | PPC_FLOAT_STFIWX |
diff --git a/target/ppc/cpu_booke.c b/target/ppc/cpu_booke.c
index b73cfe224d..baf0139075 100644
--- a/target/ppc/cpu_booke.c
+++ b/target/ppc/cpu_booke.c
@@ -25,7 +25,7 @@ static int check_pow_hid0(CPUPPCState *env)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -229,7 +229,7 @@ void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 #else
-void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 {
     g_assert_not_reached();
 }
@@ -1207,6 +1207,7 @@ POWERPC_FAMILY(440EP)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 440 EP";
     pcc->init_proc = init_proc_440EP;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
                        PPC_FLOAT | PPC_FLOAT_FRES | PPC_FLOAT_FSEL |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1245,6 +1246,7 @@ POWERPC_FAMILY(460EX)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 460 EX";
     pcc->init_proc = init_proc_440EP;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
                        PPC_FLOAT | PPC_FLOAT_FRES | PPC_FLOAT_FSEL |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1283,6 +1285,7 @@ POWERPC_FAMILY(440GP)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 440 GP";
     pcc->init_proc = init_proc_440GP;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
                        PPC_DCR | PPC_DCRX | PPC_WRTEE | PPC_MFAPIDI |
                        PPC_CACHE | PPC_CACHE_ICBI |
@@ -1318,6 +1321,7 @@ POWERPC_FAMILY(440x5)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 440x5";
     pcc->init_proc = init_proc_440x5;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
                        PPC_DCR | PPC_WRTEE | PPC_RFMCI |
                        PPC_CACHE | PPC_CACHE_ICBI |
@@ -1353,6 +1357,7 @@ POWERPC_FAMILY(440x5wDFPU)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 440x5 with double precision FPU";
     pcc->init_proc = init_proc_440x5;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING |
                        PPC_FLOAT | PPC_FLOAT_FSQRT |
                        PPC_FLOAT_STFIWX |
@@ -1391,6 +1396,7 @@ POWERPC_FAMILY(e200)(ObjectClass *oc, void *data)
     dc->desc = "e200 core";
     pcc->init_proc = init_proc_e200;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_booke;
     /*
      * XXX: unimplemented instructions:
      * dcblc
@@ -1439,6 +1445,7 @@ POWERPC_FAMILY(e500v1)(ObjectClass *oc, void *data)
     dc->desc = "e500v1 core";
     pcc->init_proc = init_proc_e500v1;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
                        PPC_SPE | PPC_SPE_SINGLE |
                        PPC_WRTEE | PPC_RFDI |
@@ -1477,6 +1484,7 @@ POWERPC_FAMILY(e500v2)(ObjectClass *oc, void *data)
     dc->desc = "e500v2 core";
     pcc->init_proc = init_proc_e500v2;
     pcc->check_pow = check_pow_hid0;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL |
                        PPC_SPE | PPC_SPE_SINGLE | PPC_SPE_DOUBLE |
                        PPC_WRTEE | PPC_RFDI |
@@ -1515,6 +1523,7 @@ POWERPC_FAMILY(e500mc)(ObjectClass *oc, void *data)
     dc->desc = "e500mc core";
     pcc->init_proc = init_proc_e500mc;
     pcc->check_pow = check_pow_none;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
                        PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
                        PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
@@ -1556,6 +1565,7 @@ POWERPC_FAMILY(e5500)(ObjectClass *oc, void *data)
     dc->desc = "e5500 core";
     pcc->init_proc = init_proc_e5500;
     pcc->check_pow = check_pow_none;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
                        PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
                        PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
@@ -1599,6 +1609,7 @@ POWERPC_FAMILY(e6500)(ObjectClass *oc, void *data)
     dc->desc = "e6500 core";
     pcc->init_proc = init_proc_e6500;
     pcc->check_pow = check_pow_none;
+    pcc->dispatch_excp = powerpc_excp_booke;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_MFTB |
                        PPC_WRTEE | PPC_RFDI | PPC_RFMCI |
                        PPC_CACHE | PPC_CACHE_LOCK | PPC_CACHE_ICBI |
diff --git a/target/ppc/cpu_books.c b/target/ppc/cpu_books.c
index e776ededda..27b34df2b0 100644
--- a/target/ppc/cpu_books.c
+++ b/target/ppc/cpu_books.c
@@ -248,7 +248,7 @@ static bool books_vhyp_handles_hv_excp(PowerPCCPU *cpu)
     return false;
 }
 
-void powerpc_excp_books(PowerPCCPU *cpu, int excp)
+static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -1889,6 +1889,7 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
     dc->desc = "PowerPC 970";
     pcc->init_proc = init_proc_970;
     pcc->check_pow = check_pow_970;
+    pcc->dispatch_excp = powerpc_excp_books;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1937,6 +1938,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
     dc->desc = "POWER5+";
     pcc->init_proc = init_proc_power5plus;
     pcc->check_pow = check_pow_970;
+    pcc->dispatch_excp = powerpc_excp_books;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
@@ -1994,6 +1996,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER7;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_books;
     cc->has_work = cpu_has_work_POWER7;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
@@ -2064,6 +2067,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
     pcc->pcr_supported = PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER8;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_books;
     cc->has_work = cpu_has_work_POWER8;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
@@ -2143,6 +2147,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER9;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_books;
     cc->has_work = cpu_has_work_POWER9;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
@@ -2224,6 +2229,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                          PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
     pcc->init_proc = init_proc_POWER10;
     pcc->check_pow = check_pow_nocheck;
+    pcc->dispatch_excp = powerpc_excp_books;
     cc->has_work = cpu_has_work_POWER10;
     pcc->insns_flags = PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MFTB |
                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 257379871f..6755a0cbba 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -193,6 +193,7 @@ static bool books_vhyp_promotes_external_to_hvirt(PowerPCCPU *cpu)
 
 static void powerpc_excp(PowerPCCPU *cpu, int excp)
 {
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
 
@@ -206,34 +207,7 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
 
     trace_ppc_excp(env->nip, powerpc_excp_name(excp), excp, env->error_code);
 
-    switch (env->excp_model) {
-    case POWERPC_EXCP_40x:
-        powerpc_excp_40x(cpu, excp);
-        break;
-    case POWERPC_EXCP_6xx:
-        powerpc_excp_6xx(cpu, excp);
-        break;
-    case POWERPC_EXCP_7xx:
-        powerpc_excp_7xx(cpu, excp);
-        break;
-    case POWERPC_EXCP_74xx:
-        powerpc_excp_74xx(cpu, excp);
-        break;
-    case POWERPC_EXCP_BOOKE:
-        powerpc_excp_booke(cpu, excp);
-        break;
-#if defined(TARGET_PPC64)
-    case POWERPC_EXCP_970:
-    case POWERPC_EXCP_POWER7:
-    case POWERPC_EXCP_POWER8:
-    case POWERPC_EXCP_POWER9:
-    case POWERPC_EXCP_POWER10:
-        powerpc_excp_books(cpu, excp);
-        break;
-#endif
-    default:
-        g_assert_not_reached();
-    }
+    (*pcc->dispatch_excp)(cpu, excp);
 }
 
 void ppc_cpu_do_interrupt(CPUState *cs)
-- 
2.34.1


