Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DEF4447C9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:53:53 +0100 (CET)
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miKSO-0004YE-DH
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miKQx-0000nw-6E
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miKQn-0001XU-6C
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635961931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eGxdh6ufTrtoGXP6l+rjZcjDFbK8ePV8C//h+DDPFo8=;
 b=DhL9TmV46ELfMcFpc1dmpxjSDjQPnPpRo4I7XHiUw1LwGDnzpun6IveRZY/O2/QpwIp1Cu
 120XL7pl25HeDFOPFdFgfdvOZzRjAdVEx6HhsWrSgy7XwvF1vOyw/3Zvj1m5GL/+dJtsg7
 IxIOZ9GoKd4ZatXaofFTt7AFLwQ2M4c=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-I4Rl5MLYOvCmL55T4GvhhQ-1; Wed, 03 Nov 2021 13:52:03 -0400
X-MC-Unique: I4Rl5MLYOvCmL55T4GvhhQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 p144-20020a1fbf96000000b002eb82e0e8cfso1263204vkf.18
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eGxdh6ufTrtoGXP6l+rjZcjDFbK8ePV8C//h+DDPFo8=;
 b=eUWLiETn/6n9TCH45ClN/dI++FpfG/yWswf9MaH85lZLEwl2Ar+0/vaSACTxCx2QQw
 NcIFLJLBJvxizHhoibdXewVqEa//ufVMCqTLqutj0F5HEeyrNSWDSwaLlPOWJmAvKkYC
 OnuLttznueeY4irAMn7j5zIUGx7hAk+ZdwJPB+AHpvl2B4EML8nf+iUh+dlBLFs2HOLK
 gYTZbH1tsm+Za23oM8rN2LBd+qHIXFOr319JhDxrrMPtrGIyJy+gNCsCTUJy3Y8NDN0k
 SYp+1wpVZbkyoeS9PkfseI9LCNCdmUihgdgyt6eoONwfgkBig2khCnhoaeDdH0gyefjV
 LvzQ==
X-Gm-Message-State: AOAM530NbcwG9vaO2s4O7HBNDImJrYAmXmFVURgGMR5M/GUJe9IpbVa/
 grrYlo6eBT26cjYk/7Pavfd57hEYlL00cSNctBQp31n/k2CncK/kZ/7r1LV2P2Nd7UlMEBzUIe6
 MI+4Ic3WEkxWUS+X5gzbsrtVHiTGodj8=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr53694851vsp.40.1635961922757; 
 Wed, 03 Nov 2021 10:52:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjdY/laRJckPOgB46caJwpU0vE3uSAGLno8x0duNU8l58CR+/+/TUOHIdo+oLWOTZ5eu77F8/lP1gC1u1HMt4=
X-Received: by 2002:a67:ed07:: with SMTP id l7mr53694806vsp.40.1635961922509; 
 Wed, 03 Nov 2021 10:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-7-jsnow@redhat.com>
 <YYK/2WugmOrTA+62@redhat.com>
In-Reply-To: <YYK/2WugmOrTA+62@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 3 Nov 2021 13:51:51 -0400
Message-ID: <CAFn=p-Z4ic6=LWdRCjgtYYO2crQbw8=aCgLrbkTwW-5X2=O4iA@mail.gmail.com>
Subject: Re: [PATCH 6/6] docker: Add Fedora 35 container
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000041ee2305cfe61199"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000041ee2305cfe61199
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2021 at 1:01 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Wed, Nov 03, 2021 at 10:48:44AM -0400, John Snow wrote:
> > Or, more accurately, update our current Fedora container to Fedora 35,
> > and then add a new fedora34 container and build test.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  .gitlab-ci.d/buildtest.yml               |  16 ++++
> >  .gitlab-ci.d/container-core.yml          |   5 +
> >  tests/docker/dockerfiles/fedora.docker   |   2 +-
> >  tests/docker/dockerfiles/fedora34.docker | 117 +++++++++++++++++++++++
>
> We already struggle with having too much work in the CI pipeline
> and will be in trouble when they start enforcing CI limits.
>
> With that in mind I'm not sure that having both Fedora versions
> brings large enough benefit to justify the CI CPU time burnt.
>
>
Fair. I'd say having stuff like ubuntu21.10 is more important than having
both f34/f35. I have a keen interest on pushing forward into bleeding edge
releases to identify potential issues sooner rather than later; and can
generally trust that the older releases are well traveled through
developer's personal machines.


> If we did want both versions though, we should be consistent
> with file naming - ie fedora35.dockre, not fedora.docker
> to match fedora34.docker.
>
>
OK. I was originally considering the "unversioned" file to be the "most
recent one" that would update on a rolling schedule. On IRC you made a good
point that when we fork a stable branch, we actually don't want this
behavior. Explicit naming is therefore the best policy.

I am still somewhat interested in having the F34 image, but we don't need
it on the CI platform right now. Maybe it could be included later on as a
target of lesser value to only be run occasionally, but I can worry about
that a little later.


> >  4 files changed, 139 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/docker/dockerfiles/fedora34.docker
> >
> > diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> > index 5c378e35f9..9d9330b646 100644
> > --- a/.gitlab-ci.d/buildtest.yml
> > +++ b/.gitlab-ci.d/buildtest.yml
> > @@ -100,6 +100,22 @@ acceptance-system-debian:
> >      IMAGE: debian-amd64
> >      MAKE_CHECK_ARGS: check-acceptance
> >
> > +build-system-fedora34:
> > +  extends: .native_build_job_template
> > +  needs:
> > +    job: amd64-fedora34-container
> > +  variables:
> > +    IMAGE: fedora34
> > +    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
> > +             --enable-fdt=3Dsystem --enable-slirp=3Dsystem
> --enable-capstone=3Dsystem
> > +    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
> > +      xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu
> sparc64-softmmu
> > +    MAKE_CHECK_ARGS: check-build
> > +  artifacts:
> > +    expire_in: 2 days
> > +    paths:
> > +      - build
> > +
> >  build-system-fedora:
> >    extends: .native_build_job_template
> >    needs:
> > diff --git a/.gitlab-ci.d/container-core.yml
> b/.gitlab-ci.d/container-core.yml
> > index e8dd1f476a..96a71e88ff 100644
> > --- a/.gitlab-ci.d/container-core.yml
> > +++ b/.gitlab-ci.d/container-core.yml
> > @@ -6,6 +6,11 @@ amd64-centos8-container:
> >    variables:
> >      NAME: centos8
> >
> > +amd64-fedora34-container:
> > +  extends: .container_job_template
> > +  variables:
> > +    NAME: fedora34
> > +
> >  amd64-fedora-container:
> >    extends: .container_job_template
> >    variables:
> > diff --git a/tests/docker/dockerfiles/fedora.docker
> b/tests/docker/dockerfiles/fedora.docker
> > index 44d7f12110..24aca97cd7 100644
> > --- a/tests/docker/dockerfiles/fedora.docker
> > +++ b/tests/docker/dockerfiles/fedora.docker
> > @@ -1,4 +1,4 @@
> > -FROM registry.fedoraproject.org/fedora:34
> > +FROM registry.fedoraproject.org/fedora:35
> >
> >  # Please keep this list sorted alphabetically
> >  ENV PACKAGES \
> > diff --git a/tests/docker/dockerfiles/fedora34.docker
> b/tests/docker/dockerfiles/fedora34.docker
> > new file mode 100644
> > index 0000000000..44d7f12110
> > --- /dev/null
> > +++ b/tests/docker/dockerfiles/fedora34.docker
> > @@ -0,0 +1,117 @@
> > +FROM registry.fedoraproject.org/fedora:34
> > +
> > +# Please keep this list sorted alphabetically
> > +ENV PACKAGES \
> > +    SDL2-devel \
> > +    SDL2_image-devel \
> > +    alsa-lib-devel \
> > +    bc \
> > +    brlapi-devel \
> > +    bzip2 \
> > +    bzip2-devel \
> > +    ca-certificates \
> > +    capstone-devel \
> > +    ccache \
> > +    clang \
> > +    ctags \
> > +    cyrus-sasl-devel \
> > +    daxctl-devel \
> > +    dbus-daemon \
> > +    device-mapper-multipath-devel \
> > +    diffutils \
> > +    findutils \
> > +    gcc \
> > +    gcc-c++ \
> > +    gcovr \
> > +    genisoimage \
> > +    gettext \
> > +    git \
> > +    glib2-devel \
> > +    glibc-langpack-en \
> > +    glibc-static \
> > +    glusterfs-api-devel \
> > +    gnutls-devel \
> > +    gtk3-devel \
> > +    hostname \
> > +    jemalloc-devel \
> > +    libaio-devel \
> > +    libasan \
> > +    libattr-devel \
> > +    libbpf-devel \
> > +    libcacard-devel \
> > +    libcap-ng-devel \
> > +    libcurl-devel \
> > +    libdrm-devel \
> > +    libepoxy-devel \
> > +    libfdt-devel \
> > +    libffi-devel \
> > +    libgcrypt-devel \
> > +    libiscsi-devel \
> > +    libjpeg-devel \
> > +    libnfs-devel \
> > +    libpmem-devel \
> > +    libpng-devel \
> > +    librbd-devel \
> > +    libseccomp-devel \
> > +    libslirp-devel \
> > +    libssh-devel \
> > +    libtasn1-devel \
> > +    libubsan \
> > +    libudev-devel \
> > +    liburing-devel \
> > +    libusbx-devel \
> > +    libxml2-devel \
> > +    libzstd-devel \
> > +    llvm \
> > +    lttng-ust-devel \
> > +    lzo-devel \
> > +    make \
> > +    mesa-libgbm-devel \
> > +    meson \
> > +    ncurses-devel \
> > +    nettle-devel \
> > +    ninja-build \
> > +    nmap-ncat \
> > +    numactl-devel \
> > +    openssh-clients \
> > +    pam-devel \
> > +    perl-Test-Harness \
> > +    perl-base \
> > +    pixman-devel \
> > +    pkgconfig \
> > +    pulseaudio-libs-devel \
> > +    python3 \
> > +    python3-PyYAML \
> > +    python3-numpy \
> > +    python3-opencv \
> > +    python3-pillow \
> > +    python3-pip \
> > +    python3-sphinx \
> > +    python3-sphinx_rtd_theme \
> > +    python3-virtualenv \
> > +    rdma-core-devel \
> > +    rpm \
> > +    sed \
> > +    snappy-devel \
> > +    sparse \
> > +    spice-protocol \
> > +    spice-server-devel \
> > +    systemd-devel \
> > +    systemtap-sdt-devel \
> > +    tar \
> > +    tesseract \
> > +    tesseract-langpack-eng \
> > +    texinfo \
> > +    usbredir-devel \
> > +    util-linux \
> > +    virglrenderer-devel \
> > +    vte291-devel \
> > +    which \
> > +    xen-devel \
> > +    xfsprogs-devel \
> > +    zlib-devel
> > +ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3
> > +
> > +RUN dnf install -y $PACKAGES
> > +RUN rpm -q $PACKAGES | sort > /packages.txt
> > +ENV PATH $PATH:/usr/libexec/python3-sphinx/
> > --
> > 2.31.1
> >
>
> Regards,
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

--00000000000041ee2305cfe61199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 1:01 PM Daniel P. =
Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Wed, Nov 03, 2021 at 10:48:44AM -0400, John Snow wrote:<br>
&gt; Or, more accurately, update our current Fedora container to Fedora 35,=
<br>
&gt; and then add a new fedora34 container and build test.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .gitlab-ci.d/buildtest.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 16 ++++<br>
&gt;=C2=A0 .gitlab-ci.d/container-core.yml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 tests/docker/dockerfiles/fedora.docker=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 tests/docker/dockerfiles/fedora34.docker | 117 +++++++++++++++++=
++++++<br>
<br>
We already struggle with having too much work in the CI pipeline<br>
and will be in trouble when they start enforcing CI limits.<br>
<br>
With that in mind I&#39;m not sure that having both Fedora versions<br>
brings large enough benefit to justify the CI CPU time burnt.<br>
<br></blockquote><div><br></div><div>Fair. I&#39;d say having stuff like ub=
untu21.10 is more important than having both f34/f35. I have a keen interes=
t on pushing forward into bleeding edge releases to identify potential issu=
es sooner rather than later; and can generally trust that the older release=
s are well traveled through developer&#39;s personal machines.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
If we did want both versions though, we should be consistent<br>
with file naming - ie fedora35.dockre, not fedora.docker<br>
to match fedora34.docker.<br>
<br></blockquote><div><br></div><div>OK. I was originally considering the &=
quot;unversioned&quot; file to be the &quot;most recent one&quot; that woul=
d update on a rolling schedule. On IRC you made a good point that when we f=
ork a stable branch, we actually don&#39;t want this behavior. Explicit nam=
ing is therefore the best policy.</div></div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">I am still somewhat interested in having =
the F34 image, but we don&#39;t need it on the CI platform right now. Maybe=
 it could be included later on as a target of lesser value to only be run o=
ccasionally, but I can worry about that a little later.<br></div><div class=
=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;=C2=A0 4 files changed, 139 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 tests/docker/dockerfiles/fedora34.docker<br>
&gt; <br>
&gt; diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml<b=
r>
&gt; index 5c378e35f9..9d9330b646 100644<br>
&gt; --- a/.gitlab-ci.d/buildtest.yml<br>
&gt; +++ b/.gitlab-ci.d/buildtest.yml<br>
&gt; @@ -100,6 +100,22 @@ acceptance-system-debian:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IMAGE: debian-amd64<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MAKE_CHECK_ARGS: check-acceptance<br>
&gt;=C2=A0 <br>
&gt; +build-system-fedora34:<br>
&gt; +=C2=A0 extends: .native_build_job_template<br>
&gt; +=C2=A0 needs:<br>
&gt; +=C2=A0 =C2=A0 job: amd64-fedora34-container<br>
&gt; +=C2=A0 variables:<br>
&gt; +=C2=A0 =C2=A0 IMAGE: fedora34<br>
&gt; +=C2=A0 =C2=A0 CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enab=
le-docs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-fdt=3Dsystem=
 --enable-slirp=3Dsystem --enable-capstone=3Dsystem<br>
&gt; +=C2=A0 =C2=A0 TARGETS: tricore-softmmu microblaze-softmmu mips-softmm=
u<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-=
softmmu sparc64-softmmu<br>
&gt; +=C2=A0 =C2=A0 MAKE_CHECK_ARGS: check-build<br>
&gt; +=C2=A0 artifacts:<br>
&gt; +=C2=A0 =C2=A0 expire_in: 2 days<br>
&gt; +=C2=A0 =C2=A0 paths:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 - build<br>
&gt; +<br>
&gt;=C2=A0 build-system-fedora:<br>
&gt;=C2=A0 =C2=A0 extends: .native_build_job_template<br>
&gt;=C2=A0 =C2=A0 needs:<br>
&gt; diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-=
core.yml<br>
&gt; index e8dd1f476a..96a71e88ff 100644<br>
&gt; --- a/.gitlab-ci.d/container-core.yml<br>
&gt; +++ b/.gitlab-ci.d/container-core.yml<br>
&gt; @@ -6,6 +6,11 @@ amd64-centos8-container:<br>
&gt;=C2=A0 =C2=A0 variables:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NAME: centos8<br>
&gt;=C2=A0 <br>
&gt; +amd64-fedora34-container:<br>
&gt; +=C2=A0 extends: .container_job_template<br>
&gt; +=C2=A0 variables:<br>
&gt; +=C2=A0 =C2=A0 NAME: fedora34<br>
&gt; +<br>
&gt;=C2=A0 amd64-fedora-container:<br>
&gt;=C2=A0 =C2=A0 extends: .container_job_template<br>
&gt;=C2=A0 =C2=A0 variables:<br>
&gt; diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/doc=
kerfiles/fedora.docker<br>
&gt; index 44d7f12110..24aca97cd7 100644<br>
&gt; --- a/tests/docker/dockerfiles/fedora.docker<br>
&gt; +++ b/tests/docker/dockerfiles/fedora.docker<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -FROM <a href=3D"http://registry.fedoraproject.org/fedora:34" rel=3D"n=
oreferrer" target=3D"_blank">registry.fedoraproject.org/fedora:34</a><br>
&gt; +FROM <a href=3D"http://registry.fedoraproject.org/fedora:35" rel=3D"n=
oreferrer" target=3D"_blank">registry.fedoraproject.org/fedora:35</a><br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Please keep this list sorted alphabetically<br>
&gt;=C2=A0 ENV PACKAGES \<br>
&gt; diff --git a/tests/docker/dockerfiles/fedora34.docker b/tests/docker/d=
ockerfiles/fedora34.docker<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..44d7f12110<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/docker/dockerfiles/fedora34.docker<br>
&gt; @@ -0,0 +1,117 @@<br>
&gt; +FROM <a href=3D"http://registry.fedoraproject.org/fedora:34" rel=3D"n=
oreferrer" target=3D"_blank">registry.fedoraproject.org/fedora:34</a><br>
&gt; +<br>
&gt; +# Please keep this list sorted alphabetically<br>
&gt; +ENV PACKAGES \<br>
&gt; +=C2=A0 =C2=A0 SDL2-devel \<br>
&gt; +=C2=A0 =C2=A0 SDL2_image-devel \<br>
&gt; +=C2=A0 =C2=A0 alsa-lib-devel \<br>
&gt; +=C2=A0 =C2=A0 bc \<br>
&gt; +=C2=A0 =C2=A0 brlapi-devel \<br>
&gt; +=C2=A0 =C2=A0 bzip2 \<br>
&gt; +=C2=A0 =C2=A0 bzip2-devel \<br>
&gt; +=C2=A0 =C2=A0 ca-certificates \<br>
&gt; +=C2=A0 =C2=A0 capstone-devel \<br>
&gt; +=C2=A0 =C2=A0 ccache \<br>
&gt; +=C2=A0 =C2=A0 clang \<br>
&gt; +=C2=A0 =C2=A0 ctags \<br>
&gt; +=C2=A0 =C2=A0 cyrus-sasl-devel \<br>
&gt; +=C2=A0 =C2=A0 daxctl-devel \<br>
&gt; +=C2=A0 =C2=A0 dbus-daemon \<br>
&gt; +=C2=A0 =C2=A0 device-mapper-multipath-devel \<br>
&gt; +=C2=A0 =C2=A0 diffutils \<br>
&gt; +=C2=A0 =C2=A0 findutils \<br>
&gt; +=C2=A0 =C2=A0 gcc \<br>
&gt; +=C2=A0 =C2=A0 gcc-c++ \<br>
&gt; +=C2=A0 =C2=A0 gcovr \<br>
&gt; +=C2=A0 =C2=A0 genisoimage \<br>
&gt; +=C2=A0 =C2=A0 gettext \<br>
&gt; +=C2=A0 =C2=A0 git \<br>
&gt; +=C2=A0 =C2=A0 glib2-devel \<br>
&gt; +=C2=A0 =C2=A0 glibc-langpack-en \<br>
&gt; +=C2=A0 =C2=A0 glibc-static \<br>
&gt; +=C2=A0 =C2=A0 glusterfs-api-devel \<br>
&gt; +=C2=A0 =C2=A0 gnutls-devel \<br>
&gt; +=C2=A0 =C2=A0 gtk3-devel \<br>
&gt; +=C2=A0 =C2=A0 hostname \<br>
&gt; +=C2=A0 =C2=A0 jemalloc-devel \<br>
&gt; +=C2=A0 =C2=A0 libaio-devel \<br>
&gt; +=C2=A0 =C2=A0 libasan \<br>
&gt; +=C2=A0 =C2=A0 libattr-devel \<br>
&gt; +=C2=A0 =C2=A0 libbpf-devel \<br>
&gt; +=C2=A0 =C2=A0 libcacard-devel \<br>
&gt; +=C2=A0 =C2=A0 libcap-ng-devel \<br>
&gt; +=C2=A0 =C2=A0 libcurl-devel \<br>
&gt; +=C2=A0 =C2=A0 libdrm-devel \<br>
&gt; +=C2=A0 =C2=A0 libepoxy-devel \<br>
&gt; +=C2=A0 =C2=A0 libfdt-devel \<br>
&gt; +=C2=A0 =C2=A0 libffi-devel \<br>
&gt; +=C2=A0 =C2=A0 libgcrypt-devel \<br>
&gt; +=C2=A0 =C2=A0 libiscsi-devel \<br>
&gt; +=C2=A0 =C2=A0 libjpeg-devel \<br>
&gt; +=C2=A0 =C2=A0 libnfs-devel \<br>
&gt; +=C2=A0 =C2=A0 libpmem-devel \<br>
&gt; +=C2=A0 =C2=A0 libpng-devel \<br>
&gt; +=C2=A0 =C2=A0 librbd-devel \<br>
&gt; +=C2=A0 =C2=A0 libseccomp-devel \<br>
&gt; +=C2=A0 =C2=A0 libslirp-devel \<br>
&gt; +=C2=A0 =C2=A0 libssh-devel \<br>
&gt; +=C2=A0 =C2=A0 libtasn1-devel \<br>
&gt; +=C2=A0 =C2=A0 libubsan \<br>
&gt; +=C2=A0 =C2=A0 libudev-devel \<br>
&gt; +=C2=A0 =C2=A0 liburing-devel \<br>
&gt; +=C2=A0 =C2=A0 libusbx-devel \<br>
&gt; +=C2=A0 =C2=A0 libxml2-devel \<br>
&gt; +=C2=A0 =C2=A0 libzstd-devel \<br>
&gt; +=C2=A0 =C2=A0 llvm \<br>
&gt; +=C2=A0 =C2=A0 lttng-ust-devel \<br>
&gt; +=C2=A0 =C2=A0 lzo-devel \<br>
&gt; +=C2=A0 =C2=A0 make \<br>
&gt; +=C2=A0 =C2=A0 mesa-libgbm-devel \<br>
&gt; +=C2=A0 =C2=A0 meson \<br>
&gt; +=C2=A0 =C2=A0 ncurses-devel \<br>
&gt; +=C2=A0 =C2=A0 nettle-devel \<br>
&gt; +=C2=A0 =C2=A0 ninja-build \<br>
&gt; +=C2=A0 =C2=A0 nmap-ncat \<br>
&gt; +=C2=A0 =C2=A0 numactl-devel \<br>
&gt; +=C2=A0 =C2=A0 openssh-clients \<br>
&gt; +=C2=A0 =C2=A0 pam-devel \<br>
&gt; +=C2=A0 =C2=A0 perl-Test-Harness \<br>
&gt; +=C2=A0 =C2=A0 perl-base \<br>
&gt; +=C2=A0 =C2=A0 pixman-devel \<br>
&gt; +=C2=A0 =C2=A0 pkgconfig \<br>
&gt; +=C2=A0 =C2=A0 pulseaudio-libs-devel \<br>
&gt; +=C2=A0 =C2=A0 python3 \<br>
&gt; +=C2=A0 =C2=A0 python3-PyYAML \<br>
&gt; +=C2=A0 =C2=A0 python3-numpy \<br>
&gt; +=C2=A0 =C2=A0 python3-opencv \<br>
&gt; +=C2=A0 =C2=A0 python3-pillow \<br>
&gt; +=C2=A0 =C2=A0 python3-pip \<br>
&gt; +=C2=A0 =C2=A0 python3-sphinx \<br>
&gt; +=C2=A0 =C2=A0 python3-sphinx_rtd_theme \<br>
&gt; +=C2=A0 =C2=A0 python3-virtualenv \<br>
&gt; +=C2=A0 =C2=A0 rdma-core-devel \<br>
&gt; +=C2=A0 =C2=A0 rpm \<br>
&gt; +=C2=A0 =C2=A0 sed \<br>
&gt; +=C2=A0 =C2=A0 snappy-devel \<br>
&gt; +=C2=A0 =C2=A0 sparse \<br>
&gt; +=C2=A0 =C2=A0 spice-protocol \<br>
&gt; +=C2=A0 =C2=A0 spice-server-devel \<br>
&gt; +=C2=A0 =C2=A0 systemd-devel \<br>
&gt; +=C2=A0 =C2=A0 systemtap-sdt-devel \<br>
&gt; +=C2=A0 =C2=A0 tar \<br>
&gt; +=C2=A0 =C2=A0 tesseract \<br>
&gt; +=C2=A0 =C2=A0 tesseract-langpack-eng \<br>
&gt; +=C2=A0 =C2=A0 texinfo \<br>
&gt; +=C2=A0 =C2=A0 usbredir-devel \<br>
&gt; +=C2=A0 =C2=A0 util-linux \<br>
&gt; +=C2=A0 =C2=A0 virglrenderer-devel \<br>
&gt; +=C2=A0 =C2=A0 vte291-devel \<br>
&gt; +=C2=A0 =C2=A0 which \<br>
&gt; +=C2=A0 =C2=A0 xen-devel \<br>
&gt; +=C2=A0 =C2=A0 xfsprogs-devel \<br>
&gt; +=C2=A0 =C2=A0 zlib-devel<br>
&gt; +ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3<br>
&gt; +<br>
&gt; +RUN dnf install -y $PACKAGES<br>
&gt; +RUN rpm -q $PACKAGES | sort &gt; /packages.txt<br>
&gt; +ENV PATH $PATH:/usr/libexec/python3-sphinx/<br>
&gt; -- <br>
&gt; 2.31.1<br>
&gt; <br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--00000000000041ee2305cfe61199--


