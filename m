Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26F55BE7F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:48:00 +0200 (CEST)
Received: from localhost ([::1]:55456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o644t-0005rW-Fn
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Eu-0002BA-9Z
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Es-0008G4-Hw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:16 -0400
Received: by mail-pf1-x432.google.com with SMTP id d17so10917841pfq.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XykDNb8AiF5XqooTWDspyQ6eumaI59tyN1vSYpnaRMw=;
 b=xjeuGB2Bf7LQdol2RCndLQeLg+HAxOAMtMwAn6KTfZKlCSG1bY13ntZLO2zeMZ67Ce
 VWEmFmEjVXdIpaPWjn4+I5cb24CUQpfNoF67HlgV/iUEcfFbP5/z41QNq+U0yDsU+OS6
 hyt9nYbx+qpctUEnQwllojZYoy3HKPglZRUnbomJMrSF/AGib029zfFyjDHkNDjwxSuH
 euZNEdJM6g6BknqQ8pnsJbArVRZ93a2ydmyj5mfm56yUC3QbxAXKOHWZFumQnkPlIBZ1
 uYkwN9vWlzyVhu9aezh6HAM3fyXefqE1xW+/xgAVTh+0Lh9d3S6WfLQVN/FnTsotQwsE
 m/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XykDNb8AiF5XqooTWDspyQ6eumaI59tyN1vSYpnaRMw=;
 b=ZdQ8tHAyZg3/Ml7Tw4hgH9WG0HgFrptKHaNSY5BVh9nzwF3BazJQjOM0VAsBx5R0Ce
 8CASogPfO/l5ojYGbOHPuRh8Mq2AM/j0zgJ7ZozynUUCnoLvbheyJS5Zvrz7Tk6wfWR5
 Iu3B/i5SVWUs2+DxNTPXXtvN8i+6rPo1ZKhBK5qFgqevhUIzMvVYjSikEqn3hguBQzln
 nf0WW7DdSas06/dgdfd3qArKcHS8ipRVj0e20IVnyzjo9x7Cs5adnIu3wEaAQ/0QBNQ/
 iZjeBddd+Mvw9B1v5wudubBQbqCTWipHNkHWKWa1nkkHzDfx3zMfDbYjbJaaQX8c8tx8
 sJ+Q==
X-Gm-Message-State: AJIora98TXiPudngGfEhB+hVnKYoeB9PMrhrq1gt+Df7tmxNnisD8k3U
 m7fp5LCEuUDjXtBhjgPB/oWStDgxUU17Bg==
X-Google-Smtp-Source: AGRyM1uaUF2k8KJbTmeR4DMf7I0ZVzjb5bUT6CEwscereyLNznu9VySTxsiFM8Yx+IF9ThMmZCYyAA==
X-Received: by 2002:a05:6a00:14c7:b0:525:89c1:35fb with SMTP id
 w7-20020a056a0014c700b0052589c135fbmr2755157pfu.36.1656392053235; 
 Mon, 27 Jun 2022 21:54:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/60] semihosting: Return failure from softmmu-uaccess.h
 functions
Date: Tue, 28 Jun 2022 10:23:05 +0530
Message-Id: <20220628045403.508716-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


