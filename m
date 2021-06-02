Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479C3980A1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 07:24:11 +0200 (CEST)
Received: from localhost ([::1]:58012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loJMP-0007Qg-BB
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 01:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loJLa-0006l1-1H
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 01:23:18 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loJLW-00077o-Rg
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 01:23:17 -0400
Received: by mail-il1-x134.google.com with SMTP id v13so989900ilh.13
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 22:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZHV1MHfPKEamoGnAdlDXVAf7+3G7pbN4JMzHn3oDBcQ=;
 b=t//1JEM8nwSTFX2yqoWAjfdo5oUVzS2IKq/jw7ojq2ACNx4fTTlfBPN6xKeyrqvwY/
 fSriUPVdhfPWusT5gN2HU8zoHPBv4ItMyisKAZFWSZG+R9HGuS3bY/z6ahdOe5f/ntUf
 wMVGAIp5c5WAJwhRYkMeU8oOBQutAUPIzr8caZWytaSXSMo5DW5yttUnRqqmpQ2hpSyt
 gVsq662xMnE/JJnJhwAV+KPLkmwRsmIKn/kqUL9WQPSotpQr8pqcFKDGS1K6/L86u8pn
 eiqEUy6JDI/I4J1UQyVMGBchdAAryA5yuhAWZKjjSzSBcLUJ67uzuo+g4GptqxrSu7nt
 y2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHV1MHfPKEamoGnAdlDXVAf7+3G7pbN4JMzHn3oDBcQ=;
 b=L54p4w3PssRXbAJXLmrgJxUUlnMQ2bxn+thiFrT7paDZpw8HOhXaIyt1StK0Rzuuhr
 rU4YBqAyYy+GPJoEltL3OPUFspbCAZi3TSrYPR/g9zGNyVtwFbroeZ4kiFnLWnkRzKOF
 MKSwdBNU7tvBlM56V+4VXUfo2TPc5pYn87GB9XEEWSdBcg+pAk05cmxPBYm3+/+QN/fz
 D/TQjCt8IwU6pQuajEEoFZgv8WAqPheWv1T8Eyv2LcMPpMNTyyIZc95OotNFvzTZhFmD
 fJlV08JQbiqDheAnR+9C6xXqC/yX3JttOzZasutiJpM6fysxPsxqH+Hhr98Y/6GPDWRN
 XmGw==
X-Gm-Message-State: AOAM532wqUQmGveKAiEs5VfTQWqxSxcKpUL4Y1ym+BA/ioJFK1RSckkQ
 XkP92tXe2CDlui5HiqXPnUaeKPHSc3ySRb1szEg=
X-Google-Smtp-Source: ABdhPJxeon7/lYN0Cpcf1tpF4U+ubguPA3Z0nh0eWeQBMUlyQWRCJv4TI/X1T+QcKUksV4CkwCwkm3yuKHf+6DiDs44=
X-Received: by 2002:a92:c5b1:: with SMTP id r17mr23128214ilt.255.1622611393479; 
 Tue, 01 Jun 2021 22:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-4-ma.mandourr@gmail.com>
 <874kehd8a9.fsf@linaro.org>
In-Reply-To: <874kehd8a9.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 07:23:02 +0200
Message-ID: <CAD-LL6gMMiSPNMJc5P2=gWAxq=bu8jFzfODkORrZ6BecB9eAyw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] plugins: cache: Added FIFO and LRU eviction
 policies.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b7876c05c3c1a7d3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x134.google.com
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
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b7876c05c3c1a7d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 1, 2021 at 3:27 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Now one of the three eviction policies can be chosen as an argument. On
> > not specifying an argument, LRU is used by default.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  contrib/plugins/cache.c | 159 ++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 146 insertions(+), 13 deletions(-)
> >
> > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> > index fa0bf1dd40..1e323494bf 100644
> > --- a/contrib/plugins/cache.c
> > +++ b/contrib/plugins/cache.c
> > @@ -18,6 +18,8 @@
> >
> >  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> >
> > +static bool fifo, lru, rnd;
> > +
>
> Ironically this would be a good use for a single variable with an enum,
> or alternatively a function pointer which can be set on initialisation.
>
> I think that I will implement the function pointers thing because as you
mention bellow it will somewhat reduce the clutter of checking the current
eviction policy each time and decide on which function to call.

>  static GRand *rng;
> >  static GHashTable *dmiss_ht;
> >  static GHashTable *imiss_ht;
> > @@ -55,6 +57,8 @@ struct CacheBlock {
> >
> >  struct CacheSet {
> >      struct CacheBlock *blocks;
> > +    uint16_t *priorities;
> > +    GQueue *evict_queue;
> >  };
> >
> >  struct Cache {
> > @@ -93,6 +97,84 @@ static inline uint64_t extract_set(struct Cache
> *cache, uint64_t addr)
> >      return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
> >  }
>
> I think it would be useful to summarise the LRU behaviour here in a
> comment and explain how the priorities are meant to change as the cache
> is used.


> >
> > +static void lru_priorities_init(struct Cache *cache)
> > +{
> > +    int i, j;
> > +
> > +    for (i =3D 0; i < cache->num_sets; i++) {
> > +        cache->sets[i].priorities =3D g_new(uint16_t, cache->assoc);
> > +        for (j =3D 0; j < cache->assoc; j++) {
> > +            cache->sets[i].priorities[j] =3D cache->assoc - j - 1;
> > +        }
> > +    }
> > +}
> > +
> > +static void lru_update_on_miss(struct Cache *cache,
> > +                                      int set_idx,
> > +                                      int blk_idx)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < cache->assoc; i++) {
> > +        cache->sets[set_idx].priorities[i]++;
> > +    }
> > +
> > +    cache->sets[set_idx].priorities[blk_idx] =3D 0;
>
> So we increment priority for all non-hit blocks and reset it for the
> entry just used? This isn't totally clear to follow however see bellow:


> > +}
> > +
> > +static void lru_update_on_hit(struct Cache *cache,
> > +                                         int set_idx,
> > +                                         int blk_idx)
> > +{
> > +    uint16_t blk_priority;
> > +    int i;
> > +
> > +    blk_priority =3D cache->sets[set_idx].priorities[blk_idx];
> > +    for (i =3D 0; i < cache->assoc; i++) {
> > +        if (cache->sets[set_idx].priorities[i] < blk_priority) {
> > +            cache->sets[set_idx].priorities[i]++;
> > +        }
> > +    }
> > +    cache->sets[set_idx].priorities[blk_idx] =3D 0;
>
> This seems pretty expensive depending on the number of blocks. Another
> approach would be to have a generation number that is incremented on
> each access and stored in the appropriate set. Then...
>
> > +}
> > +
> > +static int lru_get_lru_block(struct Cache *cache, int set_idx)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < cache->assoc; i++) {
> > +        if (cache->sets[set_idx].priorities[i] =3D=3D cache->assoc - 1=
) {
> > +            return i;
> > +        }
> > +    }
>
> when you get to search for a "stale" block you just look for the lowest
> generation number. The eviction logic should be being called less than
> the update logic right?


Sorry for the confusion about LRU, so my idea is that if we have ASSOC
blocks in each set, the invariant is that I always have the least recently
used
block with a priority of ASSOC - 1. the second least recently used block
with
a priority of ASSOC - 2, etc. By incrementing every priority on miss, I
demote
other blocks and set the newly-cached block to priority 0, so we maintain
the
recency of usage sequence.

To be clear, your solution is on hit: increase the hit-block priority, and
on miss,
remove the element with the least priority (probably the new block here
will get
the highest priority which can be stored in the set itself so we don't
search for it)

If I understood something incorrectly please correct me.

The problem with that is we won't have the usage sequence anymore.
Consider a set with ASSOC =3D 4, and that set initially has no valid blocks
and the program generates the following accesses to the set:

MISS and replace block 3 (will increment block 3's priority to 1)
MISS and replace block 2 (will increment block 2's priority to 1)
MISS and replace block 1 (will increment block 1's priority to 1)
MISS and replace block 0 (will increment block 0's priority to 1)

LRU specifies that if we want to evict something, we'll need to evict block
3 since
the first block that was accessed and hence it's the LRU block.

But if we only choose the block with the least priority, we can evict block
0
which is in fact the most recently used block and the one with supposedly
the highest priority.

This would be an approximation for LRU and I guess that I can also
implement it
as an optional eviction algorithm since to my knowledge, numerous processor=
s
implement an approximation for LRU. That's because it's expensive to
implement
exact LRU in hardware.


>
> > +
> > +    g_assert_not_reached();
> > +}
> > +
> > +static void fifo_init(struct Cache *cache)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < cache->num_sets; i++) {
> > +        cache->sets[i].evict_queue =3D g_queue_new();
> > +    }
> > +}
> > +
> > +static int fifo_get_first_in_block(struct Cache *cache, int set)
> > +{
> > +    GQueue *q =3D cache->sets[set].evict_queue;
> > +    return GPOINTER_TO_INT(g_queue_pop_tail(q));
> > +}
> > +
> > +static void fifo_update_on_miss(struct Cache *cache,
> > +                                int set,
> > +                                int blk_idx)
> > +{
> > +    GQueue *q =3D cache->sets[set].evict_queue;
> > +    g_queue_push_head(q, GINT_TO_POINTER(blk_idx));
> > +}
>
> Again some commentary would be helpful around above the fifo functions.
>
> > +
> > +
> >  static struct Cache *cache_init(int blksize, int assoc, int cachesize)
> >  {
> >      struct Cache *cache;
> > @@ -113,6 +195,12 @@ static struct Cache *cache_init(int blksize, int
> assoc, int cachesize)
> >      cache->set_mask =3D ((cache->num_sets - 1) <<
> (pow_of_two(cache->blksize)));
> >      cache->tag_mask =3D ~(cache->set_mask | cache->blk_mask);
> >
> > +    if (lru) {
> > +        lru_priorities_init(cache);
> > +    } else if (fifo) {
> > +        fifo_init(cache);
> > +    }
> > +
> >      return cache;
> >  }
> >
> > @@ -131,12 +219,20 @@ static int get_invalid_block(struct Cache *cache,
> uint64_t set)
> >      return -1;
> >  }
> >
> > -static int get_replaced_block(struct Cache *cache)
> > +static int get_replaced_block(struct Cache *cache, int set)
> >  {
> > -    return g_rand_int_range(rng, 0, cache->assoc);
> > +    if (rnd) {
> > +        return g_rand_int_range(rng, 0, cache->assoc);
> > +    } else if (lru) {
> > +        return lru_get_lru_block(cache, set);
> > +    } else if (fifo) {
> > +        return fifo_get_first_in_block(cache, set);
> > +    }
> > +
> > +    g_assert_not_reached();
> >  }
> >
> > -static bool in_cache(struct Cache *cache, uint64_t addr)
> > +static int in_cache(struct Cache *cache, uint64_t addr)
> >  {
> >      int i;
> >      uint64_t tag, set;
> > @@ -147,29 +243,39 @@ static bool in_cache(struct Cache *cache, uint64_=
t
> addr)
> >      for (i =3D 0; i < cache->assoc; i++) {
> >          if (cache->sets[set].blocks[i].tag =3D=3D tag &&
> >                  cache->sets[set].blocks[i].valid) {
> > -            return true;
> > +            return i;
> >          }
> >      }
> >
> > -    return false;
> > +    return -1;
> >  }
> >
> >  static enum AccessResult access_cache(struct Cache *cache, uint64_t
> addr)
> >  {
> >      uint64_t tag, set;
> > -    int replaced_blk;
> > -
> > -    if (in_cache(cache, addr)) {
> > -        return HIT;
> > -    }
> > +    int hit_blk, replaced_blk;
> >
> >      tag =3D extract_tag(cache, addr);
> >      set =3D extract_set(cache, addr);
> > +    hit_blk =3D in_cache(cache, addr);
> > +
> > +    if (hit_blk !=3D -1) {
> > +        if (lru) {
> > +            lru_update_on_hit(cache, set, hit_blk);
> > +        }
> > +        return HIT;
> > +    }
> >
> >      replaced_blk =3D get_invalid_block(cache, set);
> >
> >      if (replaced_blk =3D=3D -1) {
> > -        replaced_blk =3D get_replaced_block(cache);
> > +        replaced_blk =3D get_replaced_block(cache, set);
> > +    }
> > +
> > +    if (lru) {
> > +        lru_update_on_miss(cache, set, replaced_blk);
> > +    } else if (fifo) {
> > +        fifo_update_on_miss(cache, set, replaced_blk);
> >      }
>
> I wonder if just having a update_hit and update_miss function pointer
> would keep things cleaner?
>
>   if (update_hit) {
>        update_hit(cache, set, hit, block)
>   }
>
> etc...
>
> >
> >      cache->sets[set].blocks[replaced_blk].tag =3D tag;
> > @@ -307,6 +413,11 @@ static void free_cache(struct Cache *cache)
> >  {
> >      for (int i =3D 0; i < cache->num_sets; i++) {
> >          g_free(cache->sets[i].blocks);
> > +        if (lru) {
> > +            g_free(cache->sets[i].priorities);
>
> Hmm I've obviously missed something about how priorities are meant to be
> sued.
>

Can you please explain what's wrong with this? I only allocate an array of
priorities
when LRU is the chosen policy, so I only free it if `lru` is true. Am I
missing something?

>
> > +        } else if (fifo) {
> > +            g_queue_free(cache->sets[i].evict_queue);
> > +        }
> >      }
> >
> >      g_free(cache->sets);
> > @@ -403,8 +514,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
> >      iblksize =3D 64;
> >      icachesize =3D iblksize * iassoc * 32;
> >
> > -    rng =3D g_rand_new();
> > -
> >      for (i =3D 0; i < argc; i++) {
> >          char *opt =3D argv[i];
> >          if (g_str_has_prefix(opt, "I=3D")) {
> > @@ -433,6 +542,22 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
> >              if (!tracefile) {
> >                  fprintf(stderr, "could not open: %s for writing\n",
> file_name);
> >              }
> > +        } else if (g_str_has_prefix(opt, "evict=3D")) {
> > +            if (lru || rnd || fifo) {
> > +                fprintf(stderr, "eviction policy specified more than
> once\n");
> > +                return -1;
> > +            }
>
> This is one argument for the separate bools although generally QEMU
> operates on the basis of last argument wins ;-)


I Will do that, thanks. This seemed logical since I observed that from the
behavior of other plugins as well. It introduced some clutter since I'll
have
to turn off the other two booleans in order to only leave one policy turned
on.
But that is now not a problem since we agreed on removing the `lru`, `rnd`,
and `fifo` booleans already.

>
>
> > +            gchar *policy =3D opt + 6;
> > +            if (g_strcmp0(policy, "rand") =3D=3D 0) {
> > +                rnd =3D true;
> > +            } else if (g_strcmp0(policy, "lru") =3D=3D 0) {
> > +                lru =3D true;
> > +            } else if (g_strcmp0(policy, "fifo") =3D=3D 0) {
> > +                fifo =3D true;
> > +            } else {
> > +                fprintf(stderr, "invalid eviction policy: %s\n", opt);
> > +                return -1;
> > +            }
> >          } else {
> >              fprintf(stderr, "option parsing failed: %s\n", opt);
> >              return -1;
> > @@ -449,6 +574,14 @@ int qemu_plugin_install(qemu_plugin_id_t id, const
> qemu_info_t *info,
> >          return -1;
> >      }
> >
> > +    if (!rnd && !lru && !fifo) {
> > +        lru =3D true;
> > +    }
> > +
> > +    if (rnd) {
> > +        rng =3D g_rand_new();
> > +    }
> > +
> >      dcache =3D cache_init(dblksize, dassoc, dcachesize);
> >      icache =3D cache_init(iblksize, iassoc, icachesize);
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000b7876c05c3c1a7d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 3:27 PM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Now one of the three eviction policies can be chosen as an argument. O=
n<br>
&gt; not specifying an argument, LRU is used by default.<br>
&gt;<br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 contrib/plugins/cache.c | 159 ++++++++++++++++++++++++++++++++++=
++----<br>
&gt;=C2=A0 1 file changed, 146 insertions(+), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
&gt; index fa0bf1dd40..1e323494bf 100644<br>
&gt; --- a/contrib/plugins/cache.c<br>
&gt; +++ b/contrib/plugins/cache.c<br>
&gt; @@ -18,6 +18,8 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSI=
ON;<br>
&gt;=C2=A0 <br>
&gt; +static bool fifo, lru, rnd;<br>
&gt; +<br>
<br>
Ironically this would be a good use for a single variable with an enum,<br>
or alternatively a function pointer which can be set on initialisation.<br>
<br></blockquote><div>I think that I will implement the function pointers t=
hing because as you</div><div>mention bellow it will somewhat reduce the cl=
utter of checking the current</div><div>eviction policy each time and decid=
e on which function to call.</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt;=C2=A0 static GRand *rng;<br>
&gt;=C2=A0 static GHashTable *dmiss_ht;<br>
&gt;=C2=A0 static GHashTable *imiss_ht;<br>
&gt; @@ -55,6 +57,8 @@ struct CacheBlock {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct CacheSet {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct CacheBlock *blocks;<br>
&gt; +=C2=A0 =C2=A0 uint16_t *priorities;<br>
&gt; +=C2=A0 =C2=A0 GQueue *evict_queue;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct Cache {<br>
&gt; @@ -93,6 +97,84 @@ static inline uint64_t extract_set(struct Cache *ca=
che, uint64_t addr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return (addr &amp; cache-&gt;set_mask) &gt;&gt; (p=
ow_of_two(cache-&gt;blksize));<br>
&gt;=C2=A0 }<br>
<br>
I think it would be useful to summarise the LRU behaviour here in a<br>
comment and explain how the priorities are meant to change as the cache<br>
is used.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt;=C2=A0 <br>
&gt; +static void lru_priorities_init(struct Cache *cache)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i, j;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].priorities =3D g_new(ui=
nt16_t, cache-&gt;assoc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0; j &lt; cache-&gt;assoc; j++=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].prioritie=
s[j] =3D cache-&gt;assoc - j - 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void lru_update_on_miss(struct Cache *cache,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int set_idx=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int blk_idx=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[set_idx].priorities[i]++;<=
br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;sets[set_idx].priorities[blk_idx] =3D 0;<br>
<br>
So we increment priority for all non-hit blocks and reset it for the<br>
entry just used? This isn&#39;t totally clear to follow however see bellow:=
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void lru_update_on_hit(struct Cache *cache,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int set_idx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0int blk_idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint16_t blk_priority;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 blk_priority =3D cache-&gt;sets[set_idx].priorities[blk=
_idx];<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set_idx].priorities[i]=
 &lt; blk_priority) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[set_idx].pri=
orities[i]++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;sets[set_idx].priorities[blk_idx] =3D 0;<br>
<br>
This seems pretty expensive depending on the number of blocks. Another<br>
approach would be to have a generation number that is incremented on<br>
each access and stored in the appropriate set. Then...<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int lru_get_lru_block(struct Cache *cache, int set_idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set_idx].priorities[i]=
 =3D=3D cache-&gt;assoc - 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
when you get to search for a &quot;stale&quot; block you just look for the =
lowest<br>
generation number. The eviction logic should be being called less than<br>
the update logic right?=C2=A0</blockquote><div><br></div><div>Sorry for the=
 confusion about LRU, so my idea is that if we have ASSOC</div><div>blocks =
in each set, the invariant is that I always have the least recently used</d=
iv><div>block with a priority of ASSOC - 1. the second least recently used =
block with</div><div>a priority of ASSOC - 2, etc. By incrementing every pr=
iority on miss, I demote</div><div>other blocks and set the newly-cached bl=
ock to priority 0, so we maintain the</div><div>recency of usage sequence.<=
/div><div><br></div><div>To be clear, your solution is on hit: increase the=
 hit-block priority, and on miss,</div><div>remove the element with the lea=
st priority (probably the new block here will get</div><div>the highest pri=
ority which can be stored in the set itself so we don&#39;t search for it)<=
/div><div><div><br></div><div>If I understood something incorrectly please =
correct me.</div></div><div><br></div><div>The problem with that is we won&=
#39;t have the usage sequence anymore.</div><div>Consider a set with ASSOC =
=3D 4, and that set initially has no valid blocks</div><div>and the program=
 generates the following accesses to the set:</div><div><br></div><div>MISS=
 and replace block 3 (will increment block 3&#39;s priority to 1)</div><div=
>MISS and replace block 2=C2=A0(will increment block 2&#39;s priority to 1)=
</div><div>MISS and replace block 1=C2=A0(will increment block 1&#39;s prio=
rity to 1)</div><div>MISS and replace block 0=C2=A0(will increment block 0&=
#39;s priority to 1)</div><div><br></div><div>LRU specifies that if we want=
 to evict something, we&#39;ll need to evict block 3 since</div><div>the fi=
rst block that was accessed and hence it&#39;s the LRU block.</div><div><br=
></div><div>But if we only choose the block with the least priority, we can=
 evict block 0</div><div>which is in fact the most recently used block and =
the one with=C2=A0supposedly</div><div>the highest priority.</div><div><br>=
</div><div>This would be an approximation for LRU and I guess that I can al=
so implement it</div><div>as an optional eviction algorithm since to my kno=
wledge, numerous processors</div><div>implement an approximation for LRU. T=
hat&#39;s because it&#39;s expensive to implement</div><div>exact LRU in ha=
rdware.</div><div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void fifo_init(struct Cache *cache)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].evict_queue =3D g_queue=
_new();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int fifo_get_first_in_block(struct Cache *cache, int set)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 GQueue *q =3D cache-&gt;sets[set].evict_queue;<br>
&gt; +=C2=A0 =C2=A0 return GPOINTER_TO_INT(g_queue_pop_tail(q));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void fifo_update_on_miss(struct Cache *cache,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int set,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int blk_idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 GQueue *q =3D cache-&gt;sets[set].evict_queue;<br>
&gt; +=C2=A0 =C2=A0 g_queue_push_head(q, GINT_TO_POINTER(blk_idx));<br>
&gt; +}<br>
<br>
Again some commentary would be helpful around above the fifo functions.<br>
<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 static struct Cache *cache_init(int blksize, int assoc, int cach=
esize)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct Cache *cache;<br>
&gt; @@ -113,6 +195,12 @@ static struct Cache *cache_init(int blksize, int =
assoc, int cachesize)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cache-&gt;set_mask =3D ((cache-&gt;num_sets - 1) &=
lt;&lt; (pow_of_two(cache-&gt;blksize)));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cache-&gt;tag_mask =3D ~(cache-&gt;set_mask | cach=
e-&gt;blk_mask);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (lru) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lru_priorities_init(cache);<br>
&gt; +=C2=A0 =C2=A0 } else if (fifo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo_init(cache);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return cache;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -131,12 +219,20 @@ static int get_invalid_block(struct Cache *cache=
, uint64_t set)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int get_replaced_block(struct Cache *cache)<br>
&gt; +static int get_replaced_block(struct Cache *cache, int set)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return g_rand_int_range(rng, 0, cache-&gt;assoc);<br>
&gt; +=C2=A0 =C2=A0 if (rnd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_rand_int_range(rng, 0, cache-&gt=
;assoc);<br>
&gt; +=C2=A0 =C2=A0 } else if (lru) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return lru_get_lru_block(cache, set);<br>
&gt; +=C2=A0 =C2=A0 } else if (fifo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fifo_get_first_in_block(cache, set=
);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static bool in_cache(struct Cache *cache, uint64_t addr)<br>
&gt; +static int in_cache(struct Cache *cache, uint64_t addr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t tag, set;<br>
&gt; @@ -147,29 +243,39 @@ static bool in_cache(struct Cache *cache, uint64=
_t addr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set].blocks[i].ta=
g =3D=3D tag &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&g=
t;sets[set].blocks[i].valid) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static enum AccessResult access_cache(struct Cache *cache, uint6=
4_t addr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint64_t tag, set;<br>
&gt; -=C2=A0 =C2=A0 int replaced_blk;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 if (in_cache(cache, addr)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HIT;<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 int hit_blk, replaced_blk;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 tag =3D extract_tag(cache, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set =3D extract_set(cache, addr);<br>
&gt; +=C2=A0 =C2=A0 hit_blk =3D in_cache(cache, addr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (hit_blk !=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lru) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lru_update_on_hit(cache, se=
t, hit_blk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HIT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_invalid_block(cache, set);<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (replaced_blk =3D=3D -1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_replaced_block(cache=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_replaced_block(cache=
, set);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (lru) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lru_update_on_miss(cache, set, replaced_b=
lk);<br>
&gt; +=C2=A0 =C2=A0 } else if (fifo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo_update_on_miss(cache, set, replaced_=
blk);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
I wonder if just having a update_hit and update_miss function pointer<br>
would keep things cleaner?<br>
<br>
=C2=A0 if (update_hit) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0update_hit(cache, set, hit, block)<br>
=C2=A0 }<br>
<br>
etc...<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[set].blocks[replaced_blk].tag =3D t=
ag;<br>
&gt; @@ -307,6 +413,11 @@ static void free_cache(struct Cache *cache)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; cache-&gt;num_sets; i++) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cache-&gt;sets[i].blocks);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lru) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cache-&gt;sets[i].pr=
iorities);<br>
<br>
Hmm I&#39;ve obviously missed something about how priorities are meant to b=
e sued.<br></blockquote><div><br></div><div>Can you please explain what&#39=
;s wrong with this? I only allocate an array of priorities</div><div>when L=
RU is the chosen policy, so I only free it if `lru` is true. Am I missing s=
omething?</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (fifo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_queue_free(cache-&gt;sets=
[i].evict_queue);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(cache-&gt;sets);<br>
&gt; @@ -403,8 +514,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const=
 qemu_info_t *info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iblksize =3D 64;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 icachesize =3D iblksize * iassoc * 32;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 rng =3D g_rand_new();<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; argc; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *opt =3D argv[i];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;I=3D=
&quot;)) {<br>
&gt; @@ -433,6 +542,22 @@ int qemu_plugin_install(qemu_plugin_id_t id, cons=
t qemu_info_t *info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tracefile) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(=
stderr, &quot;could not open: %s for writing\n&quot;, file_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_str_has_prefix(opt, &quot;ev=
ict=3D&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lru || rnd || fifo) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stder=
r, &quot;eviction policy specified more than once\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This is one argument for the separate bools although generally QEMU<br>
operates on the basis of last argument wins ;-)</blockquote><div>=C2=A0</di=
v><div>I Will do that, thanks. This seemed logical since I observed that fr=
om the</div><div>behavior of other plugins as well. It introduced some clut=
ter since I&#39;ll have</div><div>to turn off the other two booleans in ord=
er to only leave one policy turned on.</div><div>But that is now not a prob=
lem since we agreed on removing the `lru`, `rnd`,</div><div>and `fifo` bool=
eans already.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gchar *policy =3D opt + 6;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(policy, &quot=
;rand&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rnd =3D true;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_strcmp0(policy=
, &quot;lru&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lru =3D true;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (g_strcmp0(policy=
, &quot;fifo&quot;) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo =3D true=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stder=
r, &quot;invalid eviction policy: %s\n&quot;, opt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;=
option parsing failed: %s\n&quot;, opt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; @@ -449,6 +574,14 @@ int qemu_plugin_install(qemu_plugin_id_t id, cons=
t qemu_info_t *info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (!rnd &amp;&amp; !lru &amp;&amp; !fifo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lru =3D true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (rnd) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng =3D g_rand_new();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dcache =3D cache_init(dblksize, dassoc, dcachesize=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 icache =3D cache_init(iblksize, iassoc, icachesize=
);<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000b7876c05c3c1a7d3--

