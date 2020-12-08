Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DA2D2C3E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 14:54:05 +0100 (CET)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdRL-0001Nf-PO
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 08:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmdP9-0000MQ-AY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:51:47 -0500
Received: from mx2.suse.de ([195.135.220.15]:55568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmdP5-0003JQ-9E
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 08:51:45 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BC822AC94;
 Tue,  8 Dec 2020 13:51:40 +0000 (UTC)
Subject: Re: [PATCH] target/arm: do not use cc->do_interrupt for KVM directly
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201207084042.7690-1-cfontana@suse.de>
 <20201207174916.GD1289986@habkost.net>
 <CAFEAcA_UUs6NJ_JYtNEQ3VubHnvsvo1BBx6=9nVT9GO_QrDwoQ@mail.gmail.com>
 <20201207182842.GE1289986@habkost.net>
 <CAFEAcA9OWLF01hR4qzPwKWAHiDZ9RkSab8rv+0rnkyNhQjAnOg@mail.gmail.com>
 <2e2e0160-7c17-cdfd-93e0-3d2002996108@suse.de>
 <20201207212638.GI1289986@habkost.net>
 <CAFEAcA_CNHucoBoq9_jWw9HLc_WneYko5s42z853NVJZdLCGuQ@mail.gmail.com>
 <d3113905-fd76-28ee-8e6a-7a8dd5d3a3ee@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b1ef6c6c-1803-a877-b4b7-a12b82288160@suse.de>
Date: Tue, 8 Dec 2020 14:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d3113905-fd76-28ee-8e6a-7a8dd5d3a3ee@redhat.com>
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:27 PM, Philippe Mathieu-Daudé wrote:
> On 12/7/20 10:50 PM, Peter Maydell wrote:
>> On Mon, 7 Dec 2020 at 21:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>> My understanding is that there's no reason for ARM KVM to use
>>> another approach, and that CPUClass.do_interrupt is not really
>>> TCG-specific.
>>>
>>> Do we have any case where the CPUClass.do_interrupt
>>> implementation is really TCG-specific, or it is just a
>>> coincidence that most other accelerators simply don't to call the
>>> method?  It looks like the only cases where the
>>> CPUClass.do_interrupt assignment is conditional on CONFIG_TCG are
>>> i386 and s390x.
>>
>> Looking at PPC, its kvm_handle_debug() function does a
>> direct call to ppc_cpu_do_interrupt(). So the code of
>> its do_interrupt method must be ok-for-KVM, it's just that
>> it doesn't use the method pointer. (It's doing the same thing
>> Arm is -- if a debug event turns out not to be for QEMU itself,
>> inject a suitable exception into the guest.)
>>
>> So of our 5 KVM-supporting architectures:
>>
>>  * i386 and s390x have kernel APIs for "inject suitable
>>    exception", don't need to call do_interrupt, and make
>>    the cc->do_interrupt assignment only ifdef CONFIG_TCG,
>>    so that the code for do_interrupt need not be compiled
>>    into a KVM-only binary. (In both cases the code for the
>>    function is in a source file that the meson.build puts
>>    into the source list only if CONFIG_TCG)
>>  * ppc and arm both need to use this code even in a KVM
>>    only binary. Neither of them #ifdef the cc->do_interrupt
>>    assignment, because there's not much point at the moment
>>    if you're not going to try to compile out the code.
>>    ppc happens to do a direct function call, and arm happens
>>    to go via the cc->do_interrupt pointer, but I don't
>>    think there's much significance in the choice either way.
>>    In both cases, the only places making the call are within
>>    architecture-specific KVM code.
>>  * mips KVM does neither of these things, probably because it is
>>    not sufficiently featureful to have run into the cases
>>    where you might want to re-inject an exception and it's
>>    not being sufficiently used in production for anybody to
>>    have looked at minimising the amount of code in a
>>    KVM-only QEMU binary for it.
>>
>> So in conclusion we have a basically 50:50 split between
>> "use the same do_interrupt code as TCG" and "have a kernel
>> API to make the kernel do the work", plus one arch that
>> probably hasn't had to make the choice yet.   ¯\_(ツ)_/¯
> 
> Why not introduce KVMCpuOperations similar to TCGCpuOperations
> Claudio is introducing, and declare the do_interrupt(CPUState*)
> in both structures?
> 
> Then we can assign the same handler to both fields, TCG keeps
> calling cc->tcg->do_interrupt(), KVM calls cc->kvm->do_interrupt().
> This allow building with a particular accelerator, while staying
> compliant with the current 50:50 split...


Hi Philippe,

in principle interesting, but KVMCpuOperations would end up currently containing do_interrupt only..
seems a bit overkill for just one method.
Or where you thinking of ways to refactor current kvm code to use methods in CPUClass similarly to what Tcg does?

Ciao,

Claudio


> 
>>
>>> Oh, I thought you were arguing that CPUClass.do_interrupt is
>>> not TCG_specific.
>>
>> Well, I don't think it really is TCG-specific. But as
>> a pragmatic thing, if these two lines in the Arm code
>> are getting in the way of stopping us from having a
>> useful compile-time check that code that's not supposed
>> to call this method isn't calling it, I think the balance
>> maybe leans towards just making the direct function call.
>> I guess it depends whether you think people are likely to
>> accidentally make cc->do_interrupt calls in non-target-specific
>> code that gets used by KVM (which currently would crash if that
>> code path is exercised on x86 or s390x, but under the
>> proposed change would become a compile error).
>>
>> thanks
>> -- PMM
>>
> 


