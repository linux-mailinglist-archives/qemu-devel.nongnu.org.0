Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38BD3CC5DB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:26:22 +0200 (CEST)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4px7-0006wh-NT
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvI-0003xE-GQ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:28 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pvE-0002io-Ae
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:24:28 -0400
Received: by mail-pg1-x532.google.com with SMTP id a6so6744704pgw.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZfynpJNOb81vK9/xeB1Ao4UxTdqtus4hsDLrfYiN7A=;
 b=HgpAtVZft/Iui63sKULh2aR9JVp/NjMg4w9jGi/PJlYVqySwPFVTKq051Hx7jLQ0C5
 neaqNSA05cC5k9au1DQbasEROcRrh9FjBCfRfQlzO2HFy+9ePiMvTwiKZNU0qFZHQAJq
 UAUFbOEE0LP7QLGDCKD+KQj7iEVtvl7aqDtLrqGh0oMfQZ13iqFcl5MVqT7P3/EnpiT+
 840/oc4LuKVhT9EiN7z2QG6fHp3xu5kh9mMCqaeePtO+CRFUVHvIM9GM/XT10MLcu6is
 fxkqfDZ89Rgj/HRsRNFpx91AIfFWj1uLz23gfkHCUCwd70OSO+kDL8BiW0ib1gdiiCLG
 /kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZfynpJNOb81vK9/xeB1Ao4UxTdqtus4hsDLrfYiN7A=;
 b=g5YFs5P1gtMNI731sVKoY4MjwZ/Xdx2pGjxLL5u3HzqiKhR7bU36etDkMzowVmDbW3
 LqRLrl0lUNWIC8olFu64ph5+/h9mfitU1d0529Nd/KDzkKY/hDBFNbK2JH8hdGIaDS7K
 fqTSs3Ywgnakuko0h/m7eX3FkUvytJTDctVls64cxRuIFqlsz9Us9yoN5fdp7NywdNQR
 BpADiXT4T1HpzgOdhYyBmRrJh9XDgItAT5QUSxbc/eIkdPV1lrsX4rlqa/E/HfT++Kj3
 ZAnxWyyktXmoJUyoKcGIOVJEJizcO23ql5yVvVH361wPCgw3imMCS5ZreEY/5Kan338S
 x2Cw==
X-Gm-Message-State: AOAM533QQGf7URVgNbUhu+M9Q9CLtgfXMRNjNqwvTY1vYsdjEzE9xLm0
 qe2Ws1becyKLkDzacfk7kJuslvLuyMmjUA==
X-Google-Smtp-Source: ABdhPJxVDDB+PUP1AYIOf24Sndr3G9yIlMCcE/NnJaI+dciooU5RysO1GLlFwZN+xBHi4M8VM94I2A==
X-Received: by 2002:a05:6a00:1390:b029:32a:e2a2:74de with SMTP id
 t16-20020a056a001390b029032ae2a274demr16633056pfg.6.1626549861616; 
 Sat, 17 Jul 2021 12:24:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y82sm14547527pfb.121.2021.07.17.12.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:24:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/10] qemu/atomic: Remove pre-C11 atomic fallbacks
Date: Sat, 17 Jul 2021 12:24:11 -0700
Message-Id: <20210717192419.2066778-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717192419.2066778-1-richard.henderson@linaro.org>
References: <20210717192419.2066778-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We now require c11, so the fallbacks are now dead code

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure             |   7 --
 include/qemu/atomic.h | 204 +++---------------------------------------
 2 files changed, 10 insertions(+), 201 deletions(-)

diff --git a/configure b/configure
index 49b5481139..eb8515ccca 100755
--- a/configure
+++ b/configure
@@ -3981,18 +3981,11 @@ cat > $TMPC << EOF
 int main(void)
 {
   uint64_t x = 0, y = 0;
-#ifdef __ATOMIC_RELAXED
   y = __atomic_load_n(&x, __ATOMIC_RELAXED);
   __atomic_store_n(&x, y, __ATOMIC_RELAXED);
   __atomic_compare_exchange_n(&x, &y, x, 0, __ATOMIC_RELAXED, __ATOMIC_RELAXED);
   __atomic_exchange_n(&x, y, __ATOMIC_RELAXED);
   __atomic_fetch_add(&x, y, __ATOMIC_RELAXED);
-#else
-  typedef char is_host64[sizeof(void *) >= sizeof(uint64_t) ? 1 : -1];
-  __sync_lock_test_and_set(&x, y);
-  __sync_val_compare_and_swap(&x, y, 0);
-  __sync_fetch_and_add(&x, y);
-#endif
   return 0;
 }
 EOF
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 99d6030095..bf89855209 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -60,8 +60,9 @@
         (unsigned short)1,                                                         \
       (expr)+0))))))
 
-#ifdef __ATOMIC_RELAXED
-/* For C11 atomic ops */
+#ifndef __ATOMIC_RELAXED
+#error "Expecting C11 atomic ops"
+#endif
 
 /* Manual memory barriers
  *
@@ -239,193 +240,8 @@
 #define qatomic_xor(ptr, n) \
     ((void) __atomic_fetch_xor(ptr, n, __ATOMIC_SEQ_CST))
 
-#else /* __ATOMIC_RELAXED */
-
-#ifdef __alpha__
-#define smp_read_barrier_depends()   asm volatile("mb":::"memory")
-#endif
-
-#if defined(__i386__) || defined(__x86_64__) || defined(__s390x__)
-
-/*
- * Because of the strongly ordered storage model, wmb() and rmb() are nops
- * here (a compiler barrier only).  QEMU doesn't do accesses to write-combining
- * qemu memory or non-temporal load/stores from C code.
- */
-#define smp_mb_release()   barrier()
-#define smp_mb_acquire()   barrier()
-
-/*
- * __sync_lock_test_and_set() is documented to be an acquire barrier only,
- * but it is a full barrier at the hardware level.  Add a compiler barrier
- * to make it a full barrier also at the compiler level.
- */
-#define qatomic_xchg(ptr, i)    (barrier(), __sync_lock_test_and_set(ptr, i))
-
-#elif defined(_ARCH_PPC)
-
-/*
- * We use an eieio() for wmb() on powerpc.  This assumes we don't
- * need to order cacheable and non-cacheable stores with respect to
- * each other.
- *
- * smp_mb has the same problem as on x86 for not-very-new GCC
- * (http://patchwork.ozlabs.org/patch/126184/, Nov 2011).
- */
-#define smp_wmb()          ({ asm volatile("eieio" ::: "memory"); (void)0; })
-#if defined(__powerpc64__)
-#define smp_mb_release()   ({ asm volatile("lwsync" ::: "memory"); (void)0; })
-#define smp_mb_acquire()   ({ asm volatile("lwsync" ::: "memory"); (void)0; })
-#else
-#define smp_mb_release()   ({ asm volatile("sync" ::: "memory"); (void)0; })
-#define smp_mb_acquire()   ({ asm volatile("sync" ::: "memory"); (void)0; })
-#endif
-#define smp_mb()           ({ asm volatile("sync" ::: "memory"); (void)0; })
-
-#endif /* _ARCH_PPC */
-
-/*
- * For (host) platforms we don't have explicit barrier definitions
- * for, we use the gcc __sync_synchronize() primitive to generate a
- * full barrier.  This should be safe on all platforms, though it may
- * be overkill for smp_mb_acquire() and smp_mb_release().
- */
-#ifndef smp_mb
-#define smp_mb()           __sync_synchronize()
-#endif
-
-#ifndef smp_mb_acquire
-#define smp_mb_acquire()   __sync_synchronize()
-#endif
-
-#ifndef smp_mb_release
-#define smp_mb_release()   __sync_synchronize()
-#endif
-
-#ifndef smp_read_barrier_depends
-#define smp_read_barrier_depends()   barrier()
-#endif
-
-#ifndef signal_barrier
-#define signal_barrier()    barrier()
-#endif
-
-/* These will only be atomic if the processor does the fetch or store
- * in a single issue memory operation
- */
-#define qatomic_read__nocheck(p)   (*(__typeof__(*(p)) volatile*) (p))
-#define qatomic_set__nocheck(p, i) ((*(__typeof__(*(p)) volatile*) (p)) = (i))
-
-#define qatomic_read(ptr)       qatomic_read__nocheck(ptr)
-#define qatomic_set(ptr, i)     qatomic_set__nocheck(ptr,i)
-
-/**
- * qatomic_rcu_read - reads a RCU-protected pointer to a local variable
- * into a RCU read-side critical section. The pointer can later be safely
- * dereferenced within the critical section.
- *
- * This ensures that the pointer copy is invariant thorough the whole critical
- * section.
- *
- * Inserts memory barriers on architectures that require them (currently only
- * Alpha) and documents which pointers are protected by RCU.
- *
- * qatomic_rcu_read also includes a compiler barrier to ensure that
- * value-speculative optimizations (e.g. VSS: Value Speculation
- * Scheduling) does not perform the data read before the pointer read
- * by speculating the value of the pointer.
- *
- * Should match qatomic_rcu_set(), qatomic_xchg(), qatomic_cmpxchg().
- */
-#define qatomic_rcu_read(ptr)    ({               \
-    typeof(*ptr) _val = qatomic_read(ptr);        \
-    smp_read_barrier_depends();                   \
-    _val;                                         \
-})
-
-/**
- * qatomic_rcu_set - assigns (publicizes) a pointer to a new data structure
- * meant to be read by RCU read-side critical sections.
- *
- * Documents which pointers will be dereferenced by RCU read-side critical
- * sections and adds the required memory barriers on architectures requiring
- * them. It also makes sure the compiler does not reorder code initializing the
- * data structure before its publication.
- *
- * Should match qatomic_rcu_read().
- */
-#define qatomic_rcu_set(ptr, i)  do {             \
-    smp_wmb();                                    \
-    qatomic_set(ptr, i);                          \
-} while (0)
-
-#define qatomic_load_acquire(ptr)    ({     \
-    typeof(*ptr) _val = qatomic_read(ptr);  \
-    smp_mb_acquire();                       \
-    _val;                                   \
-})
-
-#define qatomic_store_release(ptr, i)  do { \
-    smp_mb_release();                       \
-    qatomic_set(ptr, i);                    \
-} while (0)
-
-#ifndef qatomic_xchg
-#if defined(__clang__)
-#define qatomic_xchg(ptr, i)    __sync_swap(ptr, i)
-#else
-/* __sync_lock_test_and_set() is documented to be an acquire barrier only.  */
-#define qatomic_xchg(ptr, i)    (smp_mb(), __sync_lock_test_and_set(ptr, i))
-#endif
-#endif
-#define qatomic_xchg__nocheck  qatomic_xchg
-
-/* Provide shorter names for GCC atomic builtins.  */
-#define qatomic_fetch_inc(ptr)  __sync_fetch_and_add(ptr, 1)
-#define qatomic_fetch_dec(ptr)  __sync_fetch_and_add(ptr, -1)
-
-#define qatomic_fetch_add(ptr, n) __sync_fetch_and_add(ptr, n)
-#define qatomic_fetch_sub(ptr, n) __sync_fetch_and_sub(ptr, n)
-#define qatomic_fetch_and(ptr, n) __sync_fetch_and_and(ptr, n)
-#define qatomic_fetch_or(ptr, n) __sync_fetch_and_or(ptr, n)
-#define qatomic_fetch_xor(ptr, n) __sync_fetch_and_xor(ptr, n)
-
-#define qatomic_inc_fetch(ptr)  __sync_add_and_fetch(ptr, 1)
-#define qatomic_dec_fetch(ptr)  __sync_add_and_fetch(ptr, -1)
-#define qatomic_add_fetch(ptr, n) __sync_add_and_fetch(ptr, n)
-#define qatomic_sub_fetch(ptr, n) __sync_sub_and_fetch(ptr, n)
-#define qatomic_and_fetch(ptr, n) __sync_and_and_fetch(ptr, n)
-#define qatomic_or_fetch(ptr, n) __sync_or_and_fetch(ptr, n)
-#define qatomic_xor_fetch(ptr, n) __sync_xor_and_fetch(ptr, n)
-
-#define qatomic_cmpxchg(ptr, old, new) \
-    __sync_val_compare_and_swap(ptr, old, new)
-#define qatomic_cmpxchg__nocheck(ptr, old, new)  qatomic_cmpxchg(ptr, old, new)
-
-/* And even shorter names that return void.  */
-#define qatomic_inc(ptr)        ((void) __sync_fetch_and_add(ptr, 1))
-#define qatomic_dec(ptr)        ((void) __sync_fetch_and_add(ptr, -1))
-#define qatomic_add(ptr, n)     ((void) __sync_fetch_and_add(ptr, n))
-#define qatomic_sub(ptr, n)     ((void) __sync_fetch_and_sub(ptr, n))
-#define qatomic_and(ptr, n)     ((void) __sync_fetch_and_and(ptr, n))
-#define qatomic_or(ptr, n)      ((void) __sync_fetch_and_or(ptr, n))
-#define qatomic_xor(ptr, n)     ((void) __sync_fetch_and_xor(ptr, n))
-
-#endif /* __ATOMIC_RELAXED */
-
-#ifndef smp_wmb
 #define smp_wmb()   smp_mb_release()
-#endif
-#ifndef smp_rmb
 #define smp_rmb()   smp_mb_acquire()
-#endif
-
-/* This is more efficient than a store plus a fence.  */
-#if !defined(__SANITIZE_THREAD__)
-#if defined(__i386__) || defined(__x86_64__) || defined(__s390x__)
-#define qatomic_mb_set(ptr, i)  ((void)qatomic_xchg(ptr, i))
-#endif
-#endif
 
 /* qatomic_mb_read/set semantics map Java volatile variables. They are
  * less expensive on some platforms (notably POWER) than fully
@@ -435,16 +251,16 @@
  * use. See docs/devel/atomics.rst for more discussion.
  */
 
-#ifndef qatomic_mb_read
 #define qatomic_mb_read(ptr)                             \
     qatomic_load_acquire(ptr)
-#endif
 
-#ifndef qatomic_mb_set
-#define qatomic_mb_set(ptr, i)  do {                    \
-    qatomic_store_release(ptr, i);                      \
-    smp_mb();                                           \
-} while(0)
+#if !defined(__SANITIZE_THREAD__) && \
+    (defined(__i386__) || defined(__x86_64__) || defined(__s390x__))
+/* This is more efficient than a store plus a fence.  */
+# define qatomic_mb_set(ptr, i)  ((void)qatomic_xchg(ptr, i))
+#else
+# define qatomic_mb_set(ptr, i) \
+   ({ qatomic_store_release(ptr, i); smp_mb(); })
 #endif
 
 #define qatomic_fetch_inc_nonzero(ptr) ({                               \
-- 
2.25.1


