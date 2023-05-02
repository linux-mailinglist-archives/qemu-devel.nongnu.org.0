Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76016F4B3B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwSD-0001lh-G2; Tue, 02 May 2023 16:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptwSB-0001lZ-QW
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:18:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptwS7-00020h-RQ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:18:26 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so4115496f8f.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683058701; x=1685650701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sHD+an6UfWZ0XLceVMFjyWss2u45aTs/eoux4nlvX4c=;
 b=hs08mGWu10kRjrWa7GTj8nCvYLayMLMIcwhjXG/q69cvvh/sDasFuZufq9vUYlYkqb
 u1bGIwkOot/w7m4rXvtY8DKnIDBhJq60FBdtOCxQHfQDgyJ6JyciQRPReQyq583zDbj1
 eC5e24g8Bz4ApIKuotl6ISxMl7Ze9QfYAJSkw0TulnUA3PNOLmOjg9nWDSRmiVCGfyvY
 7fF21i6oN7t9x6oailrXTE9ERNtrMO1iln+X3p3Ez/3Mn77Ur4eftAIt4zlcxwDSzrDw
 uLjAHcK5hWimeiMOO+7HsJp97Ri1os/FhSnFOxce6P9fF+YWufioF/hrLfHQZjRyofaS
 OVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683058701; x=1685650701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sHD+an6UfWZ0XLceVMFjyWss2u45aTs/eoux4nlvX4c=;
 b=kb3A10Nbn8U19F5v3/Evm1dieAExy1pIVcrtip5zKvJ0lJcYlvb+4Wo5zdpEVjrPXc
 tyoAD+ewFDK0LHK7kZhG8aCrANJxZQKHbbsRioyDrMP/Rw8YBHQStcf2aa3GV34BLSeW
 xnfbYzaGcokza62Vwm8v1iONMVmW1bqvBTOmwZxk5wlYZXW4iY8wRXnVLDdhUiiLn9Y/
 rewd2IZt3Wl1VRI4VUM4jyUVF4I5McHE42BhIyMTjdZdXK68wTA0l/rADXSzhFbvdWC2
 dx5P7eJRjBqwWVzRh/uX3kRe6yMNsctJqtT69K6arIHvCHzg9KAVHqHcaG3r5SqOErvp
 Lxfg==
X-Gm-Message-State: AC+VfDwRkgZDhqX5YUxCqKGSN51kvkGQK8r7exS03eWnfZohXsDvI1/m
 FYMf6PVVByFzgLoF6AE83wR4bcajpi+SPbG38kVPcA==
X-Google-Smtp-Source: ACHHUZ4Ta4EvV+R3bXysdRDS66o4qMlEwWzQYuhl9pUe2b4ygKqZLuLzC6qNXGFjepgP+WSfKxTR/A==
X-Received: by 2002:a05:6000:108d:b0:306:32fa:6750 with SMTP id
 y13-20020a056000108d00b0030632fa6750mr3792540wrw.33.1683058700919; 
 Tue, 02 May 2023 13:18:20 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:5063:9fcd:f6cc:e52d])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm22479765wrs.67.2023.05.02.13.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 13:18:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dickon Hood <dickon.hood@codethink.co.uk>
Subject: [PULL v2 03/12] qemu/bitops.h: Limit rotate amounts
Date: Tue,  2 May 2023 21:18:18 +0100
Message-Id: <20230502201818.1726224-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502201818.1726224-1-richard.henderson@linaro.org>
References: <20230502201818.1726224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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


