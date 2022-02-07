Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40B4ACCA7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 00:49:24 +0100 (CET)
Received: from localhost ([::1]:50910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHDl5-000065-Se
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 18:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHDjm-0007e8-8p
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 18:48:02 -0500
Received: from [2a00:1450:4864:20::132] (port=42824
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHDji-00074o-Us
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 18:48:01 -0500
Received: by mail-lf1-x132.google.com with SMTP id k13so29993208lfg.9
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 15:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CUpl/5wlfjE/pAVTbq9aL2ar/baqioD/bqGsKWx8/NA=;
 b=n3Bsc3C8gmkLTrvBn/L2OZvzN0Ld+FEUa0uEm702OM4L4R6UNDbHc75RdTqUn+rFN7
 7KLfxzHAWG+f7XW7IuHSrL4CK6/QMcdTjfASIlen8c8v+cXpDzAlRzIClvlRuooC9B/+
 8YwdOKpk2O3N5Fbmp/7/vobvvyAVPBnMUWG1sjhuwV1/7O6jZQF7oMqrhZwUBtoAhFoC
 +WGeZSjLIsdDmpWQJ1pvO7MA4d5kGhb82H7l9gkFjaojhcIxsnIeGXk3VDeOmwZrI8rF
 dNmoIgsexxUGPY3oxKH//fBxUx8n5kIXbM3M5BD50CdHsaLxEPLkvdb4kxQvkRM6lGl7
 B7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CUpl/5wlfjE/pAVTbq9aL2ar/baqioD/bqGsKWx8/NA=;
 b=k6vsqInWYhpiP6FkZ5haumx3OYSwoCovCJx+YXkyBgzYjywnb/rcov8CcMm6avy+tq
 9LIXrk6Bwk1JoYAOQvroL3o7h6Uw+xTD07s9NKrP5bUOFD8u6XyVhL4nvP8aVXgBbr96
 JfjwOCeuyifQXK0wYrT/b50+pUIO7MEGpIrf5D23AuuB8E4xoslS2Zne/LaSEyg0qBxd
 ceRl2OJZX0l2R2W9LuLDwGggpzTcH1o+yGH0M5N8GPKAvXisu3hY8E86OUDCQNj/GDtR
 poH0GOPx2AzEKp6WgbSzuR5xkvGpEq0vKLnP6mRYWRiQPNyZ3ts5R8TLLGKF1CHX181M
 bNvA==
X-Gm-Message-State: AOAM533Ig1FodweZvnLwd+gUAk3lPXC4qELyGhuZZojt/hySGkOaM3M4
 Zz+fdobEbwR95g9GGARhW2q99kwPzVeRBkfjj6M=
X-Google-Smtp-Source: ABdhPJw5MngIvax+vyKPEWiEdozkbINnD8WC4uDgSE0DpgWdjclpQCjw+b4TeI0o39HZgLYL76oX3vF6GaWmqFAyJk0=
X-Received: by 2002:a19:5f58:: with SMTP id a24mr1236631lfj.46.1644277676434; 
 Mon, 07 Feb 2022 15:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-11-wwcohen@gmail.com>
 <4132679.VdUcmsAXi6@silver>
In-Reply-To: <4132679.VdUcmsAXi6@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 18:47:45 -0500
Message-ID: <CAB26zV2AECp+pXhAzuvB4rC7QHZVQbdrz8KRL=1teBXLR9r-iw@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000d0e95b05d7763aa3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d0e95b05d7763aa3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 6:44 PM Christian Schoenebeck <qemu_oss@crudebyte.co=
m>
wrote:

> On Montag, 7. Februar 2022 23:40:23 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > To allow VirtFS on darwin, we need to check that pthread_fchdir_np is
> > available, which has only been available since macOS 10.12.
> >
> > Additionally, virtfs_proxy_helper is disabled on Darwin. This patch
> > series does not currently provide an implementation of the proxy-helper=
,
> > but this functionality could be implemented later on.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Rebase to master]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > [Will Cohen: - Add check for pthread_fchdir_np to virtfs
> >              - Add comments to patch commit
> >              - Note that virtfs_proxy_helper does not work
> >                on macOS
> >              - Adjust meson virtfs error note to specify macOS]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  fsdev/meson.build |  1 +
> >  meson.build       | 14 ++++++++++----
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/fsdev/meson.build b/fsdev/meson.build
> > index adf57cc43e..b632b66348 100644
> > --- a/fsdev/meson.build
> > +++ b/fsdev/meson.build
> > @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
> >    'qemu-fsdev.c',
> >  ), if_false: files('qemu-fsdev-dummy.c'))
> >  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> > +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> >
> >  if have_virtfs_proxy_helper
> >    executable('virtfs-proxy-helper',
> > diff --git a/meson.build b/meson.build
> > index 5f43355071..c1d13209ff 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
> >    endif
> >  endif
> >
> > -have_virtfs =3D (targetos =3D=3D 'linux' and
> > +if targetos =3D=3D 'darwin' and cc.has_function('pthread_fchdir_np')
> > +  have_virtfs =3D have_system
> > +else
> > +  have_virtfs =3D (targetos =3D=3D 'linux' and
> >      have_system and
> >      libattr.found() and
> >      libcap_ng.found())
> > +endif
> >
> > -have_virtfs_proxy_helper =3D have_virtfs and have_tools
> > +have_virtfs_proxy_helper =3D targetos !=3D 'darwin' and have_virtfs an=
d
> > have_tools
> >
> >  if get_option('virtfs').enabled()
> >    if not have_virtfs
> > -    if targetos !=3D 'linux'
> > -      error('virtio-9p (virtfs) requires Linux')
> > +    if targetos !=3D 'linux' and targetos !=3D 'darwin'
> > +      error('virtio-9p (virtfs) requires Linux or macOS')
> > +    elif targetos =3D=3D 'darwin' and not
> cc.has_function('pthread_fchdir_np')
> > +      error('virtio-9p (virtfs) on Darwin requires the presence of
> pthread_fchdir_np')
>
> Maybe call this "macOS" in this error message as well?
>
>     error('virtio-9p (virtfs) requires the presence of pthread_fchdir_np
> on macOS')


Agreed =E2=80=94 shouldn=E2=80=99t have omitted.

>
>
> >      elif not libcap_ng.found() or not libattr.found()
> >        error('virtio-9p (virtfs) requires libcap-ng-devel and
> > libattr-devel') elif not have_system
>
>
>

--000000000000d0e95b05d7763aa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Feb 7, 2022 at 6:44 PM Christian Schoenebeck &lt;<a href=3D"ma=
ilto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div=
><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)">On Montag, 7. Februar 202=
2 23:40:23 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; To allow VirtFS on darwin, we need to check that pthread_fchdir_np is<=
br>
&gt; available, which has only been available since macOS 10.12.<br>
&gt; <br>
&gt; Additionally, virtfs_proxy_helper is disabled on Darwin. This patch<br=
>
&gt; series does not currently provide an implementation of the proxy-helpe=
r,<br>
&gt; but this functionality could be implemented later on.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Rebase to master]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; [Will Cohen: - Add check for pthread_fchdir_np to virtfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add comments to patc=
h commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Note that virtfs_pro=
xy_helper does not work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on macOS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Adjust meson virtfs =
error note to specify macOS]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 fsdev/meson.build |=C2=A0 1 +<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++----<br>
&gt;=C2=A0 2 files changed, 11 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/fsdev/meson.build b/fsdev/meson.build<br>
&gt; index adf57cc43e..b632b66348 100644<br>
&gt; --- a/fsdev/meson.build<br>
&gt; +++ b/fsdev/meson.build<br>
&gt; @@ -7,6 +7,7 @@ fsdev_ss.add(when: [&#39;CONFIG_FSDEV_9P&#39;], if_tru=
e: files(<br>
&gt;=C2=A0 =C2=A0 &#39;qemu-fsdev.c&#39;,<br>
&gt;=C2=A0 ), if_false: files(&#39;qemu-fsdev-dummy.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add_all(when: &#39;CONFIG_LINUX&#39;, if_true: fsdev_=
ss)<br>
&gt; +softmmu_ss.add_all(when: &#39;CONFIG_DARWIN&#39;, if_true: fsdev_ss)<=
br>
&gt; <br>
&gt;=C2=A0 if have_virtfs_proxy_helper<br>
&gt;=C2=A0 =C2=A0 executable(&#39;virtfs-proxy-helper&#39;,<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 5f43355071..c1d13209ff 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1421,17 +1421,23 @@ if not get_option(&#39;dbus_display&#39;).disa=
bled()<br>
&gt;=C2=A0 =C2=A0 endif<br>
&gt;=C2=A0 endif<br>
&gt; <br>
&gt; -have_virtfs =3D (targetos =3D=3D &#39;linux&#39; and<br>
&gt; +if targetos =3D=3D &#39;darwin&#39; and cc.has_function(&#39;pthread_=
fchdir_np&#39;)<br>
&gt; +=C2=A0 have_virtfs =3D have_system<br>
&gt; +else<br>
&gt; +=C2=A0 have_virtfs =3D (targetos =3D=3D &#39;linux&#39; and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 have_system and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libattr.found() and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 libcap_ng.found())<br>
&gt; +endif<br>
&gt; <br>
&gt; -have_virtfs_proxy_helper =3D have_virtfs and have_tools<br>
&gt; +have_virtfs_proxy_helper =3D targetos !=3D &#39;darwin&#39; and have_=
virtfs and<br>
&gt; have_tools<br>
&gt; <br>
&gt;=C2=A0 if get_option(&#39;virtfs&#39;).enabled()<br>
&gt;=C2=A0 =C2=A0 if not have_virtfs<br>
&gt; -=C2=A0 =C2=A0 if targetos !=3D &#39;linux&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires Linux&#39=
;)<br>
&gt; +=C2=A0 =C2=A0 if targetos !=3D &#39;linux&#39; and targetos !=3D &#39=
;darwin&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires Linux or =
macOS&#39;)<br>
&gt; +=C2=A0 =C2=A0 elif targetos =3D=3D &#39;darwin&#39; and not cc.has_fu=
nction(&#39;pthread_fchdir_np&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) on Darwin requires=
 the presence of pthread_fchdir_np&#39;)<br>
<br>
Maybe call this &quot;macOS&quot; in this error message as well?<br>
<br>
=C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires the presence of pthrea=
d_fchdir_np on macOS&#39;)</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Agreed =E2=80=94 shouldn=E2=80=99t have omitted.</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)" dir=3D"auto"><br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 elif not libcap_ng.found() or not libattr.found()<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&#39;virtio-9p (virtfs) requires libc=
ap-ng-devel and<br>
&gt; libattr-devel&#39;) elif not have_system<br>
<br>
<br>
</blockquote></div></div>

--000000000000d0e95b05d7763aa3--

