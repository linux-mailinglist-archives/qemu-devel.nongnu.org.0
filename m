Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA44681C57
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:07:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGM-0000Jv-TK; Mon, 30 Jan 2023 16:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGF-000057-8o
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:19 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGD-0005UI-6n
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:18 -0500
Received: by mail-pf1-x431.google.com with SMTP id u5so8436874pfm.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0u20gsf2ENiHja2ejvMJsVNYAIujBWIKn6lzC+qXv58=;
 b=uZh52Yit3q/NgpfSk7mgTwW87hiVDkYm17t9NenGgpLg2BVHVyAfpSOMnmBatjon4Z
 3M7pRKmfiwrMnQfIHLmGDetcyAVx+NQL491zmZ8LgSp45nWD6oPe6HPt3OaRaO1IFoGR
 QQILZv3vVKbrTZSvRUmmq3XoOuMQ32t2Zf7ftrmUdxPeQyQ/7gOd4P3BeSMNUSZ9CeyD
 35P8Mqgaz7BdiBDKH5gKLBFwkERKnAYLOc05HqmQ3hY9k8iMqMXsv2el1IupioCxU6Y4
 eqOEiUeJJDMbiE/THrgeHhym0mH54E4jwPvAhn3gMGe6Tj1EZplJZNaDrBjul0aU25y6
 MlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0u20gsf2ENiHja2ejvMJsVNYAIujBWIKn6lzC+qXv58=;
 b=qwYNAMhm7DtzD1plqKj6vL8+KVTkTOgRBSIjJB+R3sVAoIYpTmzdnwyzIOzi05bZAF
 pNH7h0SsK3T9LRbkJTupkRYWySuBUQpb8LuWUefQss4K3lF5d/k7521WdWYWUs2oFDLD
 X3bRB4dpQMI8lDlgLbdGu2yZwIu6NxCKloRan/BtKIgZIb6GvBXah9WYyaMmkaIhkg2r
 jFEArxEE/MmYGu+tuJw2z8OsXzLLtuW/2Pcqa3mkXnoF6I/0ZWTf9LdzPEO8DUoA3mr0
 hFWSLjXaOtsARTijXe+vJt0hOvcwOUcDGTRLwOkygsrAqUA5KbFYo7WqGUU/Luh9xbkP
 QYtw==
X-Gm-Message-State: AO0yUKVJ6fKzn/kaLS16l/186Z2c2hgLSuKNS3LQq4+Xrw6udJTmpKU4
 gVJcBL41aTJi+BHES/i7nAJKPp7F4V4mUaOE
X-Google-Smtp-Source: AK7set+RpPjNaVQWEkW3SfCzMRRo3J/TdoAn821825rnCRiZUHtbiw2XqsLslOglgTpwmvoo89nBGg==
X-Received: by 2002:a05:6a00:2289:b0:592:fc9f:8ae5 with SMTP id
 f9-20020a056a00228900b00592fc9f8ae5mr12808835pfe.23.1675112414350; 
 Mon, 30 Jan 2023 13:00:14 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 21/27] target/i386: Don't use tcg_temp_local_new
Date: Mon, 30 Jan 2023 10:59:29 -1000
Message-Id: <20230130205935.1157347-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Since tcg_temp_new is now identical, use that.
In some cases we can avoid a copy from A0 or T0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a47d60f057..baf1cfc2bc 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3426,13 +3426,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 if (mod == 3) {
                     goto illegal_op;
                 }
-                a0 = tcg_temp_local_new();
-                t0 = tcg_temp_local_new();
+                a0 = s->A0;
+                t0 = s->T0;
                 label1 = gen_new_label();
 
-                tcg_gen_mov_tl(a0, s->A0);
-                tcg_gen_mov_tl(t0, s->T0);
-
                 gen_set_label(label1);
                 t1 = tcg_temp_new();
                 t2 = tcg_temp_new();
@@ -3444,9 +3441,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 tcg_gen_brcond_tl(TCG_COND_NE, t0, t2, label1);
 
                 tcg_temp_free(t2);
-                tcg_temp_free(a0);
                 tcg_gen_neg_tl(s->T0, t0);
-                tcg_temp_free(t0);
             } else {
                 tcg_gen_neg_tl(s->T0, s->T0);
                 if (mod != 3) {
@@ -6248,13 +6243,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 #endif
         {
             TCGLabel *label1;
-            TCGv t0, t1, t2, a0;
+            TCGv t0, t1, t2;
 
             if (!PE(s) || VM86(s))
                 goto illegal_op;
-            t0 = tcg_temp_local_new();
-            t1 = tcg_temp_local_new();
-            t2 = tcg_temp_local_new();
+            t0 = tcg_temp_new();
+            t1 = tcg_temp_new();
+            t2 = tcg_temp_new();
             ot = MO_16;
             modrm = x86_ldub_code(env, s);
             reg = (modrm >> 3) & 7;
@@ -6263,11 +6258,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 gen_op_ld_v(s, ot, t0, s->A0);
-                a0 = tcg_temp_local_new();
-                tcg_gen_mov_tl(a0, s->A0);
             } else {
                 gen_op_mov_v_reg(s, ot, t0, rm);
-                a0 = NULL;
             }
             gen_op_mov_v_reg(s, ot, t1, reg);
             tcg_gen_andi_tl(s->tmp0, t0, 3);
@@ -6280,8 +6272,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             tcg_gen_movi_tl(t2, CC_Z);
             gen_set_label(label1);
             if (mod != 3) {
-                gen_op_st_v(s, ot, t0, a0);
-                tcg_temp_free(a0);
+                gen_op_st_v(s, ot, t0, s->A0);
            } else {
                 gen_op_mov_reg_v(s, ot, rm, t0);
             }
@@ -6304,7 +6295,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             modrm = x86_ldub_code(env, s);
             reg = ((modrm >> 3) & 7) | REX_R(s);
             gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
-            t0 = tcg_temp_local_new();
+            t0 = tcg_temp_new();
             gen_update_cc_op(s);
             if (b == 0x102) {
                 gen_helper_lar(t0, cpu_env, s->T0);
@@ -7052,7 +7043,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->tmp2_i32 = tcg_temp_new_i32();
     dc->tmp3_i32 = tcg_temp_new_i32();
     dc->tmp4 = tcg_temp_new();
-    dc->cc_srcT = tcg_temp_local_new();
+    dc->cc_srcT = tcg_temp_new();
 }
 
 static void i386_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.34.1


