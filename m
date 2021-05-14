Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5748D380CD4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:24:41 +0200 (CEST)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZg8-0002VO-EJ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVn-0005h7-Mq
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:59 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVl-0006zf-UG
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:13:59 -0400
Received: by mail-qk1-x72d.google.com with SMTP id a2so29008306qkh.11
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8q8ro9KDKZ6Ts4hBMpNvAYmk0DmTL5FCdMyQCCd5v0s=;
 b=UKmeaIYM3MSAac/JNeLjyF75TzCIQRwPE9YvcMkb6e6aFjLRWJMpf4F7KcbBztCfXD
 DY22F81ia7JVFpNuvqtprfPVU6yfFTyE2BGTG4lyeV27hHDy/w8clAXxhOhOwSpa+NoD
 RiLAFlkqZscVxTbeQ+hRSWmb41DJO/gHjIbBMzSQy1LOwrQ34YW7azG5qjQNEdtPO5A9
 3ODBSFC2bWPOOsgTq8iJu+3wblKmHPLA+u//BuOc/LziXEZvG8YcH0qGl2A1EWSezZeL
 L+bGCTriXgyUC5tkEjQIcMS22rs6y0abxNvFPOKufP887czlflWcF7aXpJCc1imoxA+h
 JzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q8ro9KDKZ6Ts4hBMpNvAYmk0DmTL5FCdMyQCCd5v0s=;
 b=iVqR5NdvLCO0OCsxcHgO0KjoK7OGc10kwBi37B+yGRt30dAC+7Xs2wpRQ4iUojmHT5
 zll2rEPThJxYMVfPeFLXCmlr63zMs3z0r6Hd69WLB4HtwyDj7IWXzsGUIivaLlhu28DL
 +5eHH4K+BGj7lQS3SwyEUofunhk7FhzI9b/5QGW1Wpt0bteMXBkPF+CtK4SVN83A0GO7
 nGegDpQ3wqNDwR+CwVY+XHth5mpSikauVRUq3DUf456yMLxrTjSNhDbQHM4zjlH7pg7M
 iL8FVAYoX5r5zl6beIgSqym4LLIx7oz6c0TLvQFZRBNknGoTStYd3nH46vYLHclaDUKA
 F8/w==
X-Gm-Message-State: AOAM530DmJpd4yFJTUgNnsAd+gOwbkDrdcABKBQB6awADVp5sAzQKCGi
 TKCjqFnrzscEXy1J1F8kfP8WFnDCpHibQn38Lns=
X-Google-Smtp-Source: ABdhPJxzq60ce/IiOb821otPG1fPuSU84UIhdMRz53rmAEsKLliA0zGs/RgEDOiYVwSqH2mlUtbijg==
X-Received: by 2002:a05:620a:9c4:: with SMTP id
 y4mr19944862qky.60.1621005237164; 
 Fri, 14 May 2021 08:13:57 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:13:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/50] target/i386: Assert !ADDSEG for x86_64 user-only
Date: Fri, 14 May 2021 10:13:06 -0500
Message-Id: <20210514151342.384376-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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

LMA disables traditional segmentation, exposing a flat address space.
This means that ADDSEG is off.

Since we're adding an accessor macro, pull the value directly out
of flags otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


