Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4E62F1D1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxzN-0007a2-H1; Fri, 18 Nov 2022 04:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz7-0007Sy-8w
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz5-00025T-GE
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:33 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso7815474pjg.5
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P/0TNcxpZ0rTanmAu/qQ90zp2zQbXB43oDl5viBlCGk=;
 b=ZtUSmf4PlIUG4e6UNo8vMCHuNV8t3xuK2jIWpOCzYPgiZR5VyHKrw4Nq2jT/MXhzUc
 UVvQYXWIcpp9mjVgqNu51fjmBoZe+2HkmuoUUPfvukUXIMWupB/d1Lz7muVUDYgnnpLI
 8m5PTF/ZLOjEPXeGwLujW2Ug5i9RYVOFBCdiUzrG9jD5gAST4GYU3tzn+oiJGlbO6r4Q
 XrUg2BqOOla6ooiGLzUFG3rtPnB2D8zMNRfNm/BsLTT1dkctoXQ/W7/oL2D6uA34VXdI
 kLLc3J7NceAV+JInVaLIRRfuU3ozs3m62/5v6A11/EojbhJLSiF9ZGLLHXiE1yFLw7k6
 UVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P/0TNcxpZ0rTanmAu/qQ90zp2zQbXB43oDl5viBlCGk=;
 b=ZDVUZSo1EX35638a/opnN5SeMfq89rhUPgt2cRzCUr361Cf3qETBPXspmfEi2PMcbn
 bqHZKLVm92hgLid602czq8OxCLeQz9/59pActjgLLXHU1S1vxlAM8tNGy1iZJ3YLqSpv
 7oKuHsHtFPghZJoCcRWERFFdpAfgahddsFY+SsUT4V6/wxS2vGdCzjCyCWdGKyiH5WBj
 /nXuYgvC0fLZeunCP4y9KfRX8EPfMKoZLIoDmkeOrvcHlpieTS85SQnqc+Z+L2JxSkVl
 X3fPUKnbcW3hcAjO7sW9ddH6Kyc0HIWCxIYpRENoBGKGS2yTgsskRgWpK0VUBsOzPDWY
 svIQ==
X-Gm-Message-State: ANoB5plsSjh/BAJjU7zHcio5rIJPCbyBWlwC/2NmFK6Ob/EGnqwJdtJ0
 LiKP4JR8xpEwtHrPaMlbdSsHm8b+nLy0DA==
X-Google-Smtp-Source: AA0mqf6Ttj+8n1k2Fw+ayyGAGbyn+HkHZBdGXct+k/4oPYt4y28x0yc7rJrekpyAcBiavOLRq8IxHA==
X-Received: by 2002:a17:902:6a8b:b0:186:6fde:e9f5 with SMTP id
 n11-20020a1709026a8b00b001866fdee9f5mr6516256plk.139.1668764909068; 
 Fri, 18 Nov 2022 01:48:29 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 16/29] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
Date: Fri, 18 Nov 2022 01:47:41 -0800
Message-Id: <20221118094754.242910-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hosts using Intel and AMD AVX cpus are quite common.
Add fast paths through ldst_atomicity using this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
 1 file changed, 60 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 68edab4398..d2a3783193 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -35,6 +35,14 @@
 
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_al16_fast    true
+#elif defined(CONFIG_TCG_INTERPRETER)
+/*
+ * FIXME: host specific detection this is in tcg/$host/,
+ * but we're using tcg/tci/ instead.
+ */
+# define HAVE_al16_fast    false
+#elif defined(__x86_64__)
+# define HAVE_al16_fast    likely(have_atomic16)
 #else
 # define HAVE_al16_fast    false
 #endif
@@ -160,6 +168,12 @@ load_atomic16(void *pv)
 
     r.u = qatomic_read__nocheck(p);
     return r.s;
+#elif defined(__x86_64__)
+    Int128Alias r;
+
+    /* Via HAVE_al16_fast, have_atomic16 is true. */
+    asm("vmovdqa %1, %0" : "=x" (r.u) : "m" (*(Int128 *)pv));
+    return r.s;
 #else
     qemu_build_not_reached();
 #endif
@@ -379,6 +393,24 @@ load_atom_extract_al16_or_al8(void *pv, int s)
         r = qatomic_read__nocheck(p16);
     }
     return r >> shr;
+#elif defined(__x86_64__)
+    uintptr_t pi = (uintptr_t)pv;
+    int shr = (pi & 7) * 8;
+    uint64_t a, b;
+
+    /* Via HAVE_al16_fast, have_atomic16 is true. */
+    pv = (void *)(pi & ~7);
+    if (pi & 8) {
+        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
+        a = qatomic_read__nocheck(p8);
+        b = qatomic_read__nocheck(p8 + 1);
+    } else {
+        asm("vmovdqa %2, %0\n\tvpextrq $1, %0, %1"
+            : "=x"(a), "=r"(b) : "m" (*(__uint128_t *)pv));
+    }
+    asm("shrd %b2, %1, %0" : "+r"(a) : "r"(b), "c"(shr));
+
+    return a;
 #else
     qemu_build_not_reached();
 #endif
@@ -695,23 +727,35 @@ static inline void ATTRIBUTE_ATOMIC128_OPT
 store_atomic16(void *pv, Int128Alias val)
 {
 #if defined(CONFIG_ATOMIC128)
-    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    qatomic_set__nocheck(pu, val.u);
-#elif defined(CONFIG_CMPXCHG128)
-    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    __uint128_t o;
-
-    /*
-     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
-     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
-     * and accept the sequential consistency that comes with it.
-     */
-    do {
-        o = *pu;
-    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
-#else
-    qemu_build_not_reached();
+    {
+        __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+        qatomic_set__nocheck(pu, val.u);
+        return;
+    }
 #endif
+#if defined(__x86_64__)
+    if (HAVE_al16_fast) {
+        asm("vmovdqa %1, %0" : "=m"(*(__uint128_t *)pv) : "x" (val.u));
+        return;
+    }
+#endif
+#if defined(CONFIG_CMPXCHG128)
+    {
+        __uint128_t *pu = __builtin_assume_aligned(pv, 16);
+        __uint128_t o;
+
+        /*
+         * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
+         * defer to libatomic, so we must use __sync_val_compare_and_swap_16
+         * and accept the sequential consistency that comes with it.
+         */
+        do {
+            o = *pu;
+        } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
+        return;
+    }
+#endif
+    qemu_build_not_reached();
 }
 
 /**
-- 
2.34.1


