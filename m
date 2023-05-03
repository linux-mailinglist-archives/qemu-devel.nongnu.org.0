Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468966F51C2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:35:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tQ-00042Q-CV; Wed, 03 May 2023 03:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tL-0003ga-53
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tI-0005bn-NX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso872535f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098827; x=1685690827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOFHfQ3CYmubFIvzZxRQLu21IZaKDKxLo4XtkvLTagA=;
 b=amkArTMAIgQu6RLvSZC1LiAhAcjWDejDf2CFamKnpdoZLr8nfKN4ZSXFi4+Wf8XKaO
 DkdmrQo336uCsXsCO+agluYEkSoHM0jW0sSyzzYEad18iWM67jz4l6qLCeREgd1RzD5f
 K6h2MW9LfGZfjGpbhPODaFHCDq9297qw34Hk2vO361wv96Si+dxfLnItnCmrM0lDhZO1
 3Ai8PoWklWTGO6ouZvbGgrA1mRv6Vvu8BSLsVRl6snHLZ7YRLnx+tpJ8bI0Msk7c37ap
 7UqzX5mChSej5lq38JWKBBwRiawPuAfCQwAIjAnImCuqalCzYpbEh4Dm6hA4UCRDqlWP
 s/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098827; x=1685690827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOFHfQ3CYmubFIvzZxRQLu21IZaKDKxLo4XtkvLTagA=;
 b=B6lqqaa6XXtb2FSnqpuW8bnC7LE/Af6UscHmarvZeg9y9fOKaOCETNcDsmQx4YxBdg
 8AT1HVwLSza3RcPYaFKpFNXtKnFnLn0qlmxT5zSiXNfCzTg9IN+SLQm1k7bvqHkTFekY
 t6IG3YyO4CAS4D4H9HcYoRYTjZQ9T8R8mMMnJj61/bfOmcpGDrNvxFiSKSm8V7e/11zn
 beaapvCZWB0fdLLWS09L75yFjjKOStU4hnbLiCnSYYlcJv+sRq1FB0KaFJxtc1Rm6Og0
 g+wvxG04yVrWtIFD4KVfwSlkAgjil1fW8Bf+RBMzmOz4eGxnRQfTokNx2kD/5xXr+ZGy
 8BBw==
X-Gm-Message-State: AC+VfDwl57n3AIR8DBhdEHe8Ux/j6N4qUnxZOFkXL7ewUcAVlQqmW4iR
 Sewrdpelp5Kd5rqD7RnCdpl1Bk31HeXTPePG6kF+/w==
X-Google-Smtp-Source: ACHHUZ6eSTlEBl0hvrvWev9EMFLAnhVAZvbRteCDPd9z5Upld49nDe9xf78cYmc3VSuvdIYx08Ro9Q==
X-Received: by 2002:adf:f38e:0:b0:2f5:ace2:8737 with SMTP id
 m14-20020adff38e000000b002f5ace28737mr13611096wro.32.1683098827165; 
 Wed, 03 May 2023 00:27:07 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 45/84] target/arm: Include helper-gen.h in translator.h
Date: Wed,  3 May 2023 08:22:52 +0100
Message-Id: <20230503072331.1747057-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

This had been included via tcg-op-common.h via tcg-op.h,
but that is going away.

It is needed for inlines within translator.h, so we might as well
do it there and not individually in each translator c file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 1 +
 target/arm/tcg/translate-a64.c | 2 --
 target/arm/tcg/translate-sme.c | 1 -
 target/arm/tcg/translate-sve.c | 2 --
 target/arm/tcg/translate.c     | 2 --
 5 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index f02d4685b4..d1a7a829ed 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -2,6 +2,7 @@
 #define TARGET_ARM_TRANSLATE_H
 
 #include "exec/translator.h"
+#include "exec/helper-gen.h"
 #include "internals.h"
 
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index dff391bfe2..20bb8040df 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -29,8 +29,6 @@
 #include "qemu/host-utils.h"
 #include "semihosting/semihost.h"
 #include "exec/gen-icount.h"
-#include "exec/helper-proto.h"
-#include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "cpregs.h"
 #include "translate-a64.h"
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index e3adba314e..b0812d9dd6 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -23,7 +23,6 @@
 #include "tcg/tcg-op-gvec.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "translate.h"
-#include "exec/helper-gen.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 92ab290106..106baf311f 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -27,8 +27,6 @@
 #include "arm_ldst.h"
 #include "translate.h"
 #include "internals.h"
-#include "exec/helper-proto.h"
-#include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 7468476724..c89825ad6a 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -30,8 +30,6 @@
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
-#include "exec/helper-proto.h"
-#include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "cpregs.h"
 
-- 
2.34.1


