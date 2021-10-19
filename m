Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E3433D3A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:22:10 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsoT-0006A9-Ca
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcsg8-0002J3-Uh
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 13:13:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcsg3-0000sa-Re
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 13:13:32 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u8-20020a05600c440800b0030d90076dabso2531737wmn.1
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lQ6BhzjqE5OODX3mXvU/BhFGAe9Bl3HmLo2+L0zvWds=;
 b=VLbWr8au8UavT4EbXmR5VYFfd864+ez0wX7QiqKDbmVpQ6y8+pIDsClN3K/MEsIkm8
 J0H6oAEkaVXVaMABjZXCix0wry0DF2H5yMTT+1c9OC4pEbY7ESoU7K6Uyh1EPU/xmnM4
 0syO5seslEmheaxsbqyPgi8iTnQS6rBW9Vanm1O7BWMjVBDV0jKpT6rGeO9xsrU0vB4U
 d4iA6kcadtALWwyMOi/PFY2yLCX1QSBcZFpwYw3PdZyBJI8+zA7G64XH0HJ0cCdoTA37
 6HJdohFpBiKB2UDGp8T3GDI8j0aeFv13vs2KHBVknYdi8163FvkM0zSgCu+sN1R7a0rv
 uQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lQ6BhzjqE5OODX3mXvU/BhFGAe9Bl3HmLo2+L0zvWds=;
 b=3a8vP3X1PwK9PWxgyzFy5N+3ILi6iEWMJgsI8Ez978Gk71RTlazWthf+Asvl/8zrLR
 XB6Vy2J6rt4Hb810qQGJfFjjLJYO/IwMlgPLmoRu4f9q3eqfzkmNYGgLbCRsrjjQbsaT
 KRXQtOYPAJ8IKqdi0mqfxSMxExKOJb71hFe7UPObsR77MPCBgJaRInlt5sbTyd7dtCJi
 DXFrcDQ2Qhs8cNslO9iFRhbc3PBtebDzdEE1g//CzDkRimD60QRM188diCwiP1kacwBc
 JZqk7S2l594TRkQ65HobBPutpM1A5fZcA8f5NLHd/134tsNekv6u3ADpuLyTFP/OpoMQ
 QNSg==
X-Gm-Message-State: AOAM5314b+wWSI7bmYdrdaYbujPy94AepXnxnb6bwiXn6QcLfvbD1akZ
 czLkBsC4YqCR+GCcALMxqNEl9Q==
X-Google-Smtp-Source: ABdhPJx1/LZ68sa8u28gG75gz9idZHncZRG9H75GlHM9NCFqTCF2uN5zNa5Kl4KVLHszOQxd/zoQdw==
X-Received: by 2002:a5d:4c90:: with SMTP id z16mr21404047wrs.67.1634663606205; 
 Tue, 19 Oct 2021 10:13:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p25sm2673575wma.2.2021.10.19.10.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:13:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC4AD1FF96;
 Tue, 19 Oct 2021 18:13:24 +0100 (BST)
References: <20210930095111.23205-1-pavel@labath.sk>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Labath <pavel@labath.sk>
Subject: Re: [PATCH] gdbstub: Switch to the thread receiving a signal
Date: Tue, 19 Oct 2021 18:02:24 +0100
In-reply-to: <20210930095111.23205-1-pavel@labath.sk>
Message-ID: <87o87lvsy3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Labath <pavel@labath.sk> writes:

> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
> thread received the signal. Otherwise, the debugger will associate it
> with the main one. Also automatically select this thread, as that is
> what gdb expects.
>
> Signed-off-by: Pavel Labath <pavel@labath.sk>
> ---
>  gdbstub.c                                     |  9 ++-
>  tests/tcg/multiarch/Makefile.target           |  7 +++
>  .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>  3 files changed, 74 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 36b85aa..7bd4479 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -3138,8 +3138,13 @@ gdb_handlesig(CPUState *cpu, int sig)
>      tb_flush(cpu);
>=20=20
>      if (sig !=3D 0) {
> -        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
> -        put_packet(buf);
> +        gdbserver_state.c_cpu =3D cpu;
> +        gdbserver_state.g_cpu =3D cpu;
> +        g_string_printf(gdbserver_state.str_buf,
> +                        "T%02xthread:", target_signal_to_gdb(sig));
> +        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
> +        g_string_append_c(gdbserver_state.str_buf, ';');
> +        put_strbuf();
>      }
>      /* put_packet() might have detected that the peer terminated the
>         connection.  */
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Ma=
kefile.target
> index 85a6fb7..c7b7e8b 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -73,6 +73,13 @@ run-gdbstub-qxfer-auxv-read: sha1
>  		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
>  	"basic gdbstub qXfer:auxv:read support")
>=20=20
> +run-gdbstub-thread-breakpoint: testthread
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
> +	"hitting a breakpoint on non-main thread")
> +

You also need to add the test to EXTRA_RUNS here (or just bellow in fact).

>  else
>  run-gdbstub-%:
>  	$(call skip-test, "gdbstub test $*", "need working gdb")
> diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/test=
s/tcg/multiarch/gdbstub/test-thread-breakpoint.py
> new file mode 100644
> index 0000000..798d508
> --- /dev/null
> +++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
> @@ -0,0 +1,60 @@
> +from __future__ import print_function
> +#
> +# Test auxiliary vector is loaded via gdbstub
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +failcount =3D 0
> +
> +def report(cond, msg):
> +    "Report success/fail of test"
> +    if cond:
> +        print ("PASS: %s" % (msg))
> +    else:
> +        print ("FAIL: %s" % (msg))
> +        global failcount
> +        failcount +=3D 1
> +
> +def run_test():
> +    "Run through the tests one by one"
> +
> +    sym, ok =3D gdb.lookup_symbol("thread1_func")
> +    gdb.execute("b thread1_func")
> +    gdb.execute("c")
> +
> +    frame =3D gdb.selected_frame()
> +    report(str(frame.function()) =3D=3D "thread1_func", "break @
>  %s"%frame)

Does this actually check the correct thread is reported?

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
> +if gdb.parse_and_eval('$pc') =3D=3D 0:
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
> +    print ("GDB Exception: %s" % (sys.exc_info()[0]))
> +    failcount +=3D 1
> +    pass
> +
> +print("All tests complete: %d failures" % failcount)
> +exit(failcount)


--=20
Alex Benn=C3=A9e

