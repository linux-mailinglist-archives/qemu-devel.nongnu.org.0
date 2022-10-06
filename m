Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875845F5FF8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:16:51 +0200 (CEST)
Received: from localhost ([::1]:55284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIJW-0000Oo-JF
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoO-0004Hf-C1
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:40 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoK-0003v3-Sr
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:40 -0400
Received: by mail-pg1-x52e.google.com with SMTP id bh13so770651pgb.4
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PPwEeI49pnflxdKGnZ8Gfig20CEjMBpku/FXWfTvjk4=;
 b=pp/G1ToJvx3UiDOLbFzNM/ljxoxZFAYoYfP7FABG+ZkY89gpzFxwRfD3H1pfgPQHX8
 Hw2k+bcmZwzAJoNUFcXlJZI9Kb2JwO1QDNUnM3IMkB5Q5Q/IArf+6B0j00bZ6hFASJPv
 Wp4BgMGXxV/J0Rxf3B3g/3pbjo7/Vp6Yl3h6xmsu1f2gY4OrV1iGBb4unlym5moM1Msf
 QYcv9H0D9z7g36mc/S3YtKkMyZLz3l5HyDiaaNU85igdD1J30GPE5T5RQb9f0nPK0oaT
 aUN5jntjO7T7DzAS/qLBBsK0w2UqpujUG/yUWdcthwmhCj8qw6na/HGPY9dAj1+0oG0W
 cPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PPwEeI49pnflxdKGnZ8Gfig20CEjMBpku/FXWfTvjk4=;
 b=6zwMBjDD6AWGzZAi3g8Yo6Jw9tpOIZysFAcdBtYz9iOfK8VSRtA1hGjHH1n67ip09r
 jk2cPyMhqPzAL/Yj1qZYBhQHQ8+s5HKn3OuEZwg20TdeEAfFj5yDKZph8Nv9I8cGeZDP
 D4R1TafDirOD5Op9w2KPzlZrn1MDwFH4Rms70Fjt+XzciRHqxq6HvQ3bhZQRKjrL6pUR
 8+xL4UV50EKrO9ef3lLn3e7qYE++W+X381Y/Z+CYRpT0gb6zimXipDQmgjWhxnv7fvnH
 +XgIaf/hScDtbiqxrImgDWw+04pDqXg+akdbvS9OzXbP6JgvM5rp+j9OsVdOcqZOtgNT
 9sGg==
X-Gm-Message-State: ACrzQf0NM9zaaNY9hhyNhn6QSeGZ71I8y4mGyVM7+2npntpYvX/jAqW1
 LM/aQCqRybZK+lBuNahrd6KVCXL5ZK432g==
X-Google-Smtp-Source: AMsMyM6gQOtbhPgxSBPjvvov2iDSBMqZl3oLr+Vlre3yO5RGUBkUwnAsDE/kYmY25IckbcHGX7rMyA==
X-Received: by 2002:a63:8a43:0:b0:44b:5c1b:6213 with SMTP id
 y64-20020a638a43000000b0044b5c1b6213mr2677862pgd.532.1665027875456; 
 Wed, 05 Oct 2022 20:44:35 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 13/26] target/s390x: Add disp argument to update_psw_addr
Date: Wed,  5 Oct 2022 20:44:08 -0700
Message-Id: <20221006034421.1179141-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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


