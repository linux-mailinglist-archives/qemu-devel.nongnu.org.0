Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1075F6921CA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQV82-0006oK-P5; Fri, 10 Feb 2023 10:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQV7v-0006ng-Gq
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQV7t-0001Pm-Vk
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676042149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CxLxIR8L4AKiXD2Oy5ixxZ4GEws06ZFqD81tVBGpVUI=;
 b=anjbBnms4i2lOjJ0z2uucMOytAB/RtezVnZrJE0bvQBvm2AYe+1KNMLW1Hdd6t/xtJ+KEk
 JTbOivFh+OyN/E79FBqtsE8vDw25nzHZKku4Ll4pml6pU4MWGvLumXvtueVcMdKhDSJtge
 D7QWE3Ay648RiBrqUsPYSUr08zbLWmE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-_4No3mmZM0KSq2vYM_knxA-1; Fri, 10 Feb 2023 10:15:46 -0500
X-MC-Unique: _4No3mmZM0KSq2vYM_knxA-1
Received: by mail-pg1-f197.google.com with SMTP id
 201-20020a6300d2000000b004ccf545f44fso2694578pga.12
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676042145;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxLxIR8L4AKiXD2Oy5ixxZ4GEws06ZFqD81tVBGpVUI=;
 b=hQ4NNmGNd69OLerYIz4v8SB7FwlHm2vM+KDwDZQqqu+xv5SaJ/Xrz/ey3svT4Knq6Y
 cG5O6F901eZLY4555/jEdPOo1F5KAWnQttPUCceCevNUa+L+6I2kM4rLtSOw0BowaBsm
 S0piInCtE+CstewPc7fq+Lpe60xuI8RTF78w32TcxNnesgEYHbkYx+leFPHZLPdqWZNZ
 Hc9HBOvtHejNxphgGmnst9TBHiPjeJxjSUIxWIdvSdMCUDi8tc1wp4BJSiWCAvgJ+o7v
 t0wT936/ljHBWEtGqtTGkH9leBqBLcFCf2lBuCd0mxIGQ3l4GkQ0YkbDujsjcH9HqoqD
 iKJw==
X-Gm-Message-State: AO0yUKUteYWhT81R83but2Dvjw9jEynZM4urnVbNnZYyF6bK6DStFUcU
 +O8SZtoQqFaiNYRshRalXS7A8R3aWGYav+mqKq5wA/rRKIp8RqP/GYqQHvzcUu1DvvNmw37jxwD
 hQwAQIc1HI5zjS8Wgwd5IdJSJoM486Kk=
X-Received: by 2002:aa7:9618:0:b0:592:e66f:6c77 with SMTP id
 q24-20020aa79618000000b00592e66f6c77mr3257471pfg.34.1676042145630; 
 Fri, 10 Feb 2023 07:15:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/I6DZnnBJ8JA99aPPmvM6mgY5K32gNcz3a8pmaRQm6yTp3w0GhDKd7pLfmnTJKQizDvk+SSwHLfZBu4bsQDgU=
X-Received: by 2002:aa7:9618:0:b0:592:e66f:6c77 with SMTP id
 q24-20020aa79618000000b00592e66f6c77mr3257461pfg.34.1676042145235; Fri, 10
 Feb 2023 07:15:45 -0800 (PST)
MIME-Version: 1.0
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-2-quintela@redhat.com>
 <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru>
 <87ilg9iutl.fsf@secure.mitica> <Y+ZcVkhRr8rYU6Az@x1n>
In-Reply-To: <Y+ZcVkhRr8rYU6Az@x1n>
From: Juan Quintela <quintela@redhat.com>
Date: Fri, 10 Feb 2023 16:15:33 +0100
Message-ID: <CAGiv1-UWTO02TM==+uG1r1-wBpTjDsBa5bQQ3DAp2d4yYnXdyQ@mail.gmail.com>
Subject: Re: [PULL 01/30] migration: Fix migration crash when target psize
 larger than host
To: Peter Xu <peterx@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b219d705f459f8c7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000b219d705f459f8c7
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023, 16:01 Peter Xu <peterx@redhat.com> wrote:

> On Fri, Feb 10, 2023 at 01:11:34PM +0100, Juan Quintela wrote:
> > Michael Tokarev <mjt@tls.msk.ru> wrote:
> > > 07.02.2023 03:56, Juan Quintela wrote:
> > >> From: Peter Xu <peterx@redhat.com>
> > >> Commit d9e474ea56 overlooked the case where the target psize is even
> > >> larger
> > >> than the host psize.  One example is Alpha has 8K page size and
> migration
> > >> will start to crash the source QEMU when running Alpha migration on
> x86.
> > >> Fix it by detecting that case and set host start/end just to cover
> > >> the
> > >> single page to be migrated.
> > >
> > > FWIW, commit in question, which is d9e474ea56, has been applied after
> the
> > > last released version to date, which is 7.2.0.  So I guess this change
> is
> > > not applicable to -stable.
> >
> > I think it should.
> >
> > This is a bug that can happen when your host page is smaller than the
> > guest size.
> >
> > And has been that way for a long time.
> > Once told that, people don't migrate alpha guests a lot, but it can also
> > happens with funny combinations of large pages.
> >
> > Peter Xu knows more about this.
>
> Thanks, Juan.
>
> I think Michael was correct that d9e474ea56 is only merged after our most
> recent release (which is v7.2.0).  So it doesn't need to have stable copied
> (aka, it doesn't need to be applied to any QEMU's stable tree).
>
> Juan, could you help drop the "cc: stable" line if the pull is going to
> have a new version?
>


Sure.

I hope the problem is somewhere else.

>
> Side note: I think in the case where we have wrongly have the cc:stable it
> shouldn't hurt either, because when the stable tree tries to pick it up
> it'll find it doesn't apply at all, then a downstream-only patch will be
> needed, then we'll also figure all things out, just later.
>
> Thanks,
>
> --
> Peter Xu
>
>

--000000000000b219d705f459f8c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 10, 2023, 16:01 Peter Xu &lt;<a href=3D"ma=
ilto:peterx@redhat.com">peterx@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Fri, Feb 10, 2023 at 01:11:34PM +0100, Juan Quinte=
la wrote:<br>
&gt; Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru" target=3D"_blank=
" rel=3D"noreferrer">mjt@tls.msk.ru</a>&gt; wrote:<br>
&gt; &gt; 07.02.2023 03:56, Juan Quintela wrote:<br>
&gt; &gt;&gt; From: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">peterx@redhat.com</a>&gt;<br>
&gt; &gt;&gt; Commit d9e474ea56 overlooked the case where the target psize =
is even<br>
&gt; &gt;&gt; larger<br>
&gt; &gt;&gt; than the host psize.=C2=A0 One example is Alpha has 8K page s=
ize and migration<br>
&gt; &gt;&gt; will start to crash the source QEMU when running Alpha migrat=
ion on x86.<br>
&gt; &gt;&gt; Fix it by detecting that case and set host start/end just to =
cover<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; single page to be migrated.<br>
&gt; &gt;<br>
&gt; &gt; FWIW, commit in question, which is d9e474ea56, has been applied a=
fter the<br>
&gt; &gt; last released version to date, which is 7.2.0.=C2=A0 So I guess t=
his change is<br>
&gt; &gt; not applicable to -stable.<br>
&gt; <br>
&gt; I think it should.<br>
&gt; <br>
&gt; This is a bug that can happen when your host page is smaller than the<=
br>
&gt; guest size.<br>
&gt; <br>
&gt; And has been that way for a long time.<br>
&gt; Once told that, people don&#39;t migrate alpha guests a lot, but it ca=
n also<br>
&gt; happens with funny combinations of large pages.<br>
&gt; <br>
&gt; Peter Xu knows more about this.<br>
<br>
Thanks, Juan.<br>
<br>
I think Michael was correct that d9e474ea56 is only merged after our most<b=
r>
recent release (which is v7.2.0).=C2=A0 So it doesn&#39;t need to have stab=
le copied<br>
(aka, it doesn&#39;t need to be applied to any QEMU&#39;s stable tree).<br>
<br>
Juan, could you help drop the &quot;cc: stable&quot; line if the pull is go=
ing to<br>
have a new version?<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Sure.</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I hope the problem is somewhere else.</div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Side note: I think in the case where we have wrongly have the cc:stable it<=
br>
shouldn&#39;t hurt either, because when the stable tree tries to pick it up=
<br>
it&#39;ll find it doesn&#39;t apply at all, then a downstream-only patch wi=
ll be<br>
needed, then we&#39;ll also figure all things out, just later.<br>
<br>
Thanks,<br>
<br>
-- <br>
Peter Xu<br>
<br>
</blockquote></div></div></div>

--000000000000b219d705f459f8c7--


