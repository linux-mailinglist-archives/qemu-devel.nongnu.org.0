Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C33C753E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:48:49 +0200 (CEST)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LaS-0002u9-RU
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUE-0006tn-8W
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:45987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3LUA-0005g2-Sp
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:42:22 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q10so20151900pfj.12
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YUKtvJ3DiCKvRhTAIKBYXvq8J1GX8aw6iywB1LJsnI=;
 b=l0rIJ6aR9SgmAnQvELM4MQb/VlYVcCN1vmfUj/WI0hUBacJq3T0OLKEifu69JWeO8o
 5MV72lMo6koAvkGWc1AO7KyFJcxd9fKzMTYKJUyOiueW8yqUPSxzSxSevVZqC2plBYmK
 xhbWbqFIQyzUfUNQy4hPVWe6TP6Q7iYyXUQP/F1nZXxj7HN751z9qlYgLuyDifbeX6/b
 bCL7Au+a1aBzIzQccL23uTq7rgswQ20DOw6ISCX8BWasYcL5xqhKnIBXliEBF1DfV+uM
 To/PPPYwP4jZKINpa3AtzqsXXr/mvDstuT5rCLMJ2u3Tj1duEkzXUtszhaANCAo1hNAD
 X7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9YUKtvJ3DiCKvRhTAIKBYXvq8J1GX8aw6iywB1LJsnI=;
 b=QQWoxOfkJaA+ZDXMS19O47/Uqwwf0Ghx+luf/6utx5997WnXCajNlsV7DHSGzPWger
 oWKfSJD54Ke7uh6e/ciidyWBijbQNRrtJzz7qUHIb3+5tJ1bNW3MzeJnBd3deZZXOEnt
 FYpLt6X4N+AWVsqZXQ0gqxG7KBUPqhdLoleJcEvvrnPELljFNuZ9uhlzT8K26Jq3hmwH
 psU81EA7yDlrkSFC3bN8tSYT0E8fy6DBLgfrHM4n5abVKA5BCvGkJMn9IhX3YkgmT0pG
 cj7nLDtGKuIRKS0bQ3C2HH8S2tdG80Vr7yqi9rNhdd4F71PswN23Yq3uI/aRjDwx97j2
 VaZQ==
X-Gm-Message-State: AOAM531qVVCOaZa5qBVasRdCQxg1ojifxyLM3ncJLbV7G6YbgkuGHu9f
 SQ2vJRhrRU7W2Zbt8d+vhwDnL97HUUVzXg==
X-Google-Smtp-Source: ABdhPJyr+tN6IAWNIXHUhqPX6Sp+jjPD1HBOsN3dAIItbY4IVGTzAV6/mm1cIdyGjvjOFM5tS34ncg==
X-Received: by 2002:a62:481:0:b029:31d:f010:26b2 with SMTP id
 123-20020a6204810000b029031df01026b2mr5553127pfe.2.1626194537579; 
 Tue, 13 Jul 2021 09:42:17 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z13sm4947865pfn.94.2021.07.13.09.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:42:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/14] target/openrisc: Use tcg_constant_*
Date: Tue, 13 Jul 2021 09:42:06 -0700
Message-Id: <20210713164211.1520109-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713164211.1520109-1-richard.henderson@linaro.org>
References: <20210713164211.1520109-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_* allocate and free close together
with tcg_constant_*.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 42 ++++++++-----------------------------
 1 file changed, 9 insertions(+), 33 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 37c3e3e0a3..1e3b019c59 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -129,9 +129,7 @@ void openrisc_translate_init(void)
 
 static void gen_exception(DisasContext *dc, unsigned int excp)
 {
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_illegal_exception(DisasContext *dc)
@@ -538,13 +536,11 @@ static bool trans_l_extbz(DisasContext *dc, arg_da *a)
 
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
 
@@ -632,15 +628,11 @@ static bool trans_l_jal(DisasContext *dc, arg_l_jal *a)
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
 
@@ -813,44 +805,28 @@ static bool trans_l_adrp(DisasContext *dc, arg_l_adrp *a)
 
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


