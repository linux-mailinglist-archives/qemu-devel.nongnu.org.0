Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C104376E1F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:51:02 +0200 (CEST)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfC7Q-0006i8-Tz
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4d-0003ux-R1
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:07 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4c-0003Ud-6O
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h7so6156348plt.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kll+dPeHhZ1ZNnNxSh3IWKjU47wCoWRq1+9XapRC/iw=;
 b=rqZvmS7YVE3xScwFbcjkv3pcDwAe2i+MSe3ozkVfLmG9xp81Oyg8zH4qDKqWF7E5SV
 FN0AEwSH6PgoYIk33tD4ukSZ06JUa+U1wwy+brWDSepKcOGPhsuBE5olrcyqWGv27puU
 LuM6re/SO7cA8p4ydAPayUbARSISXwlf4LE16EXPtkFSUh5ljKT913f9mChWjS1M+9rj
 PRyGbUPP7UO5Rl7rgnzfufoUvRn0waPwCaAUp7ykr+8zB+ofKpE9p61kJBgL5OoroLi4
 OyXrnCEqbXEZJ1kLm6OjEcrgiiuG9WZ+pMp39hKxSA1bZImEfCqkjcv5KgpXxjgbnmU1
 ijWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kll+dPeHhZ1ZNnNxSh3IWKjU47wCoWRq1+9XapRC/iw=;
 b=FsalIuW6ZiaElYby/W2/vEqhNF+U1L5Pl3MZYm7LxoZ65J6vaGjnc01EXb9KzQqTlz
 T3QWF5ddHpzBoJL73CU9egw2O1Y05ryX4vdq5CknZ1IlrMcrGpNktVeGkcN4U8cVQmkg
 xHuUz3kCEZsy4nn1ABYujibT/ch3lUWFDuqq8X9wQnIWo1p9+kY6esSkdhEu+SxugKNF
 SC6vrhRweLhHfSkP+uXovINOBI4KKBT5mdOeOZNzV/0cnG+UIiIGtjOszYngj9ErRwcn
 Hwl4p/VN55pOFkkKkQ7j5whWN+7SwpV9JAe1WucoD6GovK2XLr7i1VW57JEaSRZmy4Ss
 Bk5g==
X-Gm-Message-State: AOAM531k+C8KHrRfXMGTXCaGtzjpl4z9rOQoC9sgERrmz1XCzShUHzvu
 yKnQuGtByv+WdmyMfhKWSXUZ1KDpqzLFaw==
X-Google-Smtp-Source: ABdhPJzKVGO9dMlYIHcsQ/B4RF4ocvYvZEbPXNv2KJYjrWG8Z68Vwhe2Uy04bchZ7JdDy520xxwxCA==
X-Received: by 2002:a17:90b:915:: with SMTP id
 bo21mr13130414pjb.27.1620438484793; 
 Fri, 07 May 2021 18:48:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/72] qemu/host-utils: Use __builtin_bitreverseN
Date: Fri,  7 May 2021 18:46:51 -0700
Message-Id: <20210508014802.892561-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang has added some builtins for these operations;
use them if available.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index cdca2991d8..f1e52851e0 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -272,6 +272,9 @@ static inline int ctpop64(uint64_t val)
  */
 static inline uint8_t revbit8(uint8_t x)
 {
+#if __has_builtin(__builtin_bitreverse8)
+    return __builtin_bitreverse8(x);
+#else
     /* Assign the correct nibble position.  */
     x = ((x & 0xf0) >> 4)
       | ((x & 0x0f) << 4);
@@ -281,6 +284,7 @@ static inline uint8_t revbit8(uint8_t x)
       | ((x & 0x22) << 1)
       | ((x & 0x11) << 3);
     return x;
+#endif
 }
 
 /**
@@ -289,6 +293,9 @@ static inline uint8_t revbit8(uint8_t x)
  */
 static inline uint16_t revbit16(uint16_t x)
 {
+#if __has_builtin(__builtin_bitreverse16)
+    return __builtin_bitreverse16(x);
+#else
     /* Assign the correct byte position.  */
     x = bswap16(x);
     /* Assign the correct nibble position.  */
@@ -300,6 +307,7 @@ static inline uint16_t revbit16(uint16_t x)
       | ((x & 0x2222) << 1)
       | ((x & 0x1111) << 3);
     return x;
+#endif
 }
 
 /**
@@ -308,6 +316,9 @@ static inline uint16_t revbit16(uint16_t x)
  */
 static inline uint32_t revbit32(uint32_t x)
 {
+#if __has_builtin(__builtin_bitreverse32)
+    return __builtin_bitreverse32(x);
+#else
     /* Assign the correct byte position.  */
     x = bswap32(x);
     /* Assign the correct nibble position.  */
@@ -319,6 +330,7 @@ static inline uint32_t revbit32(uint32_t x)
       | ((x & 0x22222222u) << 1)
       | ((x & 0x11111111u) << 3);
     return x;
+#endif
 }
 
 /**
@@ -327,6 +339,9 @@ static inline uint32_t revbit32(uint32_t x)
  */
 static inline uint64_t revbit64(uint64_t x)
 {
+#if __has_builtin(__builtin_bitreverse64)
+    return __builtin_bitreverse64(x);
+#else
     /* Assign the correct byte position.  */
     x = bswap64(x);
     /* Assign the correct nibble position.  */
@@ -338,6 +353,7 @@ static inline uint64_t revbit64(uint64_t x)
       | ((x & 0x2222222222222222ull) << 1)
       | ((x & 0x1111111111111111ull) << 3);
     return x;
+#endif
 }
 
 /* Host type specific sizes of these routines.  */
-- 
2.25.1


