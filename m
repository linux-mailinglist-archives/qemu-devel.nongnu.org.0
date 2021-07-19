Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB073CD22E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:47:51 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5QoQ-0002i4-8t
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m5Qn5-00020k-8x
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:46:27 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m5Qn3-0003iN-2g
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:46:26 -0400
Received: by mail-io1-xd36.google.com with SMTP id u7so19347051ion.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kZNEY92IiJjxNjx8EqjlxQt/1NKZI20OULbtv103zHM=;
 b=Gqx4mNmPcAI1OG6fQCpxGHR2kZ2mmM5FSsQ8+5U4KgyoOK8NBOPmHak59ztGD3o91b
 Y/htDzedPuQ2iScFh4wOH22waAtrzvUkaqiAweKvKgiXqBaRekTt3Z/mLbWSs6Z4vdSt
 7Fm8NF8uTEbXoxJUjfXVK5ec25cN2O+6tAxqcCveBfUypgJ9y1pdeaDgXhEwbow4IVYr
 fHUz9fTLemknps45ongq/6NPwalyYz2pyoSJGQgOWGckppmilukYUV9iEuCQRTExDigd
 A9C80U7k9TcqYEyZ+UvwQi6tbBrw5uOKJROToyuqIDfxzOpPh+xK10QbdUuKmCD4+/o4
 VZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZNEY92IiJjxNjx8EqjlxQt/1NKZI20OULbtv103zHM=;
 b=m5fMKYDYEyk+Y/CRns3aKW9p5KOjPx146ldu5NemlXYv6HFo4UvFrtbAoxdV0iEpc7
 CNlLOfcZaGxkrKjT9Fzn4Q3jco5n57U52LMj3UALSd/anLHKmWvDOO1H06rtQ2Tw7b2o
 N2kA9Rja5zfK6fkdiD3RIJwtJY7F/Qdnhtoq31EhqX7cPQGw/RPIPYwcqQixFH8ySnyB
 0tv/r1kPGry8VHyvCRfCepr706EtYAVr18jb2VBAwOgBCNSFxjmTq084fU+VZeHbF3pD
 XjMM7yY94QUzbJrFjPIiWSc0okl7dplk1KShL1OycmBlbS//mXy1SN3GvPXd4ISR9rrZ
 pyXA==
X-Gm-Message-State: AOAM531JxhlEH0yTrTMZgqJj4zBG6yxhU1wTQbtCX5hQ1iPytDJM+jZW
 xgtqpuHBfl6uWXjt/6jJG2vmVNAy8zK+ajtVrIM=
X-Google-Smtp-Source: ABdhPJx/JWrmNGd28QDP3XJsG3v1KJ3EtqjpZr1BgYFXBTg7JxtGe6xheb654dWKughdN7TozqqJnjSYRzWGaOGieJo=
X-Received: by 2002:a02:cebb:: with SMTP id z27mr21319798jaq.72.1626691583316; 
 Mon, 19 Jul 2021 03:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-4-ma.mandourr@gmail.com>
 <87zguiprbi.fsf@linaro.org>
In-Reply-To: <87zguiprbi.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 19 Jul 2021 12:46:12 +0200
Message-ID: <CAD-LL6hk+xWhCwLb0mK0W4ZWP29BKmfnTVJwLe7zA0-g7=ji-w@mail.gmail.com>
Subject: Re: [PATCH 3/6] plugins/cache: Fixed a use-after-free bug with
 multithreaded usermode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fb967e05c777a5ce"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd36.google.com
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
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fb967e05c777a5ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 11:48 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Since callbacks may be interleaved because of multithreaded execution,
> > we should not make assumptions about `plugin_exit` either. The problem
> > with `plugin_exit` is that it frees shared data structures (caches and
> > `miss_ht` hash table). It should not be assumed that callbacks will not
> > be called after it and hence use already-freed data structures.
>
> What was your test case for this because I wonder if it would be worth
> coming up with one for check-tcg?


I think just any ad-hoc multithreaded execution will evoke the race pretty
much
consistently.


> From what I remember the race is
> in between preexit_cleanup and the eventual _exit/exit_group which nixes
> all other child threads. Maybe we should be triggering a more graceful
> unload here?
>

I think so. This remedies the bug for this particular plugin and I think
there
would be a better solution of course. However, I just can't ever get
plugin_exit
callback to be called more than once so I think that's probably not the
problem?

The problem is that we *use* the data in translation/mem_access/exec
callbacks
after a plugin_exit call is already called (this can be easily verified by
having a
boolean set to true once plugin_exit is called and then g_assert this
boolean is
false in the callbacks)


> > This is mitigated in this commit by synchronizing the call to
> > `plugin_exit` through locking to ensure execlusive access to data
> > structures, and NULL-ifying those data structures so that subsequent
> > callbacks can check whether the data strucutres are freed, and if so,
> > immediately exit.
> >
> > It's okay to immediately exit and don't account for those callbacks
> > since they won't be accounted for anyway since `plugin_exit` is already
> > called once and reported the statistics.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> > index 695fb969dc..a452aba01c 100644
> > --- a/contrib/plugins/cache.c
> > +++ b/contrib/plugins/cache.c
> > @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int
> vcpu_index, qemu_plugin_meminfo_t info,
> >      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) :
> vaddr;
> >
> >      g_mutex_lock(&mtx);
> > +    if (dcache =3D=3D NULL) {
> > +        g_mutex_unlock(&mtx);
> > +        return;
> > +    }
> > +
> >      if (!access_cache(dcache, effective_addr)) {
> >          insn =3D (InsnData *) userdata;
> >          insn->dmisses++;
> > @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int vcpu_index=
,
> void *userdata)
> >      g_mutex_lock(&mtx);
> >      insn_addr =3D ((InsnData *) userdata)->addr;
> >
> > +    if (icache =3D=3D NULL) {
> > +        g_mutex_unlock(&mtx);
> > +        return;
> > +    }
> > +
> >      if (!access_cache(icache, insn_addr)) {
> >          insn =3D (InsnData *) userdata;
> >          insn->imisses++;
> > @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id,
> struct qemu_plugin_tb *tb)
> >              effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(insn)=
;
> >          }
> >
> > +        g_mutex_lock(&mtx);
> > +
> > +        /*
> > +         * is the plugin_exit callback called? If so, any further
> callback
> > +         * registration is useless as it won't get accounted for after
> calling
> > +         * plugin_exit once already, and also will use miss_ht after
> it's freed
> > +         */
> > +        if (miss_ht =3D=3D NULL) {
> > +            g_mutex_unlock(&mtx);
> > +            return;
> > +        }
> > +
> >          /*
> >           * Instructions might get translated multiple times, we do not
> create
> >           * new entries for those instructions. Instead, we fetch the
> same
> >           * entry from the hash table and register it for the callback
> again.
> >           */
> > -        g_mutex_lock(&mtx);
> > +
> >          data =3D g_hash_table_lookup(miss_ht,
> GUINT_TO_POINTER(effective_addr));
> >          if (data =3D=3D NULL) {
> >              data =3D g_new0(InsnData, 1);
> > @@ -527,13 +549,20 @@ static void log_top_insns()
> >
> >  static void plugin_exit(qemu_plugin_id_t id, void *p)
> >  {
> > +    g_mutex_lock(&mtx);
> >      log_stats();
> >      log_top_insns();
> >
> >      cache_free(dcache);
> > +    dcache =3D NULL;
> > +
> >      cache_free(icache);
> > +    icache =3D NULL;
> >
> >      g_hash_table_destroy(miss_ht);
> > +    miss_ht =3D NULL;
> > +
> > +    g_mutex_unlock(&mtx);
> >  }
> >
> >  static void policy_init()
>
>
> --
> Alex Benn=C3=A9e
>

--000000000000fb967e05c777a5ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 19, 2021 at 11:48 AM Alex=
 Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Since callbacks may be interleaved because of multithreaded execution,=
<br>
&gt; we should not make assumptions about `plugin_exit` either. The problem=
<br>
&gt; with `plugin_exit` is that it frees shared data structures (caches and=
<br>
&gt; `miss_ht` hash table). It should not be assumed that callbacks will no=
t<br>
&gt; be called after it and hence use already-freed data structures.<br>
<br>
What was your test case for this because I wonder if it would be worth<br>
coming up with one for check-tcg? </blockquote><div><br></div><div>I think =
just any ad-hoc multithreaded execution=C2=A0will evoke the race pretty muc=
h=C2=A0</div><div>consistently.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">From what I remember the race is<br>
in between preexit_cleanup and the eventual _exit/exit_group which nixes<br=
>
all other child threads. Maybe we should be triggering a more graceful<br>
unload here?<br></blockquote><div><br></div><div>I think so. This=C2=A0reme=
dies the bug for this particular plugin and I think there</div><div>would b=
e a better solution of course. However, I just can&#39;t ever get plugin_ex=
it</div><div>callback to be called more than once so I think that&#39;s pro=
bably not the problem?</div><div><br></div><div>The problem is that we *use=
* the data in translation/mem_access/exec callbacks</div><div>after a plugi=
n_exit call is already called (this can be easily verified by having a=C2=
=A0</div><div>boolean set to true once plugin_exit is called and then g_ass=
ert this boolean is=C2=A0</div><div>false in the callbacks)</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; This is mitigated in this commit by synchronizing the call to<br>
&gt; `plugin_exit` through locking to ensure execlusive access to data<br>
&gt; structures, and NULL-ifying those data structures so that subsequent<b=
r>
&gt; callbacks can check whether the data strucutres are freed, and if so,<=
br>
&gt; immediately exit.<br>
&gt;<br>
&gt; It&#39;s okay to immediately exit and don&#39;t account for those call=
backs<br>
&gt; since they won&#39;t be accounted for anyway since `plugin_exit` is al=
ready<br>
&gt; called once and reported the statistics.<br>
&gt;<br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 contrib/plugins/cache.c | 31 ++++++++++++++++++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 30 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
&gt; index 695fb969dc..a452aba01c 100644<br>
&gt; --- a/contrib/plugins/cache.c<br>
&gt; +++ b/contrib/plugins/cache.c<br>
&gt; @@ -363,6 +363,11 @@ static void vcpu_mem_access(unsigned int vcpu_ind=
ex, qemu_plugin_meminfo_t info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phy=
s_addr(hwaddr) : vaddr;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt; +=C2=A0 =C2=A0 if (dcache =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!access_cache(dcache, effective_addr)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D (InsnData *) userdata;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;dmisses++;<br>
&gt; @@ -380,6 +385,11 @@ static void vcpu_insn_exec(unsigned int vcpu_inde=
x, void *userdata)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 insn_addr =3D ((InsnData *) userdata)-&gt;addr;<br=
>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (icache =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!access_cache(icache, insn_addr)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D (InsnData *) userdata;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;imisses++;<br>
&gt; @@ -406,12 +416,24 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, s=
truct qemu_plugin_tb *tb)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 effective_addr =3D (ui=
nt64_t) qemu_plugin_insn_vaddr(insn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is the plugin_exit callback calle=
d? If so, any further callback<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* registration is useless as it won=
&#39;t get accounted for after calling<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* plugin_exit once already, and als=
o will use miss_ht after it&#39;s freed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (miss_ht =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Instructions might get trans=
lated multiple times, we do not create<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* new entries for those instru=
ctions. Instead, we fetch the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* entry from the hash table an=
d register it for the callback again.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D g_hash_table_lookup(miss_ht=
, GUINT_TO_POINTER(effective_addr));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D g_new0(InsnDa=
ta, 1);<br>
&gt; @@ -527,13 +549,20 @@ static void log_top_insns()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void plugin_exit(qemu_plugin_id_t id, void *p)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;mtx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 log_stats();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 log_top_insns();<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 cache_free(dcache);<br>
&gt; +=C2=A0 =C2=A0 dcache =3D NULL;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cache_free(icache);<br>
&gt; +=C2=A0 =C2=A0 icache =3D NULL;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_hash_table_destroy(miss_ht);<br>
&gt; +=C2=A0 =C2=A0 miss_ht =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;mtx);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void policy_init()<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--000000000000fb967e05c777a5ce--

