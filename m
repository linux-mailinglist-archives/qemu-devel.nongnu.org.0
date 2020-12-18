Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093E2DE518
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:47:46 +0100 (CET)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqH2m-0000ni-KW
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqH11-00005d-4W; Fri, 18 Dec 2020 09:45:55 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqH0x-0003jU-JW; Fri, 18 Dec 2020 09:45:54 -0500
Received: by mail-lf1-x136.google.com with SMTP id o19so6102103lfo.1;
 Fri, 18 Dec 2020 06:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9mk0AlZyqvNzt+BRv+OXsK69rV33wEA+ZfwE8NgOFcw=;
 b=CUSGU7uG5aJHe1Vm3dpAp+gK6bMblxBvHFtflOwIGN+UMTFS7H5YAXoBL75CQLxR3A
 QK2MGhZ1cNkRyytVEdeL/1LYNgrGOnl6XkaDh1sFv+VqrzWyrDyiZmuRM1w8R/ascnEr
 +CSpi+31Yn6pUhS5CiLkLp5f3RO0rD5wx8F/HVO0SYXcJ9Lr0/D1Hgyw0qEChlatq66b
 /mzT7+bW1Jx9PPWP1GhiKKXv8Dt5Uy2Rlg2DPCP4iUwzEuEtWKZ2rvT8oBSCJoLGF/ar
 o3/D1rugIEBha4YHo5K10pc76eToYygwlIIQP5Mrkt6MHlh4Jk2x3nLRiBIp9NPBNVUh
 5nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9mk0AlZyqvNzt+BRv+OXsK69rV33wEA+ZfwE8NgOFcw=;
 b=ku2chEYdeV2MC60/wX/7jV1bU05BGcNM337Cb51ldgtOxjQJkk195gToG+/Q/AuzNw
 x7ALZ1sJt4l0dBU5h691k09w4ApId/rqJ777+xCM5es7Dxze/oIlNIVdh6j10TDVPOwG
 UGTAHHOlsHXI8b7o34aS82vN3Zc2BSFpy2ppeh9d0F2NUQE0bKc/uLALUFoIooGiSUv6
 qFOwXvtkfx3PKqM7iwtlGP5soXryMmOs15Ysw8DZ09ANa7k9fX23cX0DI5UEeMbDSwuA
 S/nZEzs/liVp6z5vNpq+YnKGhLZPdFe4uIlEIgRbQx1TLbe3FShIlxIVlcZwaS9YoqMk
 q/jA==
X-Gm-Message-State: AOAM533/YTMKZiDkU2VBOjIcvEvA65xCEAVx+v3WdYPHHzj0fCV6nur9
 Uv/dKEFV1HVSKCoZKE9A1ZR3Lw7jS/4Diw==
X-Google-Smtp-Source: ABdhPJwpQVRWD8gY3YKXd89hlol4zIW4mUyQbAYEKyFSr3MeEHNGdAdrIcwMKz67tQ4Nzh2xqzv7hA==
X-Received: by 2002:a05:651c:48e:: with SMTP id
 s14mr2064382ljc.159.1608302748755; 
 Fri, 18 Dec 2020 06:45:48 -0800 (PST)
Received: from [10.101.1.184] ([185.224.57.162])
 by smtp.gmail.com with ESMTPSA id k5sm943995lfo.61.2020.12.18.06.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 06:45:47 -0800 (PST)
Subject: Re: [PATCH v2 4/9] gdbstub: implement a softmmu based test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df046993-7800-7f7f-e612-385734c25ba2@amsat.org>
Date: Fri, 18 Dec 2020 15:45:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218112707.28348-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:27 PM, Alex Bennée wrote:
> This adds a new tests that allows us to test softmmu only features
> including watchpoints. To do achieve this we need to:
> 
>   - add _exit: labels to the boot codes
>   - write a memory.py test case
>   - plumb the test case into the build system
>   - tweak the run_test script to:
>     - re-direct output when asked
>     - use socket based connection for all tests
>     - add a small pause before connection
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/guest-debug/run-test.py                 |  36 +++--
>  tests/tcg/aarch64/Makefile.softmmu-target     |   1 +
>  tests/tcg/aarch64/system/boot.S               |   1 +
>  tests/tcg/i386/Makefile.softmmu-target        |   1 +
>  tests/tcg/i386/system/boot.S                  |   2 +-
>  tests/tcg/multiarch/gdbstub/memory.py         | 130 ++++++++++++++++++
>  .../multiarch/system/Makefile.softmmu-target  |  19 ++-
>  tests/tcg/x86_64/Makefile.softmmu-target      |   1 +
>  tests/tcg/x86_64/system/boot.S                |   2 +-
>  9 files changed, 181 insertions(+), 12 deletions(-)
>  create mode 100644 tests/tcg/multiarch/gdbstub/memory.py
> 
> diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
> index 0c4f5c3808..8b91ff95af 100755
> --- a/tests/guest-debug/run-test.py
> +++ b/tests/guest-debug/run-test.py
> @@ -16,6 +16,7 @@ import subprocess
>  import shutil
>  import shlex
>  import os
> +from time import sleep
>  from tempfile import TemporaryDirectory
>  
>  def get_args():
> @@ -27,10 +28,21 @@ def get_args():
>                          required=True)
>      parser.add_argument("--test", help="GDB test script",
>                          required=True)
> -    parser.add_argument("--gdb", help="The gdb binary to use", default=None)
> +    parser.add_argument("--gdb", help="The gdb binary to use",
> +                        default=None)
> +    parser.add_argument("--output", help="A file to redirect output to")
>  
>      return parser.parse_args()
>  
> +
> +def log(output, msg):

Maybe simplify as:

  def log(msg, out=sys.stdout):
      output.write(msg + "\n")
      output.flush()

> +    if output:
> +        output.write(msg + "\n")
> +        output.flush()
> +    else:
> +        print(msg)
> +
> +
>  if __name__ == '__main__':
>      args = get_args()
>  
> @@ -42,18 +54,25 @@ if __name__ == '__main__':
>      if not args.gdb:
>          print("We need gdb to run the test")
>          exit(-1)
> +    if args.output:
> +        output = open(args.output, "w")
> +    else:
> +        output = None
>  
>      socket_dir = TemporaryDirectory("qemu-gdbstub")
>      socket_name = os.path.join(socket_dir.name, "gdbstub.socket")
>  
>      # Launch QEMU with binary
>      if "system" in args.qemu:
> -        cmd = "%s %s %s -s -S" % (args.qemu, args.qargs, args.binary)
> +        cmd = "%s %s %s -gdb unix:path=%s,server" % (args.qemu,
> +                                                     args.qargs,
> +                                                     args.binary,
> +                                                     socket_name)

What about Windows hosts?

>      else:
>          cmd = "%s %s -g %s %s" % (args.qemu, args.qargs, socket_name,
>                                    args.binary)
>  
> -    print("QEMU CMD: %s" % (cmd))
> +    log(output, "QEMU CMD: %s" % (cmd))
>      inferior = subprocess.Popen(shlex.split(cmd))
>  
>      # Now launch gdb with our test and collect the result
> @@ -63,16 +82,15 @@ if __name__ == '__main__':
>      # disable prompts in case of crash
>      gdb_cmd += " -ex 'set confirm off'"
>      # connect to remote
> -    if "system" in args.qemu:
> -        gdb_cmd += " -ex 'target remote localhost:1234'"
> -    else:
> -        gdb_cmd += " -ex 'target remote %s'" % (socket_name)
> +    gdb_cmd += " -ex 'target remote %s'" % (socket_name)
>      # finally the test script itself
>      gdb_cmd += " -x %s" % (args.test)
>  
> -    print("GDB CMD: %s" % (gdb_cmd))
>  
> -    result = subprocess.call(gdb_cmd, shell=True);
> +    sleep(1)
> +    log(output, "GDB CMD: %s" % (gdb_cmd))
> +
> +    result = subprocess.call(gdb_cmd, shell=True, stdout=output)
>  
>      # A negative result is the result of an internal gdb failure like
>      # a crash. We force a return of 0 so we don't fail the test on
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
> index 1057a8ac49..a7286ac295 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -15,6 +15,7 @@ CRT_PATH=$(AARCH64_SYSTEM_SRC)
>  LINK_SCRIPT=$(AARCH64_SYSTEM_SRC)/kernel.ld
>  LDFLAGS=-Wl,-T$(LINK_SCRIPT)
>  TESTS+=$(AARCH64_TESTS) $(MULTIARCH_TESTS)
> +EXTRA_RUNS+=$(MULTIARCH_RUNS)
>  CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
>  LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
>  
> diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
> index b14e94f332..e190b1efa6 100644
> --- a/tests/tcg/aarch64/system/boot.S
> +++ b/tests/tcg/aarch64/system/boot.S
> @@ -197,6 +197,7 @@ __start:
>  	bl	main
>  
>  	/* pass return value to sys exit */
> +_exit:
>  	mov    x1, x0
>  	ldr    x0, =0x20026 /* ADP_Stopped_ApplicationExit */
>  	stp    x0, x1, [sp, #-16]!
> diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
> index 1c8790eecd..5266f2335a 100644
> --- a/tests/tcg/i386/Makefile.softmmu-target
> +++ b/tests/tcg/i386/Makefile.softmmu-target
> @@ -19,6 +19,7 @@ CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
>  LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
>  
>  TESTS+=$(MULTIARCH_TESTS)
> +EXTRA_RUNS+=$(MULTIARCH_RUNS)
>  
>  # building head blobs
>  .PRECIOUS: $(CRT_OBJS)
> diff --git a/tests/tcg/i386/system/boot.S b/tests/tcg/i386/system/boot.S
> index 90aa174908..794c2cb0ad 100644
> --- a/tests/tcg/i386/system/boot.S
> +++ b/tests/tcg/i386/system/boot.S
> @@ -76,7 +76,7 @@ _start:
>           */
>          call main
>  
> -        /* output any non-zero result in eax to isa-debug-exit device */
> +_exit:	/* output any non-zero result in eax to isa-debug-exit device */
>          test %al, %al
>          jz 1f
>          out %ax, $0xf4
> diff --git a/tests/tcg/multiarch/gdbstub/memory.py b/tests/tcg/multiarch/gdbstub/memory.py
> new file mode 100644
> index 0000000000..67864ad902
> --- /dev/null
> +++ b/tests/tcg/multiarch/gdbstub/memory.py
> @@ -0,0 +1,130 @@
> +from __future__ import print_function

Missing license.

> +#
> +# Test some of the softmmu debug features with the multiarch memory
> +# test. It is a port of the original vmlinux focused test case but
> +# using the "memory" test instead.
> +#
> +# This is launched via tests/guest-debug/run-test.py
> +#
> +
> +import gdb
> +import sys
> +
> +failcount = 0
> +
> +
> +def report(cond, msg):
> +    "Report success/fail of test"
> +    if cond:
> +        print("PASS: %s" % (msg))
> +    else:
> +        print("FAIL: %s" % (msg))
> +        global failcount
> +        failcount += 1
> +
> +
> +def check_step():
> +    "Step an instruction, check it moved."
> +    start_pc = gdb.parse_and_eval('$pc')
> +    gdb.execute("si")
> +    end_pc = gdb.parse_and_eval('$pc')
> +
> +    return not (start_pc == end_pc)
> +
> +
> +#
> +# Currently it's hard to create a hbreak with the pure python API and
> +# manually matching PC to symbol address is a bit flaky thanks to
> +# function prologues. However internally QEMU's gdbstub treats them
> +# the same as normal breakpoints so it will do for now.
> +#
> +def check_break(sym_name):
> +    "Setup breakpoint, continue and check we stopped."
> +    sym, ok = gdb.lookup_symbol(sym_name)
> +    bp = gdb.Breakpoint(sym_name, gdb.BP_BREAKPOINT)
> +
> +    gdb.execute("c")
> +
> +    # hopefully we came back

What if we don't? Not a blocking problem today, we'll figure
if we need to improve that later.

> +    end_pc = gdb.parse_and_eval('$pc')
> +    report(bp.hit_count == 1,
> +           "break @ %s (%s %d hits)" % (end_pc, sym.value(), bp.hit_count))
> +
> +    bp.delete()
> +
> +
> +def do_one_watch(sym, wtype, text):
> +
> +    wp = gdb.Breakpoint(sym, gdb.BP_WATCHPOINT, wtype)
> +    gdb.execute("c")
> +    report_str = "%s for %s" % (text, sym)
> +
> +    if wp.hit_count > 0:
> +        report(True, report_str)
> +        wp.delete()
> +    else:
> +        report(False, report_str)
> +
> +
> +def check_watches(sym_name):
> +    "Watch a symbol for any access."
> +
> +    # Should hit for any read
> +    do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
> +
> +    # Again should hit for reads
> +    do_one_watch(sym_name, gdb.WP_READ, "rwatch")
> +
> +    # Finally when it is written
> +    do_one_watch(sym_name, gdb.WP_WRITE, "watch")
> +
> +
> +def run_test():
> +    "Run through the tests one by one"
> +
> +    print("Checking we can step the first few instructions")
> +    step_ok = 0
> +    for i in range(3):
> +        if check_step():
> +            step_ok += 1
> +
> +    report(step_ok == 3, "single step in boot code")
> +
> +    # If we get here we have missed some of the other breakpoints.
> +    print("Setup catch-all for _exit")
> +    cbp = gdb.Breakpoint("_exit", gdb.BP_BREAKPOINT)
> +
> +    check_break("main")
> +    check_watches("test_data[128]")
> +
> +    report(cbp.hit_count == 0, "didn't reach backstop")
> +
> +#
> +# This runs as the script it sourced (via -x, via run-test.py)
> +#
> +try:
> +    inferior = gdb.selected_inferior()
> +    arch = inferior.architecture()
> +    print("ATTACHED: %s" % arch.name())
> +except (gdb.error, AttributeError):
> +    print("SKIPPING (not connected)", file=sys.stderr)
> +    exit(0)
> +
> +if gdb.parse_and_eval('$pc') == 0:
> +    print("SKIP: PC not set")
> +    exit(0)
> +
> +try:
> +    # These are not very useful in scripts
> +    gdb.execute("set pagination off")
> +
> +    # Run the actual tests
> +    run_test()
> +except (gdb.error):
> +    print("GDB Exception: %s" % (sys.exc_info()[0]))
> +    failcount += 1
> +    pass
> +
> +# Finally kill the inferior and exit gdb with a count of failures
> +gdb.execute("kill")
> +exit(failcount)
> diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
> index db4bbeda44..4657f6e4cf 100644
> --- a/tests/tcg/multiarch/system/Makefile.softmmu-target
> +++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
> @@ -7,8 +7,25 @@
>  # complications of building.
>  #
>  
> -MULTIARCH_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/multiarch/system
> +MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
> +MULTIARCH_SYSTEM_SRC=$(MULTIARCH_SRC)/system
>  VPATH+=$(MULTIARCH_SYSTEM_SRC)
>  
>  MULTIARCH_TEST_SRCS=$(wildcard $(MULTIARCH_SYSTEM_SRC)/*.c)
>  MULTIARCH_TESTS = $(patsubst $(MULTIARCH_SYSTEM_SRC)/%.c, %, $(MULTIARCH_TEST_SRCS))
> +
> +ifneq ($(HAVE_GDB_BIN),)
> +GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> +
> +run-gdbstub-memory: memory
> +	$(call run-test, $@, $(GDB_SCRIPT) \
> +		--gdb $(HAVE_GDB_BIN) \
> +		--qemu $(QEMU) \
> +		--output $<.gdb.out \
> +		--qargs \
> +		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
> +	"softmmu gdbstub support")
> +
> +MULTIARCH_RUNS += run-gdbstub-memory
> +endif
> diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
> index df252e761c..1bd763f2e6 100644
> --- a/tests/tcg/x86_64/Makefile.softmmu-target
> +++ b/tests/tcg/x86_64/Makefile.softmmu-target
> @@ -19,6 +19,7 @@ CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
>  LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
>  
>  TESTS+=$(MULTIARCH_TESTS)
> +EXTRA_RUNS+=$(MULTIARCH_RUNS)
>  
>  # building head blobs
>  .PRECIOUS: $(CRT_OBJS)
> diff --git a/tests/tcg/x86_64/system/boot.S b/tests/tcg/x86_64/system/boot.S
> index 73b19a2bda..f8a2fcc839 100644
> --- a/tests/tcg/x86_64/system/boot.S
> +++ b/tests/tcg/x86_64/system/boot.S
> @@ -124,7 +124,7 @@ _start:
>          /* don't worry about stack frame, assume everthing is garbage when we return */
>  	call main
>  
> -        /* output any non-zero result in eax to isa-debug-exit device */
> +_exit:	/* output any non-zero result in eax to isa-debug-exit device */
>          test %al, %al
>          jz 1f
>          out %ax, $0xf4
> 

LGTM. With license:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

