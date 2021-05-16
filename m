Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA0381ED2
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:41:28 +0200 (CEST)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG5H-0007EK-8h
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFye-00079w-Pn
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:36 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyc-0007da-Mj
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:36 -0400
Received: by mail-qt1-x82a.google.com with SMTP id v4so3033998qtp.1
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fn81QolisoGBee6Unux0EG9mqgMNVVRkx5P5b1nS6oI=;
 b=QZ9nI0XHOe6nyyuHev0MOy1yF7amwTnAXleu8eQwyD7RJMrNHiClhuXWMXBO/WG0RE
 9Mwsa0hBIgH/4IpHvSBCRtTmSr+kFSrYHhfsIr/GUm7j59T8EN8ISkfbMnyVnEwXcYmv
 YiQq4bmObLwv4QO4tljq/lLO8e4NQWyeF5ZEAHig85HiWfgjuPnl98geylf+rMAVa28s
 UKJlc+Zv+DR0joEjZmA67hHnglxM9u/O5ygSfIYKNSznLz9sKryWi1KqgPEwSGjiHuTM
 YfgVUC5Kl3FeRWrxv7ki5+M5Bb/kqvIbMOJWmM2QGjdYFpRQ5TMeY8dhcnKCgGkuci+W
 LzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fn81QolisoGBee6Unux0EG9mqgMNVVRkx5P5b1nS6oI=;
 b=DmVzZLvMJj3c+rt98t79wUhRm09qfzAXlm1KnUAF0PTiEp+eqwAO+Zl4GgJIilJVGs
 /jbplp1QqdqpC0RraJY2APwkF3pWH8DVSZPhTkCbUIOsAhjsIIQiTJiRBh8PyklPxPDk
 VZmSHA01tn2m7u11vmGvot+0oZxEUSMW+UD8hF9HxG/XW/KfxzVbymSWhOsFO/V9RgPV
 zq4J1gfQdnU171Jwo/tAtMtCwjkb1affUG5UZlrt4IWDuLGuFpKDSUmEHhwot128ubOs
 PRbgOV0Fo2u9SSnd+UpJhtXzHdbJZXocksgspdKL0DKQG6jvVt4S2u/c+7hP7lwX4cgO
 RkTA==
X-Gm-Message-State: AOAM530T01js/ZUieKLVLRzJCRn833AE9vsujWPUdEOiTZ/PPO8eVSng
 +6P1tS2cqm4sclrJ+Moa4xi98htiYmjHb0x3Z9M=
X-Google-Smtp-Source: ABdhPJyvuUZRbShFW6l/VUovZeSTwp6z7QksF2hwg5jodLb8+v6OXneCWwKwG+4JzVani5qAYYQ6Kw==
X-Received: by 2002:ac8:12c5:: with SMTP id b5mr52250331qtj.203.1621168473720; 
 Sun, 16 May 2021 05:34:33 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/46] qemu/host-utils: Use __builtin_bitreverseN
Date: Sun, 16 May 2021 07:33:46 -0500
Message-Id: <20210516123431.718318-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang has added some builtins for these operations;
use them if available.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
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


