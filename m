Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55EC5EFD30
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:41:29 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odyTR-0002re-1X
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1odxre-00082Y-MS
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 14:02:27 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:38638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1odxrc-0002d3-QF
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 14:02:26 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1odxrJ-0007PM-Vd; Thu, 29 Sep 2022 20:02:06 +0200
Message-ID: <34febefd-c50c-f13a-ec57-4b82adb2225b@maciej.szmigiero.name>
Date: Thu, 29 Sep 2022 20:02:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US, pl-PL
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <8474c6ca63bbbf85ac7721732a7bbdb033f7aa50.1664378882.git.maciej.szmigiero@oracle.com>
 <0e1eef64-b157-c87d-ef54-3b5a8bae9aad@redhat.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] hyperv: fix SynIC SINT assertion failure on guest reset
In-Reply-To: <0e1eef64-b157-c87d-ef54-3b5a8bae9aad@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29.09.2022 19:13, Paolo Bonzini wrote:
> On 9/28/22 18:17, Maciej S. Szmigiero wrote:
>> From: "Maciej S. Szmigiero"<maciej.szmigiero@oracle.com>
>>
>> Resetting a guest that has Hyper-V VMBus support enabled triggers a QEMU
>> assertion failure:
>> hw/hyperv/hyperv.c:131: synic_reset: Assertion `QLIST_EMPTY(&synic->sint_routes)' failed.
>>
>> This happens both on normal guest reboot or when using "system_reset" HMP
>> command.
>>
>> The failing assertion was introduced by commit 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc")
>> to catch dangling SINT routes on SynIC reset.
>>
>> The root cause of this problem is that the SynIC itself is reset before
>> devices using SINT routes have chance to clean up these routes.
>>
>> Since there seems to be no existing mechanism to force reset callbacks (or
>> methods) to be executed in specific order let's use a similar method that
>> is already used to reset another interrupt controller (APIC) after devices
>> have been reset - by invoking the SynIC reset from the machine reset
>> handler via a new x86_cpu_after_reset() function co-located with
>> the existing x86_cpu_reset() in target/i386/cpu.c.
>>
>> Fixes: 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc") # exposed the bug
>> Signed-off-by: Maciej S. Szmigiero<maciej.szmigiero@oracle.com>
> 
> Thanks, looks good.
> 
> hw/i386/microvm.c has to be adjusted too,

You're right, I was misled by the fact that VMBus is only available on
pc or q35, but obviously kvm_arch_after_reset_vcpu() has (or will have)
other side effects, too.

> what do you think of this:
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index dc929727dc..64eb6374ad 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -485,9 +485,7 @@ static void microvm_machine_reset(MachineState *machine)
>       CPU_FOREACH(cs) {
>           cpu = X86_CPU(cs);
> 
> -        if (cpu->apic_state) {
> -            device_legacy_reset(cpu->apic_state);
> -        }
> +        x86_cpu_after_reset(cpu);
>       }
>   }
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 655439fe62..15a854b149 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1863,10 +1863,6 @@ static void pc_machine_reset(MachineState *machine)
>           cpu = X86_CPU(cs);
> 
>           x86_cpu_after_reset(cpu);
> -
> -        if (cpu->apic_state) {
> -            device_legacy_reset(cpu->apic_state);
> -        }
>       }
>   }
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 27ee8c1ced..349bd5d048 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6042,6 +6042,10 @@ void x86_cpu_after_reset(X86CPU *cpu)
>       if (kvm_enabled()) {
>           kvm_arch_after_reset_vcpu(cpu);
>       }
> +
> +    if (cpu->apic_state) {
> +        device_legacy_reset(cpu->apic_state);
> +    }
>   #endif
>   }
> 

Definitely makes sense, will prepare a v3 tomorrow.

Thanks,
Maciej




