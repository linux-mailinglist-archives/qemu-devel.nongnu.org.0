Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A283895AB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:42:19 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR98-0006yA-AX
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyM-0003j2-Iw
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:10 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:34732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyI-0005eC-KE
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:10 -0400
Received: by mail-oi1-x22a.google.com with SMTP id u11so14004464oiv.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cmBZ6ICmQvawj9IO/C++c+UM9QVtAg4OWAJbtUAe9k8=;
 b=L+1sVI6bibNADdd15+nCFyYwQYuzAaxH9KBeZg1HMgxrlwCYxFjYUyL9gNA7WAVlRV
 zOTpHi2HLooH6PxLf2BwKyTFYiojZ4rWzjw6d8ee3bnLM8NrsLZ5S/CBBDVtCPV+OzKJ
 lQkCZchaJtMwg8IW6DqUrmkQu9DteTwPtMq+pXTLoVcIlK0ldvKKD10OfycJG1JQisRb
 lRvCw9BPSAst5Q0Yvk8x0l257hgluT0sLzdh1yJaa4offxU+v92W8wvfCn3FIovvLJn/
 UQo1TStSX1ji6ffLKijF7q9xbqy7MR6+qIzxcnJJrhRWAbrT3G0sbiZ0tqOEunq92Xab
 4rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cmBZ6ICmQvawj9IO/C++c+UM9QVtAg4OWAJbtUAe9k8=;
 b=jNZ7choab6KdCirP7wsYl6IgICFdlBLYegiMjm7E4BEBTNAEK/I8Y72pKOYS27/lBf
 LLy+q3KTcotHbvsgxRqoIauRmHxYvCocfPLP8rqeJE/vvywt3NK1qlG/NWZHse0hmRAk
 OFCiEQUo+Jrq1+0xVFmio5BBd9aCIvTbXfXqo/kYfBxhBQeRiIWsP83Z3xws0Jve0lAC
 SUgFdmXj1f5RQEZOH0f0Ev8hl9hAtamLSLZEE9DqCNI3sL1u+ew+t2osCttwAQELQLg0
 UohSwijVIekavGZ1UG+JQtmtX3Dsw3j5oy7OGIH9l57kDI4xL0TluuYDfWlzH7IU7GuY
 ox4Q==
X-Gm-Message-State: AOAM531F9B8+43ARLhmxMEkkNExBw7X9UK4YQ8pAP7Z7dOlP8G7PUifJ
 l855SF8lQpPdfn51Afbqq18gOsffd2g7aYWz
X-Google-Smtp-Source: ABdhPJxHiRmNU8tslsZWaBGo7RGP+1GuLHcnVPV5PuZdIF2BuDONjsZEBt+iZ9x0wvZbqqvjj2w5Qg==
X-Received: by 2002:a05:6808:f07:: with SMTP id m7mr423242oiw.98.1621449065388; 
 Wed, 19 May 2021 11:31:05 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/50] target/i386: Assert LMA for x86_64 user-only
Date: Wed, 19 May 2021 13:30:13 -0500
Message-Id: <20210519183050.875453-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

LMA is a pre-requisite for CODE64, so there is no way to disable it
for x86_64-linux-user, and there is no way to enable it for i386.

Since we're adding an accessor macro, pull the value directly out
of flags when we're not assuming a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-14-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e3907f9066..9c8a405694 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -99,7 +99,6 @@ typedef struct DisasContext {
 #endif
 
 #ifdef TARGET_X86_64
-    int lma;    /* long mode active */
     int rex_x, rex_b;
 #endif
     int vex_l;  /* vex vector length */
@@ -164,10 +163,13 @@ typedef struct DisasContext {
 #endif
 #if !defined(TARGET_X86_64)
 #define CODE64(S) false
+#define LMA(S)    false
 #elif defined(CONFIG_USER_ONLY)
 #define CODE64(S) true
+#define LMA(S)    true
 #else
 #define CODE64(S) (((S)->flags & HF_CS64_MASK) != 0)
+#define LMA(S)    (((S)->flags & HF_LMA_MASK) != 0)
 #endif
 
 static void gen_eob(DisasContext *s);
@@ -7295,7 +7297,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         } else {
             gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
             /* condition codes are modified only in long mode */
-            if (s->lma) {
+            if (LMA(s)) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             /* TF handling for the sysret insn is different. The TF bit is
@@ -8503,6 +8505,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
     g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
+    g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
 
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
@@ -8521,9 +8524,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-#ifdef TARGET_X86_64
-    dc->lma = (flags >> HF_LMA_SHIFT) & 1;
-#endif
     dc->jmp_opt = !(dc->tf || dc->base.singlestep_enabled ||
                     (flags & HF_INHIBIT_IRQ_MASK));
     /* Do not optimize repz jumps at all in icount mode, because
-- 
2.25.1


