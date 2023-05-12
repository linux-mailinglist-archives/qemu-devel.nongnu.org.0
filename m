Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E45E700A9B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:45:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTxa-00072l-7N; Fri, 12 May 2023 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxX-0006zm-RS
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxTxK-0004iP-IT
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:41:27 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3078fa679a7so6634540f8f.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902472; x=1686494472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=revwXBl9aAHbzWWzTWkngt/4BFcUn4Y6B3F5VwQ0pkc=;
 b=AebWqY1uM8EQ5unNUediWojh8XSgR7Q+xa6neZmITkvjsoxr2i8cXx5qfFz9gvSQMi
 Xd6GHZEREsd8n2jOvNBUTFr0UhlGPvXVAeoKBFLRtA2e/jmDqTcgzviSVq60CkrJc4u6
 T6ZtWMrSwHTzFKNAr5ogQ3c64ke+Kq/chIuPD4YVQdBckgaoqzSnN+3pUBQLERSal4BH
 85WReke8FfOrmHs8xZGGUDvIVZnZWXvtXV0iFwHrAjY9Zu+j+5ihMudbF6YcGgqCf38b
 IErwnfrP9mxz73d/vmdUsw5AXR/4kHh5PuRYtR/uM7bE5B/RHQqszHpXpG/VCo/XC2/W
 BoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902472; x=1686494472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=revwXBl9aAHbzWWzTWkngt/4BFcUn4Y6B3F5VwQ0pkc=;
 b=cZwX5NPiQNBblMRr2gl1KucmGtEb+PExCVn2qkl+Z//7dp0iE7uWqIGzL6WDFGhQex
 FuUf2I2qbKkHIw+KbgqVesIpmW42plYF/FQGDaWO9RvC2neXyvtTcLRxOVL9Ijh6UxPN
 pRBNalMz5llMx7VZb9DjEkcn4/R0lR1GeSoBalUKDH8u/rcIoXjumj1tBpy4gQ8TNOsT
 3f+il2KsZD0f2dPDBdIENYVbirNZ5+Oz+ZY6+Uuaz1XswFV0rvXlofWI4RH8ozLsGjE3
 4PKHvM9xN7A+e/QcS/rRlpNa7T/kzKbxdkqJGSb1TWgwxRM8Q34iEzns6tpo9FoeZAiu
 KbPg==
X-Gm-Message-State: AC+VfDzLlmoAUdtfWnCvwDJDlLvLux3Dx/nTyDxxO3cI9Y1PpGlWt4JN
 lM91dW8wetUFxti44vk2xhPWjA==
X-Google-Smtp-Source: ACHHUZ6YxPS9NFzKoJzG7XG7tSZXi8+wE+PcbE8SFB6ZV36uROWTTHqS8yiPC2pKJlLMCgdoukHtxQ==
X-Received: by 2002:a5d:58f4:0:b0:306:8f5b:1b49 with SMTP id
 f20-20020a5d58f4000000b003068f5b1b49mr18647587wrd.47.1683902472114; 
 Fri, 12 May 2023 07:41:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a7bcc0c000000b003f17848673fsm28916167wmh.27.2023.05.12.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 07:41:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 08/20] target/arm: Replace bitmask64 with MAKE_64BIT_MASK
Date: Fri, 12 May 2023 15:40:54 +0100
Message-Id: <20230512144106.3608981-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512144106.3608981-1-peter.maydell@linaro.org>
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use the bitops.h macro rather than rolling our own here.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3636eaadce6..ca944344a6b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4288,13 +4288,6 @@ static uint64_t bitfield_replicate(uint64_t mask, unsigned int e)
     return mask;
 }
 
-/* Return a value with the bottom len bits set (where 0 < len <= 64) */
-static inline uint64_t bitmask64(unsigned int length)
-{
-    assert(length > 0 && length <= 64);
-    return ~0ULL >> (64 - length);
-}
-
 /* Simplified variant of pseudocode DecodeBitMasks() for the case where we
  * only require the wmask. Returns false if the imms/immr/immn are a reserved
  * value (ie should cause a guest UNDEF exception), and true if they are
@@ -4350,10 +4343,10 @@ bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
     /* Create the value of one element: s+1 set bits rotated
      * by r within the element (which is e bits wide)...
      */
-    mask = bitmask64(s + 1);
+    mask = MAKE_64BIT_MASK(0, s + 1);
     if (r) {
         mask = (mask >> r) | (mask << (e - r));
-        mask &= bitmask64(e);
+        mask &= MAKE_64BIT_MASK(0, e);
     }
     /* ...then replicate the element over the whole 64 bit value */
     mask = bitfield_replicate(mask, e);
-- 
2.34.1


