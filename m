Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4C38FE4C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:57:55 +0200 (CEST)
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llTox-0002kB-32
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1llTn1-0000hW-UZ; Tue, 25 May 2021 05:55:57 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:40348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1llTmv-0006XP-DP; Tue, 25 May 2021 05:55:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 40B4574570B;
 Tue, 25 May 2021 11:55:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BC361745709; Tue, 25 May 2021 11:55:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BAFA27457F0;
 Tue, 25 May 2021 11:55:43 +0200 (CEST)
Date: Tue, 25 May 2021 11:55:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YKyLNgZrG4IQw0E3@yekko>
Message-ID: <a433cec-5524-93f-880-b74d5a8753fd@eik.bme.hu>
References: <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
 <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
 <8527c8d2-c1e7-b3f8-0bda-529ba3864701@ozlabs.ru>
 <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu> <YKtBJoQXSrSVENFw@yekko>
 <fe6791b0-6162-8331-cc-e6e29fc7d07b@eik.bme.hu> <YKyLNgZrG4IQw0E3@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021, David Gibson wrote:
> On Mon, May 24, 2021 at 02:42:30PM +0200, BALATON Zoltan wrote:
>> On Mon, 24 May 2021, David Gibson wrote:
>>> On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
>>>> On Sun, 23 May 2021, BALATON Zoltan wrote:
>>>>> On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
>>>>>> One thing to note about PCI is that normally I think the client
>>>>>> expects the firmware to do PCI probing and SLOF does it. But VOF
>>>>>> does not and Linux scans PCI bus(es) itself. Might be a problem for
>>>>>> you kernel.
>>>>>
>>>>> I'm not sure what info does MorphOS get from the device tree and what it
>>>>> probes itself but I think it may at least need device ids and info about
>>>>> the PCI bus to be able to access the config regs, after that it should
>>>>> set the devices up hopefully. I could add these from the board code to
>>>>> device tree so VOF does not need to do anything about it. However I'm
>>>>> not getting to that point yet because it crashes on something that it's
>>>>> missing and couldn't yet find out what is that.
>>>>>
>>>>> I'd like to get Linux working now as that would be enough to test this
>>>>> and then if for MorphOS we still need a ROM it's not a problem if at
>>>>> least we can boot Linux without the original firmware. But I can't make
>>>>> Linux open a serial console and I don't know what it needs for that. Do
>>>>> you happen to know? I've looked at the sources in Linux/arch/powerpc but
>>>>> not sure how it would find and open a serial port on pegasos2. It seems
>>>>> to work with the board firmware and now I can get it to boot with VOF
>>>>> but then it does not open serial so it probably needs something in the
>>>>> device tree or expects the firmware to set something up that we should
>>>>> add in pegasos2.c when using VOF.
>>>>
>>>> I've now found that Linux uses rtas methods read-pci-config and
>>>> write-pci-config for PCI access on pegasos2 so this means that we'll
>>>> probably need rtas too (I hoped we could get away without it if it were only
>>>> used for shutdown/reboot or so but seems Linux needs it for PCI as well and
>>>> does not scan the bus and won't find some devices without it).
>>>
>>> Yes, definitely sounds like you'll need an RTAS implementation.
>>>
>>>> While VOF can do rtas, this causes a problem with the hypercall method using
>>>> sc 1 that goes through vhyp but trips the assert in ppc_store_sdr1() so
>>>> cannot work after guest is past quiesce.
>>>
>>>> So the question is why is that
>>>> assert there
>>>
>>> Ah.. right.  So, vhyp was designed for the PAPR use case, where we
>>> want to model the CPU when it's in supervisor and user mode, but not
>>> when it's in hypervisor mode.  We want qemu to mimic the behaviour of
>>> the hypervisor, rather than attempting to actually execute hypervisor
>>> code in the virtual CPU.
>>>
>>> On systems that have a hypervisor mode, SDR1 is hypervisor privileged,
>>> so it makes no sense for the guest to attempt to set it.  That should
>>> be caught by the general SPR code and turned into a 0x700, hence the
>>> assert() if we somehow reach ppc_store_sdr1().
>>
>> This seems to work to avoid my problem so I can leave vhyp enabled after
>> qiuesce for now:
>>
>> diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
>> index d957d1a687..13b87b9b36 100644
>> --- a/target/ppc/cpu.c
>> +++ b/target/ppc/cpu.c
>> @@ -70,7 +70,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
>>  {
>>      PowerPCCPU *cpu = env_archcpu(env);
>>      qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
>> -    assert(!cpu->vhyp);
>> +    assert(!cpu->env.has_hv_mode || !cpu->vhyp);
>>  #if defined(TARGET_PPC64)
>>      if (mmu_is_64bit(env->mmu_model)) {
>>          target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
>>
>> But I wonder if the assert should also be moved within the TARGET_PPC64
>> block and if we may need to generate some exception here instead. Not sure
>> what a real CPU would do in this case but if accessing sdr1 is privileged in
>> HV mode then there should be an exception or if that's catched
>> elsewhere
>
> It should be caught elsehwere.  Specifically, when the SDR1 SPR is
> registered, on CPUs with a hypervisor mode it should be registered as
> hypervisor privileged, so the general mtspr dispatch logic should
> generate the exception if it's called from !HV code.  The assert here
> is just to sanity check that it has done so before we enter the actual
> softmmu code.

So what's the decision then? Remove this assert or modify it like above 
and move it to the TARGET_PPC64 block (as no 32 bit CPU should have an HV 
bit anyway).

Regards,
BALATON Zoltan

