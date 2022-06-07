Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD269541D73
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:17:39 +0200 (CEST)
Received: from localhost ([::1]:52912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhW6-0004vk-T1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5i-0007Ge-4l
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:21 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:35282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5f-0001MQ-6I
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:17 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-f16a3e0529so24734200fac.2
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtCh1R/o+jWczZ2gQY+9f4Xav0T6t+bxgoxTR2mENvU=;
 b=n/e/3Ibejdwwzk0fO9KDgg5tUdov9K9Py04g5FCk6aVT3+lAH+sd5mOKPHIegAVvOo
 VvCRN0PwczvP9YXuz3F9IW9ENQHXSVZpnmtT24STLI2upJhmR8xcb2+EII+Ihrkon5PU
 pjPPH8F98wigudDpmlhdnap4eTZWypn1BttvE7AOOn7RqFEprFuwCUk5Vshvi+whfNw4
 HJtH+wrunihnjMM7BigqKB7eDTU0/IzQmYYyQn5C9WsvR8nj+G9ehEHtUQOIQYOM8gOf
 zjGKaLDRmdTo05BFD975TO9hLIyycic83lsy8VBvHpWCYSiEyPwdMA10PO4RC9yMtPQY
 CW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtCh1R/o+jWczZ2gQY+9f4Xav0T6t+bxgoxTR2mENvU=;
 b=OyAhGmEueg0PXNh209s5plJSzqPyi5xkYdlpTyrQrKQjr9ChFZVcSfwJXhqTOQYO31
 Q+mt/xOcftQNnJEvGVV8LbjNMpzOlPRSZQprQp6uAhS2mJB7j5JxfpRDOc+6Q2bQh1EM
 DwV+dlc9XrVj0hM08k8GKQWlHla0YdblQCdCalBUlYN4JoqNxllowbnqmDGRvsqH57KO
 9yGauCALp5L3TMx3e05rHj6MKOOFn/tuyWAqVbm15fYwv7fl8kRG4TqsiUTKHopg7wzZ
 JNf9BOhbLu4DA98WBsRZ0lol4vldIz34OivgBPbzxN1W5x5oBbixZdyvQl3gktBRLs3B
 y3Uw==
X-Gm-Message-State: AOAM533MsJ0pNf2yRbJHlc5z+GeZ6jRWsx+qUPETY5ExxTzvy5XhEFuH
 0N5ikE2NKuViX+RVsFPp9AeaVysxoyescA==
X-Google-Smtp-Source: ABdhPJxTlQHsGaRyTNJMPmw9QVm98RVjApxa9PlYKBm58X9cF1dVehf5dWpwGBIUT6aSaj79c3/b9w==
X-Received: by 2002:a17:90b:4b83:b0:1e3:3ad3:612c with SMTP id
 lr3-20020a17090b4b8300b001e33ad3612cmr42630612pjb.87.1654634762685; 
 Tue, 07 Jun 2022 13:46:02 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 04/53] semihosting: Move softmmu-uaccess.h functions out of
 line
Date: Tue,  7 Jun 2022 13:45:08 -0700
Message-Id: <20220607204557.658541-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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


