Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586303C1B29
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:44:03 +0200 (CEST)
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1boQ-0006Zc-B5
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1big-0008Qt-Ly
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:06 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1biY-0008LN-4r
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:06 -0400
Received: by mail-pg1-x52a.google.com with SMTP id w15so7732123pgk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YI+k1eDoSKwErLE0nkT4pwOAj5SV9AI2zjTOQ0y/Zv8=;
 b=lmzBocxvevDSY0OTN0mZZ5wg5Un1YYty6ezpRhfp6Cen7PSVuOCQGoOgEJStMxUjPJ
 6rxw3iQh/ohEzsMpaW/yeskDPbbkCYZd/T5P2q/+fTj6ceVkM7fypZLr0FbI4y9u3cyP
 kngRJM44khlf9ulyQgKNK8MgE9nlhxqw9fmO3Bwzwtx2mmjBomW/rZHnrU7ubGBj902g
 /YOCYCoP8561+Bvoj9VLqtWjl7OPZBVJBGPzxJ3DbrYilRhKJwRNVjn5XMLkoiRUMRqD
 X4RRjFEU3SYUPgF53gOWcE37yBc2JYmeWL99D8/kfeRjAuWzUTHz89JhYYr7yNUkhoPP
 rw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YI+k1eDoSKwErLE0nkT4pwOAj5SV9AI2zjTOQ0y/Zv8=;
 b=l7nEeemo0MHv0b+u83evOmqtlvzInXEMZbZ0nR754iwqSBqn648XjsSZIEsYQ3uLRb
 7bHuerqMJrWcVMuVc4EtMDGWd+tGJJvD3d6nuS+sLaJuH61I9nFWldQMdDlFSk7hqokt
 x3cS0cR/+qXPS7YMcWJuG7ne3LVnWmV6VsNeIzYWDCozSaGFh3CNRtkrDkFX21V6GOIp
 2iEtCAhFSz/Y6+tQIXzLodwAlxmMtn03EPm/pB9s0dCz+xjlYerZ/bcM3aJUuRHDG+kA
 CldA20x5v7i8xh896TeNEA1O6SfJinmrJxL1MCV0mYsSpJ0ihCR4zszUtov9WLMTpLZl
 WGpw==
X-Gm-Message-State: AOAM531ZeCE4Lxq3voj3ADzCYjAM0lXAYVrMrSbu10p3pnMOiAhLHsr6
 WCqIE2X7LBpGsdJdTpzdaDfSO/D6Iz18Lw==
X-Google-Smtp-Source: ABdhPJx7HHc02YWmTNP14jJ7m2Iaz8/aj/2COuBV9q+ZtyTciEzKRjaKZjnzwG8NBTrCLTuRnyC4Vw==
X-Received: by 2002:aa7:848a:0:b029:305:a6bf:f8ea with SMTP id
 u10-20020aa7848a0000b0290305a6bff8eamr33867433pfn.20.1625780276618; 
 Thu, 08 Jul 2021 14:37:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g27sm4322800pgl.19.2021.07.08.14.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:37:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/openrisc: Use tcg_constant_*
Date: Thu,  8 Jul 2021 14:37:51 -0700
Message-Id: <20210708213754.830485-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708213754.830485-1-richard.henderson@linaro.org>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* with the allocate and free close together.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 42 ++++++++-----------------------------
 1 file changed, 9 insertions(+), 33 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a9c81f8bd5..1e437d2f9d 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -130,9 +130,7 @@ void openrisc_translate_init(void)
 
 static void gen_exception(DisasContext *dc, unsigned int excp)
 {
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_illegal_exception(DisasContext *dc)
@@ -539,13 +537,11 @@ static bool trans_l_extbz(DisasContext *dc, arg_da *a)
 
 static bool trans_l_cmov(DisasContext *dc, arg_dab *a)
 {
-    TCGv zero;
+    TCGv zero = tcg_constant_tl(0);
 
     check_r0_write(dc, a->d);
-    zero = tcg_const_tl(0);
     tcg_gen_movcond_tl(TCG_COND_NE, cpu_R(dc, a->d), cpu_sr_f, zero,
                        cpu_R(dc, a->a), cpu_R(dc, a->b));
-    tcg_temp_free(zero);
     return true;
 }
 
@@ -633,15 +629,11 @@ static bool trans_l_jal(DisasContext *dc, arg_l_jal *a)
 static void do_bf(DisasContext *dc, arg_l_bf *a, TCGCond cond)
 {
     target_ulong tmp_pc = dc->base.pc_next + a->n * 4;
-    TCGv t_next = tcg_const_tl(dc->base.pc_next + 8);
-    TCGv t_true = tcg_const_tl(tmp_pc);
-    TCGv t_zero = tcg_const_tl(0);
+    TCGv t_next = tcg_constant_tl(dc->base.pc_next + 8);
+    TCGv t_true = tcg_constant_tl(tmp_pc);
+    TCGv t_zero = tcg_constant_tl(0);
 
     tcg_gen_movcond_tl(cond, jmp_pc, cpu_sr_f, t_zero, t_true, t_next);
-
-    tcg_temp_free(t_next);
-    tcg_temp_free(t_true);
-    tcg_temp_free(t_zero);
     dc->delayed_branch = 2;
 }
 
@@ -814,44 +806,28 @@ static bool trans_l_adrp(DisasContext *dc, arg_l_adrp *a)
 
 static bool trans_l_addi(DisasContext *dc, arg_rri *a)
 {
-    TCGv t0;
-
     check_r0_write(dc, a->d);
-    t0 = tcg_const_tl(a->i);
-    gen_add(dc, cpu_R(dc, a->d), cpu_R(dc, a->a), t0);
-    tcg_temp_free(t0);
+    gen_add(dc, cpu_R(dc, a->d), cpu_R(dc, a->a), tcg_constant_tl(a->i));
     return true;
 }
 
 static bool trans_l_addic(DisasContext *dc, arg_rri *a)
 {
-    TCGv t0;
-
     check_r0_write(dc, a->d);
-    t0 = tcg_const_tl(a->i);
-    gen_addc(dc, cpu_R(dc, a->d), cpu_R(dc, a->a), t0);
-    tcg_temp_free(t0);
+    gen_addc(dc, cpu_R(dc, a->d), cpu_R(dc, a->a), tcg_constant_tl(a->i));
     return true;
 }
 
 static bool trans_l_muli(DisasContext *dc, arg_rri *a)
 {
-    TCGv t0;
-
     check_r0_write(dc, a->d);
-    t0 = tcg_const_tl(a->i);
-    gen_mul(dc, cpu_R(dc, a->d), cpu_R(dc, a->a), t0);
-    tcg_temp_free(t0);
+    gen_mul(dc, cpu_R(dc, a->d), cpu_R(dc, a->a), tcg_constant_tl(a->i));
     return true;
 }
 
 static bool trans_l_maci(DisasContext *dc, arg_l_maci *a)
 {
-    TCGv t0;
-
-    t0 = tcg_const_tl(a->i);
-    gen_mac(dc, cpu_R(dc, a->a), t0);
-    tcg_temp_free(t0);
+    gen_mac(dc, cpu_R(dc, a->a), tcg_constant_tl(a->i));
     return true;
 }
 
-- 
2.25.1


