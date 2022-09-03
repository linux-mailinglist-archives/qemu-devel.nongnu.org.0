Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9B5ABDF3
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 11:16:36 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUPGU-0002nL-SP
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 05:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oUPEF-0000Wp-61
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 05:14:15 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oUPED-0004n0-5P
 for qemu-devel@nongnu.org; Sat, 03 Sep 2022 05:14:14 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b44so5487096edf.9
 for <qemu-devel@nongnu.org>; Sat, 03 Sep 2022 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=o9R7gv4hc8v5tmpMbmHwVTwOi262cmWcxbcfXzD7woA=;
 b=D3Ae9wNuWiMqsrKA1QIfrmJPIb2FtUm9oQWWyqYpBBt1Lp6PSAu4v3XT6YJeAPxjOY
 2KccKE5otIhnGf3UCGc2Lv83ZQnfYSj8H0WR8LLBA4m3dkdHcPL6w5WJBdXI9h39Tiv1
 kbQN12dqwkeV9PuiAASlDfeJongyyWbSAJfNmiiot4J1KGe3WMWFVhaWc95a6W1dfygp
 sFy0cv6TIdS/VWSNg3COja1cxLRA5q+aQ8ym6meJmyadZ3Z5UVOflCM3mtFImkJgCqKK
 zlCRbC9yPl6/RITNN5CMzjlksArV+TCv7B1VdXz+Ko9srpk1Y1qv+dRvOcW7GiGEUfNE
 OZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=o9R7gv4hc8v5tmpMbmHwVTwOi262cmWcxbcfXzD7woA=;
 b=q0LGmFI68ugFDuMmqEtm7mh0ZyrtDjmIIvfz5dZbX7r0CPP93aAZ5/D2mzjCnmtNsi
 Kwee3KwoPejb2ftoNpJVlh0WXo63OjsDry1aFSp4wSbgbbkB56Fj4vV05+JApAXOJZKP
 LEwDdqtnT0DpwZW8q9a9Rs8BdXl0WhbnfJI5Gnw6ksjLyDSI397AFrT6QvhslkBDw6xD
 fs7ajeUBc5JopGP1H05mgpTUqHXigrmhnoCRIn6iNQQeDJtr5aVM7yNS1WeYIOpLF8S4
 5WgRWfyNfnjSOl7EMCAURHYw9UwByYR7dtwQzUHLJA0wYloDq/NMviCTUDfj2+1kOPMQ
 q7bg==
X-Gm-Message-State: ACgBeo1H6mWL1fSKriNzhHb/5PW72mmYp775u8/0xIqYXqYS4MrJXo0/
 DsA+UJau4wCRfcSSx1Z+1/YWuw==
X-Google-Smtp-Source: AA6agR6tlZ6lipg0LbvmTHSoFvRuk+c8bMpy+xutSGU9uznmPiW8clis3HAavotx47BUmL19oZkVaQ==
X-Received: by 2002:a05:6402:428e:b0:443:8279:13ea with SMTP id
 g14-20020a056402428e00b00443827913eamr36367342edc.294.1662196451009; 
 Sat, 03 Sep 2022 02:14:11 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x17-20020aa7dad1000000b0043bc4b28464sm2987308eds.34.2022.09.03.02.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 02:14:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE4E81FFB7;
 Sat,  3 Sep 2022 10:14:09 +0100 (BST)
References: <20220902174637.1174258-1-iii@linux.ibm.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/tcg/x86_64: add cross-modifying code test
Date: Sat, 03 Sep 2022 10:13:03 +0100
In-reply-to: <20220902174637.1174258-1-iii@linux.ibm.com>
Message-ID: <87sfl8lt0e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> commit f025692c992c ("accel/tcg: Clear PAGE_WRITE before translation")
> fixed cross-modifying code handling, but did not add a test. The
> changed code was further improved recently [1], and I was not sure
> whether these modifications were safe (spoiler: they were fine).
>
> Add a test to make sure there are no regressions.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00034.html
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/x86_64/Makefile.target        |  6 +-
>  tests/tcg/x86_64/cross-modifying-code.c | 80 +++++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/x86_64/cross-modifying-code.c
>
> diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile=
.target
> index b71a6bcd5e..58e7bfd681 100644
> --- a/tests/tcg/x86_64/Makefile.target
> +++ b/tests/tcg/x86_64/Makefile.target
> @@ -10,6 +10,7 @@ include $(SRC_PATH)/tests/tcg/i386/Makefile.target
>=20=20
>  ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
>  X86_64_TESTS +=3D vsyscall
> +X86_64_TESTS +=3D cross-modifying-code
>  TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
>  else
>  TESTS=3D$(MULTIARCH_TESTS)
> @@ -20,5 +21,8 @@ test-x86_64: LDFLAGS+=3D-lm -lc
>  test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
>  	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
>=20=20
> -vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
> +%: $(SRC_PATH)/tests/tcg/x86_64/%.c
>  	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)

You shouldn't need to redefine the default rule when you can tweak the flags

> +
> +smc: CFLAGS+=3D-pthread
> +smc: LDFLAGS+=3D-pthread

I think this must be from an old iteration because:

make[1]: Entering directory '/home/alex/lsrc/qemu.git/builds/all/tests/tcg/=
x86_64-linux-user'
cc -Wall -Werror -O0 -g -fno-strict-aliasing /home/alex/lsrc/qemu.git/tests=
/tcg/x86_64/cross-modifying-code.c -o cross-modifying-code -static
/usr/bin/ld: /tmp/ccK05RAk.o: in function `main':
/home/alex/lsrc/qemu.git/tests/tcg/x86_64/cross-modifying-code.c:64: undefi=
ned reference to `pthread_create'
/usr/bin/ld: /home/alex/lsrc/qemu.git/tests/tcg/x86_64/cross-modifying-code=
.c:73: undefined reference to `pthread_join'
collect2: error: ld returned 1 exit status
make[1]: *** [/home/alex/lsrc/qemu.git/tests/tcg/x86_64/Makefile.target:25:=
 cross-modifying-code] Error 1
make[1]: Leaving directory '/home/alex/lsrc/qemu.git/builds/all/tests/tcg/x=
86_64-linux-user'
make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build-tcg-te=
sts-x86_64-linux-user] Error 2


> diff --git a/tests/tcg/x86_64/cross-modifying-code.c b/tests/tcg/x86_64/c=
ross-modifying-code.c
> new file mode 100644
> index 0000000000..2704df6061
> --- /dev/null
> +++ b/tests/tcg/x86_64/cross-modifying-code.c
> @@ -0,0 +1,80 @@
> +/*
> + * Test patching code, running in one thread, from another thread.
> + *
> + * Intel SDM calls this "cross-modifying code" and recommends a special
> + * sequence, which requires both threads to cooperate.
> + *
> + * Linux kernel uses a different sequence that does not require cooperat=
ion and
> + * involves patching the first byte with int3.
> + *
> + * Finally, there is user-mode software out there that simply uses atomi=
cs, and
> + * that seems to be good enough in practice. Test that QEMU has no probl=
ems
> + * with this as well.
> + */
> +
> +#include <assert.h>
> +#include <pthread.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +
> +void add1_or_nop(long *x);
> +asm(".pushsection .rwx,\"awx\",@progbits\n"
> +    ".globl add1_or_nop\n"
> +    /* addq $0x1,(%rdi) */
> +    "add1_or_nop: .byte 0x48, 0x83, 0x07, 0x01\n"
> +    "ret\n"
> +    ".popsection\n");
> +
> +#define THREAD_WAIT 0
> +#define THREAD_PATCH 1
> +#define THREAD_STOP 2
> +
> +static void *thread_func(void *arg)
> +{
> +    int val =3D 0x0026748d; /* nop */
> +
> +    while (true) {
> +        switch (__atomic_load_n((int *)arg, __ATOMIC_SEQ_CST)) {
> +        case THREAD_WAIT:
> +            break;
> +        case THREAD_PATCH:
> +            val =3D __atomic_exchange_n((int *)&add1_or_nop, val,
> +                                      __ATOMIC_SEQ_CST);
> +            break;
> +        case THREAD_STOP:
> +            return NULL;
> +        default:
> +            assert(false);
> +            __builtin_unreachable();
> +        }
> +    }
> +}
> +
> +#define INITIAL 42
> +#define COUNT 1000000
> +
> +int main(void)
> +{
> +    int command =3D THREAD_WAIT;
> +    pthread_t thread;
> +    long x =3D 0;
> +    int err;
> +    int i;
> +
> +    err =3D pthread_create(&thread, NULL, &thread_func, &command);
> +    assert(err =3D=3D 0);
> +
> +    __atomic_store_n(&command, THREAD_PATCH, __ATOMIC_SEQ_CST);
> +    for (i =3D 0; i < COUNT; i++) {
> +        add1_or_nop(&x);
> +    }
> +    __atomic_store_n(&command, THREAD_STOP, __ATOMIC_SEQ_CST);
> +
> +    err =3D pthread_join(thread, NULL);
> +    assert(err =3D=3D 0);
> +
> +    assert(x >=3D INITIAL);
> +    assert(x <=3D INITIAL + COUNT);
> +
> +    return EXIT_SUCCESS;
> +}


--=20
Alex Benn=C3=A9e

