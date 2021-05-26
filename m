Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164539236A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:53:06 +0200 (CEST)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Kj-00067t-43
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FI-0005c3-SF
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3F9-0004SU-Mt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:28 -0400
Received: by mail-pl1-x636.google.com with SMTP id s4so1409285plg.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GwFPfaEmVEpOzuuThVVY+CbHhMoholSixs381w2V9KE=;
 b=Y4ruGN8EFpTFVXiT0gmCtMSfPq8HSfelI7epdpjobZuUwkWtrbR2H1K758tHNSU35j
 Sz2mmBmf5s0bRrdP6yyomAwF3KBfexQMbCxw02mLTuahY6sSn58F/NOh1H3AHWsSNtq4
 hmWPCGhhxGndF2uDd1rMnTpqbauyxRrWI5LM+TDpoUfHlBlD9YatW/eR7tsW4XWwl3mv
 xgiwss3fO5tsPLLs8GQr2g3mvIJTkZt96TVLGfHcw5vAxA5R61KM6gJPPgJzhUV1zeOM
 g1l5rxlTQR2MzJOaXfaTQBetySkJ+fwhHb9TYGflj+02s8rVMbzsxYl1Ow28GehanfTu
 5WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GwFPfaEmVEpOzuuThVVY+CbHhMoholSixs381w2V9KE=;
 b=tAk/iDV+SpIwzF1oVHU/PmyKUnc8xKehfMksx1D1Vlk71teh4mYb0HrPqMh7rXCPn8
 5D6Ck49VkBef5qaQYzGV5Cajd6wknJrNOWsW12/Kwg708wxoVdrAq6/Ev+y2YPJHZ/W3
 Qy6ox9wInOhMm6ff7PJPQUXT51zb3demc7zhDyqtj0ESdo/4FYyitJbNqzM5IDqDP7BB
 lEmcrLehpynuYcfBy7KH6BnL9xKTYc2qEnW/DN0ANFN3Ti2wvR8FbCz0QFM0HnQJCAyP
 hK6/Osvfb8qT3s2iFbq/uN5VwjeqfyfZCVmid0MT1ITA/Tm0dqzBDc6jw2IK/FvTpVaE
 Ovzw==
X-Gm-Message-State: AOAM532h32bj36H/DTY/bzdKD6Hd9aLI7HPM6iadDYQZ8du5eKESvbcz
 o7XUMtyqVoesjaWvGm7ZKd9sux4GysUrDA==
X-Google-Smtp-Source: ABdhPJzv/G3FqHjs/zW0onRRx9tpPd7VsW/er/Gf3oil4gJEI0oXsC8NL1oH2g++RZXR+qNW3HDQOw==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id
 fr10mr6519973pjb.6.1622072837084; 
 Wed, 26 May 2021 16:47:17 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/31] exec/memory_ldst_cached: Use correct type size
Date: Wed, 26 May 2021 16:46:44 -0700
Message-Id: <20210526234710.125396-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Use uint16_t for (unsigned) 16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210518183655.1711377-6-philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memory_ldst_cached.h.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index c33449d0cd..d7834f852c 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -24,7 +24,7 @@
 #define LD_P(size) \
     glue(glue(ld, size), glue(ENDIANNESS, _p))
 
-static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
+static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
@@ -72,7 +72,7 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     glue(glue(st, size), glue(ENDIANNESS, _p))
 
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
     if (likely(cache->ptr)) {
-- 
2.25.1


