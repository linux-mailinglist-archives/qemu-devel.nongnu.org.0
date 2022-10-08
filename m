Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1158B5F85E1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 17:38:22 +0200 (CEST)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohBu8-00027v-M7
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 11:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohBsj-0000kQ-5j
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 11:36:53 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohBsh-0000OW-4K
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 11:36:52 -0400
Received: by mail-qv1-xf31.google.com with SMTP id i9so4842523qvu.1
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aasEVS6q4enxB0Nqvck/VaY4MHwnH+5XIjrLTmvFjqY=;
 b=EWK0awPLCQcK/C/nFUuDsWSlHqXDGXgED++1uuYKVeatfwcBQekQP5mQC9jCW2ycBA
 B6+yx9Z0/SI7mb4vAw28e77VYggC9WVQTFdwM6re8dasR0A0UfDoGRnePrS6iKg1odou
 n5mexQn9kLN0W6rJgVKpGpwdOzdxnRSKR1xLdq2gBmFYbVQZ+aAjJuzi9Kb+OriKpI+q
 WSa+Jhe40RJsvfjt9buVWzEw8RFCFouLjBtxKpI2XFbYHyjDUBLmzVi8HFONhGvQhPLk
 czXhQ/f9HbPaBQx2E+3hE+ao1wRHWTZBX2F55Nx1T7Xq3GG3eMsQYc60st2zJKv5TvO2
 Ta2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aasEVS6q4enxB0Nqvck/VaY4MHwnH+5XIjrLTmvFjqY=;
 b=pUumqqXahFywrhILurSEaAad/pzAFrTFLsqO2XW9F6FTARE7kLatZi+QY//sF8xPjM
 NJVcn4f6I2WCSXN36WZKZoEczXTIkLdNE7moW1r8CalolCJ0q/FGGM5J0Wm7qYsuDIkz
 D7lPD2byBNZ02+EFRXLcg5zyTIWlGA69dZIQoyOuNiJDjIxFHsqlrJsIENq7zOq814sW
 9AzO8qUppBy35y0D+M97Tx6WM1JaXa06eBoR+xJ3ACdPnwIAJeJcBd1qxnvQd538OmW2
 jUdCWnRMtvcsXvGHxCsFpTXtR5ak7V+rxJxixSHHMS/B0QORDIxE+LDsTJ4D3F9eno0Q
 VCIQ==
X-Gm-Message-State: ACrzQf11fVYtgOKTpy2lQDkmzo8g/A7fmUi3WIEr742k9YfWxB/JnY2n
 61TecxTLrb6Y7o7xDaW21iUZFoAko4pk+g==
X-Google-Smtp-Source: AMsMyM4YjLStNExgYAA6DsFHMRf72j5ht3uIiOvj1iusBDagCW+TuyeOpqq3h3PWcZ228Z+2ZjihTg==
X-Received: by 2002:a05:6214:d8b:b0:4b2:f6f4:bf5b with SMTP id
 e11-20020a0562140d8b00b004b2f6f4bf5bmr7423308qve.91.1665243409470; 
 Sat, 08 Oct 2022 08:36:49 -0700 (PDT)
Received: from stoup.. ([50.204.134.210]) by smtp.gmail.com with ESMTPSA id
 65-20020a370844000000b006ec51f95e97sm462667qki.67.2022.10.08.08.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 08:36:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] include/qemu/atomic128: Support 16-byte atomic read/write for
 Intel AVX
Date: Sat,  8 Oct 2022 08:36:46 -0700
Message-Id: <20221008153646.1504760-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Intel has now given guarantees about the atomicity of SSE read
and write instructions on cpus supporting AVX.  We can use these
instead of the much slower cmpxchg16b.

Derived from https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Paolo, we probably ought to modify gen_ld[oy]_env_A0 to match,
at least with CF_PARALLEL set.


r~

---
 include/qemu/atomic128.h | 44 ++++++++++++++++++++++++++
 util/atomic128.c         | 67 ++++++++++++++++++++++++++++++++++++++++
 util/meson.build         |  1 +
 3 files changed, 112 insertions(+)
 create mode 100644 util/atomic128.c

diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index adb9a1a260..d179c05ede 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -127,6 +127,50 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
         : [l] "r"(l), [h] "r"(h));
 }
 
+# define HAVE_ATOMIC128 1
+#elif !defined(CONFIG_USER_ONLY) && defined(__x86_64__)
+/*
+ * The latest Intel SDM has added:
+ *     Processors that enumerate support for Intel® AVX (by setting
+ *     the feature flag CPUID.01H:ECX.AVX[bit 28]) guarantee that the
+ *     16-byte memory operations performed by the following instructions
+ *     will always be carried out atomically:
+ *      - MOVAPD, MOVAPS, and MOVDQA.
+ *      - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
+ *      - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
+ *        with EVEX.128 and k0 (masking disabled).
+ *    Note that these instructions require the linear addresses of their
+ *    memory operands to be 16-byte aligned.
+ *
+ * We do not yet have a similar guarantee from AMD, so we detect this
+ * at runtime rather than assuming the fact when __AVX__ is defined.
+ */
+extern bool have_atomic128;
+
+static inline Int128 atomic16_read(Int128 *ptr)
+{
+    Int128 ret;
+    if (have_atomic128) {
+        asm("vmovdqa %1, %0" : "=x" (ret) : "m" (*ptr));
+    } else {
+        ret = atomic16_cmpxchg(ptr, 0, 0);
+    }
+    return ret;
+}
+
+static inline void atomic16_set(Int128 *ptr, Int128 val)
+{
+    if (have_atomic128) {
+        asm("vmovdqa %1, %0" : "=m" (*ptr) : "x" (val));
+    } else {
+        Int128 old = *ptr, cmp;
+        do {
+            cmp = old;
+            old = atomic16_cmpxchg(ptr, cmp, val);
+        } while (old != cmp);
+    }
+}
+
 # define HAVE_ATOMIC128 1
 #elif !defined(CONFIG_USER_ONLY) && HAVE_CMPXCHG128
 static inline Int128 atomic16_read(Int128 *ptr)
diff --git a/util/atomic128.c b/util/atomic128.c
new file mode 100644
index 0000000000..55863ce9bd
--- /dev/null
+++ b/util/atomic128.c
@@ -0,0 +1,67 @@
+/*
+ * Copyright (C) 2022, Linaro Ltd.
+ *
+ * License: GNU GPL, version 2 or later.
+ *   See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "qemu/atomic128.h"
+
+#ifdef __x86_64__
+#include "qemu/cpuid.h"
+
+#ifndef signature_INTEL_ecx
+/* "Genu ineI ntel" */
+#define signature_INTEL_ebx     0x756e6547
+#define signature_INTEL_edx     0x49656e69
+#define signature_INTEL_ecx     0x6c65746e
+#endif
+
+/*
+ * The latest Intel SDM has added:
+ *     Processors that enumerate support for Intel® AVX (by setting
+ *     the feature flag CPUID.01H:ECX.AVX[bit 28]) guarantee that the
+ *     16-byte memory operations performed by the following instructions
+ *     will always be carried out atomically:
+ *      - MOVAPD, MOVAPS, and MOVDQA.
+ *      - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
+ *      - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
+ *        with EVEX.128 and k0 (masking disabled).
+ *    Note that these instructions require the linear addresses of their
+ *    memory operands to be 16-byte aligned.
+ *
+ * We do not yet have a similar guarantee from AMD, so we detect this
+ * at runtime rather than assuming the fact when __AVX__ is defined.
+ */
+bool have_atomic128;
+
+static void __attribute__((constructor))
+init_have_atomic128(void)
+{
+    unsigned int a, b, c, d, xcrl, xcrh;
+
+    __cpuid(0, a, b, c, d);
+    if (a < 1) {
+        return; /* AVX leaf not present */
+    }
+    if (c != signature_INTEL_ecx) {
+        return; /* Not an Intel product */
+    }
+
+    __cpuid(1, a, b, c, d);
+    if ((c & (bit_AVX | bit_OSXSAVE)) != (bit_AVX | bit_OSXSAVE)) {
+        return; /* AVX not present or XSAVE not enabled by OS */
+    }
+
+    /*
+     * The xgetbv instruction is not available to older versions of
+     * the assembler, so we encode the instruction manually.
+     */
+    asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (0));
+    if ((xcrl & 6) != 6) {
+        return; /* AVX not enabled by OS */
+    }
+
+    have_atomic128 = true;
+}
+#endif /* __x86_64__ */
diff --git a/util/meson.build b/util/meson.build
index 5e282130df..4b29b719a8 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -2,6 +2,7 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 if not config_host_data.get('CONFIG_ATOMIC64')
   util_ss.add(files('atomic64.c'))
 endif
+util_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('atomic128.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
 if config_host_data.get('CONFIG_EPOLL_CREATE1')
-- 
2.34.1


