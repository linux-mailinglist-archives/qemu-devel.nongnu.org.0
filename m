Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774AF2D316B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:45:33 +0100 (CET)
Received: from localhost ([::1]:43400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmh3M-0000Zu-7K
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmh1A-00007v-9O
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:43:17 -0500
Received: from mx2.suse.de ([195.135.220.15]:51246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmh17-0003pb-Hs
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:43:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C8439AD07;
 Tue,  8 Dec 2020 17:43:11 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <20201207212638.GI1289986@habkost.net>
 <CAFEAcA_CNHucoBoq9_jWw9HLc_WneYko5s42z853NVJZdLCGuQ@mail.gmail.com>
 <d3113905-fd76-28ee-8e6a-7a8dd5d3a3ee@redhat.com>
 <b1ef6c6c-1803-a877-b4b7-a12b82288160@suse.de>
 <6b6d65af-5814-27f7-e9c4-937c42e8958c@suse.de>
 <b63dbed8-5e37-4b1c-2e5b-86fbd8bd47ba@redhat.com>
 <20201208162821.GK1289986@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <883668b5-2554-917c-e214-1fda6616c731@suse.de>
Date: Tue, 8 Dec 2020 18:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201208162821.GK1289986@habkost.net>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 5:28 PM, Eduardo Habkost wrote:
> On Tue, Dec 08, 2020 at 03:34:03PM +0100, Philippe Mathieu-Daudé wrote:
>> On 12/8/20 2:55 PM, Claudio Fontana wrote:
>>> On 12/8/20 2:51 PM, Claudio Fontana wrote:
>>>> On 12/8/20 2:27 PM, Philippe Mathieu-Daudé wrote:
>>>>> On 12/7/20 10:50 PM, Peter Maydell wrote:
>>>>>> On Mon, 7 Dec 2020 at 21:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>>>>>> My understanding is that there's no reason for ARM KVM to use
>>>>>>> another approach, and that CPUClass.do_interrupt is not really
>>>>>>> TCG-specific.
>>>>>>>
>>>>>>> Do we have any case where the CPUClass.do_interrupt
>>>>>>> implementation is really TCG-specific, or it is just a
>>>>>>> coincidence that most other accelerators simply don't to call the
>>>>>>> method?  It looks like the only cases where the
>>>>>>> CPUClass.do_interrupt assignment is conditional on CONFIG_TCG are
>>>>>>> i386 and s390x.
>>>>>>
>>>>>> Looking at PPC, its kvm_handle_debug() function does a
>>>>>> direct call to ppc_cpu_do_interrupt(). So the code of
>>>>>> its do_interrupt method must be ok-for-KVM, it's just that
>>>>>> it doesn't use the method pointer. (It's doing the same thing
>>>>>> Arm is -- if a debug event turns out not to be for QEMU itself,
>>>>>> inject a suitable exception into the guest.)
>>>>>>
>>>>>> So of our 5 KVM-supporting architectures:
>>>>>>
>>>>>>  * i386 and s390x have kernel APIs for "inject suitable
>>>>>>    exception", don't need to call do_interrupt, and make
>>>>>>    the cc->do_interrupt assignment only ifdef CONFIG_TCG,
>>>>>>    so that the code for do_interrupt need not be compiled
>>>>>>    into a KVM-only binary. (In both cases the code for the
>>>>>>    function is in a source file that the meson.build puts
>>>>>>    into the source list only if CONFIG_TCG)
>>>>>>  * ppc and arm both need to use this code even in a KVM
>>>>>>    only binary. Neither of them #ifdef the cc->do_interrupt
>>>>>>    assignment, because there's not much point at the moment
>>>>>>    if you're not going to try to compile out the code.
>>>>>>    ppc happens to do a direct function call, and arm happens
>>>>>>    to go via the cc->do_interrupt pointer, but I don't
>>>>>>    think there's much significance in the choice either way.
>>>>>>    In both cases, the only places making the call are within
>>>>>>    architecture-specific KVM code.
>>>>>>  * mips KVM does neither of these things, probably because it is
>>>>>>    not sufficiently featureful to have run into the cases
>>>>>>    where you might want to re-inject an exception and it's
>>>>>>    not being sufficiently used in production for anybody to
>>>>>>    have looked at minimising the amount of code in a
>>>>>>    KVM-only QEMU binary for it.
>>>>>>
>>>>>> So in conclusion we have a basically 50:50 split between
>>>>>> "use the same do_interrupt code as TCG" and "have a kernel
>>>>>> API to make the kernel do the work", plus one arch that
>>>>>> probably hasn't had to make the choice yet.   ¯\_(ツ)_/¯
>>>>>
>>>>> Why not introduce KVMCpuOperations similar to TCGCpuOperations
>>>>> Claudio is introducing, and declare the do_interrupt(CPUState*)
>>>>> in both structures?
>>>>>
>>>>> Then we can assign the same handler to both fields, TCG keeps
>>>>> calling cc->tcg->do_interrupt(), KVM calls cc->kvm->do_interrupt().
>>>>> This allow building with a particular accelerator, while staying
>>>>> compliant with the current 50:50 split...
>>>>
>>>>
>>>> Hi Philippe,
>>>>
>>>> in principle interesting, but KVMCpuOperations would end up currently containing do_interrupt only..
>>>> seems a bit overkill for just one method.
>>
>> I don't see this being a problem, if this makes code clearer
>> (think about maintainability).
>>
>>> I mean, all the others in CPUClass are common between TCG and KVM, I don't see a lot that is KVM-only there that would warrant a KVMCPUOps structure
>>>
>>>> Or where you thinking of ways to refactor current kvm code to use methods in CPUClass similarly to what Tcg does?
>>>>
>>>
>>> But maybe this is where you were going with this?
>>
>> No, not really. I'm looking for a design to enforce correctness,
>> while keeping the 2 choices Peter mentioned available.
>>
>> - "use the same do_interrupt code as TCG":
>>
>> cc->tcg.do_interrupt = x86_cpu_do_interrupt;
>> cc->kvm.do_interrupt = NULL;
>>
>> cc->tcg.do_interrupt = s390_cpu_do_interrupt;
>> cc->kvm.do_interrupt = NULL;
>>
>> - "have a kernel API to make the kernel do the work"
>>
>> cc->tcg.do_interrupt = arm_cpu_do_interrupt;
>> cc->kvm.do_interrupt = arm_cpu_do_interrupt;
>>
>> cc->tcg.do_interrupt = ppc_cpu_do_interrupt;
>> cc->kvm.do_interrupt = ppc_cpu_do_interrupt;
>>
>> Looks easy to review, hard to misplace #ifdef'ry.
> 
> So, methods that have accel-specific implementations, which is
> exactly why we have the CpusAccel struct (renamed to

CpusAccel (in the new series "AccelOpsClass") is (currently) about arch-independent, softmmu accel operations, used in the softmmu/cpus.c module.
The "Ops" in AccelOpsClass are create_vcpu_thread, kick_vcpu_thread, synchronize_*, handle_interrupt, get_virtual_clock, get_elapsed_ticks. These things are accel-dependent, but not arch-dependent.

> AccelCpuClass in Claudio's cleanup series).


AccelCPUClass is (in the cleanup series) instead about Arch-dependent specialization of the CPUClass inits (constructors, class initializers, realize functions, ...),
working around the problem with the fact that we cannot easily subclass cpus for accelerators, without changing the existing object hierarchies, which I got negative feedback about.

So we have there arch-dependent cpu object constructors, class initializers etc, used for both user-mode and softmmu.

So in AccelCPUClass we currently have cpu_class_init, cpu_instance_init, cpu_realizefn.

> 
> Is there any reason to not move CPUClass.do_interrupt to
> AccelCpuClass.do_interrupt?
> 

This seems an interesting idea to me.

Ciao,

Claudio

