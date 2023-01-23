Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C8677CAC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx0M-0006VI-Jz; Mon, 23 Jan 2023 08:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzd-0005xd-0z
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzZ-0002Pw-Po
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:12 -0500
Received: by mail-wm1-x32f.google.com with SMTP id g10so9035016wmo.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O2uCOr2ehr+mt4R5d82Y/g2mqNmQH9GBB29ghk2KeoQ=;
 b=eLT9RpJHV7GKIfVwGnBdi9V+/TM8a4LBqNL8YHkbRCS495qSDKfUzQnPeaVaxLxYez
 Pq5w/260K8mTcM8vVmaYm/QPwlzgeS2avE3Ii05h0m8fhXEH7ZK4zm9MO/P+EmF+altb
 9qyGSnzi4wqkrEWUYbdNEYZIsqPSWoMom3WNfNlnOrDvAHfCOKtDpI/vtNBLWBCKigzm
 +KOrfS3w2VxQLm/I9V603a8MhWrpAT1WHZfeDKeytvJOHTNFpnUNqFkRmVc4oa/RIVZy
 VIBxucmyV1fGh2WpsbwD6JH+/+xEb5jswR3eAEwVSn+rhgswT7VuOng1kvswLYzDHYre
 t+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2uCOr2ehr+mt4R5d82Y/g2mqNmQH9GBB29ghk2KeoQ=;
 b=Q439i7UHDcxvvSyWIBRBKqUqVowBaVAINSmAdGW/VmPq3U9atnZHNr32H7qRakoLh1
 wgSiUsh8zqGMGWxFh5w7LAwRISGFCyQrQSEbI6iV6WcDenSH3OmEBTIeTcqfMiI1tr7D
 IFIiBjHFr8ytANpASxsacSVf5MjqmiCs/nmIPQ3I7SbVhe6D0UruXTVe7I+eGDuGbXRy
 yJVlaSlX5niSXxNkpZQD3YFvZUNSvY7B7/49wdb8wZpWQmZXxyuC1QWySrZrXWQRph0C
 QBhYkIFYj/74iUQehZK3hSsjWsjVFQZ+1FYnKJYWKhdyLndvHMPzuBkqfgDkoKzGvVab
 lUsw==
X-Gm-Message-State: AFqh2ko4fV8xtQFIeqbFa5pWgv6jJXYxliiZSA93nnsQE6J+by4CWBj3
 dgd2u/EMwUfkDbcqeedmjnGq0DC4z+bmoLcF
X-Google-Smtp-Source: AMrXdXtNb5fdoJWgWAU/Lykic6VVSBL1izAqQBAN6QEDIsqEWJDRpEsXccAynGshZtmvnsrVcQSc/Q==
X-Received: by 2002:a05:600c:a690:b0:3d5:64bf:ccb8 with SMTP id
 ip16-20020a05600ca69000b003d564bfccb8mr23567910wmb.12.1674480968424; 
 Mon, 23 Jan 2023 05:36:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/26] target/arm/sme: Rebuild hflags in set_pstate() helpers
Date: Mon, 23 Jan 2023 13:35:41 +0000
Message-Id: <20230123133553.2171158-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230112102436.1913-3-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme_helper.c    | 2 ++
 target/arm/translate-a64.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f891306bb98..b5aefa3edaf 100644
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
index 35cc851246f..035e63bdc51 100644
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
2.34.1


