Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C96F6973
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:04:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWl5-0005fR-0u; Thu, 04 May 2023 07:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl3-0005ek-CQ
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:04:21 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl0-0003ah-KW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:04:20 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc456cc39so475909a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198257; x=1685790257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGw5su4tM0a+gusZAdk7uk47Ld4BoHoi82Y5UurxcOw=;
 b=qzFOwK6ybxEadA8/mtBSd0Nlos/Z0OEhYBgP4rf7IQgKsxsL8hSR00k4Tfvr5gknkS
 glHTLwOHIYt3ZeYXktOASgU+PH5ibexzuyxoE7vwvawHjJFMHoG2KIs9Ci3eYHb5uqYL
 ovz61NGQjhPyFrk8DMqPNZCw7vM2fb1PcH+z8LNv+Dpw3IUpLrHHCrX8HKf1R7OImyZw
 yswW8Lo2QQfjJDkR7okDCASeBf54EnxEtW8T+tciuytPppXO9AJnG2eOZ1PAO7VGKuOV
 Cu/PjH4tOw/B5SUYrzzbLqrth0hSOs93IaAl8+YMcyOf2dOdYrbdaWd3i2kd3UYOqF3o
 5dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198257; x=1685790257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aGw5su4tM0a+gusZAdk7uk47Ld4BoHoi82Y5UurxcOw=;
 b=EfyMMBf8cHH9VKAVmEBTK/8Fv6IaPyirAmmXYRNWfYWigycGnd/6tSV/qovNYeL7p3
 sMnIdV0gKwZF3o0JwGBRuqCGMuBZEmCaE/pvzwfdMySYtMXbfFbCTPJ8pR6CRR7NIWAC
 UQJUk+h1RCSp4XgDIr3LtlOr2XSMIvDJJvR1Y+O0lIZnB8dTilfJAq1TQ5T3ywRLgFfu
 ho9y5IeJ6VJkCgrZsi1rmOkWyvMsqzuUXk2XlEsQcYFPodWV6SuDgPaQrErvNNC2aY7g
 eJhmPqAodVhHXtxB/YRcapEVQCk5sh/8N3iLn5ECaElHB6CoOX3hFfM1l2g3mlfB/8x5
 n9oQ==
X-Gm-Message-State: AC+VfDzMZh8y6b9KMugOAyzGr8N+kKb6y9/ZHR/dbTdzny76NTY8bszT
 HMJSpTWSjc7WBMLS5u02TYUPVn356PG7ZmU0lf9YKg==
X-Google-Smtp-Source: ACHHUZ4bX9U8dh6TDhH2zw/zDuKk91mSomiDjaPG9fyYZciMbrBaGrM5sRzOfOai1LWrNlRM/V9SHQ==
X-Received: by 2002:a17:907:934d:b0:958:489f:d050 with SMTP id
 bv13-20020a170907934d00b00958489fd050mr6266099ejc.43.1683198257073; 
 Thu, 04 May 2023 04:04:17 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090648c500b008c16025b318sm18626175ejt.155.2023.05.04.04.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:04:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/
Date: Thu,  4 May 2023 12:04:12 +0100
Message-Id: <20230504110412.1892411-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52f.google.com
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

While we cannot move the main "helper.h" out of target/arm/,
due to usage by generic code, we can move the sub-includes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 018b00ea75..3335c2b10b 100644
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


