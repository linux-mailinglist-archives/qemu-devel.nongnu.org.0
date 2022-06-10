Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84797546A50
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:24:31 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhR0-00036x-Kq
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAu-0007Q8-Vg
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAq-0007FJ-JC
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so2070845wms.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8YLIVLydWNjVzRNyF4UFLoObJegIT0RSiKke9n9mVm8=;
 b=aQ11h0eQVA9JcM04a7AO6YrXox7oLjWWWpShfxOoLU+sLzv2RYPXQYfVeq72VC8+pn
 CnIwhjmcg1gRkvd/lt+nQfGzX0A2QoquW8d02Mtfv++PpFKuzka8R9C7s4E+yMHLvt97
 0aA59+uiJnZxThEBEEF3DO23PP/Ky4nEDSZb5V8/XsNkqRGJYQfFK26e+BlXV4xKwGHh
 JwSn1LtOX/02LoFRfuSNka9A5m11alHqJkJxtas6UCWywskmUP88P4oLnAuJI3ToCfxR
 /VPxTCZ0OGyiRqGy+z72BjbMR74+vHg1YGr+uS6Map50wittxlL2iKt+7sqEZyKQYIvb
 yf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YLIVLydWNjVzRNyF4UFLoObJegIT0RSiKke9n9mVm8=;
 b=rsZ58MhOulL9pQo/FRTVLjGGPX8o96LS9ibzuMwfMTSh1hoQaywOpGCAGiuEFTtZA5
 x8hkdLUq9u4rLIj9JdaW2B0/wHECekklt9pxPFV723WcKD30afu7xGcCE+NiB2Ln6KsB
 bMigwYSSMCYcXf3yZ15Bgrs7RJ4SX+RoiEyQQ0FTwq6/NZsESu4foUQZNNMhzTgxjsyL
 zQAO2pys1MHLo4L0Dl7ppnZAhFh0PJhK3aJaKmhq8psSasgtOr0ZPBBDxNF0Rkkn83g8
 BzNfNYib41Vb3uAo7Cus0sUYfjtdQbRjka1AhV3gUDHiKzEzS1xHOFMisDqY389Jg3hQ
 sw5A==
X-Gm-Message-State: AOAM532Yobp1Z+OsKSJShkhJDf5LRltcq6hip7Ub76gXJi/kK8I6fZFu
 ede1SDfv7+D7QBokahUH1Yq9cMEMBX3Y3w==
X-Google-Smtp-Source: ABdhPJx5yPMkpmDeKzQmVYogVps7AsHfed+7B/2oeABnjiYtMvqxb8RsZCkz3MESKyoMvP12w1eF9Q==
X-Received: by 2002:a7b:c11a:0:b0:39c:4cd1:543 with SMTP id
 w26-20020a7bc11a000000b0039c4cd10543mr438097wmi.203.1654877267077; 
 Fri, 10 Jun 2022 09:07:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/28] target/arm: Use is_a64 in arm_generate_debug_exceptions
Date: Fri, 10 Jun 2022 17:07:16 +0100
Message-Id: <20220610160738.2230762-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Use the accessor rather than the raw structure member.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 20a0e4261ad..a18a09a0c3e 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -99,7 +99,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-    if (env->aarch64) {
+    if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env);
     } else {
         return aa32_generate_debug_exceptions(env);
-- 
2.25.1


