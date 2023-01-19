Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69F6738A1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:33:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU6M-0004ds-L6; Thu, 19 Jan 2023 07:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIU67-0004YU-Rz
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:32:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIU65-0006xq-R3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:32:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so3493757wmb.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMEUPjfasxAc60rZWHjW3v5qxRstoh1lR6GXd8bg7Co=;
 b=Evi77/4/Guypnx8MU6sxsSOhv8F4XkiVPHt88qk9isxbJagjrFm8tvHqVJmkRo5Wek
 O1Wq7ouTW+v1dZ4J6iLZWYOkaPuQD0BTsEo8MnwnuX/sgxekwxLmryf/ZNztf+DTJgDy
 9xqZ4dZvO7Mil019wjypp/KZ+WrUEoo3HjC2AwMcHhIiqPd8AQYOf0Hde9SGjBu23yab
 bqPDZa/3j9U20G7393EMUT5ey5eoLxSq/YZq00MgHZ4ihb/DYUiP5+mX5+F6jEoHCmCZ
 PGWzNh12wUe+hEofBGPdqGxPeoG0tNqYXXtMNAJBkodBN2+QkGWTb6+foCPxfhJUjK6c
 kMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XMEUPjfasxAc60rZWHjW3v5qxRstoh1lR6GXd8bg7Co=;
 b=n+nZRroH8tGE+n7/y3gTF4Husu1YPTvF26Ds0dEpUtKco6kldXOcShVwglg4qNXiHY
 /sqqm5qfBC+jXoZD9rZUhin5/SjVaYsCTbwHYUsCaWKwx9NW1hsY/HNCqeVTzAjF0fq7
 CpJxStpSOdPxMD2FiYXg42Y2qITUwIjkThio1JKZLTJFC/C6Plp8adbMq4mxcZHJaX8P
 Ny0pMLUbrUsg4kg2IvPlW2qVAJCGIhTVqTPlvFGlg7PwpP9o2w/QoeqFOBA39gwkgPPS
 6IX6771Hhj9q4gWDgfUnakT0NT9Bu2vfhuSC2Fwyw29wLtAZ7+rKm/x46Xgju4IVJgYT
 tMxA==
X-Gm-Message-State: AFqh2kqiRjKvZtfNKuIoWKF0DnWCQMNYZUw99rF8jBWTi0ib0apuxoME
 FyDngxxtQ8ssYJ7z6XAKjuXwfg==
X-Google-Smtp-Source: AMrXdXsCkv1T9mnQydT5dZfJTDzMKMEQK51jINbrX+QvKERzZFkYeUTKiAEog3G1Zc/kuuCrJCPAEw==
X-Received: by 2002:a05:600c:539b:b0:3d9:f836:3728 with SMTP id
 hg27-20020a05600c539b00b003d9f8363728mr10225447wmb.11.1674131567078; 
 Thu, 19 Jan 2023 04:32:47 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003db11dfc687sm4648913wmc.36.2023.01.19.04.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:32:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE2531FFB7;
 Thu, 19 Jan 2023 12:32:45 +0000 (GMT)
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
 <20230110132700.833690-7-marcandre.lureau@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John
 Snow <jsnow@redhat.com>, kraxel@redhat.com, Beraldo Leal
 <bleal@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Markus Armbruster <armbru@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 thuth@redhat.com, Halil Pasic <pasic@linux.ibm.com>, Michael Roth
 <michael.roth@amd.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v4 6/8] Update lcitool and fedora to 37
Date: Thu, 19 Jan 2023 12:29:53 +0000
In-reply-to: <20230110132700.833690-7-marcandre.lureau@redhat.com>
Message-ID: <87edrqzouq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Fedora 35 is EOL.
>
> Update to upstream lcitool, that dropped f35 and added f37.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
>  tests/docker/dockerfiles/fedora.docker             | 4 ++--
>  tests/lcitool/libvirt-ci                           | 2 +-
>  tests/lcitool/refresh                              | 6 +++---
>  5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win32-cross.docker
> index 75383ba185..cc5d1ac4be 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile --layers all --cross mingw32 fedora-35 qemu
> +#  $ lcitool dockerfile --layers all --cross mingw32 fedora-37 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>=20=20
> -FROM registry.fedoraproject.org/fedora:35
> +FROM registry.fedoraproject.org/fedora:37
>=20=20
>  RUN dnf install -y nosync && \
>      echo -e '#!/bin/sh\n\
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win64-cross.docker
> index 98c03dc13b..cabbf4edfc 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile --layers all --cross mingw64 fedora-35 qemu
> +#  $ lcitool dockerfile --layers all --cross mingw64 fedora-37 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>=20=20
> -FROM registry.fedoraproject.org/fedora:35
> +FROM registry.fedoraproject.org/fedora:37
>=20=20
>  RUN dnf install -y nosync && \
>      echo -e '#!/bin/sh\n\
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
> index d200c7fc10..f44b005000 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -1,10 +1,10 @@
>  # THIS FILE WAS AUTO-GENERATED
>  #
> -#  $ lcitool dockerfile --layers all fedora-35 qemu
> +#  $ lcitool dockerfile --layers all fedora-37 qemu
>  #
>  # https://gitlab.com/libvirt/libvirt-ci
>=20=20
> -FROM registry.fedoraproject.org/fedora:35
> +FROM registry.fedoraproject.org/fedora:37

This breaks the oss fuzz build:

  Testing ./build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target- ...
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  =3D=3D5695=3D=3DERROR: LeakSanitizer: detected memory leaks
  Direct leak of 8 byte(s) in 1 object(s) allocated from:
      #0 0x559931c2a458 in operator new(unsigned long) (/builds/stsquad/qem=
u/build-oss-fuzz/DEST_DIR/qemu-fuzz-i386-target-+0xcff458) (BuildId: 4656f7=
dd1ff6e2faf418a79279f4e92db931ba28)
      #1 0x7f89125205b7  (/lib64/libtcmalloc_minimal.so.4+0xe5b7) (BuildId:=
 8eab2cfc91caa7a82e480465400218310b7a341c)
      #2 0x7f8917d24cdd in call_init /usr/src/debug/glibc-2.36-9.fc37.x86_6=
4/elf/dl-init.c:70:3
      #3 0x7f8917d24cdd in call_init /usr/src/debug/glibc-2.36-9.fc37.x86_6=
4/elf/dl-init.c:26:1
      #4 0x7f8917d24dcb in _dl_init /usr/src/debug/glibc-2.36-9.fc37.x86_64=
/elf/dl-init.c:117:5
      #5 0x7f8917d3b8df in _dl_start_user (/lib64/ld-linux-x86-64.so.2+0x1b=
8df) (BuildId: bb6fec54c7521fddc569a2f4e141dfb97bf3acbe)
  SUMMARY: AddressSanitizer: 8 byte(s) leaked in 1 allocation(s).
  Cleaning up project directory and file based variables

The actual cause is that libglusterfs-devel pulls in gperftools-libs:

  [root@c0ca1c50f5cc /]# yum install libglusterfs-devel
  Last metadata expiration check: 0:04:40 ago on Thu 19 Jan 2023 12:24:51 P=
M UTC.
  Dependencies resolved.
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Pa=
ckage                                          Architecture                =
         Version                                    Repository             =
               Size
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DIns=
talling:
   libglusterfs-devel                               x86_64                 =
              10.3-1.fc37                                fedora            =
                   129 k
  Installing dependencies:
   gperftools-libs                                  x86_64                 =
              2.9.1-4.fc37                               fedora            =
                   307 k
   libgfrpc-devel                                   x86_64                 =
              10.3-1.fc37                                fedora            =
                    46 k
   libgfrpc0                                        x86_64                 =
              10.3-1.fc37                                fedora            =
                    59 k
   libgfxdr-devel                                   x86_64                 =
              10.3-1.fc37                                fedora            =
                   9.9 k
   libgfxdr0                                        x86_64                 =
              10.3-1.fc37                                fedora            =
                    31 k
   libglusterfs0                                    x86_64                 =
              10.3-1.fc37                                fedora            =
                   327 k

  Transaction Summary
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DIns=
tall  7 Packages

Which brings in gperftools-libs an tcmalloc which then gets in the way
of our build. So either we drop glusterfs on fedora builds or we need
some way to avoid tcmalloc getting in the way.

To try and get the rest of the PR out of the way I think we should drop
this for now unless anyone has an easy solution?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

