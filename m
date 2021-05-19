Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D980638958C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:36:05 +0200 (CEST)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR36-0003di-Gd
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyI-0003Vn-5S
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:06 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyE-0005Zn-0g
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:05 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso12622010otn.3
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9LVl7NkZXjA3C65kTwIIt1lI1AlgmXPdeZo4OH5Iz0=;
 b=QM56g6oTVBzys5Twvu8M6WpORK42HtjbtrR39ziXGAJNF8JqCq6ruw+75T+hU0Z9Pn
 DlTGojyBbbhQCBRYvmJYLw7LCLbxssjoe+/C6YYYEXqmsBRPssHY4dnXKhf+TDMfVSCR
 TN9dyIDhxp1PgZNFBrLokEZYF/IWR/7J/GTGKsGRSE9yzZTg0zu9gcSN44ZmlVOybhBt
 rWvwAhL0f4mlUKYS5JYj7OQUXdZjjVo4skeIINGH1I1lF2JN+ecCVvC7IaUOpcEuU/oU
 Xr9gcQHkar9UOMf5D7Hkt8jBLBQvouNc1kBGVAvk6SwcfwJ4r84uxYp/kDHE+fEq2iny
 moVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9LVl7NkZXjA3C65kTwIIt1lI1AlgmXPdeZo4OH5Iz0=;
 b=SQHacoiTNv3fP/vlETn9JCLW7UNNaULuck76C5EZJvHuE6NEgxK5H+GtzNYtr+YjW0
 MtwN0Wl2c5mQ+ANHEsvF86VR6mcnwnj7jWhsihe4U24+HwzTvzUqQ3TossftB28xvIys
 SVypYphbmh023d/zT6mS67xjpdQz4v0E84nQ0mBy0R9MwjIrChvrSqe5dytBU26cqyvh
 lS0vbTysHgacwf4FdTELrT8Bvxu1dKT5oOhdO61oQCwno/wYuDeE4VnoDGV+Uyan9LJr
 2IM2881hxyxhI0wWLguLjNqc8Mbos3iN7m3JLay7szYhJBwb/aSjS5N95CThBnDAHHF2
 jXkA==
X-Gm-Message-State: AOAM530l2lHP9yF63aoATeR/ixx3PlmaU3UIMuoRZnnl5qnFKRhFnp38
 d+SSHfj4tgVmZTmcuhELnu24QMP0zUWnnBlH
X-Google-Smtp-Source: ABdhPJydMerYpBjNdgGkknsO9M/Q5V4i/2gqq0KIllbTs8P01MdHl0dgiAb+vUGXr4qQTYzhjjYisA==
X-Received: by 2002:a05:6830:4a1:: with SMTP id l1mr676276otd.25.1621449059691; 
 Wed, 19 May 2021 11:30:59 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:30:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/50] target/i386: Assert CPL is 3 for user-only
Date: Wed, 19 May 2021 13:30:07 -0500
Message-Id: <20210519183050.875453-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A user-mode executable always runs in ring 3.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-8-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7f3993fccb..4c9194416d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -94,6 +94,11 @@ typedef struct DisasContext {
     target_ulong pc; /* pc = eip + cs_base */
     /* current block context */
     target_ulong cs_base; /* base of CS segment */
+
+#ifndef CONFIG_USER_ONLY
+    uint8_t cpl;   /* code priv level */
+#endif
+
     int code32; /* 32 bit code segment */
 #ifdef TARGET_X86_64
     int lma;    /* long mode active */
@@ -111,7 +116,6 @@ typedef struct DisasContext {
     int addseg; /* non zero if either DS/ES/SS have a non zero base */
     int f_st;   /* currently unused */
     int vm86;   /* vm86 mode */
-    int cpl;
     int iopl;
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
@@ -148,8 +152,10 @@ typedef struct DisasContext {
 /* The environment in which user-only runs is constrained. */
 #ifdef CONFIG_USER_ONLY
 #define PE(S)     true
+#define CPL(S)    3
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
+#define CPL(S)    ((S)->cpl)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -623,7 +629,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
 {
     target_ulong next_eip;
 
-    if (PE(s) && (s->cpl > s->iopl || s->vm86)) {
+    if (PE(s) && (CPL(s) > s->iopl || s->vm86)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
         case MO_8:
@@ -1291,7 +1297,7 @@ static void gen_exception_gpf(DisasContext *s)
 /* Check for cpl == 0; if not, raise #GP and return false. */
 static bool check_cpl0(DisasContext *s)
 {
-    if (s->cpl == 0) {
+    if (CPL(s) == 0) {
         return true;
     }
     gen_exception_gpf(s);
@@ -1311,7 +1317,7 @@ static bool check_vm86_iopl(DisasContext *s)
 /* Check for iopl allowing access; if not, raise #GP and return false. */
 static bool check_iopl(DisasContext *s)
 {
-    if (s->vm86 ? s->iopl == 3 : s->cpl <= s->iopl) {
+    if (s->vm86 ? s->iopl == 3 : CPL(s) <= s->iopl) {
         return true;
     }
     gen_exception_gpf(s);
@@ -6735,7 +6741,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_POPF);
         if (check_vm86_iopl(s)) {
             ot = gen_pop_T0(s);
-            if (s->cpl == 0) {
+            if (CPL(s) == 0) {
                 if (dflag != MO_16) {
                     gen_helper_write_eflags(cpu_env, s->T0,
                                             tcg_const_i32((TF_MASK | AC_MASK |
@@ -6750,7 +6756,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                                           & 0xffff));
                 }
             } else {
-                if (s->cpl <= s->iopl) {
+                if (CPL(s) <= s->iopl) {
                     if (dflag != MO_16) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                                 tcg_const_i32((TF_MASK |
@@ -7380,7 +7386,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xc8: /* monitor */
-            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || s->cpl != 0) {
+            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
@@ -7392,7 +7398,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xc9: /* mwait */
-            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || s->cpl != 0) {
+            if (!(s->cpuid_ext_features & CPUID_EXT_MONITOR) || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
@@ -7403,7 +7409,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         case 0xca: /* clac */
             if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
-                || s->cpl != 0) {
+                || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_helper_clac(cpu_env);
@@ -7413,7 +7419,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 
         case 0xcb: /* stac */
             if (!(s->cpuid_7_0_ebx_features & CPUID_7_0_EBX_SMAP)
-                || s->cpl != 0) {
+                || CPL(s) != 0) {
                 goto illegal_op;
             }
             gen_helper_stac(cpu_env);
@@ -8467,19 +8473,23 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
+    int cpl = (flags >> HF_CPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
     dc->flags = flags;
+#ifndef CONFIG_USER_ONLY
+    dc->cpl = cpl;
+#endif
 
     /* We make some simplifying assumptions; validate they're correct. */
     g_assert(PE(dc) == ((flags & HF_PE_MASK) != 0));
+    g_assert(CPL(dc) == cpl);
 
     dc->code32 = (flags >> HF_CS32_SHIFT) & 1;
     dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
     dc->vm86 = (flags >> VM_SHIFT) & 1;
-    dc->cpl = (flags >> HF_CPL_SHIFT) & 3;
     dc->iopl = (flags >> IOPL_SHIFT) & 3;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
-- 
2.25.1


