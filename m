Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF1AB5BA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 12:23:16 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6BOe-0004Hi-03
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 06:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i6BMH-0003EO-7S
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i6BMF-0002EQ-Dc
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:20:49 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i6BMF-0002DM-5F
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:20:47 -0400
Received: by mail-wr1-x443.google.com with SMTP id q14so5962755wrm.9
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 03:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=H8Q1wyy32ekpTEjx5aEemjaW6gHszFerL4SyDI17D+Q=;
 b=k7WiCWeOOvNa9fyu6OUwApXqylwyAdmf+k5UUhu2BbL5WY+kWFSnFMI+Z4NGkK8BYr
 Fodk3lLh3jbqcD//6HMkALPUPCAdQ6ellO0F8xBWLUvJmNLTbTyM7CBJPhgux6f/49UV
 Mi2GBV44GPtDIgNR0zSzQhq2GtiUzFbW1J9+ogVUd8y3dqSEZTvDgDKMSLrG3eMgDbWj
 KV7xuy0gzCNTmM/So8PDLfqpIUF+u6oyH1b6VefYIfsbYZHKcLa21As/dzPEwwpifQ88
 NI2e2RY6Y+VUJzcIkOclFI31XH7zW6YVx7EH6Y37Do/OTckI6hdL48AjZLpdxL/3Yxqt
 dNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=H8Q1wyy32ekpTEjx5aEemjaW6gHszFerL4SyDI17D+Q=;
 b=Sd+PbQZQp/hANQQqd4W+34C/TnKP8R5QS0QHDn6KuFl3HXHd8GhZSqMV6bOa5ly2XU
 XgSPqimsfVK4+IgPUrycElemefPQ+QMe5p9UbeijKTDSY/GFIFzqSUCxJlBO1jrfO9Qe
 08hkyfWhT8wpdHaN2zU9CDQqul4h090qwoNghieehHYdzgbdztipgwC1YUeuUNkJOqqM
 uCgB8ih0srlKjfTjjGcqHPXdzfjF38c821Cf0+v3mPGlUh6SEtHK6QduBtqrGeemGiru
 puWWkTf1WiOqlRHVXs3T/hm69odpAFZLE1ilcBQH5gudYIkfJn3FO4d6v4AuZNTX4YRl
 1M6A==
X-Gm-Message-State: APjAAAWFQ9fCMoKTluv6xMF5NVjf6EarNcV/zLDRH7kcV0MpECsauXOY
 /5WbVleJ0FH9nwsr4E8P1qpqEA==
X-Google-Smtp-Source: APXvYqzEXJOGoQSJ7bp6GwB/bXGKYMUkShfRUqloviqMMh/imHR2Sme+jQkayOzERkGpb7lq3Lrvcg==
X-Received: by 2002:adf:e546:: with SMTP id z6mr6365223wrm.113.1567765245767; 
 Fri, 06 Sep 2019 03:20:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 74sm6401358wma.15.2019.09.06.03.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 03:20:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 404311FF87;
 Fri,  6 Sep 2019 11:20:44 +0100 (BST)
References: <20190904203013.9028-1-alex.bennee@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190904203013.9028-1-alex.bennee@linaro.org>
Date: Fri, 06 Sep 2019 11:20:44 +0100
Message-ID: <87woel7mkj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [PATCH v1 00/42] current testing/next queue
 (podman, docker, ci)
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi All,
>
<snip>
>
> Please review ;-)

The following still need review:

unreviewed - 3bf0fc78ddf - Alex Benn=C3=A9e: configure: check if --no-pie i=
s supported first
unreviewed - 91debbbd08e - Alex Benn=C3=A9e: tests/docker: add more images =
to PARTIAL_IMAGES when not on x86_64
unreviewed - aea7785222a - Alex Benn=C3=A9e: tests/docker: use --arch-only =
for installing deps
unreviewed - 01c19df4c75 - Alex Benn=C3=A9e: tests/docker: add debian-amd64=
-cross for non-x86 hosts
unreviewed - ba90db8ad06 - Alex Benn=C3=A9e: tests/docker: add debian-xtens=
a-cross to DEBIAN_PARTIAL_IMAGES
unreviewed - 0929a7cb881 - Alex Benn=C3=A9e: tests/docker: drop powerpc-use=
r image for QEMU cross builds
unreviewed - cf2bf8f11b2 - Alex Benn=C3=A9e: tests/docker: drop debian-sid =
image
unreviewed - 160f58adec6 - Alex Benn=C3=A9e: tests/docker: move our ppc64 c=
ross compile to Buster
unreviewed - a94f07dff2f - Alex Benn=C3=A9e: tests/docker: move our riscv64=
 cross compile to Buster
unreviewed - 174ab0f54ab - Alex Benn=C3=A9e: tests/docker: move our mips64 =
cross compile to Buster
unreviewed - a7bd356187e - Alex Benn=C3=A9e: tests/docker: move our sh4 cro=
ss compile to Buster
unreviewed - 6747f17e0fb - Alex Benn=C3=A9e: tests/docker: move our sparc64=
 cross compile to Buster
unreviewed - 1e220361d95 - Alex Benn=C3=A9e: tests/docker: move our m68k cr=
oss compile to Buster
unreviewed - 437dafd4044 - Alex Benn=C3=A9e: tests/docker: move our HPPA cr=
oss compile to Buster
unreviewed - a846639d89d - Alex Benn=C3=A9e: tests/docker: move our Alpha c=
ross compile to Buster
unreviewed - 6dd1c889393 - Alex Benn=C3=A9e: tests/docker: move our powerpc=
 cross compile to Buster
unreviewed - 3373c3eb84e - Alex Benn=C3=A9e: tests/docker: set DEF_TARGET_L=
IST for some containers
unreviewed - d14f1b84dc3 - Alex Benn=C3=A9e: tests/tcg: add .gitignore for =
in source builds
unreviewed - 659b98caba3 - Alex Benn=C3=A9e: tests/docker: handle missing e=
ncoding keyword for subprocess.check_output
unreviewed - 450795acac1 - Alex Benn=C3=A9e: tests/docker: fix "cc" command=
 to work with podman
unreviewed - 131dc565937 - Alex Benn=C3=A9e: configure: clean-up container =
cross compile detect


>
> Alex Benn=C3=A9e (27):
>   configure: clean-up container cross compile detect
>   tests/docker: fix "cc" command to work with podman
>   tests/tcg: add .gitignore for in source builds
>   tests/docker: move DEF_TARGET_LIST setting to common.rc
>   tests/docker: set DEF_TARGET_LIST for some containers
>   tests/docker: add Buster to DOCKER_PARTIAL_IMAGES
>   tests/docker: move our arm64 cross compile to Buster
>   tests/docker: move our powerpc cross compile to Buster
>   tests/docker: move our Alpha cross compile to Buster
>   tests/docker: move our HPPA cross compile to Buster
>   tests/docker: move our m68k cross compile to Buster
>   tests/docker: move our sparc64 cross compile to Buster
>   tests/docker: move our sh4 cross compile to Buster
>   tests/docker: move our mips64 cross compile to Buster
>   tests/docker: move our riscv64 cross compile to Buster
>   tests/docker: move our ppc64 cross compile to Buster
>   tests/docker: drop debian-sid image
>   tests/docker: drop powerpc-user image for QEMU cross builds
>   tests/docker: add debian-xtensa-cross to DEBIAN_PARTIAL_IMAGES
>   tests/docker: add debian9-mxe to DEBIAN_PARTIAL_IMAGES
>   tests/docker: avoid $SHELL invoke bash directly
>   tests/docker: add debian-amd64-cross for non-x86 hosts
>   tests/docker: use --arch-only for installing deps
>   tests/docker: add more images to PARTIAL_IMAGES when not on x86_64
>   configure: check if --no-pie is supported first
>   tests/docker: --disable-libssh on ubuntu1804 builds
>   tests/docker: don't always encoding for subprocess.check_output
>
> Cleber Rosa (1):
>   Fedora images: use URLs from stable "archives.fedoraproject.org"
>
> Paolo Bonzini (3):
>   tests/tcg: use EXTRA_CFLAGS everywhere
>   tests/tcg: cleanup Makefile inclusions
>   tests/tcg: move configuration to a sub-shell script
>
> Philippe Mathieu-Daud=C3=A9 (10):
>   .travis.yml: Enable multiple caching features
>   .travis.yml: Increase cache timeout from 3min to 20min
>   .travis.yml: Cache Python PIP packages
>   .travis.yml: Cache Avocado cache
>   .travis.yml: Improve ccache use
>   .travis.yml: Enable ccache on OSX
>   .travis.yml: Document how the build matrix use caches
>   .travis.yml: Cache Linux/GCC 'debug profile' jobs together
>   .travis.yml: Cache Linux/GCC 'non-debug profile' jobs together
>   .travis.yml: Cache Linux/Clang jobs together
>
> Thomas Huth (1):
>   hw/misc: Mark most objects as "common" code to speed up compilation a
>     litte bit
>
>  .travis.yml                                   |  39 ++-
>  Makefile                                      |   1 +
>  Makefile.target                               |   3 -
>  configure                                     | 168 ++-----------
>  hw/misc/Makefile.objs                         |  90 +++----
>  qemu-doc.texi                                 |   6 +-
>  tests/Makefile.include                        |  25 +-
>  tests/acceptance/boot_linux_console.py        |  25 +-
>  tests/acceptance/linux_initrd.py              |   5 +-
>  tests/docker/Makefile.include                 |  61 +++--
>  tests/docker/common.rc                        |   4 +
>  tests/docker/docker.py                        |  51 ++--
>  .../dockerfiles/debian-alpha-cross.docker     |   7 +-
>  .../dockerfiles/debian-amd64-cross.docker     |  22 ++
>  .../dockerfiles/debian-arm64-cross.docker     |   7 +-
>  .../dockerfiles/debian-armel-cross.docker     |   3 +-
>  .../dockerfiles/debian-armhf-cross.docker     |   3 +-
>  .../debian-buster-arm64-cross.docker          |  16 --
>  .../dockerfiles/debian-hppa-cross.docker      |   5 +-
>  .../dockerfiles/debian-m68k-cross.docker      |   5 +-
>  .../dockerfiles/debian-mips-cross.docker      |   7 +-
>  .../dockerfiles/debian-mips64-cross.docker    |   5 +-
>  .../dockerfiles/debian-mips64el-cross.docker  |   3 +-
>  .../dockerfiles/debian-mipsel-cross.docker    |   2 +-
>  .../dockerfiles/debian-powerpc-cross.docker   |   8 +-
>  .../debian-powerpc-user-cross.docker          |  15 --
>  .../dockerfiles/debian-ppc64-cross.docker     |   7 +-
>  .../dockerfiles/debian-ppc64el-cross.docker   |   3 +-
>  .../dockerfiles/debian-riscv64-cross.docker   |   5 +-
>  .../dockerfiles/debian-s390x-cross.docker     |   3 +-
>  .../dockerfiles/debian-sh4-cross.docker       |   5 +-
>  tests/docker/dockerfiles/debian-sid.docker    |  41 ---
>  .../dockerfiles/debian-sparc64-cross.docker   |   5 +-
>  tests/docker/dockerfiles/ubuntu1804.docker    |   3 +
>  tests/docker/run                              |   4 +-
>  tests/docker/test-build                       |   1 -
>  tests/docker/test-mingw                       |   1 -
>  tests/docker/test-quick                       |   1 -
>  tests/tcg/.gitignore                          |   5 +
>  tests/tcg/Makefile.include                    |  88 -------
>  tests/tcg/Makefile.prereqs                    |  18 ++
>  tests/tcg/Makefile.probe                      |  31 ---
>  tests/tcg/Makefile.qemu                       |  95 +++++++
>  tests/tcg/{Makefile =3D> Makefile.target}       |  15 +-
>  tests/tcg/aarch64/Makefile.include            |   8 -
>  tests/tcg/aarch64/Makefile.softmmu-target     |   4 +-
>  tests/tcg/aarch64/Makefile.target             |  12 +-
>  tests/tcg/alpha/Makefile.include              |   2 -
>  tests/tcg/alpha/Makefile.softmmu-target       |   4 +-
>  tests/tcg/arm/Makefile.include                |   8 -
>  tests/tcg/arm/Makefile.softmmu-target         |   6 +-
>  tests/tcg/configure.sh                        | 234 ++++++++++++++++++
>  tests/tcg/cris/Makefile.include               |   6 -
>  tests/tcg/hppa/Makefile.include               |   2 -
>  tests/tcg/i386/Makefile.include               |   9 -
>  tests/tcg/i386/Makefile.softmmu-target        |  12 +-
>  tests/tcg/i386/Makefile.target                |  13 +-
>  tests/tcg/m68k/Makefile.include               |   2 -
>  tests/tcg/minilib/Makefile.target             |   2 +-
>  tests/tcg/mips/Makefile.include               |  20 --
>  tests/tcg/ppc/Makefile.include                |  10 -
>  tests/tcg/riscv/Makefile.include              |  10 -
>  tests/tcg/s390x/Makefile.include              |   2 -
>  tests/tcg/sh4/Makefile.include                |   4 -
>  tests/tcg/sparc64/Makefile.include            |   2 -
>  tests/tcg/x86_64/Makefile.softmmu-target      |  36 +++
>  tests/tcg/x86_64/Makefile.target              |   7 +-
>  tests/tcg/xtensa/Makefile.include             |  11 -
>  tests/tcg/xtensa/Makefile.softmmu-target      |   4 +-
>  tests/vm/fedora                               |   2 +-
>  70 files changed, 693 insertions(+), 656 deletions(-)
>  create mode 100644 tests/docker/dockerfiles/debian-amd64-cross.docker
>  delete mode 100644 tests/docker/dockerfiles/debian-buster-arm64-cross.do=
cker
>  delete mode 100644 tests/docker/dockerfiles/debian-powerpc-user-cross.do=
cker
>  delete mode 100644 tests/docker/dockerfiles/debian-sid.docker
>  create mode 100644 tests/tcg/.gitignore
>  delete mode 100644 tests/tcg/Makefile.include
>  create mode 100644 tests/tcg/Makefile.prereqs
>  delete mode 100644 tests/tcg/Makefile.probe
>  create mode 100644 tests/tcg/Makefile.qemu
>  rename tests/tcg/{Makefile =3D> Makefile.target} (90%)
>  delete mode 100644 tests/tcg/aarch64/Makefile.include
>  delete mode 100644 tests/tcg/alpha/Makefile.include
>  delete mode 100644 tests/tcg/arm/Makefile.include
>  create mode 100755 tests/tcg/configure.sh
>  delete mode 100644 tests/tcg/cris/Makefile.include
>  delete mode 100644 tests/tcg/hppa/Makefile.include
>  delete mode 100644 tests/tcg/i386/Makefile.include
>  delete mode 100644 tests/tcg/m68k/Makefile.include
>  delete mode 100644 tests/tcg/mips/Makefile.include
>  delete mode 100644 tests/tcg/ppc/Makefile.include
>  delete mode 100644 tests/tcg/riscv/Makefile.include
>  delete mode 100644 tests/tcg/s390x/Makefile.include
>  delete mode 100644 tests/tcg/sh4/Makefile.include
>  delete mode 100644 tests/tcg/sparc64/Makefile.include
>  create mode 100644 tests/tcg/x86_64/Makefile.softmmu-target
>  delete mode 100644 tests/tcg/xtensa/Makefile.include


--
Alex Benn=C3=A9e

