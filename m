Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719692F046A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 00:36:35 +0100 (CET)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyNmc-0004tB-2g
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 18:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNkf-0003Zg-En
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 18:34:33 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNkd-0003ve-U1
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 18:34:33 -0500
Received: by mail-wm1-x32c.google.com with SMTP id e25so11568729wme.0
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 15:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EQmWTMNEnmOXFRLXHxzUIYYQ8gDqL9FEvBCfnJalq6c=;
 b=U14EFcDqfKNPTVzEWQiJvs5ZLPzpx9rLgs5NfW2Eg53PO/dDedUXnTwm0An/9NQlvv
 pV+n93jyHYYhDP6ygOSupW5BJyOKvXVJ1b7X4FC/tGfR2EoQDoN+0twxETw7zgZKsU+/
 T3THWKPux18GoyEIuGlPA3+1ZTiFV/ICaHN4/JYo903xprYQ/RXKvAX8XNyVzoXBypff
 EIvdox0xqe+hlypgccSsN53T7pdugT81ji9o3hxDslXPdxdALT/KY+s+c/4eXMBVSqH3
 +jOKGa/0v4r8CE6uD6ss1xjaQqX+20dls1xk4B6Ltj/3FYkQZ9eM0k9uE7iKHn9I5Zox
 JI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EQmWTMNEnmOXFRLXHxzUIYYQ8gDqL9FEvBCfnJalq6c=;
 b=R0mjdzbSE4VD5Jz7yi63gQ04KSmV6SHgJnd0/vhriKvyXKwzsltZmjTQmPSLEnekJq
 Eq+Wgv35zco5CJID/QlOrR0PnSNKzKcDGjQ9pGxBRhcPlSqoDdHmsosbRB6QcCZUMYaJ
 tzdNdozecFO/ZoNa7pQH5hB4fDW0nCdXoMUUCGSM5Uhk7ylrfh+RRnahbV3HVdjib2GR
 SefM3Oq1P3bH5Y5UmPi239FnFeRVmsjO+xGWzCcznfxHpW2fQPaO6tAp+ziREK3iG6Rm
 DUVdZ3woy6JS0sq1lTXeoZFWvp9/T/yNWm771tH5pgReBWrLhpEye6GOihRGn5V5QBGb
 H+7w==
X-Gm-Message-State: AOAM531FIGAnQpi5VdV5odLbK4jHlNNJ0XYA4WDhKGKrmH0+RwDeegCr
 IxyTZMYOaCxAukRzG9Y9Yz99dBz/3H0=
X-Google-Smtp-Source: ABdhPJypgxDLZgSKmXiyD2xpt4/sj1QhW08frsyAEhyzAefeItPed9+B3b3kqcvIsushFPWnrYlQ5Q==
X-Received: by 2002:a1c:99d7:: with SMTP id b206mr8864753wme.12.1610235270090; 
 Sat, 09 Jan 2021 15:34:30 -0800 (PST)
Received: from localhost.localdomain (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id j2sm18627240wrt.35.2021.01.09.15.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 15:34:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Use X86Seg enum for segment registers
Date: Sun, 10 Jan 2021 00:34:27 +0100
Message-Id: <20210109233427.749748-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the dedicated X86Seg enum type for segment registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h            | 4 ++--
 target/i386/gdbstub.c        | 2 +-
 target/i386/tcg/seg_helper.c | 8 ++++----
 target/i386/tcg/translate.c  | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index af130512e22..d23a5b340a8 100644
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
index 4a3de5f69da..41e265fc67a 100644
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
index 5f2ee6aa7ea..180d47f0e9b 100644
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
index 11db2f3c8d2..6a4c31f933b 100644
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
2.26.2


