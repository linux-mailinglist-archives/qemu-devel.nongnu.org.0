Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F1378C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:39:06 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5Bi-0006M7-1f
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z9-00069H-0H
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:47062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z7-0003Gz-3Z
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:06 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x5so16404324wrv.13
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+F6jleEXVhgO8uJKJxLCSJYICGeVWVwwC0zqjUCJ2F8=;
 b=eCstmKh4h7H92VgQYnQCoCE0If4SdYdx3o96Efo5RaD0LHvGvPQBS/Q0vUm60dQJNi
 0Dwu4ZVuRU2YnYS+6qz2AygmNixw7kpwMII+ssEtVpiIswpXb+1gNCFAX+yliS4cspYW
 D28YlGhmHSwHRiP3UdxFfRxjnSK1FlhDCH9DNVUAscPlooU3X8ub1rDiUKTi5N1uMWHv
 smxN/KObS61UZXQmX2IUiYRuSFlGz5nnppMMvc8aj00EXJXCMgpwZRvhdcfFGRhoJX/b
 Zob4b6MuY1DVH20pIZdLOUPV1O93Ld2zZeaNM359dFsPDvjkK8P4QS+JlALCNPsxdRG2
 SosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+F6jleEXVhgO8uJKJxLCSJYICGeVWVwwC0zqjUCJ2F8=;
 b=qvelcRZLRNhpDyK1JIQli1u3sXtUsDWZF0Bafft8Y0/SdFl4aPC1q22ramJAPImdhX
 WNU3iFy6HOJwpHVCA4dFPirewnpW4ylA0K0Z/qR0kLKm/LkwyNYqj5knOnMD7LlMXyw1
 qorWqUJvdFQSHvBsN9FeX27S4jWrxPujdeoMB0oGSBUnsbFUVWhDZtlWk61LHFKVRfig
 0Ru4Ws3rsf3po6501h/bTWZKAege5iYy2DZ6OV5Q1xumOT5OT4UcAl2XV6wD5lcJZ6pY
 zitpQRy/UGuG0a6whFX04z1WdS0fLaS+2G6VAbbSqPxxvX2mbp96OzHJRVO+kVZzBzM5
 44jA==
X-Gm-Message-State: AOAM5307OMZxcQUTWHvc+4fq4cLXPpDocUrmpyz+wMc6d3GXyslLABFz
 TfBDQIc5//zOSOybvSq41geeX3tYh3HlmQ==
X-Google-Smtp-Source: ABdhPJztLFlWwdhyzpkJeH8IhzJCxSVN0+USfqlFBEn4Zab/C7fvU6G107LsG7utlXTLMjS8eO5wWA==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr29971856wrm.392.1620649563794; 
 Mon, 10 May 2021 05:26:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] include/qemu/bswap.h: Handle being included outside
 extern "C" block
Date: Mon, 10 May 2021 13:25:42 +0100
Message-Id: <20210510122548.28638-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make bswap.h handle being included outside an 'extern "C"' block:
all system headers are included first, then all declarations are
put inside an 'extern "C"' block.

This requires a little rearrangement as currently we have an ifdef
ladder that has some system includes and some local declarations
or definitions, and we need to separate those out.

We want to do this because dis-asm.h includes bswap.h, dis-asm.h
may need to be included from C++ files, and system headers should
not be included within 'extern "C"' blocks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/bswap.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 4aaf992b5d7..2d3bb8bbedd 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,8 +1,6 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
-#include "fpu/softfloat-types.h"
-
 #ifdef CONFIG_MACHINE_BSWAP_H
 # include <sys/endian.h>
 # include <machine/bswap.h>
@@ -12,7 +10,18 @@
 # include <endian.h>
 #elif defined(CONFIG_BYTESWAP_H)
 # include <byteswap.h>
+#define BSWAP_FROM_BYTESWAP
+# else
+#define BSWAP_FROM_FALLBACKS
+#endif /* ! CONFIG_MACHINE_BSWAP_H */
 
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#include "fpu/softfloat-types.h"
+
+#ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
     return bswap_16(x);
@@ -27,7 +36,9 @@ static inline uint64_t bswap64(uint64_t x)
 {
     return bswap_64(x);
 }
-# else
+#endif
+
+#ifdef BSWAP_FROM_FALLBACKS
 static inline uint16_t bswap16(uint16_t x)
 {
     return (((x & 0x00ff) << 8) |
@@ -53,7 +64,10 @@ static inline uint64_t bswap64(uint64_t x)
             ((x & 0x00ff000000000000ULL) >> 40) |
             ((x & 0xff00000000000000ULL) >> 56));
 }
-#endif /* ! CONFIG_MACHINE_BSWAP_H */
+#endif
+
+#undef BSWAP_FROM_BYTESWAP
+#undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
 {
@@ -494,4 +508,8 @@ DO_STN_LDN_P(be)
 #undef le_bswaps
 #undef be_bswaps
 
+#ifdef __cplusplus
+}
+#endif
+
 #endif /* BSWAP_H */
-- 
2.20.1


