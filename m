Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649835A0075
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 19:33:36 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQuFz-0002R4-17
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 13:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQuBd-0007NQ-GM
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:29:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQuBb-0003Iv-D2
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 13:29:05 -0400
Received: by mail-ej1-x629.google.com with SMTP id n7so16701195ejh.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 10:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=AQx11pQ2w1rjNImbSsvo2KE03naN35n+1Qv18M2zsBc=;
 b=JeWo0sUdcinQltQzJvmXJaeGPVpGvp5eRqnWANFCCgWcPRgTooLSlBT4esqhZLmPM8
 NTkmib3A1+iUjd11t+obyOLYi2JQqc5JLVqD5OExJ/ts9RWEG+0QfsR3CHjEaDvaFLVm
 YiV8tOFKOAWj5e/fdKq7bWCS17ml/1k3YnChsYo3i2bkvwQI7/pv8a1vyGPcvFuMzVfw
 APYDqRL/WaSM39H0HlbvYKZvwhLfX8k8guB0v8qG9IXYk1YDQUdwRQWyV/ttn8K3Mnbg
 OKjyxG6LN0EgKbTbSXGvzaPE2ZB8nABoZwmyqLFB/grvk9Vpg1zLmQAD4ERETgPj3RYD
 O7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=AQx11pQ2w1rjNImbSsvo2KE03naN35n+1Qv18M2zsBc=;
 b=6vF8pF/cGfwpEb3yW/iod7hlsFANk2gFKtYNW+ou0q2VNhgolu3QjSwV3nvDEbApfN
 46NMm6SiKmxvvRN0aNo+XK1qh9M1svGLACFLOo9m8jEM3IcgiDVcsjeFFNnwmHpYF/G7
 wp54vxZ1g/Y/abhP/no8VOktdFdEI9xrCTUszOyUKKcfwhG/uWUcmdF0mFv8h6o9SLbR
 9tNHw1wnnKaueDrhyXfIWlXkR3+bhUskduyZTZxEbX5mlH/hl64NM0B4hcQfULYU1Km/
 MNuu6qnU9t6aOSQ6bQhOoMo4sg12bX6mI+L3a1tVHIZM5fIRT/pcu/xCLxHE/HfIJ5SI
 PxaA==
X-Gm-Message-State: ACgBeo2OfLCOhA6QItJIIIMyTHL0jw2rET4evUuAW2qAet3Iw2D7ZGct
 fmD9s8uN7Utdz9godEwj8fq72g==
X-Google-Smtp-Source: AA6agR4efxh/3+Y+43O1jyCHpiBDkmBBuVql9XncPnPQecqk6mj4ww76+OMhRfrwcu03sTvFt8VFTQ==
X-Received: by 2002:a17:907:2724:b0:73d:7696:cc2f with SMTP id
 d4-20020a170907272400b0073d7696cc2fmr14715ejl.678.1661362141527; 
 Wed, 24 Aug 2022 10:29:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056402029200b004479cec6496sm384582edv.75.2022.08.24.10.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:29:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2BA711FFB7;
 Wed, 24 Aug 2022 18:29:00 +0100 (BST)
References: <20220823210329.1969895-1-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] gitlab-ci/custom-runners: Disable -static-pie for
 ubuntu-20.04-aarch64
Date: Wed, 24 Aug 2022 18:15:54 +0100
In-reply-to: <20220823210329.1969895-1-richard.henderson@linaro.org>
Message-ID: <87mtbth7oj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The project has reached the magic size at which we see
>
> /usr/aarch64-linux-gnu/lib/libc.a(init-first.o): in function `__libc_init=
_first':
> (.text+0x10): relocation truncated to fit: R_AARCH64_LD64_GOTPAGE_LO15 ag=
ainst \
> symbol `__environ' defined in .bss section in /usr/aarch64-linux-gnu/lib/=
libc.a(environ.o)
> /usr/bin/ld: (.text+0x10): warning: too many GOT entries for -fpic, pleas=
e recompile with -fPIC
>
> The bug has been reported upstream, but in the meantime there is
> nothing we can do except build a non-pie executable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> Irritatingly, once this is fixed, we're still in a broken state because
> we're now picking up an x86_64 cross-compiler, without all of the
> required static libraries:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/2923714301#L3028
>
>     Cross compilers
>     aarch64                      : cc
>     arm                          : arm-linux-gnueabihf-gcc
>     i386                         : i686-linux-gnu-gcc
>     mips64el                     : mips64el-linux-gnuabi64-gcc
>     mipsel                       : mipsel-linux-gnu-gcc
>     riscv64                      : riscv64-linux-gnu-gcc
>     s390x                        : s390x-linux-gnu-gcc
>     x86_64                       : x86_64-linux-gnu-gcc
>
> where we hadn't done so just 4 days ago:
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/2908305198
>
>     Cross compilers
>     aarch64                      : cc
>     arm                          : arm-linux-gnueabihf-gcc
>     i386                         : i686-linux-gnu-gcc
>     riscv64                      : riscv64-linux-gnu-gcc
>     s390x                        : s390x-linux-gnu-gcc
>
> Alex? I think you're the only one who would know how this host
> is supposed to be configured for gitlab...

Ahh because aarch64.ci.qemu.org is also a developer box I had enabled a
bunch of additional cross compilers for the tests (because we can't take
full advantage of the docker images on non-x86). However it shouldn't
affect the main build, these compilers are only used for the TCG tests.

It looks like the compiler is borked because:

/usr/lib/gcc-cross/x86_64-linux-gnu/11/../../../../x86_64-linux-gnu/bin/ld:=
 cannot find /usr/lib/x86_64-linux-gnu/libm-2.35.a: No such file or directo=
ry=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
/usr/lib/gcc-cross/x86_64-linux-gnu/11/../../../../x86_64-linux-gnu/bin/ld:=
 cannot find /usr/lib/x86_64-linux-gnu/libmvec.a: No such file or directory=
=20=20=20=20=20=20=20

but the libc6-dev-amd64-cross package puts this in:

  /usr/x86_64-linux-gnu/lib/libmvec.a

Anyway as x86_64 is the one compiler that is available in the docker
multiarch I've dropped that for now. It won't get used by the CI system
as it can't use docker but developers using the box should get:

  Cross compilers
    aarch64                      : cc
    arm                          : arm-linux-gnueabihf-gcc
    i386                         : i686-linux-gnu-gcc
    mips64el                     : mips64el-linux-gnuabi64-gcc
    mipsel                       : mipsel-linux-gnu-gcc
    riscv64                      : riscv64-linux-gnu-gcc
    s390x                        : s390x-linux-gnu-gcc
    x86_64                       : $(DOCKER_SCRIPT) cc --cc x86_64-linux-gn=
u-gcc -i qemu/debian-amd64-cross -s /home/alex/lsrc/qemu.git --

> I guess I'm not going to let this affect the release, but we
> do have quite a number of annoyingly consistent failures now.
> We should either fix them or disable them.

The rest of the tests build and run fine now.

>
>
> r~
>
> ---
>  .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitl=
ab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> index 3d878914e7..85a234801a 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> @@ -16,7 +16,9 @@ ubuntu-20.04-aarch64-all-linux-static:
>   # --disable-glusterfs is needed because there's no static version of th=
ose libs in distro supplied packages
>   - mkdir build
>   - cd build
> - - ../configure --enable-debug --static --disable-system --disable-glust=
erfs --disable-libssh
> + # Disable -static-pie due to build error with system libc:
> + # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
> + - ../configure --enable-debug --static --disable-system --disable-glust=
erfs --disable-libssh --disable-pie --extra-cflags=3D'-fno-pie -no-pie'
>     || { cat config.log meson-logs/meson-log.txt; exit 1; }
>   - make --output-sync -j`nproc --ignore=3D40`
>   - make --output-sync -j`nproc --ignore=3D40` check V=3D1

I'll update this once the tree is open as you may have noticed the host
is now a 22.04 one (which hopefully means we can enable glusterfs and
libssh now)

--=20
Alex Benn=C3=A9e

