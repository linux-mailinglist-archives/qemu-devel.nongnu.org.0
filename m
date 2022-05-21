Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F6552F691
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:09:03 +0200 (CEST)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCg2-0002oB-9D
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbK-0007zu-49
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbG-0003yF-W7
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:09 -0400
Received: by mail-pl1-x636.google.com with SMTP id w3so1941669plp.13
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XykDNb8AiF5XqooTWDspyQ6eumaI59tyN1vSYpnaRMw=;
 b=dodTOc6Ct/PwUXdaEm/d3h2jhXMGGlOLDOVbSvNWEiz1f2W+4QdaljtFx7ofmM+QJ8
 snhZc3hnwSEZ7zqYaTCP74dz/j5TN/DWM8qOLBF/ci44Hn1+L7mXBaIP95vXp8d/iXii
 kf7x7swwf4f6Ho/9Mt4VGHYMYxVm9gqb8cfrtR7g9/zChcQqmOIpsLfs0FzwO91UZZuB
 OHw2ELRA9zYd286ILlEEcU96pXPW2mffNhytiSRhrh58bEm1Qgpt2hGvixEL1IsMBgMi
 Fvl2KNCtgMTDr2HC0uAgvGpjGgnKt+ykRayF7YwomLc2od8ihTQhc2e89LNJNEnbVz9U
 O5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XykDNb8AiF5XqooTWDspyQ6eumaI59tyN1vSYpnaRMw=;
 b=twzs5ZyS4eX5sHhj0rkcJzR8unvlZYbr/zAh0Y+GY2HCs491hz1swq7TGsXXP4QinQ
 QLlIviS+iSWmN/Q1lsSnVMSjA7Sw1/uM5thD5lSLzoEo43W8JuX/2CTXZSSu4NXPHi1W
 4fCRhSATVA+6Pem3ujaCNyNba8Zsy+mn6i/zF9aW8jlLX/NribhmsEEq+7Jvm/P5kpcK
 B1e+ER+Hl67q+9NTgDmoJt4OuG2ISXlYHLoWRk82V3hG9UJufn/tzWuxe7wVoyHbS4gN
 ClPGKghy30F4jrhZEU0IkUymspG9oEmewKMjq4sxt+FI1YIrmGYFNcqs2LThFBtjjCHl
 ByHA==
X-Gm-Message-State: AOAM530/9zzp5Zrg9AqNqJJT1cTuWKtXR+au9HcoRnuPKqkQm0zHktYL
 pV4CMXM/K6Uay2mcmxopbFTd387abFQFYA==
X-Google-Smtp-Source: ABdhPJwspM81pl6JvvKhdLs+6zGRuMK2SW4fGFwvJFDnePSFa1b00cnRmdp7JL5faSnjULYO98x5UA==
X-Received: by 2002:a17:90b:1a8a:b0:1dc:ea29:f6a9 with SMTP id
 ng10-20020a17090b1a8a00b001dcea29f6a9mr14383883pjb.108.1653091445460; 
 Fri, 20 May 2022 17:04:05 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 02/49] semihosting: Return failure from softmmu-uaccess.h
 functions
Date: Fri, 20 May 2022 17:03:13 -0700
Message-Id: <20220521000400.454525-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


