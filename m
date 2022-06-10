Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63402546A26
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:13:52 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhGh-00009r-DU
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB0-0007eR-BR
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:59 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAx-0007GX-RY
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id o8so9301187wro.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W07dTBQNW7oeeeU4sH2jPYDtLNExbOLEwMOKReVCqx0=;
 b=pogUj7FFpgIE3DLJ6LtegYe57oDxbkksAFlMQyRGtXRJ0Pyl62BdBDz3mOL6oLsHuv
 qGlQG5FhcKA999ffnAjUCVzjz2PEcOusiBeEuv+eZOVukDNj5fSKT7Zf3pA5E9DanRld
 eQD+g+l2ugRGsU1/nKjKPHHTFVumKZNYLIEYPbemOQy7cdXA75kZBewYOaKcnO+HqRPa
 k9Tv/et+0qCCGShMwB3974Ek/7KGoKnpnXF/k+oXIbwzcscp4x8z/QryO96crKaucUt0
 ZoebkdKtHNWuLd4TMaqHxyiNSTE9zsTIrQmMkFd4mNEvbKBFNVPIFAknf0KMvk3rc0t2
 zhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W07dTBQNW7oeeeU4sH2jPYDtLNExbOLEwMOKReVCqx0=;
 b=D9wTdNL+oX/gnd4b4POkf7+4h3Tm1qmFwpWb5msYdeJhwfBpiUI+Y16oB4pl6z7gyV
 XjazKzasEB5745lxTaCOWL6IzeaoqMwbD4BC8atSgezsRBUbtN0dDmu5e6IMv+eObhGL
 5V2L1SDNcO6znMV1ilgrMuyRj9STvaqcXhb2FauSrT4jNZWdNNzUMpT0cgofnVQR0AIp
 f44xwHcIAG+OK50sdIAYt/f0Jn6JoN5+/wAg8YJYdoGJfVUM37FMQyFNmsbaKsZOUBJd
 vfWY0X8a7kk4Rdwl9BnNqtdcxOIlXGobzaVybT9GV9imTnWmA+JWechtSUCIGUj9IhvI
 cVFw==
X-Gm-Message-State: AOAM532CX1Hz0E9oSRisVnJqvTq4qOwK17K3b8LMiutLOs2wJZv3nk+M
 B7e2fMVBo6biqQZXVuQai8CWpedT5+RRUA==
X-Google-Smtp-Source: ABdhPJxEW6NaEAEjhwN9oFSAIYfusi969mS4hKQhA4BVeaoiZU94AnX4X0VviZEIjYP3fON8eZg0cg==
X-Received: by 2002:a5d:6d51:0:b0:20c:e06f:702b with SMTP id
 k17-20020a5d6d51000000b0020ce06f702bmr44376796wri.502.1654877274345; 
 Fri, 10 Jun 2022 09:07:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/28] target/arm: Move gen_exception to translate.c
Date: Fri, 10 Jun 2022 17:07:25 +0100
Message-Id: <20220610160738.2230762-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This function is not required by any other translation file.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-16-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h | 8 --------
 target/arm/translate.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 8685f55e800..850bcdc155e 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -328,14 +328,6 @@ static inline void gen_ss_advance(DisasContext *s)
     }
 }
 
-static inline void gen_exception(int excp, uint32_t syndrome,
-                                 uint32_t target_el)
-{
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
-}
-
 /* Generate an architectural singlestep exception */
 static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b8a8972bac9..fc5eafaeeba 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,6 +1086,13 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
-- 
2.25.1


