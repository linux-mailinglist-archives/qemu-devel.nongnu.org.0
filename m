Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F646BE284
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 09:04:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd54N-0000lU-2a; Fri, 17 Mar 2023 04:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pd54K-0000hc-Lf; Fri, 17 Mar 2023 04:04:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pd54H-0001wa-Rp; Fri, 17 Mar 2023 04:04:08 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so4366484pjt.5; 
 Fri, 17 Mar 2023 01:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679040244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8LOSxCZr0AQ32rkcd2dXprs/uu5cZgNKnE8b8ZNS97w=;
 b=RRy35mVhGM+ISXRoMfK5jDJjUeX3ZrddLMNhnu0jqESZgGq9LwBGVi3wteAs8XRuG4
 TuJ06Td+uw3nRGSs5Z/12h6fIokVM4MwAthGKuBsJnP/FmosuP9BQ0oIANRPYMk/JJ1e
 d8MMjVztJm4aIm9rSE/EGXJ7VvnRZnQQL2PJBKxAysTA3hbIaMQ7H11PnISve+MNedD6
 /M7HhX8+dhDCPKO9tgHLOJqxpxWX6x9ndAE2dWhu09yqFcmkeVhMsIjZy4r/D2PVpZjg
 MRkOZNwZlZcpnEMB3avCt50e7TdUXhGe3HqN3sqfZtINwfOAcuoa8cOhNB/QLyE8k+xk
 6EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679040244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LOSxCZr0AQ32rkcd2dXprs/uu5cZgNKnE8b8ZNS97w=;
 b=GcZm2s01VOstogVdXvt7S9CfvLliEk7qmZE+6/NnDfpzljYqrFoKN6XQkgAxAHY+ZR
 8R0T81tY8JBNtXuKHF85qW3Rd0Bzu1mjhk9UMAQKlfnALP3EU9OYSpRjStVIpLIAyAMC
 6LTquZXO3dO/vk7bZK1k9ne9MUX7Zz+W8VZ1IDKSWDqzlvgb1N8U3Cn85hO3gtufGrne
 YdZJQ5FzOHp5GpD4CzyUmxp4vO13OHOtmFb0bvUEU7CHWrea7JI3czhHGRxs8DL3jt3N
 IX3zvtbniGmLnEh2I9ahLjCcCIQTqDb+HzwJw4NaNMP1DE5I4X6ehttQfKOhs/fIkQNx
 sH9Q==
X-Gm-Message-State: AO0yUKX5Bz6KEuUEN/tPu4YoufAEkYv3mcL6NDl2E50lvTb5b7QgM8G7
 3A17UUBbotoD/gkq0/EIpa5MmRX1GVPmIdP79vI=
X-Google-Smtp-Source: AK7set8nMBkBI2y3PZdGCSkLhlC9nqeLD3BJ+CG7qXN07j3G7lPoNJ/eRJEkU34tVWo18i8AMnwIz9NsfmxhzOfKSn4=
X-Received: by 2002:a17:90a:4483:b0:234:13d8:ed5b with SMTP id
 t3-20020a17090a448300b0023413d8ed5bmr2016188pjg.3.1679040243720; Fri, 17 Mar
 2023 01:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
 <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
 <CA+rFky6Tt0hcv9TuthS7Q-5SMXtPi+3W8B5qX5itJ0A+meh_Ew@mail.gmail.com>
 <ZBMNEdz9WnUsckd7@redhat.com>
In-Reply-To: <ZBMNEdz9WnUsckd7@redhat.com>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Fri, 17 Mar 2023 11:03:51 +0300
Message-ID: <CA+rFky5_X8TyBOff_BNZEDpoA3Np37gGyGr=WJbcBGF+gT0J2w@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>, rms@gnu.org
Content-Type: multipart/alternative; boundary="0000000000004a65c405f7140529"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=randrianasulu@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000004a65c405f7140529
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 15:35 Daniel P. Berrang=
=C3=A9 <berrange@redhat.com>:

> On Thu, Mar 16, 2023 at 02:11:08PM +0300, Andrew Randrianasulu wrote:
> > =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 14:02 Thomas Huth <t=
huth@redhat.com>:
> >
> > > On 16/03/2023 11.22, Andrew Randrianasulu wrote:
> > > >
> > > >
> > > > =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 Andrew Ran=
drianasulu <
> randrianasulu@gmail.com
> > > > <mailto:randrianasulu@gmail.com>>:
> > > >
> > > >
> > > >
> > > >     =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 11:31 Thomas=
 Huth <thuth@redhat.com
> > > >     <mailto:thuth@redhat.com>>:
> > > >
> > > >         On 16/03/2023 08.36, Philippe Mathieu-Daud=C3=A9 wrote:
> > > >          > On 16/3/23 08:17, Andrew Randrianasulu wrote:
> > > >          >>
> > > >          >> =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:0=
5 Philippe Mathieu-Daud=C3=A9
> > > >         <philmd@linaro.org <mailto:philmd@linaro.org>
> > > >          >> <mailto:philmd@linaro.org <mailto:philmd@linaro.org>>>:
> > > >          >>
> > > >          >>     Hi Andrew,
> > > >          >>
> > > >          >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
> > > >          >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
> > > >         <https://wiki.qemu.org/ChangeLog/8.0>
> > > >          >>     <https://wiki.qemu.org/ChangeLog/8.0
> > > >         <https://wiki.qemu.org/ChangeLog/8.0>>
> > > >          >>      > <https://wiki.qemu.org/ChangeLog/8.0
> > > >         <https://wiki.qemu.org/ChangeLog/8.0>
> > > >          >>     <https://wiki.qemu.org/ChangeLog/8.0
> > > >         <https://wiki.qemu.org/ChangeLog/8.0>>>
> > > >          >>      >
> > > >          >>      > =3D=3D=3D
> > > >          >>      > System emulation on 32-bit x86 and ARM hosts has
> been
> > > >         deprecated.
> > > >          >>     The
> > > >          >>      > QEMU project no longer considers 32-bit x86 and
> ARM
> > > >         support for
> > > >          >>     system
> > > >          >>      > emulation to be an effective use of its limited
> > > >         resources, and thus
> > > >          >>      > intends to discontinue.
> > > >          >>      >
> > > >          >>      >   =3D=3D
> > > >          >>      >
> > > >          >>      > well, I guess arguing from memory-consuption
> point on
> > > 32
> > > >         bit x86
> > > >          >>     hosts
> > > >          >>      > (like my machine where I run 32 bit userspace on
> 64
> > > bit
> > > >         kernel)
> > > >
> > > >         All current PCs have multiple gigabytes of RAM, so using a
> 32-bit
> > > >         userspace
> > > >         to save some few bytes sounds weird.
> > > >
> > > >
> > > >     I think difference more like in 20-30% (on disk and in ram), no=
t
> *few
> > > >     bytes*.
> > > >
> > > >
> > > > I stand (self) corrected on *on disk* binary size, this parameter
> tend
> > > to be
> > > > ~same between bash / php binaries from Slackware 15.0 i586/x86_64. =
I
> do
> > > not
> > > > have full identical x64 Slackware setup for measuring memory impact=
.
> > > >
> > > >
> > > > Still, pushing users into endless hw upgrade is no fun:
> > > >
> > > >
> > >
> https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-=
makes-more-sense-than-recycling/
> > > >
> > > >
> > > > note e-waste and energy consumption
> > >
> > > Now you're mixing things quite badly. That would be an argument in th=
e
> > > years
> > > before 2010 maybe, when not everybody had a 64-bit processor in their
> PC
> > > yet, but it's been now more than 12 years that all recent Desktop
> > > processors
> >
> > =3D=3D=3D
> >
> >
> > Laptops, tablets etc exist.
> >
> >
> > >
> > > feature 64-bit mode. So if QEMU stops supporting 32-bit x86
> environments,
> > > this is not forcing you to buy a new hardware, since you're having a
> > > 64-bit
> > > hardware already anyway. If someone still has plain 32-bit x86 hardwa=
re
> > > around for their daily use, that's certainly not a piece of hardware
> you
> > > want to run QEMU on, since it's older than 12 years already, and thus
> not
> > > really strong enough to run a recent emulator in a recent way.
> > >
> >
> > Well, current qemu runs quite well, than you very much (modulo all this
> > twiddling with command line switches). I think very fact it runs well
> (even
> > as tcg-only emulator, on integer tasks at least) on 32-bit hosts actual=
ly
> > good, and if 32-bit arm hardware can keep some codeways in working stat=
e
> > for me - even better.
>
> The problem being debated here is not a technical one, but a question
> of resource prioritization.
>
> It is certainly technically possible to keep 32-bit support working
> indefinitely and there are certainly people who would benefit from
> that, like yourself.
>
> The issue is that it comes at a cost to the QEMU project both in terms
> of where our contributors invest their time, and in terms of what we
> use our CI resources for. Both maintainer time and hardware resources
> are finite quantities.
>
> IOW, if we continue to support 32-bit host, that means that we will
> be unable to work on some other feature(s) instead.
>
> The question we're battling with is where to draw the line, so that
> we can bring the biggest benefit to QEMU consumers as a whole.
>
> If we keep supporting 32-bit host, that may (hypothetically) benefit
> 100 users.
>
> If we drop 32-bit host we might be able to develop some new features
> that (hypothetically) benefit 5000 new users.
>
> In this illustration, it would make sense to drop 32-bit, because in
> aggregate we would loose 100 users, but gain 5000 new users, meaning
> a net gain of 4900. Furthermore, since QEMU is open source the users
> that we drop support for, do (theoretically at least) still have the
> option of continuing to use older releases.
>
> Now those specific numbers were totally invented, and it isn't very
> easy to come up with especially accurate numbers. So we have to make
> a call based on a combination of factors, our intuition, consideration
> of the overall hardware market, feedback from users in response to a
> deprecation announcements, and more.
>
> With all those factors together, at this time it is looking likely
> that QEMU will be better (on aggregate) if we discontinued support
> for 32-bit hosts. We know that is going to upset some users, and
> we are sorry for that, but we believe more users will benefit in
> the long run by releasing resources to invest in other areas.
>
> The sad reality faced by most open source projects is that plenty
> of people are willing to complain when features are dropped or not
> accepted, but far far fewer are willing to contribute to the
> maintenence effort, to enable the projects to accomplish more
> overall.  So the project maintainers are left in an impossible
> situation where they unfortunately have to make tough decisions
> that leave some people disappointed.
>

To be honest after sleeping over problem I found situation beyond
ridiculous.

IBM is not a charity - they SELL products based on qemu virtualization, for
real, non-trivial money. Same for RedHat. Yet somewhat project running on
servers worldwide has NO RESOURCES and in response jettison minority of
users?

Ever heard word "diversity"? Yes, this is about why small numbers matters,
too! Keeping 32-bit host support  alive at very minimum put some guard
against endless (64bits!) bloating of compiling/linking process.

And seriously, why individual users must pay price? Is IBM on food stamps
suddenly? This is literally their job to provide enough resources for
development process. (not in wasteful manner, tho)

Why not drop 64-bit instead, or at least stall whole pipeline demanding
some improvements?





> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000004a65c405f7140529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 15:=
35 Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berra=
nge@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Mar=
 16, 2023 at 02:11:08PM +0300, Andrew Randrianasulu wrote:<br>
&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 14:02 Thomas Huth &=
lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank" rel=3D"noreferrer"=
>thuth@redhat.com</a>&gt;:<br>
&gt; <br>
&gt; &gt; On 16/03/2023 11.22, Andrew Randrianasulu wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 And=
rew Randrianasulu &lt;<a href=3D"mailto:randrianasulu@gmail.com" target=3D"=
_blank" rel=3D"noreferrer">randrianasulu@gmail.com</a><br>
&gt; &gt; &gt; &lt;mailto:<a href=3D"mailto:randrianasulu@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">randrianasulu@gmail.com</a>&gt;&gt;:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023=
 =D0=B3., 11:31 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:thuth@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">thuth@redhat.com</a>&gt;&gt;:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 16/03/2023 08.36, Philip=
pe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 16/3/23 08:17, And=
rew Randrianasulu wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =D1=87=D1=82, 16 =
=D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Mathieu-Daud=C3=A9<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:philm=
d@linaro.org" target=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a> &l=
t;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=3D"nore=
ferrer">philmd@linaro.org</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=3D"noreferrer">philmd@=
linaro.org</a> &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_b=
lank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;&gt;&gt;:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0Hi Andrew,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0On 16/3/23 01:57, Andrew Randrianasulu wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; Looking at <a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.=
0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://wiki.qemu.org/ChangeLog/8.0</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://wiki.qemu.org/ChangeLog/8.0</a>&gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://wiki.qemu.org/ChangeLog/8.0</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://wiki.qemu.org/ChangeLog/8.0</a>&gt;&gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; =3D=3D=3D<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; System emulation on 32-bit x86 and ARM hosts has been<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deprecated.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0The<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; QEMU project no longer considers 32-bit x86 and ARM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support for<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0system<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; emulation to be an effective use of its limited<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resources, and thus<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; intends to discontinue.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt;=C2=A0 =C2=A0=3D=3D<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; well, I guess arguing from memory-consuption point on<br>
&gt; &gt; 32<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit x86<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0hosts<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; (like my machine where I run 32 bit userspace on 64<br>
&gt; &gt; bit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0All current PCs have multip=
le gigabytes of RAM, so using a 32-bit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0userspace<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to save some few bytes soun=
ds weird.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0I think difference more like in 20-30% (o=
n disk and in ram), not *few<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bytes*.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I stand (self) corrected on *on disk* binary size, this para=
meter tend<br>
&gt; &gt; to be<br>
&gt; &gt; &gt; ~same between bash / php binaries from Slackware 15.0 i586/x=
86_64. I do<br>
&gt; &gt; not<br>
&gt; &gt; &gt; have full identical x64 Slackware setup for measuring memory=
 impact.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Still, pushing users into endless hw upgrade is no fun:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://hackaday.com/2023/02/28/repurposing-old-smartp=
hones-when-reusing-makes-more-sense-than-recycling/" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://hackaday.com/2023/02/28/repurposing-old-s=
martphones-when-reusing-makes-more-sense-than-recycling/</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; note e-waste and energy consumption<br>
&gt; &gt;<br>
&gt; &gt; Now you&#39;re mixing things quite badly. That would be an argume=
nt in the<br>
&gt; &gt; years<br>
&gt; &gt; before 2010 maybe, when not everybody had a 64-bit processor in t=
heir PC<br>
&gt; &gt; yet, but it&#39;s been now more than 12 years that all recent Des=
ktop<br>
&gt; &gt; processors<br>
&gt; <br>
&gt; =3D=3D=3D<br>
&gt; <br>
&gt; <br>
&gt; Laptops, tablets etc exist.<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; feature 64-bit mode. So if QEMU stops supporting 32-bit x86 envir=
onments,<br>
&gt; &gt; this is not forcing you to buy a new hardware, since you&#39;re h=
aving a<br>
&gt; &gt; 64-bit<br>
&gt; &gt; hardware already anyway. If someone still has plain 32-bit x86 ha=
rdware<br>
&gt; &gt; around for their daily use, that&#39;s certainly not a piece of h=
ardware you<br>
&gt; &gt; want to run QEMU on, since it&#39;s older than 12 years already, =
and thus not<br>
&gt; &gt; really strong enough to run a recent emulator in a recent way.<br=
>
&gt; &gt;<br>
&gt; <br>
&gt; Well, current qemu runs quite well, than you very much (modulo all thi=
s<br>
&gt; twiddling with command line switches). I think very fact it runs well =
(even<br>
&gt; as tcg-only emulator, on integer tasks at least) on 32-bit hosts actua=
lly<br>
&gt; good, and if 32-bit arm hardware can keep some codeways in working sta=
te<br>
&gt; for me - even better.<br>
<br>
The problem being debated here is not a technical one, but a question<br>
of resource prioritization.<br>
<br>
It is certainly technically possible to keep 32-bit support working<br>
indefinitely and there are certainly people who would benefit from<br>
that, like yourself.<br>
<br>
The issue is that it comes at a cost to the QEMU project both in terms<br>
of where our contributors invest their time, and in terms of what we<br>
use our CI resources for. Both maintainer time and hardware resources<br>
are finite quantities.<br>
<br>
IOW, if we continue to support 32-bit host, that means that we will<br>
be unable to work on some other feature(s) instead.<br>
<br>
The question we&#39;re battling with is where to draw the line, so that<br>
we can bring the biggest benefit to QEMU consumers as a whole.<br>
<br>
If we keep supporting 32-bit host, that may (hypothetically) benefit<br>
100 users.<br>
<br>
If we drop 32-bit host we might be able to develop some new features<br>
that (hypothetically) benefit 5000 new users.<br>
<br>
In this illustration, it would make sense to drop 32-bit, because in<br>
aggregate we would loose 100 users, but gain 5000 new users, meaning<br>
a net gain of 4900. Furthermore, since QEMU is open source the users<br>
that we drop support for, do (theoretically at least) still have the<br>
option of continuing to use older releases.<br>
<br>
Now those specific numbers were totally invented, and it isn&#39;t very<br>
easy to come up with especially accurate numbers. So we have to make<br>
a call based on a combination of factors, our intuition, consideration<br>
of the overall hardware market, feedback from users in response to a<br>
deprecation announcements, and more.<br>
<br>
With all those factors together, at this time it is looking likely<br>
that QEMU will be better (on aggregate) if we discontinued support<br>
for 32-bit hosts. We know that is going to upset some users, and<br>
we are sorry for that, but we believe more users will benefit in<br>
the long run by releasing resources to invest in other areas.<br>
<br>
The sad reality faced by most open source projects is that plenty<br>
of people are willing to complain when features are dropped or not<br>
accepted, but far far fewer are willing to contribute to the<br>
maintenence effort, to enable the projects to accomplish more<br>
overall.=C2=A0 So the project maintainers are left in an impossible<br>
situation where they unfortunately have to make tough decisions<br>
that leave some people disappointed.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">To be honest after sleeping over prob=
lem I found situation beyond ridiculous.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">IBM is not a charity - they SELL products based on qemu vi=
rtualization, for real, non-trivial money. Same for RedHat. Yet somewhat pr=
oject running on=C2=A0 servers worldwide has NO RESOURCES and in response j=
ettison minority of users?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Ever heard word &quot;diversity&quot;? Yes, this is about why small numb=
ers matters, too! Keeping 32-bit host support=C2=A0 alive at very minimum p=
ut some guard against endless (64bits!) bloating of compiling/linking proce=
ss.</div><div dir=3D"auto"><br></div><div dir=3D"auto">And seriously, why i=
ndividual users must pay price? Is IBM on food stamps suddenly? This is lit=
erally their job to provide enough resources for development process. (not =
in wasteful manner, tho)</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Why not drop 64-bit instead, or at least stall whole pipeline demanding so=
me improvements?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000004a65c405f7140529--

