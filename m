Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F92CD910
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 15:28:05 +0100 (CET)
Received: from localhost ([::1]:42724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkpaW-00006k-1A
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 09:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkpZ8-0007qD-IJ; Thu, 03 Dec 2020 09:26:38 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57712
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkpZ6-0006Yw-9U; Thu, 03 Dec 2020 09:26:38 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id 74E7F3900107;
 Thu,  3 Dec 2020 15:26:33 +0100 (CET)
Subject: Re: [PATCH v3 06/10] hvf: Add Apple Silicon support
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-7-agraf@csgraf.de>
 <20201203052156.GB82480@SPB-NB-133.local>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <78852f5f-c0d0-fcba-e69d-cbbeca057fc0@csgraf.de>
Date: Thu, 3 Dec 2020 15:26:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201203052156.GB82480@SPB-NB-133.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 03.12.20 06:21, Roman Bolshakov wrote:
> On Wed, Dec 02, 2020 at 08:04:04PM +0100, Alexander Graf wrote:
>> With Apple Silicon available to the masses, it's a good time to add support
>> for driving its virtualization extensions from QEMU.
>>
>> This patch adds all necessary architecture specific code to get basic VMs
>> working. It's still pretty raw, but definitely functional.
>>
> That's very cool, Alex!
>
>> [...]
>> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
>> index a423f629d5..e613c22ad0 100644
>> --- a/accel/hvf/hvf-cpus.c
>> +++ b/accel/hvf/hvf-cpus.c
>> @@ -60,6 +60,10 @@
>>   
>>   #include <Hypervisor/Hypervisor.h>
>>   
> On an older laptop with 10.15 I've noticed this causes a build failure.
> Here's layout of Hypervisor.framework on 10.15:
>
>   Hypervisor.framework find .
>   .
>   ./Versions
>   ./Versions/A
>   ./Versions/A/Hypervisor.tbd
>   ./Versions/A/Headers
>   ./Versions/A/Headers/hv_arch_vmx.h
>   ./Versions/A/Headers/hv_error.h
>   ./Versions/A/Headers/hv_types.h
>   ./Versions/A/Headers/hv.h
>   ./Versions/A/Headers/hv_arch_x86.h
>   ./Versions/A/Headers/hv_vmx.h
>   ./Versions/Current
>   ./module.map
>   ./Hypervisor.tbd
>   ./Headers
>
> The issue also exists in another patch in the series:
>    "hvf: Move common code out"


Ugh, I'll try and see if I can dig out a 10.15 machine somewhere.


>
>> +#ifdef __aarch64__
>> +#define HV_VM_DEFAULT NULL
>> +#endif
>> +
> I don't see if it's used anywhere.


It's used in hv_vm_create() as argument. The enum that contains it is 
hidden behind an #ifdef __x86_64__ in HVF though.


>
>>   /* Memory slots */
>>   
>>   struct mac_slot {
>> [...]
>>
> Side question. I have very little knowledge of ARM but it seems much
> leaner compared to x86 trap/emulation layer. Is it a consequence of
> load/store architecture and it's expected to be that small on ARM?


It's multiple things coming together. Early in the virtualization days 
of KVM on ARM, we decided that KVM would only support MMIO for 
instructions that hardware predecodes on exception. That seems to have 
trickled down into basically all relevant OSs these days, so you can run 
Linux, *BSD and Windows just fine without handling any instructions that 
are not already predecoded for you.

This in turn means you don't need an instruction emulator, which is most 
of the complexity on the x86 hvf code.


> I have only noticed MMIO, system registers (access to them apparently
> leads to a trap), kick and PSCI traps (which sounds somewhat similar to
> Intel MPSpec/APIC) and no system instruction traps (except WFI in the
> next patch).


System Registers are a bit tricky. Some of them lead to traps (as you've 
seen), others do not and instead read/write shadow registers directly. 
For those, we need to do the register sync.

But yes, there is little to handle for an ARM guest. I was positively 
surprised as well. To be fair though, most of the complexity in KVM ARM 
code comes from vGIC (not available on M1), debug registers (not handled 
here yet), PMU multiplexing (not handled) and stage2 page table 
maintenance (done by HVF). We just wiggle ourselves out of those.


Alex



