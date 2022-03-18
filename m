Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4394DDA72
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:25:42 +0100 (CET)
Received: from localhost ([::1]:52442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCbs-0000Vk-Rl
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:25:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZY-00067E-EQ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:16 -0400
Received: from [2a00:1450:4864:20::435] (port=46861
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZW-0002AN-S6
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id x15so11700405wru.13
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=egNinGZCQudUCLMUYQzucWN3NnejdR14NZ+qAzd3jlE=;
 b=N2le2nuK/1Dwx4XJZCROu52s3qsojLp+Ydjso8JtBHFNN7YmKYtkUszVWnux+GKH4G
 HRUMB5/Quo7yQ1vqcbG3yIviruszo4u5jsq6ohRT5hv7bfpGAJRgfR8M6P5SDbad3CTj
 TQRB/6QSWRnd58jO4i7qm4fCJ5bTiOVWckJTtty9fvg0fQbwQOW2b09WcgzjFx3bbeED
 hioFWqpXMZJwVlsL9dNlKI0uNJqHWjZ1EjxPr/GwAgvn+ofrHbtvP0o86KwC+2FM1K6X
 1MIWumUrPjjwkJxTBy99rpDMiQ5ErMc4vDa7ADA5ChMoa2eQpd3UbtdMSTj0I7FnGwQr
 QBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egNinGZCQudUCLMUYQzucWN3NnejdR14NZ+qAzd3jlE=;
 b=l5kCGENRd53hs9Uo8DrP47Yi+aWSLKCrF4ohob/5LNUvyK2pbZDPuoVuNH6moHXZLb
 HLnjQ17Kg06i7ROLol2qtnOP3DngjcvFCSO8/HNYKQjAIyE7JQIzO/EYGN+4O2PcCeB+
 wMrFKTlU3cbvSCTRwbWZiW4YYu0gkhctf0hJ8INaPzmB9Mh3ONjywmL9C5y7DQoERu+f
 6k8EBPYbar9jex06vRROa5o0x86qgfuVuuDzjeUdwsmaGowLwfhQIM07uCDhAoCeLqrG
 kIQoD/6cTIypmzRHY6OU5C+JhSsST1tAmFZcRC2i8llZw3TDz23r3xmRPl7fHafwRccb
 yQHA==
X-Gm-Message-State: AOAM531Ndrr1ONDsS+bbyJupJRaq83IzDEgJi6p46ViAC8SotvDItzzW
 ib5Ify1Q+bM0cMlkMJ9bv8F+X07RTEv7hA==
X-Google-Smtp-Source: ABdhPJzHoDjsH487dJ0SVtcIbrmvX7Ridr8cjOWUikvRvjubcilirx3z9X4X909mz6HA6k/8iSCxjQ==
X-Received: by 2002:a05:6000:1ac8:b0:1f1:f808:fb5b with SMTP id
 i8-20020a0560001ac800b001f1f808fb5bmr7914370wry.560.1647609793396; 
 Fri, 18 Mar 2022 06:23:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/21] target/arm: Fix pauth_check_trap vs SEL2
Date: Fri, 18 Mar 2022 13:22:47 +0000
Message-Id: <20220318132306.3254960-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

When arm_is_el2_enabled was introduced, we missed
updating pauth_check_trap.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where applicable")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220315021205.342768-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/pauth_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index cd6df18150b..739aa520ddd 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -390,7 +390,7 @@ static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,
 
 static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
 {
-    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el < 2 && arm_is_el2_enabled(env)) {
         uint64_t hcr = arm_hcr_el2_eff(env);
         bool trap = !(hcr & HCR_API);
         if (el == 0) {
-- 
2.25.1


