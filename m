Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD972F18A8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:49:20 +0100 (CET)
Received: from localhost ([::1]:52926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyyVS-0000Xe-Uw
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kyyTN-0008UR-Cy
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:47:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kyyTL-0007ya-AD
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 09:47:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9C5CAB3E;
 Mon, 11 Jan 2021 14:47:05 +0000 (UTC)
Subject: Re: check-tcg HOWTO?
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <f14c22bf-aecb-3e38-347b-1b9119ad8baa@suse.de>
 <1301fc86-b356-b4a8-42c1-bf7705419a5e@suse.de> <8735z7pnzv.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7df502c2-a792-3fff-7ec7-0a99270274b9@suse.de>
Date: Mon, 11 Jan 2021 15:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8735z7pnzv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ciao Alex,

thanks for your answer,

On 1/11/21 2:35 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi Alex,
>>
>> happy new year,
>>
>> I am trying to get check-tcg to run reliably,
>> as I am doing some substantial refactoring of tcg cpu operations, so I need to verify that TCG is fine.
>>
>> This is an overall getting started question, is there a how-to on how
>> to use check-tcg and how to fix things when things don't go smoothly?
> 
> Not really but I could certainly add something. Generally I just run the
> tests manually in gdb when I'm trying to debug stuff.

Right, I plan to do the same, if I get to the command line to run.
I think it does make sense to add something similar to what was explained here in documentation, with a pointer maybe from README?


> 
>> I get different results on different machines for check-tcg, although the runs are containerized,
>> on one machine the tests for aarch64 tcg are SKIPPED completely (so no
>> errors),
> 
> The compiles *may* be containerized - the runs are always in your host
> environment. It's one of the reasons the binaries are built as static
> images so you don't need to mess about with dynamic linking and
> libraries.
> 

Ah good to know, thanks. So everything is actually run in the host environment in the end.

> The only reason some tests get skipped is if you have a locally
> installed cross compiler which doesn't support some architecture
> features (e.g. CROSS_CC_HAS_SVE).


hmm I will have to check then how to make sure that the test does not see these cross compilers...?


> 
>> on the other machine I get:
>>
>> qemu-system-aarch64: terminating on signal 15 from pid 18583 (timeout)
>> qemu-system-aarch64: terminating on signal 15 from pid 18584 (timeout)
>> qemu-system-aarch64: terminating on signal 15 from pid 18585 (timeout)
>> make[2]: *** [../Makefile.target:162: run-hello] Error 124
>> make[2]: *** Waiting for unfinished jobs....
>> make[2]: *** [../Makefile.target:162: run-pauth-3] Error 124
>> make[2]: *** [../Makefile.target:162: run-memory] Error 124
> 
> Given it's timing out on hello I guess it's the shutdown deadlocking.
> Running with V=1 will give you the command line but the semihosting
> config is setup for redirect. So I usually build my own command line. e.g.:
> 
>   ./qemu-system-aarch64 -monitor none -display none \
>     -chardev stdio,id=output  \
>     -M virt -cpu max -display none \
>     -semihosting-config enable=on,target=native,chardev=output \
>     -kernel tests/tcg/aarch64-softmmu/hello
> 


Would it be possible for check-tcg (and possibly even make check in general where applicable)
to automatically spew the command line to reproduce the error, similar to what you have shown here?


I think this is would be of great value for anyone to be able to act on the errors reported.


> There is nothing particularly special apart from making sure semihosting
> is wired up for the output. Apart from some special cases like
> test-mmap-XXXX most tests don't take any arguments.
> 
>>
>> Both are configured with 
>>
>> configure --enable-tcg
>>
>> Anything more than V=1 to get more output?
> 
> The output is normally dumped in $TESTNAME.out in the appropriate
> $BUILDDIR/tests/tcg/$TARGET/ directory.
> 
>> How do I debug and get logs and cores out of containers?
> 
> As I mentioned above the tests are not run in containers, just the
> compiles (if local compilers are missing).

Thanks for clearing this up!

> 
>>
>> in tests/tcg/ there is:
>>
>> a README (with no hint unfortunately) ,
> 
> Woefully out of date I'm afraid. What docs we have are in docs/devel/testing.rst

maybe a

+ Please see docs/devel/testing.rst for hints on how to run make-tcg and reproduce its results from the cmdline.

> 
>> Makefile.qemu
> 
> Links into the main tests/Makefile.include - invoked for each target
> 
>> Makefile.prereqs
> 
> This ensures docker images are built (if required) for each set of tests.
> 
>> Makefile.target
> 
> This is the main (rather simple) makefile which provides the build and
> run targets. You can run directly if you are in the right build dir, eg:
> 
>   13:58:10 [alex@zen:~/l/q/b/a/t/t/aarch64-softmmu] |✔ + pwd
>   /home/alex/lsrc/qemu.git/builds/arm.all/tests/tcg/aarch64-softmmu
>   13:58:57 [alex@zen:~/l/q/b/a/t/t/aarch64-softmmu] |✔ +
>   make  -f ~/lsrc/qemu.git/tests/tcg/Makefile.target TARGET="aarch64-softmmu" SRC_PATH="/home/alex/lsrc/qemu.git" run
> 
> But TBH this is functionally equivalent to calling:
> 
>   make run-tcg-tests-aarch64-softmmu
> 
> in your main build directory.

Thanks, that's helpful.

> 
>> There are a bunch of variables in these files, which seem to be
>> possible to configure, am I expected to set some of those?
> 
> Not really. Most of the magic variables from:
> 
>   tests/tcg/config-$TARGET.mak
> 
> which is built by tests/tcg/configure.sh during the configure step.
> 
>> I think that it would be beneficial to have either more documentation
>> or more immediately actionable information out of make check failures;
> 
> V=1 should show the command lines run and then you should be able to run
> the tests directly yourself.


Hmm V=1 did not show the command line to me, but maybe I just missed it somehow?
Or it contained some sockets that cannot be manually connected?

> 
>> Any help you could give me to make some progess?
> 
> Hope that helps.

It does, I wonder if this could be fed into docs/ with a pointer to it from README,
and also if this new feature for the tests could be developed, ie, producing a command line useful for reproducing the error,
something that can be run directly without further editing, sanitizing etc...

Thanks a lot,

Claudio



