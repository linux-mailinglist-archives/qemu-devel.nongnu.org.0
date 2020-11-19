Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F22B9035
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:37:44 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhJv-0006g2-9T
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfhGh-0003pL-Qk
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:34:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfhGf-00084i-Bf
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:34:23 -0500
Received: by mail-wm1-x343.google.com with SMTP id 10so6673958wml.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 02:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=DbTNT2HKBABTTlsxh21pDy0s/tMrYefbfpvpZ3DZ30U=;
 b=AO8rP/EwST8hdlHq56nX5T6hYkcGmlFARXujJ4ZgZDl8ZU7Xs4zZJ+QXstKdc7ZJjq
 HjXRoklmoQkqo1+184R4WJQ0vmuM0VFojTo1Kzyt169HkorzgvNHzaXTyGFalk+s3+im
 CO/+roR3aUK6OaqAoaq8dFbT7d9g1o2sP1S11/3xN/xU1uAHtjckz7iXw5rDywOvvOLQ
 AJ0KGe6mc2ipLm7OExPEwR2P49gITL1zvX5RfoGYh/HNNKv5KIZ9uBbWhzmXgAeYSpas
 p7MKV7U+XxLjWlf254fPkUCtoLJ7anBVvMqOFpZ9/c+QIvuKT9fvN2DWnFIuufyjcSDa
 PRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=DbTNT2HKBABTTlsxh21pDy0s/tMrYefbfpvpZ3DZ30U=;
 b=eIKLXNxbyYps4QufOD14iuhynt1UkKXZLGRj5STXpHIlQANn3TM/cDEzPO1nee8bKS
 KD5PBX5XesZc2Yy35xsO1aG1R8Ioju3gUKWt2YiaxEXT273j6ZFKhacihQYTu5DAgQCF
 rlTpkzII8U9RpAW/aUyFMKysIK1TfgdOou846iM3p0InKcbUF+uaMKeojFanNFFclT8P
 UQp7mURyhPmKvpvS7huONo/INF1u4Hbl6XxHDLncwa1YGhcBP2bx+OXpiYnx2hAH6uYt
 tzgv4QkTn2eqUs/UHqwFneEI2YmlhizNVcoj6YrZ+lMFm8JjhN0mv4ZVXcklTmE8kPT/
 ksvA==
X-Gm-Message-State: AOAM533a3UU2v1qOdT3MoIKMcjuPRqIJAi0F1vTTBFhKfskR0nwtMHb/
 WBxDaB1ud4q4+hS4LaxrC/Czvw==
X-Google-Smtp-Source: ABdhPJyPUwdpuUxYJEuBTVmxLqeKLYutmF+XX84GY/FMTByhbkAb1r9+IqLdM7mTCN2VNV5Ud63a8g==
X-Received: by 2002:a1c:a9c4:: with SMTP id s187mr3884558wme.180.1605782059404; 
 Thu, 19 Nov 2020 02:34:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u85sm9346471wmu.43.2020.11.19.02.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:34:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 861B81FF7E;
 Thu, 19 Nov 2020 10:34:17 +0000 (GMT)
References: <20201116113046.11362-1-acho@suse.com>
 <20201117065719.30150-1-acho@suse.com>
 <877a38a0-0f39-eba7-618a-658f16fe56bc@redhat.com>
 <d225bed3fbd208b305cf79d7a8c5e108db53e655.camel@suse.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: AL Yu-Chen Cho <acho@suse.com>
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
In-reply-to: <d225bed3fbd208b305cf79d7a8c5e108db53e655.camel@suse.com>
Date: Thu, 19 Nov 2020 10:34:17 +0000
Message-ID: <87wnyhvdna.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, lyan@suse.com, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, wainersm@redhat.com, brogers@suse.com, cfontana@suse.de,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


AL Yu-Chen Cho <acho@suse.com> writes:

> On Tue, 2020-11-17 at 12:51 +0100, Thomas Huth wrote:
>> On 17/11/2020 07.57, Cho, Yu-Chen wrote:
>> > Add build-system-opensuse jobs and add opensuse-leap.docker
>> > dockerfile.
>> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
>> >=20
>> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>> > ---
>> >  .gitlab-ci.d/containers.yml                   |  5 ++
>> >  .gitlab-ci.yml                                | 30 +++++++
>> >  tests/docker/dockerfiles/opensuse-leap.docker | 88
>> > +++++++++++++++++++
>> >  3 files changed, 123 insertions(+)
>> >  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
>> >=20
>> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-
>> > ci.d/containers.yml
>> > index 11d079ea58..082624a6fa 100644
>> > --- a/.gitlab-ci.d/containers.yml
>> > +++ b/.gitlab-ci.d/containers.yml
>> > @@ -246,3 +246,8 @@ amd64-ubuntu-container:
>> >    <<: *container_job_definition
>> >    variables:
>> >      NAME: ubuntu
>> > +
>> > +amd64-opensuse-leap-container:
>> > +  <<: *container_job_definition
>> > +  variables:
>> > +    NAME: opensuse-leap
>> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> > index 9a8b375188..bf4759296a 100644
>> > --- a/.gitlab-ci.yml
>> > +++ b/.gitlab-ci.yml
>> > @@ -195,6 +195,36 @@ acceptance-system-centos:
>> >      MAKE_CHECK_ARGS: check-acceptance
>> >    <<: *acceptance_definition
>> >=20=20
>> > +build-system-opensuse:
>> > +  <<: *native_build_job_definition
>> > +  variables:
>> > +    IMAGE: opensuse-leap
>> > +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
>> > +    MAKE_CHECK_ARGS: check-build
>> > +  artifacts:
>> > +    expire_in: 2 days
>> > +    paths:
>> > +      - build
>> > +
>> > +check-system-opensuse:
>> > +  <<: *native_test_job_definition
>> > +  needs:
>> > +    - job: build-system-opensuse
>> > +      artifacts: true
>> > +  variables:
>> > +    IMAGE: opensuse-leap
>> > +    MAKE_CHECK_ARGS: check
>> > +
>> > +acceptance-system-opensuse:
>> > +  <<: *native_test_job_definition
>> > +  needs:
>> > +    - job: build-system-opensuse
>> > +      artifacts: true
>> > +  variables:
>> > +    IMAGE: opensuse-leap
>> > +    MAKE_CHECK_ARGS: check-acceptance
>> > +  <<: *acceptance_definition
>> > +
>> >  build-disabled:
>> >    <<: *native_build_job_definition
>> >    variables:
>> > diff --git a/tests/docker/dockerfiles/opensuse-leap.docker
>> > b/tests/docker/dockerfiles/opensuse-leap.docker
>> > new file mode 100644
>> > index 0000000000..712eb4fe3a
>> > --- /dev/null
>> > +++ b/tests/docker/dockerfiles/opensuse-leap.docker
>> > @@ -0,0 +1,88 @@
>> > +FROM opensuse/leap:15.2
>> > +
>> > +RUN zypper update -y
>> > +
>> > +# Please keep this list sorted alphabetically
>> > +ENV PACKAGES \
>> > +    bc \
>> > +    brlapi-devel \
>> > +    bzip2 \
>> > +    libzip-devel \
>> > +    ccache \
>> > +    clang \
>> > +    cyrus-sasl-devel \
>> > +    dbus-1 \
>> > +    device-mapper-devel \
>> > +    gcc \
>> > +    gcc-c++ \
>> > +    mkisofs \
>> > +    gettext-runtime \
>> > +    git \
>> > +    glib2-devel \
>> > +    glusterfs-devel \
>> > +    libgnutls-devel \
>> > +    gtk3-devel \
>> > +    hostname \
>> > +    libaio-devel \
>> > +    libasan5 \
>> > +    libattr-devel \
>> > +    libblockdev-devel \
>> > +    libcap-ng-devel \
>> > +    libcurl-devel \
>> > +    libepoxy-devel \
>> > +    libfdt-devel \
>> > +    libiscsi-devel \
>> > +    libjpeg8-devel \
>> > +    libpmem-devel \
>> > +    libpng16-devel \
>> > +    librbd-devel \
>> > +    libseccomp-devel \
>> > +    libssh-devel \
>> > +    libubsan0 \
>> > +    libudev-devel \
>> > +    libxml2-devel \
>> > +    libzstd-devel \
>> > +    llvm \
>> > +    lzo-devel \
>> > +    make \
>> > +    mingw32-filesystem \
>> > +    glibc-devel-32bit \
>> > +    libSDL2_image-devel \
>> > +    mingw64-binutils \
>> > +    nmap \
>> > +    ncat \
>> > +    ncurses-devel \
>> > +    libnettle-devel \
>> > +    ninja \
>> > +    mozilla-nss-devel \
>> > +    libnuma-devel \
>> > +    perl \
>> > +    libpixman-1-0-devel \
>> > +    python3-base \
>> > +    python3-PyYAML \
>> > +    python3-numpy \
>> > +    python3-opencv \
>> > +    python3-Pillow \
>> > +    python3-pip \
>> > +    python3-Sphinx \
>> > +    python3-virtualenv \
>> > +    rdma-core-devel \
>> > +    libSDL2-devel \
>> > +    snappy-devel \
>> > +    sparse \
>> > +    libspice-server-devel \
>> > +    systemd-devel \
>> > +    systemtap-sdt-devel \
>> > +    tar \
>> > +    tesseract-ocr \
>> > +    tesseract-ocr-traineddata-english \
>> > +    usbredir-devel \
>> > +    virglrenderer-devel \
>> > +    libvte-2_91-0 \
>> > +    which \
>> > +    xen-devel \
>> > +    zlib-devel
>> > +ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
>> > +
>> > +RUN zypper  --non-interactive install -y $PACKAGES
>> > +RUN rpm -q $PACKAGES | sort > /packages.txt
>>=20
>> Thanks, I gave it a try now and it seems to work fine so far ... but
>> the
>> initial creation of the container was quite slow, 28 minutes, that's
>> quite a
>> bit more from what I've seen with the other containers so far:
>>=20
>>  https://gitlab.com/huth/qemu/-/jobs/853630446
>>=20
>> (other containers took e.g. only 10 minutes like
>> https://gitlab.com/huth/qemu/-/jobs/853630446 or 15 minutes like
>> https://gitlab.com/qemu-project/qemu/-/jobs/812284100)
>>=20
>> Did I maybe just hit a bad point in time?
>>=20
>
> No, Thanks for your suggestion, I think I can decrease the docker build
> duration.
>
>
>> Or would it make sense to trim the list of packages that need to be
>> installed?
>
> yes, I already started to trim, will submit v2 sson.
>
>>=20
>> For example, unless you want to test m68k-softmmu in this container,
>> too,
>> you don't need tesseract-ocr.
>>=20
>> And why do you need mozilla-nss-devel ?
>>=20
>> And I think you could also drop the mingw packages for now, unless
>> you want
>> to cross-compile some Windows binaries with this container?
>>=20
>
> yes, no problem. The origin plan is add some cross-compiler after this
> patch, and that I am not sure which one way to add it is that best (
> and that would not use the resource to create the docker image again.
> but I think I should patch it later.

I'd keep the focus on building the specific OpenSUSE binaries. We have
pretty good cross compiler support from Debian already so unless
OpenSUSE packages some architectures we don't already have covered then
I would suggest keeping it light. Even in the Debian case we layer the
images so each cross compiler shares a common light base and not a full
featured build everything image.

--=20
Alex Benn=C3=A9e

