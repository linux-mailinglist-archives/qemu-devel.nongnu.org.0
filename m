Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E511D6070F4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:24:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmOA-0007Ex-JA
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:24:18 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmH1-00036q-1g
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGe-0002vD-9h
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:32 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmGc-0005bK-9E
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:16:31 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 20so1804354pgc.5
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PB3nAjYqPE0Ri3rKlsMJ9c6TgJjZ6GaMPRBD/PmouBs=;
 b=F9iS+YBpSImt8bieV9JH3062iAxm0rA2e75f1dotc1/K6WT2+6pu4SinR0jY8EXZhB
 PNwyR0iAFu4we0MjGavdAZ+EpezSQhlNpjmbQOEBUpc8P+2/8ntAVfAHtwOpr/IBSRfR
 V5WSuXMX3htp3GoJWVDNHQodKw2AgavTIHK1jJli+dDISUJzyw0++iqOoWMHm31RiY44
 gZzpAgvzF/EkjG2stCTJoDGoU0MuIwayAvgDSt3cI1J48Fq2WOL/rS/8+JYoxIFtVJ5A
 0a5H0W6UA22rZrCvy+4+87fpyQJ+jWrXpDFrpmfhyWvxw14F6NLT3MNF00THy9Zdt3zM
 HgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PB3nAjYqPE0Ri3rKlsMJ9c6TgJjZ6GaMPRBD/PmouBs=;
 b=38UgUm9JevIpulKzf4eQW5M4/BAh3KMHI6SfM0q641ffyIfq2tD1S0GJzkQq5v2A9U
 2+NUvslnNGKnpaHorCPNRm1aPDVD1W52b0doeQK5Cc6ih4jP3VYjFkAeWE2DnoK6krHl
 /o2j2Y3Re/63LedvAiyDLtXfXVRzKxD1SsFoiiOa9YdLGV/2rHAxKWtmsAauSLMeXRce
 BFt33Gs36UpN41tZ8nksVD9DZqE02/NbaOjMReFfd1hrV1qDwAT9BbnMe3L8aIFT+Nqg
 kv1pfri4CKuiorSxpruAxjd+qok1KbDZMPei+yngOZJsJ90baW1Ov2KFrDL4w7Hh1lSi
 65rw==
X-Gm-Message-State: ACrzQf0WCjtrW5zDRZxR36tSQqM6cUdt0sVas23xOzZHKf0pxikoZWHJ
 jyOTPhtD6fGwpNmLup+oiSlC4eYVTbeJ5j1T
X-Google-Smtp-Source: AMsMyM44y3Ts+nrPZ04xJVnsNbDi18EzSkue2wf714aJRpe+iHJH4j4Xa4Yt/Xt8kuIJPSqNu+8Qhw==
X-Received: by 2002:a65:6cc7:0:b0:42a:4d40:8dc1 with SMTP id
 g7-20020a656cc7000000b0042a4d408dc1mr15328647pgw.321.1666336588701; 
 Fri, 21 Oct 2022 00:16:28 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.16.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:16:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/36] include/qemu/atomic128: Support 16-byte atomic
 read/write for Intel AVX
Date: Fri, 21 Oct 2022 17:15:14 +1000
Message-Id: <20221021071549.2398137-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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


