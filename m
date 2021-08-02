Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABAA3DDE5B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 19:21:39 +0200 (CEST)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAbdC-0007a1-3G
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 13:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAbbs-0006em-Tp
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:20:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAbbq-0001Hf-Gh
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 13:20:16 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so420156wmb.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 10:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=A+kwShJ4oTKmf+8UtEikZ6wHfe4z8Wo57Tjom5rRbL0=;
 b=u2iqLO67BX5aqKJh2cLnjTxFLno83ROdF87zdb7IlMxsfGg2jRuqBmL8Ylx7fLCX2J
 SbxdEKzdOd951YzIL5tKxqDGLRzJuj6JCdD7/mFZh05y4WQCrRsEqKdxzaVArow6857e
 4Yb7n5MS5E+o/mwqnok6ikqviUs1M+0PPaW1E87So5hbP32qd/MEPBebMvQESK3xc1mF
 6u2XoGaJop/pmemDXIDBgV43sjnq5UUKic2HledpQLaUTVNAbeYpH6dJFbF/B3hkPJF8
 3UdAfC1rqa2snP9U5HKCCSheVSKpZDTm3hYRVqCCEgAXKJYl5FkewNHO8xECXuT/r6Cy
 gTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=A+kwShJ4oTKmf+8UtEikZ6wHfe4z8Wo57Tjom5rRbL0=;
 b=hKColVKamCwxgEfB4t7qMt86JZ8YKONJdrRGYxnimnPQaCQyIZRHvejDaFORv8+sPO
 AKANq3PMtEyTFaLPkTY0LiIMOWe09FqZ+p6gu4po/EOD8n0Z2K4JspjPOpAOsXD9Oegw
 lq3ndM6962Wk40PMWLT1w79QXAHLmR55eL/X7rVm6HyZC9sGKo/rivUSb6ozhVw7XQRQ
 LHKTIDuUJvExyhS5YYZ1algx2/FamQTntmU5swZutAjEtZgm5UmXjHfvB6X77UQ5O8c4
 2a4po2v8VrQ+wAnRCaRxmkATMQvDNXpzhEXtQCkNIWsukMg28Y1co/K9cp543WE+lXZm
 LW/A==
X-Gm-Message-State: AOAM532Kd89Y4FjQVaLFkWTkELRhI6cMiuiMJlg2eTJ4pXz67UEAM8F3
 b+UemjP5HYrwAC8Qso6oGLmDbg==
X-Google-Smtp-Source: ABdhPJwOkix+dmDZR7odtJq58J5QNQHStIUUXiVeil070o2QorWn2FRTg0mLJIpE+JpPg/D5qS2Vjg==
X-Received: by 2002:a1c:153:: with SMTP id 80mr11656931wmb.53.1627924812805;
 Mon, 02 Aug 2021 10:20:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d67sm12537wmd.9.2021.08.02.10.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 10:20:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEBAC1FF96;
 Mon,  2 Aug 2021 18:20:10 +0100 (BST)
References: <20210802133144.45196-1-ma.mandourr@gmail.com>
 <20210802133144.45196-2-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4 1/2] plugins/cache: supported multicore cache modelling
Date: Mon, 02 Aug 2021 18:11:07 +0100
In-reply-to: <20210802133144.45196-2-ma.mandourr@gmail.com>
Message-ID: <8735rrhigl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>, cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Multicore L1 cache modelling is introduced and is supported for both
> full system emulation and linux-user.
>
> For full-system emulation, L1 icache and dcache are maintained for each
> available core, since this information is exposed to the plugin through
> `qemu_plugin_n_vcpus()`.
>
> For linux-user, a static number of cores is assumed (default 1 core, and
> can be provided as a plugin argument `cores=3DN`). Every memory access
> goes through one of these caches, this approach is taken as it's
> somewhat akin to what happens on real setup, where a program that
> dispatches more threads than the available cores, they'll thrash
> each other
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 154 +++++++++++++++++++++++++++++++---------
>  1 file changed, 119 insertions(+), 35 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index 066ea6d8ec..971569cc9d 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -23,12 +23,6 @@ static GRand *rng;
>  static int limit;
>  static bool sys;
>=20=20
> -static uint64_t dmem_accesses;
> -static uint64_t dmisses;
> -
> -static uint64_t imem_accesses;
> -static uint64_t imisses;
> -
>  enum EvictionPolicy {
>      LRU,
>      FIFO,
> @@ -90,13 +84,22 @@ typedef struct {
>      uint64_t imisses;
>  } InsnData;
>=20=20
> +typedef struct {
> +    uint64_t dmem_accesses;
> +    uint64_t dmisses;
> +    uint64_t imem_accesses;
> +    uint64_t imisses;
> +} CoreStats;
> +
>  void (*update_hit)(Cache *cache, int set, int blk);
>  void (*update_miss)(Cache *cache, int set, int blk);
>=20=20
>  void (*metadata_init)(Cache *cache);
>  void (*metadata_destroy)(Cache *cache);
>=20=20
> -Cache *dcache, *icache;
> +static int cores;
> +CoreStats *stats;
> +Cache **dcaches, **icaches;
>=20=20
>  static int pow_of_two(int num)
>  {
> @@ -233,14 +236,16 @@ static bool bad_cache_params(int blksize, int assoc=
, int cachesize)
>=20=20
>  static Cache *cache_init(int blksize, int assoc, int cachesize)
>  {
> -    if (bad_cache_params(blksize, assoc, cachesize)) {
> -        return NULL;
> -    }
> -
>      Cache *cache;
>      int i;
>      uint64_t blk_mask;
>=20=20
> +    /*
> +     * This function shall not be called directly, and hence expects sui=
table
> +     * parameters.
> +     */
> +    g_assert(!bad_cache_params(blksize, assoc, cachesize));
> +
>      cache =3D g_new(Cache, 1);
>      cache->assoc =3D assoc;
>      cache->cachesize =3D cachesize;
> @@ -263,6 +268,24 @@ static Cache *cache_init(int blksize, int assoc, int=
 cachesize)
>      return cache;
>  }
>=20=20
> +static Cache **caches_init(int blksize, int assoc, int cachesize)
> +{
> +    Cache **caches;
> +    int i;
> +
> +    if (bad_cache_params(blksize, assoc, cachesize)) {
> +        return NULL;
> +    }
> +
> +    caches =3D g_new(Cache *, cores);
> +
> +    for (i =3D 0; i < cores; i++) {
> +        caches[i] =3D cache_init(blksize, assoc, cachesize);
> +    }
> +
> +    return caches;
> +}
> +
>  static int get_invalid_block(Cache *cache, uint64_t set)
>  {
>      int i;
> @@ -353,6 +376,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, =
qemu_plugin_meminfo_t info,
>  {
>      uint64_t effective_addr;
>      struct qemu_plugin_hwaddr *hwaddr;
> +    int cache_idx;
>      InsnData *insn;
>=20=20
>      hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);
> @@ -361,14 +385,15 @@ static void vcpu_mem_access(unsigned int vcpu_index=
, qemu_plugin_meminfo_t info,
>      }
>=20=20
>      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : v=
addr;
> +    cache_idx =3D vcpu_index % cores;
>=20=20
>      g_mutex_lock(&mtx);
> -    if (!access_cache(dcache, effective_addr)) {
> +    if (!access_cache(dcaches[cache_idx], effective_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->dmisses++;
> -        dmisses++;
> +        stats[cache_idx].dmisses++;
>      }
> -    dmem_accesses++;
> +    stats[cache_idx].dmem_accesses++;
>      g_mutex_unlock(&mtx);
>  }
>=20=20
> @@ -376,16 +401,18 @@ static void vcpu_insn_exec(unsigned int vcpu_index,=
 void *userdata)
>  {
>      uint64_t insn_addr;
>      InsnData *insn;
> +    int cache_idx;
>=20=20
>      g_mutex_lock(&mtx);

I've been running some experiments and unsurprisingly I'm seeing fairly
massive lock contention here:

  21.31%  qemu-system-aar  [kernel.kallsyms]        [k] syscall_exit_to_use=
r_mode
  10.15%  qemu-system-aar  [kernel.kallsyms]        [k] syscall_return_via_=
sysret
   7.63%  qemu-system-aar  [kernel.kallsyms]        [k] entry_SYSCALL_64
   4.68%  qemu-system-aar  libcache.so              [.] vcpu_insn_exec
   3.09%  qemu-system-aar  libcache.so              [.] in_cache
   2.92%  qemu-system-aar  libglib-2.0.so.0.6600.8  [.] g_mutex_lock_slowpa=
th
   2.72%  qemu-system-aar  [kernel.kallsyms]        [k] futex_wait_setup
   2.46%  qemu-system-aar  libglib-2.0.so.0.6600.8  [.] g_mutex_unlock
   2.35%  qemu-system-aar  libglib-2.0.so.0.6600.8  [.] g_mutex_lock
   2.26%  qemu-system-aar  [kernel.kallsyms]        [k] futex_wake
   2.26%  qemu-system-aar  [kernel.kallsyms]        [k] entry_SYSCALL_64_af=
ter_hwframe
   2.12%  qemu-system-aar  libc-2.31.so             [.] syscall
   1.93%  qemu-system-aar  [kernel.kallsyms]        [k] _raw_spin_lock
   1.77%  qemu-system-aar  [kernel.kallsyms]        [k] native_queued_spin_=
lock_slowpath
   1.74%  qemu-system-aar  libcache.so              [.] vcpu_mem_access=20=
=20=20=20

While we need locking because we are multi-core I think we need to split
this up a bit. You probably want to keep the shared mutex for inserting
instruction data into the hash table and looking it up on generation.
However the individual cache structures should have their own mutexes -
which in the system case should ensure we always use the fast path.

>      insn_addr =3D ((InsnData *) userdata)->addr;
> +    cache_idx =3D vcpu_index % cores;
>=20=20
> -    if (!access_cache(icache, insn_addr)) {
> +    if (!access_cache(icaches[cache_idx], insn_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->imisses++;
> -        imisses++;

I don't know if it's worth having a mutex per instruction or just
going for an atomic inc operation. I suspect for x86 it will probably do
a fairly decent job when the same instruction isn't contended.

> +        stats[cache_idx].imisses++;

If we wrap the stats into the cache structure themselves they can share
the same mutex.

>      }
> -    imem_accesses++;
> +    stats[cache_idx].imem_accesses++;
>      g_mutex_unlock(&mtx);
>  }
>=20=20
> @@ -453,6 +480,15 @@ static void cache_free(Cache *cache)
>      g_free(cache);
>  }
>=20=20
> +static void caches_free(Cache **caches)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < cores; i++) {
> +        cache_free(caches[i]);
> +    }
> +}
> +
>  static int dcmp(gconstpointer a, gconstpointer b)
>  {
>      InsnData *insn_a =3D (InsnData *) a;
> @@ -461,6 +497,36 @@ static int dcmp(gconstpointer a, gconstpointer b)
>      return insn_a->dmisses < insn_b->dmisses ? 1 : -1;
>  }
>=20=20
> +static void append_stats_line(GString *line, CoreStats cs)
> +{
> +    double dmiss_rate, imiss_rate;
> +
> +    dmiss_rate =3D ((double) cs.dmisses) / (cs.dmem_accesses) * 100.0;
> +    imiss_rate =3D ((double) cs.imisses) / (cs.imem_accesses) * 100.0;
> +
> +    g_string_append_printf(line, "%-14lu %-12lu %9.4lf%%  %-14lu %-12lu"
> +                           " %9.4lf%%\n",
> +                           cs.dmem_accesses,
> +                           cs.dmisses,
> +                           cs.dmem_accesses ? dmiss_rate : 0.0,
> +                           cs.imem_accesses,
> +                           cs.imisses,
> +                           cs.imem_accesses ? imiss_rate : 0.0);
> +}
> +
> +static void sum_stats(void)
> +{
> +    int i;
> +
> +    g_assert(cores > 1);
> +    for (i =3D 0; i < cores; i++) {
> +        stats[cores].imisses +=3D stats[i].imisses;
> +        stats[cores].dmisses +=3D stats[i].dmisses;
> +        stats[cores].dmem_accesses +=3D stats[i].dmem_accesses;
> +        stats[cores].imem_accesses +=3D stats[i].imem_accesses;
> +    }
> +}
> +
>  static int icmp(gconstpointer a, gconstpointer b)
>  {
>      InsnData *insn_a =3D (InsnData *) a;
> @@ -471,19 +537,25 @@ static int icmp(gconstpointer a, gconstpointer b)
>=20=20
>  static void log_stats(void)
>  {
> -    g_autoptr(GString) rep =3D g_string_new("");
> -    g_string_append_printf(rep,
> -        "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> -        dmem_accesses,
> -        dmisses,
> -        ((double) dmisses / (double) dmem_accesses) * 100.0);
> -
> -    g_string_append_printf(rep,
> -        "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> -        imem_accesses,
> -        imisses,
> -        ((double) imisses / (double) imem_accesses) * 100.0);
> +    int i, iters;
> +
> +    g_autoptr(GString) rep =3D g_string_new("core #, data accesses, data=
 misses,"
> +                                          " dmiss rate, insn accesses,"
> +                                          " insn misses, imiss rate\n");
> +
> +    /* Only iterate and print a sum row if cores > 1 */
> +    iters =3D cores =3D=3D 1 ? 1 : cores + 1;
> +    for (i =3D 0; i < iters; i++) {
> +        if (i =3D=3D cores) {
> +            g_string_append_printf(rep, "%-8s", "sum");
> +            sum_stats();
> +        } else {
> +            g_string_append_printf(rep, "%-8d", i);
> +        }
> +        append_stats_line(rep, stats[i]);
> +    }
>=20=20
> +    g_string_append(rep, "\n");
>      qemu_plugin_outs(rep->str);
>  }
>=20=20
> @@ -530,10 +602,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *=
p)
>      log_stats();
>      log_top_insns();
>=20=20
> -    cache_free(dcache);
> -    cache_free(icache);
> +    caches_free(dcaches);
> +    caches_free(icaches);
>=20=20
>      g_hash_table_destroy(miss_ht);
> +
> +    g_free(stats);
>  }
>=20=20
>  static void policy_init(void)
> @@ -579,6 +653,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qe=
mu_info_t *info,
>=20=20
>      policy =3D LRU;
>=20=20
> +    cores =3D sys ? qemu_plugin_n_vcpus() : 1;
> +
>      for (i =3D 0; i < argc; i++) {
>          char *opt =3D argv[i];
>          if (g_str_has_prefix(opt, "iblksize=3D")) {
> @@ -595,6 +671,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qe=
mu_info_t *info,
>              dcachesize =3D g_ascii_strtoll(opt + 11, NULL, 10);
>          } else if (g_str_has_prefix(opt, "limit=3D")) {
>              limit =3D g_ascii_strtoll(opt + 6, NULL, 10);
> +        } else if (g_str_has_prefix(opt, "cores=3D")) {
> +            cores =3D g_ascii_strtoll(opt + 6, NULL, 10);
>          } else if (g_str_has_prefix(opt, "evict=3D")) {
>              gchar *p =3D opt + 6;
>              if (g_strcmp0(p, "rand") =3D=3D 0) {
> @@ -615,22 +693,28 @@ int qemu_plugin_install(qemu_plugin_id_t id, const =
qemu_info_t *info,
>=20=20
>      policy_init();
>=20=20
> -    dcache =3D cache_init(dblksize, dassoc, dcachesize);
> -    if (!dcache) {
> +    dcaches =3D caches_init(dblksize, dassoc, dcachesize);
> +    if (!dcaches) {
>          const char *err =3D cache_config_error(dblksize, dassoc, dcaches=
ize);
>          fprintf(stderr, "dcache cannot be constructed from given paramet=
ers\n");
>          fprintf(stderr, "%s\n", err);
>          return -1;
>      }
>=20=20
> -    icache =3D cache_init(iblksize, iassoc, icachesize);
> -    if (!icache) {
> +    icaches =3D caches_init(iblksize, iassoc, icachesize);
> +    if (!icaches) {
>          const char *err =3D cache_config_error(iblksize, iassoc, icaches=
ize);
>          fprintf(stderr, "icache cannot be constructed from given paramet=
ers\n");
>          fprintf(stderr, "%s\n", err);
>          return -1;
>      }
>=20=20
> +    /*
> +     * plus one to save the sum in. If only one core is used then no nee=
d to
> +     * get an auxiliary struct.
> +     */
> +    stats =3D g_new0(CoreStats, cores =3D=3D 1 ? 1 : cores + 1);
> +
>      qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);


--=20
Alex Benn=C3=A9e

