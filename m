Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68A6BD05B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 14:02:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcnEY-00032B-7D; Thu, 16 Mar 2023 09:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcnEU-00030J-5n; Thu, 16 Mar 2023 09:01:26 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pcnER-0002ze-Ci; Thu, 16 Mar 2023 09:01:25 -0400
Received: by mail-pl1-x629.google.com with SMTP id c18so1627445ple.11;
 Thu, 16 Mar 2023 06:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678971680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1AyWgo3zLwNiV/iied+HwyfVsUlpHStRYcuc+iHcX0=;
 b=gSSlu1xZIpS8VydGAxhJUICP5eYJImwep+CBpFierKkNahrCvBEtmIMLE07B4aNCQZ
 4+m+Ru7AKOOdcwUvt2DUVFMUknfEHNo1cPw4XfMLOs84GZhZx14REZi9qQ3n/9M1wLYl
 D4nHcVqvVHqjgMPBdHQn7ryKuyxieWl3JouGch9UY7fFcie8poQpAPPNduPqjHttyrq5
 F1PhA8V01izLlbKvcBpFTjIkoHZ9U1W7Twq0ZhkfQPSKVqlivVOW+bAxPYPn673rCWBg
 O/SXlJ30aNegHRowqDFwFB+rJo5F84x869dtzytKlqCgX4UG2L2Q4IdzWvc8KBRiwynK
 MgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678971680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1AyWgo3zLwNiV/iied+HwyfVsUlpHStRYcuc+iHcX0=;
 b=vThNn9t/gx5/rLYsJiEbX9jnz+GAuGMQsm3TZWwdbju+/JkGgdVRYHqrADAevXnYIU
 wwAwF7j34mSqNb/UnWfG3jefyHYU9W5jsyfWeBS8W1qU7MyBYyQ5a94Dv9fJ4fpKzK3x
 gHAPHWLT+0VB+90KzYIa/3lT+wASGAy/PILBEZUdz/BS50xo+NBAad7joK2qWs7ogXqr
 femTQDhb/pRhHPw49DDKVSMvD4AQIdjX5N9OSJHoTIbBLEASLkDULyfZOL4xORNQr6Hf
 LaPK9kjCdHKslKcBjvVQ/SpZgM2I9knqkCkIspAJsSrZPofndiQ+OebxmVfXNvanusju
 kWzw==
X-Gm-Message-State: AO0yUKWxgiwpQzhazFkep6DWH5CTHLN0wGmP3l/spSzmM2SFJoqqGvpC
 FVw+VY6gnDklENG7LRmSAtaaA1EaR+6bFz3J1dg=
X-Google-Smtp-Source: AK7set+pauoVl22F4Otvg8WzOgP51PjlPAUFxxst6NgBot9FDGgXkx0MSMrZPOh2rw1BfKtwJH9OWPkn/fTm7T2oi0Q=
X-Received: by 2002:a17:90b:a0b:b0:23b:419d:8efe with SMTP id
 gg11-20020a17090b0a0b00b0023b419d8efemr1146782pjb.3.1678971680390; Thu, 16
 Mar 2023 06:01:20 -0700 (PDT)
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
Date: Thu, 16 Mar 2023 16:01:06 +0300
Message-ID: <CA+rFky6hnaCxF10ST=qsLsBjH6=M__kQPA=yoZhdCoB8sH96ug@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000099013905f7040e1b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=randrianasulu@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000099013905f7040e1b
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


Well, this language about "market" and "investment"  not just figures of
the speech, sadly? Because paid developers work on  areas they paid to
develop, by boss with big bucks.

I think  by now I am in the period when I re-evaluate possibilities and
futures. I was hoping this commitment to fixing 2038 year problem was
indicative of people's investment in longer-term thinking. But what kind of
Linux will we see/use by 2038? One like Android today, full of binary blobs
and false choices, useless without fat data connection and protected very
well from their own users? Who can push back this darker future?

I naturally try to report bugs I encounter and follow up on them. With
slightly less mainstream hardware this means ... more than 5 minutes daily.
Yes, I *do* have fun on my machines, that might involve qemu, mplayer,
86Box and gcc. I hoped my time running git snapshots of many things
actually helped some users beside me.

I think I like to round this with tree more links to qemu-based projects,
because I think they technically interesting and show there is life outside=
.

https://github.com/xemu-project/xemu
Xbox! including some kind of GPU emulation.

https://github.com/kjliew/qemu-3dfx
Your lovely (possible unsecure) 3dfx!

https://9to5mac.com/2022/12/23/developer-emulates-iphone-os-qemu/

url speaks for itself.

So, there is some positivity, but surrounded by less-than-happy
uncertainty, for me.




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

--00000000000099013905f7040e1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 15:=
35 Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">berrange@redhat.com=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Mar 16, 2023 at 0=
2:11:08PM +0300, Andrew Randrianasulu wrote:<br>
&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 14:02 Thomas Huth &=
lt;<a href=3D"mailto:thuth@redhat.com" rel=3D"noreferrer noreferrer norefer=
rer noreferrer" target=3D"_blank">thuth@redhat.com</a>&gt;:<br>
&gt; <br>
&gt; &gt; On 16/03/2023 11.22, Andrew Randrianasulu wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 12:17 And=
rew Randrianasulu &lt;<a href=3D"mailto:randrianasulu@gmail.com" rel=3D"nor=
eferrer noreferrer noreferrer noreferrer" target=3D"_blank">randrianasulu@g=
mail.com</a><br>
&gt; &gt; &gt; &lt;mailto:<a href=3D"mailto:randrianasulu@gmail.com" rel=3D=
"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">randrianasu=
lu@gmail.com</a>&gt;&gt;:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023=
 =D0=B3., 11:31 Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" rel=3D"=
noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">thuth@redhat=
.com</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:thuth@redhat=
.com" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank"=
>thuth@redhat.com</a>&gt;&gt;:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 16/03/2023 08.36, Philip=
pe Mathieu-Daud=C3=A9 wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 16/3/23 08:17, And=
rew Randrianasulu wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; =D1=87=D1=82, 16 =
=D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Mathieu-Daud=C3=A9<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:philm=
d@linaro.org" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D=
"_blank">philmd@linaro.org</a> &lt;mailto:<a href=3D"mailto:philmd@linaro.o=
rg" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">p=
hilmd@linaro.org</a>&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; &lt;mailto:<a hre=
f=3D"mailto:philmd@linaro.org" rel=3D"noreferrer noreferrer noreferrer nore=
ferrer" target=3D"_blank">philmd@linaro.org</a> &lt;mailto:<a href=3D"mailt=
o:philmd@linaro.org" rel=3D"noreferrer noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">philmd@linaro.org</a>&gt;&gt;&gt;:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0Hi Andrew,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0On 16/3/23 01:57, Andrew Randrianasulu wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; Looking at <a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"=
noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://wiki.qemu.org/ChangeLog/8.0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer=
 noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer no=
referrer noreferrer noreferrer noreferrer" target=3D"_blank">https://wiki.q=
emu.org/ChangeLog/8.0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer=
 noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;&=
gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0 &gt; &lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"norefer=
rer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">https://=
wiki.qemu.org/ChangeLog/8.0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer=
 noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0" rel=3D"noreferrer no=
referrer noreferrer noreferrer noreferrer" target=3D"_blank">https://wiki.q=
emu.org/ChangeLog/8.0</a><br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki=
.qemu.org/ChangeLog/8.0" rel=3D"noreferrer noreferrer noreferrer noreferrer=
 noreferrer" target=3D"_blank">https://wiki.qemu.org/ChangeLog/8.0</a>&gt;&=
gt;&gt;<br>
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
ferrer noreferrer noreferrer noreferrer" target=3D"_blank">https://hackaday=
.com/2023/02/28/repurposing-old-smartphones-when-reusing-makes-more-sense-t=
han-recycling/</a><br>
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
=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well, thi=
s language about &quot;market&quot; and &quot;investment&quot;=C2=A0 not ju=
st figures of the speech, sadly? Because paid developers work on=C2=A0 area=
s they paid to develop, by boss with big bucks.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I think=C2=A0 by now I am in the period when I re-e=
valuate possibilities and futures. I was hoping this commitment to fixing 2=
038 year problem was indicative of people&#39;s investment in longer-term t=
hinking. But what kind of Linux will we see/use by 2038? One like Android t=
oday, full of binary blobs and false choices, useless without fat data conn=
ection and protected very well from their own users? Who can push back this=
 darker future?</div><div dir=3D"auto"><br></div><div dir=3D"auto">I natura=
lly try to report bugs I encounter and follow up on them. With slightly les=
s mainstream hardware this means ... more than 5 minutes daily. Yes, I *do*=
 have fun on my machines, that might involve qemu, mplayer, 86Box and gcc. =
I hoped my time running git snapshots of many things actually helped some u=
sers beside me.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think =
I like to round this with tree more links to qemu-based projects, because I=
 think they technically interesting and show there is life outside.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://github.com/x=
emu-project/xemu" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
ithub.com/xemu-project/xemu</a></div><div dir=3D"auto">Xbox! including some=
 kind of GPU emulation.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<a href=3D"https://github.com/kjliew/qemu-3dfx" target=3D"_blank" rel=3D"no=
referrer">https://github.com/kjliew/qemu-3dfx</a><br></div><div dir=3D"auto=
">Your lovely (possible unsecure) 3dfx!</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><a href=3D"https://9to5mac.com/2022/12/23/developer-emulate=
s-iphone-os-qemu/">https://9to5mac.com/2022/12/23/developer-emulates-iphone=
-os-qemu/</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">url sp=
eaks for itself.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So, the=
re is some positivity, but surrounded by less-than-happy uncertainty, for m=
e.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer noreferrer=
 noreferrer noreferrer" target=3D"_blank">https://berrange.com</a>=C2=A0 =
=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.flickr.com/photos/dbe=
rrange" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" targ=
et=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer noreferrer =
noreferrer noreferrer" target=3D"_blank">https://libvirt.org</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hre=
f=3D"https://fstop138.berrange.com" rel=3D"noreferrer noreferrer noreferrer=
 noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange.com</a>=
 :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer nore=
ferrer noreferrer noreferrer" target=3D"_blank">https://entangle-photo.org<=
/a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.instagram.com/dber=
range" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" targe=
t=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--00000000000099013905f7040e1b--

