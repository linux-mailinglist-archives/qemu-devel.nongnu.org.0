Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B020A6F4298
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:22:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3e-0000dT-QC; Tue, 02 May 2023 07:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3c-0000cQ-Uy
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3a-0003Db-94
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so35981365e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026426; x=1685618426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LwU44caHLzwnuUU4efWp0isf3CaogQy6f09UO9nNvLc=;
 b=g2vsofwH8NtgVeI3htnKYu44AJsoo6vEdonGNkS386QGcFuSVIBbC0ENos6QPXwC3n
 pdgETZiU77uoLnSvatm/jUqNe0XZI9dGC7oowi6wOgNZsrcPgfMUGnQAAFc3jctQZ2pd
 DISXjY34wA3wpAMTXcBiV+l3ITFnsRdVOialB+Ccpu0TcgqCV2jHkOpSQG8GixJDik6t
 wSl6k0LSFFdxFitutpWyvxoOjP2uRuiu01kZ+MG+jUx+QraArKogs8GlUgwcRev/laAm
 9e1osmqvCgFE4YVRPOJ624OUD2yUtGWq2g4I9qCSXdgEjnWVv1cSx5N5Yw4VvuOGZTMB
 ioBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026426; x=1685618426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LwU44caHLzwnuUU4efWp0isf3CaogQy6f09UO9nNvLc=;
 b=P1sYNuXxxYNrK8ymGo6uw7jtnLGoq407fDkYy6+dSXfo9OaUWD++QOd7ZA51Tuwg7b
 JvLiY6bJTayuYgsrenV0klglqZlhGN/hwJWMH/65fIMpRRw+bugzb6fFM4Yu/Y8d6ABM
 HsNH4a//oUvsoAM8+2BygOEPBIS/kLsJBOYGvgZeCuYicO0b75Sssse8V/1FYLzN1L/p
 Xyf81O0MJ1CHvTEi93HepLhyWnLifRnNlEdvyUh2sJErZ83Spkw0jVAcKP+mPeNjqgPE
 x7Qt2euUSCK/jQVNADfPe/uGkFceBPEScthOEnEbdOgiDYSyfkBgogbltd8VnSFNl2Td
 z0Iw==
X-Gm-Message-State: AC+VfDzlvgXDhjRans2r9mPr8neGJxpjTjr1dGcNzF+/vPfdRiY+NKPk
 NW56Ym3hzKwLYIYD/dC+yP3MLba0OSo7A9uyOJ4WvA==
X-Google-Smtp-Source: ACHHUZ7yquLRotG6/K7zPIWqzoZ224JMyEsxqUBdej0MpaZnyBeJbqge629rk/CbqYI3/s2cURkx3g==
X-Received: by 2002:a05:600c:378e:b0:3f2:549b:3ef2 with SMTP id
 o14-20020a05600c378e00b003f2549b3ef2mr11501957wmr.17.1683026426622; 
 Tue, 02 May 2023 04:20:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dickon Hood <dickon.hood@codethink.co.uk>
Subject: [PULL 03/12] qemu/bitops.h: Limit rotate amounts
Date: Tue,  2 May 2023 12:20:14 +0100
Message-Id: <20230502112023.776823-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/bitops.h | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..c443995b3b 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -218,7 +218,8 @@ static inline unsigned long find_first_zero_bit(const unsigned long *addr,
  */
 static inline uint8_t rol8(uint8_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((8 - shift) & 7));
+    shift &= 7;
+    return (word << shift) | (word >> (8 - shift));
 }
 
 /**
@@ -228,7 +229,8 @@ static inline uint8_t rol8(uint8_t word, unsigned int shift)
  */
 static inline uint8_t ror8(uint8_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((8 - shift) & 7));
+    shift &= 7;
+    return (word >> shift) | (word << (8 - shift));
 }
 
 /**
@@ -238,7 +240,8 @@ static inline uint8_t ror8(uint8_t word, unsigned int shift)
  */
 static inline uint16_t rol16(uint16_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((16 - shift) & 15));
+    shift &= 15;
+    return (word << shift) | (word >> (16 - shift));
 }
 
 /**
@@ -248,7 +251,8 @@ static inline uint16_t rol16(uint16_t word, unsigned int shift)
  */
 static inline uint16_t ror16(uint16_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((16 - shift) & 15));
+    shift &= 15;
+    return (word >> shift) | (word << (16 - shift));
 }
 
 /**
@@ -258,7 +262,8 @@ static inline uint16_t ror16(uint16_t word, unsigned int shift)
  */
 static inline uint32_t rol32(uint32_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((32 - shift) & 31));
+    shift &= 31;
+    return (word << shift) | (word >> (32 - shift));
 }
 
 /**
@@ -268,7 +273,8 @@ static inline uint32_t rol32(uint32_t word, unsigned int shift)
  */
 static inline uint32_t ror32(uint32_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((32 - shift) & 31));
+    shift &= 31;
+    return (word >> shift) | (word << (32 - shift));
 }
 
 /**
@@ -278,7 +284,8 @@ static inline uint32_t ror32(uint32_t word, unsigned int shift)
  */
 static inline uint64_t rol64(uint64_t word, unsigned int shift)
 {
-    return (word << shift) | (word >> ((64 - shift) & 63));
+    shift &= 63;
+    return (word << shift) | (word >> (64 - shift));
 }
 
 /**
@@ -288,7 +295,8 @@ static inline uint64_t rol64(uint64_t word, unsigned int shift)
  */
 static inline uint64_t ror64(uint64_t word, unsigned int shift)
 {
-    return (word >> shift) | (word << ((64 - shift) & 63));
+    shift &= 63;
+    return (word >> shift) | (word << (64 - shift));
 }
 
 /**
-- 
2.34.1


