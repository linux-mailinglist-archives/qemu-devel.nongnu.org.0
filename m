Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EBF62F1D9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:51:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxze-0007nU-Hg; Fri, 18 Nov 2022 04:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz5-0007Sm-4k
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:38 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz0-00024j-IM
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:29 -0500
Received: by mail-pg1-x533.google.com with SMTP id f3so4577338pgc.2
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pVPjPjwoOnkEOAL0DJQU491SiPsBvOPAXEwCrPNcQiA=;
 b=xjTZOpvQvW3IGfY8Vx9iUhz0n3cu9C0WLRUWEFfxYiXatRrSyUpNAMzxSFzswAqSIQ
 mHijSzHqbsvkmme4rGmNL5VZecADSEsQ7X/iTDTKWAcBHLhr411A/EcAfV4+B8W1a/FK
 UhgG9RQw5TtuxkJmoNVmcSz58RpZx70vchGav8QsoK063K3wzvN3Z/vp7t3iblzHJ/e7
 jvpWr/yUQWe+Lwhoqcp9XfIiYT4FKGZRtuTi53pZKDg8WLYd5aDrqUYO669U3yaesAAQ
 oZ4kDc64LXspRpesxbtwWpbx9z6crJweiYxGxW/KshD0qt6f+/Dg5wW/hXqCP+ZfHw41
 2FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVPjPjwoOnkEOAL0DJQU491SiPsBvOPAXEwCrPNcQiA=;
 b=t+0NpG4Qg7Zo37mn0HMEVn3jghlfbItE55xcNT/tM0JFabSjOsuk2aURHzPM2RD38m
 qMTykfOwUmVXrl3cgG60eFs1ZvYk2qa6x3R359diJ/vBWX6wMAJ0b3oxyhG9tk4KIXC+
 I3wt7px1E4YjsEGKKDX73q8bkvZsnUV9vsVwpmaGl9egr9g8LciJy3vtCo4IdR/rEfpi
 dozYZEV48JbZUHPQM0YiJGDgjytwWO9xSDeX/GQrzR4B5AleCIkvxjBUSIQrlFMhioot
 HgFEEMMRpA9GlG2pfgJTUbM/b/PXT7LXey/4yBNCPJwh5NakXlD5xXr0ryPVYUAHQ8rL
 2cTg==
X-Gm-Message-State: ANoB5pmT6/VxJbxHuPYCaE+5fgi/YkL6E/YtMvo9/MCDzZ4aVKexNsnt
 50oHOVl+jsHGft4m+wWfITSov0LVSycK4w==
X-Google-Smtp-Source: AA0mqf7jBr9ckBi1PoIpE9ahWTzI6Zwqh4qtW2RpTd/52F39yq+06G31YoQBPvvnChvn9UnOb63h7w==
X-Received: by 2002:a63:4d49:0:b0:46f:b030:7647 with SMTP id
 n9-20020a634d49000000b0046fb0307647mr5950042pgl.13.1668764904902; 
 Fri, 18 Nov 2022 01:48:24 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 13/29] meson: Detect atomic128 support with
 optimization
Date: Fri, 18 Nov 2022 01:47:38 -0800
Message-Id: <20221118094754.242910-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
 meson.build                    | 52 ++++++++++++++++++++++------------
 2 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
index e6a7558399..68edab4398 100644
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
@@ -134,7 +151,8 @@ static inline uint64_t load_atomic8(void *pv)
  *
  * Atomically load 16 aligned bytes from @pv.
  */
-static inline Int128 load_atomic16(void *pv)
+static inline Int128 ATTRIBUTE_ATOMIC128_OPT
+load_atomic16(void *pv)
 {
 #ifdef CONFIG_ATOMIC128
     __uint128_t *p = __builtin_assume_aligned(pv, 16);
@@ -336,7 +354,8 @@ static uint64_t load_atom_extract_al16_or_exit(CPUArchState *env, uintptr_t ra,
  * cross an 16-byte boundary then the access must be 16-byte atomic,
  * otherwise the access must be 8-byte atomic.
  */
-static inline uint64_t load_atom_extract_al16_or_al8(void *pv, int s)
+static inline uint64_t ATTRIBUTE_ATOMIC128_OPT
+load_atom_extract_al16_or_al8(void *pv, int s)
 {
 #if defined(CONFIG_ATOMIC128)
     uintptr_t pi = (uintptr_t)pv;
@@ -672,28 +691,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
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
@@ -777,7 +792,8 @@ static void store_atom_insert_al8(uint64_t *p, uint64_t val, uint64_t msk)
  *
  * Atomically store @val to @p masked by @msk.
  */
-static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
+static void ATTRIBUTE_ATOMIC128_OPT
+store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
 {
 #if defined(CONFIG_ATOMIC128)
     __uint128_t *pu, old, new;
diff --git a/meson.build b/meson.build
index 4984e80e71..503eeabd79 100644
--- a/meson.build
+++ b/meson.build
@@ -2215,23 +2215,21 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not cc.compiles('''
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
@@ -2249,21 +2247,39 @@ if has_int128
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
 
-- 
2.34.1


