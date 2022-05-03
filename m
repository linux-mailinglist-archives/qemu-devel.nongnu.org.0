Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC77518D7D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:53:04 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyZx-0005YH-IL
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVv-0000v3-MM
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:51 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVs-0003Vk-Pi
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:51 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3228084pjb.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3JX05tYCGijKFYZwundP0SWA2fF8+V1jI3B1WPSLqJI=;
 b=sX78squjtmzGOpUIRbp50M4d2uh99P40qHeG2CdHVN4D2rk6435KnvgQ4l45KzyF7M
 uD/gM+P55XCSCd4DPQEpGLzJp5EKGeQPOxXKmd9i1MDnveSUvZW0VsW1V9tdV8EqEgU1
 mlXEw8+YJ6f6e7wajO/V8CfH82Or1ornKYWFB+vZysiGyDcWb67egen/JJfr7u2dVhX/
 xwKB7m0RhF7dniC6qu86kKnrQZJ7Zb0V5XaVIuIj8Nn10976qRAkQLmKk5y5aw2S43u1
 S9AO7jMJP2ZjGhsCHiumbtQQoIGw1Ay7fSeVD5eCXHW04u/KiU9SFOqs96PslxOUlZ3m
 c0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3JX05tYCGijKFYZwundP0SWA2fF8+V1jI3B1WPSLqJI=;
 b=wIDRNjCKdaWRUVz0CRfEWmeoEH8ZODZpD4JIZLZcWbSDcoXBn2gEmiSKBuBCggnNe0
 6hXR0y9Osbf348FL7Sqh8vBY+xSdDX3wFpeyUtYG5uEfMAq5IiMmEOTdXyFXbNRQGOAC
 znPkxEKsI0pOBufrbz/IeEBLvfszB2+vc3+laKcZbuIJvCJ3Wqg1VVLnWGtTh7I7Avlg
 ogW6kV9jce+rTRM2amit90s6zbwnKelS8vVij+byWaBqHW+dwPkF+PDMqCdroqtB+IWA
 1vuXlEr/no/tV8cBWaJyDXflzW+r3GLsbsICCVV5ZSIgW/XElAhpgkD+C4rjn9CQbv/k
 KHeQ==
X-Gm-Message-State: AOAM532JYpQVyowSwjH0nQTGaoPHwfMxDqz18ePWygdHJ8RDdgJRpTQF
 0NZkEXx+gqEbpCtiZ4s3q7fpTyCHv4HIig==
X-Google-Smtp-Source: ABdhPJzMN2ivCvoD8m0d858RI++oyqemXeDcknbOLvfKWMfEwjwu6ri4zZsuhWqoUG51bPni80jxtg==
X-Received: by 2002:a17:902:6b87:b0:158:a0d9:9bd with SMTP id
 p7-20020a1709026b8700b00158a0d909bdmr18081458plk.156.1651607327363; 
 Tue, 03 May 2022 12:48:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/74] semihosting: Return failure from softmmu-uaccess.h
 functions
Date: Tue,  3 May 2022 12:47:31 -0700
Message-Id: <20220503194843.1379101-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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


