Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2988397F65
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:18:35 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHOs-0005Qk-VQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHMy-000498-O7
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:16:36 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:42909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHMt-0005gy-PR
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:16:36 -0400
Received: by mail-io1-xd33.google.com with SMTP id k22so979489ioa.9
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dV9cTe75nFt6zw0mtqfup6YSHaJ8ULSeBsnI6ayToB4=;
 b=inqafwcHvQJKeP88SHqE+QD5r5+rTC7FWPvn5GwBcB0njI/016aK5TkEFWZ87zmWJW
 Dciz9OMyNPsFm960CbFu1IkA0Kz+mEHiQTvULzFyaXxeVS7wUGkcdeisKoynw/O0979s
 095tSu07LcM6lhNflNt7UTte2Fl2uD/m6gOuCAtea9ae9bnvEMEGV3MpgnK4oMWCK+0L
 zzoFwWb41/UOmjZw3e6OHTHjtHiuizR6sdb03s0Mr0zR0ZTtCsdXc8i8nPWMAF+NFUBR
 4xpd9o2GkjGW1z2q/RaviWc5geuqotIP4aILAg3nyRbRynSipx+MqzWJ01/7I/5gvZJi
 edTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dV9cTe75nFt6zw0mtqfup6YSHaJ8ULSeBsnI6ayToB4=;
 b=UAA6xQGd4zukw/TdWjwKCyCyj027/WELiHH9Aby1y/tnraKnpOZ4Pxj5RkF5ZLRWXo
 dsNZxWGPeDhGATp0kACNVn/ZUj0pmm00OOZgQHoMDePnWxFiC7qfdQ4+m/XfWTc8EKCT
 U82vi5wHxTYpDHl90SNcniUYZMLiZunWQyw8qlHhNkDrZ3406fVzXgz8dNNuSmzGNxjD
 1KNp4D4gtn1OudxbrwfeTcXm5ha2AtWbedezlk9mAQUfyvOjkumPwivEE+TATJgNMm9j
 xMMmKNYyMQWco410mq3yHD0H81ZEPkC4zLh+88KWy4ExFSxoh/zBPuV30XZXur+ulDkc
 YjYA==
X-Gm-Message-State: AOAM5325wQ6Frrl+icElgzG/0Nk7t2NrGPxkpZ36VhZkog2NcznC61HI
 Vev/tpdJZmnZyqfWsFQVPYIqwjxtHGVravI67vhDV6CeIP1N2A==
X-Google-Smtp-Source: ABdhPJzlEJcE/SDU86IOaj3Cc3v8EV6jBrA97eZtzAGoE1/sYGfYMfKeU27XxAIqYlnkJ/qI0F3NXkNPQCg9CYlgCKU=
X-Received: by 2002:a05:6602:18:: with SMTP id
 b24mr23544654ioa.1.1622603790593; 
 Tue, 01 Jun 2021 20:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-4-ma.mandourr@gmail.com>
In-Reply-To: <20210530063712.6832-4-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 05:16:19 +0200
Message-ID: <CAD-LL6gPpN2G0sZcXEN1edjk2ZtpCMCpg1BKfdwjsOpEkqVtzg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] plugins: cache: Added FIFO and LRU eviction
 policies.
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008cb3f005c3bfe26b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008cb3f005c3bfe26b
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 8:37 AM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Now one of the three eviction policies can be chosen as an argument. On
> not specifying an argument, LRU is used by default.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 159 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 146 insertions(+), 13 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index fa0bf1dd40..1e323494bf 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -18,6 +18,8 @@
>
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
>
> +static bool fifo, lru, rnd;
> +
>  static GRand *rng;
>  static GHashTable *dmiss_ht;
>  static GHashTable *imiss_ht;
> @@ -55,6 +57,8 @@ struct CacheBlock {
>
>  struct CacheSet {
>      struct CacheBlock *blocks;
> +    uint16_t *priorities;
> +    GQueue *evict_queue;
>  };
>
>  struct Cache {
> @@ -93,6 +97,84 @@ static inline uint64_t extract_set(struct Cache *cache,
> uint64_t addr)
>      return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
>  }
>
> +static void lru_priorities_init(struct Cache *cache)
> +{
> +    int i, j;
> +
> +    for (i = 0; i < cache->num_sets; i++) {
> +        cache->sets[i].priorities = g_new(uint16_t, cache->assoc);
> +        for (j = 0; j < cache->assoc; j++) {
> +            cache->sets[i].priorities[j] = cache->assoc - j - 1;
> +        }
> +    }
> +}
> +
> +static void lru_update_on_miss(struct Cache *cache,
> +                                      int set_idx,
> +                                      int blk_idx)
> +{
> +    int i;
> +
> +    for (i = 0; i < cache->assoc; i++) {
> +        cache->sets[set_idx].priorities[i]++;
> +    }
> +
> +    cache->sets[set_idx].priorities[blk_idx] = 0;
> +}
> +
> +static void lru_update_on_hit(struct Cache *cache,
> +                                         int set_idx,
> +                                         int blk_idx)
> +{
> +    uint16_t blk_priority;
> +    int i;
> +
> +    blk_priority = cache->sets[set_idx].priorities[blk_idx];
> +    for (i = 0; i < cache->assoc; i++) {
> +        if (cache->sets[set_idx].priorities[i] < blk_priority) {
> +            cache->sets[set_idx].priorities[i]++;
> +        }
> +    }
> +    cache->sets[set_idx].priorities[blk_idx] = 0;
> +}
> +
> +static int lru_get_lru_block(struct Cache *cache, int set_idx)
> +{
> +    int i;
> +
> +    for (i = 0; i < cache->assoc; i++) {
> +        if (cache->sets[set_idx].priorities[i] == cache->assoc - 1) {
> +            return i;
> +        }
> +    }
> +
> +    g_assert_not_reached();
> +}
> +
> +static void fifo_init(struct Cache *cache)
> +{
> +    int i;
> +
> +    for (i = 0; i < cache->num_sets; i++) {
> +        cache->sets[i].evict_queue = g_queue_new();
> +    }
> +}
> +
> +static int fifo_get_first_in_block(struct Cache *cache, int set)
> +{
> +    GQueue *q = cache->sets[set].evict_queue;
> +    return GPOINTER_TO_INT(g_queue_pop_tail(q));
> +}
> +
> +static void fifo_update_on_miss(struct Cache *cache,
> +                                int set,
> +                                int blk_idx)
> +{
> +    GQueue *q = cache->sets[set].evict_queue;
> +    g_queue_push_head(q, GINT_TO_POINTER(blk_idx));
> +}
> +
> +
>  static struct Cache *cache_init(int blksize, int assoc, int cachesize)
>  {
>      struct Cache *cache;
> @@ -113,6 +195,12 @@ static struct Cache *cache_init(int blksize, int
> assoc, int cachesize)
>      cache->set_mask = ((cache->num_sets - 1) <<
> (pow_of_two(cache->blksize)));
>      cache->tag_mask = ~(cache->set_mask | cache->blk_mask);
>
> +    if (lru) {
> +        lru_priorities_init(cache);
> +    } else if (fifo) {
> +        fifo_init(cache);
> +    }
> +
>      return cache;
>  }
>
> @@ -131,12 +219,20 @@ static int get_invalid_block(struct Cache *cache,
> uint64_t set)
>      return -1;
>  }
>
> -static int get_replaced_block(struct Cache *cache)
> +static int get_replaced_block(struct Cache *cache, int set)
>  {
> -    return g_rand_int_range(rng, 0, cache->assoc);
> +    if (rnd) {
> +        return g_rand_int_range(rng, 0, cache->assoc);
> +    } else if (lru) {
> +        return lru_get_lru_block(cache, set);
> +    } else if (fifo) {
> +        return fifo_get_first_in_block(cache, set);
> +    }
> +
> +    g_assert_not_reached();
>  }
>
> -static bool in_cache(struct Cache *cache, uint64_t addr)
> +static int in_cache(struct Cache *cache, uint64_t addr)
>  {
>      int i;
>      uint64_t tag, set;
> @@ -147,29 +243,39 @@ static bool in_cache(struct Cache *cache, uint64_t
> addr)
>      for (i = 0; i < cache->assoc; i++) {
>          if (cache->sets[set].blocks[i].tag == tag &&
>                  cache->sets[set].blocks[i].valid) {
> -            return true;
> +            return i;
>          }
>      }
>
> -    return false;
> +    return -1;
>  }
>
>  static enum AccessResult access_cache(struct Cache *cache, uint64_t addr)
>  {
>      uint64_t tag, set;
> -    int replaced_blk;
> -
> -    if (in_cache(cache, addr)) {
> -        return HIT;
> -    }
> +    int hit_blk, replaced_blk;
>
>      tag = extract_tag(cache, addr);
>      set = extract_set(cache, addr);
> +    hit_blk = in_cache(cache, addr);
> +
> +    if (hit_blk != -1) {
> +        if (lru) {
> +            lru_update_on_hit(cache, set, hit_blk);
> +        }
> +        return HIT;
> +    }
>
>      replaced_blk = get_invalid_block(cache, set);
>
>      if (replaced_blk == -1) {
> -        replaced_blk = get_replaced_block(cache);
> +        replaced_blk = get_replaced_block(cache, set);
> +    }
> +
> +    if (lru) {
> +        lru_update_on_miss(cache, set, replaced_blk);
> +    } else if (fifo) {
> +        fifo_update_on_miss(cache, set, replaced_blk);
>      }
>
>      cache->sets[set].blocks[replaced_blk].tag = tag;
> @@ -307,6 +413,11 @@ static void free_cache(struct Cache *cache)
>  {
>      for (int i = 0; i < cache->num_sets; i++) {
>          g_free(cache->sets[i].blocks);
> +        if (lru) {
> +            g_free(cache->sets[i].priorities);
> +        } else if (fifo) {
> +            g_queue_free(cache->sets[i].evict_queue);
> +        }
>      }
>
>      g_free(cache->sets);
> @@ -403,8 +514,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
>      iblksize = 64;
>      icachesize = iblksize * iassoc * 32;
>
> -    rng = g_rand_new();
> -
>      for (i = 0; i < argc; i++) {
>          char *opt = argv[i];
>          if (g_str_has_prefix(opt, "I=")) {
> @@ -433,6 +542,22 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
>              if (!tracefile) {
>                  fprintf(stderr, "could not open: %s for writing\n",
> file_name);
>              }
> +        } else if (g_str_has_prefix(opt, "evict=")) {
> +            if (lru || rnd || fifo) {
> +                fprintf(stderr, "eviction policy specified more than
> once\n");
> +                return -1;
> +            }
> +            gchar *policy = opt + 6;
> +            if (g_strcmp0(policy, "rand") == 0) {
> +                rnd = true;
> +            } else if (g_strcmp0(policy, "lru") == 0) {
> +                lru = true;
> +            } else if (g_strcmp0(policy, "fifo") == 0) {
> +                fifo = true;
> +            } else {
> +                fprintf(stderr, "invalid eviction policy: %s\n", opt);
> +                return -1;
> +            }
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
> @@ -449,6 +574,14 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
>          return -1;
>      }
>
> +    if (!rnd && !lru && !fifo) {
> +        lru = true;
> +    }
> +
> +    if (rnd) {
> +        rng = g_rand_new();
> +    }
> +
>      dcache = cache_init(dblksize, dassoc, dcachesize);
>      icache = cache_init(iblksize, iassoc, icachesize);
>
> --
> 2.25.1
>
>
CC'ing Emilio

--0000000000008cb3f005c3bfe26b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sun, May 30, 2021 at 8:37 AM Mahmoud M=
andour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">No=
w one of the three eviction policies can be chosen as an argument. On<br>
not specifying an argument, LRU is used by default.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
---<br>
=C2=A0contrib/plugins/cache.c | 159 ++++++++++++++++++++++++++++++++++++---=
-<br>
=C2=A01 file changed, 146 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
index fa0bf1dd40..1e323494bf 100644<br>
--- a/contrib/plugins/cache.c<br>
+++ b/contrib/plugins/cache.c<br>
@@ -18,6 +18,8 @@<br>
<br>
=C2=A0QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;<b=
r>
<br>
+static bool fifo, lru, rnd;<br>
+<br>
=C2=A0static GRand *rng;<br>
=C2=A0static GHashTable *dmiss_ht;<br>
=C2=A0static GHashTable *imiss_ht;<br>
@@ -55,6 +57,8 @@ struct CacheBlock {<br>
<br>
=C2=A0struct CacheSet {<br>
=C2=A0 =C2=A0 =C2=A0struct CacheBlock *blocks;<br>
+=C2=A0 =C2=A0 uint16_t *priorities;<br>
+=C2=A0 =C2=A0 GQueue *evict_queue;<br>
=C2=A0};<br>
<br>
=C2=A0struct Cache {<br>
@@ -93,6 +97,84 @@ static inline uint64_t extract_set(struct Cache *cache, =
uint64_t addr)<br>
=C2=A0 =C2=A0 =C2=A0return (addr &amp; cache-&gt;set_mask) &gt;&gt; (pow_of=
_two(cache-&gt;blksize));<br>
=C2=A0}<br>
<br>
+static void lru_priorities_init(struct Cache *cache)<br>
+{<br>
+=C2=A0 =C2=A0 int i, j;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].priorities =3D g_new(uint16_=
t, cache-&gt;assoc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; cache-&gt;assoc; j++) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].priorities[j] =
=3D cache-&gt;assoc - j - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void lru_update_on_miss(struct Cache *cache,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int set_idx,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int blk_idx)<br=
>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[set_idx].priorities[i]++;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cache-&gt;sets[set_idx].priorities[blk_idx] =3D 0;<br>
+}<br>
+<br>
+static void lru_update_on_hit(struct Cache *cache,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t set_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in=
t blk_idx)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t blk_priority;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 blk_priority =3D cache-&gt;sets[set_idx].priorities[blk_idx]=
;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set_idx].priorities[i] &lt;=
 blk_priority) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[set_idx].prioriti=
es[i]++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 cache-&gt;sets[set_idx].priorities[blk_idx] =3D 0;<br>
+}<br>
+<br>
+static int lru_get_lru_block(struct Cache *cache, int set_idx)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set_idx].priorities[i] =3D=
=3D cache-&gt;assoc - 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_assert_not_reached();<br>
+}<br>
+<br>
+static void fifo_init(struct Cache *cache)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].evict_queue =3D g_queue_new(=
);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int fifo_get_first_in_block(struct Cache *cache, int set)<br>
+{<br>
+=C2=A0 =C2=A0 GQueue *q =3D cache-&gt;sets[set].evict_queue;<br>
+=C2=A0 =C2=A0 return GPOINTER_TO_INT(g_queue_pop_tail(q));<br>
+}<br>
+<br>
+static void fifo_update_on_miss(struct Cache *cache,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int set,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int blk_idx)<br>
+{<br>
+=C2=A0 =C2=A0 GQueue *q =3D cache-&gt;sets[set].evict_queue;<br>
+=C2=A0 =C2=A0 g_queue_push_head(q, GINT_TO_POINTER(blk_idx));<br>
+}<br>
+<br>
+<br>
=C2=A0static struct Cache *cache_init(int blksize, int assoc, int cachesize=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct Cache *cache;<br>
@@ -113,6 +195,12 @@ static struct Cache *cache_init(int blksize, int assoc=
, int cachesize)<br>
=C2=A0 =C2=A0 =C2=A0cache-&gt;set_mask =3D ((cache-&gt;num_sets - 1) &lt;&l=
t; (pow_of_two(cache-&gt;blksize)));<br>
=C2=A0 =C2=A0 =C2=A0cache-&gt;tag_mask =3D ~(cache-&gt;set_mask | cache-&gt=
;blk_mask);<br>
<br>
+=C2=A0 =C2=A0 if (lru) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lru_priorities_init(cache);<br>
+=C2=A0 =C2=A0 } else if (fifo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo_init(cache);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return cache;<br>
=C2=A0}<br>
<br>
@@ -131,12 +219,20 @@ static int get_invalid_block(struct Cache *cache, uin=
t64_t set)<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-static int get_replaced_block(struct Cache *cache)<br>
+static int get_replaced_block(struct Cache *cache, int set)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return g_rand_int_range(rng, 0, cache-&gt;assoc);<br>
+=C2=A0 =C2=A0 if (rnd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_rand_int_range(rng, 0, cache-&gt;asso=
c);<br>
+=C2=A0 =C2=A0 } else if (lru) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return lru_get_lru_block(cache, set);<br>
+=C2=A0 =C2=A0 } else if (fifo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fifo_get_first_in_block(cache, set);<br=
>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_assert_not_reached();<br>
=C2=A0}<br>
<br>
-static bool in_cache(struct Cache *cache, uint64_t addr)<br>
+static int in_cache(struct Cache *cache, uint64_t addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t tag, set;<br>
@@ -147,29 +243,39 @@ static bool in_cache(struct Cache *cache, uint64_t ad=
dr)<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cache-&gt;sets[set].blocks[i].tag =3D=
=3D tag &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache-&gt;set=
s[set].blocks[i].valid) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 return -1;<br>
=C2=A0}<br>
<br>
=C2=A0static enum AccessResult access_cache(struct Cache *cache, uint64_t a=
ddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint64_t tag, set;<br>
-=C2=A0 =C2=A0 int replaced_blk;<br>
-<br>
-=C2=A0 =C2=A0 if (in_cache(cache, addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HIT;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 int hit_blk, replaced_blk;<br>
<br>
=C2=A0 =C2=A0 =C2=A0tag =3D extract_tag(cache, addr);<br>
=C2=A0 =C2=A0 =C2=A0set =3D extract_set(cache, addr);<br>
+=C2=A0 =C2=A0 hit_blk =3D in_cache(cache, addr);<br>
+<br>
+=C2=A0 =C2=A0 if (hit_blk !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lru) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lru_update_on_hit(cache, set, hi=
t_blk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HIT;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0replaced_blk =3D get_invalid_block(cache, set);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (replaced_blk =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_replaced_block(cache);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_replaced_block(cache, set=
);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (lru) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lru_update_on_miss(cache, set, replaced_blk);<=
br>
+=C2=A0 =C2=A0 } else if (fifo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo_update_on_miss(cache, set, replaced_blk);=
<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0cache-&gt;sets[set].blocks[replaced_blk].tag =3D tag;<b=
r>
@@ -307,6 +413,11 @@ static void free_cache(struct Cache *cache)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0for (int i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(cache-&gt;sets[i].blocks);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lru) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cache-&gt;sets[i].priorit=
ies);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (fifo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_queue_free(cache-&gt;sets[i].e=
vict_queue);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_free(cache-&gt;sets);<br>
@@ -403,8 +514,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu=
_info_t *info,<br>
=C2=A0 =C2=A0 =C2=A0iblksize =3D 64;<br>
=C2=A0 =C2=A0 =C2=A0icachesize =3D iblksize * iassoc * 32;<br>
<br>
-=C2=A0 =C2=A0 rng =3D g_rand_new();<br>
-<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; argc; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *opt =3D argv[i];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (g_str_has_prefix(opt, &quot;I=3D&quot=
;)) {<br>
@@ -433,6 +542,22 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qem=
u_info_t *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tracefile) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stder=
r, &quot;could not open: %s for writing\n&quot;, file_name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;evict=
=3D&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lru || rnd || fifo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &q=
uot;eviction policy specified more than once\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar *policy =3D opt + 6;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(policy, &quot;rand=
&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rnd =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_strcmp0(policy, &qu=
ot;lru&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lru =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_strcmp0(policy, &qu=
ot;fifo&quot;) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &q=
uot;invalid eviction policy: %s\n&quot;, opt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;optio=
n parsing failed: %s\n&quot;, opt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
@@ -449,6 +574,14 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qem=
u_info_t *info,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!rnd &amp;&amp; !lru &amp;&amp; !fifo) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lru =3D true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (rnd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng =3D g_rand_new();<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0dcache =3D cache_init(dblksize, dassoc, dcachesize);<br=
>
=C2=A0 =C2=A0 =C2=A0icache =3D cache_init(iblksize, iassoc, icachesize);<br=
>
<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>CC&#39;ing Emilio=C2=A0</div></div></d=
iv>

--0000000000008cb3f005c3bfe26b--

