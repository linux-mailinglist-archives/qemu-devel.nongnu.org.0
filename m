Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB79257EC8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 18:30:09 +0200 (CEST)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCmh6-0002yX-2S
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 12:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCmLF-0006IQ-Al
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 12:07:33 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCmLD-00068x-Ap
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 12:07:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id mw10so28796pjb.2
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GSPxh4SxANPQrDwWc1e6Tl2jupR+kuvykZRFnQlRio0=;
 b=ApfKIbC46H8iYRd5MhO8HDuWyGgczRwsBMRYc/SWai7Hh4kfVJk5bGA0e98sOKy/ac
 hDQGRX3I0Sr8mW/qLOEY/c9xyyqw+4bD8JwGkiPOYPOgJpHpMCgcYmT/myvjv253DDlJ
 JZCfG+UHBDDXvBE4bZJBTGm+xpsVjIBxDrq7w84DXad3rTAiW5muENOq88M/9f8b23qN
 wZn+OWR3Ig9p1ailZMVsIOwE9saEm5HJiiOkpFMYn44ZdOGjKhYFVtcJ4HWQ864atwq5
 bxHVW05KuvPiXESWnKY83UHdBpQA86n/WKZJhDiSvKN4q6W/lQHTjbklX8KNKTPMW0oD
 1evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSPxh4SxANPQrDwWc1e6Tl2jupR+kuvykZRFnQlRio0=;
 b=hZ7AzaPya6pMBY+uR7RumT47bFi2Ykix5eWm7QmGhFSTCDLra17W2uQrXRFDMR++Tp
 3HlgSy/ndGt1QGjRtg8AIp7f9WURNmPNW481TDmwNpqyCA2wbddZaVlHW73uASXYkH43
 H1rG/9VNDiq/jZZoDO4Vyl2iI5iqY4kCbm+OVN6leVZPAYXQquogHAfWNOWkWpTrgIPQ
 dWB7ZXxqrkLxV/fnRyWzq13r5Zxkvo5MECk0mWQdETG8zdry8j2qDe+j8JkrLXNHBDUm
 UvBEyrU1zC3uamUIueAw63PQKW5mRETcCt3kaqfk7hf/QHPrCCfAyllBgpOZOX/A+H34
 e6lA==
X-Gm-Message-State: AOAM531jCTr46S3OcBdDazyc+85wAqHDx1mJRatg1iNW2ZuW+jJivhaV
 +AhY+sIA5NIuGnv/qBQijlZL+T3ZTypcRQ==
X-Google-Smtp-Source: ABdhPJzqg49XV2wXTIcjRSz5UCQMK0J2du2yuwwErRPcpopVNzdNnHXLwt7vistgA48T0GTSyQ7g6A==
X-Received: by 2002:a17:902:6901:: with SMTP id
 j1mr1591538plk.324.1598890049125; 
 Mon, 31 Aug 2020 09:07:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gt13sm17218pjb.43.2020.08.31.09.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 09:07:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 63/76] target/microblaze: Convert brk and brki to decodetree
Date: Mon, 31 Aug 2020 09:05:48 -0700
Message-Id: <20200831160601.833692-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831160601.833692-1-richard.henderson@linaro.org>
References: <20200831160601.833692-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split these out of the normal branch instructions, as they require
special handling.  Perform the entire operation inline, instead of
raising EXCP_BREAK to do the work in mb_cpu_do_interrupt.

This fixes a bug in that brki rd, imm, for imm != 0x18 is not
supposed to set MSR_BIP.  This fixes a bug in that imm == 0 is
the reset vector and 0x18 is the debug vector, and neither should
raise a tcg exception in system mode.

Introduce EXCP_SYSCALL for microblaze-linux-user.

Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h          |   2 +-
 target/microblaze/insns.decode   |  11 ++++
 linux-user/microblaze/cpu_loop.c |   2 +-
 target/microblaze/helper.c       |  10 +--
 target/microblaze/translate.c    | 107 ++++++++++++++++++-------------
 5 files changed, 79 insertions(+), 53 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index 63b8d93d41..1528749a0b 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -31,7 +31,7 @@ typedef struct CPUMBState CPUMBState;
 
 #define EXCP_MMU        1
 #define EXCP_IRQ        2
-#define EXCP_BREAK      3
+#define EXCP_SYSCALL    3  /* user-only */
 #define EXCP_HW_BREAK   4
 #define EXCP_HW_EXCP    5
 
diff --git a/target/microblaze/insns.decode b/target/microblaze/insns.decode
index 47b92b9cbc..9273a51d20 100644
--- a/target/microblaze/insns.decode
+++ b/target/microblaze/insns.decode
@@ -19,7 +19,9 @@
 
 &typea0         rd ra
 &typea          rd ra rb
+&typea_br       rd rb
 &typeb          rd ra imm
+&typeb_br       rd imm
 
 # Include any IMM prefix in the value reported.
 %extimm         0:s16 !function=typeb_imm
@@ -30,9 +32,15 @@
 # Officially typea, but with rb==0, which is not used.
 @typea0         ...... rd:5 ra:5 ................       &typea0
 
+# Officially typea, but with ra as opcode.
+@typea_br       ...... rd:5 ..... rb:5 ...........      &typea_br
+
 # Officially typeb, but any immediate extension is unused.
 @typeb_bs       ...... rd:5 ra:5 ..... ...... imm:5     &typeb
 
+# Officially typeb, but with ra as opcode.
+@typeb_br       ...... rd:5 ..... ................      &typeb_br imm=%extimm
+
 # For convenience, extract the two imm_w/imm_s fields, then pack
 # them back together as "imm".  Doing this makes it easiest to
 # match the required zero at bit 5.
@@ -60,6 +68,9 @@ andi            101001 ..... ..... ................     @typeb
 andn            100011 ..... ..... ..... 000 0000 0000  @typea
 andni           101011 ..... ..... ................     @typeb
 
+brk             100110 ..... 01100 ..... 000 0000 0000  @typea_br
+brki            101110 ..... 01100 ................     @typeb_br
+
 bsrl            010001 ..... ..... ..... 000 0000 0000  @typea
 bsra            010001 ..... ..... ..... 010 0000 0000  @typea
 bsll            010001 ..... ..... ..... 100 0000 0000  @typea
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 3de99ea311..c3396a6e09 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -48,7 +48,7 @@ void cpu_loop(CPUMBState *env)
         case EXCP_INTERRUPT:
           /* just indicate that signals should be handled asap */
           break;
-        case EXCP_BREAK:
+        case EXCP_SYSCALL:
             /* Return address is 4 bytes after the call.  */
             env->regs[14] += 4;
             env->pc = env->regs[14];
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 0e3be251a7..1667822fb7 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -230,7 +230,6 @@ void mb_cpu_do_interrupt(CPUState *cs)
             //log_cpu_state_mask(CPU_LOG_INT, cs, 0);
             break;
 
-        case EXCP_BREAK:
         case EXCP_HW_BREAK:
             assert(!(env->iflags & IMM_FLAG));
             assert(!(env->iflags & D_FLAG));
@@ -242,13 +241,8 @@ void mb_cpu_do_interrupt(CPUState *cs)
             msr &= ~(MSR_VMS | MSR_UMS | MSR_VM | MSR_UM);
             msr |= t;
             msr |= MSR_BIP;
-            if (cs->exception_index == EXCP_HW_BREAK) {
-                env->regs[16] = env->pc;
-                msr |= MSR_BIP;
-                env->pc = cpu->cfg.base_vectors + 0x18;
-            } else {
-                env->pc = env->btarget;
-            }
+            env->regs[16] = env->pc;
+            env->pc = cpu->cfg.base_vectors + 0x18;
             mb_cpu_write_msr(env, msr);
             break;
         default:
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 3b63fd79e5..1c772b95d9 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1068,6 +1068,65 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
     return true;
 }
 
+static bool trans_brk(DisasContext *dc, arg_typea_br *arg)
+{
+    if (trap_userspace(dc, true)) {
+        return true;
+    }
+    tcg_gen_mov_i32(cpu_pc, reg_for_read(dc, arg->rb));
+    if (arg->rd) {
+        tcg_gen_movi_i32(cpu_R[arg->rd], dc->base.pc_next);
+    }
+    tcg_gen_ori_i32(cpu_msr, cpu_msr, MSR_BIP);
+    tcg_gen_movi_tl(cpu_res_addr, -1);
+
+    dc->base.is_jmp = DISAS_UPDATE;
+    return true;
+}
+
+static bool trans_brki(DisasContext *dc, arg_typeb_br *arg)
+{
+    uint32_t imm = arg->imm;
+
+    if (trap_userspace(dc, imm != 0x8 && imm != 0x18)) {
+        return true;
+    }
+    tcg_gen_movi_i32(cpu_pc, imm);
+    if (arg->rd) {
+        tcg_gen_movi_i32(cpu_R[arg->rd], dc->base.pc_next);
+    }
+    tcg_gen_movi_tl(cpu_res_addr, -1);
+
+#ifdef CONFIG_USER_ONLY
+    switch (imm) {
+    case 0x8:  /* syscall trap */
+        gen_raise_exception_sync(dc, EXCP_SYSCALL);
+        break;
+    case 0x18: /* debug trap */
+        gen_raise_exception_sync(dc, EXCP_DEBUG);
+        break;
+    default:   /* eliminated with trap_userspace check */
+        g_assert_not_reached();
+    }
+#else
+    uint32_t msr_to_set = 0;
+
+    if (imm != 0x18) {
+        msr_to_set |= MSR_BIP;
+    }
+    if (imm == 0x8 || imm == 0x18) {
+        /* MSR_UM and MSR_VM are in tb_flags, so we know their value. */
+        msr_to_set |= (dc->tb_flags & (MSR_UM | MSR_VM)) << 1;
+        tcg_gen_andi_i32(cpu_msr, cpu_msr,
+                         ~(MSR_VMS | MSR_UMS | MSR_VM | MSR_UM));
+    }
+    tcg_gen_ori_i32(cpu_msr, cpu_msr, msr_to_set);
+    dc->base.is_jmp = DISAS_UPDATE;
+#endif
+
+    return true;
+}
+
 static bool trans_zero(DisasContext *dc, arg_zero *arg)
 {
     /* If opcode_0_illegal, trap.  */
@@ -1359,6 +1418,7 @@ static void dec_bcc(DisasContext *dc)
 static void dec_br(DisasContext *dc)
 {
     unsigned int dslot, link, abs, mbar;
+    uint32_t add_pc;
 
     dslot = dc->ir & (1 << 20);
     abs = dc->ir & (1 << 19);
@@ -1401,21 +1461,6 @@ static void dec_br(DisasContext *dc)
         return;
     }
 
-    if (abs && link && !dslot) {
-        if (dc->type_b) {
-            /* BRKI */
-            uint32_t imm = dec_alu_typeb_imm(dc);
-            if (trap_userspace(dc, imm != 8 && imm != 0x18)) {
-                return;
-            }
-        } else {
-            /* BRK */
-            if (trap_userspace(dc, true)) {
-                return;
-            }
-        }
-    }
-
     if (dslot) {
         dec_setup_dslot(dc);
     }
@@ -1423,38 +1468,14 @@ static void dec_br(DisasContext *dc)
         tcg_gen_movi_i32(cpu_R[dc->rd], dc->base.pc_next);
     }
 
-    if (abs) {
-        if (dc->type_b) {
-            uint32_t dest = dec_alu_typeb_imm(dc);
-
-            dc->jmp = JMP_DIRECT;
-            dc->jmp_pc = dest;
-            tcg_gen_movi_i32(cpu_btarget, dest);
-            if (link && !dslot) {
-                switch (dest) {
-                case 8:
-                case 0x18:
-                    gen_raise_exception_sync(dc, EXCP_BREAK);
-                    break;
-                case 0:
-                    gen_raise_exception_sync(dc, EXCP_DEBUG);
-                    break;
-                }
-            }
-        } else {
-            dc->jmp = JMP_INDIRECT;
-            tcg_gen_mov_i32(cpu_btarget, cpu_R[dc->rb]);
-            if (link && !dslot) {
-                gen_raise_exception_sync(dc, EXCP_BREAK);
-            }
-        }
-    } else if (dc->type_b) {
+    add_pc = abs ? 0 : dc->base.pc_next;
+    if (dc->type_b) {
         dc->jmp = JMP_DIRECT;
-        dc->jmp_pc = dc->base.pc_next + dec_alu_typeb_imm(dc);
+        dc->jmp_pc = add_pc + dec_alu_typeb_imm(dc);
         tcg_gen_movi_i32(cpu_btarget, dc->jmp_pc);
     } else {
         dc->jmp = JMP_INDIRECT;
-        tcg_gen_addi_i32(cpu_btarget, cpu_R[dc->rb], dc->base.pc_next);
+        tcg_gen_addi_i32(cpu_btarget, cpu_R[dc->rb], add_pc);
     }
     tcg_gen_movi_i32(cpu_btaken, 1);
 }
-- 
2.25.1


