Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E668380CC7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:21:56 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZdT-0003hj-4t
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVh-0005H6-Hf
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:53 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVf-0006vq-NQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:53 -0400
Received: by mail-qt1-x82d.google.com with SMTP id k10so8880447qtp.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn1V2rIqKo+AsShXkwGs+Vni4KjG/t23nir0rKrZNgo=;
 b=RpFy+3atE6tSdPCpoJkTAAROsZkRA/FzCuJ5WcBrXzj0o/MeWrbT7e5F28KvAYY612
 dGy8B+kAOb7c0VilH8Lkc3xuNGZ5DW2ANNhGQiX+/xLnEgXPN66GOy2ZBKibMzu4r3m/
 FeX+0S9RcFUsJs7gAlOxQ9j2KSBVCF5i1MgyM8myMznDEzfZVbieQUb5Gez7A9EhSxK6
 B2n/n5C6FcoU1Ux939bBu3XsoicPyNpr+x7zmgCi/ivKYT0rc6ovgNTcgm1hm4PIe002
 x3wpvPR6UG9WJgKcKHajTv+vxv/u3Iwk+KdA2npYRIMOx9C178WDe5k2cT+gKZTyiJQo
 WkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn1V2rIqKo+AsShXkwGs+Vni4KjG/t23nir0rKrZNgo=;
 b=pQNMNVcxbxKKVByREtGAHO6eepoKTnN9vJ4FK/YyKCz4Bd7U54yesANKcFhyyLnmnp
 Yl3r7ZAVDlRISBqaR+7NpmUEk6jUaIX6iHkPxpa7TfwDwimm7/m4Ei7BswGdZvZ7PhKa
 Nq6+T3deKsCbjJ9BxpnWQF/9sE85Dy6OYeFhsU+4Qvj/P16LtwFUScPfcLtetXuzdm6X
 K6PsaL9UC14p9TbFjuFZT4bHq5U6t773Bgoe+pnMW5EbLHgfk/WAJgBwVI+Xa4N4FEys
 Xc1eWBCeoIeBqxLnDL0hxzCifYoWtnGXC0JefnDTb7sOx1rftGUGqWWk1qp9CCaNj7JD
 3VNA==
X-Gm-Message-State: AOAM533PgQFGKOnjhVHmxzf9fVDYkVdgv1QlPtc7ZDpFMoVHaL8kbija
 AsnXdtKjohZ+69XAgQhEAKnmhzjCGpRadfTLtW0=
X-Google-Smtp-Source: ABdhPJxPErOj9o49oltCbh70Gg/X+brhFS9wkRnJYzqwxsVn3Cul2lq2G6+1xExjMdFAnq8bKbk4hg==
X-Received: by 2002:a05:622a:40b:: with SMTP id
 n11mr43152251qtx.167.1621005230806; 
 Fri, 14 May 2021 08:13:50 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/50] target/i386: Assert CPL is 3 for user-only
Date: Fri, 14 May 2021 10:12:59 -0500
Message-Id: <20210514151342.384376-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A user-mode executable always runs in ring 3.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


