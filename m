Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5686AC585
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrZ-0004HM-T4; Mon, 06 Mar 2023 10:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrU-00046G-Ny
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:52 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrT-0002Bu-7D
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id az36so5941282wmb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HHkN0SaKlHUsXAIviWEKUhzT0wyDiiGZB3JY5pWTgTI=;
 b=dP5zC1iNrsuWI7pMVkf4zh6lHRd19MUCBb8yXi36U9PBfYVbJ5F0IPcMd8VsbMeJDg
 91ZIVtxRculFy+N08jc3Vw+GbqhAsY6ojGGERjo22ByI3v1w3nRPr4aYUeEhpZHPB71b
 TZAjct2a+LVSJTbCbuxgczvvccA9G1klDo5epPktqTF7N/fbkvtFnniLYN9c2ZezqXZS
 lkBIlSAwdyfpVOlBrFGsNKoRVJAGbQXHsnc28g+nRaZsSMCtwJK9v62S+6sXUZvUkFoj
 EEL9Vn983LAVKn1nTvqqvBVn/Kr8Uw8ZmVL0HNpBDpWPIfpNsnw6wnrDTnJLlLMZidDI
 h/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHkN0SaKlHUsXAIviWEKUhzT0wyDiiGZB3JY5pWTgTI=;
 b=n6U3d6nkjGH3zDPMpay3/RP56qGgBojCp+KO/MOGG2Gh8YIvaPlGpI/3Dj3JU9FLCK
 sCXItucH8L6MfWPVGfHG7S0ICppxhcrA1cJWQOigLDNHQuPn/G9QHqDEN9mo3V+PUSxT
 rbA1PJ5jtZ6Pi+ooyRCMusX+/MyyAz27vBiyh0749dqeAYgJOIrFpBhRsATYOTFKI3AF
 G9ajlzNJ8YWzXW8cNMfKlrikiG3EQXA08etDVyYNPz2+/4JkHJVaVPISxDA2Op2Ym1nL
 InGh4dLgw1Bf+sJnDyZahqjQf5zwIfaeKPvv7WrnkdvSD0/+RzOmQSIDYkE4OLaryLK5
 VrTA==
X-Gm-Message-State: AO0yUKWMQhegJqdSUZhCyLYFtJsxrJBzZDEHR42VyC0ETexoR07m/qUu
 kwDQ70qrMFkkB1Ijj8iK7WT9kQlpVWGqs+FJIXo=
X-Google-Smtp-Source: AK7set/qWv3hGmbXB8i/Er3t0jbJfAzAhSv4o5asSG41+1AnSL41l2xyl5ADFQTtMx0ku6Drrxc1wg==
X-Received: by 2002:a05:600c:35cf:b0:3d0:6a57:66a5 with SMTP id
 r15-20020a05600c35cf00b003d06a5766a5mr9449125wmq.0.1678116889851; 
 Mon, 06 Mar 2023 07:34:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] target/arm: Stub arm_hcr_el2_eff for m-profile
Date: Mon,  6 Mar 2023 15:34:30 +0000
Message-Id: <20230306153435.490894-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

M-profile doesn't have HCR_EL2.  While we could test features
before each call, zero is a generally safe return value to
disable the code in the caller.  This test is required to
avoid an assert in arm_is_secure_below_el3.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227225832.816605-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 82c546f11a9..2297626bfb3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5787,6 +5787,9 @@ uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 
 uint64_t arm_hcr_el2_eff(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return 0;
+    }
     return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
 }
 
-- 
2.34.1


