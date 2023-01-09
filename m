Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C6663130
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRq-0003CC-PW; Mon, 09 Jan 2023 15:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRm-000346-3e
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:42 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRk-0007Yi-GQ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:41 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so13994204pjj.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LthcmYqoGylcnimKyPE4SUZ0KHnZX+uAbIpucCo0mYE=;
 b=HnDKjEAbDGsmyrHt3Gsu7ysr5yTMHLwT6t87tt7Atm6lIsMQZrHV0l1qVe5l3TVwbR
 +fuQDRtoP9ewLiThFtkItitugHGUyzo7csghfAsUO3gsUgtVUEGtqVB9Q2u2h6mHX4xu
 rtx9eizzSS3YWuWPQlEuSOo26u8xhZgi5P2XjVUgaX/xfFhJm5RPhLleqG+2vqFrD6RK
 fYbHU2eRIAOu63SB/TQkvVJkFdDmRSWRDUz7lFFaBv93SvitYLUd9dC1Q0f20QmCRVfC
 KlGbVlZM/WoxLiJMDiXy5kTTz5OKyKvEOdr2I3lgcyQenCVu1j8HoplPoSAfBDLYp/rl
 SMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LthcmYqoGylcnimKyPE4SUZ0KHnZX+uAbIpucCo0mYE=;
 b=KUl1hl598SoFKSXJgB3UB/Wy8EJhw7JSGljV1l/n78YCyghxndlfmM9dvcfvSQBzDF
 RPvCHYCWq2gS/RkX8fBSpAeGDQct2712Yoha5tah9Vi6AIG/o6pkBq8Ai36DKZKtLcoF
 UahyMlcw2OQNt7BkqtDPhlun1D4cTGDYCHqUvdUHNgNzsOVWvp34UUSLhu6QYE/pvjRY
 JSOaaWtv64PSNYdUZQvJSFAQMfslG5z5OYCtWzYQ0jlgauFCT37yD/4Rn3D71fv7N0tQ
 /pw/TJM5YXMZWurvxUE7fdSA0ZEqo3k8H3zz5WWud6TudtZ/KbGCvKhiCBFUF8xwWJjj
 VUZA==
X-Gm-Message-State: AFqh2koRIFeN/aZe6RTZkh003ps6TJNFB/nmp7LI6VIVSfZ0Df+fdeVj
 fuuByAqHRVUv9a1KXSNpDy9docabBJD9KWNL
X-Google-Smtp-Source: AMrXdXvxYmgQ0IximkTQFlb6v9mO2z4BUoR4Jn/9JnHRRl3I7GXAl7tdEdSqPcobcZOQ4lpczadC8Q==
X-Received: by 2002:a17:90b:19cc:b0:226:cdcf:da83 with SMTP id
 nm12-20020a17090b19cc00b00226cdcfda83mr15747043pjb.46.1673294918825; 
 Mon, 09 Jan 2023 12:08:38 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 15/27] target/s390x: Add disp argument to update_psw_addr
Date: Mon,  9 Jan 2023 12:08:07 -0800
Message-Id: <20230109200819.3916395-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
index de2d8edb47..56e1259dc6 100644
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
@@ -4492,7 +4492,7 @@ static DisasJumpType op_stura(DisasContext *s, DisasOps *o)
     tcg_gen_qemu_st_tl(o->in1, o->in2, MMU_REAL_IDX, s->insn->data);
 
     if (s->base.tb->flags & FLAG_MASK_PER) {
-        update_psw_addr(s);
+        update_psw_addr_disp(s, 0);
         gen_helper_per_store_real(cpu_env);
     }
     return DISAS_NEXT;
@@ -4730,7 +4730,7 @@ static DisasJumpType op_svc(DisasContext *s, DisasOps *o)
 {
     TCGv_i32 t;
 
-    update_psw_addr(s);
+    update_psw_addr_disp(s, 0);
     update_cc_op(s);
 
     t = tcg_constant_i32(get_field(s, i1) & 0xff);
@@ -6475,7 +6475,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            gen_psw_addr_disp(s, psw_addr, s->ilen);
+            update_psw_addr_disp(s, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
@@ -6544,7 +6544,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


