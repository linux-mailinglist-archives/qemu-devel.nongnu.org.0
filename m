Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E134E67A10E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNr3-0004A8-Sc; Tue, 24 Jan 2023 13:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNr0-0003zZ-Ew
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:17:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNqs-00010O-Ex
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:17:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so11600996wms.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cV+/EvTVR0to86HPgm7XdzpfTo5T4nkpPl6XE4GcLHk=;
 b=h6mS6KFDehbh8DUqa3mb22O+7YwfU3Im0u2MChmKD2H0Kc/89kadtdxZJs+ik1DYvi
 6tmmyqpF6kPiCGoGBoi/xHroJ0at+jkBo42PsKJ/WUamAsK0qOqlYONGurAa2f9lmL+h
 ySxZAnhfTQ2h/2PlJ5uXTo6wF5dTu75xSAdECHdMtZdOAqQZyUXCDKlyQPjxwVw9Z7IW
 zyI65gF7Kesmo7/OAeafsVxVNUuN044piodrvTopDdK1MLLYo2TWZ5HUtF5y9slN0y5v
 xxmF/+8puMyuWERPXePzA9Xeuigke8O//8pdplcSwiVTXUoXocnX9deJM88vo63oIXb6
 kY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cV+/EvTVR0to86HPgm7XdzpfTo5T4nkpPl6XE4GcLHk=;
 b=UK8iQFLOd1lDY6VCdtXalNBZwi97PXklSuhrxYWc+MNA2HJcpoQ5iin1rvGyWh6pe+
 kssKScYW29A5nhA5UIBWWmG4ATp3y4ynDfCU6TF9o1ptA/s/36gRPaEm9DxZ09xkGJCS
 e0C7St3tFryTOuKQckSOqdu4P73XCL5Gfhk4aAZVbsqvXkF6w702fQBHe9d6dgzPHiqR
 eRolmqz6oHnNBsTFlpj2oix1qGT/ILdqgmdmGloYxBEHO2BPD4+eLj5f1emVzXXNxXeK
 md4KY+75SCI4+L5PVA1NxSdmIgVpY3K+/oI+uiWR7n79OKmTMf2sCNbgWd/SC4gdrp31
 wW3g==
X-Gm-Message-State: AO0yUKXc6EKMKBJBSy8s/78Mu71inPM3nu+3utfyVrwZtelajoi+yjVj
 rG/K0DXvQC3nGWWKkrTnB3dXdA==
X-Google-Smtp-Source: AK7set+aSZxoEuCjboPm6JP4aYkx1uQR+LELSPDKp4wboeq0kOUWhgV3klnNS22ZDuCFgYa4oJ28rQ==
X-Received: by 2002:a05:600c:310c:b0:3dc:18de:b20d with SMTP id
 g12-20020a05600c310c00b003dc18deb20dmr679835wmo.33.1674584216950; 
 Tue, 24 Jan 2023 10:16:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a1c4b0b000000b003daffc2ecdesm13929724wma.13.2023.01.24.10.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:16:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 22E871FFD0;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 29/35] util/qht: use striped locks under TSAN
Date: Tue, 24 Jan 2023 18:01:21 +0000
Message-Id: <20230124180127.1881110-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Emilio Cota <cota@braap.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230111151628.320011-5-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 util/qht.c | 95 ++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 14 deletions(-)

diff --git a/util/qht.c b/util/qht.c
index 15866299e6..92c6b78759 100644
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
@@ -229,10 +249,56 @@ static inline size_t qht_elems_to_buckets(size_t n_elems)
     return pow2ceil(n_elems / QHT_BUCKET_ENTRIES);
 }
 
-static inline void qht_head_init(struct qht_bucket *b)
+/*
+ * When using striped locks (i.e. under TSAN), we have to be careful not
+ * to operate on the same lock twice (e.g. when iterating through all buckets).
+ * We achieve this by operating only on each stripe's first matching lock.
+ */
+static inline void qht_do_if_first_in_stripe(struct qht_map *map,
+                                             struct qht_bucket *b,
+                                             void (*func)(QemuSpin *spin))
+{
+#ifdef CONFIG_TSAN
+    unsigned long bucket_idx = b - map->buckets;
+    bool is_first_in_stripe = (bucket_idx >> QHT_TSAN_BUCKET_LOCKS_BITS) == 0;
+    if (is_first_in_stripe) {
+        unsigned long lock_idx = bucket_idx & (QHT_TSAN_BUCKET_LOCKS - 1);
+        func(&map->tsan_bucket_locks[lock_idx].lock);
+    }
+#else
+    func(&b->lock);
+#endif
+}
+
+static inline void qht_bucket_lock_do(struct qht_map *map,
+                                      struct qht_bucket *b,
+                                      void (*func)(QemuSpin *lock))
+{
+#ifdef CONFIG_TSAN
+    unsigned long bucket_idx = b - map->buckets;
+    unsigned long lock_idx = bucket_idx & (QHT_TSAN_BUCKET_LOCKS - 1);
+    func(&map->tsan_bucket_locks[lock_idx].lock);
+#else
+    func(&b->lock);
+#endif
+}
+
+static inline void qht_bucket_lock(struct qht_map *map,
+                                   struct qht_bucket *b)
+{
+    qht_bucket_lock_do(map, b, qemu_spin_lock);
+}
+
+static inline void qht_bucket_unlock(struct qht_map *map,
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
 
@@ -250,7 +316,7 @@ static void qht_map_lock_buckets(struct qht_map *map)
     for (i = 0; i < map->n_buckets; i++) {
         struct qht_bucket *b = &map->buckets[i];
 
-        qemu_spin_lock(&b->lock);
+        qht_do_if_first_in_stripe(map, b, qemu_spin_lock);
     }
 }
 
@@ -261,7 +327,7 @@ static void qht_map_unlock_buckets(struct qht_map *map)
     for (i = 0; i < map->n_buckets; i++) {
         struct qht_bucket *b = &map->buckets[i];
 
-        qemu_spin_unlock(&b->lock);
+        qht_do_if_first_in_stripe(map, b, qemu_spin_unlock);
     }
 }
 
@@ -308,7 +374,7 @@ void qht_map_lock_buckets__no_stale(struct qht *ht, struct qht_map **pmap)
  * Get a head bucket and lock it, making sure its parent map is not stale.
  * @pmap is filled with a pointer to the bucket's parent map.
  *
- * Unlock with qemu_spin_unlock(&b->lock).
+ * Unlock with qht_bucket_unlock.
  *
  * Note: callers cannot have ht->lock held.
  */
@@ -322,18 +388,18 @@ struct qht_bucket *qht_bucket_lock__no_stale(struct qht *ht, uint32_t hash,
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
@@ -345,12 +411,13 @@ static inline bool qht_map_needs_resize(const struct qht_map *map)
            map->n_added_buckets_threshold;
 }
 
-static inline void qht_chain_destroy(const struct qht_bucket *head)
+static inline void qht_chain_destroy(struct qht_map *map,
+                                     struct qht_bucket *head)
 {
     struct qht_bucket *curr = head->next;
     struct qht_bucket *prev;
 
-    qemu_spin_destroy(&head->lock);
+    qht_do_if_first_in_stripe(map, head, qemu_spin_destroy);
     while (curr) {
         prev = curr;
         curr = curr->next;
@@ -364,7 +431,7 @@ static void qht_map_destroy(struct qht_map *map)
     size_t i;
 
     for (i = 0; i < map->n_buckets; i++) {
-        qht_chain_destroy(&map->buckets[i]);
+        qht_chain_destroy(map, &map->buckets[i]);
     }
     qemu_vfree(map->buckets);
     g_free(map);
@@ -390,7 +457,7 @@ static struct qht_map *qht_map_create(size_t n_buckets)
     map->buckets = qemu_memalign(QHT_BUCKET_ALIGN,
                                  sizeof(*map->buckets) * n_buckets);
     for (i = 0; i < n_buckets; i++) {
-        qht_head_init(&map->buckets[i]);
+        qht_head_init(map, &map->buckets[i]);
     }
     return map;
 }
@@ -638,7 +705,7 @@ bool qht_insert(struct qht *ht, void *p, uint32_t hash, void **existing)
     b = qht_bucket_lock__no_stale(ht, hash, &map);
     prev = qht_insert__locked(ht, map, b, p, hash, &needs_resize);
     qht_bucket_debug__locked(b);
-    qemu_spin_unlock(&b->lock);
+    qht_bucket_unlock(map, b);
 
     if (unlikely(needs_resize) && ht->mode & QHT_MODE_AUTO_RESIZE) {
         qht_grow_maybe(ht);
@@ -749,7 +816,7 @@ bool qht_remove(struct qht *ht, const void *p, uint32_t hash)
     b = qht_bucket_lock__no_stale(ht, hash, &map);
     ret = qht_remove__locked(b, p, hash);
     qht_bucket_debug__locked(b);
-    qemu_spin_unlock(&b->lock);
+    qht_bucket_unlock(map, b);
     return ret;
 }
 
-- 
2.34.1


