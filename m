Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F46494E9
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFn-0006QS-Oi; Sun, 11 Dec 2022 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFk-0006M6-C3
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:32 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007BV-Qd
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:32 -0500
Received: by mail-oi1-x229.google.com with SMTP id n205so9090332oib.1
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8b95IT5scMPMa6HMgtE3iOPqIKnAQ1oJe1+BaYEyyY=;
 b=Lokc+qjmu1xee0mfs7Kbx92NS8A3NegIFeA7TxonGTSoX9kdNn9H3949mUF0Dl3Afn
 BlNqK0mBkekGyjensyi+ZYdcq6nfnuOcOSn7ibk9pbhHpEtOTjuzpTdNEKa9pvYNXDB5
 4OmVFDgFJORrDeg/B8nCqhOaU+8hfbJoAJNJwjH+FyWqG6GBjImtV5EFDGsL6M5KG2FC
 TPzg0lbqYSsmNoHWPoCuJKFq6U9/LthFq3GNX71EEnt7bpvR2KC9Lm/3SZ3nKpdR25Nw
 G8vQOkpZUEWqjo5gEHu1fzXeMYeCSF9EDAVXqUHqcZRGHQy1PR4oeqVdnjR5RTdtoush
 HpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J8b95IT5scMPMa6HMgtE3iOPqIKnAQ1oJe1+BaYEyyY=;
 b=tvedS/mnPrtOTjBKHh/2+bSsBs3ytpYII9EroeKj893vvuiZUZ9aja6b8lPVGYm5S2
 NffqRbLCPTosTcZVlQnb/DH5fG1j/1kikuR8+wwEkvhulUpIoI+ZL3gdN3bMJi13DuKW
 1FJGmRRLHPOAACfAhN9AjLuksXtH3Kp+VeeCrXCnwmqCZyPtuDvD2zn82VgjSGy/YhhQ
 Xue1i50Nd0PsTbZ+FWrW/Seo2dQgtpMn7qSQeOldSfCtbQoEFo99guNjs9/1UCaSEFrx
 kttXW2IPfvRq+BsiBALrKwGAyzhnbuymlFyx150tPXr9iOQhmTUUok/XyLNJMFY5MaiN
 wx+w==
X-Gm-Message-State: ANoB5pnfqEDNDD4MtMPWLINtkSOMJHwSAJcNyvQaImP1VuG7leDMdUuC
 z9yCijWIytv7dx/l+IohLGILAvb9FQSt92PsObA=
X-Google-Smtp-Source: AA0mqf7j9VMOgLBLb+3dZm548gwvpvYEe8XLt+0ObgXRhJbRk1HrJTtJ4qA0VmC6Kns3dFS6WVmb1g==
X-Received: by 2002:aca:3d89:0:b0:355:1de9:6530 with SMTP id
 k131-20020aca3d89000000b003551de96530mr4994747oia.18.1670772502461; 
 Sun, 11 Dec 2022 07:28:22 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 15/27] target/s390x: Add disp argument to update_psw_addr
Date: Sun, 11 Dec 2022 09:27:50 -0600
Message-Id: <20221211152802.923900-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index fcf0c52b8d..c7adf0d72a 100644
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
@@ -6473,7 +6473,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
         if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
-            gen_psw_addr_disp(s, psw_addr, s->ilen);
+            update_psw_addr_disp(s, s->ilen);
         }
 
         /* Call the helper to check for a possible PER exception.  */
@@ -6542,7 +6542,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


