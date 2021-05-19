Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515B3895D0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:50:36 +0200 (CEST)
Received: from localhost ([::1]:60672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRH9-0007ru-5L
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyl-0004Gy-BS
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:35 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyZ-0005m2-Cc
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:35 -0400
Received: by mail-oi1-x22b.google.com with SMTP id b25so14061359oic.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nqW7XsN57M2hYAJUK6/QOBNZBxSwu2T66IctV1Y0s/A=;
 b=SnqMeTAjuWrxkMmy3a+oCbs8vSN0TfPhkZuiS4KDL7XXc5/nHizmyNHswCzDOi52xz
 5May5pa1u/OsClq0PGP4PPZS4aK/QPrYv9i4UPVTjptuDQ5p8xidsIfEJjzIEajaT4l1
 st3GHrfSO2Y5Q/lF+Us0fuhlQAbXEClvr0CK8AR7NSiqw1ppUTAYaljaXCqecRGWxpjE
 hzywhtrzPYy495RmVaQx33Ryewo7yYO1cY/KxhGpicZk06sT3XY3yHSX9TmtzpWtYdGo
 SBU0l3CCUZgAOKMu2+wKUPL98ai8CK776Q9YAgKbIiux04GPBV0/85LqYTuLKvJVXWpC
 BwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nqW7XsN57M2hYAJUK6/QOBNZBxSwu2T66IctV1Y0s/A=;
 b=XRvRkHUmGY2KAUf5tpi4+/mSEoibrakuSiUCZANnJx43slLnCKIznyhnHtBUkp3RtF
 SWUlC+0BtHVazYTowpBvvEWP+wcLUQ2iBkYP6WXdUMkPoq2UrFJ6NFvfee1P1r/SIMWM
 GztmUEZJubnu1RfjjYqH3ndLCZY9y5Tdgkf/rnp7V2c4iqO2qV+hYIEMeyqh5D4ckPfW
 7LEoRzwaJa5tu1BU0E2jPzv8OZFSAjmO8uT0DYrhMbWQ5INXK66aY/MMBTyeaFEWo6II
 RKTfhuf7fljA28SfGbt8CwUwXC2AyUnk9SYyCoi+wEoZbIr8CHrrooJJgZJRKfnlFfFy
 EX+A==
X-Gm-Message-State: AOAM533dR7jpYYqJ05f4RvfTppgMC1ilVO5OXuOiZTVsXLrGrVzS4X4J
 z4H4ukgti31t2g6iS+ASfM/1WqGwXR6ri9+V
X-Google-Smtp-Source: ABdhPJxP6SGatmwWkQR0QkF2ltZ8/e38JcD/QMUcGZ5JGwiOY1hwNuLQPqSLa1wkx4uF5Kyi8+l6qw==
X-Received: by 2002:a54:4396:: with SMTP id u22mr524959oiv.118.1621449081845; 
 Wed, 19 May 2021 11:31:21 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/50] target/i386: Assert !SVME for user-only
Date: Wed, 19 May 2021 13:30:30 -0500
Message-Id: <20210519183050.875453-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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

Most of the VMM instructions are already disabled for user-only,
by being usable only from ring 0.

The spec is intentionally loose for VMMCALL, allowing the VMM to
define syscalls for user-only.  However, we're not emulating any
VMM, so VMMCALL can just raise #UD unconditionally.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210514151342.384376-31-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 28eb0e8adf..235caa247b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -138,10 +138,12 @@ typedef struct DisasContext {
 #define PE(S)     true
 #define CPL(S)    3
 #define IOPL(S)   0
+#define SVME(S)   false
 #else
 #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
 #define CPL(S)    ((S)->cpl)
 #define IOPL(S)   ((S)->iopl)
+#define SVME(S)   (((S)->flags & HF_SVME_MASK) != 0)
 #endif
 #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
 #define VM86(S)   false
@@ -7495,7 +7497,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd8: /* VMRUN */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7510,7 +7512,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xd9: /* VMMCALL */
-            if (!(s->flags & HF_SVME_MASK)) {
+            if (!SVME(s)) {
                 goto illegal_op;
             }
             gen_update_cc_op(s);
@@ -7519,7 +7521,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xda: /* VMLOAD */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7531,7 +7533,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdb: /* VMSAVE */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7543,8 +7545,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdc: /* STGI */
-            if ((!(s->flags & HF_SVME_MASK)
-                   && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
@@ -7558,7 +7559,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdd: /* CLGI */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -7570,8 +7571,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xde: /* SKINIT */
-            if ((!(s->flags & HF_SVME_MASK)
-                 && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
+            if ((!SVME(s) && !(s->cpuid_ext3_features & CPUID_EXT3_SKINIT))
                 || !PE(s)) {
                 goto illegal_op;
             }
@@ -7581,7 +7581,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
             break;
 
         case 0xdf: /* INVLPGA */
-            if (!(s->flags & HF_SVME_MASK) || !PE(s)) {
+            if (!SVME(s) || !PE(s)) {
                 goto illegal_op;
             }
             if (!check_cpl0(s)) {
@@ -8516,6 +8516,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     g_assert(SS32(dc) == ((flags & HF_SS32_MASK) != 0));
     g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
     g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
+    g_assert(SVME(dc) == ((flags & HF_SVME_MASK) != 0));
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->cc_op_dirty = false;
-- 
2.25.1


