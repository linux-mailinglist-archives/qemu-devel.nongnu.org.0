Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A765541DE9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:22:38 +0200 (CEST)
Received: from localhost ([::1]:34766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhau-0004t1-Tm
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5c-0007Cv-3s
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:13 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5T-0001J8-M7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t2so15827363pld.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XykDNb8AiF5XqooTWDspyQ6eumaI59tyN1vSYpnaRMw=;
 b=NtqI7CdLgyhsC0FcZq669hzvdOhBhSwjoVv3vglTQXcpBAG2X9W2ac/v2FUNXeYAV+
 w7UEO4u84+KG32PUAIM4pDwIFJnermZwjhS3qEuUZ/Bue0+GkXhAV7VEjO7J+p9Cq73P
 SmdDr6LJjC/FwvKp1cNtK/JcI9MIAG/1Hb8Z2Tm1O9OuLOEE4EkKXuDE0E6rxJDpu4Bt
 U+3vw0pv+RvZKdiEQmUcsldbnsESUqkAeLX7A2cb/mFzAGr1i+tBWrQoGFPN5sGeaFJu
 tjLbupH97zZq3o1VOO4UVq4YBPEQsf9crN/qOFjTtD4QoLR278RTOLadan0CteZMPntO
 lpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XykDNb8AiF5XqooTWDspyQ6eumaI59tyN1vSYpnaRMw=;
 b=y2oWkKBPtL+GJzIyBMetr8KqVKvV1hZxnLXgUX/1M4eVq+k3zybYn8sVwNapSmdR0/
 YXbUFH/sv3H0RzwiFcZgGFbO96U4c+unemPxUhOTZOGCnkA1LhWAH35IU8Xe4mi0m2Yu
 CWt4dlgaaZ/uhXI3FmexKbwdwWla3E+hqa9t4uskMfi2tVzvlKhgboAZE0WwtmbIsEm0
 83ijyx4vCsJlU8UVixPspHG/B49v9TmXabK4UzoMlOI06K8XuWHrxsjFhuvUiSCQyezv
 CntjR26lTVCk/o6XvBVhUSe4tw817Bot27xvx5zEExX9QYvSxjA6NaBo8p336prA0jVQ
 x2/A==
X-Gm-Message-State: AOAM530XCkPAcy3JID48za0h0B0A+iOb5oafc1oDFzZY9aRySbQXdDuB
 /MSXROp2bNnK5R2hQoJtZ61amtHQkX8kWA==
X-Google-Smtp-Source: ABdhPJzKk8GZhMDIllFOm657zeg7XlgMzsBfRhnTRqhBGbLMqwYQdfVgCJiXGhZ+A5fvtdh4NBvwfg==
X-Received: by 2002:a17:90b:224a:b0:1e6:7780:6c8c with SMTP id
 hk10-20020a17090b224a00b001e677806c8cmr33843519pjb.119.1654634761029; 
 Tue, 07 Jun 2022 13:46:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 02/53] semihosting: Return failure from softmmu-uaccess.h
 functions
Date: Tue,  7 Jun 2022 13:45:06 -0700
Message-Id: <20220607204557.658541-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were reporting unconditional success for these functions;
pass on any failure from cpu_memory_rw_debug.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/softmmu-uaccess.h | 91 ++++++++++++---------------
 1 file changed, 39 insertions(+), 52 deletions(-)

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
index e69e3c8548..5246a91570 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -12,82 +12,69 @@
 
 #include "cpu.h"
 
-static inline uint64_t softmmu_tget64(CPUArchState *env, target_ulong addr)
-{
-    uint64_t val;
+#define get_user_u64(val, addr)                                         \
+    ({ uint64_t val_ = 0;                                               \
+       int ret_ = cpu_memory_rw_debug(env_cpu(env), (addr),             \
+                                      &val_, sizeof(val_), 0);          \
+       (val) = tswap64(val_); ret_; })
 
-    cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 8, 0);
-    return tswap64(val);
-}
+#define get_user_u32(val, addr)                                         \
+    ({ uint32_t val_ = 0;                                               \
+       int ret_ = cpu_memory_rw_debug(env_cpu(env), (addr),             \
+                                      &val_, sizeof(val_), 0);          \
+       (val) = tswap32(val_); ret_; })
 
-static inline uint32_t softmmu_tget32(CPUArchState *env, target_ulong addr)
-{
-    uint32_t val;
+#define get_user_u8(val, addr)                                          \
+    ({ uint8_t val_ = 0;                                                \
+       int ret_ = cpu_memory_rw_debug(env_cpu(env), (addr),             \
+                                      &val_, sizeof(val_), 0);          \
+       (val) = val_; ret_; })
 
-    cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 4, 0);
-    return tswap32(val);
-}
-
-static inline uint32_t softmmu_tget8(CPUArchState *env, target_ulong addr)
-{
-    uint8_t val;
-
-    cpu_memory_rw_debug(env_cpu(env), addr, &val, 1, 0);
-    return val;
-}
-
-#define get_user_u64(arg, p) ({ arg = softmmu_tget64(env, p); 0; })
-#define get_user_u32(arg, p) ({ arg = softmmu_tget32(env, p) ; 0; })
-#define get_user_u8(arg, p) ({ arg = softmmu_tget8(env, p) ; 0; })
 #define get_user_ual(arg, p) get_user_u32(arg, p)
 
-static inline void softmmu_tput64(CPUArchState *env,
-                                  target_ulong addr, uint64_t val)
-{
-    val = tswap64(val);
-    cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 8, 1);
-}
+#define put_user_u64(val, addr)                                         \
+    ({ uint64_t val_ = tswap64(val);                                    \
+       cpu_memory_rw_debug(env_cpu(env), (addr), &val_, sizeof(val_), 1); })
+
+#define put_user_u32(val, addr)                                         \
+    ({ uint32_t val_ = tswap32(val);                                    \
+       cpu_memory_rw_debug(env_cpu(env), (addr), &val_, sizeof(val_), 1); })
 
-static inline void softmmu_tput32(CPUArchState *env,
-                                  target_ulong addr, uint32_t val)
-{
-    val = tswap32(val);
-    cpu_memory_rw_debug(env_cpu(env), addr, (uint8_t *)&val, 4, 1);
-}
-#define put_user_u64(arg, p) ({ softmmu_tput64(env, p, arg) ; 0; })
-#define put_user_u32(arg, p) ({ softmmu_tput32(env, p, arg) ; 0; })
 #define put_user_ual(arg, p) put_user_u32(arg, p)
 
-static void *softmmu_lock_user(CPUArchState *env,
-                               target_ulong addr, target_ulong len, int copy)
+static void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+                               target_ulong len, bool copy)
 {
-    uint8_t *p;
-    /* TODO: Make this something that isn't fixed size.  */
-    p = malloc(len);
+    void *p = malloc(len);
     if (p && copy) {
-        cpu_memory_rw_debug(env_cpu(env), addr, p, len, 0);
+        if (cpu_memory_rw_debug(env_cpu(env), addr, p, len, 0)) {
+            free(p);
+            p = NULL;
+        }
     }
     return p;
 }
 #define lock_user(type, p, len, copy) softmmu_lock_user(env, p, len, copy)
+
 static char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
 {
-    char *p;
-    char *s;
-    uint8_t c;
     /* TODO: Make this something that isn't fixed size.  */
-    s = p = malloc(1024);
+    char *s = malloc(1024);
+    size_t len = 0;
+
     if (!s) {
         return NULL;
     }
     do {
-        cpu_memory_rw_debug(env_cpu(env), addr, &c, 1, 0);
-        addr++;
-        *(p++) = c;
-    } while (c);
+        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
+            free(s);
+            return NULL;
+        }
+    } while (s[len++]);
     return s;
 }
 #define lock_user_string(p) softmmu_lock_user_string(env, p)
+
 static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
                                 target_ulong len)
 {
-- 
2.34.1


