Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE275104A0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:52:19 +0200 (CEST)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOQE-00025f-OY
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5o-000320-9l
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:15 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5k-0003rr-DI
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:11 -0400
Received: by mail-pg1-x52b.google.com with SMTP id x12so2271168pgj.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYMcPGFVOr91pPlM11FaTOiv5VUJrdzpOfUOVnmASJA=;
 b=cQeiRewYqPLG8iD0pL7VDopNqpnn6k4jiU2oa+7zWA9q26ls5CvEp+YMt3AJ+TLnkU
 WC7FGe2FkGJFUI1E9SVgy86Md9/jBBEVOImYhrw6cxxaQjcoovB9fwdtz+1yQpH08UpQ
 CXGQQxq3h1i/PP85BwFQknM5BPI4tvDYHxiPw4UPbt3GXBPtThDeRbUQCWX6izQdDwAQ
 9w/31PpDoem8aK64v2tLq8G6NTxaQTxgJz5WX6lMStDaF7JwzUjsX2w5lTgHWbdKhNls
 84FNvxDJtIXAYcj0BbvWL8TmxdxslisCoaHysLuptZhVRwpn6EHOu7C1Cu22DwkdptdO
 sCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYMcPGFVOr91pPlM11FaTOiv5VUJrdzpOfUOVnmASJA=;
 b=Ux3z/Zi+CKD5MOC7ssErDef6wodrKcQlJoygMS8hyUpYsalMq0TY00LWKOkN42FXGJ
 vsIsUZEq7Klo7Tfe8+ecEs41DCcGodCy33gaWCAGJEHo5CN1sFscp4mc1qwe2FJL9VTq
 1U9UDdVsgAddRS8D1pfmASrRDS/UBLI1KnHuPgDNBfnJTpNXIrTkZRmSVWJCJd2KqVE6
 +L7DPj21jFRc7ogBfNfvWUJiEgR7Jjg5aGNzIEVbTM863wcaYe/GDH75n0ihg8NY0X++
 TfBYgfau8XycTj7uY5o3tnX5/eQ06nFSTaR2QIzTGARoa2SyiHszGj9ijUvdOYikGLtu
 IoZg==
X-Gm-Message-State: AOAM531/ndI2RKom4rkhktukmNw8wyhbTMawa7WWNUpsXGRTemol1Z2s
 oaS2iyAGv27MfWoyQnJkJB+6KSunPXOr9Q==
X-Google-Smtp-Source: ABdhPJx7HtZW9KgRVBMLJWvIYkZkCsun/M/zQfHCzaYRGWYzdi5AGErOFhISB6UkIY0c+KNoTRi5UA==
X-Received: by 2002:a63:fd05:0:b0:3aa:127d:538a with SMTP id
 d5-20020a63fd05000000b003aa127d538amr20111767pgh.95.1650990666290; 
 Tue, 26 Apr 2022 09:31:06 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/47] target/arm: Use tcg_constant for aa32 exceptions
Date: Tue, 26 Apr 2022 09:30:18 -0700
Message-Id: <20220426163043.100432-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d09692c125..9bd1b46a52 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -346,9 +346,7 @@ static void store_sp_checked(DisasContext *s, TCGv_i32 var)
 
 void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
 {
-    TCGv_i32 tmp_mask = tcg_const_i32(mask);
-    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
-    tcg_temp_free_i32(tmp_mask);
+    gen_helper_cpsr_write(cpu_env, var, tcg_constant_i32(mask));
 }
 
 static void gen_rebuild_hflags(DisasContext *s, bool new_el)
@@ -373,11 +371,8 @@ static void gen_rebuild_hflags(DisasContext *s, bool new_el)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_singlestep_exception(DisasContext *s)
@@ -1078,12 +1073,8 @@ static inline void gen_smc(DisasContext *s)
     /* As with HVC, we may take an exception either before or after
      * the insn executes.
      */
-    TCGv_i32 tmp;
-
     gen_set_pc_im(s, s->pc_curr);
-    tmp = tcg_const_i32(syn_aa32_smc());
-    gen_helper_pre_smc(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa32_smc()));
     gen_set_pc_im(s, s->base.pc_next);
     s->base.is_jmp = DISAS_SMC;
 }
@@ -1111,13 +1102,9 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
-    TCGv_i32 tcg_syn;
-
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    tcg_syn = tcg_const_i32(syn);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syn));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1131,16 +1118,11 @@ void unallocated_encoding(DisasContext *s)
 static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
                              TCGv_i32 tcg_el)
 {
-    TCGv_i32 tcg_excp;
-    TCGv_i32 tcg_syn;
-
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    tcg_excp = tcg_const_i32(excp);
-    tcg_syn = tcg_const_i32(syn);
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp, tcg_syn, tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_with_syndrome(cpu_env,
+                                       tcg_constant_i32(excp),
+                                       tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1


