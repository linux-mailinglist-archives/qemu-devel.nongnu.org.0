Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774C38C2A0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 11:06:53 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk17M-0007X7-6t
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 05:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lk16H-0006fp-4Y; Fri, 21 May 2021 05:05:45 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:17836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lk16C-0002q2-Sh; Fri, 21 May 2021 05:05:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F4637457EE;
 Fri, 21 May 2021 11:05:34 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 189517457EF; Fri, 21 May 2021 11:05:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 16E007457E5;
 Fri, 21 May 2021 11:05:33 +0200 (CEST)
Date: Fri, 21 May 2021 11:05:33 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
Message-ID: <ec1742e3-c47-bbee-3a6-ec64442922ab@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <5825cde5-a408-a438-116d-5a9d9113a52a@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1362375985-1621587933=:20193"
X-Spam-Probability: 11%
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1362375985-1621587933=:20193
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 21 May 2021, Alexey Kardashevskiy wrote:
> On 21/05/2021 07:59, BALATON Zoltan wrote:
>> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
>>> The PAPR platform describes an OS environment that's presented by
>>> a combination of a hypervisor and firmware. The features it specifies
>>> require collaboration between the firmware and the hypervisor.
>>> 
>>> Since the beginning, the runtime component of the firmware (RTAS) has
>>> been implemented as a 20 byte shim which simply forwards it to
>>> a hypercall implemented in qemu. The boot time firmware component is
>>> SLOF - but a build that's specific to qemu, and has always needed to be
>>> updated in sync with it. Even though we've managed to limit the amount
>>> of runtime communication we need between qemu and SLOF, there's some,
>>> and it has become increasingly awkward to handle as we've implemented
>>> new features.
>>> 
>>> This implements a boot time OF client interface (CI) which is
>>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>>> which implements Open Firmware Client Interface (OF CI). This allows
>>> using a smaller stateless firmware which does not have to manage
>>> the device tree.
>>> 
>>> The new "vof.bin" firmware image is included with source code under
>>> pc-bios/. It also includes RTAS blob.
>>> 
>>> This implements a handful of CI methods just to get -kernel/-initrd
>>> working. In particular, this implements the device tree fetching and
>>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>>> "/memory@0/available" to report the client about available memory.
>>> 
>>> This implements changing some device tree properties which we know how
>>> to deal with, the rest is ignored. To allow changes, this skips
>>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>>> appending.
>>> 
>>> In absence of SLOF, this assigns phandles to device tree nodes to make
>>> device tree traversing work.
>>> 
>>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>>> 
>>> This adds basic instances support which are managed by a hash map
>>> ihandle -> [phandle].
>>> 
>>> Before the guest started, the used memory is:
>>> 0..e60 - the initial firmware
>>> 8000..10000 - stack
>>> 400000.. - kernel
>>> 3ea0000.. - initramdisk
>>> 
>>> This OF CI does not implement "interpret".
>>> 
>>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>>> includes a disk image with pre-formatted nvram.
>>> 
>>> With this basic support, this can only boot into kernel directly.
>>> However this is just enough for the petitboot kernel and initradmdisk to
>>> boot from any possible source. Note this requires reasonably recent guest
>>> kernel with:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735 
>>> 
>>> The immediate benefit is much faster booting time which especially
>>> crucial with fully emulated early CPU bring up environments. Also this
>>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>>> 
>>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>>> other POWERPC boards which do not support pSeries.
>>> 
>>> This is coded in assumption that later on we might be adding support for
>>> booting from QEMU backends (blockdev is the first candidate) without
>>> devices/drivers in between as OF1275 does not require that and
>>> it is quite easy to so.
>>> 
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>> 
>>> The example command line is:
>>> 
>>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>>> -nodefaults \
>>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>>> -mon id=MON0,chardev=STDIO0,mode=readline \
>>> -nographic \
>>> -vga none \
>>> -enable-kvm \
>>> -m 8G \
>>> -machine 
>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>> \
>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>> -initrd pb/rootfs.cpio.xz \
>>> -drive 
>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>> \
>>> -global spapr-nvram.drive=DRIVE0 \
>>> -snapshot \
>>> -smp 8,threads=8 \
>>> -L /home/aik/t/qemu-ppc64-bios/ \
>>> -trace events=qemu_trace_events \
>>> -d guest_errors \
>>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>>> -mon chardev=SOCKET0,mode=control
>>> 
>>> ---
>>> Changes:
>>> v20:
>>> * compile vof.bin with -mcpu=power4 for better compatibility
>>> * s/std/stw/ in entry.S to make it work on ppc32
>>> * fixed dt_available property to support both 32 and 64bit
>>> * shuffled prom_args handling code
>>> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>>> 
>> 
>> [...]
>> 
>>> diff --git a/default-configs/devices/ppc64-softmmu.mak 
>>> b/default-configs/devices/ppc64-softmmu.mak
>>> index ae0841fa3a18..9fb201dfacfa 100644
>>> --- a/default-configs/devices/ppc64-softmmu.mak
>>> +++ b/default-configs/devices/ppc64-softmmu.mak
>>> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>>>  # For pSeries
>>>  CONFIG_PSERIES=y
>>>  CONFIG_NVDIMM=y
>>> +CONFIG_VOF=y
>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>> index e51e0e5e5ac6..964510dfc73d 100644
>>> --- a/hw/ppc/Kconfig
>>> +++ b/hw/ppc/Kconfig
>>> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>>> 
>>>  config FDT_PPC
>>>      bool
>>> +
>>> +config VOF
>>> +    bool
>> 
>> I think you should just add "select VOF" to config PSERIES section in 
>> Kconfig instead of adding it to default-configs/devices/ppc64-softmmu.mak. 
>
> oh well, can do that too.

I think most config options should be selected by KConfig and the default 
config should only include machines, otherwise VOF would be added also 
when you don't compile PSERIES or PEGASOS2. With select in Kconfig it will 
be added when needed. That's why it's better to use select in this case.

>>  That should do it, it works in my updated pegasos2 patch:
>> 
>> https://osdn.net/projects/qmiga/scm/git/qemu/commits/3c1fad08469b4d3c04def22044e52b2d27774a61 
>> 
>> [...]
>>> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
>>> new file mode 100644
>>> index 000000000000..569688714c91
>>> --- /dev/null
>>> +++ b/pc-bios/vof/entry.S
>>> @@ -0,0 +1,51 @@
>>> +#define LOAD32(rn, name)    \
>>> +    lis     rn,name##@h;    \
>>> +    ori     rn,rn,name##@l
>>> +
>>> +#define ENTRY(func_name)    \
>>> +    .text;                  \
>>> +    .align  2;              \
>>> +    .globl  .func_name;     \
>>> +    .func_name:             \
>>> +    .globl  func_name;      \
>>> +    func_name:
>>> +
>>> +#define KVMPPC_HCALL_BASE       0xf000
>>> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
>>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>>> +
>>> +    . = 0x100 /* Do exactly as SLOF does */
>>> +
>>> +ENTRY(_start)
>>> +#    LOAD32(%r31, 0) /* Go 32bit mode */
>>> +#    mtmsrd %r31,0
>>> +    LOAD32(2, __toc_start)
>>> +    b entry_c
>>> +
>>> +ENTRY(_prom_entry)
>>> +    LOAD32(2, __toc_start)
>>> +    stwu    %r1,-112(%r1)
>>> +    stw     %r31,104(%r1)
>>> +    mflr    %r31
>>> +    bl prom_entry
>>> +    nop
>>> +    mtlr    %r31
>>> +    ld      %r31,104(%r1)
>> 
>> It's getting there, now I see the first client call from the guest boot 
>> code but then it crashes on this ld opcode which apparently is 64 bit only:
>
> Oh right.
>
>
>> Hopefully this is the last such opcode left before I can really test this.
>
> Make it lwz, and test it?

Yes, figured that out too after sending this message. Replacing with lwz 
works but I wonder that now you have stwu lwz do the stack offsets need 
adjusting too or you just waste 4 bytes now? With lwz here I found no 
further 64 bit opcodes and the guest boot code could walk the device tree. 
It failed later but I think that's because I'll need to fill more info 
about the machine in the device tree. I'll experiment with that but it 
looks like it could work at least for MorphOS. I'll have to try Linux too.

>> Do you have some info on how the stdout works in VOF? I think I'll need 
>> that to test with Linux and get output but I'm not sure what's needed on 
>> the machine side.
>
> VOF opens stsout and stores the ihandle (in fdt) which the client (==kernel) 
> uses for writing. To make it work properly, you need to hook up that instance 
> to a device backend similar to what I have for spapr-vty:
>
> https://github.com/aik/qemu/commit/a381a5b50c23c74013e2bd39cc5dad5b6385965d
>
> This is not a part of this patch as I'm trying to keep things simpler and 
> accessing backends from VOF is still unsettled. But there is a workaround 
> which  is trace_vof_write, I use this. Thanks,

The above patch is about stdin but stdout seems to be added by the current 
vof patch. What is spapr-vty? I don't think I have something similar in 
pegasos2 where I just have a normal serial port created by ISASuperIO in 
the vt8231 model. Can I use that backend somehow or have to create some 
other serial device to connect to stdout? Does trace_vof_write work for 
stuff output by the guest? I guess that's only for things printed by VOF 
itself but to see Linux output do I need a stdout in VOF or it will just 
open the serial with its own driver and use that? So I'm not sure what's 
the stdout parts in the current vof patch does and if I need that for 
anything. I'll try to experiment with it some more but fixing the ld and 
Kconfig seems to be enough to get it work for me.

Regards,
BALATON Zoltan
--3866299591-1362375985-1621587933=:20193--

