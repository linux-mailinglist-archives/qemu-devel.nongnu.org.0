Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831F4CC2D2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:31:30 +0100 (CET)
Received: from localhost ([::1]:36412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoMS-0000bt-51
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:31:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPo3o-0005Ia-DD
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:12:13 -0500
Received: from [2a01:111:f400:fe02::72c] (port=30979
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPo3l-0000QG-IA
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:12:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPmMuOYv0Bzm4btgU3gU0r4i8mas+a14G5EIwlPPsUulWybQtCTp1tP90RSgSC5XSAWpUhZA4meHrt+Kf0NnVludaiP3D0Q8To9zRakWyRe5o1cjba+koniq5zMduNfTeexRfb/KufyqJmtP817+Xjb1WU0cI+eUtq3fCZgZcGxC/HtGb/OBZ+F9juUZkkpZHtiftUK5Gvo5g+rQbz32eJF1ncUKOQJQpbyRgJ3q18sLEU0xYs0RqGW8+n4+5gW2cZeS2aapR0L4qVNGnnH7G6DBDTNaLLNvf7iVciJpWnKksgA52c0n6pmkSkf7YaRrAc5zhClKeFaR/Vz2eAXwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnRX4QqQnYeCrWi+0WKskJZoibLneU2+aAlzIcjH2G0=;
 b=Jy0pMFoU5viNpByNYMmH8SAYv40/WCwXgqxZJYU6RdaeClfyZMzgCvjfUVIFmGmtdgXJqJhcJpxNuwvztOpVlFsI37xazvlIoaWM17Bm/RKaTlNRaQnordOVWPq/1FdQXNDsmFH5rbunpN7njvJWzI1IYn2YBmx+og9pEyKWi3aib6Z4YP/D8fCgAJMH2a2ES9btDezifsus8bpgLoEV2U849RDI8SZyFxvLvm4tsVpBazOX2Eneqc9luJYq4L4aDDxjQVAesIiheqiEeacWh9Gt66TEoTu+SmYwph3ewa/I4HM7YQkHv1iuLXtzo5j1JT7G9FobNd8YYCeH9Dd5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnRX4QqQnYeCrWi+0WKskJZoibLneU2+aAlzIcjH2G0=;
 b=H3gHw1V7ECuPiy+AgpmWG8bRlOMjOnNssOpEnS/CR8m5t+j63T6GXHYOcAB+B6QEs8gqSbE7OSwIFtOjUxSDQb638y6PHbIZGhFV6e7eQM7DW4l+xWeZ6lE/MUBVT3EjRjoOuK5N8dkw2OV4Z6dXt/QymMAtEc77DF5UNYc6wJw=
Received: from AM6PR10CA0004.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::17)
 by AS8PR09MB5272.eurprd09.prod.outlook.com (2603:10a6:20b:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:39:18 +0000
Received: from AM5EUR02FT063.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::59) by AM6PR10CA0004.outlook.office365.com
 (2603:10a6:209:89::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 15:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 AM5EUR02FT063.mail.protection.outlook.com (10.152.9.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:39:14 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 5ECEA211BB;
 Thu,  3 Mar 2022 17:38:59 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/5] target/nios2: Shadow register set
Date: Thu,  3 Mar 2022 17:39:03 +0200
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0cb63ed-5c4a-4fad-5672-08d9fd2bf8d4
X-MS-TrafficTypeDiagnostic: AS8PR09MB5272:EE_
X-Microsoft-Antispam-PRVS: <AS8PR09MB5272F8ADCE37C91F22583E5DEB049@AS8PR09MB5272.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVObgxw9CFgZfmo0Gedke0gr3YrXO44YYbA7GRZ6WYlxnq/ec8mWe26DJ8QxeSqM4/BwURH5UZp1D9JBnEIHa6j8WfFRcLiJ4c6SiTHfFnFqrE5MNLTclJ+WNVJRUlHEse7/cKe0EqPVRydjdqoysaDmUpNquF1K1HPTY6d9oBGM/z5VfdPZuFNLkY8CB0toNz6PyX0xTxKoFEP8ax5iEF7JiJ400sj4+TZI9xFzlgoaUjPIW+X/97dGe4RqmFsGYVGNyFX69BKXeMaA7sue4uv/eGViwNZxbXz0scwrUbxgqpc7w+pOS59nDjSmSPbadGWAP+vb4uvvPF6ZuCZ8ZfcK2cLdqx/CLetgTgHbN/Xd9+b+bmqRJ4nN8eLSacxuM8lPrdgcFGBSoLwddKmYU6vzj8mxLRSIqv0ndKjkTfK45d41stwcIi1TtC/25mLibSRFJRce7WGCFGnDQQFefJ2znaY/vu9Ofg5c28Tq/BCOqQWixrEbVAyxMu/aXP8ZLemaQjyOYzu+IsJXqPCcoSoPERl0yXrVBiftKUk/MwEXD+PZa+tW3xj1a5NuI9igSgpoxn1G4SJ+1XPYd9j7bqlbi3PmQilphQhT+SnVY2ymqoGpccDTdFC/gM44WDeCBC+rOFnjtJ9li2JkMXU9HVsZbHMnlO5c6BIIqKsja+1DZBe2E3cCdJqv3y7TI7626SidBtljmURhpz8t1wce9JCJTBD9ksa/VzlxqboOFwwltsQ5Gkh8ppc1j5OwJ8eMKs7751a2Oi/8rwci5TE0tjdU2bo+KYVgE4lzD1scaYa/0CnlfiTMkAmnpktpahsn
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(136003)(39840400004)(396003)(346002)(376002)(46966006)(36840700001)(336012)(70206006)(8676002)(186003)(4326008)(70586007)(81166007)(2616005)(1076003)(26005)(6266002)(107886003)(6666004)(5660300002)(8936002)(44832011)(86362001)(2906002)(36756003)(82310400004)(316002)(508600001)(110136005)(47076005)(83380400001)(40480700001)(36860700001)(356005)(27056005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:39:14.8003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0cb63ed-5c4a-4fad-5672-08d9fd2bf8d4
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT063.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::72c;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

Implement shadow register set and related instructions
rdprs, wrprs. Fix eret to update either status or sstatus
according to current register set.
eret also changes register set when needed.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 target/nios2/cpu.c       |  1 +
 target/nios2/cpu.h       | 48 +++++++++++++++++++++++++++---
 target/nios2/helper.h    |  1 +
 target/nios2/op_helper.c | 18 +++++++++++
 target/nios2/translate.c | 64 ++++++++++++++++++++++++++++++++++++----
 5 files changed, 123 insertions(+), 9 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 6975ae4bdb..026ee18b01 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -54,6 +54,7 @@ static void nios2_cpu_reset(DeviceState *dev)
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
+    memset(env->shadow_regs, 0, sizeof(uint32_t) * NUM_REG_SETS * NUM_GP_REGS);
     env->regs[R_PC] = cpu->reset_addr;
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a00e4229ce..dbb4c968df 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -23,6 +23,7 @@
 
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 typedef struct CPUNios2State CPUNios2State;
@@ -57,9 +58,14 @@ struct Nios2CPUClass {
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
@@ -80,15 +86,15 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
 #define   CR_STATUS_EH   (1 << 2)
 #define   CR_STATUS_IH   (1 << 3)
 #define   CR_STATUS_IL   (63 << 4)
-#define   CR_STATUS_CRS  (63 << 10)
-#define   CR_STATUS_PRS  (63 << 16)
+FIELD(CR_STATUS, CRS, 10, 6)
+FIELD(CR_STATUS, PRS, 16, 6)
 #define   CR_STATUS_NMI  (1 << 22)
 #define   CR_STATUS_RSIE (1 << 23)
 #define CR_ESTATUS   (CR_BASE + 1)
@@ -131,6 +137,7 @@ struct Nios2CPUClass {
 
 /* Other registers */
 #define R_PC         64
+#define R_SSTATUS    30
 
 /* Exceptions */
 #define EXCP_BREAK    0x1000
@@ -157,6 +164,7 @@ struct Nios2CPUClass {
 
 struct CPUNios2State {
     uint32_t regs[NUM_CORE_REGS];
+    uint32_t shadow_regs[NUM_REG_SETS][NUM_GP_REGS];
 
 #if !defined(CONFIG_USER_ONLY)
     Nios2MMU mmu;
@@ -245,4 +253,36 @@ static inline void cpu_get_tb_cpu_state(CPUNios2State *env, target_ulong *pc,
     *flags = (env->regs[CR_STATUS] & (CR_STATUS_EH | CR_STATUS_U));
 }
 
+static inline uint32_t cpu_get_crs(const CPUNios2State *env)
+{
+    return FIELD_EX32(env->regs[CR_STATUS], CR_STATUS, CRS);
+}
+
+static inline uint32_t cpu_get_prs(const CPUNios2State *env)
+{
+    return FIELD_EX32(env->regs[CR_STATUS], CR_STATUS, PRS);
+}
+
+static inline void cpu_change_reg_set(CPUNios2State *env, uint32_t prev_set,
+                                      uint32_t new_set)
+{
+    if (new_set == prev_set) {
+        return;
+    }
+    memcpy(env->shadow_regs[prev_set], env->regs,
+           sizeof(uint32_t) * NUM_GP_REGS);
+    memcpy(env->regs, env->shadow_regs[new_set],
+           sizeof(uint32_t) * NUM_GP_REGS);
+    env->regs[CR_STATUS] =
+        FIELD_DP32(env->regs[CR_STATUS], CR_STATUS, PRS, prev_set);
+    env->regs[CR_STATUS] =
+        FIELD_DP32(env->regs[CR_STATUS], CR_STATUS, CRS, new_set);
+}
+
+static inline void cpu_set_crs(CPUNios2State *env, uint32_t value)
+{
+    uint32_t crs = cpu_get_crs(env);
+    cpu_change_reg_set(env, crs, value);
+}
+
 #endif /* NIOS2_CPU_H */
diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index a44ecfdf7a..2e400b1f12 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -18,6 +18,7 @@
  * <http://www.gnu.org/licenses/lgpl-2.1.html>
  */
 
+DEF_HELPER_2(eret, void, env, i32)
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index caa885f7b4..c8ce399332 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -30,3 +30,21 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
     cs->exception_index = index;
     cpu_loop_exit(cs);
 }
+
+void helper_eret(CPUNios2State *env, uint32_t new_pc)
+{
+    uint32_t crs = cpu_get_crs(env);
+    if (crs == 0) {
+        env->regs[CR_STATUS] = env->regs[CR_ESTATUS];
+    } else {
+        env->regs[CR_STATUS] = env->regs[R_SSTATUS];
+    }
+
+    /*
+     * At this point CRS was updated by the above assignment to CR_STATUS.
+     * Therefore we need to retrieve the new value of CRS and potentially
+     * switch the register set
+     */
+    cpu_change_reg_set(env, crs, cpu_get_crs(env));
+    env->regs[R_PC] = new_pc;
+}
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 007c17e6e9..f1ac1bf126 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -205,6 +205,34 @@ static void call(DisasContext *dc, uint32_t code, uint32_t flags)
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
+
+    gen_check_supervisor(dc);
+
+    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_ptr p = tcg_temp_new_ptr();
+
+    tcg_gen_extract_i32(t, cpu_R[CR_STATUS],
+                        R_CR_STATUS_PRS_SHIFT,
+                        R_CR_STATUS_PRS_LENGTH);
+    tcg_gen_muli_i32(t, t, sizeof(uint32_t) * NUM_GP_REGS);
+    tcg_gen_ext_i32_ptr(p, t);
+
+    tcg_gen_add_ptr(p, p, cpu_env);
+    tcg_gen_ld_i32(t, p, offsetof(CPUNios2State, shadow_regs)
+                    + sizeof(uint32_t) * instr.a);
+    tcg_gen_addi_i32(cpu_R[instr.b], t, instr.imm16.s);
+
+    tcg_temp_free_ptr(p);
+    tcg_temp_free_i32(t);
+}
+
 /* Load instructions */
 static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
 {
@@ -365,7 +393,7 @@ static const Nios2Instruction i_type_instructions[] = {
     INSTRUCTION_FLG(gen_stx, MO_SL),                  /* stwio */
     INSTRUCTION_FLG(gen_bxx, TCG_COND_LTU),           /* bltu */
     INSTRUCTION_FLG(gen_ldx, MO_UL),                  /* ldwio */
-    INSTRUCTION_UNIMPLEMENTED(),                      /* rdprs */
+    INSTRUCTION(rdprs),                               /* rdprs */
     INSTRUCTION_ILLEGAL(),
     INSTRUCTION_FLG(handle_r_type_instr, 0),          /* R-Type */
     INSTRUCTION_NOP(),                                /* flushd */
@@ -378,16 +406,42 @@ static const Nios2Instruction i_type_instructions[] = {
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
+
+    gen_check_supervisor(dc);
+
+    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_ptr p = tcg_temp_new_ptr();
+
+    tcg_gen_extract_i32(t, cpu_R[CR_STATUS],
+                        R_CR_STATUS_PRS_SHIFT,
+                        R_CR_STATUS_PRS_LENGTH);
+    tcg_gen_muli_i32(t, t, sizeof(uint32_t) * NUM_GP_REGS);
+    tcg_gen_ext_i32_ptr(p, t);
+
+    tcg_gen_add_ptr(p, p, cpu_env);
+    tcg_gen_st_i32(cpu_R[instr.a], p, offsetof(CPUNios2State, shadow_regs)
+                   + sizeof(uint32_t) * instr.c);
+
+    tcg_temp_free_ptr(p);
+    tcg_temp_free_i32(t);
+}
+
 /*
- * status <- estatus
+ * status <- CRS == 0? estatus: sstatus
  * PC <- ea
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     gen_check_supervisor(dc);
 
-    tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
-    tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
+    gen_helper_eret(cpu_env, cpu_R[R_EA]);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
@@ -665,7 +719,7 @@ static const Nios2Instruction r_type_instructions[] = {
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


