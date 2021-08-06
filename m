Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E13E2CBE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:35:03 +0200 (CEST)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0wA-0000ex-8I
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0ul-0008Lg-83
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:33:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0uj-0007Mb-5b
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:33:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id p5so11374243wro.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lW3r1aVX52WTbwZbWbgt88BGTsHLfjATV5IvCRAw3mo=;
 b=F7amXvOqj/CuYNvDFNPnZz9wg9wKOWOqItmIffv9dVmW9gBpSD4n9iPEsD+fYsJ+uw
 oQoixWURFRoLhFqwgdjbb+rL2cRuaKTBcJtKoPv3Od5lApeNoQ/rdVpUo8GsUv5aVFGX
 0lrmS4XW687/9iDXZTUr0b8/j6eNWUAgIDTvpLwFE975t9ANCCoPVZSMS1vQAplv5q2Z
 i0+3VU4wifoLcavbg9krNIACjU7/5M7/DF7wgVyoAaQDMh2TJMHEw00ZbGsTrMDnbYHO
 3TfWA3J99oUsNxiphINvVnzFqTJbhsOmVctoAoAS3BRNRGxBnKWh8tALP8IE0h3d+JiX
 XJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lW3r1aVX52WTbwZbWbgt88BGTsHLfjATV5IvCRAw3mo=;
 b=OXBL3Pw/cmxtsuzlwCTk5IfNI3OscsQ0AjlGoMkYTaQ4cUJFs3qrGpzGreYjgLT9F1
 aM7TpKontU99VZi+3DWJcAcfQhfxzjLRtWdOa1rn9hUXa2F6+nZjihZIAqBfp0+3/HUU
 1xE4l+3+Qa6JwAtkmgP+EDiH9+usS0Z3H+n5fpYF3HefRQU7Rg4rso8HB6tMM+pUIeEH
 beZ2Vw4urgGVLFW57yTm55fn0FdQpI3mgm+IwtxJoY+1lw3ofe15iVjwVnGRhs+7jkm2
 z9K8Nm8dRXUPLxZEdr39PE7q/AsrWLN518yv8vEWp1SQAp0oF5oRP2SNJRjUbOYUKaLB
 wD2Q==
X-Gm-Message-State: AOAM5322IlwNP2zt3iIg1RRUy08lRbzHmHUimIoUEHQw9J3X0BxViV2a
 XqQNPBQ4xITvujYT8+VbLyGoiw==
X-Google-Smtp-Source: ABdhPJwFWl4XJAwimQS+xMOf87yr4yG05/QkUdwA6tYPwCDycMEfpw8cSi0wsx0/68XvTBkNexLUOw==
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr10802898wru.415.1628260409163; 
 Fri, 06 Aug 2021 07:33:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm9471994wrq.59.2021.08.06.07.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:33:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3BA141FF96;
 Fri,  6 Aug 2021 15:33:27 +0100 (BST)
References: <20210804225146.154513-1-iii@linux.ibm.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Date: Fri, 06 Aug 2021 15:33:17 +0100
In-reply-to: <20210804225146.154513-1-iii@linux.ibm.com>
Message-ID: <874kc2y761.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
> and that signal handling interacts properly with debugging.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>
> v7: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
> v7 -> v8: Another rebase needed due to the conflict with Jonathan's
>           50e36dd61652.
>
>  tests/tcg/s390x/Makefile.target               |  17 +-
>  tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
>  tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
>  3 files changed, 257 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
>  create mode 100644 tests/tcg/s390x/signals-s390x.c
>
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.t=
arget
> index bd084c7840..cc64dd32d2 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -1,4 +1,5 @@
> -VPATH+=3D$(SRC_PATH)/tests/tcg/s390x
> +S390X_SRC=3D$(SRC_PATH)/tests/tcg/s390x
> +VPATH+=3D$(S390X_SRC)
>  CFLAGS+=3D-march=3DzEC12 -m64
>  TESTS+=3Dhello-s390x
>  TESTS+=3Dcsst
> @@ -9,3 +10,17 @@ TESTS+=3Dpack
>  TESTS+=3Dmvo
>  TESTS+=3Dmvc
>  TESTS+=3Dtrap
> +TESTS+=3Dsignals-s390x
> +
> +ifneq ($(HAVE_GDB_BIN),)
> +GDB_SCRIPT=3D$(SRC_PATH)/tests/guest-debug/run-test.py
> +
> +run-gdbstub-signals-s390x: signals-s390x
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
> +	"mixing signals and debugging on s390x")
> +
> +EXTRA_RUNS +=3D run-gdbstub-signals-s390x
> +endif
> diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py b/tests/tcg/s3=
90x/gdbstub/test-signals-s390x.py
> new file mode 100644
> index 0000000000..80a284b475
> --- /dev/null
> +++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> @@ -0,0 +1,76 @@
> +from __future__ import print_function
> +
> +#
> +# Test that signals and debugging mix well together on s390x.
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +failcount =3D 0
> +
> +
> +def report(cond, msg):
> +    """Report success/fail of test"""
> +    if cond:
> +        print("PASS: %s" % (msg))
> +    else:
> +        print("FAIL: %s" % (msg))
> +        global failcount
> +        failcount +=3D 1
> +
> +
> +def run_test():
> +    """Run through the tests one by one"""
> +    illegal_op =3D gdb.Breakpoint("illegal_op")
> +    stg =3D gdb.Breakpoint("stg")
> +    mvc_8 =3D gdb.Breakpoint("mvc_8")
> +
> +    # Expect the following events:
> +    # 1x illegal_op breakpoint
> +    # 2x stg breakpoint, segv, breakpoint
> +    # 2x mvc_8 breakpoint, segv, breakpoint
> +    for _ in range(14):
> +        gdb.execute("c")
> +    report(illegal_op.hit_count =3D=3D 1, "illegal_op.hit_count =3D=3D 1=
")
> +    report(stg.hit_count =3D=3D 4, "stg.hit_count =3D=3D 4")
> +    report(mvc_8.hit_count =3D=3D 4, "mvc_8.hit_count =3D=3D 4")
> +
> +    # The test must succeed.
> +    gdb.Breakpoint("_exit")
> +    gdb.execute("c")
> +    status =3D int(gdb.parse_and_eval("$r2"))
> +    report(status =3D=3D 0, "status =3D=3D 0");
> +
> +
> +#
> +# This runs as the script it sourced (via -x, via run-test.py)
> +#
> +try:
> +    inferior =3D gdb.selected_inferior()
> +    arch =3D inferior.architecture()
> +    print("ATTACHED: %s" % arch.name())
> +except (gdb.error, AttributeError):
> +    print("SKIPPING (not connected)", file=3Dsys.stderr)
> +    exit(0)
> +
> +if gdb.parse_and_eval("$pc") =3D=3D 0:
> +    print("SKIP: PC not set")
> +    exit(0)
> +
> +try:
> +    # These are not very useful in scripts
> +    gdb.execute("set pagination off")
> +    gdb.execute("set confirm off")
> +
> +    # Run the actual tests
> +    run_test()
> +except (gdb.error):
> +    print("GDB Exception: %s" % (sys.exc_info()[0]))
> +    failcount +=3D 1
> +    pass
> +
> +print("All tests complete: %d failures" % failcount)
> +exit(failcount)
> diff --git a/tests/tcg/s390x/signals-s390x.c b/tests/tcg/s390x/signals-s3=
90x.c
> new file mode 100644
> index 0000000000..dc2f8ee59a
> --- /dev/null
> +++ b/tests/tcg/s390x/signals-s390x.c
> @@ -0,0 +1,165 @@
> +#include <assert.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <ucontext.h>
> +#include <unistd.h>
> +
> +/*
> + * Various instructions that generate SIGILL and SIGSEGV. They could hav=
e been
> + * defined in a separate .s file, but this would complicate the build, s=
o the
> + * inline asm is used instead.
> + */
> +
> +void illegal_op(void);
> +void after_illegal_op(void);
> +asm(".globl\tillegal_op\n"
> +    "illegal_op:\t.byte\t0x00,0x00\n"
> +    "\t.globl\tafter_illegal_op\n"
> +    "after_illegal_op:\tbr\t%r14");
> +
> +void stg(void *dst, unsigned long src);
> +asm(".globl\tstg\n"
> +    "stg:\tstg\t%r3,0(%r2)\n"
> +    "\tbr\t%r14");
> +
> +void mvc_8(void *dst, void *src);
> +asm(".globl\tmvc_8\n"
> +    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
> +    "\tbr\t%r14");
> +
> +static void safe_puts(const char *s)
> +{
> +    write(0, s, strlen(s));
> +    write(0, "\n", 1);
> +}
> +
> +enum exception {
> +    exception_operation,
> +    exception_translation,
> +    exception_protection,
> +};
> +
> +static struct {
> +    int sig;
> +    void *addr;
> +    unsigned long psw_addr;
> +    enum exception exception;
> +} expected;
> +
> +static void handle_signal(int sig, siginfo_t *info, void *ucontext)
> +{
> +    void *page;
> +    int err;
> +
> +    if (sig !=3D expected.sig) {
> +        safe_puts("[  FAILED  ] wrong signal");
> +        _exit(1);
> +    }
> +
> +    if (info->si_addr !=3D expected.addr) {
> +        safe_puts("[  FAILED  ] wrong si_addr");
> +        _exit(1);
> +    }
> +
> +    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr !=3D expected.psw=
_addr) {
> +        safe_puts("[  FAILED  ] wrong psw.addr");
> +        _exit(1);
> +    }
> +
> +    switch (expected.exception) {
> +    case exception_translation:
> +        page =3D mmap(expected.addr, 4096, PROT_READ | PROT_WRITE,
> +                    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> +        if (page !=3D expected.addr) {
> +            safe_puts("[  FAILED  ] mmap() failed");
> +            _exit(1);
> +        }
> +        break;
> +    case exception_protection:
> +        err =3D mprotect(expected.addr, 4096, PROT_READ | PROT_WRITE);
> +        if (err !=3D 0) {
> +            safe_puts("[  FAILED  ] mprotect() failed");
> +            _exit(1);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void check_sigsegv(void *func, enum exception exception,
> +                          unsigned long val)
> +{
> +    int prot;
> +    unsigned long *page;
> +    unsigned long *addr;
> +    int err;
> +
> +    prot =3D exception =3D=3D exception_translation ? PROT_NONE : PROT_R=
EAD;
> +    page =3D mmap(NULL, 4096, prot, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    assert(page !=3D MAP_FAILED);
> +    if (exception =3D=3D exception_translation) {
> +        /* Hopefully nothing will be mapped at this address. */
> +        err =3D munmap(page, 4096);
> +        assert(err =3D=3D 0);
> +    }
> +    addr =3D page + (val & 0x1ff);
> +
> +    expected.sig =3D SIGSEGV;
> +    expected.addr =3D page;
> +    expected.psw_addr =3D (unsigned long)func;
> +    expected.exception =3D exception;
> +    if (func =3D=3D stg) {
> +        stg(addr, val);
> +    } else {
> +        assert(func =3D=3D mvc_8);
> +        mvc_8(addr, &val);
> +    }
> +    assert(*addr =3D=3D val);
> +
> +    err =3D munmap(page, 4096);
> +    assert(err =3D=3D 0);
> +}
> +
> +int main(void)
> +{
> +    struct sigaction act;
> +    int err;
> +
> +    memset(&act, 0, sizeof(act));
> +    act.sa_sigaction =3D handle_signal;
> +    act.sa_flags =3D SA_SIGINFO;
> +    err =3D sigaction(SIGILL, &act, NULL);
> +    assert(err =3D=3D 0);
> +    err =3D sigaction(SIGSEGV, &act, NULL);
> +    assert(err =3D=3D 0);
> +
> +    safe_puts("[ RUN      ] Operation exception");
> +    expected.sig =3D SIGILL;
> +    expected.addr =3D illegal_op;
> +    expected.psw_addr =3D (unsigned long)after_illegal_op;
> +    expected.exception =3D exception_operation;
> +    illegal_op();
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Translation exception from stg");
> +    check_sigsegv(stg, exception_translation, 42);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Translation exception from mvc");
> +    check_sigsegv(mvc_8, exception_translation, 4242);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Protection exception from stg");
> +    check_sigsegv(stg, exception_protection, 424242);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[ RUN      ] Protection exception from mvc");
> +    check_sigsegv(mvc_8, exception_protection, 42424242);
> +    safe_puts("[       OK ]");
> +
> +    safe_puts("[  PASSED  ]");
> +
> +    _exit(0);
> +}


--=20
Alex Benn=C3=A9e

