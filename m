Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8336518DA7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:59:34 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlygH-0007Qi-7N
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVw-0000wK-4A
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVu-0003WE-D1
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id j8so15854448pll.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x8BxBi+dxwcNinwm6heDyciERoofO1ytsNZ6JDtu0RE=;
 b=Ap8tlY1/zvmj1NdsBqP7L3lr7TWoj7dETfMi8P6lmSeifw+nXAEx7F18kBuibwXh4A
 /YFgtTuvk1q792G/pTJQyvlDj/HdUEyeGVIXR5Oaua10WZHmEvCtrCBeQuJSS0ASZfQQ
 PLkw+hzRvDqEcAt+tw7dSgfRpZCDZY15nndRk+ZFoW8KOYP8Jr6I3aRkyM6op698SWvT
 w+kWhwKfy950+ULD3aAT11RCpI2jJluDX9e0ezUHD+rg/kPEzJFylDKquYsFDdxZzWbG
 1rLRiortOzOWkCDFj5E4lmpeF35g9sUvplOcsi8ap1Z5zJnJjoA8+TQE+tuJ3wqTARsa
 zWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8BxBi+dxwcNinwm6heDyciERoofO1ytsNZ6JDtu0RE=;
 b=4AMQsKaROxFo6hDGu9nu4o6oWsvOYpA7RZebOZOOdHFnMZBxZDlzu32jxjuPSeKD2U
 XCUNwnh12b9JHJ+FRXaabqfMnzBbbTZr2NgBo60LgqHvZPrn564y/O6rkSWjGqWMm6S5
 DACwyqUck2tgiQZtFY6ElIyof6WWNMhUHDCjeDijlUhgcVRMbreR5ojbD24xQ0tbfVsA
 hB1w5430Q4CtxpDtWjF58/bwOrJHjZjWQSTeXHl74bOllltsWAtwbfKIgmvc4LTKqLoZ
 HJM2PuHhTkHZxkasa6n0E+ZNMduOOvYuT/oWxEh2zS2ETi9iw+/wCnHYdqF5CgKrZPwD
 qq+g==
X-Gm-Message-State: AOAM531f+Xux1ikuGRFpNCptx24RkSzVTPaHtIafrc0UWPKh3q8Qh1Nq
 IYXwdbNWR1iVYCo/gv+pEeOQaeuvIMb7ew==
X-Google-Smtp-Source: ABdhPJxhX+ufgrvsUd0LaaXuvS+6DbvXAFQU43erNFaisJ9Wbrmgl/CHvOOT/DQki9Ba9Toq8dG9ug==
X-Received: by 2002:a17:902:9b92:b0:158:9b65:a78 with SMTP id
 y18-20020a1709029b9200b001589b650a78mr18564198plp.53.1651607329039; 
 Tue, 03 May 2022 12:48:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/74] semihosting: Move softmmu-uaccess.h functions out of
 line
Date: Tue,  3 May 2022 12:47:33 -0700
Message-Id: <20220503194843.1379101-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Rather that static (and not even inline) functions within a
header, move the functions to semihosting/uaccess.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/softmmu-uaccess.h | 42 +++-------------------
 semihosting/uaccess.c                 | 51 +++++++++++++++++++++++++++
 semihosting/meson.build               |  1 +
 3 files changed, 57 insertions(+), 37 deletions(-)
 create mode 100644 semihosting/uaccess.c

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
index 5246a91570..03300376d3 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -42,47 +42,15 @@
 
 #define put_user_ual(arg, p) put_user_u32(arg, p)
 
-static void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
-                               target_ulong len, bool copy)
-{
-    void *p = malloc(len);
-    if (p && copy) {
-        if (cpu_memory_rw_debug(env_cpu(env), addr, p, len, 0)) {
-            free(p);
-            p = NULL;
-        }
-    }
-    return p;
-}
+void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+                        target_ulong len, bool copy);
 #define lock_user(type, p, len, copy) softmmu_lock_user(env, p, len, copy)
 
-static char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
-{
-    /* TODO: Make this something that isn't fixed size.  */
-    char *s = malloc(1024);
-    size_t len = 0;
-
-    if (!s) {
-        return NULL;
-    }
-    do {
-        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
-            free(s);
-            return NULL;
-        }
-    } while (s[len++]);
-    return s;
-}
+char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr);
 #define lock_user_string(p) softmmu_lock_user_string(env, p)
 
-static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
-                                target_ulong len)
-{
-    if (len) {
-        cpu_memory_rw_debug(env_cpu(env), addr, p, len, 1);
-    }
-    free(p);
-}
+void softmmu_unlock_user(CPUArchState *env, void *p,
+                         target_ulong addr, target_ulong len);
 #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
 
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
new file mode 100644
index 0000000000..0d3b32b75d
--- /dev/null
+++ b/semihosting/uaccess.c
@@ -0,0 +1,51 @@
+/*
+ * Helper routines to provide target memory access for semihosting
+ * syscalls in system emulation mode.
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ *
+ * This code is licensed under the GPL
+ */
+
+#include "qemu/osdep.h"
+#include "semihosting/softmmu-uaccess.h"
+
+void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
+                        target_ulong len, bool copy)
+{
+    void *p = malloc(len);
+    if (p && copy) {
+        if (cpu_memory_rw_debug(env_cpu(env), addr, p, len, 0)) {
+            free(p);
+            p = NULL;
+        }
+    }
+    return p;
+}
+
+char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
+{
+    /* TODO: Make this something that isn't fixed size.  */
+    char *s = malloc(1024);
+    size_t len = 0;
+
+    if (!s) {
+        return NULL;
+    }
+    do {
+        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
+            free(s);
+            return NULL;
+        }
+    } while (s[len++]);
+    return s;
+}
+
+void softmmu_unlock_user(CPUArchState *env, void *p,
+                         target_ulong addr, target_ulong len)
+{
+    if (len) {
+        cpu_memory_rw_debug(env_cpu(env), addr, p, len, 1);
+    }
+    free(p);
+}
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 4344e43fb9..10b3b99921 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,6 +1,7 @@
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_SOFTMMU'], if_true: files(
   'config.c',
   'console.c',
+  'uaccess.c',
 ))
 
 specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
-- 
2.34.1


