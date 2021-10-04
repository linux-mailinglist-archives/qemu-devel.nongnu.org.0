Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C344216E7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 21:02:40 +0200 (CEST)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXTEU-0008LO-I9
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 15:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXTBh-0006cU-Fx
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXTBc-0008KI-Uj
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633373979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hUiIpspDawKbv7Zcdn5JDIiFXZB15CWKBkAz7+UbeCg=;
 b=Nb0wwL2gPpjRfYiJwU+xlOrLfJdn84MNUjirDPNttgzMZDNo8sXALYFRRniN+qF3qPJgQX
 He1IkZQFhpQXdxcn8Li0A8jh1isDFr2HiyOOqdO1bMbGwE66M+IE05VXN/OC51BgP9Yu1u
 KeW3l46x6Or4XZZxfGxcG0NKaGP383U=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-EJm9rpNGMnS13l8hhk8TEg-1; Mon, 04 Oct 2021 14:59:36 -0400
X-MC-Unique: EJm9rpNGMnS13l8hhk8TEg-1
Received: by mail-ua1-f70.google.com with SMTP id
 i26-20020a9f3b1a000000b002c4f75690f5so9359545uah.22
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 11:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUiIpspDawKbv7Zcdn5JDIiFXZB15CWKBkAz7+UbeCg=;
 b=GQSgP8JVSGEUne6DVQzF3bgevyHTIdb2JQg0SSIAIDQMjeAtpQwn/YmZU00hbT6zdW
 DQe75FmggjcD30xwsiMWN9pycsweVBz4M370lq7gpvBTXMyU9m8eX4zJTSj/QWHUWtr/
 iD7FkphlJugFP6axbNycrH2kd59XqKKor+FecMvD6McuHlhRUZbi8+f5MyyIeepfh90F
 HNpqE3hWqSHn2FOZQ2QSyPrRi55opsauj2VJ2UQvUwBT/mKFLtQj/saoAoI6XBp9f+kg
 BRT8+OfSz6dmp4dfblx156z8EAyeV9pzmq1GyZlL4LTnj8790mRB8WHgHuVaklWAtrFd
 y/kQ==
X-Gm-Message-State: AOAM53148mOyEGfsiKRfOY3mIMQ05+2fvph3RESudJVmk3inkm+Pj9vk
 WIWT/X2+DwB6RJUZURibSrSnFFN8U6GzUh3CXkb8I8ygYe4dirVmVpCZStM8ORlE2VqayL5NPBl
 N8cRCQEyb+0qJqcQCiPXVTZyPZ4cN2Sk=
X-Received: by 2002:ab0:5e9a:: with SMTP id y26mr8202362uag.87.1633373976075; 
 Mon, 04 Oct 2021 11:59:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqqDxEJSNfQiq3NQD99HsPxrX0X/4ioinJsAH+AVw95DDx4iX/6Tm7GFEScFuuknRSF2qqrnHTCtYtdaCeEUo=
X-Received: by 2002:ab0:5e9a:: with SMTP id y26mr8202326uag.87.1633373975778; 
 Mon, 04 Oct 2021 11:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-8-jsnow@redhat.com>
 <374eff9f-0e9e-a2da-19ab-1c39a63191b0@redhat.com>
 <CAFn=p-aVEvHXwZWroz2DitNw6-f0YdfJqsqkxBfKNfHzrB4DOw@mail.gmail.com>
 <58254219-d4a5-c4c2-20ab-21e33e034ce5@redhat.com>
In-Reply-To: <58254219-d4a5-c4c2-20ab-21e33e034ce5@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 4 Oct 2021 14:59:24 -0400
Message-ID: <CAFn=p-bgfkYYpnP6q5E2mxsCsK3tJS6sQFzSXfWFerk9qf1hRQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] iotests/297: Don't rely on distro-specific
 linter binaries
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009caa3905cd8b8342"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009caa3905cd8b8342
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2021 at 4:17 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 22.09.21 21:53, John Snow wrote:
> > (This email just explains python packaging stuff. No action items in
> > here. Skim away.)
> >
> > On Fri, Sep 17, 2021 at 5:43 AM Hanna Reitz <hreitz@redhat.com
> > <mailto:hreitz@redhat.com>> wrote:
> >
> >     On 16.09.21 06:09, John Snow wrote:
> >     > 'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or
> >     "python3 -m
> >     > mypy" to access these scripts instead. This style of invocation
> will
> >     > prefer the "correct" tool when run in a virtual environment.
> >     >
> >     > Note that we still check for "pylint-3" before the test begins
> >     -- this
> >     > check is now "overly strict", but shouldn't cause anything that w=
as
> >     > already running correctly to start failing.
> >     >
> >     > Signed-off-by: John Snow <jsnow@redhat.com
> >     <mailto:jsnow@redhat.com>>
> >     > Reviewed-by: Vladimir Sementsov-Ogievskiy
> >     <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
> >     > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
> >     <mailto:philmd@redhat.com>>
> >     > ---
> >     >   tests/qemu-iotests/297 | 45
> >     ++++++++++++++++++++++++------------------
> >     >   1 file changed, 26 insertions(+), 19 deletions(-)
> >
> >     I know it sounds silly, but to be honest I have no idea if replacin=
g
> >     `mypy` by `python3 -m mypy` is correct, because no mypy documentati=
on
> >     seems to suggest it.
> >
> >
> > Right, I don't think it's necessarily documented that you can do this.
> > It just happens to be a very convenient way to invoke the same script
> > without needing to know *where* mypy is. You let python figure out
> > where it's going to import mypy from, and it handles the rest.
> >
> > (This also makes it easier to use things like mypy, pylint etc with an
> > explicitly specified PYTHON interpreter. I don't happen to do that in
> > this patch, but ... we could.)
> >
> >      From what I understand, that=E2=80=99s generally how Python =E2=80=
=9Cbinaries=E2=80=9D work,
> >     though (i.e., installed as a module invokable with `python -m`,
> >     and then
> >     providing some stub binary that, well, effectively does this, but
> >     kind
> >     of in a weird way, I just don=E2=80=99t understand it), and none of=
 the
> >     parameters seem to be hurt in this conversion, so:
> >
> >
> > Right. Technically, any python package can ask for any number of
> > executables to be installed, but the setuptools packaging ecosystem
> > provides a way to "generate" these based on package configuration. I
> > use a few in our own Python packages. If you look in python/setup.cfg,
> > you'll see stuff like this:
> >
> > [options.entry_points]
> > console_scripts =3D
> >     qom =3D qemu.qmp.qom:main
> >     qom-set =3D qemu.qmp.qom:QOMSet.entry_point
> >     qom-get =3D qemu.qmp.qom:QOMGet.entry_point
> >     qom-list =3D qemu.qmp.qom:QOMList.entry_point
> >     qom-tree =3D qemu.qmp.qom:QOMTree.entry_point
> >     qom-fuse =3D qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
> >     qemu-ga-client =3D qemu.qmp.qemu_ga_client:main
> >     qmp-shell =3D qemu.qmp.qmp_shell:main
> >
> > These entries cause those weird little binary wrapper scripts to be
> > generated for you when the package is *installed*. So our packages
> > will put 'qmp-shell' and 'qom-tree' into your $PATH*.The stuff to the
> > right of the equals sign is just a pointer to a function that can be
> > executed that implements the CLI command. qemu.qmp.qmp_shell points to
> > the module to import, and ':main' points to the function to run.
> >
> > The last bit of this is that many, though not all (and there's zero
> > requirement this has to be true), python packages that implement CLI
> > commands will often have a stanza in their __init__.py module that
> > says something like this:
> >
> > if __name__ =3D=3D '__main__':
> >     do_the_command_line_stuff()
> >
> > Alternatively, a package can include a literal __main__.py file that
> > python knows to check for, and this module is the one that gets
> > executed for `python3 -m mypackage` invocations. This is what mypy does=
.
> >
> > Those are the magical blurbs that allow you to execute a module as if
> > it were a script by running "python3 -m mymodule" -- that hooks
> > directly into that little execution stanza. For python code
> > distributed as packages, that's the real reason to have that little
> > magic stanza -- it provides a convenient way to run stuff without
> > needing to write the incredibly more tedious:
> >
> > python3 -c "from mypy.__main__ import console_entry; console_entry();"
> >
> > ... which is quite a bit more porcelain too, depending on how they
> > re/factor the code inside of the package.
> >
> > Seeing as how mypy explicitly includes a __main__.py file:
> > https://github.com/python/mypy/blob/master/mypy/__main__.py
> > <https://github.com/python/mypy/blob/master/mypy/__main__.py>, I am
> > taking it as a given that they are fully aware of invoking mypy in
> > this fashion, and believe it safe to rely on.
>
> Wow, thanks a lot for this detailed explanation!
> > There will be a quiz later.
> > (There will not be a quiz.)
>
> I=E2=80=99m ready to fail any test on Python so one day I can get a =E2=
=80=9COfficially
> knows nothing about Python=E2=80=9D badge.
>
>
I can respect that ;)

--js

--0000000000009caa3905cd8b8342
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 4, 2021 at 4:17 AM Hanna =
Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 22.09.21=
 21:53, John Snow wrote:<br>
&gt; (This email just explains python packaging stuff. No action items in <=
br>
&gt; here. Skim away.)<br>
&gt;<br>
&gt; On Fri, Sep 17, 2021 at 5:43 AM Hanna Reitz &lt;<a href=3D"mailto:hrei=
tz@redhat.com" target=3D"_blank">hreitz@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hrei=
tz@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 16.09.21 06:09, John Snow wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;pylint-3&#39; is another Fedora-ism. Use =
&quot;python3 -m pylint&quot; or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;python3 -m<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; mypy&quot; to access these scripts instead. Th=
is style of invocation will<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; prefer the &quot;correct&quot; tool when run i=
n a virtual environment.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Note that we still check for &quot;pylint-3&qu=
ot; before the test begins<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; check is now &quot;overly strict&quot;, but sh=
ouldn&#39;t cause anything that was<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; already running correctly to start failing.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto=
:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jsnow@redhat.com" targ=
et=3D"_blank">jsnow@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Reviewed-by: Vladimir Sementsov-Ogievskiy<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:vsementsov@virtuozzo.com" tar=
get=3D"_blank">vsementsov@virtuozzo.com</a> &lt;mailto:<a href=3D"mailto:vs=
ementsov@virtuozzo.com" target=3D"_blank">vsementsov@virtuozzo.com</a>&gt;&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<=
a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:philmd@redhat.com" tar=
get=3D"_blank">philmd@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0tests/qemu-iotests/297 | 45<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A01 file changed, 26 insertions(+), =
19 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I know it sounds silly, but to be honest I have no =
idea if replacing<br>
&gt;=C2=A0 =C2=A0 =C2=A0`mypy` by `python3 -m mypy` is correct, because no =
mypy documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0seems to suggest it.<br>
&gt;<br>
&gt;<br>
&gt; Right, I don&#39;t think it&#39;s necessarily documented that you can =
do this. <br>
&gt; It just happens to be a very convenient way to invoke the same script =
<br>
&gt; without needing to know *where* mypy is. You let python figure out <br=
>
&gt; where it&#39;s going to import mypy from, and it handles the rest.<br>
&gt;<br>
&gt; (This also makes it easier to use things like mypy, pylint etc with an=
 <br>
&gt; explicitly specified PYTHON interpreter. I don&#39;t happen to do that=
 in <br>
&gt; this patch, but ... we could.)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0From what I understand, that=E2=80=99s genera=
lly how Python =E2=80=9Cbinaries=E2=80=9D work,<br>
&gt;=C2=A0 =C2=A0 =C2=A0though (i.e., installed as a module invokable with =
`python -m`,<br>
&gt;=C2=A0 =C2=A0 =C2=A0and then<br>
&gt;=C2=A0 =C2=A0 =C2=A0providing some stub binary that, well, effectively =
does this, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0kind<br>
&gt;=C2=A0 =C2=A0 =C2=A0of in a weird way, I just don=E2=80=99t understand =
it), and none of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0parameters seem to be hurt in this conversion, so:<=
br>
&gt;<br>
&gt;<br>
&gt; Right. Technically, any python package can ask for any number of <br>
&gt; executables to be installed, but the setuptools packaging ecosystem <b=
r>
&gt; provides a way to &quot;generate&quot; these based on package configur=
ation. I <br>
&gt; use a few in our own Python packages. If you look in python/setup.cfg,=
 <br>
&gt; you&#39;ll see stuff like this:<br>
&gt;<br>
&gt; [options.entry_points]<br>
&gt; console_scripts =3D<br>
&gt; =C2=A0 =C2=A0 qom =3D qemu.qmp.qom:main<br>
&gt; =C2=A0 =C2=A0 qom-set =3D qemu.qmp.qom:QOMSet.entry_point<br>
&gt; =C2=A0 =C2=A0 qom-get =3D qemu.qmp.qom:QOMGet.entry_point<br>
&gt; =C2=A0 =C2=A0 qom-list =3D qemu.qmp.qom:QOMList.entry_point<br>
&gt; =C2=A0 =C2=A0 qom-tree =3D qemu.qmp.qom:QOMTree.entry_point<br>
&gt; =C2=A0 =C2=A0 qom-fuse =3D qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse=
]<br>
&gt; =C2=A0 =C2=A0 qemu-ga-client =3D qemu.qmp.qemu_ga_client:main<br>
&gt; =C2=A0 =C2=A0 qmp-shell =3D qemu.qmp.qmp_shell:main<br>
&gt;<br>
&gt; These entries cause those weird little binary wrapper scripts to be <b=
r>
&gt; generated for you when the package is *installed*. So our packages <br=
>
&gt; will put &#39;qmp-shell&#39; and &#39;qom-tree&#39; into your $PATH*.T=
he stuff to the <br>
&gt; right of the equals sign is just a pointer to a function that can be <=
br>
&gt; executed that implements the CLI command. qemu.qmp.qmp_shell points to=
 <br>
&gt; the module to import, and &#39;:main&#39; points to the function to ru=
n.<br>
&gt;<br>
&gt; The last bit of this is that many, though not all (and there&#39;s zer=
o <br>
&gt; requirement this has to be true), python packages that implement CLI <=
br>
&gt; commands will often have a stanza in their __init__.py module that <br=
>
&gt; says something like this:<br>
&gt;<br>
&gt; if __name__ =3D=3D &#39;__main__&#39;:<br>
&gt; =C2=A0=C2=A0=C2=A0 do_the_command_line_stuff()<br>
&gt;<br>
&gt; Alternatively, a package can include a literal __main__.py file that <=
br>
&gt; python knows to check for, and this module is the one that gets <br>
&gt; executed for `python3 -m mypackage` invocations. This is what mypy doe=
s.<br>
&gt;<br>
&gt; Those are the magical blurbs that allow you to execute a module as if =
<br>
&gt; it were a script by running &quot;python3 -m mymodule&quot; -- that ho=
oks <br>
&gt; directly into that little execution stanza. For python code <br>
&gt; distributed as packages, that&#39;s the real reason to have that littl=
e <br>
&gt; magic stanza -- it provides a convenient way to run stuff without <br>
&gt; needing to write the incredibly more tedious:<br>
&gt;<br>
&gt; python3 -c &quot;from mypy.__main__ import console_entry; console_entr=
y();&quot;<br>
&gt;<br>
&gt; ... which is quite a bit more porcelain too, depending on how they <br=
>
&gt; re/factor the code inside of the package.<br>
&gt;<br>
&gt; Seeing as how mypy explicitly includes a __main__.py file: <br>
&gt; <a href=3D"https://github.com/python/mypy/blob/master/mypy/__main__.py=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/mypy/blob/=
master/mypy/__main__.py</a> <br>
&gt; &lt;<a href=3D"https://github.com/python/mypy/blob/master/mypy/__main_=
_.py" rel=3D"noreferrer" target=3D"_blank">https://github.com/python/mypy/b=
lob/master/mypy/__main__.py</a>&gt;, I am <br>
&gt; taking it as a given that they are fully aware of invoking mypy in <br=
>
&gt; this fashion, and believe it safe to rely on.<br>
<br>
Wow, thanks a lot for this detailed explanation!<br>
&gt; There will be a quiz later.<br>
&gt; (There will not be a quiz.)<br>
<br>
I=E2=80=99m ready to fail any test on Python so one day I can get a =E2=80=
=9COfficially <br>
knows nothing about Python=E2=80=9D badge.<br>
<br></blockquote><div><br></div><div>I can respect that ;)</div><div><br></=
div><div>--js<br></div></div></div>

--0000000000009caa3905cd8b8342--


