Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C4E38AADD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:17:35 +0200 (CEST)
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljggI-0003yG-JS
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYl-0008GD-RA
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYi-0004Ww-6r
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2KSH1YwMn8zpDyDH9Uq0LVnJ/rgrT/JgFf8hkb+U/HU=;
 b=OV0nHobY3dvLLfiopvZSXcoTv1UjiNcdnLbdNWCjm4Eht7yL6sTM2me6EE2YSS2SPBrjuF
 mZUALYfdK7dbtfr1WLmkvkcDwkO0++Zm2LjggKx2QY3P4J1sQEoGyvIdWGsgCu2eh2U5m/
 MUKZEGbsiAv/9J77EijjldqgI0YQWsQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-B2yJIMNrM6m4_NNJ8VYKvw-1; Thu, 20 May 2021 07:09:40 -0400
X-MC-Unique: B2yJIMNrM6m4_NNJ8VYKvw-1
Received: by mail-wr1-f70.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso8490480wrc.23
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KSH1YwMn8zpDyDH9Uq0LVnJ/rgrT/JgFf8hkb+U/HU=;
 b=Kdl4GodgcA7nUOB4tnBN9QyIfg3SUEgQkfTL0JdeVl282cbliYKsHM5ux4OiwILnHU
 SGHwsab9QnUX6GZJEIYjAJSyHeqJKOz/w/VLExBrznLFXFMmRw8QnCi5ilMm+h2DMtqr
 JdRy7ahgA/ZzWmSk8J5OYJfTuOsBRpItPnzGvkIPBx6v53IGc/SS/adI14zYhhlDZgyg
 +bDSdI9V2x3TdasIlV06sJCVG6kjNSHTrQ2xzVMWiybzlEjCQdCEYfLEY+TAXHYj9OFZ
 CbjYRWBaSG4f4RXgHLbElw6RCOq0/GtffkzJaXtgPFthJ9IwsE25rnzjXYEBKCT5pXvj
 sDaw==
X-Gm-Message-State: AOAM5302salVs6+nRJLD0F+WZKqVD76GyHEv6JaWfQ/wPm6iPRBreVtL
 NCyfhAaaprrWZoJw17KLOBBKYU/J6Sh04E1ZTqI5PRZn1gPKHsLcYkIXQBvGWkxkhHRE+tEQut1
 x/8dj5krVGzejEnZAViPBm+i+g9LCj9iY6M0Ej80e0H5AW+T7AtSRugCq6QdAEq0Z
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr3523690wmi.149.1621508979357; 
 Thu, 20 May 2021 04:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypV8QrtTFYcqAaQN2mqsbrJHwtiEW9wPUgdsnxyNxoDiibzKWPs82c8gxFMqHEngLwVBDtKA==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr3523669wmi.149.1621508979128; 
 Thu, 20 May 2021 04:09:39 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m7sm2774233wrv.35.2021.05.20.04.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/12] exec/memory_ldst_cached: Sort declarations
Date: Thu, 20 May 2021 13:09:11 +0200
Message-Id: <20210520110919.2483190-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To ease the file review, sort the declarations by the size of
the access (8, 16, 32). Simple code movement, no logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_cached.h.inc | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index 7bc8790d346..c33449d0cd5 100644
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
2.26.3


