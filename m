Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A942F7A9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 18:05:27 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbPi2-0004Bq-Be
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 12:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbPci-0001eW-GH
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:59:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mbPcg-0007tH-Ku
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 11:59:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id z2so2921964wmc.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=M9Zr0BRmEDrZHkatsYYw2W4e++3SMvvIiOCkOTEBeIQ=;
 b=FiUr4cyjnRGUwd9mPMieSfpDEs+l7XguXn0h5cOmVl6GqP/50KTfv7ztxludA+rZOJ
 +/Eif5rrEc5wHYJZMvVempZaK36g7cxKMxKmLB0NPFbem1DAKv/54Ls3fGr3IknO3Zt7
 +fTAe1cbmZycJlEAor4XeLEkM6Y0mRIUDsKWwo750RpzVp+4WBsj1VQ/lBcaEBMe6oSD
 CXU5/0TyBo3FzvIV3WxLWPm/5basrjlegIftf8l9jfhC8NF+rsTqDkcrjEOeuOImn+F1
 jplfmDBZ69pgIVwzFfZxYUOou7+gTVrKCopqb249SGSUDwFsre94bK0sVdxkK6/cRz1F
 sH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=M9Zr0BRmEDrZHkatsYYw2W4e++3SMvvIiOCkOTEBeIQ=;
 b=ACoerVrU8VURhaVkjqXcfbO5xJxBETOjUSrlNAUedZQaFIL6nhCM7i8YM2BMo/BFqT
 I7AgSY04s0J/Qhnnm7JIJCGH4+Pzg4dEhe9edLTY61bSdu4xCc/2SJZNdteb7P4U0/pu
 vRJtNsRfGSn27TJPKif8za1W2XLRGqY99jK/ZeVp0tiYcrgNcB1J8qQnlPAANuF/d66N
 EC1azv86moMNlzmgCD9BbSqGy4Xc5gLHEgsHkNNozmzRORIkDt23phw/mRLJbAPACPQa
 2PMuDx3oPlWOjyEI8nuqkdjfrp7TUztxKkfkYGhSTTHzt7dkfh+ED7iwSmChu9u5FcFm
 HjsQ==
X-Gm-Message-State: AOAM532CTTdMwxn2lxFp/iDQQC+ohLDYEq6qQ8pHFQPCx/osOi08fVrW
 X9QEw5rKaMB/z4vCLld6LGzR+w==
X-Google-Smtp-Source: ABdhPJwYI+FhkedLAKP+kH/RlR3Em+tzh3f+hIKD6iTi/6ZAzL3yf559H8RklQhar4BpRwIo3Twxmw==
X-Received: by 2002:a7b:c193:: with SMTP id y19mr11100642wmi.27.1634313592889; 
 Fri, 15 Oct 2021 08:59:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q12sm10530271wmj.6.2021.10.15.08.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:59:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 817B31FF96;
 Fri, 15 Oct 2021 16:59:51 +0100 (BST)
References: <20210930095111.23205-1-pavel@labath.sk>
 <9b435ae3-27f3-4838-421e-f40ac58a7905@labath.sk>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Labath <pavel@labath.sk>
Subject: Re: [PATCH] gdbstub: Switch to the thread receiving a signal
Date: Fri, 15 Oct 2021 16:59:23 +0100
In-reply-to: <9b435ae3-27f3-4838-421e-f40ac58a7905@labath.sk>
Message-ID: <87czo6th1k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

> Ping.
>
> (This is my first qemu patch, so please let me know if I am doing
> something wrong.)

Apologies it slipped though the cracks. I shall have a look on Monday.

>
> regards,
> pavel
>
> On 30/09/2021 11:51, Pavel Labath wrote:
>> Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
>> thread received the signal. Otherwise, the debugger will associate it
>> with the main one. Also automatically select this thread, as that is
>> what gdb expects.
>> Signed-off-by: Pavel Labath <pavel@labath.sk>
>> ---
>>   gdbstub.c                                     |  9 ++-
>>   tests/tcg/multiarch/Makefile.target           |  7 +++
>>   .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
>>   3 files changed, 74 insertions(+), 2 deletions(-)
>>   create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.=
py
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 36b85aa..7bd4479 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -3138,8 +3138,13 @@ gdb_handlesig(CPUState *cpu, int sig)
>>       tb_flush(cpu);
>>         if (sig !=3D 0) {
>> -        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
>> -        put_packet(buf);
>> +        gdbserver_state.c_cpu =3D cpu;
>> +        gdbserver_state.g_cpu =3D cpu;
>> +        g_string_printf(gdbserver_state.str_buf,
>> +                        "T%02xthread:", target_signal_to_gdb(sig));
>> +        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
>> +        g_string_append_c(gdbserver_state.str_buf, ';');
>> +        put_strbuf();
>>       }
>>       /* put_packet() might have detected that the peer terminated the
>>          connection.  */
>> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/M=
akefile.target
>> index 85a6fb7..c7b7e8b 100644
>> --- a/tests/tcg/multiarch/Makefile.target
>> +++ b/tests/tcg/multiarch/Makefile.target
>> @@ -73,6 +73,13 @@ run-gdbstub-qxfer-auxv-read: sha1
>>   		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
>>   	"basic gdbstub qXfer:auxv:read support")
>>   +run-gdbstub-thread-breakpoint: testthread
>> +	$(call run-test, $@, $(GDB_SCRIPT) \
>> +		--gdb $(HAVE_GDB_BIN) \
>> +		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>> +		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
>> +	"hitting a breakpoint on non-main thread")
>> +
>>   else
>>   run-gdbstub-%:
>>   	$(call skip-test, "gdbstub test $*", "need working gdb")
>> diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tes=
ts/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>> new file mode 100644
>> index 0000000..798d508
>> --- /dev/null
>> +++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
>> @@ -0,0 +1,60 @@
>> +from __future__ import print_function
>> +#
>> +# Test auxiliary vector is loaded via gdbstub
>> +#
>> +# This is launched via tests/guest-debug/run-test.py
>> +#
>> +
>> +import gdb
>> +import sys
>> +
>> +failcount =3D 0
>> +
>> +def report(cond, msg):
>> +    "Report success/fail of test"
>> +    if cond:
>> +        print ("PASS: %s" % (msg))
>> +    else:
>> +        print ("FAIL: %s" % (msg))
>> +        global failcount
>> +        failcount +=3D 1
>> +
>> +def run_test():
>> +    "Run through the tests one by one"
>> +
>> +    sym, ok =3D gdb.lookup_symbol("thread1_func")
>> +    gdb.execute("b thread1_func")
>> +    gdb.execute("c")
>> +
>> +    frame =3D gdb.selected_frame()
>> +    report(str(frame.function()) =3D=3D "thread1_func", "break @ %s"%fr=
ame)
>> +
>> +#
>> +# This runs as the script it sourced (via -x, via run-test.py)
>> +#
>> +try:
>> +    inferior =3D gdb.selected_inferior()
>> +    arch =3D inferior.architecture()
>> +    print("ATTACHED: %s" % arch.name())
>> +except (gdb.error, AttributeError):
>> +    print("SKIPPING (not connected)", file=3Dsys.stderr)
>> +    exit(0)
>> +
>> +if gdb.parse_and_eval('$pc') =3D=3D 0:
>> +    print("SKIP: PC not set")
>> +    exit(0)
>> +
>> +try:
>> +    # These are not very useful in scripts
>> +    gdb.execute("set pagination off")
>> +    gdb.execute("set confirm off")
>> +
>> +    # Run the actual tests
>> +    run_test()
>> +except (gdb.error):
>> +    print ("GDB Exception: %s" % (sys.exc_info()[0]))
>> +    failcount +=3D 1
>> +    pass
>> +
>> +print("All tests complete: %d failures" % failcount)
>> +exit(failcount)
>>=20


--=20
Alex Benn=C3=A9e

