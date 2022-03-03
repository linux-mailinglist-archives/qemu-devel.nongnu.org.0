Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C70D4CC21B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:01:59 +0100 (CET)
Received: from localhost ([::1]:38530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPntu-00018o-Eq
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:01:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnY2-0002Jz-O5
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:39:22 -0500
Received: from [2a01:111:f400:fe08::722] (port=34694
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnY0-0001Iw-4E
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:39:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrzWt0nDKHrWcIPV2KyilCF9Jj046RVqsKcD0X50oXeMg2el9EPb4JqzaZPmgzTbN/Ts0bCMiFF9Jg4eBR1+9G5KypPCSvPzKdG2l+qPpBX/+7Y7wdwxeccV059xO0+I7C20jeXU+fDh8GFpbfmcB4psK1CrwblsV+mNm6Qvx1unhBaVVfWWqY8HTngmApm9Vy9f8TZ/d4SgdpHigoM9PNNabyBGC4W2bnMVtIFMQhyvS1+rSIQ3Fx7ugCrAOkhDczGa2UR3J5R42IjhCKNXPbilsmF4ouEjOTkCKa7NdajxhxO6UwmR7oTKz7HLI6NptxwT8DdqNTZZnFSWG1rNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvSQ+7OuZydc8Kk+1+ILomXbr5tU3bNf1qZ/mx21liA=;
 b=eCivZXJrVH5szw5HWn35jRtLG0cWoSg6Z/6G3SrBJnqsqsTqUxHUQV4X5gwSo0O4xnMLz4XeiNUjSgQvIjPtAzWc0sIEOohn2uKmD6OVhh4JsAv29gURbK994G8PlsX6AevVxzkZ00hSD67H0K3k7UzT4J+E3uzWE/Jf4FbnRuwZ+XlMrgQHawQzRO9sDb+wjyzgbM36KTSxwcN2jR4v/HnRK/sW13HN3igB1C1S4NpTaBK+mZ810e4S9RYY2XnkkW+I89xH2Tl87GiKO2SR4dlbQ21/oaSQNsiiADrIzFR7sW1XhPxKtEX9uskCo6Ps8hQA3q5FQLz5L1TcWPu5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvSQ+7OuZydc8Kk+1+ILomXbr5tU3bNf1qZ/mx21liA=;
 b=xD6XQUTYZZi0xbE8EEHD7QbN2/Za8+v1xDHMqo3dmpkjUswUwfOVueyCMdp7EPgYByWDnlydZilBA+cANJak8cuMGb1HBMdU9l9Zx7rRSf9QNSkjCEot864nlFLfDEEdU4a9FGzWLUBQ2v8Y8VqW0J2AuE3FXb5sh50bg0YOgkg=
Received: from OL1P279CA0024.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::11)
 by AM5PR0901MB1617.eurprd09.prod.outlook.com (2603:10a6:203:4f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:39:16 +0000
Received: from HE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::90) by OL1P279CA0024.outlook.office365.com
 (2603:10a6:e10:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15 via Frontend
 Transport; Thu, 3 Mar 2022 15:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 HE1EUR02FT025.mail.protection.outlook.com (10.152.10.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:39:14 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 6BCD1212D7;
 Thu,  3 Mar 2022 17:38:59 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/5] target/nios2: Exteral Interrupt Controller (EIC)
Date: Thu,  3 Mar 2022 17:39:04 +0200
Message-Id: <20220303153906.2024748-4-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fff34ca1-c0f7-4d7e-494b-08d9fd2bf8f3
X-MS-TrafficTypeDiagnostic: AM5PR0901MB1617:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0901MB1617A69F68BF03A6F19BED99EB049@AM5PR0901MB1617.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JnOycWijuSDMUtMPY6HWudt9YVRSZXpzs7jxUs4O8pSg2J08yEYTN3v80isXZmhT9ScR8gNhccGwxTmx+PPLDE15L3UoD7etW5rlkrW8CQ9qwp52ENlSmJPMH8+NNPmFPOEgCegvrf0EpHJlITT3nRCC1QbaP3/N4+UgWb0wiaDMJw5mzVF2rrLb8n26hlW8IhdGn1jt54cyFo7YHapnRZPbFdLSIhn8KNaZo3YTGlq1IU/u6fIzIM0O7yj+2ySe1j0TmBz7R5NHuoJBRdgghqngpFo3JqTaBuYxcOF3O5Zb35/ykY62VqHFGpzPa59Gn6KOAVaVWAFpd1PM9zlhwgg4uk/yaiFSul7fsSW/heKy9ArvTK0q43HE7PhMGjoQ9fAG8Po16WbYJejqfwDZoLq+DX3RxOeEQStZeUfgSpUOCXFU1Nb+gsguui6KXtxoWqIFZSoPT15Ndldjcz1aWsU0YAKSQO/BkyDVzormvQoFFK+fFnMyfez2l84aciQcnZh+6W9FI+vlRNWqLNCO2ouBmucuzQWIqdX5Sz/l3f7l/ZvOLusw+YEoBU2W6blzay8qDqn6oLdD/5PH4amLstTtl8/WRWkbD4lxPa+DpG6tyQUeOSNJ6M+PxaQll3tjmiU2F5x861uJHykNorIU9Cv0D5idDJJwWM2FIEu/j+gp0DAUz9aJ9pAC1gZVO8ubERMZIxL7b9+lPvISdhSv2AitaRMBr2OjtRJFbyKeSjw=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(396003)(346002)(39840400004)(376002)(136003)(36840700001)(46966006)(36860700001)(316002)(47076005)(36756003)(86362001)(6666004)(110136005)(81166007)(40480700001)(356005)(508600001)(2906002)(8676002)(4326008)(107886003)(82310400004)(2616005)(6266002)(1076003)(44832011)(8936002)(336012)(5660300002)(83380400001)(70206006)(70586007)(26005)(186003)(27056005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:39:14.9875 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fff34ca1-c0f7-4d7e-494b-08d9fd2bf8f3
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR02FT025.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0901MB1617
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::722
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::722;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement Exteral Interrupt Controller interface (EIC).
Added intc_present property, true by default. When set to false, nios2
uses the EIC interface when handling IRQ. When set to true (default)
it uses the internal interrupt controller.
When nios2 recieves irq, it first checks intc_present to decide whether
to use the internal interrupt controller or the EIC.

The EIC is triggered by IRQ gpio but also recieves additional data from
the external interrupt controller (such as VIC): rha, ril, rrs and rnmi.
The interrupt controller is expected to raise IRQ after setting these
fields on Nios2CPU.

rha, ril, rrs and rnmi are used when EIC handles external interrupt, in
order to decide if to take the interrupt now, which shadow register set
to use, which PC to jump to, whether to set NMI flag, etc.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 target/nios2/cpu.c    | 54 ++++++++++++++++++++++++++++++++-----------
 target/nios2/cpu.h    | 21 ++++++++++++++++-
 target/nios2/helper.c | 33 ++++++++++++++++++++++----
 3 files changed, 90 insertions(+), 18 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 026ee18b01..d09f20c8db 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -55,6 +55,7 @@ static void nios2_cpu_reset(DeviceState *dev)
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
     memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_REGS);
+    env->regs[CR_STATUS] |= CR_STATUS_RSIE;
     env->regs[R_PC] = cpu->reset_addr;
 
 #if defined(CONFIG_USER_ONLY)
@@ -65,6 +66,25 @@ static void nios2_cpu_reset(DeviceState *dev)
 #endif
 }
 
+static bool nios2_take_eic_irq(const Nios2CPU *cpu)
+{
+    const CPUNios2State *env = &cpu->env;
+
+    if (cpu->rnmi) {
+        return !(env->regs[CR_STATUS] & CR_STATUS_NMI);
+    }
+
+    if (((env->regs[CR_STATUS] & CR_STATUS_PIE) == 0) ||
+        (cpu->ril <= cpu_get_il(env)) ||
+        (cpu->rrs == cpu_get_crs(env) &&
+          !(env->regs[CR_STATUS] & CR_STATUS_RSIE))) {
+
+        return false;
+    }
+
+    return true;
+}
+
 #ifndef CONFIG_USER_ONLY
 static void nios2_cpu_set_irq(void *opaque, int irq, int level)
 {
@@ -91,13 +111,6 @@ static void nios2_cpu_initfn(Object *obj)
 #if !defined(CONFIG_USER_ONLY)
     mmu_init(&cpu->env);
 
-    /*
-     * These interrupt lines model the IIC (internal interrupt
-     * controller). QEMU does not currently support the EIC
-     * (external interrupt controller) -- if we did it would be
-     * a separate device in hw/intc with a custom interface to
-     * the CPU, and boards using it would not wire up these IRQ lines.
-     */
     qdev_init_gpio_in_named(DEVICE(cpu), nios2_cpu_set_irq, "IRQ", 32);
 #endif
 }
@@ -131,13 +144,26 @@ static bool nios2_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
-    if ((interrupt_request & CPU_INTERRUPT_HARD) &&
-        (env->regs[CR_STATUS] & CR_STATUS_PIE) &&
-        (env->regs[CR_IPENDING] & env->regs[CR_IENABLE])) {
-        cs->exception_index = EXCP_IRQ;
-        nios2_cpu_do_interrupt(cs);
-        return true;
+    if (cpu->intc_present) {
+        if ((interrupt_request & CPU_INTERRUPT_HARD) &&
+            (env->regs[CR_STATUS] & CR_STATUS_PIE) &&
+            (env->regs[CR_IPENDING] & env->regs[CR_IENABLE])) {
+            cs->exception_index = EXCP_IRQ;
+            nios2_cpu_do_interrupt(cs);
+            return true;
+        }
+    } else {
+        /*
+         * IPENDING does not exist with external interrupt controller
+         * but we still use it to signal an external interrupt
+         */
+        if (env->regs[CR_IPENDING] && nios2_take_eic_irq(cpu)) {
+            cs->exception_index = EXCP_IRQ;
+            nios2_cpu_do_interrupt(cs);
+            return true;
+        }
     }
+
     return false;
 }
 #endif /* !CONFIG_USER_ONLY */
@@ -200,6 +226,8 @@ static Property nios2_properties[] = {
     DEFINE_PROP_UINT32("mmu_tlb_num_ways", Nios2CPU, tlb_num_ways, 16),
     /* ALTR,tlb-num-entries */
     DEFINE_PROP_UINT32("mmu_pid_num_entries", Nios2CPU, tlb_num_entries, 256),
+    /* interrupt-controller (internal) */
+    DEFINE_PROP_BOOL("intc_present", Nios2CPU, intc_present, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index dbb4c968df..24d2d65aa9 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -92,11 +92,12 @@ struct Nios2CPUClass {
 #define   CR_STATUS_U    (1 << 1)
 #define   CR_STATUS_EH   (1 << 2)
 #define   CR_STATUS_IH   (1 << 3)
-#define   CR_STATUS_IL   (63 << 4)
+FIELD(CR_STATUS, IL, 4, 6)
 FIELD(CR_STATUS, CRS, 10, 6)
 FIELD(CR_STATUS, PRS, 16, 6)
 #define   CR_STATUS_NMI  (1 << 22)
 #define   CR_STATUS_RSIE (1 << 23)
+#define   CR_STATUS_SRS  (1 << 31)
 #define CR_ESTATUS   (CR_BASE + 1)
 #define CR_BSTATUS   (CR_BASE + 2)
 #define CR_IENABLE   (CR_BASE + 3)
@@ -187,6 +188,7 @@ struct Nios2CPU {
     CPUNios2State env;
 
     bool mmu_present;
+    bool intc_present;
     uint32_t pid_num_bits;
     uint32_t tlb_num_ways;
     uint32_t tlb_num_entries;
@@ -195,6 +197,12 @@ struct Nios2CPU {
     uint32_t reset_addr;
     uint32_t exception_addr;
     uint32_t fast_tlb_miss_addr;
+
+    /* External Interrupt Controller Interface */
+    uint32_t rha; /* Requested handler address */
+    uint32_t ril; /* Requested interrupt level */
+    uint32_t rrs; /* Requested register set */
+    uint32_t rnmi; /* Requested nonmaskable interrupt */
 };
 
 
@@ -253,6 +261,17 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
     *flags = (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }
 
+static inline uint32_t cpu_get_il(const CPUNios2State *env)
+{
+    return FIELD_EX32(env->regs[CR_STATUS], CR_STATUS, IL);
+}
+
+static inline void cpu_set_il(CPUNios2State *env, uint32_t value)
+{
+    env->regs[CR_STATUS] =
+        FIELD_DP32(env->regs[CR_STATUS], CR_STATUS, IL, value);
+}
+
 static inline uint32_t cpu_get_crs(const CPUNios2State *env)
 {
     return FIELD_EX32(env->regs[CR_STATUS], CR_STATUS, CRS);
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..bc022e969d 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -54,21 +54,46 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
+    if (cs->exception_index != EXCP_IRQ) {
+        cpu_set_crs(env, 0);
+    }
+
     switch (cs->exception_index) {
     case EXCP_IRQ:
         assert(env->regs[CR_STATUS] & CR_STATUS_PIE);
 
         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->regs[R_PC]);
 
-        env->regs[CR_ESTATUS] = env->regs[CR_STATUS];
-        env->regs[CR_STATUS] |= CR_STATUS_IH;
+        uint32_t last_status = env->regs[CR_STATUS];
         env->regs[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
         env->regs[CR_EXCEPTION] &= ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
 
-        env->regs[R_EA] = env->regs[R_PC] + 4;
-        env->regs[R_PC] = cpu->exception_addr;
+        if (!cpu->intc_present) {
+            cpu_set_crs(env, cpu->rrs);
+            cpu_set_il(env, cpu->ril);
+            if (cpu->rnmi) {
+                env->regs[CR_STATUS] |= CR_STATUS_NMI;
+            } else {
+                env->regs[CR_STATUS] &= ~CR_STATUS_NMI;
+            }
+            if (cpu->rrs == 0) {
+                env->regs[CR_ESTATUS] = last_status;
+            } else {
+                env->regs[R_SSTATUS] = last_status;
+                env->regs[R_SSTATUS] |= CR_STATUS_SRS;
+            }
+            env->regs[CR_STATUS] |= CR_STATUS_IH;
+            env->regs[R_EA] = env->regs[R_PC] + 4;
+            env->regs[R_PC] = cpu->rha;
+
+        } else {
+            env->regs[CR_ESTATUS] = last_status;
+            env->regs[R_EA] = env->regs[R_PC] + 4;
+            env->regs[R_PC] = cpu->exception_addr;
+        }
+
         break;
 
     case EXCP_TLBD:
-- 
2.25.1


