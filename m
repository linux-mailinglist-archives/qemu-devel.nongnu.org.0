Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63325389595
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:38:38 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR5Z-0000zj-Er
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyL-0003eJ-B7
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:09 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:45623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyH-0005dq-Lx
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:08 -0400
Received: by mail-oi1-x230.google.com with SMTP id w127so10158960oig.12
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rAFQ7hKTntiFTKkEw/GOqW3HmIjaB2DpbwQSPaXZceA=;
 b=rA3o1yq5/2RJ6R0UY7v/2bL9sXmOfja+OvhAFCVOzntZ62rAWIVUPOr8ugOAV/bYb4
 CeihgCcu1ldZFGdis4G24bhLy67valVMdVW8J1trE+Hg3aqtkcRxOg6mKnl9f2hRJda4
 TCe0T2MUqLCsFBvMAtkNYCe3O6U/r05jocKhPuOJVUv3Xo9nSSZci2Yv7K1+i3pH9mOM
 0BEJMC/FK4QE++KPAiO+VXXRyVG/UvRQ98PRO1qdsvpmqSOYC2f9pEbZvMVZe3a4/nJ1
 5JYQufkrpllxyyQtd8osZCfnHBJ1Nxp1rTZmVmoMjSlADm2efS6PktY5ZIHH/M4bQPS5
 4fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAFQ7hKTntiFTKkEw/GOqW3HmIjaB2DpbwQSPaXZceA=;
 b=Ntm5Mc+dwedxiiriiyvG2KG1TJX7iYN+3g02gcB7G67OKBvrjTV0yPemEZL643bC8w
 WWXcCp4q422HjrOd/dcEVBszO/H3EkoefvkxwCn640+vfJ6fvUcRN6Xp+Z2g5YQDxJCs
 9ne9XhHALGihfuczjMR4kk4Gm0Wr02js6rH25obs4iSPiFJ64tsK6x4lbWEwwoNOySFv
 tEbv+5WJHvf1EGYgf0RHf1ZvQyuG6fY+gBLYJdBPig2br5C9HvU5AwdrVtwuTk6y9g27
 95DhCbmRVf9zzARePE9PSv7oIfGJqKGp9Avz1adgac6LQzQ3dsAqqS5oKVi9IiOrYNzS
 83ig==
X-Gm-Message-State: AOAM533+mMDcEhREQjFp+HZkjgE/stT31XnwhBUAgsYxx2NORgPb1Q7B
 N30gd21zhFt0zcTs0qlclYjEcV3P1NZviwsP
X-Google-Smtp-Source: ABdhPJxtVJTtqYHNhjN/s1DpgKUfZ/n/xrF59aaiKbGJYgwkJ4oiAEEq8smclObyTBk04l3Y3NPQpg==
X-Received: by 2002:aca:1205:: with SMTP id 5mr545742ois.6.1621449064451;
 Wed, 19 May 2021 11:31:04 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/50] target/i386: Assert CODE64 for x86_64 user-only
Date: Wed, 19 May 2021 13:30:12 -0500
Message-Id: <20210519183050.875453-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

For x86_64 user-only, there is no way to leave 64-bit mode.

Without x86_64, there is no way to enter 64-bit mode.  There is
an existing macro to aid with that; simply place it in the right
place in the ifdef chain.

Since we're adding an accessor macro, pull the value directly out
of flags when we're not assuming a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-13-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7b5031f647..e3907f9066 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -41,11 +41,9 @@
 #define PREFIX_VEX    0x20
 
 #ifdef TARGET_X86_64
-#define CODE64(s) ((s)->code64)
 #define REX_X(s) ((s)->rex_x)
 #define REX_B(s) ((s)->rex_b)
 #else
-#define CODE64(s) 0
 #define REX_X(s) 0
 #define REX_B(s) 0
 #endif
@@ -102,7 +100,6 @@ typedef struct DisasContext {
 
 #ifdef TARGET_X86_64
     int lma;    /* long mode active */
-    int code64; /* 64 bit code segment */
     int rex_x, rex_b;
 #endif
     int vex_l;  /* vex vector length */
@@ -165,6 +162,13 @@ typedef struct DisasContext {
 #define CODE32(S) (((S)->flags & HF_CS32_MASK) != 0)
 #define SS32(S)   (((S)->flags & HF_SS32_MASK) != 0)
 #endif
+#if !defined(TARGET_X86_64)
+#define CODE64(S) false
+#elif defined(CONFIG_USER_ONLY)
+#define CODE64(S) true
+#else
+#define CODE64(S) (((S)->flags & HF_CS64_MASK) != 0)
+#endif
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s, TCGv dest);
@@ -8497,6 +8501,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(IOPL(dc) == iopl);
     g_assert(VM86(dc) == ((flags & HF_VM_MASK) != 0));
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
+    g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
 
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
@@ -8518,7 +8523,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
 #ifdef TARGET_X86_64
     dc->lma = (flags >> HF_LMA_SHIFT) & 1;
-    dc->code64 = (flags >> HF_CS64_SHIFT) & 1;
 #endif
     dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
                     (flags & HF_INHIBIT_IRQ_MASK));
-- 
2.25.1


