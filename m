Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E652B40FAE0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:56:15 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFHi-00074B-Vz
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRF1G-0002Dj-6z
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:39:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRF1D-0005nj-0P
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:39:13 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so10152617wmd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=mPQ6iaHmskzR3Ip8Ce/LCiJYqSpoo/KR0kBtH6yAHns=;
 b=YWHgirbOhrBavZ25IjjzVdeV3PDrbj5l9dZj3xPyZHrPi22EKAM6ZIK6hd2W8v+wLR
 iurFFkR/suBVyjWR8TVl6C6SXb7fd+hLW+TehuxmbwcSW4S9JBxMrAglbu0TpUBmTQ7K
 0ADMq498cY+dcrp+QA7jOGEMIiI5QgIFQLxU8NpY2oZyYVz45Lv3DHCm0er6QoJPjPjK
 cvqMqULAqByvudae9LIC3ut9NOMfWEYTW1qbWgbdV4NwH1mECDSt3YpQFIwr0St06Por
 6CwaV1vhSq10JCv8AS4Z+InHCi6jrf8QVTXZU1xRiZIXB8uaMyiogafpaahejg/nz7JI
 dj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=mPQ6iaHmskzR3Ip8Ce/LCiJYqSpoo/KR0kBtH6yAHns=;
 b=v9WnKHVoAiWouyCGt32vFkIO7v1OOkOaFDzGVOJ3TWhLY+1mSUmNXeWuXhsINTSuDx
 RjNFhwaiy7jp/UH9MddovpU9qvby7MMWWF3Bor2i0wwjJA/bCSOXC2SJ947nYwEXsGdd
 vV+2RE7Zi2ZaxAAzUWosjbHJioPphVicFE2WGPrOpFdGTNEzsQLcit5KwIba2L4KMQtY
 0yg7EWkrzXyrsIt8R5zRMZ6xkuyYE5oYko/wkauxHyl4xX2YROzLBBUwCbawv/HTjrf9
 MLKa8w8K9kLDDszhlVo86eEqbrI1PGfdRXKD/3nU35glDWYzR9Cgy7Y0Q7ku9cCHr2f+
 kGHg==
X-Gm-Message-State: AOAM531luy41Up38vUxOY5r5ATkC3ud4RsWrXRpPEEA0IXQZ5b8TWpj8
 0wyYcBjrytZdu1eigk+SOlZbfw==
X-Google-Smtp-Source: ABdhPJydhoSJyUAOg6FbA8MGPhO061dQXra8AT3WFGc/oLVDuS1iVMeFA6n3M7Evdf3oUu+JB7BBJQ==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr15998702wmg.88.1631889549223; 
 Fri, 17 Sep 2021 07:39:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g5sm6887487wrq.80.2021.09.17.07.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:39:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 478D31FF96;
 Fri, 17 Sep 2021 15:39:07 +0100 (BST)
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
 <20210803110237.1051032-4-alex.bennee@linaro.org>
 <CANCZdfo=96hcsaRuWoH0X8LHoRioYfP3OyQjPRQzjbCfCW+7wA@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [RFC PATCH 3/3] tests/tcg: commit Makefile atrocities in the
 name of portability
Date: Fri, 17 Sep 2021 15:34:42 +0100
In-reply-to: <CANCZdfo=96hcsaRuWoH0X8LHoRioYfP3OyQjPRQzjbCfCW+7wA@mail.gmail.com>
Message-ID: <8735q3tgfo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: fam@euphon.net, "Daniel P.
 Berrange" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Warner Losh <imp@bsdimp.com> writes:

> On Tue, Aug 3, 2021 at 5:02 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>  Not all of the multiarch tests are pure POSIX so elide over those
>  tests on a non-Linux system. This allows for at least some of the
>  tests to be nominally usable by *BSD user builds.
>
>  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>  Cc: Warner Losh <imp@bsdimp.com>
>  ---
>   tests/tcg/multiarch/Makefile.target | 6 +++++-
>   tests/tcg/x86_64/Makefile.target    | 4 ++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
>
> Acked-by: Warner Losh <imp@bsdimp.com>
>
> To do this with gcc10, however, I had to add -Wno-error=3Doverflow
> otherwise I got a lot of warnings about constants being truncated to
> 0.
>
> It also fails the sha1 test, but when I run it by hand it works. It turns
> out that I have a sha1 in my path, and at least in the bsd-user edition
> of qemu-i386 tries to run that and fails.
>
> Also, the hello world program needed tweaking
>
> So with this applied and the following patch
>
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 63cf1b2573..39420631a8 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -155,7 +155,7 @@ RUN_TESTS+=3D$(EXTRA_RUNS)
>
>  ifdef CONFIG_USER_ONLY
>  run-%: %
> -       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAM=
E)")
> +       $(call run-test, $<, $(QEMU) $(QEMU_OPTS) ./$<, "$< on $(TARGET_N=
AME)")
>
>  run-plugin-%:
>         $(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
> @@ -168,7 +168,7 @@ run-%: %
>         $(call run-test, $<, \
>           $(QEMU) -monitor none -display none \
>                   -chardev file$(COMMA)path=3D$<.out$(COMMA)id=3Doutput \
> -                 $(QEMU_OPTS) $<, \
> +                 $(QEMU_OPTS) ./$<, \
>           "$< on $(TARGET_NAME)")

That's weird. I'm not super keen to merge this because it's incomplete
(we have a large number of manual run-FOO stanzas). AFAICT neither of
the loaders attempt to enumerate and search path so I wonder if this is
a function of the shell?

>
>  run-plugin-%:
> diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.tar=
get
> index a053ca3f15..ae258c47f0 100644
> --- a/tests/tcg/i386/Makefile.target
> +++ b/tests/tcg/i386/Makefile.target
> @@ -21,6 +21,7 @@ run-plugin-test-i386-pcmpistri-%: QEMU_OPTS +=3D -cpu m=
ax
>  run-test-i386-bmi2: QEMU_OPTS +=3D -cpu max
>  run-plugin-test-i386-bmi2-%: QEMU_OPTS +=3D -cpu max
>
> +CFLAGS +=3D  -Wno-error=3Doverflow

I'd apply this direct to the test in question rather than a global change.

>  #
>  # hello-i386 is a barebones app
>  #
> diff --git a/tests/tcg/i386/hello-i386.c b/tests/tcg/i386/hello-i386.c
> index 59196dd0b7..4a5a25211c 100644
> --- a/tests/tcg/i386/hello-i386.c
> +++ b/tests/tcg/i386/hello-i386.c
> @@ -1,4 +1,10 @@
> +#ifdef __FreeBSD__
> +#include <sys/syscall.h>
> +#define __NR_exit SYS_exit
> +#define __NR_write SYS_write
> +#else
>  #include <asm/unistd.h>
> +#endif
>
>  static inline void exit(int status)
>  {
>
> I get down to a failure i the mmap test.... and that's all I have time to=
 plumb the depths
> of this morning... Investigating the mmap test failure will have to wait =
for another day.
>
> Warner
>=20=20
>  diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/M=
akefile.target
>  index 85a6fb7a2e..38ee0f1dec 100644
>  --- a/tests/tcg/multiarch/Makefile.target
>  +++ b/tests/tcg/multiarch/Makefile.target
>  @@ -10,7 +10,11 @@ MULTIARCH_SRC=3D$(SRC_PATH)/tests/tcg/multiarch
>   # Set search path for all sources
>   VPATH          +=3D $(MULTIARCH_SRC)
>   MULTIARCH_SRCS   =3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
>  -MULTIARCH_TESTS  =3D$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=3D))
>  +MULTIARCH_SKIP=3Dfloat_helpers
>  +ifeq ($(CONFIG_LINUX),)
>  +MULTIARCH_SKIP+=3Dlinux-test
>  +endif
>  +MULTIARCH_TESTS  =3D$(filter-out $(MULTIARCH_SKIP),$(MULTIARCH_SRCS:.c=
=3D))
>
>   #
>   # The following are any additional rules needed to build things
>  diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefil=
e.target
>  index 2151ea6302..d7a7385583 100644
>  --- a/tests/tcg/x86_64/Makefile.target
>  +++ b/tests/tcg/x86_64/Makefile.target
>  @@ -8,8 +8,12 @@
>
>   include $(SRC_PATH)/tests/tcg/i386/Makefile.target
>
>  +ifneq ($(CONFIG_LINUX),)
>   X86_64_TESTS +=3D vsyscall
>   TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
>  +else
>  +TESTS=3D$(MULTIARCH_TESTS)
>  +endif
>   QEMU_OPTS +=3D -cpu max
>
>   test-x86_64: LDFLAGS+=3D-lm -lc
>  --=20
>  2.30.2


--=20
Alex Benn=C3=A9e

