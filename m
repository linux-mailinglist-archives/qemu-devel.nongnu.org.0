Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637393895AD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:42:24 +0200 (CEST)
Received: from localhost ([::1]:34726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR9D-0007IL-Dl
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyH-0003Ti-Cw
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:05 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:37412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyE-0005aW-3L
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:05 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so12618964otp.4
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrfuvBj4GUNKQqnvsf33MOe2/3eRkVdIcnIjEJTkPfA=;
 b=zkrZJp1UBmEoUfJko2hP5coN6hT/SKc+KWNjwVlLIzCDJV2uOkvAxdFg7maGJftfDS
 mqGdnEyJk9v8g0xnUzEX2omrO3rj6Wi9J/06xMeXLRN9iAz5ZPUJV0VrHHS7cHA2A7/N
 H4FQ5Krk0B8OC/F4w89QHGv4fS8UkQYfOIMkX4HRc2eJ5RYs3MuU90Ti7sgL9QAIuOwc
 u+0P/1QTdzR4v6J/2izQPIqZNIdDBfOdsQKi4MhE44l3XIarKdsqtySUztWlA0yv1oc4
 cVjjWx0lPsIUN3S4RLy3Dj1MStk2LYY2FHyaBF5MyrfLTeuqeb78VLjYTLtp49rz+Q6J
 WdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrfuvBj4GUNKQqnvsf33MOe2/3eRkVdIcnIjEJTkPfA=;
 b=F1aDd2Nc/xrFvFqxtSCXGgzYyrSucSt3sQmUHLbkeNLKjgIXombcNpH5iwBcqVCnHL
 jGw/q+cq/unY2YOxdmyjoEL/uw6Nrzkfex4wrG6yct7YXTnAGMwv2q82JCa9rUH8xylI
 DgwGgh2EUor7C/We+Q6TWCy5lyjMVeikWdGS4dGS2To98vlG6gtTDo0krx7wW5BE5li2
 mqKPGD3eRxOEGm7TTJmQM+XHEnDfR2TQHHSPrkVBY6vvFLZdWQNx6ATll1NU4F+A5JRW
 8kon9VLTwZaBth0bGEL/WiFvlNr4uyldwSENyLmhh7h+7gUlM1zRUyDDeljEmLW3Z3Bj
 f2fA==
X-Gm-Message-State: AOAM532KJXVpiwbsYwLo1DETKwvQmnMIAndYd8FiudzviTY9uIB8yV27
 WiciqhAFU0Q2v59qmYWM7EPtkfEWzzmjA2hi
X-Google-Smtp-Source: ABdhPJwKO/TxBVJbDCPLxX1mwjxgVQiPNDX0VdiBL8XbSD/RbxfFmpyk1xFOIdTN/rFrF8gOkR3Ygw==
X-Received: by 2002:a9d:560a:: with SMTP id e10mr645010oti.353.1621449060655; 
 Wed, 19 May 2021 11:31:00 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/50] target/i386: Assert IOPL is 0 for user-only
Date: Wed, 19 May 2021 13:30:08 -0500
Message-Id: <20210519183050.875453-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

On real hardware, the linux kernel has the iopl(2) syscall which
can set IOPL to 3, to allow e.g. the xserver to briefly disable
interrupts while programming the graphics card.

However, QEMU cannot and does not implement this syscall, so the
IOPL is never changed from 0.  Which means that all of the checks
vs CPL <= IOPL are false for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-9-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4c9194416d..b8cb7163ee 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -97,6 +97,7 @@ typedef struct DisasContext {
 
 #ifndef CONFIG_USER_ONLY
     uint8_t cpl;   /* code priv level */
+    uint8_t iopl;  /* i/o priv level */
 #endif
 
     int code32; /* 32 bit code segment */
@@ -116,7 +117,6 @@ typedef struct DisasContext {
     int addseg; /* non zero if either DS/ES/SS have a non zero base */
     int f_st;   /* currently unused */
     int vm86;   /* vm86 mode */
-    int iopl;
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
@@ -153,9 +153,11 @@ typedef struct DisasContext {
 #ifdef CONFIG_USER_ONLY
 #define PE(S)     true
 #define CPL(S)    3
+#define IOPL(S)   0
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
 #define CPL(S)    ((S)->cpl)
+#define IOPL(S)   ((S)->iopl)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -629,7 +631,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
 {
     target_ulong next_eip;
 
-    if (PE(s) && (CPL(s) > s->iopl || s->vm86)) {
+    if (PE(s) && (CPL(s) > IOPL(s) || s->vm86)) {
         tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         switch (ot) {
         case MO_8:
@@ -1307,7 +1309,7 @@ static bool check_cpl0(DisasContext *s)
 /* If vm86, check for iopl == 3; if not, raise #GP and return false. */
 static bool check_vm86_iopl(DisasContext *s)
 {
-    if (!s->vm86 || s->iopl == 3) {
+    if (!s->vm86 || IOPL(s) == 3) {
         return true;
     }
     gen_exception_gpf(s);
@@ -1317,7 +1319,7 @@ static bool check_vm86_iopl(DisasContext *s)
 /* Check for iopl allowing access; if not, raise #GP and return false. */
 static bool check_iopl(DisasContext *s)
 {
-    if (s->vm86 ? s->iopl == 3 : CPL(s) <= s->iopl) {
+    if (s->vm86 ? IOPL(s) == 3 : CPL(s) <= IOPL(s)) {
         return true;
     }
     gen_exception_gpf(s);
@@ -6756,7 +6758,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                                           & 0xffff));
                 }
             } else {
-                if (CPL(s) <= s->iopl) {
+                if (CPL(s) <= IOPL(s)) {
                     if (dflag != MO_16) {
                         gen_helper_write_eflags(cpu_env, s->T0,
                                                 tcg_const_i32((TF_MASK |
@@ -8474,23 +8476,25 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
+    int iopl = (flags >> IOPL_SHIFT) & 3;
 
     dc->cs_base = dc->base.tb->cs_base;
     dc->flags = flags;
 #ifndef CONFIG_USER_ONLY
     dc->cpl = cpl;
+    dc->iopl = iopl;
 #endif
 
     /* We make some simplifying assumptions; validate they're correct. */
     g_assert(PE(dc) == ((flags & HF_PE_MASK) != 0));
     g_assert(CPL(dc) == cpl);
+    g_assert(IOPL(dc) == iopl);
 
     dc->code32 = (flags >> HF_CS32_SHIFT) & 1;
     dc->ss32 = (flags >> HF_SS32_SHIFT) & 1;
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
     dc->vm86 = (flags >> VM_SHIFT) & 1;
-    dc->iopl = (flags >> IOPL_SHIFT) & 3;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


