Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D263515D93
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:32:33 +0200 (CEST)
Received: from localhost ([::1]:43712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknD6-0007ty-Dt
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAN-0004gP-0k
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAL-0006D4-4Z
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so10813378pjb.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8BxBi+dxwcNinwm6heDyciERoofO1ytsNZ6JDtu0RE=;
 b=PHR6CAiPt4gWta5B4Sg3UU7KLvMxEQMWB9HS/c4NZh6LDvzlpqfDzmWp22ponf8Pjo
 Cfl859Bvb9TxocU+rmhUcwj1pV8Og5SQrxpQwGGCrfh6VUmL4cFYap7tql5NHM7/hEdU
 bHtWw+gODtn4FstY9KFm7IXt5MH3Hf0rB6Ohu/24p+oui0fKkus1KGYvXdxdDMJ7todH
 ZrMUh1saaGwoCKcXSE9ScZUhmc0+yZtCzCL5h+/5LT64zyg8ai1G4lkd+cWHzU+X+uak
 Pa7DEhWITHhJd1VUkinj9iOvo33txd8c4ivaUH4t4FquwIporabUI+RBnfMSDATyj7vI
 JMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8BxBi+dxwcNinwm6heDyciERoofO1ytsNZ6JDtu0RE=;
 b=792OZE/R1Mw0x8NfMgi21AxGOmwustseVIDo3dEoe+cgX/ANPnBzdvl/brnybL7vxJ
 Y8EoFdhlagQsiw/TZAu1IVCw3NazicH7PeyUSjnRieNy6lBhxoQOJ5H4fMZ6d3r8+Uu/
 GJ5kvXXs6zO/FgAAWosipvQkdc2Yrw5jU60guVl4gYVFQUQn8hLL9nSAYjrh6PHqTiv0
 TcunjGbQAaFS1GuNeHQQFe7DShuxakLkRrjqfgGNNo69/dV/vF8a1gFQC7uF54TmrLU8
 StGt1DISymDsaXEc9f3H7xV+5Xwwmehnel8JyfYJfgH9j3w27l4lBO/1vgBz5PYZiUfB
 qmbA==
X-Gm-Message-State: AOAM531c8LydSyxAYEK6hW1e+nBCEIekqRhAsWXEykW2QFMMtC3zrSg0
 vpciMV3e5KfuoCcUhlcQHu6O9SshKub/gA==
X-Google-Smtp-Source: ABdhPJzEBkxkXAa3nriIPQhsRCIemlqJvyH+tCWnr2FWSN5wCovP9gnr/7AfU1Ou5jEgaF/YsvlZ1Q==
X-Received: by 2002:a17:902:edc5:b0:158:4065:a5ce with SMTP id
 q5-20020a170902edc500b001584065a5cemr4019540plk.55.1651325378263; 
 Sat, 30 Apr 2022 06:29:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/43] semihosting: Move softmmu-uaccess functions out of line
Date: Sat, 30 Apr 2022 06:28:53 -0700
Message-Id: <20220430132932.324018-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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


