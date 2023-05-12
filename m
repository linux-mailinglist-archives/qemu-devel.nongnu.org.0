Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A9700C03
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:37:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmx-0003JG-Tg; Fri, 12 May 2023 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmr-0003Gj-GT
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmp-000609-OU
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f475366514so26006345e9.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905666; x=1686497666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3kxMyAH7DEu9p7Eb72s1jRjc73fovhzyjF2BxfQDUZY=;
 b=fTSw3C4Ht9XJyF93hxmbmlHZkCr3sK5FbVww9cDypT17FbAG6vYHJAC3agAOeahj1J
 yA+CHODmGEQjKeHWsTW2oHFxzoEZzpTb49gMfSYJZINu0g5JwZO62hzGJmh1t51+thc6
 tC7DkONdzI4M1IDX2Xo8QwOr7NP+bQR6KT2Xf3MU3/m1nNpnIyeTaGBp6gJYvB2Ldllo
 SuROXKGkpsO7JpEvPgOsUj91iD4GjbLMe/VU1h8uSCnrM5wEYZfULmZg1Zw2LgHIR4aJ
 TbSSV0Spa0WOiFaQqYiKD+Xk10YkhS3rVSBg5E4sce9QHve+1uXv8Rg2IM+uT+fuOyUe
 rUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905666; x=1686497666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3kxMyAH7DEu9p7Eb72s1jRjc73fovhzyjF2BxfQDUZY=;
 b=fV01+82Mp+3RB0b0bJWJJEgjLk9KlwGvzld26zUcYV2efIT3fnDUV90KYrg4HuVRCd
 vFft3JJOJFOhz/h7WxQl0uIm88ZvgVXLrzZCYwMHyC4ebzTYKDSjnLrnfuu7zRpismwU
 MNCntC4OUdiZor4MTBk/IvfXtgsXr1Y+AFZ8IYYr4BtC/VfPhW/6b6DUzMZuVTLHH7xh
 7BKHZ528oEasQ9Z5g9oSaY6Pt+46QZR/e1BryPHmaZ/4Mub8fCv1vALfTfCDuHjle8lP
 jPJ0UqnjnDfM2TZFKcIURrst7oFP//YV1oXhGnLBUog8FObh6OSkuJtRiYHP1H4byG/M
 0JmA==
X-Gm-Message-State: AC+VfDy4E6UCfgR3WqnMJY+H9MtdAl1IohR3xBMf5whBdUodBrsn7qQl
 XSJO0/B9hAFTEPQsVNjNIUFWWeYaJ+UE04imlQ0=
X-Google-Smtp-Source: ACHHUZ4Bz/9ic4BvQZZ4lOnLHoc98vyeXkLWtYgkyhKxM/DBTpkmJk1G95bcoFCd1NccgRO2FFXq+g==
X-Received: by 2002:a1c:7308:0:b0:3ef:6819:b2ad with SMTP id
 d8-20020a1c7308000000b003ef6819b2admr17513769wmb.37.1683905666295; 
 Fri, 12 May 2023 08:34:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/
Date: Fri, 12 May 2023 16:34:13 +0100
Message-Id: <20230512153423.3704893-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

While we cannot move the main "helper.h" out of target/arm/,
due to usage by generic code, we can move the sub-includes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Message-id: 20230504110412.1892411-3-richard.henderson@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h               | 8 ++++----
 target/arm/{ => tcg}/helper-a64.h | 0
 target/arm/{ => tcg}/helper-mve.h | 0
 target/arm/{ => tcg}/helper-sme.h | 0
 target/arm/{ => tcg}/helper-sve.h | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/{ => tcg}/helper-a64.h (100%)
 rename target/arm/{ => tcg}/helper-mve.h (100%)
 rename target/arm/{ => tcg}/helper-sme.h (100%)
 rename target/arm/{ => tcg}/helper-sve.h (100%)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 018b00ea75b..3335c2b10b9 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1039,9 +1039,9 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
-#include "helper-a64.h"
-#include "helper-sve.h"
-#include "helper-sme.h"
+#include "tcg/helper-a64.h"
+#include "tcg/helper-sve.h"
+#include "tcg/helper-sme.h"
 #endif
 
-#include "helper-mve.h"
+#include "tcg/helper-mve.h"
diff --git a/target/arm/helper-a64.h b/target/arm/tcg/helper-a64.h
similarity index 100%
rename from target/arm/helper-a64.h
rename to target/arm/tcg/helper-a64.h
diff --git a/target/arm/helper-mve.h b/target/arm/tcg/helper-mve.h
similarity index 100%
rename from target/arm/helper-mve.h
rename to target/arm/tcg/helper-mve.h
diff --git a/target/arm/helper-sme.h b/target/arm/tcg/helper-sme.h
similarity index 100%
rename from target/arm/helper-sme.h
rename to target/arm/tcg/helper-sme.h
diff --git a/target/arm/helper-sve.h b/target/arm/tcg/helper-sve.h
similarity index 100%
rename from target/arm/helper-sve.h
rename to target/arm/tcg/helper-sve.h
-- 
2.34.1


