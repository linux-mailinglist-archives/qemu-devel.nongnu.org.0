Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74FF42A9AA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:38:41 +0200 (CEST)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKnY-000177-P2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXg-0006UT-Pg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:16 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXb-000456-Cb
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:16 -0400
Received: by mail-pf1-x434.google.com with SMTP id c29so18146pfp.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vzsS779Ji0aZH1T0g3pZgPZBGZ0QiFgHfm7fgPItP0=;
 b=Z3KOtrT8Xx6IEO7Nuhz+kXDLzurPwkuuuZLa7c8wuCwZRekJk6WTxSYGCON6pv5H12
 Gkog/c3rz/doV7mWAaQbk/VmkXOZY10xrq22onfuolY2C5zSjJXk0eZasC5movmZQ14B
 xGowh4Wev5IRGhXsLTZ7A3G4OmC/dAYuRSjy4QtCYfCO2cah1qapwId9MC0wtlCfEg85
 HCWQpGGbzIWgLOdJ5b4tcsfol/WH6NVV28XyzXyMYVu5y/YJHUS5HsAFG//fe3mgUoME
 b3qNupYiZp1v2UDJthuV250z8DKznY9Wk9eEET34xV4Gp8oZyThW+YIHEseZpktQ/rdD
 IzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vzsS779Ji0aZH1T0g3pZgPZBGZ0QiFgHfm7fgPItP0=;
 b=7Kz+5yd/TX3NAbC1FZ+1fzXlYmR1N+q9l/dnXEK3acwspaQgLO/DsbA/MA0Z6rDa1N
 2oq5rJz8FBId+9ft52D1wLmsG9GjY91qz6pVTCTeMSe3BbUchttGa5DiYITOedBrTKCT
 BYYmgyWp83TjuCKdwYXVi+fJxl3Lohoem1p3liY7dY2Q/sDpIskm5+YNVepNLA91Y/wY
 8JbBQPZwyPFI+BADJHuBZuL5qf0SXLYRXpFDUFp5D0JyAu7uNKkYEDF1tVhYR533n315
 mlJf9+KrdWBh8/Fb++mwAA2oJcP+kxmNBXcx1QUpWavpdotF/gnsuK8hCPfl78FfYP5I
 IO4w==
X-Gm-Message-State: AOAM531Lmv+mTJeVHGQbtAnPh1g9OfFm79VTMkrQXJIdUjPJWQUhE7qW
 jMQmK3B5U/Fgz66xxOPUNDzlP/neb/IJNQ==
X-Google-Smtp-Source: ABdhPJyM2ZRqHS07lP1Dfe+VjMDOJ88ld6JomKaccAqj643YzfeYTbwqajBc0RKsxKjEaJYfo38Jiw==
X-Received: by 2002:aa7:8bd3:0:b0:44c:68b3:a52e with SMTP id
 s19-20020aa78bd3000000b0044c68b3a52emr33005726pfd.74.1634055728857; 
 Tue, 12 Oct 2021 09:22:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/23] target/m68k: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:46 -0700
Message-Id: <20211012162159.471406-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
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


