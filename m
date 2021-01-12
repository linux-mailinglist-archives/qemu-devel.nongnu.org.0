Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6972F3739
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:36:10 +0100 (CET)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNaT-0001Sz-JA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGD-0003lY-17
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:13 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNGB-0004xv-C3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:12 -0500
Received: by mail-ed1-x532.google.com with SMTP id c7so3166764edv.6
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwA+TACbQ/QW8O88P6jb/sTv8Tyep9/B+Ty5k9RTfxI=;
 b=iM/dZt2DsdKTdnGQ+Px1g4VjcTHTtmNF1+qZTCDpKIbjHlV0bFBHd+NUwt2ruY00I6
 Pp/QEA5OVEqojuAuZEBF1pHaAuWVhaBd4+YJ4RP6Mq22jMns9bSCnB9lo8agM9h4Pntq
 +qPtcjIr+kd0ixZUOIgudxPTffCCRe2NvwiUrPprM6pxAHuIMNkuVnGZeb3rjMCwQFOj
 H0Uc2c8BaP1UF4Om7wvsJqTLyOI697KBWPtz20BbWukWFYN8ffv80E54ojXy53ibcsMG
 V0gPdIkp1L6CrwdIhQ7rSZH4AOWyQh1e9UI7oBCbUb8Crrb3zy+UdgEP0n401Tg0FP9g
 zniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QwA+TACbQ/QW8O88P6jb/sTv8Tyep9/B+Ty5k9RTfxI=;
 b=BdNYOaz5NxurrljDQKYNJCIMiYBGCJVNWmlxfe5mkAxWvhVSck+sR+ubKnPdGkacEe
 kwVEgllCzn/Pd3grHqv7vC4qLpdwFAZ945bLjo98koSM1+7yqM6bbfrjh1wbv8tZCRWl
 f6nz3PczIsWOlAC2+TPaZ7T0x9BfrZ07y0fR81yAIU8FUXfMgA/swxcoO+IiqvsXR9q5
 Tj9l1yH4qb0rsZMXwIZHoYhl+hjOuuZa6PATQVQGVHPLy/JBFtOoyw2eYjtpbaI3ieVi
 +TVLAuV6600hAOXYiem1UtGNpblsBO2IONIh2kYEPLU3P9zSkXATIhJr+2qtcATAMl/U
 MuCQ==
X-Gm-Message-State: AOAM531RY7Pwgr+CWJAAnsxalneDRHxm8n5TeMGSRyKbXXo5k0lDe7ME
 VpoFhSH5ptD5Ri3tiInUYLDA9h26UoPe8w==
X-Google-Smtp-Source: ABdhPJyvvGg0Nzri5CDF95PoNFZO8hIFOUV/5HiPIAV5+INiMBli/tp9vVqXdT+rLAH2rsbZsI8VEg==
X-Received: by 2002:aa7:c403:: with SMTP id j3mr109671edq.217.1610471710154;
 Tue, 12 Jan 2021 09:15:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] target/i386: Use X86Seg enum for segment registers
Date: Tue, 12 Jan 2021 18:14:50 +0100
Message-Id: <20210112171450.791427-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Use the dedicated X86Seg enum type for segment registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210109233427.749748-1-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h            | 4 ++--
 target/i386/gdbstub.c        | 2 +-
 target/i386/tcg/seg_helper.c | 8 ++++----
 target/i386/tcg/translate.c  | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index af130512e2..d23a5b340a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1807,7 +1807,7 @@ void cpu_sync_bndcs_hflags(CPUX86State *env);
 /* this function must always be used to load data in the segment
    cache: it synchronizes the hflags with the segment cache values */
 static inline void cpu_x86_load_seg_cache(CPUX86State *env,
-                                          int seg_reg, unsigned int selector,
+                                          X86Seg seg_reg, unsigned int selector,
                                           target_ulong base,
                                           unsigned int limit,
                                           unsigned int flags)
@@ -1896,7 +1896,7 @@ int cpu_x86_get_descr_debug(CPUX86State *env, unsigned int selector,
 /* cpu-exec.c */
 /* the following helpers are only usable in user mode simulation as
    they can trigger unexpected exceptions */
-void cpu_x86_load_seg(CPUX86State *s, int seg_reg, int selector);
+void cpu_x86_load_seg(CPUX86State *s, X86Seg seg_reg, int selector);
 void cpu_x86_fsave(CPUX86State *s, target_ulong ptr, int data32);
 void cpu_x86_frstor(CPUX86State *s, target_ulong ptr, int data32);
 void cpu_x86_fxsave(CPUX86State *s, target_ulong ptr);
diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index 4a3de5f69d..41e265fc67 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -232,7 +232,7 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     return 0;
 }
 
-static int x86_cpu_gdb_load_seg(X86CPU *cpu, int sreg, uint8_t *mem_buf)
+static int x86_cpu_gdb_load_seg(X86CPU *cpu, X86Seg sreg, uint8_t *mem_buf)
 {
     CPUX86State *env = &cpu->env;
     uint16_t selector = ldl_p(mem_buf);
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 5f2ee6aa7e..180d47f0e9 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -176,8 +176,8 @@ static inline void get_ss_esp_from_tss(CPUX86State *env, uint32_t *ss_ptr,
     }
 }
 
-static void tss_load_seg(CPUX86State *env, int seg_reg, int selector, int cpl,
-                         uintptr_t retaddr)
+static void tss_load_seg(CPUX86State *env, X86Seg seg_reg, int selector,
+                         int cpl, uintptr_t retaddr)
 {
     uint32_t e1, e2;
     int rpl, dpl;
@@ -2098,7 +2098,7 @@ void helper_iret_real(CPUX86State *env, int shift)
     env->hflags2 &= ~HF2_NMI_MASK;
 }
 
-static inline void validate_seg(CPUX86State *env, int seg_reg, int cpl)
+static inline void validate_seg(CPUX86State *env, X86Seg seg_reg, int cpl)
 {
     int dpl;
     uint32_t e2;
@@ -2623,7 +2623,7 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
 }
 
 #if defined(CONFIG_USER_ONLY)
-void cpu_x86_load_seg(CPUX86State *env, int seg_reg, int selector)
+void cpu_x86_load_seg(CPUX86State *env, X86Seg seg_reg, int selector)
 {
     if (!(env->cr[0] & CR0_PE_MASK) || (env->eflags & VM_MASK)) {
         int dpl = (env->eflags & VM_MASK) ? 3 : 0;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 11db2f3c8d..6a4c31f933 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2287,13 +2287,13 @@ static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
     }
 }
 
-static inline void gen_op_movl_T0_seg(DisasContext *s, int seg_reg)
+static inline void gen_op_movl_T0_seg(DisasContext *s, X86Seg seg_reg)
 {
     tcg_gen_ld32u_tl(s->T0, cpu_env,
                      offsetof(CPUX86State,segs[seg_reg].selector));
 }
 
-static inline void gen_op_movl_seg_T0_vm(DisasContext *s, int seg_reg)
+static inline void gen_op_movl_seg_T0_vm(DisasContext *s, X86Seg seg_reg)
 {
     tcg_gen_ext16u_tl(s->T0, s->T0);
     tcg_gen_st32_tl(s->T0, cpu_env,
@@ -2303,7 +2303,7 @@ static inline void gen_op_movl_seg_T0_vm(DisasContext *s, int seg_reg)
 
 /* move T0 to seg_reg and compute if the CPU state may change. Never
    call this function with seg_reg == R_CS */
-static void gen_movl_seg_T0(DisasContext *s, int seg_reg)
+static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
 {
     if (s->pe && !s->vm86) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-- 
2.29.2


