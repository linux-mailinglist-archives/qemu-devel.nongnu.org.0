Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE7389596
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:38:38 +0200 (CEST)
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR5Z-0000xr-Mz
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyM-0003hi-6y
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:10 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyJ-0005eo-H2
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:09 -0400
Received: by mail-oi1-x22d.google.com with SMTP id u11so14004505oiv.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agd4oaV5WPqctmWjrwQb1Gp+h1P4jf2oyWzZFVAY35U=;
 b=tAnjAD3aHBl9AILJqEJlVd0Y5+peTzMaO5bxvbtWq6IJbYVsgcfbDbOxV/+IiSgYn8
 42layQb6W9p34kujaDjx7CB12JNoxr31/TW3JyiX2GTEfg4a2eDFHmJ8TX4KE7jJXIwv
 UQPDeu5SGbzXg3B7LFz2mMBnIh8/GQlJRpI3cSlnNoCdhHFI03aOxSJTQMJKHKwvnwhZ
 TbWaZSBnS4Iq5z9HIAnk2270zClXeV4nH00A/mbQQ8K3LtBHFZIxe4TygYzLtVbiJWBn
 LFDuaQ++SlzmAtRMTgHOIeTfJJuoGvKH7kqhyB1pn77EjivxtV6HsRifsYWnlbg5ypPF
 8+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agd4oaV5WPqctmWjrwQb1Gp+h1P4jf2oyWzZFVAY35U=;
 b=sOsm+RYFjrcFAUanaF3SvD0+UoJDXkO5HJ6k9lIE67iKX74Ssw4Uwsj9Y8zJiBey52
 Q/bDMZwIBtq+mwzgEhT/XkUq8aznBowofwG+g/DLGGoSuBL06sbKnW95GPKtBvPocPRz
 AZqC7HEPk8ccFlXU7LB5oyrhLUUuXaxiJhpCOfx7UxSob3x9VIaZnpMAKuiqfUWyoloB
 LraTS5nJnpsWTp1il5EaHK9RkJbnFzuzCtr60f/JP+pFwVsIjYFy5z4iWbSNzCsCVbY9
 qNA4EcR5kfec2f3DpyecRi11JBQW4PINUakkTybLSasoGNEC2s4XDNyzW+Cw8E85825f
 kxug==
X-Gm-Message-State: AOAM5311QDzpTYKLW6enRzERd5q+yFjE7ydtAxC/WDrH1+NQpqEj/eEm
 83QzHNqPAL6/OiBo7zBJs4Ceeq0PxE8XOns9
X-Google-Smtp-Source: ABdhPJwfIa66IIQWtwNdR9ysJ13FiFmlnTcKUoRMDK73dqOofUnfSnFjRYxgue7qqpyTR6MonxyjSg==
X-Received: by 2002:a54:4819:: with SMTP id j25mr412777oij.2.1621449066321;
 Wed, 19 May 2021 11:31:06 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/50] target/i386: Assert !ADDSEG for x86_64 user-only
Date: Wed, 19 May 2021 13:30:14 -0500
Message-Id: <20210519183050.875453-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

LMA disables traditional segmentation, exposing a flat address space.
This means that ADDSEG is off.

Since we're adding an accessor macro, pull the value directly out
of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-15-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 9c8a405694..7d7ab3e03d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -108,7 +108,6 @@ typedef struct DisasContext {
 #ifdef TARGET_X86_64
     bool x86_64_hregs;
 #endif
-    int addseg; /* non zero if either DS/ES/SS have a non zero base */
     int f_st;   /* currently unused */
     int tf;     /* TF cpu flag */
     int jmp_opt; /* use direct block chaining for direct jumps */
@@ -156,10 +155,12 @@ typedef struct DisasContext {
 #define VM86(S)   false
 #define CODE32(S) true
 #define SS32(S)   true
+#define ADDSEG(S) false
 #else
 #define VM86(S)   (((S)->flags & HF_VM_MASK) != 0)
 #define CODE32(S) (((S)->flags & HF_CS32_MASK) != 0)
 #define SS32(S)   (((S)->flags & HF_SS32_MASK) != 0)
+#define ADDSEG(S) (((S)->flags & HF_ADDSEG_MASK) != 0)
 #endif
 #if !defined(TARGET_X86_64)
 #define CODE64(S) false
@@ -492,7 +493,7 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
 #endif
     case MO_32:
         /* 32 bit address */
-        if (ovr_seg < 0 && s->addseg) {
+        if (ovr_seg < 0 && ADDSEG(s)) {
             ovr_seg = def_seg;
         }
         if (ovr_seg < 0) {
@@ -505,7 +506,7 @@ static void gen_lea_v_seg(DisasContext *s, MemOp aflag, TCGv a0,
         tcg_gen_ext16u_tl(s->A0, a0);
         a0 = s->A0;
         if (ovr_seg < 0) {
-            if (s->addseg) {
+            if (ADDSEG(s)) {
                 ovr_seg = def_seg;
             } else {
                 return;
@@ -2429,7 +2430,7 @@ static void gen_push_v(DisasContext *s, TCGv val)
     tcg_gen_subi_tl(s->A0, cpu_regs[R_ESP], size);
 
     if (!CODE64(s)) {
-        if (s->addseg) {
+        if (ADDSEG(s)) {
             new_esp = s->tmp4;
             tcg_gen_mov_tl(new_esp, s->A0);
         }
@@ -8506,8 +8507,8 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
+    g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
 
-    dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
     dc->tf = (flags >> TF_SHIFT) & 1;
     dc->cc_op = CC_OP_DYNAMIC;
-- 
2.25.1


