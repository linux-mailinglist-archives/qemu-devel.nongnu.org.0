Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38557515D94
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:32:34 +0200 (CEST)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknD7-0007vh-BX
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAJ-0004ed-Ga
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:41 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAH-0006Ce-MK
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id h1so9040906pfv.12
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3JX05tYCGijKFYZwundP0SWA2fF8+V1jI3B1WPSLqJI=;
 b=kBnKVmAjRWL5vHTwNr624dsY6j0QUulBXnynUJyFOxGUeh1hxOL08iXiTTke4cL/AP
 eBEQ3A5JQtWjkHR5MHCUMAn5oQfuSeMBjKcJahlwTpwViEgOtwHP+stf2Ns7Uhq48eJt
 r4KxvJmKde712/2MFP8xkA0Q8tfnwzfp6Hn5S0Hpo7x6dPtiZjFKb6W+JfZ7IW0FbHMv
 nwXt5p6NaHB3OhI0Jqt5LriTQjhMD2Yt3g2p8+BdF5y1W2Ts2bN/P4gu8hlTj9AG77rH
 mRkMm2LNnsZB/BxXCCz5hHqbJ+RH8Q8O3Ak9OT6+EjoWO/ILm6WLPdBHF+NHmyuqLriw
 rI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3JX05tYCGijKFYZwundP0SWA2fF8+V1jI3B1WPSLqJI=;
 b=sg0bTWyKZsUvLfPQxrIfq/9UUyp3KuvY8geZvk1kCM6FQSB+aFx6Mol4MrLBREq4v+
 1vahQxLhtKf0iNrcVJiLlgj5eOLA2w1GvoWT0Q+n2hTXEzyBIBgm6ONzcR5CbhncpPeo
 GzUV3cqbENN9ZuzeSCcKI77ITWj4KAKGz9WrP8XMunaUnsTpIyaDPHgbZ+1mh6p50F8Y
 AzISWd3qa0GWdQLUS//IPhe5y4WwMxdKzJxcAz3Qp6Hh7nwis/euiJVrvdBlMTNyMQ//
 34DzpBqVfuTOrBBQjpSxZxtldDHOe8ZN9DV2ceBGizbeU9OSSRyKJV0THKKm2738m0tJ
 b6wA==
X-Gm-Message-State: AOAM5334rlpRZI9ajMPddOtXCWaKD1+NqCWBfavHekCtjjJuS5y569aT
 FY/mrgAW7JKZqBf8Nsxj/8dcKSSI0VjQ6g==
X-Google-Smtp-Source: ABdhPJzs2LXhJuHJQ5+20dNqwg0JkVSuDlPlk7pEvK/LpHfHLjL8VVS2OuZK3/CudfuQJjce9PEzhQ==
X-Received: by 2002:a63:fb56:0:b0:3aa:cec:6b6f with SMTP id
 w22-20020a63fb56000000b003aa0cec6b6fmr3165406pgj.409.1651325376263; 
 Sat, 30 Apr 2022 06:29:36 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/43] semihosting: Return failure from softmmu-uaccess.h
 functions
Date: Sat, 30 Apr 2022 06:28:51 -0700
Message-Id: <20220430132932.324018-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were reporting unconditional success for these functions;
pass on any failure from cpu_memory_rw_debug.

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


