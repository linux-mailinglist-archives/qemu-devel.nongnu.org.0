Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA639D1D6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 00:22:36 +0200 (CEST)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq1AA-0004M5-HZ
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 18:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lq199-0003RW-OZ; Sun, 06 Jun 2021 18:21:32 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:28491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lq195-0008JC-Fm; Sun, 06 Jun 2021 18:21:31 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 841897457ED;
 Mon,  7 Jun 2021 00:21:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 34033745709; Mon,  7 Jun 2021 00:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 329987456B4;
 Mon,  7 Jun 2021 00:21:21 +0200 (CEST)
Date: Mon, 7 Jun 2021 00:21:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YLnIYRz+tGaXssVd@yekko>
Message-ID: <e908ae4-e48-395b-a737-8d4d2493f20@eik.bme.hu>
References: <7a4e47e5-59b-9132-eafd-d84d8b73f5c@eik.bme.hu>
 <17fbb016-2e7-d57e-bedd-1ae7814fb860@eik.bme.hu> <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu> <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu>
 <YK8vbO7x2C8kaBWZ@yekko> <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu>
 <YLc507CyOVq403TM@yekko> <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu>
 <YLnIYRz+tGaXssVd@yekko>
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

On Fri, 4 Jun 2021, David Gibson wrote:
> On Wed, Jun 02, 2021 at 02:29:29PM +0200, BALATON Zoltan wrote:
>> On Wed, 2 Jun 2021, David Gibson wrote:
>>> On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
>>>> On Thu, 27 May 2021, David Gibson wrote:
>>>>> On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
>>>>>> On Tue, 25 May 2021, David Gibson wrote:
>>>>>>> On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
>>>>>>>> On Mon, 24 May 2021, David Gibson wrote:
>>>>>>>>> On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
>>>>>>>>>> On Sun, 23 May 2021, BALATON Zoltan wrote:
>>>>>>>>>> and would using sc 1 for hypercalls on pegasos2 cause other
>>>>>>>>>> problems later even if the assert could be removed?
>>>>>>>>>
>>>>>>>>> At least in the short term, I think you probably can remove the
>>>>>>>>> assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
>>>>>>>>> but a special case escape to qemu for the firmware emulation.  I think
>>>>>>>>> it's unlikely to cause problems later, because nothing on a 32-bit
>>>>>>>>> system should be attempting an 'sc 1'.  The only thing I can think of
>>>>>>>>> that would fail is some test case which explicitly verified that 'sc
>>>>>>>>> 1' triggered a 0x700 (SIGILL from userspace).
>>>>>>>>
>>>>>>>> OK so the assert should check if the CPU has an HV bit. I think there was a
>>>>>>>> #detine for that somewhere that I can add to the assert then I can try that.
>>>>>>>> What I wasn't sure about is that sc 1 would conflict with the guest's usage
>>>>>>>> of normal sc calls or are these going through different paths and only sc 1
>>>>>>>> will trigger vhyp callback not affecting notmal sc calls?
>>>>>>>
>>>>>>> The vhyp shouldn't affect normal system calls, 'sc 1' is specifically
>>>>>>> for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and the
>>>>>>> vhyp only intercepts the hypercall version (after all Linux on PAPR
>>>>>>> certainly uses its own system calls, and hypercalls are active for the
>>>>>>> lifetime of the guest there).
>>>>>>>
>>>>>>>> (Or if this causes
>>>>>>>> an otherwise unnecessary VM exit on KVM even when it works then maybe
>>>>>>>> looking for a different way in the future might be needed.
>>>>>>>
>>>>>>> What you're doing here won't work with KVM as it stands.  There are
>>>>>>> basically two paths into the vhyp hypercall path: 1) from TCG, if we
>>>>>>> interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if we get
>>>>>>> a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.
>>>>>>>
>>>>>>> The second path is specific to the PAPR (ppc64) implementation of KVM,
>>>>>>> and will not work for a non-PAPR platform without substantial
>>>>>>> modification of the KVM code.
>>>>>>
>>>>>> OK so then at that point when we try KVM we'll need to look at alternative
>>>>>> ways, I think MOL OSI worked with KVM at least in MOL but will probably make
>>>>>> all syscalls exit KVM but since we'll probably need to use KVM PR it will
>>>>>> exit anyway. For now I keep this vhyp as it does not run with KVM for other
>>>>>> reasons yet so that's another area to clean up so as a proof of concept
>>>>>> first version of using VOF vhyp will do.
>>>>>
>>>>> Eh, since you'll need to modify KVM anyway, it probably makes just as
>>>>> much sense to modify it to catch the 'sc 1' as MoL's magic thingy.
>>>>
>>>> I'm not sure how KVM works for this case so I also don't know why and what
>>>> would need to be modified. I think we'll only have KVM PR working as newer
>>>> POWER CPUs having HV (besides being rare among potential users) are probably
>>>> too different to run the OSes that expect at most a G4 on pegasos2 so likely
>>>> it won't work with KVM HV.
>>>
>>> Oh, it definitely won't work with KVM HV.
>>>
>>>> If we have KVM PR doesn't sc already trap so we
>>>> could add MOL OSI without further modification to KVM itself only needing
>>>> change in QEMU?
>>>
>>> Uh... I guess so?
>>>
>>>> I also hope that MOL OSI could be useful for porting some
>>>> paravirt drivers from MOL for running Mac OS X on Mac emulation but I don't
>>>> know about that for sure so I'm open to any other solution too.
>>>
>>> Maybe.  I never know much about MOL to begin with, and anything I did
>>> know was a decade or more ago so I've probably forgotten.
>>
>> That may still be more than what I know about it since I never had any
>> knowledge about PPC KVM and don't have any PPC hardware to test with so I'm
>> mostly guessing. (I could test with KVM emulated in QEMU and I did set up an
>> environment for that but that's a bit slow and inconvenient so I'd leave KVM
>> support to those interested and have more knowledge and hardware for it.)
>
> Sounds like a problem for someone else another time, then.

So now that it works on TCG with vhyp I tried what it would do on KVM PR 
with the sc 1 but I could only test that on QEMU itself running in a Linux 
guest. First I've hit missing this callback:

https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/kvm.c;h=104a308abb5700b2fe075397271f314d7f607543;hb=HEAD#l856

that I can fix by providing a callback in pegasos2.c that does what the 
else clause would do returning POWERPC_CPU(current_cpu)->env.spr[SPR_SDR1] 
(I guess that's the correct thing to do if it works without vhyp).

After getting past this, the host QEMU crashed on the first sc 1 call with 
this error:

qemu: fatal: Trying to deliver HV exception (MSR) 8 with no HV support

NIP 0000000000000148   LR 0000000000000590 CTR 0000000000000000 XER 0000000000000000 CPU#0
MSR 000000000000d032 HID0 0000000060000000  HF 00004012 iidx 0 didx 0
TB 00000203 876006644638 DECR 422427
GPR00 0000000000000680 000000000000fe90 0000000000008e00 000000000000f005
GPR04 000000000000fe9c 0000000000000001 0000000000000e78 0000000000000000
GPR08 000000000000fe98 000000000000fe9c 0000000000000001 0000000000000000
GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR28 0000000000000000 0000000000000000 0000000000008e9c 000000000000fe90
CR 20000000  [ E  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
FPR00 bff0000000000000 0000000000000000 0000000000000000 0000000000000000
FPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR12 3ff553f7ced91687 0000000000000000 0000000000000000 0000000000000000
FPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPSCR 0000000082004000
  SRR0 00000000000001d4  SRR1 300000000000d032    PVR 00000000003c0301 VRSAVE 00000000ffffffff
SPRG0 000000003fe00000 SPRG1 c00000000ff60000  SPRG2 c00000000ff60000  SPRG3 0000000000000000
SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
  SDR1 000000003f000006   DAR f00000000090abf0  DSISR 0000000042000000
Aborted (core dumped)

(vof.bin looks like this:

  100:   3c 40 00 00     lis     r2,0
  104:   60 42 8e 00     ori     r2,r2,36352
  108:   48 00 00 cc     b       0x1d4
  10c:   3c 40 00 00     lis     r2,0
  110:   60 42 8e 00     ori     r2,r2,36352
  114:   94 21 ff 90     stwu    r1,-112(r1)
  118:   93 e1 00 68     stw     r31,104(r1)
  11c:   7f e8 02 a6     mflr    r31
  120:   48 00 02 8d     bl      0x3ac
  124:   60 00 00 00     nop
  128:   7f e8 03 a6     mtlr    r31
  12c:   83 e1 00 68     lwz     r31,104(r1)
  130:   38 21 00 70     addi    r1,r1,112
  134:   4e 80 00 20     blr
  138:   7c 64 1b 78     mr      r4,r3
  13c:   3c 60 00 00     lis     r3,0
  140:   60 63 f0 05     ori     r3,r3,61445
  144:   44 00 00 22     sc      1
  148:   4e 80 00 20     blr

so I think it's the sc 1 at 0x144) The error is coming from here:

https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/excp_helper.c;h=fd147e2a37662456d30f7ab74b23bfb036260ced;hb=HEAD#l830

What does this mean? What would a real CPU do with this and where it could 
be catched to use as hypercall method on CPUs without HV or what else 
should we do if we wanted this to work with KVM PR too in the future?

Regards,
BALATON Zoltan

>>>> For now I'm
>>>> going with vhyp which is enough fot testing with TCG and if somebody wants
>>>> KVM they could use he original firmware for now so this could be improved in
>>>> a later version unless a simple solution is found before the freeze for 6.1.
>>>> If we're in KVM PR what happens for sc 1 could that be used too so maybe
>>>> what we have now could work?
>>>
>>> Note that if you do go down the MOL path it wouldn't be that complex
>>> to make a "vMOL" interface so you can use the same mechanism for KVM
>>> and TCG.
>>
>> Not sure what you mean by VMOL. Is it modifying MOL to use sc 1 like VOF
>> instead of its OSI way for hypercalls?
>
> No, I mean on the qemu side adding an optional hook which will
> intercept sc 0 instructions with the MOL magic register values and
> redirect them to a machine registered callback, rather than emulating
> the CPU's behaviour of jumping to the system call vector in guest
> space.
>
> Basically an equivalent of vhyp, but for MOL magic syscalls, instead
> of hypercalls.
>
>> That would lose the advantage of
>> being able to reuse MOL guest drivers without modification (which might be
>> useful for running OS X guest on Mac emulation) so if we can't use vhyp then
>> maybe using OSI would be the next choice for this reason but for now vhyp
>> seems to be working for what I could test so unless somebody here sees a
>> problem with it and has a better idea I'm going with vhyp for now just
>> because that's what VOF uses and I don't want to modify VOF to reuse it as
>> it is so I don't need to maintain a separate version and also get any
>> enhancements without further need to sync with spapr VOF.
>>
>> I've found this document about possible hypercall interfaces on KVM (see
>> Hypercall ABIs at the end):
>>
>> https://www.kernel.org/doc/html/latest/virt/kvm/ppc-pv.html
>>
>> Having both ePAPR (1.) and PAPR (2.) hypercalls is a bit confusing. Does
>> vhyp correspond to 2. PAPR?
>
> Yes.
>
>> The ePAPR (1.) seems to be preferred by KVM and
>> MOL OSI supported for compatibility.
>
> That document looks pretty out of date.  Most of it is only discussing
> KVM PR, which is now barely maintained.  KVM HV only works with PAPR
> hypercalls.
>
>> So if we need something else instead of
>> 2. PAPR hypercalls there seems to be two options: ePAPR and MOL OSI which
>> should work with KVM but then I'm not sure how to handle those on TCG.

