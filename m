Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8B3A69F9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:21:59 +0200 (CEST)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoPW-00062m-35
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEX-0000tM-4P
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:37 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEM-0000In-TM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id y7so14929327wrh.7
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7wu6UFnEHhsNr8f+nzfFofEjuSaGsLV/HyDj4dgtPTg=;
 b=H9MKhV8OWRYZKMVlJlX2MXOie7jgB0nDHVjCgU5eNGrjzwVnuT/6XE5fjuJ+xZtolR
 XidRkpjGQVx9Qsxsd0p8sRTjb0YUNqQ0rzv2Cr6Hd8O4hce+VuuDC6npK7t1rLuNlODq
 HeZzaiYT7pHvBpSDtTs0KZGxJiUbFZOJ4GYvQK2jGOjTHxbCfGucdzD0diL0hV3HoBoM
 l4E/wEnPcMY2u/+sZoPq6Gd8uCL1iEWQ+9c6g0cAID6Gnci9Z4rs32CJVH5nJJEYmqq9
 rprmVTNGdx0JQMkiX/7oEgECugIOmXj1NOemOVYIhOxRlqVkQ8mbeJzeXXAay5ojIrCS
 gfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7wu6UFnEHhsNr8f+nzfFofEjuSaGsLV/HyDj4dgtPTg=;
 b=WWrAqKoGI3J7aHsLSyJar1uwreJfVt2FORm8eOzgiA+IkQ2WGB5yF79bVPkkhMEK7+
 OBhEsTPpcHmNLZrb1TYHmQFp1is+CVt8gpVrTtkn2t/BSvAOVOt7GRsfsOb11NWJ2faB
 tEixMDFqQ7KgfPv012EM1qU7pT9Syrjpnmug8gk3upzv7PkYI/ckEHozJowRJzm4HvNw
 nU9jEMNscmvryWpdtUNbXzGtzsMgyxdjqe5HtqBHglNQ63xc4ht0Iemlx9NeIrN/05Cz
 gX3LdRvK44tL5etPnhbN9Qo/t/xxmrafI7YbFq1Z+EK2JxPH2lgA8VH3fytUTMEbXdRj
 KyVA==
X-Gm-Message-State: AOAM533j3lZLBSjnHn7whySgwPhWs4gHyKDFoIVkc8uq1w3nAWrEmO/p
 f5oqXNmvdZnwpsgdSTLPnbgs7A==
X-Google-Smtp-Source: ABdhPJyfQI32WrFgdwStoIA/YD0jlsiQZVt8u0if/hIMAgvzSRNcDBH0N7poCfrukrdSLSFN3BszwA==
X-Received: by 2002:a5d:6147:: with SMTP id y7mr19308802wrt.418.1623683424540; 
 Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/57] bitops.h: Provide hswap32(), hswap64(),
 wswap64() swapping operations
Date: Mon, 14 Jun 2021 16:09:26 +0100
Message-Id: <20210614151007.4545-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
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


