Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB76F51F9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:41:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pJ-0007ny-E3; Wed, 03 May 2023 03:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0006pb-MO
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0007HW-IS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30639daee76so1080007f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098547; x=1685690547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHD+an6UfWZ0XLceVMFjyWss2u45aTs/eoux4nlvX4c=;
 b=NVEnjy2H4CHH9ohmuAA7eFfKu72GCnNVEqVRLynUv4y0zahjqO1WURaRi8fR0qaIcU
 Ggu3IkuTgWVJ31RuX31K9588E7R602Cf3icZUTRVJOT3X56mzdoWrHiXnwj8W5X81zAd
 JyZKVuJABkg9R1n2hFZieKGEwLg5ITFulCeQy2GygVENVCQnzkmDaaoGcE6u22UxTqKT
 5dmYj0flVe9BG6jRxNKu9yDZsjDagQ8vKV1EDfYfCI5sUpqQkZ75XYNNZGokdko2RGT+
 3Z/rW2c1+EeAJTzvkX08yUtSJCEq3jlieHKKezdXJVaHMWioyVBuiabJf+TvGSepPu5C
 MW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098547; x=1685690547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHD+an6UfWZ0XLceVMFjyWss2u45aTs/eoux4nlvX4c=;
 b=X64vRcJ87sV1F1eNX/Dv5Z9xiAZNsXZsJoqykXNcUZu8VbSGL6jeDfSHTiD67W6ZQw
 hdG4Gakb6chSB8AUZbH7m7Fjjq832hbI8xlYt9rfPs7EaOIFQZR2msZNJCad7FVJ/+3d
 jM/CpLkfKQZW9CzO7XBbTO8Ke5V8uTMyjkUPfGV+Hhxrsd2lCuLmVVClr7xo92OsZqkQ
 MQ98ULF4Xew4GgCXp4Sxpq82tILUyS9OHyTaSbYUAsmkHnPmTj2r3Y2wHoZo3H75Em7A
 0YfLBY8AGWIM+MYLc7squXcK0MNskWROGC3nUv0CoKTlEXf/N9l4K08I7IP08W9DaDBy
 QErQ==
X-Gm-Message-State: AC+VfDxe2Q8eDKWDDnqsYhWDgParFF+pSgjgzgCeanL4DY0dUqpcyOeG
 4FBiCfDdUKowAX7XPMV41QYTtIEYWssstg/03DfyIA==
X-Google-Smtp-Source: ACHHUZ7Om9o/sfa0wGlyAbGRnsIIag00K+VOXPtV1gdnYgkGC5a4j95XZxpdkrL4X3qf1EWPXE/zQg==
X-Received: by 2002:adf:ef91:0:b0:306:36ea:8368 with SMTP id
 d17-20020adfef91000000b0030636ea8368mr3334755wro.44.1683098546900; 
 Wed, 03 May 2023 00:22:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng,
 Dickon Hood <dickon.hood@codethink.co.uk>
Subject: [PULL v2 03/12] qemu/bitops.h: Limit rotate amounts
Date: Wed,  3 May 2023 08:20:51 +0100
Message-Id: <20230503072221.1746802-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Dickon Hood <dickon.hood@codethink.co.uk>

Rotates have been fixed up to only allow for reasonable rotate amounts
(ie, no rotates >7 on an 8b value etc.)  This fixes a problem with riscv
vector rotate instructions.

Signed-off-by: Dickon Hood <dickon.hood@codethink.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230428144757.57530-9-lawrence.hunter@codethink.co.uk>
[rth: Mask shifts in both directions.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/bitops.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..cb3526d1f4 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -218,7 +218,7 @@ static inline unsigned long find_first_zero_bit(const unsigned long *addr,
  */
 static inline uint8_t rol8(uint8_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((8 - shift) & 7));
+    return (word << (shift & 7)) | (word >> (-shift & 7));
 }
 
 /**
@@ -228,7 +228,7 @@ static inline uint8_t rol8(uint8_t word, unsigned int shift)
  */
 static inline uint8_t ror8(uint8_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((8 - shift) & 7));
+    return (word >> (shift & 7)) | (word << (-shift & 7));
 }
 
 /**
@@ -238,7 +238,7 @@ static inline uint8_t ror8(uint8_t word, unsigned int shift)
  */
 static inline uint16_t rol16(uint16_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((16 - shift) & 15));
+    return (word << (shift & 15)) | (word >> (-shift & 15));
 }
 
 /**
@@ -248,7 +248,7 @@ static inline uint16_t rol16(uint16_t word, unsigned int shift)
  */
 static inline uint16_t ror16(uint16_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((16 - shift) & 15));
+    return (word >> (shift & 15)) | (word << (-shift & 15));
 }
 
 /**
@@ -258,7 +258,7 @@ static inline uint16_t ror16(uint16_t word, unsigned int shift)
  */
 static inline uint32_t rol32(uint32_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((32 - shift) & 31));
+    return (word << (shift & 31)) | (word >> (-shift & 31));
 }
 
 /**
@@ -268,7 +268,7 @@ static inline uint32_t rol32(uint32_t word, unsigned int shift)
  */
 static inline uint32_t ror32(uint32_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((32 - shift) & 31));
+    return (word >> (shift & 31)) | (word << (-shift & 31));
 }
 
 /**
@@ -278,7 +278,7 @@ static inline uint32_t ror32(uint32_t word, unsigned int shift)
  */
 static inline uint64_t rol64(uint64_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((64 - shift) & 63));
+    return (word << (shift & 63)) | (word >> (-shift & 63));
 }
 
 /**
@@ -288,7 +288,7 @@ static inline uint64_t rol64(uint64_t word, unsigned int shift)
  */
 static inline uint64_t ror64(uint64_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((64 - shift) & 63));
+    return (word >> (shift & 63)) | (word << (-shift & 63));
 }
 
 /**
-- 
2.34.1


