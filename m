Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F219398992
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 14:31:26 +0200 (CEST)
Received: from localhost ([::1]:54732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQ1t-0003Yj-G5
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 08:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1loQ0A-00029a-4l; Wed, 02 Jun 2021 08:29:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:29096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1loQ04-000364-NP; Wed, 02 Jun 2021 08:29:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7FD48746351;
 Wed,  2 Jun 2021 14:29:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2AFE7746346; Wed,  2 Jun 2021 14:29:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2925D746344;
 Wed,  2 Jun 2021 14:29:29 +0200 (CEST)
Date: Wed, 2 Jun 2021 14:29:29 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YLc507CyOVq403TM@yekko>
Message-ID: <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu>
References: <babe39af-fd34-8c5-de99-a0f485bfbce@eik.bme.hu>
 <4f6ceca3-5f18-fe70-18f9-4efde8feb1ed@ozlabs.ru>
 <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu> <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu>
 <YKyJ3I5QIDLwR99t@yekko> <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
 <YK8vbO7x2C8kaBWZ@yekko> <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
 <YLc507CyOVq403TM@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021, David Gibson wrote:
> On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
>> On Thu, 27 May 2021, David Gibson wrote:
>>> On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
>>>> On Tue, 25 May 2021, David Gibson wrote:
>>>>> On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
>>>>>> On Mon, 24 May 2021, David Gibson wrote:
>>>>>>> On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
>>>>>>>> On Sun, 23 May 2021, BALATON Zoltan wrote:
>>>>>>>>> On Sun, 23 May 2021, Alexey Kardashevskiy wrote:
>>>>>>>>>> One thing to note about PCI is that normally I think the client
>>>>>>>>>> expects the firmware to do PCI probing and SLOF does it. But VOF
>>>>>>>>>> does not and Linux scans PCI bus(es) itself. Might be a problem for
>>>>>>>>>> you kernel.
>>>>>>>>>
>>>>>>>>> I'm not sure what info does MorphOS get from the device tree and what it
>>>>>>>>> probes itself but I think it may at least need device ids and info about
>>>>>>>>> the PCI bus to be able to access the config regs, after that it should
>>>>>>>>> set the devices up hopefully. I could add these from the board code to
>>>>>>>>> device tree so VOF does not need to do anything about it. However I'm
>>>>>>>>> not getting to that point yet because it crashes on something that it's
>>>>>>>>> missing and couldn't yet find out what is that.
>>>>>>>>>
>>>>>>>>> I'd like to get Linux working now as that would be enough to test this
>>>>>>>>> and then if for MorphOS we still need a ROM it's not a problem if at
>>>>>>>>> least we can boot Linux without the original firmware. But I can't make
>>>>>>>>> Linux open a serial console and I don't know what it needs for that. Do
>>>>>>>>> you happen to know? I've looked at the sources in Linux/arch/powerpc but
>>>>>>>>> not sure how it would find and open a serial port on pegasos2. It seems
>>>>>>>>> to work with the board firmware and now I can get it to boot with VOF
>>>>>>>>> but then it does not open serial so it probably needs something in the
>>>>>>>>> device tree or expects the firmware to set something up that we should
>>>>>>>>> add in pegasos2.c when using VOF.
>>>>>>>>
>>>>>>>> I've now found that Linux uses rtas methods read-pci-config and
>>>>>>>> write-pci-config for PCI access on pegasos2 so this means that we'll
>>>>>>>> probably need rtas too (I hoped we could get away without it if it were only
>>>>>>>> used for shutdown/reboot or so but seems Linux needs it for PCI as well and
>>>>>>>> does not scan the bus and won't find some devices without it).
>>>>>>>
>>>>>>> Yes, definitely sounds like you'll need an RTAS implementation.
>>>>>>
>>>>>> I plan to fix that after managed to get serial working as that seems to not
>>>>>> need it. If I delete the rtas-size property from /rtas on the original
>>>>>> firmware that makes Linux skip instantiating rtas, but I still get serial
>>>>>> output just not accessing PCI devices. So I think it should work and keeps
>>>>>> things simpler at first. Then I'll try rtas later.
>>>>>>
>>>>>>>> While VOF can do rtas, this causes a problem with the hypercall method using
>>>>>>>> sc 1 that goes through vhyp but trips the assert in ppc_store_sdr1() so
>>>>>>>> cannot work after guest is past quiesce.
>>>>>>>
>>>>>>>> So the question is why is that
>>>>>>>> assert there
>>>>>>>
>>>>>>> Ah.. right.  So, vhyp was designed for the PAPR use case, where we
>>>>>>> want to model the CPU when it's in supervisor and user mode, but not
>>>>>>> when it's in hypervisor mode.  We want qemu to mimic the behaviour of
>>>>>>> the hypervisor, rather than attempting to actually execute hypervisor
>>>>>>> code in the virtual CPU.
>>>>>>>
>>>>>>> On systems that have a hypervisor mode, SDR1 is hypervisor privileged,
>>>>>>> so it makes no sense for the guest to attempt to set it.  That should
>>>>>>> be caught by the general SPR code and turned into a 0x700, hence the
>>>>>>> assert() if we somehow reach ppc_store_sdr1().
>>>>>>>
>>>>>>> So, we are seeing a problem here because you want the 'sc 1'
>>>>>>> interception of vhyp, but not the rest of the stuff that goes with it.
>>>>>>>
>>>>>>>> and would using sc 1 for hypercalls on pegasos2 cause other
>>>>>>>> problems later even if the assert could be removed?
>>>>>>>
>>>>>>> At least in the short term, I think you probably can remove the
>>>>>>> assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
>>>>>>> but a special case escape to qemu for the firmware emulation.  I think
>>>>>>> it's unlikely to cause problems later, because nothing on a 32-bit
>>>>>>> system should be attempting an 'sc 1'.  The only thing I can think of
>>>>>>> that would fail is some test case which explicitly verified that 'sc
>>>>>>> 1' triggered a 0x700 (SIGILL from userspace).
>>>>>>
>>>>>> OK so the assert should check if the CPU has an HV bit. I think there was a
>>>>>> #detine for that somewhere that I can add to the assert then I can try that.
>>>>>> What I wasn't sure about is that sc 1 would conflict with the guest's usage
>>>>>> of normal sc calls or are these going through different paths and only sc 1
>>>>>> will trigger vhyp callback not affecting notmal sc calls?
>>>>>
>>>>> The vhyp shouldn't affect normal system calls, 'sc 1' is specifically
>>>>> for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and the
>>>>> vhyp only intercepts the hypercall version (after all Linux on PAPR
>>>>> certainly uses its own system calls, and hypercalls are active for the
>>>>> lifetime of the guest there).
>>>>>
>>>>>> (Or if this causes
>>>>>> an otherwise unnecessary VM exit on KVM even when it works then maybe
>>>>>> looking for a different way in the future might be needed.
>>>>>
>>>>> What you're doing here won't work with KVM as it stands.  There are
>>>>> basically two paths into the vhyp hypercall path: 1) from TCG, if we
>>>>> interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if we get
>>>>> a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.
>>>>>
>>>>> The second path is specific to the PAPR (ppc64) implementation of KVM,
>>>>> and will not work for a non-PAPR platform without substantial
>>>>> modification of the KVM code.
>>>>
>>>> OK so then at that point when we try KVM we'll need to look at alternative
>>>> ways, I think MOL OSI worked with KVM at least in MOL but will probably make
>>>> all syscalls exit KVM but since we'll probably need to use KVM PR it will
>>>> exit anyway. For now I keep this vhyp as it does not run with KVM for other
>>>> reasons yet so that's another area to clean up so as a proof of concept
>>>> first version of using VOF vhyp will do.
>>>
>>> Eh, since you'll need to modify KVM anyway, it probably makes just as
>>> much sense to modify it to catch the 'sc 1' as MoL's magic thingy.
>>
>> I'm not sure how KVM works for this case so I also don't know why and what
>> would need to be modified. I think we'll only have KVM PR working as newer
>> POWER CPUs having HV (besides being rare among potential users) are probably
>> too different to run the OSes that expect at most a G4 on pegasos2 so likely
>> it won't work with KVM HV.
>
> Oh, it definitely won't work with KVM HV.
>
>> If we have KVM PR doesn't sc already trap so we
>> could add MOL OSI without further modification to KVM itself only needing
>> change in QEMU?
>
> Uh... I guess so?
>
>> I also hope that MOL OSI could be useful for porting some
>> paravirt drivers from MOL for running Mac OS X on Mac emulation but I don't
>> know about that for sure so I'm open to any other solution too.
>
> Maybe.  I never know much about MOL to begin with, and anything I did
> know was a decade or more ago so I've probably forgotten.

That may still be more than what I know about it since I never had any 
knowledge about PPC KVM and don't have any PPC hardware to test with so 
I'm mostly guessing. (I could test with KVM emulated in QEMU and I did set 
up an environment for that but that's a bit slow and inconvenient so I'd 
leave KVM support to those interested and have more knowledge and hardware 
for it.)

>> For now I'm
>> going with vhyp which is enough fot testing with TCG and if somebody wants
>> KVM they could use he original firmware for now so this could be improved in
>> a later version unless a simple solution is found before the freeze for 6.1.
>> If we're in KVM PR what happens for sc 1 could that be used too so maybe
>> what we have now could work?
>
> Note that if you do go down the MOL path it wouldn't be that complex
> to make a "vMOL" interface so you can use the same mechanism for KVM
> and TCG.

Not sure what you mean by VMOL. Is it modifying MOL to use sc 1 like VOF 
instead of its OSI way for hypercalls? That would lose the advantage of 
being able to reuse MOL guest drivers without modification (which might be 
useful for running OS X guest on Mac emulation) so if we can't use vhyp 
then maybe using OSI would be the next choice for this reason but for now 
vhyp seems to be working for what I could test so unless somebody here 
sees a problem with it and has a better idea I'm going with vhyp for now 
just because that's what VOF uses and I don't want to modify VOF to reuse 
it as it is so I don't need to maintain a separate version and also get 
any enhancements without further need to sync with spapr VOF.

I've found this document about possible hypercall interfaces on KVM (see 
Hypercall ABIs at the end):

https://www.kernel.org/doc/html/latest/virt/kvm/ppc-pv.html

Having both ePAPR (1.) and PAPR (2.) hypercalls is a bit confusing. Does 
vhyp correspond to 2. PAPR? The ePAPR (1.) seems to be preferred by KVM 
and MOL OSI supported for compatibility. So if we need something else 
instead of 2. PAPR hypercalls there seems to be two options: ePAPR and 
MOL OSI which should work with KVM but then I'm not sure how to handle 
those on TCG.

>>>> [...]
>>>>>>>> I've tested that the missing rtas is not the reason for getting no output
>>>>>>>> via serial though, as even when disabling rtas on pegasos2.rom it boots and
>>>>>>>> I still get serial output just some PCI devices are not detected (such as
>>>>>>>> USB, the video card and the not emulated ethernet port but these are not
>>>>>>>> fatal so it might even work as a first try without rtas, just to boot a
>>>>>>>> Linux kernel for testing it would be enough if I can fix the serial output).
>>>>>>>> I still don't know why it's not finding serial but I think it may be some
>>>>>>>> missing or wrong info in the device tree I generat. I'll try to focus on
>>>>>>>> this for now and leave the above rtas question for later.
>>>>>>>
>>>>>>> Oh.. another thought on that.  You have an ISA serial port on Pegasos,
>>>>>>> I believe.  I wonder if the PCI->ISA bridge needs some configuration /
>>>>>>> initialization that the firmware is expected to do.  If so you'll need
>>>>>>> to mimic that setup in qemu for the VOF case.
>>>>>>
>>>>>> That's what I begin to think because I've added everything to the device
>>>>>> tree that I thought could be needed and I still don't get it working so it
>>>>>> may need some config from the firmware. But how do I access device registers
>>>>>> from board code? I've tried adding a machine reset method and write to
>>>>>> memory mapped device registers but all my attempts failed. I've tried
>>>>>> cpu_stl_le_data and even memory_region_dispatch_write but these did not get
>>>>>> to the device. What's the way to access guest mmio regs from QEMU?
>>>>>
>>>>> That's odd, cpu_stl() and memory_region_dispatch_write() should work
>>>>> from board code (after the relevant memory regions are configured, of
>>>>> course).  As an ISA serial port, it's probably accessed through IO
>>>>> space, not memory space though, so you'd need &address_space_io.  And
>>>>> if there is some bridge configuration then it's the bridge control
>>>>> registers you need to look at not the serial registers - you'd have to
>>>>> look at the bridge documentation for that.  Or, I guess the bridge
>>>>> implementation in qemu, which you wrote part of.
>>>>
>>>> I've found at last that stl_le_phys() works. There are so many of these that
>>>> I never know when to use which.
>>>>
>>>> I think the address_space_rw calls in vof_client_call() in vof.c could also
>>>> use these for somewhat shorter code. I've ended up with
>>>> stl_le_phys(CPU(cpu)->as, addr, val) in my machine reset methodbut I don't
>>>> even need that now as it works without additional setup. Also VOF's memory
>>>> access is basically the same as the already existing rtas_st() and co. so
>>>> maybe that could be reused to make code smaller?
>>>
>>> rtas_ld() and rtas_st() should only be used for reading/writing RTAS
>>> parameters to and from memory.  Accessing IO shouldn't be done with
>>> those.
>>>
>>> For IO you probably want the cpu_st*() variants in most cases, since
>>> you're trying to emulate an IO access from the virtual cpu.
>>
>> I think I've tried that but what worked to access mmio device registers are
>> stl_le_phys and similar that are wrappers around address_space_stl_*. But I
>> did not mean that for rtas_ld/_st but the part when vof accessing the
>> parameters passed by its hypercall which is memory access:
>>
>> https://github.com/patchew-project/qemu/blob/patchew/20210520090557.435689-1-aik%40ozlabs.ru/hw/ppc/vof.c
>>
>> line 893, and vof_client_call before that is very similar to what h_rtas
>> does here:
>>
>> https://git.qemu.org/?p=qemu.git;a=blob;f=hw/ppc/spapr_hcall.c;h=f25014afda408002ee1ec1027a0dd7a6025eca61;hb=HEAD#l639
>>
>> and I also need to do the same for rtas in pegasos2 for which I'm just using
>> ldl_be_phys for now but I wonder if we really need 3 ways to do the same or
>> the rtas_ld/_st could be made more generic and reused here?
>
> For your rtas implementation you could definitely re-use them.  For
> the client call I'm a bit less confident, but if the in-guest-memory
> structures are really the same, then it would make sense.

The memory structure seems very similar to me, the only difference is 
calling the first field service in VOF instead of token in RTAS. Both are 
just an array of big endian unit32_t with token, nargs, nret at the front 
followed by args and rets. Since these rtas_ld/st are defined in spapr.h I 
did not bother to split them off, so for pegasos2 rtas I'm just using the 
ldl_be_* functions directly for which these are a shorthand for. If these 
were split off for sharing between spapr rtas and VOF I may be able to 
reuse them as well but it's not that important so just mentioned it as a 
possible later clean up.

Regards,
BALATON Zoltan

