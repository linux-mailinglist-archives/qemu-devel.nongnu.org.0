Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB3B39237E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:58:14 +0200 (CEST)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Ph-0000lt-4S
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FI-0005c2-Ku
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F7-0004RH-4Z
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so1243666pjp.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35fS2mEHUPwPaI8xH8/39rsUu1yuwzdz1o4w+eONAWI=;
 b=D+smDHfv1TjQyqs99zdornvb4hN7tGtGRI4F00mDXTi3DNwQlEUYv5ys6mmSrdsadL
 nd6xjlQ3dP/VSLLHA7QdqNJzjQv1UD5EqFEnHHbKifofTNWJLBUDMvO5bTNP5biBtUeU
 NITwalGZeCzl4jKmSMz4OmXZyVXZX/Mbwbv6ZobirxBt3Y9enPNVfKQaFIfAtoAf3ZPP
 HvFYP7QwENIJMm2FgSj/kdwOC/24yLhoNqfo0KRmLRHXp2JhmU/LnCycBqJ1XwtZkD48
 OZlmcoZIegaB1JO3VjLPenKWZdR9B9ny3GXmkTP/yAxYl7MfOcRz018jWLfL2KZzAchQ
 P/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35fS2mEHUPwPaI8xH8/39rsUu1yuwzdz1o4w+eONAWI=;
 b=V98ub+IL1zDXcKd+5aOghUH6Yneo4AP5Gu0w+BAgNwssMTzOiM32hHhMY/iYqv012c
 t+jXTfe0STogsn3O5PsONvoIxagNT/Nqe/qsNjiqqSJT09mfU6wLrAWdiLu/ShX86jbH
 dIBl7sW5YvH8NltQdtMOm5JMfApUwYxsiwI0mQtEDureGYJ4uyhsELNuks//4skpGrLd
 DpOr8bScgrwd/AJE4ak5YBiTbSGmr+VhJ6drytjsROUh5rXPOFQMON8nZSfky31CNRki
 gb6xzHwzkjTg7ewdZCz0v8DVm4lfwCv/mIQNvvY1tLNnXIdYh9n9tfS32qO83fc/BrBJ
 fobw==
X-Gm-Message-State: AOAM533BOqUAdEYI5AjA+Pv9Hw1CHuCFFk2hpbwA5stA7u5K9mWwQPIS
 wOxSuBExBT3tZ47mHd1hxJMGVKYaS5lYjw==
X-Google-Smtp-Source: ABdhPJwKg9NKBzs3PcqrHHJkd0r9cZPiDmarRFdPFD45Ko+7CzsOXIvyS9yyoPg2blhZe/janns9gw==
X-Received: by 2002:a17:903:230b:b029:f4:b7cf:44aa with SMTP id
 d11-20020a170903230bb02900f4b7cf44aamr592078plh.31.1622072834302; 
 Wed, 26 May 2021 16:47:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/31] exec/memory_ldst_cached: Sort declarations
Date: Wed, 26 May 2021 16:46:40 -0700
Message-Id: <20210526234710.125396-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To ease the file review, sort the declarations by the size of
the access (8, 16, 32). Simple code movement, no logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518183655.1711377-2-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory_ldst_cached.h.inc | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index 7bc8790d34..c33449d0cd 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -24,6 +24,18 @@
 #define LD_P(size) \
     glue(glue(ld, size), glue(ENDIANNESS, _p))
 
+static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
+    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
+{
+    assert(addr < cache->len && 2 <= cache->len - addr);
+    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr);
+    if (likely(cache->ptr)) {
+        return LD_P(uw)(cache->ptr + addr);
+    } else {
+        return ADDRESS_SPACE_LD_CACHED_SLOW(uw)(cache, addr, attrs, result);
+    }
+}
+
 static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -48,18 +60,6 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     }
 }
 
-static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
-    hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
-{
-    assert(addr < cache->len && 2 <= cache->len - addr);
-    fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr);
-    if (likely(cache->ptr)) {
-        return LD_P(uw)(cache->ptr + addr);
-    } else {
-        return ADDRESS_SPACE_LD_CACHED_SLOW(uw)(cache, addr, attrs, result);
-    }
-}
-
 #undef ADDRESS_SPACE_LD_CACHED
 #undef ADDRESS_SPACE_LD_CACHED_SLOW
 #undef LD_P
@@ -71,17 +71,6 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
 #define ST_P(size) \
     glue(glue(st, size), glue(ENDIANNESS, _p))
 
-static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    assert(addr < cache->len && 4 <= cache->len - addr);
-    if (likely(cache->ptr)) {
-        ST_P(l)(cache->ptr + addr, val);
-    } else {
-        ADDRESS_SPACE_ST_CACHED_SLOW(l)(cache, addr, val, attrs, result);
-    }
-}
-
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -93,6 +82,17 @@ static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     }
 }
 
+static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
+    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+{
+    assert(addr < cache->len && 4 <= cache->len - addr);
+    if (likely(cache->ptr)) {
+        ST_P(l)(cache->ptr + addr, val);
+    } else {
+        ADDRESS_SPACE_ST_CACHED_SLOW(l)(cache, addr, val, attrs, result);
+    }
+}
+
 static inline void ADDRESS_SPACE_ST_CACHED(q)(MemoryRegionCache *cache,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
 {
-- 
2.25.1


