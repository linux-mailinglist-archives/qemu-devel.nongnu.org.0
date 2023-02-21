Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A93069E51C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:50:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVpm-0004Xe-Ao; Tue, 21 Feb 2023 11:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUVpk-0004Wn-2H
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUVpi-0000iO-Fa
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676998177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fRbvjyRUVahEOfK2t5DfTTBGuQzzcparGaV+dHrGIDM=;
 b=hsucqFMQJegz+rn26z1gGyqOTczWyznc+8JweWFzGS8zdd6PdoXxWwiFhPxK+5tKtHTj/c
 SWgrem8gz7i/eBddcj3sAnhOwmBzQpareTtvFQmfWwogSaAEgKV/joP2SlzwwOw1SOPYeQ
 fc9sNd/nrvV9geQyIRH6pMoeqkHhOg4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-528-WxvPOQ8HO-qEILfsysLadA-1; Tue, 21 Feb 2023 11:49:34 -0500
X-MC-Unique: WxvPOQ8HO-qEILfsysLadA-1
Received: by mail-pl1-f199.google.com with SMTP id
 j10-20020a170902da8a00b00188cd4769bcso2247134plx.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676998173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fRbvjyRUVahEOfK2t5DfTTBGuQzzcparGaV+dHrGIDM=;
 b=7GKyf3LVkypMC23GaFtR2oGszTcx6YQioC6wlp81/dpXDzRuyfwgO7Q3oYd4FNymM7
 ajX/kZSUpk4CctGU/NHGVo8lNRYa5QaUuzDSJOmyllnOAhd2ah/yS0SAiIzK2e9cEMv9
 fDFZ1e/1ffiB8BqTtMAJIIBK0f7F7tMb+hwcfHP/BmtdKXyBzt6Fh6z7Z8Vz82NFLjzF
 Fo9f5nQVkZjIw9Mgp4Io2bE+OXgaK6HIwoqpfbQNqDY0uPCWr7hyasuUeWMKaHvUWIyz
 41O/N1ZTnfWxl+O6QGyOJVwXuu7SLmoxO2orPGDhmEN9cHCIqI4i0uwmtBi3+5WGKyUO
 3tjQ==
X-Gm-Message-State: AO0yUKVs4AgyEpwRpgQDvxwzwSqB1mZlQzxeUVrJy0qMuk9ZnOBXxCud
 NGO9pQ2fFqCDmxK+Y/eeKpTE1SqUKTLnT16L/Riu4+XK0M4VyzMC0gyseGm6OUK5qFZYXBl/GDI
 x3Nau2p9K22A22kF61UkJwlq6eQl98Vw=
X-Received: by 2002:a62:ceca:0:b0:592:503a:8f06 with SMTP id
 y193-20020a62ceca000000b00592503a8f06mr643642pfg.52.1676998173544; 
 Tue, 21 Feb 2023 08:49:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+YuJkKQed/0/L2AFx1B5WfzlXXHDVlOqCDX/D282EUbNVBlVd1hOaMY9gZiKA23v31BhCOtdReF7fCzGrEenQ=
X-Received: by 2002:a62:ceca:0:b0:592:503a:8f06 with SMTP id
 y193-20020a62ceca000000b00592503a8f06mr643629pfg.52.1676998173223; Tue, 21
 Feb 2023 08:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-6-jsnow@redhat.com>
 <87o7pnzf4d.fsf@pond.sub.org>
In-Reply-To: <87o7pnzf4d.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 21 Feb 2023 11:49:22 -0500
Message-ID: <CAFn=p-aYtKwFUpHH+4TYGKKNhVreUL+KSLKjzPvDbxiMr9eN3g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000678ea105f538903d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--000000000000678ea105f538903d
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023, 1:50 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > Once upon a time, "sphinx-build" on certain RPM platforms invoked
> > specifically a Python 2.x version, while "sphinx-build-3" was a distro
> > shim for the Python 3.x version.
> >
> > These days, none of our supported platforms utilize a 2.x version, so it
> > should be safe to search for 'sphinx-build' prior to 'sphinx-build-3',
> > which will prefer pip/venv installed versions of sphinx if they're
> > available.
> >
> > This adds an extremely convenient ability to test document building
> > ability in QEMU across multiple versions of Sphinx for the purposes of
> > compatibility testing.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/meson.build | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/docs/meson.build b/docs/meson.build
> > index 9136fed3b73..906034f9a87 100644
> > --- a/docs/meson.build
> > +++ b/docs/meson.build
> > @@ -1,5 +1,5 @@
> >  if get_option('sphinx_build') == ''
> > -  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
> > +  sphinx_build = find_program(['sphinx-build', 'sphinx-build-3'],
> >                                required: get_option('docs'))
> >  else
> >    sphinx_build = find_program(get_option('sphinx_build'),
>
> Do we still need to check for sphinx-build-3?  Or asked differently, is
> there any supported build host that provides only sphinx-build-3?
>

Yes, modern Fedora still uses "sphinx-build-3" as the name in /usr/bin for
the rpm-packaged version of sphinx.

It's just that the only platforms where "sphinx-build" is the 2.x version
are platforms on which we want to drop 3.6 support anyway, so it's OK to
invert the search priority in the context of this series.

(All pip/pypi versions use "sphinx-build" as the binary name. In effect,
this patch means we prefer pip/pypi versions if they're in your $PATH.)


>

--000000000000678ea105f538903d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 21, 2023, 1:50 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; write=
s:<br>
<br>
&gt; Once upon a time, &quot;sphinx-build&quot; on certain RPM platforms in=
voked<br>
&gt; specifically a Python 2.x version, while &quot;sphinx-build-3&quot; wa=
s a distro<br>
&gt; shim for the Python 3.x version.<br>
&gt;<br>
&gt; These days, none of our supported platforms utilize a 2.x version, so =
it<br>
&gt; should be safe to search for &#39;sphinx-build&#39; prior to &#39;sphi=
nx-build-3&#39;,<br>
&gt; which will prefer pip/venv installed versions of sphinx if they&#39;re=
<br>
&gt; available.<br>
&gt;<br>
&gt; This adds an extremely convenient ability to test document building<br=
>
&gt; ability in QEMU across multiple versions of Sphinx for the purposes of=
<br>
&gt; compatibility testing.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 docs/meson.build | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/docs/meson.build b/docs/meson.build<br>
&gt; index 9136fed3b73..906034f9a87 100644<br>
&gt; --- a/docs/meson.build<br>
&gt; +++ b/docs/meson.build<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 if get_option(&#39;sphinx_build&#39;) =3D=3D &#39;&#39;<br>
&gt; -=C2=A0 sphinx_build =3D find_program([&#39;sphinx-build-3&#39;, &#39;=
sphinx-build&#39;],<br>
&gt; +=C2=A0 sphinx_build =3D find_program([&#39;sphinx-build&#39;, &#39;sp=
hinx-build-3&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 required: get_option(&#39;docs&#3=
9;))<br>
&gt;=C2=A0 else<br>
&gt;=C2=A0 =C2=A0 sphinx_build =3D find_program(get_option(&#39;sphinx_buil=
d&#39;),<br>
<br>
Do we still need to check for sphinx-build-3?=C2=A0 Or asked differently, i=
s<br>
there any supported build host that provides only sphinx-build-3?<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, moder=
n Fedora still uses &quot;sphinx-build-3&quot; as the name in /usr/bin for =
the rpm-packaged version of sphinx.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">It&#39;s just that the only platforms where &quot;sphinx-build&=
quot; is the 2.x version are platforms on which we want to drop 3.6 support=
 anyway, so it&#39;s OK to invert the search priority in the context of thi=
s series.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(All pip/pypi =
versions use &quot;sphinx-build&quot; as the binary name. In effect, this p=
atch means we prefer pip/pypi versions if they&#39;re in your $PATH.)</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000678ea105f538903d--


