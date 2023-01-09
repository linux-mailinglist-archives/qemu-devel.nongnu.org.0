Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1566346C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0yu-0005pA-U9; Mon, 09 Jan 2023 17:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yO-0005ig-PD
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:33 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yK-00078W-1l
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:32 -0500
Received: by mail-qt1-x830.google.com with SMTP id j15so3989824qtv.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1T8P3aFdmYKkV9MiEvlapALeh2kUUtoqOYpyWRERpg=;
 b=C/mUe9X+UqbCW1ICEgI/JSEAptY88sU1qddCVVPlMgeaXV0I6+7Xb+TUXExaUSeDw6
 WXXnHqvmtz/XRsqqHQP7w4RDA0s9u5hkxDc+z2X0NKwm6aCXXu5ZagqaMDj746zWqr6W
 qFLd4gQ8agonhelEbH1Idy67jWNz1fUzUaORS4riScytfwQvm6vl2NlR4hrlgIby+EzN
 KF0mrF6Eh0k8VWSfvri/bvFMFov2gaUcSdrvwRqzaQ2DXSRVxlNP1Mf5DAdZsu/+TNKH
 UBgfId1G1zxY7UCjplNS8ectZs1n/rxL65qqHqEoFLzgig8t8jT4+f7XADKq1N5XSypi
 CbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1T8P3aFdmYKkV9MiEvlapALeh2kUUtoqOYpyWRERpg=;
 b=EKn+PjexgdBA3sdYBupVXSIBW5jKtiwthOZ6P401aAF4gz6EIBUbos8+0DZepxrBPo
 JRTNN0YGnYWvZZBuGOQwR/4ffjl/n3qs7o0853rDXSLSLK5iOgelKitY7dUUbJHp7AQJ
 MGs2yXe++mlcvPczvM5EVbyyQdX/VJ5vgkoe8B7uooMC6foQMqcwIuAUTVTScptMIcsD
 ReWNrJfLMrAVajIQNMW/JyDpeV67ZoHlM9reXuRJRr7yVqj9rbUNIibSWDQpdSBiNbTh
 OsMrO7HjOboI8JOuDQu6TC4SOvC1u5qN6eSOhVgGf6wjHjho3DkbLTQVrK1eJ+Jfgytq
 aWQg==
X-Gm-Message-State: AFqh2koQG7NhSN+HPHfZFIQ1P9TrXS899/PhbcEeZPc9zs8kO7nSzJjM
 yojBkxBK4jGAEpvAfc6dM1rMneEKSdhFRe9a3cY=
X-Google-Smtp-Source: AMrXdXso2acOjUlvH/DgF1MQIRK+DuhlaL+IQ6KgFI4wbbEmkDWjukUTLaSzXIgyLRDtIIyI6h08zQ==
X-Received: by 2002:ac8:75c7:0:b0:3a5:24ac:a175 with SMTP id
 z7-20020ac875c7000000b003a524aca175mr1037167qtq.56.1673304626609; 
 Mon, 09 Jan 2023 14:50:26 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 bn39-20020a05620a2ae700b006fed2788751sm6067311qkb.76.2023.01.09.14.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:50:26 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 4/5] util/qht: use striped locks under TSAN
Date: Mon,  9 Jan 2023 17:49:53 -0500
Message-Id: <20230109224954.161672-5-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109224954.161672-1-cota@braap.org>
References: <20230109224954.161672-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::830;
 envelope-from=cota@braap.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Fixes this tsan crash, easy to reproduce with any large enough program:

$ tests/unit/test-qht
1..2
ThreadSanitizer: CHECK failed: sanitizer_deadlock_detector.h:67 "((n_all_locks_)) < (((sizeof(all_locks_with_contexts_)/sizeof((all_locks_with_contexts_)[0]))))" (0x40, 0x40) (tid=1821568)
    #0 __tsan::CheckUnwind() ../../../../src/libsanitizer/tsan/tsan_rtl.cpp:353 (libtsan.so.2+0x90034)
    #1 __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) ../../../../src/libsanitizer/sanitizer_common/sanitizer_termination.cpp:86 (libtsan.so.2+0xca555)
    #2 __sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >::addLock(unsigned long, unsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:67 (libtsan.so.2+0xb3616)
    #3 __sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >::addLock(unsigned long, unsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:59 (libtsan.so.2+0xb3616)
    #4 __sanitizer::DeadlockDetector<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >::onLockAfter(__sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBitVector<unsigned long> > >*, unsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:216 (libtsan.so.2+0xb3616)
    #5 __sanitizer::DD::MutexAfterLock(__sanitizer::DDCallback*, __sanitizer::DDMutex*, bool, bool) ../../../../src/libsanitizer/sanitizer_common/sanitizer_deadlock_detector1.cpp:169 (libtsan.so.2+0xb3616)
    #6 __tsan::MutexPostLock(__tsan::ThreadState*, unsigned long, unsigned long, unsigned int, int) ../../../../src/libsanitizer/tsan/tsan_rtl_mutex.cpp:200 (libtsan.so.2+0xa3382)
    #7 __tsan_mutex_post_lock ../../../../src/libsanitizer/tsan/tsan_interface_ann.cpp:384 (libtsan.so.2+0x76bc3)
    #8 qemu_spin_lock /home/cota/src/qemu/include/qemu/thread.h:259 (test-qht+0x44a97)
    #9 qht_map_lock_buckets ../util/qht.c:253 (test-qht+0x44a97)
    #10 do_qht_iter ../util/qht.c:809 (test-qht+0x45f33)
    #11 qht_iter ../util/qht.c:821 (test-qht+0x45f33)
    #12 iter_check ../tests/unit/test-qht.c:121 (test-qht+0xe473)
    #13 qht_do_test ../tests/unit/test-qht.c:202 (test-qht+0xe473)
    #14 qht_test ../tests/unit/test-qht.c:240 (test-qht+0xe7c1)
    #15 test_default ../tests/unit/test-qht.c:246 (test-qht+0xe828)
    #16 <null> <null> (libglib-2.0.so.0+0x7daed)
    #17 <null> <null> (libglib-2.0.so.0+0x7d80a)
    #18 <null> <null> (libglib-2.0.so.0+0x7d80a)
    #19 g_test_run_suite <null> (libglib-2.0.so.0+0x7dfe9)
    #20 g_test_run <null> (libglib-2.0.so.0+0x7e055)
    #21 main ../tests/unit/test-qht.c:259 (test-qht+0xd2c6)
    #22 __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58 (libc.so.6+0x29d8f)
    #23 __libc_start_main_impl ../csu/libc-start.c:392 (libc.so.6+0x29e3f)
    #24 _start <null> (test-qht+0xdb44)

Signed-off-by: Emilio Cota <cota@braap.org>
---
 util/qht.c | 101 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 14 deletions(-)

diff --git a/util/qht.c b/util/qht.c
index 15866299e6..70cc733d5d 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -151,6 +151,22 @@ struct qht_bucket {
 
 QEMU_BUILD_BUG_ON(sizeof(struct qht_bucket) > QHT_BUCKET_ALIGN);
 
+/*
+ * Under TSAN, we use striped locks instead of one lock per bucket chain.
+ * This avoids crashing under TSAN, since TSAN aborts the program if more than
+ * 64 locks are held (this is a hardcoded limit in TSAN).
+ * When resizing a QHT we grab all the buckets' locks, which can easily
+ * go over TSAN's limit. By using striped locks, we avoid this problem.
+ *
+ * Note: this number must be a power of two for easy index computation.
+ */
+#define QHT_TSAN_BUCKET_LOCKS_BITS 4
+#define QHT_TSAN_BUCKET_LOCKS (1 << QHT_TSAN_BUCKET_LOCKS_BITS)
+
+struct qht_tsan_lock {
+    QemuSpin lock;
+} QEMU_ALIGNED(QHT_BUCKET_ALIGN);
+
 /**
  * struct qht_map - structure to track an array of buckets
  * @rcu: used by RCU. Keep it as the top field in the struct to help valgrind
@@ -160,6 +176,7 @@ QEMU_BUILD_BUG_ON(sizeof(struct qht_bucket) > QHT_BUCKET_ALIGN);
  * @n_added_buckets: number of added (i.e. "non-head") buckets
  * @n_added_buckets_threshold: threshold to trigger an upward resize once the
  *                             number of added buckets surpasses it.
+ * @tsan_bucket_locks: Array of striped locks to be used only under TSAN.
  *
  * Buckets are tracked in what we call a "map", i.e. this structure.
  */
@@ -169,6 +186,9 @@ struct qht_map {
     size_t n_buckets;
     size_t n_added_buckets;
     size_t n_added_buckets_threshold;
+#ifdef CONFIG_TSAN
+    struct qht_tsan_lock tsan_bucket_locks[QHT_TSAN_BUCKET_LOCKS];
+#endif
 };
 
 /* trigger a resize when n_added_buckets > n_buckets / div */
@@ -229,10 +249,62 @@ static inline size_t qht_elems_to_buckets(size_t n_elems)
     return pow2ceil(n_elems / QHT_BUCKET_ENTRIES);
 }
 
-static inline void qht_head_init(struct qht_bucket *b)
+/*
+ * When using striped locks (i.e. under TSAN), we have to be careful not
+ * to operate on the same lock twice (e.g. when iterating through all buckets).
+ * We achieve this by operating only on each stripe's first matching lock.
+ */
+static inline void qht_do_if_first_in_stripe(const struct qht_map *map,
+                                             struct qht_bucket *b,
+                                             void (*func)(QemuSpin *spin))
+{
+#ifdef CONFIG_TSAN
+    unsigned long bucket_idx = b - map->buckets;
+    bool is_first_in_stripe = (bucket_idx >> QHT_TSAN_BUCKET_LOCKS_BITS) == 0;
+    if (is_first_in_stripe) {
+        unsigned long lock_idx = bucket_idx & (QHT_TSAN_BUCKET_LOCKS - 1);
+        func(&map->tsan_bucket_locks[lock_idx]);
+    }
+#else
+    func(&b->lock);
+#endif
+}
+
+static inline void qht_bucket_lock_destroy(const struct qht_map *map,
+                                           struct qht_bucket *b)
+{
+    qht_do_if_first_in_stripe(map, b, qemu_spin_destroy);
+}
+
+static inline void qht_bucket_lock_do(const struct qht_map *map,
+                                      struct qht_bucket *b,
+                                      void (*func)(QemuSpin *lock))
+{
+#ifdef CONFIG_TSAN
+    unsigned long bucket_idx = b - map->buckets;
+    unsigned long lock_idx = bucket_idx & (QHT_TSAN_BUCKET_LOCKS - 1);
+    func(&map->tsan_bucket_locks[lock_idx]);
+#else
+    func(&b->lock);
+#endif
+}
+
+static inline void qht_bucket_lock(const struct qht_map *map,
+                                   struct qht_bucket *b)
+{
+    qht_bucket_lock_do(map, b, qemu_spin_lock);
+}
+
+static inline void qht_bucket_unlock(const struct qht_map *map,
+                                     struct qht_bucket *b)
+{
+    qht_bucket_lock_do(map, b, qemu_spin_unlock);
+}
+
+static inline void qht_head_init(struct qht_map *map, struct qht_bucket *b)
 {
     memset(b, 0, sizeof(*b));
-    qemu_spin_init(&b->lock);
+    qht_do_if_first_in_stripe(map, b, qemu_spin_init);
     seqlock_init(&b->sequence);
 }
 
@@ -250,7 +322,7 @@ static void qht_map_lock_buckets(struct qht_map *map)
     for (i = 0; i < map->n_buckets; i++) {
         struct qht_bucket *b = &map->buckets[i];
 
-        qemu_spin_lock(&b->lock);
+        qht_do_if_first_in_stripe(map, b, qemu_spin_lock);
     }
 }
 
@@ -261,7 +333,7 @@ static void qht_map_unlock_buckets(struct qht_map *map)
     for (i = 0; i < map->n_buckets; i++) {
         struct qht_bucket *b = &map->buckets[i];
 
-        qemu_spin_unlock(&b->lock);
+        qht_do_if_first_in_stripe(map, b, qemu_spin_unlock);
     }
 }
 
@@ -308,7 +380,7 @@ void qht_map_lock_buckets__no_stale(struct qht *ht, struct qht_map **pmap)
  * Get a head bucket and lock it, making sure its parent map is not stale.
  * @pmap is filled with a pointer to the bucket's parent map.
  *
- * Unlock with qemu_spin_unlock(&b->lock).
+ * Unlock with qht_bucket_unlock.
  *
  * Note: callers cannot have ht->lock held.
  */
@@ -322,18 +394,18 @@ struct qht_bucket *qht_bucket_lock__no_stale(struct qht *ht, uint32_t hash,
     map = qatomic_rcu_read(&ht->map);
     b = qht_map_to_bucket(map, hash);
 
-    qemu_spin_lock(&b->lock);
+    qht_bucket_lock(map, b);
     if (likely(!qht_map_is_stale__locked(ht, map))) {
         *pmap = map;
         return b;
     }
-    qemu_spin_unlock(&b->lock);
+    qht_bucket_unlock(map, b);
 
     /* we raced with a resize; acquire ht->lock to see the updated ht->map */
     qht_lock(ht);
     map = ht->map;
     b = qht_map_to_bucket(map, hash);
-    qemu_spin_lock(&b->lock);
+    qht_bucket_lock(map, b);
     qht_unlock(ht);
     *pmap = map;
     return b;
@@ -345,12 +417,13 @@ static inline bool qht_map_needs_resize(const struct qht_map *map)
            map->n_added_buckets_threshold;
 }
 
-static inline void qht_chain_destroy(const struct qht_bucket *head)
+static inline void qht_chain_destroy(const struct qht_map *map,
+                                     struct qht_bucket *head)
 {
     struct qht_bucket *curr = head->next;
     struct qht_bucket *prev;
 
-    qemu_spin_destroy(&head->lock);
+    qht_do_if_first_in_stripe(map, head, qemu_spin_destroy);
     while (curr) {
         prev = curr;
         curr = curr->next;
@@ -364,7 +437,7 @@ static void qht_map_destroy(struct qht_map *map)
     size_t i;
 
     for (i = 0; i < map->n_buckets; i++) {
-        qht_chain_destroy(&map->buckets[i]);
+        qht_chain_destroy(map, &map->buckets[i]);
     }
     qemu_vfree(map->buckets);
     g_free(map);
@@ -390,7 +463,7 @@ static struct qht_map *qht_map_create(size_t n_buckets)
     map->buckets = qemu_memalign(QHT_BUCKET_ALIGN,
                                  sizeof(*map->buckets) * n_buckets);
     for (i = 0; i < n_buckets; i++) {
-        qht_head_init(&map->buckets[i]);
+        qht_head_init(map, &map->buckets[i]);
     }
     return map;
 }
@@ -638,7 +711,7 @@ bool qht_insert(struct qht *ht, void *p, uint32_t hash, void **existing)
     b = qht_bucket_lock__no_stale(ht, hash, &map);
     prev = qht_insert__locked(ht, map, b, p, hash, &needs_resize);
     qht_bucket_debug__locked(b);
-    qemu_spin_unlock(&b->lock);
+    qht_bucket_unlock(map, b);
 
     if (unlikely(needs_resize) && ht->mode & QHT_MODE_AUTO_RESIZE) {
         qht_grow_maybe(ht);
@@ -749,7 +822,7 @@ bool qht_remove(struct qht *ht, const void *p, uint32_t hash)
     b = qht_bucket_lock__no_stale(ht, hash, &map);
     ret = qht_remove__locked(b, p, hash);
     qht_bucket_debug__locked(b);
-    qemu_spin_unlock(&b->lock);
+    qht_bucket_unlock(map, b);
     return ret;
 }
 
-- 
2.34.1


