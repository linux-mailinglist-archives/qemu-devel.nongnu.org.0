Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F502DDC4D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 01:10:44 +0100 (CET)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq3M3-0006hk-9G
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 19:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq3JA-0006H6-Ba
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 19:07:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:46322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kq3J1-0006i6-Oh
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 19:07:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7209AD5A;
 Fri, 18 Dec 2020 00:07:33 +0000 (UTC)
Subject: Re: [PULL 07/17] i386: move hyperv_vendor_id initialization to
 x86_cpu_realizefn()
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
 <20201217184620.3945917-8-ehabkost@redhat.com>
 <e3168f16-b338-d758-34f6-ee5bff41e918@suse.de>
 <20201217225313.GO3140057@habkost.net>
 <5deb513d-336f-fadb-a15f-75f51e2211ed@suse.de>
 <20201217234702.GP3140057@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7889aaaf-06ca-e442-384e-9dd183e87681@suse.de>
Date: Fri, 18 Dec 2020 01:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201217234702.GP3140057@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:47 AM, Eduardo Habkost wrote:
> On Fri, Dec 18, 2020 at 12:34:46AM +0100, Claudio Fontana wrote:
>> On 12/17/20 11:53 PM, Eduardo Habkost wrote:
>>> On Thu, Dec 17, 2020 at 11:33:57PM +0100, Claudio Fontana wrote:
>>>> Hello all,
>>>>
>>>> On 12/17/20 7:46 PM, Eduardo Habkost wrote:
>>>>> From: Vitaly Kuznetsov <vkuznets@redhat.com>
>>>>>
>>>>> As a preparation to expanding Hyper-V CPU features early, move
>>>>> hyperv_vendor_id initialization to x86_cpu_realizefn(). Introduce
>>>>> x86_cpu_hyperv_realize() to not not pollute x86_cpu_realizefn()
>>>>> itself.
>>>>
>>>> this seems to fit very well the ongoing work on separating accelerator specific realize functions;
>>>>
>>>> related to the previous discussions about the class hierarchies,
>>>> do you think that we should have a separate class in target/i386/kvm/ for a hyperv variant of the kvm-cpu.c?
>>>>
>>>> Should it be a separate class or a subclass of "kvm-accel-x86_64-cpu" ?
>>>
>>> I don't see how a separate QOM class for Hyper-V would be helpful
>>> here.  What would be the problem you are trying to solve in this
>>> case?
>>
>> there is now a call to accelerator specific code x86_hyperv_cpu_realize just before cpu_exec_realize,
>> tying the generic target/i386/cpu.c code to kvm/hyperv-specific accel initialization.
>>
>> if this is just a feature of the kvm accel, maybe I should just move all to kvm-cpu.c and that's it.
> 
> That would make sense.  If we decide this is a KVM-specific
> feature, this code can be moved to kvm_cpu_realizefn(), provided
> by the kvm-accel-x86_64-cpu class added by your series.
> 
> However, I'm not sure we can say this is a KVM-specific feature.
> The feature is currently only supported by the KVM accelerator,
> but I'd say it is a generic feature.
> 

Maybe in the future it will be a generic feature, and we can export it the right way?
It will be super-easy if the feature is well contained.

Until it really is generic though, should it really appear in the middle of x86_cpu_realizefn?
currently the generic code in target/i386/cpu.c contains an unconditional call to:

x86_cpu_hyperv_realize(cpu);

before the call to cpu_exec_realizefn().

the function is defined in this very same file before as:

static void x86_cpu_hyperv_realize(X86CPU *cpu)
{
 ...
}

with a bunch of initializations of hyperv specific data, for example cpu->hyperv_interface_id, cpu->hyperv_vendor_id, cpu->hyperv_version_id.

That data is ever only used in kvm/kvm.c, which is built conditionally under CONFIG_KVM.

So the existing situation is fairly inconsistent in my view, at least for how things are now, and in principle the extra code of the initializations for hyperv should never be executed if !CONFIG_KVM.

Thanks,

Ciao,

Claudio

