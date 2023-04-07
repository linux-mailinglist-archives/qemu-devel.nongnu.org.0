Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D56DAA34
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 10:34:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkhWk-0003PQ-K0; Fri, 07 Apr 2023 04:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkhWi-0003PI-SS
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 04:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkhWg-0004AL-Nu
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 04:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680856373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ggWmzcW0OEkexloKIT9OvHh6Wl1QbpLuN7PTXxNAstw=;
 b=EDt1f6z7Dgnmp8KO1mboamUdhlbYTM+3TKZrz1nggoASnJatwhUCfCOluRQI0BUO1p3DUe
 xxfn7L4Ucew0kyIWEAWiYB0aEg82dpG3eexbCfgg+ahVo0FDSNu/8vi9DZ5ZyzaaW+H3dY
 WR+odu3nY/jq72o7V6q4KM0KWLXBw0w=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-_WxX8bIUOt-H7dOpq7Ex4A-1; Fri, 07 Apr 2023 04:32:51 -0400
X-MC-Unique: _WxX8bIUOt-H7dOpq7Ex4A-1
Received: by mail-ua1-f72.google.com with SMTP id
 d42-20020ab014ad000000b0075c9df2d66bso18235758uae.14
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 01:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680856370; x=1683448370;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ggWmzcW0OEkexloKIT9OvHh6Wl1QbpLuN7PTXxNAstw=;
 b=i9a4BbSTeCkCzTWQHFTSWtdqn7wr5K2mBZ7LOkWkq6CFaPlojePZwzjzmR7sj3Bhzn
 sdqUx5KgV705wM1auWCI6cNoo5RYPlxY1f8+ZhQJeOH95ofYmWFZmDbLjZOVxkVPqruA
 CrLaj67pVmloSSJPfoEoBiIcPgiwZM9EaGKYwJ9X9mkv7XAQC1W46D1tz5Cmw6L5LvMd
 iGzYt8JWGoNMPxZxiM4/2PdNjYLToQ6SdPouZHTBzDqYS4ABRa3r0UdWfsZrFsGUSdVm
 tuL1WPi74rNR0GrRR7Dr3GK8y6/bAA/1+7K8pvr5021YcwURYXwgQ9d/VUj873Xt289g
 Jf4A==
X-Gm-Message-State: AAQBX9cajPhZfMV0Lhso2Vk1gmClA9Si1Ip52dZC/JOd8rJmUnZftJfB
 RGR/spR9ViaX4vRa43YRR07I5hqry2yj5D3n3jT6wRWuZuJwsJIPBs1g9+uNTVOuyYcud0riLU+
 CZDCYPfBjBXPwwZLD2PyGy4nf5WSYrtY=
X-Received: by 2002:ab0:6cec:0:b0:764:64c1:9142 with SMTP id
 l12-20020ab06cec000000b0076464c19142mr702352uai.0.1680856370709; 
 Fri, 07 Apr 2023 01:32:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350be18cLSI+yommYdDoLRh+Oba6rPG+ngbpCcLgxXXSjr+AFisQBGYQ+gCYwNIFrg6myppe+tcvNogKe/uc2Spc=
X-Received: by 2002:ab0:6cec:0:b0:764:64c1:9142 with SMTP id
 l12-20020ab06cec000000b0076464c19142mr702343uai.0.1680856370450; Fri, 07 Apr
 2023 01:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230406100759.240870-1-pbonzini@redhat.com>
 <CAJSP0QVkrcU=v77jjnLZsUN3eVKF4RyJ+aLT2_EV4hX=HfL6Vg@mail.gmail.com>
In-Reply-To: <CAJSP0QVkrcU=v77jjnLZsUN3eVKF4RyJ+aLT2_EV4hX=HfL6Vg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 7 Apr 2023 10:32:39 +0200
Message-ID: <CABgObfbCV+KVCq6Cj7_70OcOmuj8ZiULBeSjK19n6ia=n3OTNw@mail.gmail.com>
Subject: Re: [PATCH for-8.1] qemu-coroutine: remove qatomic_mb_read()
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi,
 Stefan" <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e12cbf05f8bade85"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--000000000000e12cbf05f8bade85
Content-Type: text/plain; charset="UTF-8"

Il gio 6 apr 2023, 12:55 Stefan Hajnoczi <stefanha@gmail.com> ha scritto:

> On Thu, 6 Apr 2023 at 06:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > Replace with an explicit barrier and a comment.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  util/qemu-coroutine.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> > index 849452369201..17a88f65053e 100644
> > --- a/util/qemu-coroutine.c
> > +++ b/util/qemu-coroutine.c
> > @@ -127,9 +127,13 @@ void qemu_aio_coroutine_enter(AioContext *ctx,
> Coroutine *co)
> >          Coroutine *to = QSIMPLEQ_FIRST(&pending);
> >          CoroutineAction ret;
> >
> > -        /* Cannot rely on the read barrier for to in aio_co_wake(), as
> there are
> > -         * callers outside of aio_co_wake() */
> > -        const char *scheduled = qatomic_mb_read(&to->scheduled);
> > +        /*
> > +         * Read to before to->scheduled; pairs with qatomic_cmpxchg in
> > +         * qemu_co_sleep(), aio_co_schedule() etc.
> > +         */
> > +        smp_read_barrier_depends();
>
> I'm not a fan of nuanced memory ordering primitives. I don't
> understand or remember all the primitives available in
> docs/devel/atomics.rst and especially not how they interact with each
> other.
>

Understood, that's why I want to remove qatomic_mb_read().

Does smp_read_barrier_depends() make sense for QEMU? Does QEMU support
> Alpha host CPUs?
>

It makes sense in that it's cheaper than qatomic_load_acquire() or
smp_rmb() on ARM and PPC (32-bit ARM is especially bad). Here I can use
smp_rmb() if you prefer; I thought that the comment, explicitly referring
to "to->scheduled" which depends on "to", would be enough.

I could also use QSIMPLEQ_FIRST_RCU(&pending) to hide the barrier, but it
seems to be a bad idea because there's no RCU involvement here.

Paolo


> Stefan
>
>

--000000000000e12cbf05f8bade85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 6 apr 2023, 12:55 Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&gt; ha scritto:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Thu, 6 Apr 2023 at 06:09, Paolo Bonzi=
ni &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"nore=
ferrer">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Replace with an explicit barrier and a comment.<br>
&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 util/qemu-coroutine.c | 10 +++++++---<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c<br>
&gt; index 849452369201..17a88f65053e 100644<br>
&gt; --- a/util/qemu-coroutine.c<br>
&gt; +++ b/util/qemu-coroutine.c<br>
&gt; @@ -127,9 +127,13 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Co=
routine *co)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Coroutine *to =3D QSIMPLEQ_FIRST(&am=
p;pending);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CoroutineAction ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Cannot rely on the read barrier for to=
 in aio_co_wake(), as there are<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* callers outside of aio_co_wake() =
*/<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *scheduled =3D qatomic_mb_read=
(&amp;to-&gt;scheduled);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Read to before to-&gt;scheduled; =
pairs with qatomic_cmpxchg in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* qemu_co_sleep(), aio_co_schedule(=
) etc.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 smp_read_barrier_depends();<br>
<br>
I&#39;m not a fan of nuanced memory ordering primitives. I don&#39;t<br>
understand or remember all the primitives available in<br>
docs/devel/atomics.rst and especially not how they interact with each<br>
other.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Understood, that&#39;s why I want to remove qatomic_mb_read().</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
Does smp_read_barrier_depends() make sense for QEMU? Does QEMU support<br>
Alpha host CPUs?<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">It makes sense in that it&#39;s cheaper than qatomic_load_a=
cquire() or smp_rmb() on ARM and PPC (32-bit ARM is especially bad). Here I=
 can use smp_rmb() if you prefer; I thought that the comment, explicitly re=
ferring to &quot;to-&gt;scheduled&quot; which depends on &quot;to&quot;, wo=
uld be enough.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I could a=
lso use QSIMPLEQ_FIRST_RCU(&amp;pending) to hide the barrier, but it seems =
to be a bad idea because there&#39;s no RCU involvement here.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Stefan<br>
<br>
</blockquote></div></div></div>

--000000000000e12cbf05f8bade85--


