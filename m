Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868F666FBA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:33:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFulS-0002jw-Q3; Thu, 12 Jan 2023 05:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulQ-0002jF-FL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:52 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulO-0000HK-UK
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso14616456wms.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQhBH/U1Fypgm54dLIg4D6CrvEvSuf6an15qZZ2LS2o=;
 b=Kh/Pmc/t8Mt3X0WW8iYSqNAwqT3eTgLPLAtevcyUCZmDyKRh8sfjYmR7tSpQK/KMB8
 FiTm6M8bhNii4pXYP1MnnbeVCKZt3JTm5oT4iGjt7lBuBfD1I7Ns4KVzlEle/OG2d5kQ
 BKKQeqtJ9B8rl3APvyxYjZ4oo/JPPGppcK73DA/94FNSxxi2iDVURpSsQU3HhBc981rp
 LNeKarluVZUCeFKHAtvOZDvQXGygSRFK1PaTwXVg4s7n7KdzJRHi1PtzRCwKsQx6TejA
 +0bcrduWm6SaNMCIx3tcKVIRx36FP0eyKGXjKpO6voPMOm2eEaaxR+bPBpnEqM6KHRVb
 xGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQhBH/U1Fypgm54dLIg4D6CrvEvSuf6an15qZZ2LS2o=;
 b=RYxGxwZJUeF5PYDKtdSwjMPuvPOYtzNpU98Mwjz5duwGVcYz4dEGDvFcKN6oJ6T06v
 rnqvXeFXLSWvxWSBTB9X865WABOPp8/hp6sic9wvLUp5orLhBSoqhkuJ6v9iwkZUoCb5
 I/XExyWjxRQkwyHFyh6lCEIo7j1FUiU4v8rhLAR/T1EoJ6Z9ieTVgqxVphTeLHBpR+Ts
 7xDfUTi0CyYmB6pscCrru7/D+7eKJ0SsAd4zvnpvRmn9BUjevj2zpdkDCd+bdOFP8R0j
 zpcSFRN8TW6sdf/Ouj+dcomj4kcxRLRFNx2uY9RVSLNxEUIqmX6hqqd55MEaDbWBsChl
 3Zvw==
X-Gm-Message-State: AFqh2ko9XC9/nka46DuqF7CqbOGqZzdcFNlwqXQwm2xGRNQWL4sNrnAd
 X1Un4ahX7qQXPcrJBP/5kb5EZmdzDePtIWyn
X-Google-Smtp-Source: AMrXdXs9MTl9Z5cYBqZqfbUR6PZFgyw1fMQLn1E/ZvqFw8Ta1YF+ZQpDyTr88RsgXX2PJOLwXXWNFg==
X-Received: by 2002:a05:600c:35c8:b0:3cf:85f7:bbc4 with SMTP id
 r8-20020a05600c35c800b003cf85f7bbc4mr55110871wmq.2.1673519089135; 
 Thu, 12 Jan 2023 02:24:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d96efd09b7sm30373648wmp.19.2023.01.12.02.24.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:24:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/7] target/arm/sme: Rebuild hflags in set_pstate() helpers
Date: Thu, 12 Jan 2023 11:24:31 +0100
Message-Id: <20230112102436.1913-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/sme_helper.c    | 2 ++
 target/arm/translate-a64.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f891306bb9..b5aefa3eda 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -45,6 +45,7 @@ void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
     }
     env->svcr ^= R_SVCR_SM_MASK;
     arm_reset_sve_state(env);
+    arm_rebuild_hflags(env);
 }
 
 void helper_set_pstate_za(CPUARMState *env, uint32_t i)
@@ -65,6 +66,7 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
     if (i) {
         memset(env->zarray, 0, sizeof(env->zarray));
     }
+    arm_rebuild_hflags(env);
 }
 
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 35cc851246..035e63bdc5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1855,7 +1855,6 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
                 if ((crm & 4) && i != s->pstate_za) {
                     gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
                 }
-                gen_rebuild_hflags(s);
             } else {
                 s->base.is_jmp = DISAS_NEXT;
             }
-- 
2.38.1


