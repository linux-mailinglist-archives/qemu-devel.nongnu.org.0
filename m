Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A933F73B4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:52:05 +0200 (CEST)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqVo-0005Tf-9N
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIqJT-0005bo-DI
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:39:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46430
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIqJR-0007sL-3u
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:39:19 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIqJ2-0008cq-BH; Wed, 25 Aug 2021 11:38:57 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 atar4qemu@gmail.com, qemu-devel@nongnu.org
References: <20210825095100.20180-1-mark.cave-ayland@ilande.co.uk>
 <74177bc7-384b-60cd-daa7-084d9a3f7c67@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <6f07e32a-2cec-fac1-10a6-41057698f001@ilande.co.uk>
Date: Wed, 25 Aug 2021 11:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <74177bc7-384b-60cd-daa7-084d9a3f7c67@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] sun4m: fix setting CPU id when more than one CPU is
 present
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.305,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/08/2021 11:29, Philippe Mathieu-Daudé wrote:

> On 8/25/21 11:51 AM, Mark Cave-Ayland wrote:
>> Commit 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState property") changed
>> the sun4m CPU reset code to use the start-powered-off property and so split the
>> creation of the CPU into separate instantiation and realization phases to enable
>> the new start-powered-off property to be set.
>>
>> This accidentally broke sun4m machines with more than one CPU present since
>> sparc_cpu_realizefn() sets a default CPU id, and now that realization occurs after
>> calling cpu_sparc_set_id() in cpu_devinit() the CPU id gets reset back to the
>> default instead of being uniquely encoded based upon the CPU number. As soon as
>> another CPU is brought online, the OS gets confused between them and promptly
>> panics.
>>
>> Resolve the issue by moving the cpu_sparc_set_id() call in cpu_devinit() to after
>> the point where the CPU device has been realized as before.
>>
>> Fixes: 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState property")
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/sparc/sun4m.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
>> index 42e139849e..7f3a7c0027 100644
>> --- a/hw/sparc/sun4m.c
>> +++ b/hw/sparc/sun4m.c
>> @@ -803,11 +803,11 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
>>       cpu = SPARC_CPU(object_new(cpu_type));
>>       env = &cpu->env;
>>   
>> -    cpu_sparc_set_id(env, id);
>>       qemu_register_reset(sun4m_cpu_reset, cpu);
>>       object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
>>                                &error_fatal);
>>       qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>> +    cpu_sparc_set_id(env, id);
>>       *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>>       env->prom_addr = prom_addr;
>>   }
> 
> What about directly passing the CPU ID as property (untested):
> 
> -- >8 --
> Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Date:   Wed Aug 25 12:26:02 2021 +0200
> 
>      sun4m: fix setting CPU id when more than one CPU is present
> 
>      Commit 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState
> property") changed
>      the sun4m CPU reset code to use the start-powered-off property and
> so split the
>      creation of the CPU into separate instantiation and realization
> phases to enable
>      the new start-powered-off property to be set.
> 
>      This accidentally broke sun4m machines with more than one CPU
> present since
>      sparc_cpu_realizefn() sets a default CPU id, and now that
> realization occurs after
>      calling cpu_sparc_set_id() in cpu_devinit() the CPU id gets reset
> back to the
>      default instead of being uniquely encoded based upon the CPU number.
> As soon as
>      another CPU is brought online, the OS gets confused between them and
> promptly
>      panics.
> 
>      Resolve the issue by adding a 'cpu-id' property to CPUSPARCState,
> removing
>      cpu_sparc_set_id().
> 
>      Fixes: 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState
> property")
>      Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>      Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index ff8ae73002a..78ca0925d25 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -262,6 +262,7 @@ struct sparc_def_t {
>       uint32_t mmu_cxr_mask;
>       uint32_t mmu_sfsr_mask;
>       uint32_t mmu_trcr_mask;
> +    uint8_t mxcc_cpuid;
>       uint32_t mxcc_version;
>       uint32_t features;
>       uint32_t nwindows;
> @@ -583,7 +584,6 @@ void cpu_raise_exception_ra(CPUSPARCState *, int,
> uintptr_t) QEMU_NORETURN;
> 
>   #ifndef NO_CPU_IO_DEFS
>   /* cpu_init.c */
> -void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu);
>   void sparc_cpu_list(void);
>   /* mmu_helper.c */
>   bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index 7b4dec17211..8189045fdbf 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -238,8 +238,6 @@ static void leon3_generic_hw_init(MachineState *machine)
>       cpu = SPARC_CPU(cpu_create(machine->cpu_type));
>       env = &cpu->env;
> 
> -    cpu_sparc_set_id(env, 0);
> -
>       /* Reset data */
>       reset_info        = g_malloc0(sizeof(ResetData));
>       reset_info->cpu   = cpu;
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 42e139849ed..5be2e8e73f2 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -803,10 +803,10 @@ static void cpu_devinit(const char *cpu_type,
> unsigned int id,
>       cpu = SPARC_CPU(object_new(cpu_type));
>       env = &cpu->env;
> 
> -    cpu_sparc_set_id(env, id);
>       qemu_register_reset(sun4m_cpu_reset, cpu);
>       object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
>                                &error_fatal);
> +    object_property_set_uint(OBJECT(cpu), "cpu-id", id, &error_fatal);
>       qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>       *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>       env->prom_addr = prom_addr;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec747..d76929c68c7 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -194,13 +194,6 @@ static void sparc_cpu_parse_features(const char
> *typename, char *features,
>       g_list_free_full(minus_features, g_free);
>   }
> 
> -void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu)
> -{
> -#if !defined(TARGET_SPARC64)
> -    env->mxccregs[7] = ((cpu + 8) & 0xf) << 24;
> -#endif
> -}
> -
>   static const sparc_def_t sparc_defs[] = {
>   #ifdef TARGET_SPARC64
>       {
> @@ -754,7 +747,7 @@ static void sparc_cpu_realizefn(DeviceState *dev,
> Error **errp)
>       env->nwindows = env->def.nwindows;
>   #if !defined(TARGET_SPARC64)
>       env->mmuregs[0] |= env->def.mmu_version;
> -    cpu_sparc_set_id(env, 0);
> +    env->mxccregs[7] = ((env->def.mxcc_cpuid + 8) & 0xf) << 24;
>       env->mxccregs[7] |= env->def.mxcc_version;
>   #else
>       env->mmu_version = env->def.mmu_version;
> @@ -843,6 +836,7 @@ static Property sparc_cpu_properties[] = {
>                            qdev_prop_uint64, target_ulong),
>       DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
>       DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
> +    DEFINE_PROP_UINT8("cpu-id", SPARCCPU, env.def.mxcc_cpuid, 0),
>       DEFINE_PROP("nwindows", SPARCCPU, env.def.nwindows,
>                   qdev_prop_nwindows, uint32_t),
>       DEFINE_PROP_END_OF_LIST()

The existing code was obviously written with some flexibility here as to why id != 
cs->cpu_index, but since Blue Swirl is no longer around I don't really know what the 
test cases are and why the default is required, so I'd rather preserve the existing 
behaviour for now.

Also MXCC is specific to 32-bit SPARC: maybe it was written this way to allow for 
future multi-CPU support for 64-bit SPARC?


ATB,

Mark.

