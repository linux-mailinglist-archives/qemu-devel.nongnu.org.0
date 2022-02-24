Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1236D4C2E57
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:24:28 +0100 (CET)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNF2g-0004ni-Sh
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:24:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNF0R-0003b4-MH
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:22:07 -0500
Received: from [2a01:111:f400:fe0e::725] (port=58848
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNF0O-0001xB-Mn
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:22:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZZ5mj/vwP1UJVOaxozL99rqafxtFHkycRaUOBjRKl9ZtP5h6aGN7j4sGgIaSmi4AjZ3/FUYtcTsY7u7KHUaJ1O60scQ21sMZGrsHHYgYD/WACrYJr77ee6WjYXSJnC0j1SGo6CQuWTwyKvRBVcH8yPXPvDoogAARObW9ZFzjAvjM3dLVK9LtW5PqBr6L6NqXdRkzEePEtm3rBo2eji5pMzkAeXx6xxtuwqyhpiOeNVWwnQ9qb3AFfqvRtmotCCll4tNfBhJjxILzvo+2LyQgOIZq563eQtqwIpNPxNdphzNTuRd7nLSzEibo7b0Nj6AZ3CS0e6FtYZDbypKYhAgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byptLtzyopgwHv9aXHp0sYgBZ6k5E5boMrKXpeMNiJw=;
 b=lQgN2Z8kF+Oy8V8d6wSsXmw3IW4/UwPpSG4rAmVbHhzbi1rKg8HVyQ5L6eGNogU4QYRxlSVtlyMtVSrNtz7YIpyn/sWIlWcnF/vJoJNKdpquHceVzdAVcepyhI7wOdTprvER8no5K+si/p1TnPvXEm4rhr9l++5anvVFUicfHTvA0TA1kikQYusPYVb5mQ0a2f84T2M/goJ2VPOZkLXs5e36QnEZH33lSVQEWUTzmerKERx1xIQHSD8zd4aH9BieKCLX1bhiXeRImXNBXJsbdiQEceszFPEetaMs/Rp1iVxp4hTdW7teEd4HeT7ToiWs35lqQIyqG2rladQOBiz96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byptLtzyopgwHv9aXHp0sYgBZ6k5E5boMrKXpeMNiJw=;
 b=EE5BXQXoYs+GliXCxWEdNT7NQIjb/yXU9A6zdFTxn2R057s3j8uJrggar+rf7D5mSxsecbTEdjUj3AbuWLNGd46/FXK4RyxWavKr5rLyB0CHrxEzxs074efJ88/zDR81/Dvw2pSQHyRfNNBpkadssAVXxnuwGRIx/XjOZpeJ0h8=
Received: from AM5PR1001CA0039.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::16) by AM8PR09MB5365.eurprd09.prod.outlook.com
 (2603:10a6:20b:324::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 13:49:53 +0000
Received: from VE1EUR02FT045.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::1a) by AM5PR1001CA0039.outlook.office365.com
 (2603:10a6:206:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Thu, 24 Feb 2022 13:49:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 VE1EUR02FT045.mail.protection.outlook.com (10.152.12.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.23 via Frontend Transport; Thu, 24 Feb 2022 13:49:51 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 09B381F6C1;
 Thu, 24 Feb 2022 15:49:30 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 2/4] target/nios2: Exteral Interrupt Controller (EIC)
Date: Thu, 24 Feb 2022 15:48:59 +0200
Message-Id: <20220224134901.500007-3-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c326506a-ea7e-499e-0cbb-08d9f79c8814
X-MS-TrafficTypeDiagnostic: AM8PR09MB5365:EE_
X-Microsoft-Antispam-PRVS: <AM8PR09MB5365CCE06FB4419B0F4B7266EB3D9@AM8PR09MB5365.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zAGay09UQef/mtyXP88cKJO8P7hrG62rR66mDTMi15lGX4yehuoM072kSvaLMwupraRA9pQ3qgu4VsFoBvQ93E+4HKATpF8jReID68FUQf9IFLrPRPjXEMgLxEwVu+w6uGYc06gQxt1sTmuj3fvhULwoxcOU1uIO5kV6FRFMC4FNrjzflLB8qi/9cnXAtIKMdIa0WhLR2J+fqkf9mrAueLHSYUPOUYo5kSQHiobKGrImP4FT8WHyqbvau2rmSnlbvSM80S4zoqc+6u3QK+jvyPaQ1+3O6BiFaenKquRF9d6tdP91DS9Jf8/lGtciIVJZMsj3BJZpvh1X1hyUD5qMcznOF9boESUEga17Htx8PfcZ36myYASLOWbVxyG+AhUNks0ZiLSMFkzzq29lia5o1PFPYBT6EPI3L6XKil0N23urqtQY4RC/y3wRVYQ0rVZdYu9He2bxwNkQITWEiT+rSqaewzk4X5wK0frQl7rCxJ6Nvu2D7sSJqWLCgYipmVNeM+fOYwPJaxTgIYGyYo/S9EFadYuBdRjnG9rtoJ8HjXSQRPL1cJPaF5VIxbj6B5Hd+vieCwr/kW4sOduu//ChJRaOTEKime9IwkOpK0jTBOtJdiUhetX0o/1dKVJEfJs7O8Y5Ip8aRMDjEIFiqdGevy3A+8IzaxhqpwOAZODblrp+JR4IGGb6WM8Q6j+igZFReewtzUdFM+H1yOJEEdybzJGY2bwrBP7pSXePTlMqjjk=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(39840400004)(396003)(136003)(346002)(34036004)(376002)(46966006)(36840700001)(40480700001)(186003)(82310400004)(508600001)(6666004)(6266002)(44832011)(26005)(1076003)(336012)(36860700001)(81166007)(70206006)(5660300002)(107886003)(356005)(316002)(36756003)(47076005)(8676002)(83380400001)(4326008)(110136005)(2906002)(2616005)(8936002)(86362001)(70586007)(27056005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:49:51.8203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c326506a-ea7e-499e-0cbb-08d9f79c8814
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT045.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR09MB5365
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::725
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::725;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 target/nios2/cpu.c       | 58 +++++++++++++++++++++++++++++++++-------
 target/nios2/cpu.h       | 22 +++++++++++++++
 target/nios2/helper.c    | 33 ++++++++++++++++++++---
 target/nios2/op_helper.c |  7 +++--
 4 files changed, 105 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 0886705818..9bd8a6301a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -55,6 +55,7 @@ static void nios2_cpu_reset(DeviceState *dev)

     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
     memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_R=
EGS);
+    env->regs[CR_STATUS] |=3D CR_STATUS_RSIE;
     env->regs[R_PC] =3D cpu->reset_addr;

 #if defined(CONFIG_USER_ONLY)
@@ -65,10 +66,28 @@ static void nios2_cpu_reset(DeviceState *dev)
 #endif
 }

+bool nios2_take_eic_irq(const Nios2CPU *cpu)
+{
+    const CPUNios2State *env =3D &cpu->env;
+
+    if (cpu->rnmi) {
+        return !(env->regs[CR_STATUS] & CR_STATUS_NMI);
+    }
+
+    if (((env->regs[CR_STATUS] & CR_STATUS_PIE) =3D=3D 0) ||
+        (cpu->ril <=3D cpu_get_il(env)) ||
+        (cpu->rrs =3D=3D cpu_get_crs(env) &&
+          !(env->regs[CR_STATUS] & CR_STATUS_RSIE))) {
+
+        return false;
+    }
+
+    return true;
+}
+
 #ifndef CONFIG_USER_ONLY
-static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+static void nios2_cpu_set_intc_irq(Nios2CPU *cpu, int irq, int level)
 {
-    Nios2CPU *cpu =3D opaque;
     CPUNios2State *env =3D &cpu->env;
     CPUState *cs =3D CPU(cpu);

@@ -83,6 +102,32 @@ static void nios2_cpu_set_irq(void *opaque, int irq, in=
t level)
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
     }
 }
+
+static void nios2_cpu_set_eic_irq(Nios2CPU *cpu, int level)
+{
+    CPUNios2State *env =3D &cpu->env;
+    CPUState *cs =3D CPU(cpu);
+
+    env->irq_pending =3D level;
+
+    if (env->irq_pending && nios2_take_eic_irq(cpu)) {
+        env->irq_pending =3D 0;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else if (!env->irq_pending) {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+static void nios2_cpu_set_irq(void *opaque, int irq, int level)
+{
+    Nios2CPU *cpu =3D opaque;
+
+    if (cpu->intc_present) {
+        nios2_cpu_set_intc_irq(cpu, irq, level);
+    } else {
+        nios2_cpu_set_eic_irq(cpu, level);
+    }
+}
 #endif

 static void nios2_cpu_initfn(Object *obj)
@@ -94,13 +139,6 @@ static void nios2_cpu_initfn(Object *obj)
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
@@ -202,6 +240,8 @@ static Property nios2_properties[] =3D {
     DEFINE_PROP_UINT32("mmu_tlb_num_ways", Nios2CPU, tlb_num_ways, 16),
     /* ALTR,tlb-num-entries */
     DEFINE_PROP_UINT32("mmu_pid_num_entries", Nios2CPU, tlb_num_entries, 2=
56),
+    /* interrupt-controller (internal) */
+    DEFINE_PROP_BOOL("intc_present", Nios2CPU, intc_present, true),
     DEFINE_PROP_END_OF_LIST(),
 };

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 1d3503825b..1b3d0ed25e 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -92,12 +92,14 @@ struct Nios2CPUClass {
 #define   CR_STATUS_EH   (1 << 2)
 #define   CR_STATUS_IH   (1 << 3)
 #define   CR_STATUS_IL   (63 << 4)
+#define   CR_STATUS_IL_OFFSET 6
 #define   CR_STATUS_CRS  (63 << 10)
 #define   CR_STATUS_CRS_OFFSET 10
 #define   CR_STATUS_PRS  (63 << 16)
 #define   CR_STATUS_PRS_OFFSET 16
 #define   CR_STATUS_NMI  (1 << 22)
 #define   CR_STATUS_RSIE (1 << 23)
+#define   CR_STATUS_SRS  (1 << 31)
 #define CR_ESTATUS   (CR_BASE + 1)
 #define CR_BSTATUS   (CR_BASE + 2)
 #define CR_IENABLE   (CR_BASE + 3)
@@ -189,6 +191,7 @@ struct Nios2CPU {
     CPUNios2State env;

     bool mmu_present;
+    bool intc_present;
     uint32_t pid_num_bits;
     uint32_t tlb_num_ways;
     uint32_t tlb_num_entries;
@@ -197,10 +200,17 @@ struct Nios2CPU {
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


 void nios2_tcg_init(void);
+bool nios2_take_eic_irq(const Nios2CPU *cpu);
 void nios2_cpu_do_interrupt(CPUState *cs);
 void dump_mmu(CPUNios2State *env);
 void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
@@ -255,6 +265,18 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State =
*env, target_ulong *pc,
     *flags =3D (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }

+static inline uint32_t cpu_get_il(const CPUNios2State *env)
+{
+    return (env->regs[CR_STATUS] & CR_STATUS_IL)
+                    >> CR_STATUS_IL_OFFSET;
+}
+
+static inline void cpu_set_il(CPUNios2State *env, uint32_t value)
+{
+    env->regs[CR_STATUS] =3D (env->regs[CR_STATUS] & ~CR_STATUS_IL)
+                    | ((value << CR_STATUS_IL_OFFSET) & CR_STATUS_IL);
+}
+
 static inline uint32_t cpu_get_crs(const CPUNios2State *env)
 {
     return (env->regs[CR_STATUS] & CR_STATUS_CRS)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..bc022e969d 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -54,21 +54,46 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     Nios2CPU *cpu =3D NIOS2_CPU(cs);
     CPUNios2State *env =3D &cpu->env;

+    if (cs->exception_index !=3D EXCP_IRQ) {
+        cpu_set_crs(env, 0);
+    }
+
     switch (cs->exception_index) {
     case EXCP_IRQ:
         assert(env->regs[CR_STATUS] & CR_STATUS_PIE);

         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=3D%x\n", env->regs[R_P=
C]);

-        env->regs[CR_ESTATUS] =3D env->regs[CR_STATUS];
-        env->regs[CR_STATUS] |=3D CR_STATUS_IH;
+        uint32_t last_status =3D env->regs[CR_STATUS];
         env->regs[CR_STATUS] &=3D ~(CR_STATUS_PIE | CR_STATUS_U);

         env->regs[CR_EXCEPTION] &=3D ~(0x1F << 2);
         env->regs[CR_EXCEPTION] |=3D (cs->exception_index & 0x1F) << 2;

-        env->regs[R_EA] =3D env->regs[R_PC] + 4;
-        env->regs[R_PC] =3D cpu->exception_addr;
+        if (!cpu->intc_present) {
+            cpu_set_crs(env, cpu->rrs);
+            cpu_set_il(env, cpu->ril);
+            if (cpu->rnmi) {
+                env->regs[CR_STATUS] |=3D CR_STATUS_NMI;
+            } else {
+                env->regs[CR_STATUS] &=3D ~CR_STATUS_NMI;
+            }
+            if (cpu->rrs =3D=3D 0) {
+                env->regs[CR_ESTATUS] =3D last_status;
+            } else {
+                env->regs[R_SSTATUS] =3D last_status;
+                env->regs[R_SSTATUS] |=3D CR_STATUS_SRS;
+            }
+            env->regs[CR_STATUS] |=3D CR_STATUS_IH;
+            env->regs[R_EA] =3D env->regs[R_PC] + 4;
+            env->regs[R_PC] =3D cpu->rha;
+
+        } else {
+            env->regs[CR_ESTATUS] =3D last_status;
+            env->regs[R_EA] =3D env->regs[R_PC] + 4;
+            env->regs[R_PC] =3D cpu->exception_addr;
+        }
+
         break;

     case EXCP_TLBD:
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 5e4f7a47ae..1de823a067 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -40,8 +40,11 @@ static void nios2_check_interrupts(CPUNios2State *env)
 {
     if (env->irq_pending &&
         (env->regs[CR_STATUS] & CR_STATUS_PIE)) {
-        env->irq_pending =3D 0;
-        cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
+        Nios2CPU *cpu =3D (Nios2CPU *)env_cpu(env);
+        if (cpu->intc_present || nios2_take_eic_irq(cpu)) {
+            env->irq_pending =3D 0;
+            cpu_interrupt(env_cpu(env), CPU_INTERRUPT_HARD);
+        }
     }
 }

--
2.25.1


The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in error, please immediately alert the sender by reply emai=
l and then delete this message and any attachments. If you are not the inte=
nded recipient, you are hereby notified that any use, dissemination, copyin=
g, or storage of this message or its attachments is strictly prohibited.

