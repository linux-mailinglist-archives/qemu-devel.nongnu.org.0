Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227945A592F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 04:14:59 +0200 (CEST)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSqmH-0000yc-MF
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 22:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSqji-00075G-JI
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 22:12:19 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSqjg-0006j8-Ai
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 22:12:18 -0400
Received: by mail-pg1-x532.google.com with SMTP id 69so7718935pgb.13
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 19:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=bwr9dBOinaL2or+Lj6nphL9eLXRKmdjcUZr8milTDoU=;
 b=aHeXngtXN1dHYLjDmKv8Usa9iMzQK85IpNn5FZXE78NS4+P4kRI+S2PBb28EaysECJ
 qq2v99dkkq6XelLvxTa0v8ocbtpKMNY9eYRfw0FeMaHWfDNlGGfMNdmATf0nYcnQmCU/
 w4c8Bk10/IsisCeiakavgg2HobI0ZrFp6HOVVb1dymwW4Hju4b1/rqjYDhGPYkQywjPT
 nCBjquSFNZMTSLk4oSXF4zBh+fOd6WvomRSwVajumr/f6DX5xLfZL3kuF+tFRc2MbpWI
 LGQrCj+UQ3R+ICInbYUCTPu3zQD++9eDs3VVZuPrOeHgWU7whiqYEzlf8RyLOS2jsWl5
 83Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=bwr9dBOinaL2or+Lj6nphL9eLXRKmdjcUZr8milTDoU=;
 b=S2kKlu6iBZ9fECUWCslU7HyM7UsQz2buSnAyXUzeBnm67OLFhcI7sC8DCtQgTlq4Fh
 7ZIg8nuOcRBPN3sSdWGsxun45vGMMbk9lQPzGU1ABNRx1PD1y6LYnO9NJ584KDTjctil
 2QNwokJ8euAs1cu6y5djDkFttXITxKXqNkbWS44l8xjQZGOSaH4fz/pHrVMKZ/Domzfj
 Z++lgOJxgAt/r4cwZSrrbpMmiLaF6tHeCok2bWYhlxo5y3Qn7dEkqhLwZwdExsczJ2SX
 06Pil3AGWbsMBiVM5tOucSWxvmfOtGWmmk/I78eGI0yShqCqwY1J9Ikif5Lc8eJuN2h8
 KeKw==
X-Gm-Message-State: ACgBeo0sd/EHA4XF/IkNm59dPy8FZmQZVPl56y7u/SAJQ2/lbqjgtc/o
 4Nj3YROKxiFpFQPCkdpMbsHo7cMaydDIHQ==
X-Google-Smtp-Source: AA6agR79qFsje6BBPi1zJg7k4uEIm5TwiNEW6TTE8WBwwmkzlI85eHei69vMBYZPOEIHnsJtBFFxcQ==
X-Received: by 2002:a63:6c87:0:b0:42c:1f36:4691 with SMTP id
 h129-20020a636c87000000b0042c1f364691mr6347906pgc.571.1661825534472; 
 Mon, 29 Aug 2022 19:12:14 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-17-78.hsd1.ca.comcast.net.
 [98.35.17.78]) by smtp.gmail.com with ESMTPSA id
 d11-20020a62f80b000000b0053624c50d74sm7935656pfh.126.2022.08.29.19.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 19:12:13 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH v2 1/1] target/i386: Raise #GP on unaligned m128 accesses when
 required.
Date: Mon, 29 Aug 2022 19:11:52 -0700
Message-Id: <20220830021152.40618-2-ricky@rzhou.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830021152.40618-1-ricky@rzhou.org>
References: <20220830021152.40618-1-ricky@rzhou.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many instructions which load/store 128-bit values are supposed to
raise #GP when the memory operand isn't 16-byte aligned. This includes:
 - Instructions explicitly requiring memory alignment (Exceptions Type 1
   in the "AVX and SSE Instruction Exception Specification" section of
   the SDM)
 - Legacy SSE instructions that load/store 128-bit values (Exceptions
   Types 2 and 4).

This change sets MO_ALIGN_16 on 128-bit memory accesses that require
16-byte alignment. It adds cpu_record_sigbus and cpu_do_unaligned_access
handlers that simulate a #GP exception in qemu-user and qemu-system,
respectively.

One minor behavior change apart from what is described above: Prior to
this change, emulation of cvttps2pi and cvtps2pi instructions would
incorrectly read 16 bytes of memory instead of 8. I double-checked on
real hardware that these instructions only read 8 bytes (and do not have
any address alignment requirements).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/217
Signed-off-by: Ricky Zhou <ricky@rzhou.org>
---
 target/i386/tcg/excp_helper.c        | 13 ++++++++
 target/i386/tcg/helper-tcg.h         | 28 +++++++++-------
 target/i386/tcg/sysemu/excp_helper.c |  8 +++++
 target/i386/tcg/tcg-cpu.c            |  2 ++
 target/i386/tcg/translate.c          | 49 ++++++++++++++++++----------
 target/i386/tcg/user/excp_helper.c   |  7 ++++
 6 files changed, 78 insertions(+), 29 deletions(-)

diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index c1ffa1c0ef..7c3c8dc7fe 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -140,3 +140,16 @@ G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
+
+G_NORETURN void handle_unaligned_access(CPUX86State *env, vaddr vaddr,
+                                        MMUAccessType access_type,
+                                        uintptr_t retaddr)
+{
+    /*
+     * Unaligned accesses are currently only triggered by SSE/AVX
+     * instructions that impose alignment requirements on memory
+     * operands. These instructions raise #GP(0) upon accessing an
+     * unaligned address.
+     */
+    raise_exception_ra(env, EXCP0D_GPF, retaddr);
+}
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 34167e2e29..cd1723389a 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -42,17 +42,6 @@ void x86_cpu_do_interrupt(CPUState *cpu);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 #endif
 
-/* helper.c */
-#ifdef CONFIG_USER_ONLY
-void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
-                            MMUAccessType access_type,
-                            bool maperr, uintptr_t ra);
-#else
-bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr);
-#endif
-
 void breakpoint_handler(CPUState *cs);
 
 /* n must be a constant to be efficient */
@@ -78,6 +67,23 @@ G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_index,
                                        int error_code, uintptr_t retaddr);
 G_NORETURN void raise_interrupt(CPUX86State *nenv, int intno, int is_int,
                                 int error_code, int next_eip_addend);
+G_NORETURN void handle_unaligned_access(CPUX86State *env, vaddr vaddr,
+                                        MMUAccessType access_type,
+                                        uintptr_t retaddr);
+#ifdef CONFIG_USER_ONLY
+void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                            MMUAccessType access_type,
+                            bool maperr, uintptr_t ra);
+void x86_cpu_record_sigbus(CPUState *cs, vaddr addr,
+                           MMUAccessType access_type, uintptr_t ra);
+#else
+bool x86_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+G_NORETURN void x86_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, uintptr_t retaddr);
+#endif
 
 /* cc_helper.c */
 extern const uint8_t parity_table[256];
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 48feba7e75..796dc2a1f3 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -439,3 +439,11 @@ bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     }
     return true;
 }
+
+G_NORETURN void x86_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, uintptr_t retaddr)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    handle_unaligned_access(&cpu->env, vaddr, access_type, retaddr);
+}
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6fdfdf9598..d3c2b8fb49 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -75,10 +75,12 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
     .record_sigsegv = x86_cpu_record_sigsegv,
+    .record_sigbus = x86_cpu_record_sigbus,
 #else
     .tlb_fill = x86_cpu_tlb_fill,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
+    .do_unaligned_access = x86_cpu_do_unaligned_access,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..a98bcfca8f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2731,21 +2731,23 @@ static inline void gen_stq_env_A0(DisasContext *s, int offset)
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEUQ);
 }
 
-static inline void gen_ldo_env_A0(DisasContext *s, int offset)
+static inline void gen_ldo_env_A0(DisasContext *s, int offset, bool align)
 {
     int mem_index = s->mem_index;
-    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
+    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, mem_index,
+                        MO_LEUQ | (align ? MO_ALIGN_16 : 0));
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
     tcg_gen_addi_tl(s->tmp0, s->A0, 8);
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
     tcg_gen_st_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
 }
 
-static inline void gen_sto_env_A0(DisasContext *s, int offset)
+static inline void gen_sto_env_A0(DisasContext *s, int offset, bool align)
 {
     int mem_index = s->mem_index;
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(0)));
-    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index, MO_LEUQ);
+    tcg_gen_qemu_st_i64(s->tmp1_i64, s->A0, mem_index,
+                        MO_LEUQ | (align ? MO_ALIGN_16 : 0));
     tcg_gen_addi_tl(s->tmp0, s->A0, 8);
     tcg_gen_ld_i64(s->tmp1_i64, cpu_env, offset + offsetof(ZMMReg, ZMM_Q(1)));
     tcg_gen_qemu_st_i64(s->tmp1_i64, s->tmp0, mem_index, MO_LEUQ);
@@ -3054,7 +3056,7 @@ static const struct SSEOpHelper_epp sse_op_table6[256] = {
     [0x25] = SSE41_OP(pmovsxdq),
     [0x28] = SSE41_OP(pmuldq),
     [0x29] = SSE41_OP(pcmpeqq),
-    [0x2a] = SSE41_SPECIAL, /* movntqda */
+    [0x2a] = SSE41_SPECIAL, /* movntdqa */
     [0x2b] = SSE41_OP(packusdw),
     [0x30] = SSE41_OP(pmovzxbw),
     [0x31] = SSE41_OP(pmovzxbd),
@@ -3194,17 +3196,17 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x1e7: /* movntdq */
         case 0x02b: /* movntps */
-        case 0x12b: /* movntps */
+        case 0x12b: /* movntpd */
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]), true);
             break;
         case 0x3f0: /* lddqu */
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
-            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+            gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]), false);
             break;
         case 0x22b: /* movntss */
         case 0x32b: /* movntsd */
@@ -3273,7 +3275,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x26f: /* movdqu xmm, ea */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
+                               /* movaps, movapd, movdqa */
+                               b == 0x028 || b == 0x128 || b == 0x16f);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movo(s, offsetof(CPUX86State, xmm_regs[reg]),
@@ -3331,7 +3335,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
+                               !(s->prefix & PREFIX_VEX));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(0)),
@@ -3373,7 +3378,8 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
+                               !(s->prefix & PREFIX_VEX));
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movl(s, offsetof(CPUX86State, xmm_regs[reg].ZMM_L(1)),
@@ -3465,7 +3471,9 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x27f: /* movdqu ea, xmm */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
-                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
+                gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]),
+                               /* movaps, movapd, movdqa */
+                               b == 0x029 || b == 0x129 || b == 0x17f);
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 gen_op_movo(s, offsetof(CPUX86State, xmm_regs[rm]),
@@ -3621,7 +3629,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 op2_offset = offsetof(CPUX86State,xmm_t0);
-                gen_ldo_env_A0(s, op2_offset);
+                if ((b >> 8) & 1) {
+                    gen_ldo_env_A0(s, op2_offset, true);
+                } else {
+                    gen_ldq_env_A0(s, op2_offset);
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
@@ -3806,11 +3818,12 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
                                         offsetof(ZMMReg, ZMM_W(0)));
                         break;
-                    case 0x2a:            /* movntqda */
-                        gen_ldo_env_A0(s, op1_offset);
+                    case 0x2a:            /* movntdqa */
+                        gen_ldo_env_A0(s, op1_offset, true);
                         return;
                     default:
-                        gen_ldo_env_A0(s, op2_offset);
+                        gen_ldo_env_A0(s, op2_offset,
+                                       !(s->prefix & PREFIX_VEX));
                     }
                 }
             } else {
@@ -4351,7 +4364,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
-                    gen_ldo_env_A0(s, op2_offset);
+                    gen_ldo_env_A0(s, op2_offset, !(s->prefix & PREFIX_VEX));
                 }
             } else {
                 op1_offset = offsetof(CPUX86State,fpregs[reg].mmx);
@@ -4469,7 +4482,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     break;
                 default:
                     /* 128 bit access */
-                    gen_ldo_env_A0(s, op2_offset);
+                    gen_ldo_env_A0(s, op2_offset, !(s->prefix & PREFIX_VEX));
                     break;
                 }
             } else {
diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
index cd507e2a1b..b3bdb7831a 100644
--- a/target/i386/tcg/user/excp_helper.c
+++ b/target/i386/tcg/user/excp_helper.c
@@ -48,3 +48,10 @@ void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
 
     cpu_loop_exit_restore(cs, ra);
 }
+
+void x86_cpu_record_sigbus(CPUState *cs, vaddr addr,
+                           MMUAccessType access_type, uintptr_t ra)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    handle_unaligned_access(&cpu->env, addr, access_type, ra);
+}
-- 
2.37.2


