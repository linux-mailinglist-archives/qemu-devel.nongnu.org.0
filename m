Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B012353F465
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:17:57 +0200 (CEST)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPjA-0006jB-Qx
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG8-0007Gz-6v
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:56 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG5-0000LU-PU
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q123so14546302pgq.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmcSScOvBsLp1FCuWvkHw14JpRNt+9SUrqF6b0wzTB4=;
 b=gQCRtQE9nY0xUiu7z6tvUqImkQerplI16gNaFXAWHVghNLiilZcTNw8bPjh5uoLZfA
 ISbeyxWKDg7wOMMO2vwDtxcf/PtuMZRkUrohtaV7MtN/GDFMFyAG5dIKyy8V65PaFGiB
 xN2/gI7wAQAqbPu4U9OHsptJnPfejfn0kDeLb3T+S/TPWghpx+jp/GkX4UfP2l4tsAoI
 QwKOIG/r1DCFZSw4kRX+I4RCkc5RMkPLS/7YxVqA07F114NsFlFukMiyz//YHWQ7S4sO
 8KKhIbAkjQKtb/DPslpCxh7QG8DyoBREO3kGuDDFAxr+aDbZMXxG/Cp/I6kN5UhGPRI0
 M/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmcSScOvBsLp1FCuWvkHw14JpRNt+9SUrqF6b0wzTB4=;
 b=pD9YPU4kBQhz4tgrGwjM6/lWjB/ZBjTIIJRvheBS/Qgne7exoxcA3QTDDMFD9wMiQR
 UjAZePaM4xJ2UQrWQ/MNVAQ2baGau0r4HvM02vQt5m1a0etOEPBA2LDO/q5l349lU5hs
 jjx62aypa9eas/fNW7UB2Q+wL4hRDP5rMZ34PNz/2lG23dOXnBOO+Va12VigJcQbrOhC
 332s5cR+6fkLJlIjcPSyAXEdfDr9Iw9HxVIpeQoaokigRfOETAJs74Lu9UQzPM8mJQul
 B3XBJ1u9sp6YBSo96DbNNYjxucRS85t1iBMRKWhouToNP77KdVEuWHxf/6VjfYyf3q0I
 7A5w==
X-Gm-Message-State: AOAM532DQWrgzqL0OQgr7J6BWTYmn358oxk581SXSjGIj9r4o8SWeSKf
 Almx4KXVVddxI+KKTjjuO10tPpxjOK2ZEw==
X-Google-Smtp-Source: ABdhPJy0R3wUgqSLUGO2kotaKYdp30CJ8fyJ88lSptwmurMw38OBGt3MXiOrjNAZ+596bLXwipXfGw==
X-Received: by 2002:a05:6a00:2344:b0:51c:157f:83d5 with SMTP id
 j4-20020a056a00234400b0051c157f83d5mr9414718pfj.5.1654570072971; 
 Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 20/25] target/arm: Introduce helper_exception_with_syndrome
Date: Mon,  6 Jun 2022 19:47:29 -0700
Message-Id: <20220607024734.541321-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

With the helper we can use exception_target_el at runtime,
instead of default_exception_el at translate time.
While we're at it, remove the DisasContext parameter from
gen_exception, as it is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/op_helper.c | 10 ++++++++++
 target/arm/translate.c | 18 +++++++++++++-----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index afc0f1a462..7c8133f83a 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,6 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
+DEF_HELPER_3(exception_with_syndrome, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 1c4e6753f6..32e2a92ff4 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -391,6 +391,16 @@ void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/*
+ * Raise an exception with the specified syndrome register value
+ * to the default target el.
+ */
+void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
+                                        uint32_t syndrome)
+{
+    raise_exception(env, excp, syndrome, exception_target_el(env));
+}
+
 /* Raise an exception with EC_ADVSIMDFPACCESS. */
 void HELPER(exception_advsimdfp_access)(CPUARMState *env,
                                         uint32_t syndrome, uint32_t target_el)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fcb6ee648b..81c27e7c70 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1097,9 +1097,10 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
     gen_exception_el_v(excp, syndrome, tcg_constant_i32(target_el));
 }
 
-static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+static void gen_exception(int excp, uint32_t syndrome)
 {
-    gen_exception_el(excp, syndrome, default_exception_el(s));
+    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
+                                       tcg_constant_i32(syndrome));
 }
 
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
@@ -1123,7 +1124,14 @@ void gen_exception_insn_el(DisasContext *s, uint64_t pc, int excp,
 
 void gen_exception_insn(DisasContext *s, uint64_t pc, int excp, uint32_t syn)
 {
-    gen_exception_insn_el(s, pc, excp, syn, default_exception_el(s));
+    if (s->aarch64) {
+        gen_a64_set_pc_im(pc);
+    } else {
+        gen_set_condexec(s);
+        gen_set_pc_im(s, pc);
+    }
+    gen_exception(excp, syn);
+    s->base.is_jmp = DISAS_NORETURN;
 }
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
@@ -9766,7 +9774,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9835,7 +9843,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
+            gen_exception(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.34.1


