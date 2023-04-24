Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E7D6ED6B9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 23:22:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr3bk-0006g2-7B; Mon, 24 Apr 2023 17:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pr3bh-0006ff-VE
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 17:20:21 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pr3bf-0004BF-86
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 17:20:21 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-4436568b2aeso1762818e0c.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 14:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20221208.gappssmtp.com; s=20221208; t=1682371217; x=1684963217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DrPY8zwawWglvQLctdDs7+eCUDfLdLroIMM1IF9U/4M=;
 b=yVsYSAiXUy3IaOYt86Nc5SIPIN63rEwY4Ik8spyvaGnoG/wzAfshUSpwnOeXoh5Fyz
 MLT3Se/lpDg2cxeftLMvrYH3LQ9Tikm6l/kktfe1KY4C/yl+4BaGDMfZ431sYtugK46v
 n9MRuc4J0DOV+loR4e88T58RGmCBg9A0nviz0mM0vXA327a+EopmblDd5+fLOl6CvNQ4
 JL9iKHN8trc6172Q5k8IF93rXPGokLS6VyJNiTZjSBGJCU9/A0yO/oA+whMqEdmw0qHq
 uDfrV0Ny2wXfaOwg6uMfsNKuS+fV0gIP0oeYixH31aYhkKhvyS5A+MhWN0m4vvBTrvl1
 mM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682371217; x=1684963217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DrPY8zwawWglvQLctdDs7+eCUDfLdLroIMM1IF9U/4M=;
 b=Yfxh5XhNiWLOTlNE+0xGP41959IQs/C4jARuBcV3iwI4S3Hl6F60ds++ERjKvSi9vx
 15DvQqN6uh2IdUSdmlIiU5F6loe+HHTQB+FfWR/VqVJl/YpZyVoCeyqeKXJeNmdPlf0D
 CD0dE4JpzVsjKGPdx0J8ubEuUOePtHJvlIRn9zbK39ptcbOeuybdPl1lYQlU6ElFs+LW
 v/mURrceAx7AKitQEpJoPBHf3zN/NXWEPq3FA9Ywziu/znUHaqVv9Ld4bt5Xin7VXP8U
 G0mo2uk5nzqyCEwa/Uy7Jx4BXtQGsR3eHwpOzJ7kLqTTBA9IDAwqm6E8WDB5Bcli+7wK
 G3dw==
X-Gm-Message-State: AAQBX9cy3isaCiE/vDwtWIng9ITM1NbS2q1HJQFjqod4v5+TCjX5YKXx
 u1YHruInPekKmpwBmxJV+LfFU1oLMN9egy+oIIvwvw==
X-Google-Smtp-Source: AKy350ZUiulp8s0zrOtilz8Dn6PocxUJJfMJkuvBxoFg1gtP0dDjTKqUeXt4R0WZWyiBLHegpHdR6VDVU8gmt2i9OOA=
X-Received: by 2002:a1f:5e81:0:b0:432:3100:1278 with SMTP id
 s123-20020a1f5e81000000b0043231001278mr3780359vkb.16.1682371217478; Mon, 24
 Apr 2023 14:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <20230424200248.1183394-15-jsnow@redhat.com>
 <CANCZdfrmJtZBCf55hvQ48k9jguEvhrntVCYiqkjDx2BwYJOa-Q@mail.gmail.com>
 <CAFn=p-ZJkEZaujHfCdgNYvTw70rMTrFLgB0EW32a-v0UexgVRg@mail.gmail.com>
In-Reply-To: <CAFn=p-ZJkEZaujHfCdgNYvTw70rMTrFLgB0EW32a-v0UexgVRg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 24 Apr 2023 15:20:05 -0600
Message-ID: <CANCZdfoXnE9NAsbxf6tpo4xPgQpn3gPcYLe1oZ1254WZj6Hh+g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 14/20] configure: use 'mkvenv ensure meson' to
 bootstrap meson
To: John Snow <jsnow@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cc707d05fa1b92da"
Received-SPF: none client-ip=2607:f8b0:4864:20::a30;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000cc707d05fa1b92da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 2:41=E2=80=AFPM John Snow <jsnow@redhat.com> wrote:

> On Mon, Apr 24, 2023 at 4:36=E2=80=AFPM Warner Losh <imp@bsdimp.com> wrot=
e:
> >
> >
> >
> > On Mon, Apr 24, 2023, 2:03 PM John Snow <jsnow@redhat.com> wrote:
> >>
> >> This commit changes how we detect and install meson. It notably remove=
s
> >> '--meson=3D'.
> >>
> >> The previous patch creates a lightweight Python virtual environment
> >> unconditionally using the user's configured $python that inherits syst=
em
> >> packages. If Meson is installed there and meets our minimum version
> >> requirements, we will use that Meson.
> >>
> >> In the event that Meson is installed but *not for the chosen Python
> >> interpreter*, not found, or of insufficient version, we will attempt t=
o
> >> install Meson from vendored source into the newly created Python virtu=
al
> >> environment. This vendored installation is considered to replace the
> >> mechanism from prior tarball distributions.
> >>
> >> This commit restores the ability to use a system meson, but in turn
> >> temporarily removes the ability to use a meson as obtained from the
> >> internet at configure-time (git submodules, as it stood prior to this
> >> patch); that ability will be restored in the next commit.
> >>
> >> As a result of this patch, the Python interpreter we use for both our
> >> own build scripts *and* Meson extensions are always known to be the
> >> exact same Python. As a further benefit, there will also be a symlink
> >> available in the build directory that points to the correct, configure=
d
> >> python and can be used by e.g. manual tests to invoke the correct,
> >> configured Python unambiguously.
> >>
> >> Signed-off-by: John Snow <jsnow@redhat.com>
> >> ---
> >>  configure                           | 72 ++++++++--------------------=
-
> >>  .gitlab-ci.d/buildtest-template.yml |  4 +-
> >>  2 files changed, 21 insertions(+), 55 deletions(-)
> >>
> >> diff --git a/configure b/configure
> >> index 462fe604d6..e9947369b2 100755
> >> --- a/configure
> >> +++ b/configure
> >> @@ -731,8 +731,6 @@ for opt do
> >>    ;;
> >>    --skip-meson) skip_meson=3Dyes
> >>    ;;
> >> -  --meson=3D*) meson=3D"$optarg"
> >> -  ;;
> >>    --ninja=3D*) ninja=3D"$optarg"
> >>    ;;
> >>    --smbd=3D*) smbd=3D"$optarg"
> >> @@ -1016,7 +1014,6 @@ Advanced options (experts only):
> >>    --cross-prefix-ARCH=3DPREFIX cross compiler prefix when building AR=
CH
> guest test cases
> >>    --make=3DMAKE              use specified make [$make]
> >>    --python=3DPYTHON          use specified python [$python]
> >> -  --meson=3DMESON            use specified meson [$meson]
> >>    --ninja=3DNINJA            use specified ninja [$ninja]
> >>    --smbd=3DSMBD              use specified smbd [$smbd]
> >>    --with-git=3DGIT           use specified git [$git]
> >> @@ -1089,7 +1086,8 @@ fi
> >>
> >>  # Resolve PATH
> >>  python=3D"$(command -v "$python")"
> >> -explicit_python=3Dyes
> >> +# This variable is intended to be used only for error messages:
> >> +target_python=3D$python
> >>
> >>  # Create a Python virtual environment using our configured python.
> >>  # The stdout of this script will be the location of a symlink that
> >> @@ -1101,7 +1099,6 @@ explicit_python=3Dyes
> >>  # - venv is cleared if it exists already;
> >>  # - venv is allowed to use system packages;
> >>  # - all setup is performed **offline**;
> >> -# - No packages are installed by default;
> >>  # - pip is not installed into the venv when possible,
> >>  #   but ensurepip is called as a fallback when necessary.
> >>
> >> @@ -1116,58 +1113,27 @@ fi
> >>  # Suppress writing compiled files
> >>  python=3D"$python -B"
> >>
> >> -has_meson() {
> >> -  local python_dir=3D$(dirname "$python")
> >> -  # PEP405: pyvenv.cfg is either adjacent to the Python executable
> >> -  # or one directory above
> >> -  if test -f $python_dir/pyvenv.cfg || test -f
> $python_dir/../pyvenv.cfg; then
> >> -    # Ensure that Meson and Python come from the same virtual
> environment
> >> -    test -x "$python_dir/meson" &&
> >> -      test "$(command -v meson)" -ef "$python_dir/meson"
> >> -  else
> >> -    has meson
> >> -  fi
> >> -}
> >>
> >> -if test -z "$meson"; then
> >> -    if test "$explicit_python" =3D no && has_meson && version_ge
> "$(meson --version)" 0.61.5; then
> >> -        meson=3Dmeson
> >> -    elif test "$git_submodules_action" !=3D 'ignore' ; then
> >> -        meson=3Dgit
> >> -    elif test -e "${source_path}/meson/meson.py" ; then
> >> -        meson=3Dinternal
> >> -    else
> >> -        if test "$explicit_python" =3D yes; then
> >> -            error_exit "--python requires using QEMU's embedded Meson
> distribution, but it was not found."
> >> -        else
> >> -            error_exit "Meson not found.  Use --meson=3D/path/to/meso=
n"
> >> -        fi
> >> +if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
> >> +     --dir "${source_path}/python/wheels" \
> >> +     "meson>=3D0.61.5" ;
> >> +then
> >> +    # We're very out of luck. Try to give a good diagnostic.
> >> +    if test -e pyvenv/bin/meson; then
> >> +        echo "Meson is too old:
> >
> >
> > Does a minimum version still get printed? I've needed to know that in
> the past when I got the error...
> >
> > Warner
> >  $(pyvenv/bin/meson --version)"
>
> At the end of the series, here's what happens if i change the meson
> requirement to a fictionally too-high version that would be impossible
> to fulfill:
>
>
> -------------------------------------------------------------------------=
-------
> jsnow@scv ~/s/q/b/git (python-configure-venv)> ../../configure
> --enable-debug --disable-pypi;
> python determined to be '/usr/bin/python3'
> python version: Python 3.11.2
> MKVENV pyvenv
> MKVENV ensure meson>=3D2.61.5
> ERROR: Could not find a version that satisfies the requirement
> meson>=3D2.61.5 (from versions: none)
> ERROR: No matching distribution found for meson>=3D2.61.5
>
> *** Ouch! ***
>

Oh, that's enough :) :) thanks! I'd be happy with less...

Warner


> Could not ensure availability of 'meson>=3D2.61.5':
>  =E2=80=A2 Python package 'meson' version '1.0.1' was found, but isn't su=
itable.
>  =E2=80=A2 No suitable version found in, or failed to install from
> '/home/jsnow/src/qemu/python/wheels'.
>  =E2=80=A2 mkvenv was configured to operate offline and did not check PyP=
I.
>
> -------------------------------------------------------------------------=
-------
>
>

--000000000000cc707d05fa1b92da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 24, 2023 at 2:41=E2=80=AF=
PM John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon=
, Apr 24, 2023 at 4:36=E2=80=AFPM Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Apr 24, 2023, 2:03 PM John Snow &lt;<a href=3D"mailto:jsnow@re=
dhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This commit changes how we detect and install meson. It notably re=
moves<br>
&gt;&gt; &#39;--meson=3D&#39;.<br>
&gt;&gt;<br>
&gt;&gt; The previous patch creates a lightweight Python virtual environmen=
t<br>
&gt;&gt; unconditionally using the user&#39;s configured $python that inher=
its system<br>
&gt;&gt; packages. If Meson is installed there and meets our minimum versio=
n<br>
&gt;&gt; requirements, we will use that Meson.<br>
&gt;&gt;<br>
&gt;&gt; In the event that Meson is installed but *not for the chosen Pytho=
n<br>
&gt;&gt; interpreter*, not found, or of insufficient version, we will attem=
pt to<br>
&gt;&gt; install Meson from vendored source into the newly created Python v=
irtual<br>
&gt;&gt; environment. This vendored installation is considered to replace t=
he<br>
&gt;&gt; mechanism from prior tarball distributions.<br>
&gt;&gt;<br>
&gt;&gt; This commit restores the ability to use a system meson, but in tur=
n<br>
&gt;&gt; temporarily removes the ability to use a meson as obtained from th=
e<br>
&gt;&gt; internet at configure-time (git submodules, as it stood prior to t=
his<br>
&gt;&gt; patch); that ability will be restored in the next commit.<br>
&gt;&gt;<br>
&gt;&gt; As a result of this patch, the Python interpreter we use for both =
our<br>
&gt;&gt; own build scripts *and* Meson extensions are always known to be th=
e<br>
&gt;&gt; exact same Python. As a further benefit, there will also be a syml=
ink<br>
&gt;&gt; available in the build directory that points to the correct, confi=
gured<br>
&gt;&gt; python and can be used by e.g. manual tests to invoke the correct,=
<br>
&gt;&gt; configured Python unambiguously.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" t=
arget=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 72 ++++++++--------------=
-------<br>
&gt;&gt;=C2=A0 .gitlab-ci.d/buildtest-template.yml |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 2 files changed, 21 insertions(+), 55 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/configure b/configure<br>
&gt;&gt; index 462fe604d6..e9947369b2 100755<br>
&gt;&gt; --- a/configure<br>
&gt;&gt; +++ b/configure<br>
&gt;&gt; @@ -731,8 +731,6 @@ for opt do<br>
&gt;&gt;=C2=A0 =C2=A0 ;;<br>
&gt;&gt;=C2=A0 =C2=A0 --skip-meson) skip_meson=3Dyes<br>
&gt;&gt;=C2=A0 =C2=A0 ;;<br>
&gt;&gt; -=C2=A0 --meson=3D*) meson=3D&quot;$optarg&quot;<br>
&gt;&gt; -=C2=A0 ;;<br>
&gt;&gt;=C2=A0 =C2=A0 --ninja=3D*) ninja=3D&quot;$optarg&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 ;;<br>
&gt;&gt;=C2=A0 =C2=A0 --smbd=3D*) smbd=3D&quot;$optarg&quot;<br>
&gt;&gt; @@ -1016,7 +1014,6 @@ Advanced options (experts only):<br>
&gt;&gt;=C2=A0 =C2=A0 --cross-prefix-ARCH=3DPREFIX cross compiler prefix wh=
en building ARCH guest test cases<br>
&gt;&gt;=C2=A0 =C2=A0 --make=3DMAKE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 use specified make [$make]<br>
&gt;&gt;=C2=A0 =C2=A0 --python=3DPYTHON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
se specified python [$python]<br>
&gt;&gt; -=C2=A0 --meson=3DMESON=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
se specified meson [$meson]<br>
&gt;&gt;=C2=A0 =C2=A0 --ninja=3DNINJA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 use specified ninja [$ninja]<br>
&gt;&gt;=C2=A0 =C2=A0 --smbd=3DSMBD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 use specified smbd [$smbd]<br>
&gt;&gt;=C2=A0 =C2=A0 --with-git=3DGIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0use specified git [$git]<br>
&gt;&gt; @@ -1089,7 +1086,8 @@ fi<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Resolve PATH<br>
&gt;&gt;=C2=A0 python=3D&quot;$(command -v &quot;$python&quot;)&quot;<br>
&gt;&gt; -explicit_python=3Dyes<br>
&gt;&gt; +# This variable is intended to be used only for error messages:<b=
r>
&gt;&gt; +target_python=3D$python<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Create a Python virtual environment using our configured p=
ython.<br>
&gt;&gt;=C2=A0 # The stdout of this script will be the location of a symlin=
k that<br>
&gt;&gt; @@ -1101,7 +1099,6 @@ explicit_python=3Dyes<br>
&gt;&gt;=C2=A0 # - venv is cleared if it exists already;<br>
&gt;&gt;=C2=A0 # - venv is allowed to use system packages;<br>
&gt;&gt;=C2=A0 # - all setup is performed **offline**;<br>
&gt;&gt; -# - No packages are installed by default;<br>
&gt;&gt;=C2=A0 # - pip is not installed into the venv when possible,<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0but ensurepip is called as a fallback when nec=
essary.<br>
&gt;&gt;<br>
&gt;&gt; @@ -1116,58 +1113,27 @@ fi<br>
&gt;&gt;=C2=A0 # Suppress writing compiled files<br>
&gt;&gt;=C2=A0 python=3D&quot;$python -B&quot;<br>
&gt;&gt;<br>
&gt;&gt; -has_meson() {<br>
&gt;&gt; -=C2=A0 local python_dir=3D$(dirname &quot;$python&quot;)<br>
&gt;&gt; -=C2=A0 # PEP405: pyvenv.cfg is either adjacent to the Python exec=
utable<br>
&gt;&gt; -=C2=A0 # or one directory above<br>
&gt;&gt; -=C2=A0 if test -f $python_dir/pyvenv.cfg || test -f $python_dir/.=
./pyvenv.cfg; then<br>
&gt;&gt; -=C2=A0 =C2=A0 # Ensure that Meson and Python come from the same v=
irtual environment<br>
&gt;&gt; -=C2=A0 =C2=A0 test -x &quot;$python_dir/meson&quot; &amp;&amp;<br=
>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 test &quot;$(command -v meson)&quot; -ef &qu=
ot;$python_dir/meson&quot;<br>
&gt;&gt; -=C2=A0 else<br>
&gt;&gt; -=C2=A0 =C2=A0 has meson<br>
&gt;&gt; -=C2=A0 fi<br>
&gt;&gt; -}<br>
&gt;&gt;<br>
&gt;&gt; -if test -z &quot;$meson&quot;; then<br>
&gt;&gt; -=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D no &amp;&a=
mp; has_meson &amp;&amp; version_ge &quot;$(meson --version)&quot; 0.61.5; =
then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3Dmeson<br>
&gt;&gt; -=C2=A0 =C2=A0 elif test &quot;$git_submodules_action&quot; !=3D &=
#39;ignore&#39; ; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3Dgit<br>
&gt;&gt; -=C2=A0 =C2=A0 elif test -e &quot;${source_path}/meson/meson.py&qu=
ot; ; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 meson=3Dinternal<br>
&gt;&gt; -=C2=A0 =C2=A0 else<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =
=3D yes; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;--pyth=
on requires using QEMU&#39;s embedded Meson distribution, but it was not fo=
und.&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;Meson =
not found.=C2=A0 Use --meson=3D/path/to/meson&quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt; +if ! $python &quot;${source_path}/python/scripts/mkvenv.py&quot; =
ensure \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0--dir &quot;${source_path}/python/wheels&quot=
; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0&quot;meson&gt;=3D0.61.5&quot; ;<br>
&gt;&gt; +then<br>
&gt;&gt; +=C2=A0 =C2=A0 # We&#39;re very out of luck. Try to give a good di=
agnostic.<br>
&gt;&gt; +=C2=A0 =C2=A0 if test -e pyvenv/bin/meson; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Meson is too old:<br>
&gt;<br>
&gt;<br>
&gt; Does a minimum version still get printed? I&#39;ve needed to know that=
 in the past when I got the error...<br>
&gt;<br>
&gt; Warner<br>
&gt;=C2=A0 $(pyvenv/bin/meson --version)&quot;<br>
<br>
At the end of the series, here&#39;s what happens if i change the meson<br>
requirement to a fictionally too-high version that would be impossible<br>
to fulfill:<br>
<br>
---------------------------------------------------------------------------=
-----<br>
jsnow@scv ~/s/q/b/git (python-configure-venv)&gt; ../../configure<br>
--enable-debug --disable-pypi;<br>
python determined to be &#39;/usr/bin/python3&#39;<br>
python version: Python 3.11.2<br>
MKVENV pyvenv<br>
MKVENV ensure meson&gt;=3D2.61.5<br>
ERROR: Could not find a version that satisfies the requirement<br>
meson&gt;=3D2.61.5 (from versions: none)<br>
ERROR: No matching distribution found for meson&gt;=3D2.61.5<br>
<br>
*** Ouch! ***<br></blockquote><div><br></div><div>Oh, that&#39;s enough :) =
:) thanks! I&#39;d be happy with less...</div><div><br></div><div>Warner</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Could not ensure availability of &#39;meson&gt;=3D2.61.5&#39;:<br>
=C2=A0=E2=80=A2 Python package &#39;meson&#39; version &#39;1.0.1&#39; was =
found, but isn&#39;t suitable.<br>
=C2=A0=E2=80=A2 No suitable version found in, or failed to install from<br>
&#39;/home/jsnow/src/qemu/python/wheels&#39;.<br>
=C2=A0=E2=80=A2 mkvenv was configured to operate offline and did not check =
PyPI.<br>
---------------------------------------------------------------------------=
-----<br>
<br>
</blockquote></div></div>

--000000000000cc707d05fa1b92da--

