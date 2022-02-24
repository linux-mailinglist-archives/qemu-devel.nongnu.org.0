Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796074C2E59
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:25:18 +0100 (CET)
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNF3V-00064P-Ix
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:25:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNF1D-0004Z7-Uk
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:22:55 -0500
Received: from [2a01:111:f400:fe0d::71a] (port=60166
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNF1A-000296-Ep
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:22:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeYPEk5I3dN6/HUh4Foz6wWPw4XA5XICxV6uMsukCk9EojKrDcdu/YDrekY947iu/K6lT4NzLZ5DOtImGKEcsvaqKEivL908dRddYcRQuz1OFUGroA2xATozNuKlESKwjzqjC1GCFbyEAFFWod+FFAbLwr8bRTe0o2yAOLp0gSkUuYp71bbIpgLqWMn1M5+jg7CK9TIuVHDrhpXdDvrtKndfc4/nqkE49y3vugzGFIAEGW5mnsUZcf4jTgpev5poefFvE06PDToHY6joZJsXhh4I6k6cdjRaGN6nnufE4Rw8KJFYOkvHpdqFtZNhIuyIkpq5rR32ALtUwxYelNrBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+LTtdmSQTzcbU1knKt9/bt3i0YzY9uULhTAlCwOrv8=;
 b=nAObiv/Gqzxqv8PTOhSpdKoGzDZUhbx6F2rBLWr15q8OV3uUAIn6qg9BktuAb/smtiupKOYnLJWcos99yuVGyl5DHQo4nDwPDsRy84lE03XhXQHk8zElF5QakLvGRA0SicH8NV1gOkgNdeDv3taLDH42s1l/++ITTIQLQ0YbMxasPlG7O+wYNR+a1hdNyBjJYSMYD0r+Tfc/YWATKLzPgBJzItveXA/i9uj7yEt1Ru9MUY30XPcB3WoVYX78lM2T0yadsVhmLuIe5l0+RzpeBtwzFV6VN4PY/ea5aPsauoQqLG9KBFnYUHOmUTtc0a3TwWWD1OVyhu6m5o34IdiVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+LTtdmSQTzcbU1knKt9/bt3i0YzY9uULhTAlCwOrv8=;
 b=e5LApPRoUGBldDGxmom+TnXzwMkA3YfiYH8YbFrL3NcYeXnU5tZ6LLGGtgNZXmZMiIvEFxduUYs9DXWnblfjV+t8O6hwyRBzMdfSjXV+ihbkjY085ZCrPtT6DSMrLDcI0ZSqLlULm8juupThxfHw2qZIPNxq10ck6d7OytQQBGY=
Received: from AS9PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:20b:463::21)
 by DB8PR09MB3834.eurprd09.prod.outlook.com (2603:10a6:10:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 13:49:50 +0000
Received: from VE1EUR02FT030.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::b5) by AS9PR06CA0037.outlook.office365.com
 (2603:10a6:20b:463::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21 via Frontend
 Transport; Thu, 24 Feb 2022 13:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 VE1EUR02FT030.mail.protection.outlook.com (10.152.12.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.23 via Frontend Transport; Thu, 24 Feb 2022 13:49:49 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 2AA991F6C1;
 Thu, 24 Feb 2022 15:49:28 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 1/4] target/nios2: Shadow register set
Date: Thu, 24 Feb 2022 15:48:58 +0200
Message-Id: <20220224134901.500007-2-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4b4c3926-7165-4ad0-2fd7-08d9f79c86f7
X-MS-TrafficTypeDiagnostic: DB8PR09MB3834:EE_
X-Microsoft-Antispam-PRVS: <DB8PR09MB3834106C771EF2495B1F5167EB3D9@DB8PR09MB3834.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdUIQ9a+Y3jh8QPdtZTLiFn6uC8ChykIhknNNlY9oL0HWOYX+u0EYsE2sx5oOE7qhYXWYYjAIL3/48AM1HS4p1XJTdg+/SklbDd7IyYJmmd4imVtERoC1IUWSd3d3GyoEnwqRdkK570LlAokoKHtCke/+Nhr9JA0xvp7p+8J8GvqBHNtTXnXexU3861po0PmgnQPXNWqDD8BC+EwcFEFeRR1MDA8Ou9G7/g4ov4KdTUS+douy8ZTD4uSBSjJQ7YSpdX0MphhJoEOOuJoAXXdvDL1T/FiY9bLz2sa/3HgzNK9UndVhaw9CzMkgVRI6JnlH9jud8TfdyqtieuSht47TacYBz3/Ip25K4ArTod5hDLC2fp45j29KZ9gOZZTOH3tVUh4GxIfN/n94SrzbLLw5L+m87eHvGPHzkweObm9ApIlrT/EU6Sha8GJQGAMVKeBIAoINFKM+qcULzDtfY/HQRNfkXG781ICtXNotSJ52wQRGPobkGzGFS8mQWBowX+92UkCCIpLy+oaTgtwvA/EC7ay8CDAnPtUtL+WWfvIAJdaG/ih0RAbCe4KFBsD7ufCRhQfjOARxxB49MixdhsfGNPPCc3/ymR+9V7/BnGk3i1wPTFS0msuuj7sZXk2QUbtvxnL3vFdLfnkLWxv24sq3JDj81G0ESuz4fAMjqDYbWmCsV94TG8nxSTp+Y31b02gCbfMZiSDYVZoJjp/UOd0q6qEntUSnm/llO2OtjziBG4FuVnr+dv1L/znIold9HTmTWzh3WAG6MEhHgysFxwL4Vv09Defhzh9+67LHxLHk/3efWSlWFf6tRn7wOEIHY35
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(136003)(376002)(34036004)(346002)(39840400004)(396003)(36840700001)(46966006)(36860700001)(316002)(86362001)(1076003)(2906002)(83380400001)(508600001)(110136005)(82310400004)(6666004)(5660300002)(186003)(70206006)(70586007)(44832011)(40480700001)(36756003)(107886003)(47076005)(26005)(336012)(6266002)(356005)(81166007)(8936002)(4326008)(8676002)(2616005)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:49:49.9691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4c3926-7165-4ad0-2fd7-08d9f79c86f7
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT030.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3834
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::71a
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::71a;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Implement shadow register set and related instructions
rdprs, wrprs. Fix eret to update either status or sstatus
according to current register set.
eret also changes register set when needed.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 target/nios2/cpu.c       |  1 +
 target/nios2/cpu.h       | 47 ++++++++++++++++++++++++++++++++++++++--
 target/nios2/helper.h    |  3 +++
 target/nios2/op_helper.c | 24 ++++++++++++++++++++
 target/nios2/translate.c | 32 ++++++++++++++++++++++-----
 5 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 4cade61e93..0886705818 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -54,6 +54,7 @@ static void nios2_cpu_reset(DeviceState *dev)
     ncc->parent_reset(dev);

     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
+    memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_R=
EGS);
     env->regs[R_PC] =3D cpu->reset_addr;

 #if defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index d2ba0c5bbd..1d3503825b 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -57,9 +57,14 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008

+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32

 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
+
+/* 63 shadow register sets. 0 is the primary set */
+#define NUM_REG_SETS 64

 /* General purpose register aliases */
 #define R_ZERO   0
@@ -80,7 +85,7 @@ struct Nios2CPUClass {
 #define R_RA     31

 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
@@ -88,7 +93,9 @@ struct Nios2CPUClass {
 #define   CR_STATUS_IH   (1 << 3)
 #define   CR_STATUS_IL   (63 << 4)
 #define   CR_STATUS_CRS  (63 << 10)
+#define   CR_STATUS_CRS_OFFSET 10
 #define   CR_STATUS_PRS  (63 << 16)
+#define   CR_STATUS_PRS_OFFSET 16
 #define   CR_STATUS_NMI  (1 << 22)
 #define   CR_STATUS_RSIE (1 << 23)
 #define CR_ESTATUS   (CR_BASE + 1)
@@ -131,6 +138,7 @@ struct Nios2CPUClass {

 /* Other registers */
 #define R_PC         64
+#define R_SSTATUS    30

 /* Exceptions */
 #define EXCP_BREAK    0x1000
@@ -157,6 +165,7 @@ struct Nios2CPUClass {

 struct CPUNios2State {
     uint32_t regs[NUM_CORE_REGS];
+    uint32_t shadow_regs[NUM_REG_SETS][NUM_GP_REGS];

 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
@@ -246,4 +255,38 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State =
*env, target_ulong *pc,
     *flags =3D (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }

+static inline uint32_t cpu_get_crs(const CPUNios2State *env)
+{
+    return (env->regs[CR_STATUS] & CR_STATUS_CRS)
+                    >> CR_STATUS_CRS_OFFSET;
+}
+
+static inline uint32_t cpu_get_prs(const CPUNios2State *env)
+{
+    return (env->regs[CR_STATUS] & CR_STATUS_PRS)
+                    >> CR_STATUS_PRS_OFFSET;
+}
+
+static inline void cpu_change_reg_set(CPUNios2State *env, uint32_t prev_se=
t,
+                                      uint32_t new_set)
+{
+    if (new_set =3D=3D prev_set) {
+        return;
+    }
+    memcpy(env->shadow_regs[prev_set], env->regs,
+           sizeof(uint32_t) * NUM_GP_REGS);
+    memcpy(env->regs, env->shadow_regs[new_set],
+           sizeof(uint32_t) * NUM_GP_REGS);
+    env->regs[CR_STATUS] =3D (env->regs[CR_STATUS] & (~CR_STATUS_PRS))
+                       | ((prev_set << CR_STATUS_PRS_OFFSET) & CR_STATUS_P=
RS);
+    env->regs[CR_STATUS] =3D (env->regs[CR_STATUS] & (~CR_STATUS_CRS))
+                       | ((new_set << CR_STATUS_CRS_OFFSET) & CR_STATUS_CR=
S);
+}
+
+static inline void cpu_set_crs(CPUNios2State *env, uint32_t value)
+{
+    uint32_t crs =3D cpu_get_crs(env);
+    cpu_change_reg_set(env, crs, value);
+}
+
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 6c8f0b5b35..3e5c016e9c 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -18,6 +18,9 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */

+DEF_HELPER_2(eret, void, env, i32)
+DEF_HELPER_3(wrprs, void, env, i32, i32)
+DEF_HELPER_2(rdprs, i32, env, i32)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)

 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a59003855a..5e4f7a47ae 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -59,3 +59,27 @@ void helper_raise_exception(CPUNios2State *env, uint32_t=
 index)
     cs->exception_index =3D index;
     cpu_loop_exit(cs);
 }
+
+void helper_wrprs(CPUNios2State *env, uint32_t reg_index, uint32_t value)
+{
+    uint32_t prs =3D cpu_get_prs(env);
+    env->shadow_regs[prs][reg_index] =3D value;
+}
+
+uint32_t helper_rdprs(CPUNios2State *env, uint32_t reg_index)
+{
+    uint32_t prs =3D cpu_get_prs(env);
+    return env->shadow_regs[prs][reg_index];
+}
+
+void helper_eret(CPUNios2State *env, uint32_t new_pc)
+{
+    uint32_t crs =3D cpu_get_crs(env);
+    if (crs =3D=3D 0) {
+        env->regs[CR_STATUS] =3D env->regs[CR_ESTATUS];
+    } else {
+        env->regs[CR_STATUS] =3D env->regs[R_SSTATUS];
+    }
+    cpu_change_reg_set(env, crs, cpu_get_crs(env));
+    env->regs[R_PC] =3D new_pc;
+}
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f9abc2fdd2..e22ab1996a 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -205,6 +205,19 @@ static void call(DisasContext *dc, uint32_t code, uint=
32_t flags)
 /*
  * I-Type instructions
  */
+
+/*
+ * rB <- prs.rA + sigma(IMM16)
+ */
+static void rdprs(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+    I_TYPE(instr, code);
+    TCGv t =3D tcg_temp_new();
+    gen_helper_rdprs(t, cpu_env, tcg_const_i32(instr.a));
+    tcg_gen_addi_tl(cpu_R[instr.b], t, instr.imm16.s);
+    tcg_temp_free(t);
+}
+
 /* Load instructions */
 static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
@@ -365,7 +378,7 @@ static const Nios2Instruction i_type_instructions[] =3D=
 {
     INSTRUCTION_FLG(gen_stx, MO_SL),                  /* stwio */
     INSTRUCTION_FLG(gen_bxx, TCG_COND_LTU),           /* bltu */
     INSTRUCTION_FLG(gen_ldx, MO_UL),                  /* ldwio */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* rdprs */
+    INSTRUCTION(rdprs),                               /* rdprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(handle_r_type_instr, 0),          /* R-Type */
     INSTRUCTION_NOP(),                                /* flushd */
@@ -378,14 +391,23 @@ static const Nios2Instruction i_type_instructions[] =
=3D {
 /*
  * R-Type instructions
  */
+
+/*
+ * prs.rC <- rA
+ */
+static void wrprs(DisasContext *dc, uint32_t code, uint32_t flags)
+{
+    R_TYPE(instr, code);
+    gen_helper_wrprs(cpu_env, tcg_const_i32(instr.c), cpu_R[instr.a]);
+}
+
 /*
- * status <- estatus
+ * status <- CRS =3D=3D 0? estatus: sstatus
  * PC <- ea
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
+    gen_helper_eret(cpu_env, cpu_R[R_EA]);

     dc->base.is_jmp =3D DISAS_JUMP;
 }
@@ -672,7 +694,7 @@ static const Nios2Instruction r_type_instructions[] =3D=
 {
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(slli),                                /* slli */
     INSTRUCTION(sll),                                 /* sll */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* wrprs */
+    INSTRUCTION(wrprs),                               /* wrprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION(or),                                  /* or */
     INSTRUCTION(mulxsu),                              /* mulxsu */
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

