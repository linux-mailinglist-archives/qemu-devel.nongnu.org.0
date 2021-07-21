Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90643D0929
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:48:10 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m661Z-0004Rj-Od
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vn-0005A9-Hw
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:11 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:39592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vl-0005Vu-Na
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:11 -0400
Received: by mail-pl1-x631.google.com with SMTP id h1so481420plf.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BlPIdpEMHDG0f7nAulWHm2+Z2nPdA6tFMSfI///rGBY=;
 b=jrKPNI5FIbqUc49RzqJ1LIjPQe1QvmBn9e6VjAwHn61mmR+E4oIWW5Uz6O2i9+DY9/
 yr347/UgEh1YD88FcfLiIjrNDmKec9lerYzb7XZ4HJwUgHHthtYvX+UfvZqq6xSax81F
 6g11Q4i9Fsh1c8iU/X2bhM7Z/ZtJPWdudldgVwMQ6aL4hlJMH61GU42LfD2PQgLzyfL7
 Z0rl/6XMwNiZ0laD/IYc/yKvb+rMDXX/sinPWzQiruNyJR/mVWhCYnkRk2DsHIhZEvlW
 Onq7E2d/VeAIwc4frpDuXim/Kno5taq9vwEvndD+lRaFqxAKKMQz1OulXPPCxbDZBYKT
 YiAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlPIdpEMHDG0f7nAulWHm2+Z2nPdA6tFMSfI///rGBY=;
 b=m0Hb6PGohQi0UqiCjkJaL/Y3EGgGYTQ7mvMB+NukydavKu3wRCw78Q82SNYGcbsYW1
 9HYf1jvraxuF6B6GKGQbZ/Kk/JDs/6OjDLEadlvVIliZ8QqTeSKT3+yZBSp3tOFnMoZS
 c0PBvaPo263WyeloBwu1LlLhlbLc4CKZQjjea7mfzlrZTvffu9x0zAh/VCbq3aeTGDin
 KDlY3+6b4H8Y4Pi5/G0Sdx6Uo28tXsW07D7CqfnACgX/Mi2jmV6/AAF7SQVab9S/ILxz
 hMtlr5IiBWpNyU0nHoPxQPBcSn1/JMSIumLhvJ6gYNqsLJmdGJWT4Co6mB5spNiu23K6
 FdAQ==
X-Gm-Message-State: AOAM531MI2vHDW+JHHC5aXv//2MXmhIJRLRHrPoXu5E9KSQSInzd6C4X
 gMoPRPFpMbDc+v1c8oOfEbpzAqp6zyFWuQ==
X-Google-Smtp-Source: ABdhPJzkOTxmtqpTvKGC/CzOjtQf5+3arwQnHFPyRpRd+ge3BCsfpFTeSws2kz91qmh0PpE28hKYjw==
X-Received: by 2002:a17:902:b218:b029:11a:bf7b:1a80 with SMTP id
 t24-20020a170902b218b029011abf7b1a80mr26397488plr.82.1626849728382; 
 Tue, 20 Jul 2021 23:42:08 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/23] target/m68k: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:42 -1000
Message-Id: <20210721064155.645508-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 44 +++++++++--------------------------------
 1 file changed, 9 insertions(+), 35 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c34d9aed61..c3d281a5f2 100644
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


