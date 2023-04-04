Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527C76D6898
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:17:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjKZ-0007T1-MI; Tue, 04 Apr 2023 12:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjKW-0007SU-NA
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjKU-0003o0-Pm
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680624977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eJEmkd4U7RbtKNtqTw+wCxcvLDGx5b/pKne30wOeyxU=;
 b=e8hu50iNaH/3Yp1fjl36o85A1a3ka7SPaXNPzGIbzrPWNpcLi0MXMBpnHpYmDNDEaz16Zr
 ekC54jhccTNRNqvTg+sEzNxrg+at+3v0GxgANQ9VaSzC24RY0kQT52OgW8CWazbDiwmh/l
 pSssDLxzEdX6z9AQl7ALPLOdaoScanQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-wJJs1Mm7OkyaSGyrMdUrgA-1; Tue, 04 Apr 2023 12:16:15 -0400
X-MC-Unique: wJJs1Mm7OkyaSGyrMdUrgA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-54629ed836aso190990847b3.10
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680624973; x=1683216973;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJEmkd4U7RbtKNtqTw+wCxcvLDGx5b/pKne30wOeyxU=;
 b=zI7Xp1R81JbrndrGi0cTUT5jtYh6I29XyF4xzvD3GesJOLOWwUZzHdamFuwG48gp0q
 AsBQ96S5nb1EiVUr1stwxL1w7ZEZGwhxYvNdLmIGmvErzRlApOPTA+al5A1hOBwQWsHS
 uycKFjJJiUg+7YLigYY69101/CfTN0/BugS9B8ZpW8u4nZD9HXPVp/NfpaHRXww5vn1Q
 7svQZ3mk4I0zXecVujqvrcRZA8uImEP0zIOT1/tIsSs7eaEpg+h4ge7yYy4nxl7H1Ntr
 bxdK62k/7a/9MIOAn1IDER4NhAK0NHMkWOQtHfpNC+d2PySeLpKmGhC9A9t0kmaJnU6e
 n2NA==
X-Gm-Message-State: AAQBX9eL0OmdWfi12qZClh31QSCUMBQM99LFasEN50s8Z0SNSQwTnqyq
 us0zA2q/doG+FR9Q8GXkDRoI35duXClhitOOrPe2pc8u7C5pTI12KvuOqk9ztef0KPJL65HBqXW
 dR7OB/jRyMVJ94+iuDwY7TUOysHOaEIA=
X-Received: by 2002:a67:c896:0:b0:412:4e02:ba9f with SMTP id
 v22-20020a67c896000000b004124e02ba9fmr2670101vsk.1.1680624532555; 
 Tue, 04 Apr 2023 09:08:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350a2WSMHXn32zl5PWouWum+7fidC48AGLI9LGRB//AYErJ7yPS2e/J8AHD+NXqPM/6XlcXlV5tuclkBE0OjSsCU=
X-Received: by 2002:a67:c896:0:b0:412:4e02:ba9f with SMTP id
 v22-20020a67c896000000b004124e02ba9fmr2670079vsk.1.1680624532301; Tue, 04 Apr
 2023 09:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
 <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
 <3c9e06ce-3166-f7c4-cb56-6df123c145a2@redhat.com> <ZCwv87m1Gs5TjGVr@x1n>
In-Reply-To: <ZCwv87m1Gs5TjGVr@x1n>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 4 Apr 2023 18:08:41 +0200
Message-ID: <CABgObfZtW2YSFS-g4grBWHiuaYM1z6zsAUKm332qFtLv+uFGWg@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] kvm: dirty-ring: Fix race with vcpu creation
To: Peter Xu <peterx@redhat.com>
Cc: Hyman <huangy81@chinatelecom.cn>, qemu-devel <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003fbd5e05f884e4cd"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000003fbd5e05f884e4cd
Content-Type: text/plain; charset="UTF-8"

Il mar 4 apr 2023, 16:11 Peter Xu <peterx@redhat.com> ha scritto:

> Hi, Paolo!
>
> On Tue, Apr 04, 2023 at 03:32:38PM +0200, Paolo Bonzini wrote:
> > On 2/16/23 17:18, huangy81@chinatelecom.cn wrote:
> > > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> > > index 9b26582655..47483cdfa0 100644
> > > --- a/accel/kvm/kvm-all.c
> > > +++ b/accel/kvm/kvm-all.c
> > > @@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState
> *s, CPUState *cpu)
> > >       uint32_t ring_size = s->kvm_dirty_ring_size;
> > >       uint32_t count = 0, fetch = cpu->kvm_fetch_index;
> > > +    /*
> > > +     * It's possible that we race with vcpu creation code where the
> vcpu is
> > > +     * put onto the vcpus list but not yet initialized the dirty ring
> > > +     * structures.  If so, skip it.
> > > +     */
> > > +    if (!cpu->created) {
> > > +        return 0;
> > > +    }
> > > +
> >
> > Is there a lock that protects cpu->created?
> >
> > If you don't want to use a lock you need to use qatomic_load_acquire
> > together with
> >
> > diff --git a/softmmu/cpus.c b/softmmu/cpus.c
> > index fed20ffb5dd2..15b64e7f4592 100644
> > --- a/softmmu/cpus.c
> > +++ b/softmmu/cpus.c
> > @@ -525,7 +525,7 @@ void qemu_cond_timedwait_iothread(QemuCond *cond,
> int ms)
> >  /* signal CPU creation */
> >  void cpu_thread_signal_created(CPUState *cpu)
> >  {
> > -    cpu->created = true;
> > +    qatomic_store_release(&cpu->created, true);
> >      qemu_cond_signal(&qemu_cpu_cond);
> >  }
>
> Makes sense.
>
> When looking at such a possible race, I also found that when destroying the
> vcpu we may have another relevant issue, where we flip "vcpu->created"
> after destroying the vcpu.  IIUC it means the same issue can occur when
> vcpu unplugged?
>
> Meanwhile I think the memory ordering trick won't play there, because
> firstly to do that we'll need to update created==false:
>
> -    kvm_destroy_vcpu(cpu);
>      cpu_thread_signal_destroyed(cpu);
> +    kvm_destroy_vcpu(cpu);
>
> And even if we order the operations we still cannot assume the data is safe
> to access even if created==true.
>

Yes, this would need some kind of synchronize_rcu() before clearing
created, and rcu_read_lock() when reading the dirty ring.

(Note that synchronize_rcu can only be used outside BQL. The alternative
would be to defer what's after created=false using call_rcu().

Maybe we'd better need (unfortunately) a per-vcpu mutex to protect both
> cases?


If RCU can work it's obviously better, but if not then yes. It's per-CPU so
it's only about the complexity, not the overhead.

Paolo

>

--0000000000003fbd5e05f884e4cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 4 apr 2023, 16:11 Peter Xu &lt;<a href=3D"mailt=
o:peterx@redhat.com">peterx@redhat.com</a>&gt; ha scritto:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Hi, Paolo!<br>
<br>
On Tue, Apr 04, 2023 at 03:32:38PM +0200, Paolo Bonzini wrote:<br>
&gt; On 2/16/23 17:18, <a href=3D"mailto:huangy81@chinatelecom.cn" target=
=3D"_blank" rel=3D"noreferrer">huangy81@chinatelecom.cn</a> wrote:<br>
&gt; &gt; diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
&gt; &gt; index 9b26582655..47483cdfa0 100644<br>
&gt; &gt; --- a/accel/kvm/kvm-all.c<br>
&gt; &gt; +++ b/accel/kvm/kvm-all.c<br>
&gt; &gt; @@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMS=
tate *s, CPUState *cpu)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ring_size =3D s-&gt;kvm_dirty_=
ring_size;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t count =3D 0, fetch =3D cpu-&gt=
;kvm_fetch_index;<br>
&gt; &gt; +=C2=A0 =C2=A0 /*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* It&#39;s possible that we race with vcpu c=
reation code where the vcpu is<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* put onto the vcpus list but not yet initia=
lized the dirty ring<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0* structures.=C2=A0 If so, skip it.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!cpu-&gt;created) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; <br>
&gt; Is there a lock that protects cpu-&gt;created?<br>
&gt; <br>
&gt; If you don&#39;t want to use a lock you need to use qatomic_load_acqui=
re<br>
&gt; together with<br>
&gt; <br>
&gt; diff --git a/softmmu/cpus.c b/softmmu/cpus.c<br>
&gt; index fed20ffb5dd2..15b64e7f4592 100644<br>
&gt; --- a/softmmu/cpus.c<br>
&gt; +++ b/softmmu/cpus.c<br>
&gt; @@ -525,7 +525,7 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, =
int ms)<br>
&gt;=C2=A0 /* signal CPU creation */<br>
&gt;=C2=A0 void cpu_thread_signal_created(CPUState *cpu)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 cpu-&gt;created =3D true;<br>
&gt; +=C2=A0 =C2=A0 qatomic_store_release(&amp;cpu-&gt;created, true);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_cond_signal(&amp;qemu_cpu_cond);<br>
&gt;=C2=A0 }<br>
<br>
Makes sense.<br>
<br>
When looking at such a possible race, I also found that when destroying the=
<br>
vcpu we may have another relevant issue, where we flip &quot;vcpu-&gt;creat=
ed&quot;<br>
after destroying the vcpu.=C2=A0 IIUC it means the same issue can occur whe=
n<br>
vcpu unplugged?<br>
<br>
Meanwhile I think the memory ordering trick won&#39;t play there, because<b=
r>
firstly to do that we&#39;ll need to update created=3D=3Dfalse:<br>
<br>
-=C2=A0 =C2=A0 kvm_destroy_vcpu(cpu);<br>
=C2=A0 =C2=A0 =C2=A0cpu_thread_signal_destroyed(cpu);<br>
+=C2=A0 =C2=A0 kvm_destroy_vcpu(cpu);<br>
<br>
And even if we order the operations we still cannot assume the data is safe=
<br>
to access even if created=3D=3Dtrue.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Yes, this would need some kind of syn=
chronize_rcu() before clearing created, and rcu_read_lock() when reading th=
e dirty ring.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(Note that=
 synchronize_rcu can only be used outside BQL. The alternative would be to =
defer what&#39;s after created=3Dfalse using call_rcu().</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Maybe we&#39;d better need (unfortunately) a per-vcpu mutex=
 to protect both<br>
cases?</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto=
">If RCU can work it&#39;s obviously better, but if not then yes. It&#39;s =
per-CPU so it&#39;s only about the complexity, not the overhead.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
</blockquote></div></div></div>

--0000000000003fbd5e05f884e4cd--


