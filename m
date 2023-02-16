Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC3698ACA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTG-0003UJ-Vy; Wed, 15 Feb 2023 21:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTD-0003Su-Sf
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:04 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTB-0005kA-G8
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:03 -0500
Received: by mail-pg1-x541.google.com with SMTP id c29so415592pgm.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QmXLwNFeU+xZu9xjrhAU7pKrmUasowHjjl+QfLvQ2bo=;
 b=Eole4val/WiTsAky44w69zKh7PVT6mdO78tbMD7H6TYOWY0FNHps/phVgw/kFi61TO
 fP19QViuWXUDpMt8g700NDPbr/1C5Cd3M8w/Lg8e0q8Qfx8Ldr94iJ/bToUm73uZo0lm
 Z86bRlelc+nToizXYJga97KxsotYyYirZHmLd7jAQo4H2qSwL5D3NRzCdfqZeGcqDeOK
 iYqQPM42dceGIMhW0Lq5y6M70tH7MwCRu3x9oXaCCaQMJNRb0yibz00FcIgfMlAFWwo4
 Yl3DBOHdVyNHDO93kahu69yIV+rKVizIFE3DErTbaZW/DK9k0vx3vCGGaPWOTmgT6Y1L
 EkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmXLwNFeU+xZu9xjrhAU7pKrmUasowHjjl+QfLvQ2bo=;
 b=8R/ze80vot1c0xt3cyjp/mUHi23uRiN6YCVrSmePSf1LVcNVjg6yWAunepsPvL2dAk
 XUUqa+5LElNJMroTO+hM4tF4Pg2Isn7PgMQcMAtPTY8u9fZyUizWNx9opoiHiwvWFqrq
 VEyK1qbNH0aGN84h7eWqcK6TlF5M1umLiLhXxN8yPBeGdhr9m8byekWPYIAofApa/+dL
 oNeyelUUpc059KagO0vvLr1uyFBO7zY8F6sM+GBkmyU88Ng0POC5bPegD57vfibiz1np
 esEzFtp3xPZVHNc/M0UTHnhsfW+TOvLW86/YP/XRGQHEyduADbRobfWDbeNm8647QtOZ
 8h7A==
X-Gm-Message-State: AO0yUKWhdBQnbiK97lbBkZr4sZaZnbJqHy//KJ+wAgeVvP2660kYqh5Q
 JLA1TnpeAXrIt7B07w31/gPn1V6+YNLxIgcyzOa+YQ==
X-Google-Smtp-Source: AK7set95cj0oXm4U5XUarYPHbKc7bWnhdm2ug+R3gam1lGzfkvBzVY6wopa2gLA73VDwu4pIK0UKJQ==
X-Received: by 2002:aa7:9ad0:0:b0:5a8:58b5:bfa5 with SMTP id
 x16-20020aa79ad0000000b005a858b5bfa5mr3630249pfp.4.1676516279978; 
 Wed, 15 Feb 2023 18:57:59 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.57.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:57:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/30] meson: Detect atomic128 support with optimization
Date: Wed, 15 Feb 2023 16:57:22 -1000
Message-Id: <20230216025739.1211680-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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

There is an edge condition prior to gcc13 for which optimization
is required to generate 16-byte atomic sequences.  Detect this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                    | 52 ++++++++++++++++++++++------------
 accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
 2 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/meson.build b/meson.build
index a76c855312..964469780a 100644
--- a/meson.build
+++ b/meson.build
@@ -2229,23 +2229,21 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
         return printf("%zu", SIZE_MAX);
     }''', args: ['-Werror']))
 
-atomic_test = '''
+# See if 64-bit atomic operations are supported.
+# Note that without __atomic builtins, we can only
+# assume atomic loads/stores max at pointer size.
+config_host_data.set('CONFIG_ATOMIC64', cc.links('''
   #include <stdint.h>
   int main(void)
   {
-    @0@ x = 0, y = 0;
+    uint64_t x = 0, y = 0;
     y = __atomic_load_n(&x, __ATOMIC_RELAXED);
     __atomic_store_n(&x, y, __ATOMIC_RELAXED);
     __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
     __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
     __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
     return 0;
-  }'''
-
-# See if 64-bit atomic operations are supported.
-# Note that without __atomic builtins, we can only
-# assume atomic loads/stores max at pointer size.
-config_host_data.set('CONFIG_ATOMIC64', cc.links(atomic_test.format('uint64_t')))
+  }'''))
 
 has_int128 = cc.links('''
   __int128_t a;
@@ -2263,21 +2261,39 @@ if has_int128
   # "do we have 128-bit atomics which are handled inline and specifically not
   # via libatomic". The reason we can't use libatomic is documented in the
   # comment starting "GCC is a house divided" in include/qemu/atomic128.h.
-  has_atomic128 = cc.links(atomic_test.format('unsigned __int128'))
+  # We only care about these operations on 16-byte aligned pointers, so
+  # force 16-byte alignment of the pointer, which may be greater than
+  # __alignof(unsigned __int128) for the host.
+  atomic_test_128 = '''
+    int main(int ac, char **av) {
+      unsigned __int128 *p = __builtin_assume_aligned(av[ac - 1], sizeof(16));
+      p[1] = __atomic_load_n(&p[0], __ATOMIC_RELAXED);
+      __atomic_store_n(&p[2], p[3], __ATOMIC_RELAXED);
+      __atomic_compare_exchange_n(&p[4], &p[5], p[6], 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
+      return 0;
+    }'''
+  has_atomic128 = cc.links(atomic_test_128)
 
   config_host_data.set('CONFIG_ATOMIC128', has_atomic128)
 
   if not has_atomic128
-    has_cmpxchg128 = cc.links('''
-      int main(void)
-      {
-        unsigned __int128 x = 0, y = 0;
-        __sync_val_compare_and_swap_16(&x, y, x);
-        return 0;
-      }
-    ''')
+    # Even with __builtin_assume_aligned, the above test may have failed
+    # without optimization enabled.  Try again with optimizations locally
+    # enabled for the function.  See
+    #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107389
+    has_atomic128_opt = cc.links('__attribute__((optimize("O1")))' + atomic_test_128)
+    config_host_data.set('CONFIG_ATOMIC128_OPT', has_atomic128_opt)
 
-    config_host_data.set('CONFIG_CMPXCHG128', has_cmpxchg128)
+    if not has_atomic128_opt
+      config_host_data.set('CONFIG_CMPXCHG128', cc.links('''
+        int main(void)
+        {
+          unsigned __int128 x = 0, y = 0;
+          __sync_val_compare_and_swap_16(&x, y, x);
+          return 0;
+        }
+      '''))
+    endif
   endif
 endif
 
diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index 40bf63a4b5..c7999e0ef1 100644
--- a/accel/tcg/ldst_atomicity.c.inc
+++ b/accel/tcg/ldst_atomicity.c.inc
@@ -16,6 +16,23 @@
 #endif
 #define HAVE_al8_fast      (ATOMIC_REG_SIZE >= 8)
 
+/*
+ * If __alignof(unsigned __int128) < 16, GCC may refuse to inline atomics
+ * that are supported by the host, e.g. s390x.  We can force the pointer to
+ * have our known alignment with __builtin_assume_aligned, however prior to
+ * GCC 13 that was only reliable with optimization enabled.  See
+ *   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=107389
+ */
+#if defined(CONFIG_ATOMIC128_OPT)
+# if !defined(__OPTIMIZE__)
+#  define ATTRIBUTE_ATOMIC128_OPT  __attribute__((optimize("O1")))
+# endif
+# define CONFIG_ATOMIC128
+#endif
+#ifndef ATTRIBUTE_ATOMIC128_OPT
+# define ATTRIBUTE_ATOMIC128_OPT
+#endif
+
 #if defined(CONFIG_ATOMIC128)
 # define HAVE_al16_fast    true
 #else
@@ -136,7 +153,8 @@ static inline uint64_t load_atomic8(void *pv)
  *
  * Atomically load 16 aligned bytes from @pv.
  */
-static inline Int128 load_atomic16(void *pv)
+static inline Int128 ATTRIBUTE_ATOMIC128_OPT
+load_atomic16(void *pv)
 {
 #ifdef CONFIG_ATOMIC128
     __uint128_t *p = __builtin_assume_aligned(pv, 16);
@@ -337,7 +355,8 @@ static uint64_t load_atom_extract_al16_or_exit(CPUArchState *env, uintptr_t ra,
  * cross an 16-byte boundary then the access must be 16-byte atomic,
  * otherwise the access must be 8-byte atomic.
  */
-static inline uint64_t load_atom_extract_al16_or_al8(void *pv, int s)
+static inline uint64_t ATTRIBUTE_ATOMIC128_OPT
+load_atom_extract_al16_or_al8(void *pv, int s)
 {
 #if defined(CONFIG_ATOMIC128)
     uintptr_t pi = (uintptr_t)pv;
@@ -673,28 +692,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
  *
  * Atomically store 16 aligned bytes to @pv.
  */
-static inline void store_atomic16(void *pv, Int128 val)
+static inline void ATTRIBUTE_ATOMIC128_OPT
+store_atomic16(void *pv, Int128Alias val)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu = __builtin_assume_aligned(pv, 16);
-    Int128Alias new;
-
-    new.s = val;
-    qatomic_set__nocheck(pu, new.u);
+    qatomic_set__nocheck(pu, val.u);
 #elif defined(CONFIG_CMPXCHG128)
     __uint128_t *pu = __builtin_assume_aligned(pv, 16);
     __uint128_t o;
-    Int128Alias n;
 
     /*
      * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
      * defer to libatomic, so we must use __sync_val_compare_and_swap_16
      * and accept the sequential consistency that comes with it.
      */
-    n.s = val;
     do {
         o = *pu;
-    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));
+    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
 #else
     qemu_build_not_reached();
 #endif
@@ -776,7 +791,8 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
  *
  * Atomically store @val to @p masked by @msk.
  */
-static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
+static void ATTRIBUTE_ATOMIC128_OPT
+store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
-- 
2.34.1


