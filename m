Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB32F8E9D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 19:15:48 +0100 (CET)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0q6z-0006s8-Up
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 13:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0q4t-0005uG-1a
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 13:13:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0q4q-0006r6-SN
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 13:13:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 6so5194147wri.3
 for <qemu-devel@nongnu.org>; Sat, 16 Jan 2021 10:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5hkYxRzzzf/lZUMcVCjwrAkxVlbeEGk3O/gOAw0Gz6o=;
 b=b3wjStiRsgqSqKFj0IMMaqxaQzbjei8/nu4MH7Sy4OUTdGr452m58cZfTD+eFv+Nob
 W+1eZG5TLVHh/2pc+I//aMFDjabBEvQmoOrcawQ9ZoKE5Cy+gV80F7kQTTNi9q1nHqvb
 ehQweQa0za52TyLq1WnEm4qCrxQBqhPPfzda9Szp91/GHBgPwy2+soEjsf78LVj0IBnP
 0UvZAcVcr/N8NVS3GdPRAuHHNGUHfjGnyCh875To8d8MB1IeUGXayDTOZDXeo18DT1OC
 oPdfG59WAc3jqMFPfVuAz4PN4DorBJCDuZbFfx+ZABzx2HcyavlmLCs7EWUZlBZX9yi0
 agCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5hkYxRzzzf/lZUMcVCjwrAkxVlbeEGk3O/gOAw0Gz6o=;
 b=mc+zek8fQo/sJ9+UTNyfMDUKupBTcWCeRAEwHS7IUDvwLgpXAfH7o1ZlFvrxk746Jj
 NjCCOG1/ptiAymgAS1atI5AwfyuA2YiIXFN10Dme6G3W5hwJuMA0n8d23/MqWtEGXhEA
 tgYiOjMyjECsJCgt/fOeV+N3vsZHfItLWeid4KVpufVudmwA+ZDVpQSZQbpTEBNpODeX
 RmLUvkoiAzZFy9Rghx5p4lfShDEYbCEbI7tHs6DWr+2yWc7tQ2N1V/N7+nbDY/Ih7fMQ
 SVFKzQbJp/GEEf6RD2v5I4mA5RCw5tSk0KUdlfk0N7778wUKSPDmbq3lSM8yf9/Yd+Gq
 WJZw==
X-Gm-Message-State: AOAM531A0kHas4YQAFXLpJn0qQNGg0Cqk/BxaVVA1yuydmWX1KSs2YWg
 bfNgx++ACxWnxxnR6t/tTjPEy/7x6+0=
X-Google-Smtp-Source: ABdhPJzxlsLx5h9vqp6irAi19uwBCmK2JxzxeitnOdl+hSVC6qINfxzAs6L0iJ9A4XPqqQMb7BIyyg==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr19020864wrq.19.1610820811017; 
 Sat, 16 Jan 2021 10:13:31 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t16sm17315602wmi.3.2021.01.16.10.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 10:13:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: fetch code with translator_ld
Date: Sat, 16 Jan 2021 19:13:28 +0100
Message-Id: <20210116181328.3890849-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commits ae82adc8e29..7f93879e444, use the
translator_ld*() API introduced in commit 409c1a0bf0f
to fetch the code on the MIPS target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tlb_helper.c | 16 ++++++++--------
 target/mips/translate.c  | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 082c17928d3..f855453ca4d 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
 
@@ -526,9 +526,9 @@ static bool get_pte(CPUMIPSState *env, uint64_t vaddr, int entry_size,
         return false;
     }
     if (entry_size == 64) {
-        *pte = cpu_ldq_code(env, vaddr);
+        *pte = translator_ldq(env, vaddr);
     } else {
-        *pte = cpu_ldl_code(env, vaddr);
+        *pte = translator_ldl(env, vaddr);
     }
     return true;
 }
@@ -941,14 +941,14 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
 {
     if (env->insn_flags & ISA_NANOMIPS32) {
         if (env->CP0_Config3 & (1 << CP0C3_BI)) {
-            uint32_t instr = (cpu_lduw_code(env, env->active_tc.PC)) << 16;
+            uint32_t instr = (translator_lduw(env, env->active_tc.PC)) << 16;
             if ((instr & 0x10000000) == 0) {
-                instr |= cpu_lduw_code(env, env->active_tc.PC + 2);
+                instr |= translator_lduw(env, env->active_tc.PC + 2);
             }
             env->CP0_BadInstr = instr;
 
             if ((instr & 0xFC000000) == 0x60000000) {
-                instr = cpu_lduw_code(env, env->active_tc.PC + 4) << 16;
+                instr = translator_lduw(env, env->active_tc.PC + 4) << 16;
                 env->CP0_BadInstrX = instr;
             }
         }
@@ -960,11 +960,11 @@ static inline void set_badinstr_registers(CPUMIPSState *env)
         return;
     }
     if (env->CP0_Config3 & (1 << CP0C3_BI)) {
-        env->CP0_BadInstr = cpu_ldl_code(env, env->active_tc.PC);
+        env->CP0_BadInstr = translator_ldl(env, env->active_tc.PC);
     }
     if ((env->CP0_Config3 & (1 << CP0C3_BP)) &&
         (env->hflags & MIPS_HFLAG_BMASK)) {
-        env->CP0_BadInstrP = cpu_ldl_code(env, env->active_tc.PC - 4);
+        env->CP0_BadInstrP = translator_ldl(env, env->active_tc.PC - 4);
     }
 }
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a5cf1742a8b..a6e835809aa 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -26,7 +26,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "tcg/tcg-op.h"
-#include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "hw/semihosting/semihost.h"
@@ -13911,7 +13911,7 @@ static void decode_i64_mips16(DisasContext *ctx,
 
 static int decode_extended_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
 {
-    int extend = cpu_lduw_code(env, ctx->base.pc_next + 2);
+    int extend = translator_lduw(env, ctx->base.pc_next + 2);
     int op, rx, ry, funct, sa;
     int16_t imm, offset;
 
@@ -14161,7 +14161,7 @@ static int decode_mips16_opc(CPUMIPSState *env, DisasContext *ctx)
         /* No delay slot, so just process as a normal instruction */
         break;
     case M16_OPC_JAL:
-        offset = cpu_lduw_code(env, ctx->base.pc_next + 2);
+        offset = translator_lduw(env, ctx->base.pc_next + 2);
         offset = (((ctx->opcode & 0x1f) << 21)
                   | ((ctx->opcode >> 5) & 0x1f) << 16
                   | offset) << 2;
@@ -16295,7 +16295,7 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
     uint32_t op, minor, minor2, mips32_op;
     uint32_t cond, fmt, cc;
 
-    insn = cpu_lduw_code(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = (ctx->opcode >> 21) & 0x1f;
@@ -21350,7 +21350,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
     int offset;
     int imm;
 
-    insn = cpu_lduw_code(env, ctx->base.pc_next + 2);
+    insn = translator_lduw(env, ctx->base.pc_next + 2);
     ctx->opcode = (ctx->opcode << 16) | insn;
 
     rt = extract32(ctx->opcode, 21, 5);
@@ -21469,7 +21469,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     case NM_P48I:
         {
-            insn = cpu_lduw_code(env, ctx->base.pc_next + 4);
+            insn = translator_lduw(env, ctx->base.pc_next + 4);
             target_long addr_off = extract32(ctx->opcode, 0, 16) | insn << 16;
             switch (extract32(ctx->opcode, 16, 5)) {
             case NM_LI48:
@@ -29087,17 +29087,17 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
     if (ctx->insn_flags & ISA_NANOMIPS32) {
-        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
         insn_bytes = decode_nanomips_opc(env, ctx);
     } else if (!(ctx->hflags & MIPS_HFLAG_M16)) {
-        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_ldl(env, ctx->base.pc_next);
         insn_bytes = 4;
         decode_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MICROMIPS) {
-        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
         insn_bytes = decode_micromips_opc(env, ctx);
     } else if (ctx->insn_flags & ASE_MIPS16) {
-        ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+        ctx->opcode = translator_lduw(env, ctx->base.pc_next);
         insn_bytes = decode_mips16_opc(env, ctx);
     } else {
         gen_reserved_instruction(ctx);
-- 
2.26.2


