Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1752F69A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:11:48 +0200 (CEST)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCih-0000ZB-9E
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbL-0007zz-F7
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbJ-0003yQ-R7
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: by mail-pl1-x630.google.com with SMTP id c2so8576739plh.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtCh1R/o+jWczZ2gQY+9f4Xav0T6t+bxgoxTR2mENvU=;
 b=skWA/feguyRr+bfxNc8QFtwOqU9g9w8Qn2gJr9WI+VKNcp+sjposldyXF0bGLUsq9p
 l6CYWKlYa/G8xRbyCbJIiGaZfkiBeyELgd7PP3zVxLUyk4ZOC1pRBdLdxyHVWCG73HT4
 B4LUEMEShoaKkNrO2woQ31alCjmbM4jxdJKldr4FYFRftscRuUjJPC+8JqJuaMFrWuJO
 K5eR2U3Dm2taGYYz/r4HOQ68TEzIggXk61Fg+x0DXMoVhybKBNJL0+vJL3Lb3NAhQ1et
 U3YGj0g7h6WvYXkcR0gY2iu+JNL3+gfzg8x1mAuQ0NZfEdq/1Ek7IrBt0JjUBASPxlit
 ocfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtCh1R/o+jWczZ2gQY+9f4Xav0T6t+bxgoxTR2mENvU=;
 b=GMCA4JD9dLA/2SbM5+yRJfzQvMqm3dVmaCDVj++EljnVFfxqAV+t1bbp1zcvW20qf/
 vjI6ncIy3d3Ku9ggkn7gsnbwG3s+jVwr/5G8ZHzQTFCNZv3h9gcRPhsbHTQVzaJale2I
 ay9tvtBtLzIAMMyh4ChdA2SkNUunJrh+vlnnqZH2Nt3UapCN9HG6+JHt+ZVyZIb8OBNB
 bjLIGmqqOWmlvHp8vaIyMEeTK937JEEBJfq66YQadj+Qoou6IBp2QVOUPrdDOAovw7uM
 KPF9tNy5rVK5GcqjZxlNu01oqCD91BF2aEhpTCjF7/5UlWPwKbQ7vS3vVtwEgD+MQLID
 oVRg==
X-Gm-Message-State: AOAM530DEIH09V5r7WWDZxqwYZHEw7guhYla9/xy5VOYJ10/13CuzCha
 ZlDzrT1QLhkwtsNB2PIpA1yaZU0CIJYDXg==
X-Google-Smtp-Source: ABdhPJya1fsZugCiTy9RnkSRw4NWAnhREq8tlA4duO6d4L6EjsCa2b1GELRoFyTpd5bNft/FvRQfiQ==
X-Received: by 2002:a17:903:44e:b0:161:58c6:77e5 with SMTP id
 iw14-20020a170903044e00b0016158c677e5mr12283860plb.81.1653091447806; 
 Fri, 20 May 2022 17:04:07 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 04/49] semihosting: Move softmmu-uaccess.h functions out of
 line
Date: Fri, 20 May 2022 17:03:15 -0700
Message-Id: <20220521000400.454525-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


