Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22E434FFC6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 13:56:28 +0200 (CEST)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRZSV-000308-8J
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 07:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lRZQw-00025X-BI; Wed, 31 Mar 2021 07:54:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:45302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lRZQk-0006eb-J6; Wed, 31 Mar 2021 07:54:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 62DE3746342;
 Wed, 31 Mar 2021 13:54:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1BCCF7462FD; Wed, 31 Mar 2021 13:54:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1A6437462E0;
 Wed, 31 Mar 2021 13:54:28 +0200 (CEST)
Date: Wed, 31 Mar 2021 13:54:28 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v16] spapr: Implement Open Firmware client interface
In-Reply-To: <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
Message-ID: <aea3e082-f4a0-10a3-c799-d323e4e02620@eik.bme.hu>
References: <20210323025830.104781-1-aik@ozlabs.ru>
 <YFv69rtZd6yzKAtU@yekko.fritz.box>
 <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021, Alexey Kardashevskiy wrote:
> On 25/03/2021 13:52, David Gibson wrote:
>> On Tue, Mar 23, 2021 at 01:58:30PM +1100, Alexey Kardashevskiy wrote:
>>> The PAPR platform which describes an OS environment that's presented by
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
>> 
>> I have some comments below, but they're basically all trivial at this
>> point.  We've missed qemu-6.0 obviously, but I'm hoping I can merge
>> the next spin to my ppc-for-6.1 tree.
>> 
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
>>> -m 2G \
>>> -machine 
>>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>>> \
>>> -kernel pbuild/kernel-le-guest/vmlinux \
>>> -initrd pb/rootfs.cpio.xz \
>>> -drive 
>>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw 
>>> \
>> 
>> Removing the need for a prebuild NVRAM image is something I'd like to
>> see as a followup.
>
>
> We do not _need_ NVRAM in the VM to begin with, or is this a requirement? The 
> whole VOF thing is more like a hack and I do not recall myself on doing 
> anything useful with NVRAM.
>
> If we really need it, then when to format it - in QEMU or VOF.bin? This alone 
> will trigger a (lengthy) discussion :)

Not necessarily lengthy. I don't know much about this but I'd say if the 
contents of the NVRAM is used by or only used by VOF then format it from 
VOF. If it's not used by VOF as I think you said then VOF does not need to 
know about it and you can/should handle it QEMU. (But VOF is part of QEMU 
so you'll do it within QEMU either way :-) )

I think the NVRAM is now formatted in QEMU and OpenBIOS for Mac emulation 
also uses that in some way but I'm not sure about that.

Regards,
BALATON Zoltan

