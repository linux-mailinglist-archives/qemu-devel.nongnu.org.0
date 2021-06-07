Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6139E9D3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 00:55:12 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqO9G-0001w7-TU
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 18:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lqO8U-00016b-Ta; Mon, 07 Jun 2021 18:54:22 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lqO8R-00029f-9L; Mon, 07 Jun 2021 18:54:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 33BBA74570D;
 Tue,  8 Jun 2021 00:54:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8536B745709; Tue,  8 Jun 2021 00:54:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 80F3E7456B4;
 Tue,  8 Jun 2021 00:54:15 +0200 (CEST)
Date: Tue, 8 Jun 2021 00:54:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YL2Swhx/XqcPsn5s@yekko>
Message-ID: <e86590b5-9b75-4b5f-3485-5a638943091@eik.bme.hu>
References: <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu> <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu> <YK8vbO7x2C8kaBWZ@yekko>
 <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu> <YLc507CyOVq403TM@yekko>
 <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu> <YLnIYRz+tGaXssVd@yekko>
 <3d7b7525-8919-ba90-ae98-e328273771a@eik.bme.hu> <YL2Swhx/XqcPsn5s@yekko>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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

On Mon, 7 Jun 2021, David Gibson wrote:
> On Fri, Jun 04, 2021 at 03:59:22PM +0200, BALATON Zoltan wrote:
>> On Fri, 4 Jun 2021, David Gibson wrote:
>>> On Wed, Jun 02, 2021 at 02:29:29PM +0200, BALATON Zoltan wrote:
>>>> On Wed, 2 Jun 2021, David Gibson wrote:
>>>>> On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
>>>>>> On Thu, 27 May 2021, David Gibson wrote:
>>>>>>> On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
>>>>>>>> On Tue, 25 May 2021, David Gibson wrote:
>>>>>>>>> On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
>>>>>>>>>> On Mon, 24 May 2021, David Gibson wrote:
>> What's ePAPR then and how is it different from PAPR? I mean the acronym not
>> the hypercall method, the latter is explained in that doc but what ePAPR
>> stands for and why is that method called like that is not clear to me.
>
> Ok, history lesson time.
>
> For a long time PAPR has been the document that described the OS
> environment for IBM POWER based server hardware.  Before it was called
> PAPR (POWER Architecture Platform Requirements) it was called the
> "RPA" (Requirements for the POWER Architecture, I think?).  You might
> see the old name in a few places.
>
> Requiring a full Open Firmware and a bunch of other fairly heavyweight
> stuff, PAPR really wasn't suitable for embedded ppc chips and boards.
> The situation with those used to be a complete mess with basically
> every board variant having it's own different firmware with its own
> different way of presenting some fragments of vital data to the OS.
>
> ePAPR - Embedded Power Architecture Platform Requirements - was
> created as a standard to try to unify how this stuff was handled on
> embedded ppc chips.  I was one of the authors on early versions of
> it.  It's mostly based around giving the OS a flattened device tree,
> with some deliberately minimal requirements on firmware initialization
> and entry state.  Here's a link to one of those early versions:
>
> http://elinux.org/images/c/cf/Power_ePAPR_APPROVED_v1.1.pdf
>
> I thought there were later versions, but I couldn't seem to find any.
> It's possible the process of refining later versions just petered out
> as the embedded ppc world mostly died and the flattened device tree
> development mostly moved to ARM.
>
> Since some of the embedded chips from Freescale had hypervisor
> capabilities, a hypercall model was added to ePAPR - but that wasn't
> something I was greatly involved in, so I don't know much about it.
>
> ePAPR is the reason that the original PAPR is sometimes referred to as
> "sPAPR" to disambiguate.

Ah, thanks that really puts it in context. I've heard about PReP and CHRP 
in connection with the boards I've tried to emulate but don't know much 
about PAPR and server POWER systems.

>>>> The ePAPR (1.) seems to be preferred by KVM and
>>>> MOL OSI supported for compatibility.
>>>
>>> That document looks pretty out of date.  Most of it is only discussing
>>> KVM PR, which is now barely maintained.  KVM HV only works with PAPR
>>> hypercalls.
>>
>> The links says it's latest kernel docs, so maybe an update need to be sent
>> to KVM?
>
> I guess, but the chances of me finding time to do it are approximately
> zero.
>
>>>> So if we need something else instead of
>>>> 2. PAPR hypercalls there seems to be two options: ePAPR and MOL OSI which
>>>> should work with KVM but then I'm not sure how to handle those on TCG.
>>>>
>>>>>>>> [...]
>>>>>>>>>>>> I've tested that the missing rtas is not the reason for getting no output
>>>>>>>>>>>> via serial though, as even when disabling rtas on pegasos2.rom it boots and
>>>>>>>>>>>> I still get serial output just some PCI devices are not detected (such as
>>>>>>>>>>>> USB, the video card and the not emulated ethernet port but these are not
>>>>>>>>>>>> fatal so it might even work as a first try without rtas, just to boot a
>>>>>>>>>>>> Linux kernel for testing it would be enough if I can fix the serial output).
>>>>>>>>>>>> I still don't know why it's not finding serial but I think it may be some
>>>>>>>>>>>> missing or wrong info in the device tree I generat. I'll try to focus on
>>>>>>>>>>>> this for now and leave the above rtas question for later.
>>>>>>>>>>>
>>>>>>>>>>> Oh.. another thought on that.  You have an ISA serial port on Pegasos,
>>>>>>>>>>> I believe.  I wonder if the PCI->ISA bridge needs some configuration /
>>>>>>>>>>> initialization that the firmware is expected to do.  If so you'll need
>>>>>>>>>>> to mimic that setup in qemu for the VOF case.
>>>>>>>>>>
>>>>>>>>>> That's what I begin to think because I've added everything to the device
>>>>>>>>>> tree that I thought could be needed and I still don't get it working so it
>>>>>>>>>> may need some config from the firmware. But how do I access device registers
>>>>>>>>>> from board code? I've tried adding a machine reset method and write to
>>>>>>>>>> memory mapped device registers but all my attempts failed. I've tried
>>>>>>>>>> cpu_stl_le_data and even memory_region_dispatch_write but these did not get
>>>>>>>>>> to the device. What's the way to access guest mmio regs from QEMU?
>>>>>>>>>
>>>>>>>>> That's odd, cpu_stl() and memory_region_dispatch_write() should work
>>>>>>>>> from board code (after the relevant memory regions are configured, of
>>>>>>>>> course).  As an ISA serial port, it's probably accessed through IO
>>>>>>>>> space, not memory space though, so you'd need &address_space_io.  And
>>>>>>>>> if there is some bridge configuration then it's the bridge control
>>>>>>>>> registers you need to look at not the serial registers - you'd have to
>>>>>>>>> look at the bridge documentation for that.  Or, I guess the bridge
>>>>>>>>> implementation in qemu, which you wrote part of.
>>>>>>>>
>>>>>>>> I've found at last that stl_le_phys() works. There are so many of these that
>>>>>>>> I never know when to use which.
>>>>>>>>
>>>>>>>> I think the address_space_rw calls in vof_client_call() in vof.c could also
>>>>>>>> use these for somewhat shorter code. I've ended up with
>>>>>>>> stl_le_phys(CPU(cpu)->as, addr, val) in my machine reset methodbut I don't
>>>>>>>> even need that now as it works without additional setup. Also VOF's memory
>>>>>>>> access is basically the same as the already existing rtas_st() and co. so
>>>>>>>> maybe that could be reused to make code smaller?
>>>>>>>
>>>>>>> rtas_ld() and rtas_st() should only be used for reading/writing RTAS
>>>>>>> parameters to and from memory.  Accessing IO shouldn't be done with
>>>>>>> those.
>>>>>>>
>>>>>>> For IO you probably want the cpu_st*() variants in most cases, since
>>>>>>> you're trying to emulate an IO access from the virtual cpu.
>>>>>>
>>>>>> I think I've tried that but what worked to access mmio device registers are
>>>>>> stl_le_phys and similar that are wrappers around address_space_stl_*. But I
>>>>>> did not mean that for rtas_ld/_st but the part when vof accessing the
>>>>>> parameters passed by its hypercall which is memory access:
>>>>>>
>>>>>> https://github.com/patchew-project/qemu/blob/patchew/20210520090557.435689-1-aik%40ozlabs.ru/hw/ppc/vof.c
>>>>>>
>>>>>> line 893, and vof_client_call before that is very similar to what h_rtas
>>>>>> does here:
>>>>>>
>>>>>> https://git.qemu.org/?p=qemu.git;a=blob;f=hw/ppc/spapr_hcall.c;h=f25014afda408002ee1ec1027a0dd7a6025eca61;hb=HEAD#l639
>>>>>>
>>>>>> and I also need to do the same for rtas in pegasos2 for which I'm just using
>>>>>> ldl_be_phys for now but I wonder if we really need 3 ways to do the same or
>>>>>> the rtas_ld/_st could be made more generic and reused here?
>>>>>
>>>>> For your rtas implementation you could definitely re-use them.  For
>>>>> the client call I'm a bit less confident, but if the in-guest-memory
>>>>> structures are really the same, then it would make sense.
>>>>
>>>> The memory structure seems very similar to me, the only difference is
>>>> calling the first field service in VOF instead of token in RTAS. Both are
>>>> just an array of big endian unit32_t with token, nargs, nret at the front
>>>> followed by args and rets. Since these rtas_ld/st are defined in spapr.h I
>>>> did not bother to split them off, so for pegasos2 rtas I'm just using the
>>>> ldl_be_* functions directly for which these are a shorthand for. If these
>>>> were split off for sharing between spapr rtas and VOF I may be able to reuse
>>>> them as well but it's not that important so just mentioned it as a possible
>>>> later clean up.
>>>
>>> Ok, sounds reasonable to re-use them then, though maybe add an aliased
>>> name for clarity ofci_{ld,st}(), maybe?  (for "Open Firmware Client
>>> Interface")
>>
>> I'll wait for what Alexey decides to do in the next VOF patch version and if
>> I can reuse that (I could if these were defined in vof.h). I don't want to
>> come up with yet another abstraction to ldl_be_* which does not seem to make
>> it more clear than using the actual functions for guest memory access which
>> is what we're doing while getting the hypercall args so I think either using
>> ldl_be_* directly or reusing already existing rfas_ls/_st would make sense
>> but adding similar funcs with another name just makes it more confusing.
>
> Well, the point of the rtas_ld() functions isn't o be a different way
> of accessing memory.  It's just a convenience wrapper that takes an
> RTAS args array and an argument index and does the right thing to
> retrieve it for you.
>
> So, if your RTAS function implementation when you want to get argument
> 0, you just go rtas_ld(args, 0) - more readable than having a bunch of
> offset calculations and a long winded call to the BE memory access
> function.  You can look at the examples in hw/ppc/sppar_rtas.c to see
> how its used.
>
> Actually, looking again at how it works, you should probably only use
> rtas_ld() if your general dispatch code has pre-parsed the args
> structure into separate args and rets arrays, again as we do in
> spapr_rtas.c

The problem with those rtas_* functions is that they are in spapr now so 
to reuse it I'd need to split them off which I did not do because it's not 
too bad without it and modifying spapr would mean another round of review 
which could take long and delay my other patches. So if somebody splits 
these off for reuse (like if Alexey wants to reuse them in VOF) then I may 
use them but otherwise I've just noted these could be reused but don't 
intend to do that now. This could also be done later for both VOF and 
pegasos2 as a clean up so it does not seem to be too important at the 
moment.

Regards,
BALATON Zoltan

