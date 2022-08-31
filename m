Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4C95A7F90
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:08:53 +0200 (CEST)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOOh-00008g-L0
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTOM3-0006BP-PD
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:06:07 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTOM0-0005Hh-N4
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:06:07 -0400
Received: by mail-lj1-x231.google.com with SMTP id x10so14732170ljq.4
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2Pvtkt+r9GFMJi99HQyowsPmEftNjiyM6hxuWEfmue4=;
 b=Veadr822K2KJ89KnFoPbfFqaEi6edGHNJDIBhdoAIhTc0on+Zle+IS9D+NC6DXnsLT
 KoioWkGcr8QbAU4DU8uOYrLz+OFcAozbYkibNMhLcA2BxWBSlklZq3nipwyHnu3U87Al
 kfJzdOj4sr95F/CrJlj6CcqyB5nZIVQpsgfPRMwPmQyw8Qk8G5VRKc2UVlIEf0e7ehNt
 i4AP+sIxLObJxz1pqvdRgwuYIrVWZ1vanXkiGmrho+7ARQ3IM4obgsP5K174p0pv4i4+
 N55LaoPLrcfAlFQkgFLI8bHS7MmxE2nRyn7fJPblGJkdtVh45Yk/b85qwUiBFQdBpY9s
 HICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2Pvtkt+r9GFMJi99HQyowsPmEftNjiyM6hxuWEfmue4=;
 b=GCTSatqa+zvPlITkwr3sAAqWp+cyJa1dJ46KJ5PY1Ak/YAVJrdtY47wHOFqOUXCret
 nuCesw9aUOCegeBBPlVbnDitt4CCTcJfiS0P3OEENFWtYmWJiOeyj6deY2xC4t4Z5KTb
 URsVtSOxgfBlDkFxfsfvFNXyrz0ouI78HnSbaSxeuf4leWB4nC/ZqPZ7tTb78dEZm/sB
 XYvt4wXbWRJrAh9htiKLkxgiIgHsq6G+LxtbnYRq4ao2RcMDuGYeBfNKpq6pt/bOdc4d
 j8JLkzLxtdwTQNk/qEuG+xXkWnVm0htklYj6GTI420meaJ4NNHqvRCN28EDEvpmqk1MP
 HKiA==
X-Gm-Message-State: ACgBeo1BJqAb4HMpJ2c7lNGrrtWXX0B+IwveZO298SEE+QzX5lySKnFR
 70bw+OI5vfzkL5UzJ4npwGlNuswxOSsPVisSrDc=
X-Google-Smtp-Source: AA6agR7j4HjSbP35+rZAcm7f3/zCpJtC5ReMaRriCatNUoKe539JboVNGIjLXk6/CROspsmx0HqLbZxPCr9ASoyH+ho=
X-Received: by 2002:a2e:596:0:b0:264:1a1e:469b with SMTP id
 144-20020a2e0596000000b002641a1e469bmr4781253ljf.463.1661954762759; Wed, 31
 Aug 2022 07:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-28-bmeng.cn@gmail.com>
 <dbb7f0fd-22e6-a5e0-88ce-5810290170ce@redhat.com>
 <CAEUhbmVmyT7ETTJdJH=UzZyf5_PaA8QMfsc=0rjJKK+8RHeztw@mail.gmail.com>
 <91c5a3b9-555e-51d4-1daa-9a4692ea437a@redhat.com>
In-Reply-To: <91c5a3b9-555e-51d4-1daa-9a4692ea437a@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 18:05:51 +0400
Message-ID: <CAJ+F1CJNt1d2uymwy-ONdAbqWd+MGMvw46B3VOTPPhd8FrVJMw@mail.gmail.com>
Subject: Re: [PATCH 27/51] tests/qtest: Use send/recv for socket communication
To: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000044644705e789ff39"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000044644705e789ff39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 26, 2022 at 10:27 PM Thomas Huth <thuth@redhat.com> wrote:

> On 26/08/2022 16.59, Bin Meng wrote:
> > On Thu, Aug 25, 2022 at 9:04 PM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 24/08/2022 11.40, Bin Meng wrote:
> >>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >>>
> >>> Socket communication in the libqtest and libqmp codes uses read()
> >>> and write() which work on any file descriptor on *nix, and sockets
> >>> in *nix are an example of a file descriptor.
> >>>
> >>> However sockets on Windows do not use *nix-style file descriptors,
> >>> so read() and write() cannot be used on sockets on Windows.
> >>> Switch over to use send() and recv() instead which work on both
> >>> Windows and *nix.
> >>>
> >>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>> ---
> >>>
> >>>    tests/qtest/libqmp.c   | 4 ++--
> >>>    tests/qtest/libqtest.c | 4 ++--
> >>>    2 files changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> >>> index ade26c15f0..995a39c1f8 100644
> >>> --- a/tests/qtest/libqmp.c
> >>> +++ b/tests/qtest/libqmp.c
> >>> @@ -36,7 +36,7 @@ typedef struct {
> >>>
> >>>    static void socket_send(int fd, const char *buf, size_t size)
> >>>    {
> >>> -    size_t res =3D qemu_write_full(fd, buf, size);
> >>> +    ssize_t res =3D send(fd, buf, size, 0);
> >>
> >> This way we're losing the extra logic from qemu_write_full() here (i.e=
.
> the
> >> looping and EINTR handling) ... not sure whether that's really OK?
> Maybe you
> >> have to introduce a qemu_send_full() first?
> >>
> >
> > I am not sure if qemu_send_full() is really needed because there is an
> > assert() right after the send() call.
>
> That's just a sanity check ... I think this function still has to take
> care
> of EINTR - it originally looked like this:
>
>   https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc3e5704af19ac6
>
> ... and you can also see the while loop there.
>
>
Agree, that would be the correct thing to do.

Fwiw, the SOCKET vs fd situation is giving me some nervous feelings,
sometimes.

For ex, as I checked recently, it seems close(fd) correctly closes the
underlying SOCKET - as if closesocket() was called on it.. but this is not
really documented.

And it's easy to mix fd vs SOCKET in QEMU code paths (we cast/map SOCKET to
"int fd" in general), and reach a close() on a SOCKET. That wouldn't be
valid, and would likely create leaks or other issues.

Maybe we should introduce a type for safety / documentation purposes...

--=20
Marc-Andr=C3=A9 Lureau

--00000000000044644705e789ff39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 10:27 PM Th=
omas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 26/08/=
2022 16.59, Bin Meng wrote:<br>
&gt; On Thu, Aug 25, 2022 at 9:04 PM Thomas Huth &lt;<a href=3D"mailto:thut=
h@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 24/08/2022 11.40, Bin Meng wrote:<br>
&gt;&gt;&gt; From: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windrive=
r.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Socket communication in the libqtest and libqmp codes uses rea=
d()<br>
&gt;&gt;&gt; and write() which work on any file descriptor on *nix, and soc=
kets<br>
&gt;&gt;&gt; in *nix are an example of a file descriptor.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; However sockets on Windows do not use *nix-style file descript=
ors,<br>
&gt;&gt;&gt; so read() and write() cannot be used on sockets on Windows.<br=
>
&gt;&gt;&gt; Switch over to use send() and recv() instead which work on bot=
h<br>
&gt;&gt;&gt; Windows and *nix.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng=
@windriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriv=
er.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 tests/qtest/libqmp.c=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 tests/qtest/libqtest.c | 4 ++--<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 4 insertions(+), 4 deletions(-)<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c<br>
&gt;&gt;&gt; index ade26c15f0..995a39c1f8 100644<br>
&gt;&gt;&gt; --- a/tests/qtest/libqmp.c<br>
&gt;&gt;&gt; +++ b/tests/qtest/libqmp.c<br>
&gt;&gt;&gt; @@ -36,7 +36,7 @@ typedef struct {<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 static void socket_send(int fd, const char *buf, =
size_t size)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 size_t res =3D qemu_write_full(fd, buf, size);<=
br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ssize_t res =3D send(fd, buf, size, 0);<br>
&gt;&gt;<br>
&gt;&gt; This way we&#39;re losing the extra logic from qemu_write_full() h=
ere (i.e. the<br>
&gt;&gt; looping and EINTR handling) ... not sure whether that&#39;s really=
 OK? Maybe you<br>
&gt;&gt; have to introduce a qemu_send_full() first?<br>
&gt;&gt;<br>
&gt; <br>
&gt; I am not sure if qemu_send_full() is really needed because there is an=
<br>
&gt; assert() right after the send() call.<br>
<br>
That&#39;s just a sanity check ... I think this function still has to take =
care <br>
of EINTR - it originally looked like this:<br>
<br>
=C2=A0 <a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3Dc3e=
5704af19ac6" rel=3D"noreferrer" target=3D"_blank">https://git.qemu.org/?p=
=3Dqemu.git;a=3Dcommitdiff;h=3Dc3e5704af19ac6</a><br>
<br>
... and you can also see the while loop there.<br clear=3D"all"><br></block=
quote><div><br></div><div>Agree, that would be the correct thing to do. <br=
></div><div><br></div><div>Fwiw, the SOCKET vs fd situation is giving me so=
me nervous feelings, sometimes.</div><div><br></div><div>For ex, as I check=
ed recently, it seems close(fd) correctly closes the underlying SOCKET - as=
 if closesocket() was called on it.. but this is not really documented.</di=
v><div><br></div></div><div>And it&#39;s easy to mix fd vs SOCKET in QEMU c=
ode paths (we cast/map SOCKET to &quot;int fd&quot; in general), and reach =
a close() on a SOCKET. That wouldn&#39;t be valid, and would likely create =
leaks or other issues.</div><div><br></div><div>Maybe we should introduce a=
 type for safety / documentation purposes...<br></div><div><br></div><div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br>=
</div></div></div>

--00000000000044644705e789ff39--

