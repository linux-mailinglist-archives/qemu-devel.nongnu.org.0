Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB33A54560B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:54:06 +0200 (CEST)
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPAL-00038o-Qh
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmM-0003uu-V5
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:18 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmH-0008TY-1A
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:18 -0400
Received: by mail-pg1-x534.google.com with SMTP id q140so7805465pgq.6
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDOWLCpGVLLdjCKXH6PsNmxsJeThW1Pjgc0CFkMFbWw=;
 b=nnhX+QxLssQskHldmsxbJZFqx+lkz84X5rZ1vOBOHQ2pjDJiFiWZellsTVExZMobHk
 cDXOR5ik8Z4Z3clh027+HkNEvg2mAsd9qtqynm0T+IIOIZwDB05/99hPJx+ZpAAjwLAg
 fd+7RyzvvuUlVZE2YCrnZmJnKmOLIPPM8Aqrn7xKp7yA571Hi4At7YvATcQNMUNqxs9P
 NGbsYjuFwPxWJTmd2ztVzTRqovfPIrGNlvFmUhhogeAw4mxmIyiWs82hqxgLzx+E07AB
 sahLkbACYeuB6wroh6nY2XUaP2P96IEvfZvuQvrbmTVWpnaU/aEYP0XlkLdVgWg190p2
 cMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDOWLCpGVLLdjCKXH6PsNmxsJeThW1Pjgc0CFkMFbWw=;
 b=vu0ts8BcXQ9P098U/xNfklWysTrbCuH0z3vafCJ5auuni7371NkO8a+sze4v8IzGHx
 0RYfZclM4KjTOBJU67cyio9E9Z8Vkm06aP3ec9nVGpJUvgAJ2MUZdTxZApBQ6wrp4Nwv
 M0KzcLvjkL6wfPwbODRsNJKeVjc5HociOvwgfLfFi/FYsyHEx3qPnKW5j6qG9ecWcul+
 3P2FmDXM6pfft2DnPES9Xa4t50+aQzWIf1pNgZcCGEiv3VshRxmE90spiEUfgg2jDdFd
 ZyW0ml77h8gLq4imNUMaOQhvKpJ3T4NczreFuJ/478sSC2QAOXJ9dGUzVIzubwU/8sU9
 nosg==
X-Gm-Message-State: AOAM530hg7PXP75X7GVVawLC2zjaJqUS3F7njFXZuUC3nrTWnC8fLyed
 dyCn3xlgFVrYlRJtVhDCw6oqVEIP+iVifw==
X-Google-Smtp-Source: ABdhPJwhswmxSNy0WYbI81Clkz+OaUCLFjpXJx88Pnhk97uBelV3xb8VxO2AvS6O8hVyq9x5ROElFA==
X-Received: by 2002:a65:4304:0:b0:3fb:9303:de99 with SMTP id
 j4-20020a654304000000b003fb9303de99mr37063178pgq.429.1654806551500; 
 Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/23] target/arm: Introduce gen_exception_insn_el_v
Date: Thu,  9 Jun 2022 13:28:48 -0700
Message-Id: <20220609202901.1177572-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Create a function below gen_exception_insn that takes
the target_el as a TCGv_i32, replacing gen_exception_el.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc033600c0..9cb31663dd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,8 +1086,8 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
-                        uint32_t syn, uint32_t target_el)
+static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
+                                    uint32_t syn, TCGv_i32 tcg_el)
 {
     if (s->aarch64) {
         gen_a64_set_pc_im(pc);
@@ -1095,10 +1095,17 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
         gen_set_condexec(s);
         gen_set_pc_im(s, pc);
     }
-    gen_exception(excp, syn, target_el);
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
+                        uint32_t syn, uint32_t target_el)
+{
+    gen_exception_insn_el_v(s, pc, excp, syn, tcg_constant_i32(target_el));
+}
+
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
     gen_set_condexec(s);
@@ -1114,17 +1121,6 @@ void unallocated_encoding(DisasContext *s)
                        default_exception_el(s));
 }
 
-static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
-                             TCGv_i32 tcg_el)
-{
-    gen_set_condexec(s);
-    gen_set_pc_im(s, s->pc_curr);
-    gen_helper_exception_with_syndrome_el(cpu_env,
-                                          tcg_constant_i32(excp),
-                                          tcg_constant_i32(syn), tcg_el);
-    s->base.is_jmp = DISAS_NORETURN;
-}
-
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 void gen_lookup_tb(DisasContext *s)
 {
@@ -2847,7 +2843,8 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
                 tcg_el = tcg_constant_i32(3);
             }
 
-            gen_exception_el(s, EXCP_UDEF, syn_uncategorized(), tcg_el);
+            gen_exception_insn_el_v(s, s->pc_curr, EXCP_UDEF,
+                                    syn_uncategorized(), tcg_el);
             tcg_temp_free_i32(tcg_el);
             return false;
         }
-- 
2.34.1


