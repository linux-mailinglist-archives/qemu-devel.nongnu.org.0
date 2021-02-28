Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351F327545
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:38:17 +0100 (CET)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVdg-0004dn-5r
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPi-0005Qi-By
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:52 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPV-0007iD-6I
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:23:50 -0500
Received: by mail-pf1-x434.google.com with SMTP id e3so6276883pfj.6
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sIM3FAdXuKg0U210OJhtW2cayo77UxAtPgjDXJHCwWQ=;
 b=Nsdy4HADDnjXdGGbLuG0IwndMWeU4g2MsoRp6odUIs5oKuIae+d4XwdBTBBgWLw7pV
 eG4dNbbiu8IZKRst/3yDDdoxDsdJhYd9ZAXMWZECnPj3cvWPpows+Rc8B/z40ksiUN+d
 6lFu1pfyy0dZIkgmQyFbpuulJjc8vba7QCE6DJDHoASPXvOKqGekT5MDrpfap1uSUMsl
 33nPRaOxb1+dbu1vQsj2sKikRC3SIO/FK3ZyY9Fc2Vw3Vl0TTrGFbzyamLdlggnAmoIG
 /K9kHgdm4MXDFGRPO7TQgMv+tGnxLnpyjkayY0L5sEbOLA30wwscX+9PhsAvbsI629nZ
 22oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sIM3FAdXuKg0U210OJhtW2cayo77UxAtPgjDXJHCwWQ=;
 b=hJr+FFa3GTJDTyzOIFqCPMzLKI61vLSrgxqVk/8dJctftrNvfIdOJeqnn+NP+AY68s
 4RPgMGprel0PdRUf8/VnizwcBA2MxF660zNA3YTczU15T1rCKI5sazByveVqDcYgM9h/
 dv9Tdw0//8RZN8osA2h8+v8sQ4M+CRvX2rkc9N3H3rs/lNaQcM7xITRtb/Ruwv+/o8bl
 jXBVOKRdnN4wWWhnW1KC0zD08N+G2xGLB28r6bUmg9ea0WlEo6Tthgdq0a7/4zrrBLlj
 L628LdoY5JFf0j5C2JF3oN6nZXU9j6MyNjHQD+TtdJiDub3h6H188GfDzKWzw2qFX+xr
 Ezow==
X-Gm-Message-State: AOAM531PnV0CgjVCIRD56wrVFsFxmkR1TZr1fGyRfmij3kLhOi7b2bQN
 PJ8rNzKxB5XPKIoyZUqZXdvGgnKg0asxtA==
X-Google-Smtp-Source: ABdhPJwdZ9K+1K+TzlEOo9SOYuic+uwNBuArFDe6mxxsxXdeUHRKHrDD0dx7aHXR7pjRJzdNm9KZhg==
X-Received: by 2002:aa7:8759:0:b029:1ed:81d4:1b88 with SMTP id
 g25-20020aa787590000b02901ed81d41b88mr12529693pfo.6.1614554614951; 
 Sun, 28 Feb 2021 15:23:34 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/50] target/i386: Assert LMA for x86_64 user-only
Date: Sun, 28 Feb 2021 15:22:44 -0800
Message-Id: <20210228232321.322053-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

LMA is a pre-requisite for CODE64, so there is no way to disable it
for x86_64-linux-user, and there is no way to enable it for i386.

Since we're adding an accessor macro, pull the value directly out
of flags when we're not assuming a constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e7f4392d55..c8728397d0 100644
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
@@ -7289,7 +7291,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         } else {
             gen_helper_sysret(cpu_env, tcg_const_i32(dflag - 1));
             /* condition codes are modified only in long mode */
-            if (s->lma) {
+            if (LMA(s)) {
                 set_cc_op(s, CC_OP_EFLAGS);
             }
             /* TF handling for the sysret insn is different. The TF bit is
@@ -8497,6 +8499,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(CODE32(dc) == ((flags & HF_CS32_MASK) != 0));
     g_assert(CODE64(dc) == ((flags & HF_CS64_MASK) != 0));
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
+    g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
 
     dc->addseg = (flags >> HF_ADDSEG_SHIFT) & 1;
     dc->f_st = 0;
@@ -8515,9 +8518,6 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
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


