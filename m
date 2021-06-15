Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B73A8628
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:13:42 +0200 (CEST)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBh7-0002Xg-IQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBFR-0006nI-FB
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEt-00012f-HB
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:45:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id f2so18861097wri.11
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6qIWcsIdyvd/WEXoemLtY0kI6ipgVyVMlOE8Et+PoWA=;
 b=tkuBvrqTkCrM1EFLqjHBrRQbyzLWDhilmJ5QkfuDk4n6uUQIflF/g6lKdj0LfHzH/6
 jZEE3UK09n7tPB404ZuMkVAm3tVMTTCPiQRRM/edEIeS83ieQo2vGBYBpKLXH5y1kzEz
 gXx49ojsWXwXIaCyX4QRAdtRuiDg9mPzg4BMvp/+tnsnYPZ+HOqdj76KVai9OEIhrpR3
 n0tSXSHbUIGwrKGYLvas7RIsw2T84f7nOoN3W9F8oiDYn8WtyU9z/aMh/ETfy+81T1QD
 4WLtAQin347eDFOu4TQapUJUpEBn10gNBW1bydB5Vc4UAM/94CN5bRV1i8RDRAI4Z+mX
 7frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6qIWcsIdyvd/WEXoemLtY0kI6ipgVyVMlOE8Et+PoWA=;
 b=jePUnnV6Kvaq0eLVNXAZbFL9aHjiQZZQ/yvzNIp1ILpOoG5iXkVf08p879cgv5WqJs
 ayobIU8+GHWhI0ZY/JomlR+CmCW3kiuBClSP9K/XWgD4+xD3xydR7vVJMXm5If+1tqxc
 w4vYR7I4+J1urc6dYvyt9h4dsBrIuiDdvnWS8XnkcCHYh/XzIYAG+R/OI4/WO3ZnOmaY
 GQs6148Gg2EeyQjI9UUatY7SL9D/WZ05wIavYjA97FMYlxLIbLZIhBFay6oXb6QGZP95
 1OgcLZEAUTJT45NZV/JDGfqh7zDW6DT29ZUBnVmNLuT4j8SUPVInBIzLMz2FPpMLWymD
 HFlA==
X-Gm-Message-State: AOAM533Xlk04kcMZehqUdY4FQlfATaB206eK3VfEolJsHPgsvxQfOarU
 Wir1+1EkSqh0LFQuim1xsgk1Qx7gdnIVqw==
X-Google-Smtp-Source: ABdhPJzQpUCz7iIV6XZmJ4Izu7N0abR9bCn/XaZlPtRBxVyLBvG1AeXojjbM+MDG0qL2ClRb2z+hUA==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr26123947wro.393.1623771867432; 
 Tue, 15 Jun 2021 08:44:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/28] bitops.h: Provide hswap32(), hswap64(),
 wswap64() swapping operations
Date: Tue, 15 Jun 2021 16:44:04 +0100
Message-Id: <20210615154405.21399-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Currently the ARM SVE helper code defines locally some utility
functions for swapping 16-bit halfwords within 32-bit or 64-bit
values and for swapping 32-bit words within 64-bit values,
parallel to the byte-swapping bswap16/32/64 functions.

We want these also for the ARM MVE code, and they're potentially
generally useful for other targets, so move them to bitops.h.
(We don't put them in bswap.h with the bswap* functions because
they are implemented in terms of the rotate operations also
defined in bitops.h, and including bitops.h from bswap.h seems
better avoided.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210614151007.4545-17-peter.maydell@linaro.org
---
 include/qemu/bitops.h   | 29 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c | 20 --------------------
 2 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index a72f69fea85..03213ce952c 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -291,6 +291,35 @@ static inline uint64_t ror64(uint64_t word, unsigned int shift)
     return (word >> shift) | (word << ((64 - shift) & 63));
 }
 
+/**
+ * hswap32 - swap 16-bit halfwords within a 32-bit value
+ * @h: value to swap
+ */
+static inline uint32_t hswap32(uint32_t h)
+{
+    return rol32(h, 16);
+}
+
+/**
+ * hswap64 - swap 16-bit halfwords within a 64-bit value
+ * @h: value to swap
+ */
+static inline uint64_t hswap64(uint64_t h)
+{
+    uint64_t m = 0x0000ffff0000ffffull;
+    h = rol64(h, 32);
+    return ((h & m) << 16) | ((h >> 16) & m);
+}
+
+/**
+ * wswap64 - swap 32-bit words within a 64-bit value
+ * @h: value to swap
+ */
+static inline uint64_t wswap64(uint64_t h)
+{
+    return rol64(h, 32);
+}
+
 /**
  * extract32:
  * @value: the value to extract the bit field from
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 321098e2651..dab5f1d1cda 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -152,26 +152,6 @@ static inline uint64_t expand_pred_s(uint8_t byte)
     return word[byte & 0x11];
 }
 
-/* Swap 16-bit words within a 32-bit word.  */
-static inline uint32_t hswap32(uint32_t h)
-{
-    return rol32(h, 16);
-}
-
-/* Swap 16-bit words within a 64-bit word.  */
-static inline uint64_t hswap64(uint64_t h)
-{
-    uint64_t m = 0x0000ffff0000ffffull;
-    h = rol64(h, 32);
-    return ((h & m) << 16) | ((h >> 16) & m);
-}
-
-/* Swap 32-bit words within a 64-bit word.  */
-static inline uint64_t wswap64(uint64_t h)
-{
-    return rol64(h, 32);
-}
-
 #define LOGICAL_PPPP(NAME, FUNC) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
 {                                                                         \
-- 
2.20.1


