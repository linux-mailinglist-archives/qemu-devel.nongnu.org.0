Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DF664DD0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 22:01:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFLjD-00085X-H6; Tue, 10 Jan 2023 16:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFLjC-00085M-0U
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 16:00:14 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFLj9-0001CF-MB
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 16:00:13 -0500
Received: by mail-wr1-x431.google.com with SMTP id e3so3873014wru.13
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 13:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUhaMRX08xeFVPkTvQ0F+Y+ymnF7lmn9OQiIUDN8UeM=;
 b=QIRS5TmjLyShtNyBNFPOD8S61SgXDTfeIhj1rnPKTCpUQo04bYlffu/iZRUDt8ZBXZ
 +XRJn6dQJAKxHOiAlUmk+cmKqvogd2AxWvPkOMlAMP8EDc924XtrtQiqR/DFndelle3z
 CIS9ncjRxZER50CZDGJxvOaWl3gIzjSkggAqhoTwLiUtgL/LQVUr/1RWdPZtppHgK20r
 nipv/SKyCL/a/EMvwN7wVkk9+wv5TIVLJRzJqLCbr1Y9VTkqqWmAgdEbcV+0xr/dCV32
 yDAVSlNB0H1rVzL3saEmIm11eondgqi1qmRYQd54a+PJb8tKHiC9+laXyanU6LFXXGwd
 ZnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iUhaMRX08xeFVPkTvQ0F+Y+ymnF7lmn9OQiIUDN8UeM=;
 b=gQiEKhY/t38fRaaHzI+f6R1uREkhF2GdTVndhkVb07wLXItSE5hwMwbAtZGK67AGDH
 Xx3wzysglZ0ycSevmsYxcFg+WayaKhrz4oMdbnb2MytXPxUaOkgt40NRRHgcWwAGkfCf
 1hA/fadAwHLaYPHUlxyWeiMIfTx+OifQFxIb/P8tLRbN7ESMSEZeXZsD82twQbmiEFIV
 /oUV30RNQNVrUDLoqZVI7jWQ6kQnYfIT9m6HLcwgdNCR/WaO8AXlSUNXFXnrl7UQWEUW
 zkNEjGbwvNyfGINMaG1qDsZcADCMCqLUhMnXh1rkkSeSZm7TLmx48VV3VaSJzEIUI23N
 07Pw==
X-Gm-Message-State: AFqh2kq5eI49UOakHp6TO0Cx3bEiuFJVrrkyMIEWCM6chnIvgbiNQFCO
 6RKXTsMXKh7GrWhmq+XMJB9zWQ==
X-Google-Smtp-Source: AMrXdXv3zEeMZd3gxHpiXwCpMlPynD5Pc+tQBT96m8IMvcBFLyYsb7XJVbPXUZngbYtDfmAzMyhaxw==
X-Received: by 2002:adf:da50:0:b0:242:6777:bfa0 with SMTP id
 r16-20020adfda50000000b002426777bfa0mr47267910wrl.53.1673384409887; 
 Tue, 10 Jan 2023 13:00:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b0024274a5db0asm12367243wrj.2.2023.01.10.13.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 13:00:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30CD71FFB7;
 Tue, 10 Jan 2023 21:00:05 +0000 (GMT)
References: <20230109224954.161672-1-cota@braap.org>
 <20230109224954.161672-5-cota@braap.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Emilio Cota <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/5] util/qht: use striped locks under TSAN
Date: Tue, 10 Jan 2023 20:58:01 +0000
In-reply-to: <20230109224954.161672-5-cota@braap.org>
Message-ID: <87cz7mm7fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


Emilio Cota <cota@braap.org> writes:

> Fixes this tsan crash, easy to reproduce with any large enough program:
>
> $ tests/unit/test-qht
> 1..2
> ThreadSanitizer: CHECK failed: sanitizer_deadlock_detector.h:67 "((n_all_=
locks_)) < (((sizeof(all_locks_with_contexts_)/sizeof((all_locks_with_conte=
xts_)[0]))))" (0x40, 0x40) (tid=3D1821568)
>     #0 __tsan::CheckUnwind() ../../../../src/libsanitizer/tsan/tsan_rtl.c=
pp:353 (libtsan.so.2+0x90034)
>     #1 __sanitizer::CheckFailed(char const*, int, char const*, unsigned l=
ong long, unsigned long long) ../../../../src/libsanitizer/sanitizer_common=
/sanitizer_termination.cpp:86 (libtsan.so.2+0xca555)
>     #2 __sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1u=
l, __sanitizer::BasicBitVector<unsigned long> > >::addLock(unsigned long, u=
nsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/s=
anitizer_deadlock_detector.h:67 (libtsan.so.2+0xb3616)
>     #3 __sanitizer::DeadlockDetectorTLS<__sanitizer::TwoLevelBitVector<1u=
l, __sanitizer::BasicBitVector<unsigned long> > >::addLock(unsigned long, u=
nsigned long, unsigned int) ../../../../src/libsanitizer/sanitizer_common/s=
anitizer_deadlock_detector.h:59 (libtsan.so.2+0xb3616)
>     #4 __sanitizer::DeadlockDetector<__sanitizer::TwoLevelBitVector<1ul, =
__sanitizer::BasicBitVector<unsigned long> > >::onLockAfter(__sanitizer::De=
adlockDetectorTLS<__sanitizer::TwoLevelBitVector<1ul, __sanitizer::BasicBit=
Vector<unsigned long> > >*, unsigned long, unsigned int) ../../../../src/li=
bsanitizer/sanitizer_common/sanitizer_deadlock_detector.h:216 (libtsan.so.2=
+0xb3616)
>     #5 __sanitizer::DD::MutexAfterLock(__sanitizer::DDCallback*, __saniti=
zer::DDMutex*, bool, bool) ../../../../src/libsanitizer/sanitizer_common/sa=
nitizer_deadlock_detector1.cpp:169 (libtsan.so.2+0xb3616)
>     #6 __tsan::MutexPostLock(__tsan::ThreadState*, unsigned long, unsigne=
d long, unsigned int, int) ../../../../src/libsanitizer/tsan/tsan_rtl_mutex=
.cpp:200 (libtsan.so.2+0xa3382)
>     #7 __tsan_mutex_post_lock ../../../../src/libsanitizer/tsan/tsan_inte=
rface_ann.cpp:384 (libtsan.so.2+0x76bc3)
>     #8 qemu_spin_lock /home/cota/src/qemu/include/qemu/thread.h:259 (test=
-qht+0x44a97)
>     #9 qht_map_lock_buckets ../util/qht.c:253 (test-qht+0x44a97)
>     #10 do_qht_iter ../util/qht.c:809 (test-qht+0x45f33)
>     #11 qht_iter ../util/qht.c:821 (test-qht+0x45f33)
>     #12 iter_check ../tests/unit/test-qht.c:121 (test-qht+0xe473)
>     #13 qht_do_test ../tests/unit/test-qht.c:202 (test-qht+0xe473)
>     #14 qht_test ../tests/unit/test-qht.c:240 (test-qht+0xe7c1)
>     #15 test_default ../tests/unit/test-qht.c:246 (test-qht+0xe828)
>     #16 <null> <null> (libglib-2.0.so.0+0x7daed)
>     #17 <null> <null> (libglib-2.0.so.0+0x7d80a)
>     #18 <null> <null> (libglib-2.0.so.0+0x7d80a)
>     #19 g_test_run_suite <null> (libglib-2.0.so.0+0x7dfe9)
>     #20 g_test_run <null> (libglib-2.0.so.0+0x7e055)
>     #21 main ../tests/unit/test-qht.c:259 (test-qht+0xd2c6)
>     #22 __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58 =
(libc.so.6+0x29d8f)
>     #23 __libc_start_main_impl ../csu/libc-start.c:392 (libc.so.6+0x29e3f)
>     #24 _start <null> (test-qht+0xdb44)
>
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>  util/qht.c | 101 +++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 87 insertions(+), 14 deletions(-)
>
> diff --git a/util/qht.c b/util/qht.c
> index 15866299e6..70cc733d5d 100644
> --- a/util/qht.c
> +++ b/util/qht.c
> @@ -151,6 +151,22 @@ struct qht_bucket {
>=20=20
>  QEMU_BUILD_BUG_ON(sizeof(struct qht_bucket) > QHT_BUCKET_ALIGN);
>=20=20
> +/*
> + * Under TSAN, we use striped locks instead of one lock per bucket chain.
> + * This avoids crashing under TSAN, since TSAN aborts the program if mor=
e than
> + * 64 locks are held (this is a hardcoded limit in TSAN).
> + * When resizing a QHT we grab all the buckets' locks, which can easily
> + * go over TSAN's limit. By using striped locks, we avoid this problem.
> + *
> + * Note: this number must be a power of two for easy index computation.
> + */
> +#define QHT_TSAN_BUCKET_LOCKS_BITS 4
> +#define QHT_TSAN_BUCKET_LOCKS (1 << QHT_TSAN_BUCKET_LOCKS_BITS)
> +
> +struct qht_tsan_lock {
> +    QemuSpin lock;
> +} QEMU_ALIGNED(QHT_BUCKET_ALIGN);
> +
>  /**
>   * struct qht_map - structure to track an array of buckets
>   * @rcu: used by RCU. Keep it as the top field in the struct to help val=
grind
> @@ -160,6 +176,7 @@ QEMU_BUILD_BUG_ON(sizeof(struct qht_bucket) > QHT_BUC=
KET_ALIGN);
>   * @n_added_buckets: number of added (i.e. "non-head") buckets
>   * @n_added_buckets_threshold: threshold to trigger an upward resize onc=
e the
>   *                             number of added buckets surpasses it.
> + * @tsan_bucket_locks: Array of striped locks to be used only under TSAN.
>   *
>   * Buckets are tracked in what we call a "map", i.e. this structure.
>   */
> @@ -169,6 +186,9 @@ struct qht_map {
>      size_t n_buckets;
>      size_t n_added_buckets;
>      size_t n_added_buckets_threshold;
> +#ifdef CONFIG_TSAN
> +    struct qht_tsan_lock tsan_bucket_locks[QHT_TSAN_BUCKET_LOCKS];
> +#endif
>  };
>=20=20
>  /* trigger a resize when n_added_buckets > n_buckets / div */
> @@ -229,10 +249,62 @@ static inline size_t qht_elems_to_buckets(size_t n_=
elems)
>      return pow2ceil(n_elems / QHT_BUCKET_ENTRIES);
>  }
>=20=20
> -static inline void qht_head_init(struct qht_bucket *b)
> +/*
> + * When using striped locks (i.e. under TSAN), we have to be careful not
> + * to operate on the same lock twice (e.g. when iterating through all bu=
ckets).
> + * We achieve this by operating only on each stripe's first matching loc=
k.
> + */
> +static inline void qht_do_if_first_in_stripe(const struct qht_map *map,
> +                                             struct qht_bucket *b,
> +                                             void (*func)(QemuSpin *spin=
))
> +{
> +#ifdef CONFIG_TSAN
> +    unsigned long bucket_idx =3D b - map->buckets;
> +    bool is_first_in_stripe =3D (bucket_idx >> QHT_TSAN_BUCKET_LOCKS_BIT=
S) =3D=3D 0;
> +    if (is_first_in_stripe) {
> +        unsigned long lock_idx =3D bucket_idx & (QHT_TSAN_BUCKET_LOCKS -=
 1);
> +        func(&map->tsan_bucket_locks[lock_idx]);

Hmm I ran into an issue with:

     ../util/qht.c:286:10: error: incompatible pointer types passing 'const=
 struct qht_tsan_lock *' to parameter of type 'QemuSpin *' (aka 'struct Qem=
uSpin *') [-Werror,-Wincompatible-pointer-types]
    func(&map->tsan_bucket_locks[lock_idx]);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

But changing the line to:

    func(&map->tsan_bucket_locks[lock_idx].lock);

still fails because:

../../util/qht.c:266:14: error: passing 'const QemuSpin *' (aka 'const stru=
ct QemuSpin *') to parameter of type 'QemuSpin *' (aka 'struct QemuSpin *')=
 discards qualifiers [\
-Werror,-Wincompatible-pointer-types-discards-qualifiers]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
        func(&map->tsan_bucket_locks[lock_idx].lock);=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=20=20=20=20=20=20=20=20=
=20=20=20=20

> +    }
> +#else
> +    func(&b->lock);
> +#endif
> +}
> +
> +static inline void qht_bucket_lock_destroy(const struct qht_map *map,
> +                                           struct qht_bucket *b)
> +{
> +    qht_do_if_first_in_stripe(map, b, qemu_spin_destroy);
> +}

Who is meant to be calling this?

> +
> +static inline void qht_bucket_lock_do(const struct qht_map *map,
> +                                      struct qht_bucket *b,
> +                                      void (*func)(QemuSpin *lock))
> +{
> +#ifdef CONFIG_TSAN
> +    unsigned long bucket_idx =3D b - map->buckets;
> +    unsigned long lock_idx =3D bucket_idx & (QHT_TSAN_BUCKET_LOCKS - 1);
> +    func(&map->tsan_bucket_locks[lock_idx]);
> +#else
> +    func(&b->lock);
> +#endif
> +}
> +
> +static inline void qht_bucket_lock(const struct qht_map *map,
> +                                   struct qht_bucket *b)
> +{
> +    qht_bucket_lock_do(map, b, qemu_spin_lock);
> +}
> +
> +static inline void qht_bucket_unlock(const struct qht_map *map,
> +                                     struct qht_bucket *b)
> +{
> +    qht_bucket_lock_do(map, b, qemu_spin_unlock);
> +}
> +
> +static inline void qht_head_init(struct qht_map *map, struct qht_bucket =
*b)
>  {
>      memset(b, 0, sizeof(*b));
> -    qemu_spin_init(&b->lock);
> +    qht_do_if_first_in_stripe(map, b, qemu_spin_init);
>      seqlock_init(&b->sequence);
>  }
>=20=20
> @@ -250,7 +322,7 @@ static void qht_map_lock_buckets(struct qht_map *map)
>      for (i =3D 0; i < map->n_buckets; i++) {
>          struct qht_bucket *b =3D &map->buckets[i];
>=20=20
> -        qemu_spin_lock(&b->lock);
> +        qht_do_if_first_in_stripe(map, b, qemu_spin_lock);
>      }
>  }
>=20=20
> @@ -261,7 +333,7 @@ static void qht_map_unlock_buckets(struct qht_map *ma=
p)
>      for (i =3D 0; i < map->n_buckets; i++) {
>          struct qht_bucket *b =3D &map->buckets[i];
>=20=20
> -        qemu_spin_unlock(&b->lock);
> +        qht_do_if_first_in_stripe(map, b, qemu_spin_unlock);
>      }
>  }
>=20=20
> @@ -308,7 +380,7 @@ void qht_map_lock_buckets__no_stale(struct qht *ht, s=
truct qht_map **pmap)
>   * Get a head bucket and lock it, making sure its parent map is not stal=
e.
>   * @pmap is filled with a pointer to the bucket's parent map.
>   *
> - * Unlock with qemu_spin_unlock(&b->lock).
> + * Unlock with qht_bucket_unlock.
>   *
>   * Note: callers cannot have ht->lock held.
>   */
> @@ -322,18 +394,18 @@ struct qht_bucket *qht_bucket_lock__no_stale(struct=
 qht *ht, uint32_t hash,
>      map =3D qatomic_rcu_read(&ht->map);
>      b =3D qht_map_to_bucket(map, hash);
>=20=20
> -    qemu_spin_lock(&b->lock);
> +    qht_bucket_lock(map, b);
>      if (likely(!qht_map_is_stale__locked(ht, map))) {
>          *pmap =3D map;
>          return b;
>      }
> -    qemu_spin_unlock(&b->lock);
> +    qht_bucket_unlock(map, b);
>=20=20
>      /* we raced with a resize; acquire ht->lock to see the updated ht->m=
ap */
>      qht_lock(ht);
>      map =3D ht->map;
>      b =3D qht_map_to_bucket(map, hash);
> -    qemu_spin_lock(&b->lock);
> +    qht_bucket_lock(map, b);
>      qht_unlock(ht);
>      *pmap =3D map;
>      return b;
> @@ -345,12 +417,13 @@ static inline bool qht_map_needs_resize(const struc=
t qht_map *map)
>             map->n_added_buckets_threshold;
>  }
>=20=20
> -static inline void qht_chain_destroy(const struct qht_bucket *head)
> +static inline void qht_chain_destroy(const struct qht_map *map,
> +                                     struct qht_bucket *head)
>  {
>      struct qht_bucket *curr =3D head->next;
>      struct qht_bucket *prev;
>=20=20
> -    qemu_spin_destroy(&head->lock);
> +    qht_do_if_first_in_stripe(map, head, qemu_spin_destroy);
>      while (curr) {
>          prev =3D curr;
>          curr =3D curr->next;
> @@ -364,7 +437,7 @@ static void qht_map_destroy(struct qht_map *map)
>      size_t i;
>=20=20
>      for (i =3D 0; i < map->n_buckets; i++) {
> -        qht_chain_destroy(&map->buckets[i]);
> +        qht_chain_destroy(map, &map->buckets[i]);
>      }
>      qemu_vfree(map->buckets);
>      g_free(map);
> @@ -390,7 +463,7 @@ static struct qht_map *qht_map_create(size_t n_bucket=
s)
>      map->buckets =3D qemu_memalign(QHT_BUCKET_ALIGN,
>                                   sizeof(*map->buckets) * n_buckets);
>      for (i =3D 0; i < n_buckets; i++) {
> -        qht_head_init(&map->buckets[i]);
> +        qht_head_init(map, &map->buckets[i]);
>      }
>      return map;
>  }
> @@ -638,7 +711,7 @@ bool qht_insert(struct qht *ht, void *p, uint32_t has=
h, void **existing)
>      b =3D qht_bucket_lock__no_stale(ht, hash, &map);
>      prev =3D qht_insert__locked(ht, map, b, p, hash, &needs_resize);
>      qht_bucket_debug__locked(b);
> -    qemu_spin_unlock(&b->lock);
> +    qht_bucket_unlock(map, b);
>=20=20
>      if (unlikely(needs_resize) && ht->mode & QHT_MODE_AUTO_RESIZE) {
>          qht_grow_maybe(ht);
> @@ -749,7 +822,7 @@ bool qht_remove(struct qht *ht, const void *p, uint32=
_t hash)
>      b =3D qht_bucket_lock__no_stale(ht, hash, &map);
>      ret =3D qht_remove__locked(b, p, hash);
>      qht_bucket_debug__locked(b);
> -    qemu_spin_unlock(&b->lock);
> +    qht_bucket_unlock(map, b);
>      return ret;
>  }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

