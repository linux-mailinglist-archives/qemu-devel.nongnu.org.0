Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5D69D2FC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:45:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8F-0006Ig-Lo; Mon, 20 Feb 2023 13:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6a-0004ZC-Bi
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:46 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6N-00048T-1N
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:36 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so2372182pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R32w+gpJSW/QF+uQd1ste0+qotsnEJ4jVU8optw/M+8=;
 b=qPo54lyC9tP4c9S/eVnkgCmH4x174fmL72ytd7UK4i+UZVoMaxYEV8xYt7talJN9rC
 I8EZq0e2POFgKCOrlGMhYJMKOEk9A4dmrBynyNHV+s/4MwcTYS13yGefnkdgfAMx62fs
 eK07GvD9ICA6IKSC9sikS9wbTzfFIx8sYWdM0b1PluQfPwxF5nKQylqH8HFLOGM6FKB+
 XYzliuJpxbvTcrRrDjov3HKzM2iri5dI/Uy2Ba0of0mmXA3+iByU2H4ugY9ZAnx7qe/f
 IxiRIXDarJbIik3fUWwu6wgosTxSDyAlr5PC2vVQfMGNM/6vPPOVPDkKa+piuOC7aWup
 HI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R32w+gpJSW/QF+uQd1ste0+qotsnEJ4jVU8optw/M+8=;
 b=gW0vT8H1FxozUBRcogBeMyO7MkD1ijP8/BRDAAmjNR2aZSgqOD0352eTeKrurEdriF
 Vemc0OAmAjyc/mlSMpZFU9x7mp5/qEZjE9l4vdpLzeu75VXRbLb44cqYVUHdqw9QEjRL
 skJ4RmVMpnYZQZV91fPXVWYLZaaLd/BlVVwIkbUJ7eoVZwa2yrBbm8Z2EdzD9gzLwp/H
 Ta52nRAVUzCnsq6gFAgfKKXaaHM31n8CVsEfvPmEaqvgWm5OA+QbUGRUWYw1TAAC3R2k
 Dlaep7YsowZT7qBcW43tRL2rVthvp2qkv7ErGGviNePbTizJnZoZFyTVdRjuSy3e1FBo
 XvUQ==
X-Gm-Message-State: AO0yUKUHvZeWpDlILLIIbQB6vxYiJBvvCAN2xjJl8BKb45s9+hc0kpKs
 nxnBRtvGXyeuJpDqdZ80PzhrGhSjwtILVUT9ROQ=
X-Google-Smtp-Source: AK7set8tqgzfD0gTiAvSxcopAP1rUfGx7LcQYMWEATB4c+LLlkQZsQG6zbw36WIb0gG9nUnEvqvI7A==
X-Received: by 2002:a17:902:e80f:b0:19b:afb:b92e with SMTP id
 u15-20020a170902e80f00b0019b0afbb92emr5453336plg.40.1676918483800; 
 Mon, 20 Feb 2023 10:41:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 15/27] target/s390x: Add disp argument to update_psw_addr
Date: Mon, 20 Feb 2023 08:40:40 -1000
Message-Id: <20230220184052.163465-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename to update_psw_addr_disp at the same time.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index d21b6d7f72..160c5eef59 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -348,9 +348,9 @@ static void return_low128(TCGv_i64 dest)
     tcg_gen_ld_i64(dest, cpu_env, offsetof(CPUS390XState, retxl));
 }
 
-static void update_psw_addr(DisasContext *s)
+static void update_psw_addr_disp(DisasContext *s, int64_t disp)
 {
-    gen_psw_addr_disp(s, psw_addr, 0);
+    gen_psw_addr_disp(s, psw_addr, disp);
 }
 
 static void per_branch(DisasContext *s, bool to_next)
@@ -456,7 +456,7 @@ static void gen_program_exception(DisasContext *s, int code)
                    offsetof(CPUS390XState, int_pgm_ilen));
 
     /* update the psw */
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
 
     /* Save off cc.  */
     update_cc_op(s);
@@ -1184,11 +1184,11 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
         update_cc_op(s);
         per_breaking_event(s);
         tcg_gen_goto_tb(0);
-        gen_psw_addr_disp(s, psw_addr, disp);
+        update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
         return DISAS_NORETURN;
     } else {
-        gen_psw_addr_disp(s, psw_addr, disp);
+        update_psw_addr_disp(s, disp);
         per_branch(s, false);
         return DISAS_PC_UPDATED;
     }
@@ -2468,7 +2468,7 @@ static DisasJumpType op_ex(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
     update_cc_op(s);
 
     if (r1 == 0) {
@@ -3192,7 +3192,7 @@ static DisasJumpType op_lpd(DisasContext *s, DisasOps *o)
 
     /* In a parallel context, stop the world and single step.  */
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        update_psw_addr(s);
+        update_psw_addr_disp(s, 0);
         update_cc_op(s);
         gen_exception(EXCP_ATOMIC);
         return DISAS_NORETURN;
@@ -4505,7 +4505,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        update_psw_addr(s);
+        update_psw_addr_disp(s, 0);
         gen_helper_per_store_real(cpu_env);
     }
     return DISAS_NEXT;
@@ -4743,7 +4743,7 @@ static DisasJumpType op_svc(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 t;
 
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
     update_cc_op(s);
 
     t = tcg_constant_i32(get_field(s, i1) & 0xff);
@@ -6545,7 +6545,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            gen_psw_addr_disp(s, psw_addr, s->ilen);
+            update_psw_addr_disp(s, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
@@ -6614,7 +6614,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-        update_psw_addr(dc);
+        update_psw_addr_disp(dc, 0);
         /* FALLTHRU */
     case DISAS_PC_UPDATED:
         /* Next TB starts off with CC_OP_DYNAMIC, so make sure the
-- 
2.34.1


