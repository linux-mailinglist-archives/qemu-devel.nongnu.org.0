Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E86E677C9E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx04-0006Hy-IB; Mon, 23 Jan 2023 08:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwze-0005y0-VJ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzc-0002SC-HK
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so8562774wms.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZXJTKTj4JLVkfDaqWL6JD9NCI4CqzwMFAUaoEHUCTnY=;
 b=LCqb+Q3kWHuuK2NSBE+7jCobx112B7Mrc+nhiy3HroRLMkXGZm0VIO9Mv0Uip/btGD
 3LAOA20kRwF/K37kMmdUORE+9Gv7JRQ8HHBYrUVYFGNLN3Hy3D1B9lgWZ7a6wFhOThnt
 maB92wyhIj+P9FD3hkHCIkSopp/NCwxnCn2Ut4ixFBVIsIw7fiAKkgxrP+F6R8LXLogV
 n98CODzQ6vjEC3vdeoxwX2e4Ugtgt2ASwV2QF/a5bYK7bMCUZBo/4rKjc+e/1jR4u9Pk
 0jER1WW+UHmfCilQyryGbIBdmFUB3qk2zev5Iom+91Km+yxZMG+IApqHhkjfs1ZCVPXO
 CdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZXJTKTj4JLVkfDaqWL6JD9NCI4CqzwMFAUaoEHUCTnY=;
 b=DWWkTDDT+g2o3XUlEZYEoGWdEbawlxkVeV0aWr+zceH6jmfvjjNlc4ZgLMoI1gia8c
 iANKKgN5r+kqekP+p9mVaIN3nFlbnwm+VvtB5+J9jtppm5Qrds2PbcRCJRbUHp1BO1w3
 GaXzPq+FXqt6+GjHBcg6sucLNC16fHvA8FAQIfnAMYK9bkQQVV8FaqxLIV6tOiIGc/59
 70LzzCbdKAYeQjK9/5zf9fnE1eonfDhqvGKMmVULY9Ip31j7V7u2Z8ZQDbuG7xH3my/F
 bcH99qMbREKCKRH+UziAYwFDU3Mh1AVELLkGcYRPECRMUUiWEwf8eGBBvxQOMg+OwhI7
 WqJQ==
X-Gm-Message-State: AFqh2koQdOyyAsS1YHZjEG2kcoo1dsJh9Z4xLo3Y4iMUELFqHs2ycw0W
 vbD4LE4Y3ctEzVRePi+N97U4GsqvEm3vBur+
X-Google-Smtp-Source: AMrXdXu0zGSAzUoSm1a+uzDsK/4tQd+kbGXSBnhR6jsW84lDtyHUneeBkS3Z9SVjgtb8CSIkhWMecA==
X-Received: by 2002:a7b:cbd6:0:b0:3db:622:4962 with SMTP id
 n22-20020a7bcbd6000000b003db06224962mr23984290wmi.21.1674480971019; 
 Mon, 23 Jan 2023 05:36:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] target/arm/sme: Reset ZA state in aarch64_set_svcr()
Date: Mon, 23 Jan 2023 13:35:44 +0000
Message-Id: <20230123133553.2171158-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Message-id: 20230112102436.1913-6-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c     | 12 ++++++++++++
 target/arm/sme_helper.c | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0ac867c4119..564c5d93320 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6743,6 +6743,18 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
     if (change & R_SVCR_SM_MASK) {
         arm_reset_sve_state(env);
     }
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (change & new & R_SVCR_ZA_MASK) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f73bf4d2853..e146c17ba19 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -44,18 +44,6 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
         return;
     }
     aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
-
-    /*
-     * ResetSMEState.
-     *
-     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
-     * on enable: while disabled, the storage is inaccessible and the
-     * value does not matter.  We're not saving the storage in vmstate
-     * when disabled either.
-     */
-    if (i) {
-        memset(env->zarray, 0, sizeof(env->zarray));
-    }
     arm_rebuild_hflags(env);
 }
 
-- 
2.34.1


