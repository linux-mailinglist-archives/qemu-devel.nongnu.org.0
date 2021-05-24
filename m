Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4338E399
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 11:58:40 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll7M7-00053T-BH
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 05:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ll7LD-0004E6-En; Mon, 24 May 2021 05:57:43 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ll7L8-0008AQ-Hc; Mon, 24 May 2021 05:57:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7B53874570E;
 Mon, 24 May 2021 11:57:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C0D90745709; Mon, 24 May 2021 11:57:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BF21274570D;
 Mon, 24 May 2021 11:57:27 +0200 (CEST)
Date: Mon, 24 May 2021 11:57:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <YKs4NbB4lF/YTAqo@yekko>
Message-ID: <3bf2ff2c-6cf3-ee4c-48b-394c531876@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu> <YKs4NbB4lF/YTAqo@yekko>
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

On Mon, 24 May 2021, David Gibson wrote:
> On Thu, May 20, 2021 at 11:59:07PM +0200, BALATON Zoltan wrote:
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
>>> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>> -initrd pb/rootfs.cpio.xz \
>>> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw \
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
>>> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
>>> index ae0841fa3a18..9fb201dfacfa 100644
>>> --- a/default-configs/devices/ppc64-softmmu.mak
>>> +++ b/default-configs/devices/ppc64-softmmu.mak
>>> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>>>  # For pSeries
>>>  CONFIG_PSERIES=y
>>>  CONFIG_NVDIMM=y
>>> +CONFIG_VOF=y
>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>> index e51e0e5e5ac6..964510dfc73d 100644
>>> --- a/hw/ppc/Kconfig
>>> +++ b/hw/ppc/Kconfig
>>> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>>>
>>>  config FDT_PPC
>>>      bool
>>> +
>>> +config VOF
>>> +    bool
>>
>> I think you should just add "select VOF" to config PSERIES section in
>> Kconfig instead of adding it to default-configs/devices/ppc64-softmmu.mak.
>> That should do it, it works in my updated pegasos2 patch:
>
> No, we don't want a "select": PSERIES doesn't require VOF while we
> still support SLOF, and indeed we're quite a ways from being ready to
> even make VOF the default pseries firmware.

Shouldn't you then also need to make code in spapr adding x-vof 
conditional on CONFIG_VOF or make sure it cannot be enabled if not 
compiled in? Otherwise it means VOF is always an option so spapr depends 
on VOF for which select is the way to describe that.

Regards,
BALATON Zoltan

