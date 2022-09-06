Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C325AE6B6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:38:17 +0200 (CEST)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWuG-0000YO-My
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVej-0003OI-Vf
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:17 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVee-0005FO-HF
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:09 -0400
Received: by mail-wr1-x434.google.com with SMTP id t14so7410401wrx.8
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PPwEeI49pnflxdKGnZ8Gfig20CEjMBpku/FXWfTvjk4=;
 b=MUMPSw5gjNXgsPnCLB0MdiTAfiF9optd5IMMb2ETudAdP0BHYF/gO5aTykYtz+e2q7
 /4LNkqZLd24378SgaAYr4vXFNmEy+KD1NgmYkRA6l56DPiKivqDZxFo+z/71jnKevb8T
 ee3LFfUw4H9o9BtDrILrILwjti4/HMgzgkYPA842CBevnK/SmSr3+5QkK5iOmJHup4Uu
 bQfcqgt6yRfTCK9kc89xbPQDOU7YwwxqxLPOtTOam9nPXylwfTgQtaMCnSvRe/kwtrzk
 L/khKPloHEVNtips9KmdVFXD+terqqv6F2S/RfzMl2OluyRlka3RF1GRTnu1h1LsLYcd
 XvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PPwEeI49pnflxdKGnZ8Gfig20CEjMBpku/FXWfTvjk4=;
 b=X4kpIn4mJgVxi8EgWCWeFhPjJOhPF+0i6sfzNcSukDXjZxWHNIRFUB3KflZVzPv/+a
 CtfsgJRbIozASXnJcpUm1Ntnki0Y9mGJV2P2+/uoS5AyPKqR92OzE2H80akeQeXkIPdf
 OB1YjoAMtXhq4aVf/pl1vj0V6jb8rFtcBUNTER0P7S/23WFS8yodci+MOlvawJx8CoZg
 oicO2V6ZECWquEIRmVwtW5p9z7rx8ubEFeV+X+sNcsmLd17/C168uOtuuNN9SlPltUD4
 49cdlR3wQjb2MxVerSlQpbPQvWj0zkeEIMETvhmheFmWqt/Z55hdHp6oWYIyvc0brJaY
 Roig==
X-Gm-Message-State: ACgBeo1c3URVGXsEUrlirb8VEQgGveFVO0cVBlJXw0ahi3sYTSIPCT4W
 /AVTeUlcKkfe5mhxrQTwegiCIPIZE3mFrwsm
X-Google-Smtp-Source: AA6agR5CpiVflKh2GjW3HC8AXmszjvuEzL5phUJzZQlhZ2its7h+F5kgxNVZcU4LJG9sFBAGQ6YZdQ==
X-Received: by 2002:a5d:4805:0:b0:228:db70:6641 with SMTP id
 l5-20020a5d4805000000b00228db706641mr927930wrq.377.1662459482050; 
 Tue, 06 Sep 2022 03:18:02 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:18:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 13/26] target/s390x: Add disp argument to update_psw_addr
Date: Tue,  6 Sep 2022 11:17:34 +0100
Message-Id: <20220906101747.344559-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to update_psw_addr_disp at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 9ee8146b87..a20c3bc4f0 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -336,9 +336,9 @@ static void return_low128(TCGv_i64 dest)
     tcg_gen_ld_i64(dest, cpu_env, offsetof(CPUS390XState, retxl));
 }
 
-static void update_psw_addr(DisasContext *s)
+static void update_psw_addr_disp(DisasContext *s, int64_t disp)
 {
-    gen_psw_addr_disp(s, psw_addr, 0);
+    gen_psw_addr_disp(s, psw_addr, disp);
 }
 
 static void per_branch(DisasContext *s, bool to_next)
@@ -444,7 +444,7 @@ static void gen_program_exception(DisasContext *s, int code)
                    offsetof(CPUS390XState, int_pgm_ilen));
 
     /* update the psw */
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
 
     /* Save off cc.  */
     update_cc_op(s);
@@ -1168,11 +1168,11 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
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
@@ -2448,7 +2448,7 @@ static DisasJumpType op_ex(DisasContext *s, DisasOps *o)
         return DISAS_NORETURN;
     }
 
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
     update_cc_op(s);
 
     if (r1 == 0) {
@@ -3175,7 +3175,7 @@ static DisasJumpType op_lpd(DisasContext *s, DisasOps *o)
 
     /* In a parallel context, stop the world and single step.  */
     if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-        update_psw_addr(s);
+        update_psw_addr_disp(s, 0);
         update_cc_op(s);
         gen_exception(EXCP_ATOMIC);
         return DISAS_NORETURN;
@@ -4490,7 +4490,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        update_psw_addr(s);
+        update_psw_addr_disp(s, 0);
         gen_helper_per_store_real(cpu_env);
     }
     return DISAS_NEXT;
@@ -4728,7 +4728,7 @@ static DisasJumpType op_svc(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 t;
 
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
     update_cc_op(s);
 
     t = tcg_constant_i32(get_field(s, i1) & 0xff);
@@ -6467,7 +6467,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            gen_psw_addr_disp(s, psw_addr, s->ilen);
+            update_psw_addr_disp(s, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
@@ -6534,7 +6534,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


