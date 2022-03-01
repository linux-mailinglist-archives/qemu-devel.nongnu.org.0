Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD664C8D24
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 14:59:46 +0100 (CET)
Received: from localhost ([::1]:50868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP32X-00009z-4u
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 08:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2ze-0005hN-6J; Tue, 01 Mar 2022 08:56:46 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zb-00022f-LX; Tue, 01 Mar 2022 08:56:45 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221Dcr8Y023287; 
 Tue, 1 Mar 2022 13:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UL/IM1fcO/c/oBJg7e1eLCuqz9WMe3D6d9xZ6lGlDws=;
 b=o0ludDnr5GldB0aD6xTKC0NdjWab+kTPUS1uxwhk3l27LjOw4o6X8Zx5FJhmtspnrqeC
 Ya1kCxMtJImZiEdiUzKOeRsarpzPAf43Xskk2o5/NcbmBUgd7SYbcpCzCHlNgiEIPDcf
 2KFxWwyE81XLUVXnMssjmNzxFZYWF+2jogbt7yfBV8IDxq01bzRXf7bDwOYOfnZ61UUn
 X1FwIJ5atEWcHBKT7aBsg0wBC9XjkanfBr0i9teZFXNyi5LYurJTaS4H15cNnlIZVENj
 zy8xXD0QmwG2SDaN43CwdanMcbSNpmbzF4lR/8wF5O1S/3cJocZR/6WKUm60e4ZXJpog YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehkqe1k7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:36 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221Ddd4T026392;
 Tue, 1 Mar 2022 13:56:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehkqe1k77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:35 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtrLD002511;
 Tue, 1 Mar 2022 13:56:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3eftrreupv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:34 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuXlw39584080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8467ABE056;
 Tue,  1 Mar 2022 13:56:33 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF73DBE053;
 Tue,  1 Mar 2022 13:56:31 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] target/ppc: Move 40x CPUs code to their own file
Date: Tue,  1 Mar 2022 10:56:06 -0300
Message-Id: <20220301135620.2411952-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301135620.2411952-1-farosas@linux.ibm.com>
References: <20220301135620.2411952-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K3H32e7yF_5Mz2LIQ88Jh4-G1FjRjx8B
X-Proofpoint-ORIG-GUID: -JGTs2BHpVcNjW70ycdqACopz3BkVoDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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

Affects the 405 CPU.

This moves init_proc, init_excp and register_*sprs functions that are
related to the 40x CPUs (currently only 405) into a separate file.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_40x.c   | 263 +++++++++++++++++++++++++++++++++++++++++
 target/ppc/cpu_init.c  | 250 ---------------------------------------
 target/ppc/meson.build |   1 +
 3 files changed, 264 insertions(+), 250 deletions(-)
 create mode 100644 target/ppc/cpu_40x.c

diff --git a/target/ppc/cpu_40x.c b/target/ppc/cpu_40x.c
new file mode 100644
index 0000000000..4ed2cbc305
--- /dev/null
+++ b/target/ppc/cpu_40x.c
@@ -0,0 +1,263 @@
+/*
+ * CPU initialization for PowerPC 40x CPUs
+ *
+ *  Copyright IBM Corp. 2022
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/ppc/ppc.h"
+#include "cpu.h"
+#include "spr_common.h"
+
+/* SPR shared between PowerPC 40x implementations */
+static void register_40x_sprs(CPUPPCState *env)
+{
+    /* Cache */
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_DCCR, "DCCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_ICCR, "ICCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
+    /* Exception */
+    spr_register(env, SPR_40x_DEAR, "DEAR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_ESR, "ESR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_EVPR, "EVPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_excp_prefix,
+                 0x00000000);
+    spr_register(env, SPR_40x_SRR2, "SRR2",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_SRR3, "SRR3",
+                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Timers */
+    spr_register(env, SPR_40x_PIT, "PIT",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_40x_pit, &spr_write_40x_pit,
+                 0x00000000);
+    spr_register(env, SPR_40x_TCR, "TCR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_tcr,
+                 0x00000000);
+    spr_register(env, SPR_40x_TSR, "TSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_tsr,
+                 0x00000000);
+}
+
+/* SPR specific to PowerPC 405 implementation */
+static void register_405_sprs(CPUPPCState *env)
+{
+    /* MMU */
+    spr_register(env, SPR_40x_PID, "PID",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_pid,
+                 0x00000000);
+    spr_register(env, SPR_4xx_CCR0, "CCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00700000);
+    /* Debug interface */
+    spr_register(env, SPR_40x_DBCR0, "DBCR0",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_dbcr0,
+                 0x00000000);
+
+    spr_register(env, SPR_405_DBCR1, "DBCR1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_40x_DBSR, "DBSR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_clear,
+                 /* Last reset was system reset */
+                 0x00000300);
+
+    spr_register(env, SPR_40x_DAC1, "DAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_DAC2, "DAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_405_DVC1, "DVC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_405_DVC2, "DVC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_40x_IAC1, "IAC1",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_40x_IAC2, "IAC2",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_405_IAC3, "IAC3",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_405_IAC4, "IAC4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* Storage control */
+    spr_register(env, SPR_405_SLER, "SLER",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_40x_sler,
+                 0x00000000);
+    spr_register(env, SPR_40x_ZPR, "ZPR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    spr_register(env, SPR_405_SU0R, "SU0R",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    /* SPRG */
+    spr_register(env, SPR_USPRG0, "USPRG0",
+                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, SPR_NOACCESS,
+                 0x00000000);
+    spr_register(env, SPR_SPRG4, "SPRG4",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG5, "SPRG5",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG6, "SPRG6",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 spr_read_generic, &spr_write_generic,
+                 0x00000000);
+    spr_register(env, SPR_SPRG7, "SPRG7",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 spr_read_generic, &spr_write_generic,
+                 0x00000000);
+
+    /* Bus access control */
+    /* not emulated, as QEMU never does speculative access */
+    spr_register(env, SPR_40x_SGR, "SGR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0xFFFFFFFF);
+    /* not emulated, as QEMU do not emulate caches */
+    spr_register(env, SPR_40x_DCWR, "DCWR",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, &spr_write_generic,
+                 0x00000000);
+}
+
+static void init_excp_4xx_softmmu(CPUPPCState *env)
+{
+#if !defined(CONFIG_USER_ONLY)
+    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
+    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
+    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
+    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
+    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
+    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
+    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
+    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
+    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
+    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
+    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00001100;
+    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00001200;
+    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
+    env->ivor_mask = 0x0000FFF0UL;
+    env->ivpr_mask = 0xFFFF0000UL;
+    /* Hardware reset vector */
+    env->hreset_vector = 0xFFFFFFFCUL;
+#endif
+}
+
+static void init_proc_405(CPUPPCState *env)
+{
+    register_40x_sprs(env);
+    register_405_sprs(env);
+    register_usprgh_sprs(env);
+
+    /* Memory management */
+#if !defined(CONFIG_USER_ONLY)
+    env->nb_tlb = 64;
+    env->nb_ways = 1;
+    env->id_tlbs = 0;
+    env->tlb_type = TLB_EMB;
+#endif
+    init_excp_4xx_softmmu(env);
+    env->dcache_line_size = 32;
+    env->icache_line_size = 32;
+    /* Allocate hardware IRQ controller */
+    ppc40x_irq_init(env_archcpu(env));
+
+    SET_FIT_PERIOD(8, 12, 16, 20);
+    SET_WDT_PERIOD(16, 20, 24, 28);
+}
+
+POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
+
+    dc->desc = "PowerPC 405";
+    pcc->init_proc = init_proc_405;
+    pcc->check_pow = check_pow_nocheck;
+    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
+                       PPC_DCR | PPC_WRTEE |
+                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
+                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
+                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
+                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
+                       PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
+    pcc->msr_mask = (1ull << MSR_WE) |
+                    (1ull << MSR_CE) |
+                    (1ull << MSR_EE) |
+                    (1ull << MSR_PR) |
+                    (1ull << MSR_FP) |
+                    (1ull << MSR_ME) |
+                    (1ull << MSR_DWE) |
+                    (1ull << MSR_DE) |
+                    (1ull << MSR_IR) |
+                    (1ull << MSR_DR);
+    pcc->mmu_model = POWERPC_MMU_SOFT_4xx;
+    pcc->excp_model = POWERPC_EXCP_40x;
+    pcc->bus_model = PPC_FLAGS_INPUT_405;
+    pcc->bfd_mach = bfd_mach_ppc_403;
+    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
+                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
+}
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 073fd10168..28c017b048 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1081,177 +1081,6 @@ static void register_440_sprs(CPUPPCState *env)
                  0x00000000);
 }
 
-/* SPR shared between PowerPC 40x implementations */
-static void register_40x_sprs(CPUPPCState *env)
-{
-    /* Cache */
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCCR, "DCCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_ICCR, "ICCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, SPR_NOACCESS,
-                 0x00000000);
-    /* Exception */
-    spr_register(env, SPR_40x_DEAR, "DEAR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_ESR, "ESR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_EVPR, "EVPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_excp_prefix,
-                 0x00000000);
-    spr_register(env, SPR_40x_SRR2, "SRR2",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_SRR3, "SRR3",
-                 &spr_read_generic, &spr_write_generic,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Timers */
-    spr_register(env, SPR_40x_PIT, "PIT",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_40x_pit, &spr_write_40x_pit,
-                 0x00000000);
-    spr_register(env, SPR_40x_TCR, "TCR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_tcr,
-                 0x00000000);
-    spr_register(env, SPR_40x_TSR, "TSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_tsr,
-                 0x00000000);
-}
-
-/* SPR specific to PowerPC 405 implementation */
-static void register_405_sprs(CPUPPCState *env)
-{
-    /* MMU */
-    spr_register(env, SPR_40x_PID, "PID",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_pid,
-                 0x00000000);
-    spr_register(env, SPR_4xx_CCR0, "CCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00700000);
-    /* Debug interface */
-    spr_register(env, SPR_40x_DBCR0, "DBCR0",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_dbcr0,
-                 0x00000000);
-
-    spr_register(env, SPR_405_DBCR1, "DBCR1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_40x_DBSR, "DBSR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_clear,
-                 /* Last reset was system reset */
-                 0x00000300);
-
-    spr_register(env, SPR_40x_DAC1, "DAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_DAC2, "DAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_405_DVC1, "DVC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_405_DVC2, "DVC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_40x_IAC1, "IAC1",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_40x_IAC2, "IAC2",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_405_IAC3, "IAC3",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_405_IAC4, "IAC4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* Storage control */
-    spr_register(env, SPR_405_SLER, "SLER",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_40x_sler,
-                 0x00000000);
-    spr_register(env, SPR_40x_ZPR, "ZPR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    spr_register(env, SPR_405_SU0R, "SU0R",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    /* SPRG */
-    spr_register(env, SPR_USPRG0, "USPRG0",
-                 &spr_read_ureg, SPR_NOACCESS,
-                 &spr_read_ureg, SPR_NOACCESS,
-                 0x00000000);
-    spr_register(env, SPR_SPRG4, "SPRG4",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG5, "SPRG5",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG6, "SPRG6",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 spr_read_generic, &spr_write_generic,
-                 0x00000000);
-    spr_register(env, SPR_SPRG7, "SPRG7",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 spr_read_generic, &spr_write_generic,
-                 0x00000000);
-
-    /* Bus access control */
-    /* not emulated, as QEMU never does speculative access */
-    spr_register(env, SPR_40x_SGR, "SGR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0xFFFFFFFF);
-    /* not emulated, as QEMU do not emulate caches */
-    spr_register(env, SPR_40x_DCWR, "DCWR",
-                 SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
-                 0x00000000);
-}
-
-
 static void register_5xx_8xx_sprs(CPUPPCState *env)
 {
     /* Exception processing */
@@ -1637,29 +1466,6 @@ static void register_8xx_sprs(CPUPPCState *env)
 
 /*****************************************************************************/
 /* Exception vectors models                                                  */
-static void init_excp_4xx_softmmu(CPUPPCState *env)
-{
-#if !defined(CONFIG_USER_ONLY)
-    env->excp_vectors[POWERPC_EXCP_CRITICAL] = 0x00000100;
-    env->excp_vectors[POWERPC_EXCP_MCHECK]   = 0x00000200;
-    env->excp_vectors[POWERPC_EXCP_DSI]      = 0x00000300;
-    env->excp_vectors[POWERPC_EXCP_ISI]      = 0x00000400;
-    env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
-    env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
-    env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
-    env->excp_vectors[POWERPC_EXCP_PIT]      = 0x00001000;
-    env->excp_vectors[POWERPC_EXCP_FIT]      = 0x00001010;
-    env->excp_vectors[POWERPC_EXCP_WDT]      = 0x00001020;
-    env->excp_vectors[POWERPC_EXCP_DTLB]     = 0x00001100;
-    env->excp_vectors[POWERPC_EXCP_ITLB]     = 0x00001200;
-    env->excp_vectors[POWERPC_EXCP_DEBUG]    = 0x00002000;
-    env->ivor_mask = 0x0000FFF0UL;
-    env->ivpr_mask = 0xFFFF0000UL;
-    /* Hardware reset vector */
-    env->hreset_vector = 0xFFFFFFFCUL;
-#endif
-}
 
 static void init_excp_MPC5xx(CPUPPCState *env)
 {
@@ -2102,62 +1908,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
     return 0;
 }
 
-static void init_proc_405(CPUPPCState *env)
-{
-    register_40x_sprs(env);
-    register_405_sprs(env);
-    register_usprgh_sprs(env);
-
-    /* Memory management */
-#if !defined(CONFIG_USER_ONLY)
-    env->nb_tlb = 64;
-    env->nb_ways = 1;
-    env->id_tlbs = 0;
-    env->tlb_type = TLB_EMB;
-#endif
-    init_excp_4xx_softmmu(env);
-    env->dcache_line_size = 32;
-    env->icache_line_size = 32;
-    /* Allocate hardware IRQ controller */
-    ppc40x_irq_init(env_archcpu(env));
-
-    SET_FIT_PERIOD(8, 12, 16, 20);
-    SET_WDT_PERIOD(16, 20, 24, 28);
-}
-
-POWERPC_FAMILY(405)(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(oc);
-    PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-
-    dc->desc = "PowerPC 405";
-    pcc->init_proc = init_proc_405;
-    pcc->check_pow = check_pow_nocheck;
-    pcc->insns_flags = PPC_INSNS_BASE | PPC_STRING | PPC_MFTB |
-                       PPC_DCR | PPC_WRTEE |
-                       PPC_CACHE | PPC_CACHE_ICBI | PPC_40x_ICBT |
-                       PPC_CACHE_DCBZ | PPC_CACHE_DCBA |
-                       PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_40x_TLB | PPC_MEM_TLBIA | PPC_MEM_TLBSYNC |
-                       PPC_4xx_COMMON | PPC_405_MAC | PPC_40x_EXCP;
-    pcc->msr_mask = (1ull << MSR_WE) |
-                    (1ull << MSR_CE) |
-                    (1ull << MSR_EE) |
-                    (1ull << MSR_PR) |
-                    (1ull << MSR_FP) |
-                    (1ull << MSR_ME) |
-                    (1ull << MSR_DWE) |
-                    (1ull << MSR_DE) |
-                    (1ull << MSR_IR) |
-                    (1ull << MSR_DR);
-    pcc->mmu_model = POWERPC_MMU_SOFT_4xx;
-    pcc->excp_model = POWERPC_EXCP_40x;
-    pcc->bus_model = PPC_FLAGS_INPUT_405;
-    pcc->bfd_mach = bfd_mach_ppc_403;
-    pcc->flags = POWERPC_FLAG_CE | POWERPC_FLAG_DWE |
-                 POWERPC_FLAG_DE | POWERPC_FLAG_BUS_CLK;
-}
-
 static void init_proc_440EP(CPUPPCState *env)
 {
     register_BookE_sprs(env, 0x000000000000FFFFULL);
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 79beaff147..45f7802da5 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -3,6 +3,7 @@ ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
   'cpu_init.c',
+  'cpu_40x.c',
   'excp_helper.c',
   'gdbstub.c',
   'helper_regs.c',
-- 
2.34.1


