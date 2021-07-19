Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C248C3CD34A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:11:00 +0200 (CEST)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RAp-0007zO-RG
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5R8l-00069M-0P
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:08:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:34312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5R8j-0002S4-6d
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:08:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso10107878wmc.1
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 04:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Zqsm0f4GR/N7yaD8Wwcfrv0xc5ydq8efiR1y6JcQRDk=;
 b=GS369kjKlR5h9mCLyi7mQkQYZrnY0kfUSdb3pK+eVgi33SBsPPOQwbVwIq3ay/RxdB
 mhIWN3L0Iuxcd/HtqDNWXE/9TOP8UfoLmFWesLtlH5tzCbKGrBQA9gdms41Ag7H8ZB6E
 wVfQFR4Mm0wf3HmAVHk5cpPt6G1whex6vb315p8X34OFZyhoccXvkRQ2js2Y+rgvnQ0D
 UvHF/bu28wHThmbqUAjMRLud82U1B/VOuxXT4SwbAXVhZexN6f2nOybarKYUBeWy2zMG
 M2b8Gq8FaqMP3U23oUhPBnpAsmtQ63XHfGEBzJHJ21geK4qYsu/btZijpGSV77KRpqEK
 bL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Zqsm0f4GR/N7yaD8Wwcfrv0xc5ydq8efiR1y6JcQRDk=;
 b=T7rJkmvh73Yw29AIxzHRH0bj1wKNofH9xUCkRWtjvpx145x/amszIi02ApbIrXXedW
 BHPlVSNV5F126xNA1TUmA2wUCvmQULrU76I34AJ6fgSdbLMlc2Lw3ROIxsWN4O0Hkwzw
 v2qrQBenruAj+tXX5q44bhUTsd4yoOfUUZ0JGGD/vA0A38v/9vkXpaubg5Lwy3BmhrRF
 I+PIWVhQi7qj6FdbGF0nW4C2ZziPiMFYuHFgIeSMMS1+g+KvFU9GqYjstE3RYo4qgTaG
 OQOM4s5hM/IKDBN/pvuJdJ1/XvIRf6yoQL9VPSK6wZ9xZXGqQyoF+sAhhk7IavqJOYYH
 u5YQ==
X-Gm-Message-State: AOAM531l0P68ZmHssooOj/L7NK4HwC/BlhBlqumsCnmAX6cUIcjsHcUU
 5jZRFdESMriRSkyvE9hmSgZefA==
X-Google-Smtp-Source: ABdhPJxckF0xjayTr7+e3EpMk+OyzLWSQ6uR0LxuwrP7rXBDW+e0RdBhc5VAE3PxuCIva6KTDVVFQQ==
X-Received: by 2002:a7b:c181:: with SMTP id y1mr31949208wmi.106.1626692927651; 
 Mon, 19 Jul 2021 04:08:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm23118366wrv.72.2021.07.19.04.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:08:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 524DD1FF7E;
 Mon, 19 Jul 2021 12:08:46 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-4-ma.mandourr@gmail.com> <87zguiprbi.fsf@linaro.org>
 <CAD-LL6hk+xWhCwLb0mK0W4ZWP29BKmfnTVJwLe7zA0-g7=ji-w@mail.gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 3/6] plugins/cache: Fixed a use-after-free bug with
 multithreaded usermode
Date: Mon, 19 Jul 2021 12:06:09 +0100
In-reply-to: <CAD-LL6hk+xWhCwLb0mK0W4ZWP29BKmfnTVJwLe7zA0-g7=ji-w@mail.gmail.com>
Message-ID: <87tukqpnlt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: "Emilio G.
 Cota" <cota@braap.org>, "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> On Mon, Jul 19, 2021 at 11:48 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>
>  Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
>  > Since callbacks may be interleaved because of multithreaded execution,
>  > we should not make assumptions about `plugin_exit` either. The problem
>  > with `plugin_exit` is that it frees shared data structures (caches and
>  > `miss_ht` hash table). It should not be assumed that callbacks will not
>  > be called after it and hence use already-freed data structures.
>
>  What was your test case for this because I wonder if it would be worth
>  coming up with one for check-tcg?=20
>
> I think just any ad-hoc multithreaded execution will evoke the race prett=
y much=20
> consistently.

I haven't managed to trigger it with testthread but of course my
libcache is trying to to defend against it.

>=20=20
>  From what I remember the race is
>  in between preexit_cleanup and the eventual _exit/exit_group which nixes
>  all other child threads. Maybe we should be triggering a more graceful
>  unload here?
>
> I think so. This remedies the bug for this particular plugin and I think =
there
> would be a better solution of course. However, I just can't ever get plug=
in_exit
> callback to be called more than once so I think that's probably not the p=
roblem?
>
> The problem is that we *use* the data in translation/mem_access/exec call=
backs
> after a plugin_exit call is already called (this can be easily verified b=
y having a=20
> boolean set to true once plugin_exit is called and then g_assert this boo=
lean is=20
> false in the callbacks)

We have mechanisms for safely unloading plugins during running so I
think we should be able to do something cleanly here. I'll cook up an
RFC.

>
>  > This is mitigated in this commit by synchronizing the call to
>  > `plugin_exit` through locking to ensure execlusive access to data
>  > structures, and NULL-ifying those data structures so that subsequent
>  > callbacks can check whether the data strucutres are freed, and if so,
>  > immediately exit.
>  >
>  > It's okay to immediately exit and don't account for those callbacks
>  > since they won't be accounted for anyway since `plugin_exit` is already
>  > called once and reported the statistics.
>  >
>  > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
>  > ---
>  >  contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-
>  >  1 file changed, 30 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
>  > index 695fb969dc..a452aba01c 100644
>  > --- a/contrib/plugins/cache.c
>  > +++ b/contrib/plugins/cache.c
>  > @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int vcpu_ind=
ex, qemu_plugin_meminfo_t info,
>  >      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) =
: vaddr;
>  >=20=20
>  >      g_mutex_lock(&mtx);
>  > +    if (dcache =3D=3D NULL) {
>  > +        g_mutex_unlock(&mtx);
>  > +        return;
>  > +    }
>  > +
>  >      if (!access_cache(dcache, effective_addr)) {
>  >          insn =3D (InsnData *) userdata;
>  >          insn->dmisses++;
>  > @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int vcpu_inde=
x, void *userdata)
>  >      g_mutex_lock(&mtx);
>  >      insn_addr =3D ((InsnData *) userdata)->addr;
>  >=20=20
>  > +    if (icache =3D=3D NULL) {
>  > +        g_mutex_unlock(&mtx);
>  > +        return;
>  > +    }
>  > +
>  >      if (!access_cache(icache, insn_addr)) {
>  >          insn =3D (InsnData *) userdata;
>  >          insn->imisses++;
>  > @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, s=
truct qemu_plugin_tb *tb)
>  >              effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(insn=
);
>  >          }
>  >=20=20
>  > +        g_mutex_lock(&mtx);
>  > +
>  > +        /*
>  > +         * is the plugin_exit callback called? If so, any further cal=
lback
>  > +         * registration is useless as it won't get accounted for afte=
r calling
>  > +         * plugin_exit once already, and also will use miss_ht after =
it's freed
>  > +         */
>  > +        if (miss_ht =3D=3D NULL) {
>  > +            g_mutex_unlock(&mtx);
>  > +            return;
>  > +        }
>  > +
>  >          /*
>  >           * Instructions might get translated multiple times, we do no=
t create
>  >           * new entries for those instructions. Instead, we fetch the =
same
>  >           * entry from the hash table and register it for the callback=
 again.
>  >           */
>  > -        g_mutex_lock(&mtx);
>  > +
>  >          data =3D g_hash_table_lookup(miss_ht, GUINT_TO_POINTER(effect=
ive_addr));
>  >          if (data =3D=3D NULL) {
>  >              data =3D g_new0(InsnData, 1);
>  > @@ -527,13 +549,20 @@ static void log_top_insns()
>  >=20=20
>  >  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  >  {
>  > +    g_mutex_lock(&mtx);
>  >      log_stats();
>  >      log_top_insns();
>  >=20=20
>  >      cache_free(dcache);
>  > +    dcache =3D NULL;
>  > +
>  >      cache_free(icache);
>  > +    icache =3D NULL;
>  >=20=20
>  >      g_hash_table_destroy(miss_ht);
>  > +    miss_ht =3D NULL;
>  > +
>  > +    g_mutex_unlock(&mtx);
>  >  }
>  >=20=20
>  >  static void policy_init()
>
>  --=20
>  Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

