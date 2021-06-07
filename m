Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFF639E977
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 00:21:37 +0200 (CEST)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqNcl-00016r-Pu
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 18:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lqNc0-0000D8-8r; Mon, 07 Jun 2021 18:20:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:34968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lqNbv-0003Jg-Oq; Mon, 07 Jun 2021 18:20:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D8DC274570D;
 Tue,  8 Jun 2021 00:20:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8321D745709; Tue,  8 Jun 2021 00:20:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8107A7456B4;
 Tue,  8 Jun 2021 00:20:36 +0200 (CEST)
Date: Tue, 8 Jun 2021 00:20:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YL2UcvIoUHFIVmXp@yekko>
Message-ID: <da2b791b-70d9-6926-b34f-44a7bc431f5@eik.bme.hu>
References: <YKtBJoQXSrSVENFw@yekko>
 <939a489f-40de-da33-dd7-9fd1f5eb190@eik.bme.hu> <YKyJ3I5QIDLwR99t@yekko>
 <894b8b19-576d-8b25-922f-58613bad8545@eik.bme.hu> <YK8vbO7x2C8kaBWZ@yekko>
 <653edbe1-f912-bc8f-ec7f-c4f069b0a5b9@eik.bme.hu> <YLc507CyOVq403TM@yekko>
 <4046a5c1-6c67-7597-90b9-df1751e7ca47@eik.bme.hu> <YLnIYRz+tGaXssVd@yekko>
 <e908ae4-e48-395b-a737-8d4d2493f20@eik.bme.hu> <YL2UcvIoUHFIVmXp@yekko>
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

On Mon, 7 Jun 2021, David Gibson wrote:
> On Mon, Jun 07, 2021 at 12:21:21AM +0200, BALATON Zoltan wrote:
>> On Fri, 4 Jun 2021, David Gibson wrote:
>>> On Wed, Jun 02, 2021 at 02:29:29PM +0200, BALATON Zoltan wrote:
>>>> On Wed, 2 Jun 2021, David Gibson wrote:
>>>>> On Thu, May 27, 2021 at 02:42:39PM +0200, BALATON Zoltan wrote:
>>>>>> On Thu, 27 May 2021, David Gibson wrote:
>>>>>>> On Tue, May 25, 2021 at 12:08:45PM +0200, BALATON Zoltan wrote:
>>>>>>>> On Tue, 25 May 2021, David Gibson wrote:
>>>>>>>>> On Mon, May 24, 2021 at 12:55:07PM +0200, BALATON Zoltan wrote:
>>>>>>>>>> On Mon, 24 May 2021, David Gibson wrote:
>>>>>>>>>>> On Sun, May 23, 2021 at 07:09:26PM +0200, BALATON Zoltan wrote:
>>>>>>>>>>>> On Sun, 23 May 2021, BALATON Zoltan wrote:
>>>>>>>>>>>> and would using sc 1 for hypercalls on pegasos2 cause other
>>>>>>>>>>>> problems later even if the assert could be removed?
>>>>>>>>>>>
>>>>>>>>>>> At least in the short term, I think you probably can remove the
>>>>>>>>>>> assert.  In your case the 'sc 1' calls aren't truly to a hypervisor,
>>>>>>>>>>> but a special case escape to qemu for the firmware emulation.  I think
>>>>>>>>>>> it's unlikely to cause problems later, because nothing on a 32-bit
>>>>>>>>>>> system should be attempting an 'sc 1'.  The only thing I can think of
>>>>>>>>>>> that would fail is some test case which explicitly verified that 'sc
>>>>>>>>>>> 1' triggered a 0x700 (SIGILL from userspace).
>>>>>>>>>>
>>>>>>>>>> OK so the assert should check if the CPU has an HV bit. I think there was a
>>>>>>>>>> #detine for that somewhere that I can add to the assert then I can try that.
>>>>>>>>>> What I wasn't sure about is that sc 1 would conflict with the guest's usage
>>>>>>>>>> of normal sc calls or are these going through different paths and only sc 1
>>>>>>>>>> will trigger vhyp callback not affecting notmal sc calls?
>>>>>>>>>
>>>>>>>>> The vhyp shouldn't affect normal system calls, 'sc 1' is specifically
>>>>>>>>> for hypercalls, as opposed to normal 'sc' (a.k.a. 'sc 0'), and the
>>>>>>>>> vhyp only intercepts the hypercall version (after all Linux on PAPR
>>>>>>>>> certainly uses its own system calls, and hypercalls are active for the
>>>>>>>>> lifetime of the guest there).
>>>>>>>>>
>>>>>>>>>> (Or if this causes
>>>>>>>>>> an otherwise unnecessary VM exit on KVM even when it works then maybe
>>>>>>>>>> looking for a different way in the future might be needed.
>>>>>>>>>
>>>>>>>>> What you're doing here won't work with KVM as it stands.  There are
>>>>>>>>> basically two paths into the vhyp hypercall path: 1) from TCG, if we
>>>>>>>>> interpret an 'sc 1' instruction we enter vhyp, 2) from KVM, if we get
>>>>>>>>> a KVM_EXIT_PAPR_HCALL KVM exit then we also go to the vhyp path.
>>>>>>>>>
>>>>>>>>> The second path is specific to the PAPR (ppc64) implementation of KVM,
>>>>>>>>> and will not work for a non-PAPR platform without substantial
>>>>>>>>> modification of the KVM code.
>>>>>>>>
>>>>>>>> OK so then at that point when we try KVM we'll need to look at alternative
>>>>>>>> ways, I think MOL OSI worked with KVM at least in MOL but will probably make
>>>>>>>> all syscalls exit KVM but since we'll probably need to use KVM PR it will
>>>>>>>> exit anyway. For now I keep this vhyp as it does not run with KVM for other
>>>>>>>> reasons yet so that's another area to clean up so as a proof of concept
>>>>>>>> first version of using VOF vhyp will do.
>>>>>>>
>>>>>>> Eh, since you'll need to modify KVM anyway, it probably makes just as
>>>>>>> much sense to modify it to catch the 'sc 1' as MoL's magic thingy.
>>>>>>
>>>>>> I'm not sure how KVM works for this case so I also don't know why and what
>>>>>> would need to be modified. I think we'll only have KVM PR working as newer
>>>>>> POWER CPUs having HV (besides being rare among potential users) are probably
>>>>>> too different to run the OSes that expect at most a G4 on pegasos2 so likely
>>>>>> it won't work with KVM HV.
>>>>>
>>>>> Oh, it definitely won't work with KVM HV.
>>>>>
>>>>>> If we have KVM PR doesn't sc already trap so we
>>>>>> could add MOL OSI without further modification to KVM itself only needing
>>>>>> change in QEMU?
>>>>>
>>>>> Uh... I guess so?
>>>>>
>>>>>> I also hope that MOL OSI could be useful for porting some
>>>>>> paravirt drivers from MOL for running Mac OS X on Mac emulation but I don't
>>>>>> know about that for sure so I'm open to any other solution too.
>>>>>
>>>>> Maybe.  I never know much about MOL to begin with, and anything I did
>>>>> know was a decade or more ago so I've probably forgotten.
>>>>
>>>> That may still be more than what I know about it since I never had any
>>>> knowledge about PPC KVM and don't have any PPC hardware to test with so I'm
>>>> mostly guessing. (I could test with KVM emulated in QEMU and I did set up an
>>>> environment for that but that's a bit slow and inconvenient so I'd leave KVM
>>>> support to those interested and have more knowledge and hardware for it.)
>>>
>>> Sounds like a problem for someone else another time, then.
>>
>> So now that it works on TCG with vhyp I tried what it would do on KVM PR
>> with the sc 1 but I could only test that on QEMU itself running in a Linux
>> guest. First I've hit missing this callback:
>>
>> https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/kvm.c;h=104a308abb5700b2fe075397271f314d7f607543;hb=HEAD#l856
>>
>> that I can fix by providing a callback in pegasos2.c that does what the else
>> clause would do returning POWERPC_CPU(current_cpu)->env.spr[SPR_SDR1] (I
>> guess that's the correct thing to do if it works without vhyp).
>
> For your case, yes that's right.  Again vhyp is designed for the case
> where the (hash) MMU is owned by the hypervisor.  But due to a gross
> hack the way we communicate the userspace address of the hash table to
> KVM PR is via the SDR1 register, which is why we need that hook.
>
>> After getting past this, the host QEMU crashed on the first sc 1 call with
>> this error:
>>
>> qemu: fatal: Trying to deliver HV exception (MSR) 8 with no HV support
>
>> NIP 0000000000000148   LR 0000000000000590 CTR 0000000000000000 XER 0000000000000000 CPU#0
>> MSR 000000000000d032 HID0 0000000060000000  HF 00004012 iidx 0 didx 0
>> TB 00000203 876006644638 DECR 422427
>> GPR00 0000000000000680 000000000000fe90 0000000000008e00 000000000000f005
>> GPR04 000000000000fe9c 0000000000000001 0000000000000e78 0000000000000000
>> GPR08 000000000000fe98 000000000000fe9c 0000000000000001 0000000000000000
>> GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR28 0000000000000000 0000000000000000 0000000000008e9c 000000000000fe90
>> CR 20000000  [ E  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
>> FPR00 bff0000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPR12 3ff553f7ced91687 0000000000000000 0000000000000000 0000000000000000
>> FPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> FPSCR 0000000082004000
>>  SRR0 00000000000001d4  SRR1 300000000000d032    PVR 00000000003c0301 VRSAVE 00000000ffffffff
>> SPRG0 000000003fe00000 SPRG1 c00000000ff60000  SPRG2 c00000000ff60000  SPRG3 0000000000000000
>> SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
>>  SDR1 000000003f000006   DAR f00000000090abf0  DSISR 0000000042000000
>> Aborted (core dumped)
>>
>> (vof.bin looks like this:
>>
>>  100:   3c 40 00 00     lis     r2,0
>>  104:   60 42 8e 00     ori     r2,r2,36352
>>  108:   48 00 00 cc     b       0x1d4
>>  10c:   3c 40 00 00     lis     r2,0
>>  110:   60 42 8e 00     ori     r2,r2,36352
>>  114:   94 21 ff 90     stwu    r1,-112(r1)
>>  118:   93 e1 00 68     stw     r31,104(r1)
>>  11c:   7f e8 02 a6     mflr    r31
>>  120:   48 00 02 8d     bl      0x3ac
>>  124:   60 00 00 00     nop
>>  128:   7f e8 03 a6     mtlr    r31
>>  12c:   83 e1 00 68     lwz     r31,104(r1)
>>  130:   38 21 00 70     addi    r1,r1,112
>>  134:   4e 80 00 20     blr
>>  138:   7c 64 1b 78     mr      r4,r3
>>  13c:   3c 60 00 00     lis     r3,0
>>  140:   60 63 f0 05     ori     r3,r3,61445
>>  144:   44 00 00 22     sc      1
>>  148:   4e 80 00 20     blr
>>
>> so I think it's the sc 1 at 0x144) The error is coming from here:
>>
>> https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/excp_helper.c;h=fd147e2a37662456d30f7ab74b23bfb036260ced;hb=HEAD#l830
>>
>> What does this mean? What would a real CPU do with this and where it could
>> be catched to use as hypercall method on CPUs without HV or what else should
>> we do if we wanted this to work with KVM PR too in the future?
>
> The interesting bit is actually how we're getting to that part of
> powerpc_excp.  I guess we must be getting a KVM exit for that 'sc 1',
> but I don't know what type.  If we can figure out that would be where
> we'd need to intercept it and send it to the vhyp handler instead of
> actually trying to enter the hypercall vector on the emulated CPU,
> which doesn't have one.

Well, this is emulated KVM PR running in a TCG guest because as I 
mentioned before I don't have real hardware to test KVM on. So I've booted 
Linux on qemu-system-ppc64 -M mac99,via=pmu (that's using 970 (G5) CPU) 
and run qemu-system-ppc with KVM PR within it. So it's ultimately coming 
from somewhere in TCG:

#0  0x00007f5d1c0f09ba in raise () at /lib64/libc.so.6
#1  0x00007f5d1c0d9524 in abort () at /lib64/libc.so.6
#2  0x00005557807f4776 in cpu_abort (cpu=cpu@entry=0x5557826bff30, fmt=fmt@entry=0x555780a8ad88 "Trying to deliver HV exception (MSR) %d with no HV support\n") at ../cpu.c:376
#3  0x00005557806a09c6 in powerpc_excp (cpu=0x5557826bff30, excp_model=13, excp=<optimized out>) at ../target/ppc/excp_helper.c:833
#4  0x000055578073bf43 in cpu_handle_exception (ret=<synthetic pointer>, cpu=0x555782669640) at ../accel/tcg/cpu-exec.c:524
#5  0x000055578073bf43 in cpu_exec (cpu=cpu@entry=0x5557826bff30) at ../accel/tcg/cpu-exec.c:778
#6  0x0000555780750d82 in tcg_cpus_exec (cpu=cpu@entry=0x5557826bff30) at ../accel/tcg/tcg-accel-ops.c:67
#7  0x0000555780755103 in mttcg_cpu_thread_fn (arg=arg@entry=0x5557826bff30) at ../accel/tcg/tcg-accel-ops-mttcg.c:70
#8  0x0000555780974eea in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:521
#9  0x00007f5d1c28704c in start_thread () at /lib64/libpthread.so.0
#10 0x00007f5d1c1b82cf in clone () at /lib64/libc.so.6

This is a backtrace on the host because to outer TCG qemu is getting this 
abort when the guest qemu in it runs the sc 1 via KVM PR. So it's trapped 
on the host not in the guest but I don't know what a real CPU would do in 
this case and if that's emulated correctly in nested KVM (apparently not 
as it's crashing). This makes it a bit hard to test as I can also run into 
KVM emulation bugs in the host QEMU as well as problems with KVM PR that 
would also happen on real hardware but it might not be obvious which I've 
hit.


Another unrelated problem I've found with KVM PR is when trying to run it 
with the board firmware (that's not crashing as that's not using sc 1) it 
initially starts but gets stuck soon after starting. When enabling kvm 
traces in QEMU I see endless kvm exits:

kvm_run_exit cpu_index 0, reason 6
kvm_run_exit cpu_index 0, reason 6
kvm_run_exit cpu_index 0, reason 6
kvm_run_exit cpu_index 0, reason 6

but NIP is not advancing in info registers:

(qemu) info registers
kvm_failed_spr_get Warning: Unable to retrieve SPR 1013 from KVM: Invalid argument
NIP fff05958   LR fff05524 CTR 00000000 XER 20000000 CPU#0
MSR 00000030 HID0 00000000  HF 6c000002 iidx 3 didx 3
TB 00000000 00000000 DECR 0
GPR00 0000000000000000 0000000000000000 0000000000000000 0000000000000081
GPR04 00000000fe000d00 0000000000000069 00000000fff042a0 00000000fff054cc
GPR08 0000000000f5e7f8 00000000ffffff00 00000000fff04274 0000000000000000
GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR28 0000000000000000 0000000000000000 0000000000000002 0000000000000000
CR 40000000  [ G  -  -  -  -  -  -  -  ]             RES ffffffff
FPR00 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
FPSCR 00000000
  SRR0 00000000  SRR1 00000000    PVR 000c0209 VRSAVE 00000000
SPRG0 00000000 SPRG1 00000000  SPRG2 00000000  SPRG3 00000000
SPRG4 00000000 SPRG5 00000000  SPRG6 00000000  SPRG7 00000000
  SDR1 00000000   DAR 00000000  DSISR 00000000
(qemu) kvm_failed_spr_set Warning: Unable to set SPR 1013 to KVM: Invalid argument

It stays on fff05958, the instruction it seems to be stuck on is doing 
some io:

0xfff05938:  7c0006ac  eieio
0xfff0593c:  98640001  stb      r3, 1(r4)
0xfff05940:  7c0006ac  eieio
0xfff05944:  4e800020  blr
0xfff05948:  7c641b78  mr       r4, r3
0xfff0594c:  6484fe00  oris     r4, r4, 0xfe00
0xfff05950:  7c0006ac  eieio
0xfff05954:  88640000  lbz      r3, 0(r4)
0xfff05958:  7c0006ac  eieio
0xfff0595c:  7c0004ac  sync
0xfff05960:  4e800020  blr

but likely it's trying to access a device which is not emulated so 
nothing's there. When I run the same with TCG I get some invalid accesss 
warnings with -d guest_errors enabled around the same point:

Invalid access at addr 0xFE000E43, size 1, region '(null)', reason: rejected
Invalid access at addr 0xE43, size 1, region '(null)', reason: rejected
Invalid access at addr 0xFE000E44, size 1, region '(null)', reason: rejected
Invalid access at addr 0xE44, size 1, region '(null)', reason: rejected
Invalid access at addr 0xFE000E41, size 1, region '(null)', reason: rejected
Invalid access at addr 0xE41, size 1, region '(null)', reason: rejected
Invalid access at addr 0xFE000E42, size 1, region '(null)', reason: rejected
Invalid access at addr 0xE42, size 1, region '(null)', reason: rejected
Invalid access at addr 0xFE000E40, size 1, region '(null)', reason: rejected
Invalid access at addr 0xE40, size 1, region '(null)', reason: rejected

but it's moving on with TCG and since the device that should be here is 
not really needed (it's setting up some clock generators on real hardware 
at this point) it's working anyway. Is this a problem with KVM so do I 
really need to put unimplemented devices to every address the guest may 
access even when that's not needed on TCG or is this a bug somewhere that 
after detecting this error it's not advancing the IP and trying to execute 
the same instruction again? I'm not sure how to debug this further or 
where to look for a bug or fix it.

Regards,
BALATON Zoltan

