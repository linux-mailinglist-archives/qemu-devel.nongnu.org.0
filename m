Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEF869B02D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 17:06:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT3EA-00044n-Ks; Fri, 17 Feb 2023 11:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pT3E8-00043f-63
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:04:48 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pT3E4-0000uM-TK
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 11:04:47 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g29so1149216eda.5
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 08:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DOlw6I1Krs04agT4rdADeZfSSB5JoAhXaqfCeO8n06I=;
 b=GCOtGr3Tnuqpbp7oF3cH1cJFg0C30a+9e2M9wgKp4cKFfDmjit7WDwsD16iygJr05F
 HuxtX/4RyPvXk3lWXcsDv+KtWC5h7z1Xb4Pqo2AbkQZ5QC6+3fhWAYOLB7sDthgSPY9Y
 kqANFIQ+qeupYgTMQiScUWpAwgkQwyNidZ/2YBdKuCe2xZw1lw3zpB/93Kbulj+1WM0i
 HXsS6nzC16oi9WRaIoLg5rb+D4HPkL0gdsuLtO/a4/iiPma5+TSxM0+qLw4pJpJx4kRy
 cDDfLHDD0Dew3H7z7i6V8CODTeIvusW2xqB6MtRW5LIVv+Dz7Akl+chwfanVX5w/GfXc
 IB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DOlw6I1Krs04agT4rdADeZfSSB5JoAhXaqfCeO8n06I=;
 b=tdXD1GPPSdYAuhln1BeujeFqIPVfGJ6UCd/jCfmvD4OuJ9KJfqKIpO8sfIR0ZqsPCp
 Oce6mIMXv2FlFNqZvLM0xBzvZ2TP1Xb4hV7FpZw3qPgFKK/Yoj7ldks9yAdP9qRAv/bD
 xIO1ncRIDZrMB0KT+XXJ+/2Yu9o01Tr5Qv6IJWpI68Ajb+f4Pwob3deehk2f9osn5jjv
 SvggDdWNaJcIzXGVfgFwMshyAi5v9SdumbyBWsuHhbbW+I2cVfRS9zSt83m0jcz1HM7q
 QJrBkHUeQ0ajkEN8vUVzVpqCl0YHgDd/HYw16cORgkKPsSn/4VIirJ3EHeGUP7y4HD9D
 QhAA==
X-Gm-Message-State: AO0yUKVyXb/ANJsn8mMdB7Nv1lSLl6du3VnKyjTJKEU3TiLevOXQBd8N
 Bl/0GslO4IJYR3iXS7lNZ4JZtMHXQCxCHgfpMBuZOw==
X-Google-Smtp-Source: AK7set8Mac+S+ab4lAbPXGwiJvZMIcPezLIS29Xk+kfI/jcN+otFgJ/1WrpSG3w01E350SoX6aDKwV1LTiJvaaqToXU=
X-Received: by 2002:a50:bb43:0:b0:4ac:b74b:a6a3 with SMTP id
 y61-20020a50bb43000000b004acb74ba6a3mr976772ede.0.1676649881877; Fri, 17 Feb
 2023 08:04:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPWd1mzg0rWgpf_D+NC+yAosx8oJnA+tR=NpsuFNtWP-j25=pQ@mail.gmail.com>
 <CAFEAcA8dH+DDPHWg6xRmT=3oCu1rwyb1gbyVCXFTSDSzBrGg-w@mail.gmail.com>
 <4ea862746a066107573650d04f4eee6992e0ede9.camel@infradead.org>
 <c2011213-8c8b-95c0-9565-47eaf7d33688@linaro.org>
 <5c7026171d3ab5d530784308a5ce71d32e6760c7.camel@infradead.org>
In-Reply-To: <5c7026171d3ab5d530784308a5ce71d32e6760c7.camel@infradead.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 17 Feb 2023 09:04:48 -0700
Message-ID: <CANCZdfpB9XdCQ97_qbnWNsquX9mwmoeJBzbx0SRQovsZp-xTTA@mail.gmail.com>
Subject: Re: Runnig solaris binary(32 bit) on linux(64 bit)
To: David Woodhouse <dwmw2@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 ginu samuel <samuel.ginu2010@gmail.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009f515705f4e778c1"
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000009f515705f4e778c1
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 12:40 PM David Woodhouse <dwmw2@infradead.org>
wrote:

> On Thu, 2023-02-16 at 09:29 -1000, Richard Henderson wrote:
> > On 2/16/23 09:02, David Woodhouse wrote:
> > > It wouldn't be beyond the wit of man to extend qemu-user to support the
> > > similar personality variations for SCO/Solaris/etc. using that as a
> > > guide.
> >
> > Not beyond wit but perhaps beyond patience.
> >
> > It would certainly be possible to emulate the "easy middle" of one POSIX
> guest on a
> > different POSIX host.  But the dusty corners are going to get in the
> way, where we
> > currently rely on guest and host having identical semantics, and pass
> the system call
> > through to the host.
> >
> > It's a big job.
>
> True, but the existing iBCS / linux-abi kernel patches should highlight
> a lot of those dusty corners.
>

So one thing to understand, the iBCS is a separate ABI. This means that
you'd
have to rewrite everything from the syscall dispatch on down. Even if this
were
relevant, it would be a huge job.

A lot would depend on how much of Solaris is used. Solaris is ELF, which is
good
(it would be even worse if it were SunOS 4, then it's a.out and a whole lot
of other
complication that's more of a bsd-user thing). However, as others have
pointed
out, linux-user assumes a linux kernel. While one can run linux-user on
FreeBSD
with its Linux ABI implementation, even that's quite limited in what it can
do (I
needed to do this for some kexec support I was adding to FreeBSD boot loader
that ran as a Linux binary). I had to make tweaks to FreeBSD's emulation
to make it work, and that was for a binary that used only 10 system calls,
no
threads, no signals, nothing "messy" and apart from some extensions to
64-bits,
nothing that wasn't in 7th Edition Unix.

And there's also a number of special filesystems, IIRC, on Solaris that are
used
like linux's /sys and /proc filesystems, but with different details. And a
million other
details. Knowing the details isn't enough, assuming you could know them from
cribbing from existing code. You have to actually go implement the details
and
that would be a very tedious job. Even if you kept it to a subset that your
program
uses...

I started on a Venix emulator (ancient Unix V7 port to 8088/8086 micros I
cut my
teeth on), and even that was daunting. Now, with 3 years of bsd-user
hacking and
upstreaming under my belt, it would be easier, but there's a *HUGE*
learning curve
to understand the CPU, its exception model, how system calls are handled,
how
memory is mapped, etc. And the 'assume we're on linux' is definitely
leveraged
for memory mapping in the existing linux-user code if you were to copy it
all
as a starting point.

When people say it's a big job, they are underselling it somewhat. It would
be
a big job for the maintainers of linux-user who have all the context and
know
where the gotchas are. For anybody else, learning everything you need to
know itself is a big job.

Your best bet is qemu-sparc-system + Solaris install.

Warner

P.S. Sorry to go into partial rant mode, but 4 years ago when I started
helping
the folks working with bsd-user, I thought how hard could it be... now I
know...

--0000000000009f515705f4e778c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 16, 2023 at 12:40 PM Davi=
d Woodhouse &lt;<a href=3D"mailto:dwmw2@infradead.org">dwmw2@infradead.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, 2023-02-16 at 09:29 -1000, Richard Henderson wrote:<br>
&gt; On 2/16/23 09:02, David Woodhouse wrote:<br>
&gt; &gt; It wouldn&#39;t be beyond the wit of man to extend qemu-user to s=
upport the<br>
&gt; &gt; similar personality variations for SCO/Solaris/etc. using that as=
 a<br>
&gt; &gt; guide.<br>
&gt; <br>
&gt; Not beyond wit but perhaps beyond patience.<br>
&gt; <br>
&gt; It would certainly be possible to emulate the &quot;easy middle&quot; =
of one POSIX guest on a <br>
&gt; different POSIX host.=C2=A0 But the dusty corners are going to get in =
the way, where we <br>
&gt; currently rely on guest and host having identical semantics, and pass =
the system call <br>
&gt; through to the host.<br>
&gt; <br>
&gt; It&#39;s a big job.<br>
<br>
True, but the existing iBCS / linux-abi kernel patches should highlight<br>
a lot of those dusty corners.<br></blockquote><div><br></div><div>So one th=
ing to understand, the iBCS is a separate ABI. This means that you&#39;d</d=
iv><div>have to rewrite everything from the syscall dispatch on down. Even =
if this were</div><div>relevant, it would be a huge job.<br></div><div><br>=
</div>A lot would depend on how much of Solaris is used. Solaris is ELF, wh=
ich is good</div><div class=3D"gmail_quote">(it would be even worse if it w=
ere SunOS 4, then it&#39;s a.out and a whole lot of other</div><div class=
=3D"gmail_quote">complication that&#39;s more of a bsd-user thing). However=
, as others have pointed</div><div class=3D"gmail_quote">out, linux-user as=
sumes a linux kernel. While one can run linux-user on FreeBSD</div><div cla=
ss=3D"gmail_quote">with its Linux ABI implementation, even that&#39;s quite=
 limited in what it can do (I</div><div class=3D"gmail_quote">needed to do =
this for some kexec support I was adding to FreeBSD boot loader</div><div c=
lass=3D"gmail_quote">that ran as a Linux binary). I had to make tweaks to F=
reeBSD&#39;s emulation</div><div class=3D"gmail_quote">to make it work, and=
 that was for a binary that used only 10 system calls, no</div><div class=
=3D"gmail_quote">threads, no signals, nothing &quot;messy&quot; and apart f=
rom some extensions to 64-bits,</div><div class=3D"gmail_quote">nothing tha=
t wasn&#39;t in 7th Edition Unix.<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">And there&#39;s also a number of special fi=
lesystems, IIRC, on Solaris that are used</div><div class=3D"gmail_quote">l=
ike linux&#39;s /sys and /proc filesystems, but with different details. And=
 a million other</div><div class=3D"gmail_quote">details. Knowing the detai=
ls isn&#39;t enough, assuming you could know them from</div><div class=3D"g=
mail_quote">cribbing from existing code. You have to actually go implement =
the details and</div><div class=3D"gmail_quote">that would be a very tediou=
s job. Even if you kept it to a subset that your program</div><div class=3D=
"gmail_quote">uses...<br></div><div class=3D"gmail_quote"><br></div><div cl=
ass=3D"gmail_quote">I started on a Venix emulator (ancient Unix V7 port to =
8088/8086 micros I cut my</div><div class=3D"gmail_quote">teeth on), and ev=
en that was daunting. Now, with 3 years of bsd-user hacking and</div><div c=
lass=3D"gmail_quote">upstreaming under my belt, it would be easier, but the=
re&#39;s a *HUGE* learning curve</div><div class=3D"gmail_quote">to underst=
and the CPU, its exception model, how system calls are handled, how</div><d=
iv class=3D"gmail_quote">memory is mapped, etc. And the &#39;assume we&#39;=
re on linux&#39; is definitely leveraged</div><div class=3D"gmail_quote">fo=
r memory mapping in the existing linux-user code if you were to copy it all=
</div><div class=3D"gmail_quote">as a starting point.</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">When people say it&#39;s a =
big job, they are underselling it somewhat. It would be <br></div><div clas=
s=3D"gmail_quote">a big job for the maintainers of linux-user who have all =
the context and know</div><div class=3D"gmail_quote">where the gotchas are.=
 For anybody else, learning everything you need to</div><div class=3D"gmail=
_quote">know itself is a big job.<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Your best bet is qemu-sparc-system + Solari=
s install.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">Warner</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">P.S. Sorry to go into partial rant mode, but 4 years ago when I s=
tarted helping</div><div class=3D"gmail_quote">the folks working with bsd-u=
ser, I thought how hard could it be... now I know...<br></div></div>

--0000000000009f515705f4e778c1--

