Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FEE43042A
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:24:43 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboMM-0005kp-Gj
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDY-0008MN-0O
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:36 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDR-0001xl-2Q
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so11646367pjb.5
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vzsS779Ji0aZH1T0g3pZgPZBGZ0QiFgHfm7fgPItP0=;
 b=HSE2KK68BwycnfejuVVg7v1VC74eSRR4ebYB2Psrl4pW/bvwCDa2jaCUTGSmCEX8Do
 SMp5vb/EvKPvjzGoXgGSoc4WBVyQHR/ZvS02LK/FXpoBUZrhI5SporeHcLNC9VClN0A1
 N42lYaDxabgOdPbQwM9nwFWgF9lGSPnfzBmYGtoAHuk7U3H9wL6pOody808XFeAFG2UT
 vDSIa+0G+AXbiD5cdQJhIIFk7PDe/u5J+BjnYiK1XNanwZ1Pf2XApl42ApOPrV/9gtXQ
 RgGEA9awuOUSCjv+vo5nbXuuY0vGzMVIIt55frMGpbNKibCAoDYqZ0Ro+RfTCzpvA30B
 DUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vzsS779Ji0aZH1T0g3pZgPZBGZ0QiFgHfm7fgPItP0=;
 b=PKaW5/dGmZteDkD7ya+2dqQo8llm+vxlNRcHELFQhoJm7+Ybmr/RrLBLlxCa1k6Ujf
 MD9pRUlc7ZHHNvoTaeDyuTnAarixO1Fh6Ssjk97yZnKK/H7MOz8UGxv+VgyZKKmBRU9Z
 MkXmeH6Elj8U0eA6zoNDOkyNe9+4U8H0W2blsAi7HOfuwBIk/BzxaWHOZ+EyTmqKuWOL
 lCekh6xXcGGI3QxQ/U4FiAaT9Tkz9VTr6tDLcuV2pRF7JASBA+LwZ1IhOMOSCAjSpEH0
 5BWNxqbGdaKyOUYcrOGAXD9rGO8rUVm7diiL53H7wWSFDZEsrxbOfwljJ8H6HCbfS0qo
 yl6w==
X-Gm-Message-State: AOAM530JgCtPk33mLTkbYHqcprWD4IYWHBuEDl5kfPMCF329DolW019U
 s5znFhXvUIDMdyRv5Qs0qr+GOVAMpXA6QQ==
X-Google-Smtp-Source: ABdhPJxVSAQdthF/KDOWX00Xtual7L+myD59jn0gJaLVX25VOqPkq4zq5MEBDt1Ct4ReguebhYFuaQ==
X-Received: by 2002:a17:90b:1e4b:: with SMTP id
 pi11mr22267667pjb.179.1634408125724; 
 Sat, 16 Oct 2021 11:15:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] target/m68k: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:00 -0700
Message-Id: <20211016181514.3165661-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 44 +++++++++--------------------------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 50a55f949c..af43c8eab8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -194,18 +194,6 @@ static void do_writebacks(DisasContext *s)
     }
 }
 
-static bool is_singlestepping(DisasContext *s)
-{
-    /*
-     * Return true if we are singlestepping either because of
-     * architectural singlestep or QEMU gdbstub singlestep. This does
-     * not include the command line '-singlestep' mode which is rather
-     * misnamed as it only means "one instruction per TB" and doesn't
-     * affect the code we generate.
-     */
-    return s->base.singlestep_enabled || s->ss_active;
-}
-
 /* is_jmp field values */
 #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_EXIT      DISAS_TARGET_1 /* cpu state was modified dynamically */
@@ -320,20 +308,6 @@ static void gen_exception(DisasContext *s, uint32_t dest, int nr)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_singlestep_exception(DisasContext *s)
-{
-    /*
-     * Generate the right kind of exception for singlestep, which is
-     * either the architectural singlestep or EXCP_DEBUG for QEMU's
-     * gdb singlestepping.
-     */
-    if (s->ss_active) {
-        gen_raise_exception(EXCP_TRACE);
-    } else {
-        gen_raise_exception(EXCP_DEBUG);
-    }
-}
-
 static inline void gen_addr_fault(DisasContext *s)
 {
     gen_exception(s, s->base.pc_next, EXCP_ADDRESS);
@@ -1522,10 +1496,10 @@ static void gen_exit_tb(DisasContext *s)
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
-    if (unlikely(is_singlestepping(s))) {
+    if (unlikely(s->ss_active)) {
         update_cc_op(s);
         tcg_gen_movi_i32(QREG_PC, dest);
-        gen_singlestep_exception(s);
+        gen_raise_exception(EXCP_TRACE);
     } else if (translator_use_goto_tb(&s->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
@@ -6193,7 +6167,7 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
 
     dc->ss_active = (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS);
     /* If architectural single step active, limit to 1 */
-    if (is_singlestepping(dc)) {
+    if (dc->ss_active) {
         dc->base.max_insns = 1;
     }
 }
@@ -6252,17 +6226,17 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         break;
     case DISAS_TOO_MANY:
         update_cc_op(dc);
-        if (is_singlestepping(dc)) {
+        if (dc->ss_active) {
             tcg_gen_movi_i32(QREG_PC, dc->pc);
-            gen_singlestep_exception(dc);
+            gen_raise_exception(EXCP_TRACE);
         } else {
             gen_jmp_tb(dc, 0, dc->pc);
         }
         break;
     case DISAS_JUMP:
         /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
-        if (is_singlestepping(dc)) {
-            gen_singlestep_exception(dc);
+        if (dc->ss_active) {
+            gen_raise_exception(EXCP_TRACE);
         } else {
             tcg_gen_lookup_and_goto_ptr();
         }
@@ -6272,8 +6246,8 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
          * We updated CC_OP and PC in gen_exit_tb, but also modified
          * other state that may require returning to the main loop.
          */
-        if (is_singlestepping(dc)) {
-            gen_singlestep_exception(dc);
+        if (dc->ss_active) {
+            gen_raise_exception(EXCP_TRACE);
         } else {
             tcg_gen_exit_tb(NULL, 0);
         }
-- 
2.25.1


