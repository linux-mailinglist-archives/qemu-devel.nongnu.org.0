Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC340A251
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:06:26 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwu1-0000XT-Ad
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6s-0001rp-EB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:38 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6i-0007uJ-Nz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:35 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m26so10466040pff.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+0sgCxOdolMNjFYboo2+rb9fzTAFWrxEbgs0I10CXs=;
 b=nswjcPgYp5HpLo+cQj7GJTNhHfOZdH3RjjKFIfFB89pIGQVtDZ5hnejroYcdJ/S0aG
 i3MZDSWr21e5l8WEr8A+NiQBq5LFRarRm07RHOQ3myz1YFLj3wVIdsLrOOFba7kSgr6w
 W5xETqm/xGNc66ykm8p9fP+RsopcbcC1oOzrEIKtwUNloX9nw2rw0LVEhK8DZsEyp00H
 1S50UNVTR3qVHLtq6inPWbxpqcefHfReF+0n1fFwULzGZv9tzPxAPERcuvNzu4A05vO+
 9+z96vh/cnb+oOfqFHLxqX25Rmlk97iEcBtgghdRvUuxfGzD48ZvHGza0/S8OcTUMraV
 CANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+0sgCxOdolMNjFYboo2+rb9fzTAFWrxEbgs0I10CXs=;
 b=Fv4/nwY8O/+pqAswuq5Y1916G1HDXNUT10dD8GG3agnwvLmrA3qY3uIIRFXjtTT4Lj
 cAzqEUSljxra0NHYdDw9xsv+gq18BuxIp5jwkDMQt05LzBoCJ9IZcyJL5tBTw5EYlUPV
 iGlpjdFi+9YLZFrXjb9R+XPYS+qATuupLaLevLDHTJcvclIgz9K94ikFmWzzqyCqyT4B
 dmcwOesccS9BycjGi94tk86cNw06ySXZZApJsw2bpDI7bYJY06ENcewx4kigFdtQV5Hb
 cK7fGP9ZLvUIVG4LaKWgEs08/rF46YEn2oXZieX4dcZoHDBeze4wSU0Xrc8IFHt5/EfO
 61kg==
X-Gm-Message-State: AOAM530/5fXilxRNissnHuK6nWoB/fSagThsB/DrgNNbz0NJoX8r6umR
 3YUMTGmIH/oUYxed6IRkPcQq9AisjKfHyg==
X-Google-Smtp-Source: ABdhPJw7taGQGP/scYKAmOaZvtJW+Hkyedls2QxPD0nXXEWKmx70WQsvn8cyYaTWfdW6vrLO3h1PoQ==
X-Received: by 2002:a63:1902:: with SMTP id z2mr13324276pgl.312.1631578524478; 
 Mon, 13 Sep 2021 17:15:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/44] tcg/arm: Simplify use_armv5t_instructions
Date: Mon, 13 Sep 2021 17:14:49 -0700
Message-Id: <20210914001456.793490-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the Arm ARM DDI 0406C, section A1.3, the valid variants
are ARMv5T, ARMv5TE, ARMv5TEJ -- there is no ARMv5 without Thumb.
Therefore simplify the test from preprocessor ifdefs to base
architecture revision.  Retain the "t" in the name to minimize churn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 18bb16c784..f41b809554 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -28,13 +28,7 @@
 
 extern int arm_arch;
 
-#if defined(__ARM_ARCH_5T__) \
-    || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
-# define use_armv5t_instructions 1
-#else
-# define use_armv5t_instructions use_armv6_instructions
-#endif
-
+#define use_armv5t_instructions (__ARM_ARCH >= 5 || arm_arch >= 5)
 #define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
-- 
2.25.1


