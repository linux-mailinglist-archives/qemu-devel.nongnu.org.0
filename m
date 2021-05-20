Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49B38B951
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 00:00:28 +0200 (CEST)
Received: from localhost ([::1]:48192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljqiR-0001DH-6N
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 18:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ljqhI-0000MO-7F; Thu, 20 May 2021 17:59:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:13330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ljqhD-0002CE-RE; Thu, 20 May 2021 17:59:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E74CF7457E5;
 Thu, 20 May 2021 23:59:07 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5F0A174570D; Thu, 20 May 2021 23:59:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5D8817456B4;
 Thu, 20 May 2021 23:59:07 +0200 (CEST)
Date: Thu, 20 May 2021 23:59:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
In-Reply-To: <20210520090557.435689-1-aik@ozlabs.ru>
Message-ID: <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
References: <20210520090557.435689-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 13%
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

On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
> The PAPR platform describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.
> 
> Since the beginning, the runtime component of the firmware (RTAS) has
> been implemented as a 20 byte shim which simply forwards it to
> a hypercall implemented in qemu. The boot time firmware component is
> SLOF - but a build that's specific to qemu, and has always needed to be
> updated in sync with it. Even though we've managed to limit the amount
> of runtime communication we need between qemu and SLOF, there's some,
> and it has become increasingly awkward to handle as we've implemented
> new features.
> 
> This implements a boot time OF client interface (CI) which is
> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> which implements Open Firmware Client Interface (OF CI). This allows
> using a smaller stateless firmware which does not have to manage
> the device tree.
> 
> The new "vof.bin" firmware image is included with source code under
> pc-bios/. It also includes RTAS blob.
> 
> This implements a handful of CI methods just to get -kernel/-initrd
> working. In particular, this implements the device tree fetching and
> simple memory allocator - "claim" (an OF CI memory allocator) and updates
> "/memory@0/available" to report the client about available memory.
> 
> This implements changing some device tree properties which we know how
> to deal with, the rest is ignored. To allow changes, this skips
> fdt_pack() when x-vof=on as not packing the blob leaves some room for
> appending.
> 
> In absence of SLOF, this assigns phandles to device tree nodes to make
> device tree traversing work.
> 
> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
> 
> This adds basic instances support which are managed by a hash map
> ihandle -> [phandle].
> 
> Before the guest started, the used memory is:
> 0..e60 - the initial firmware
> 8000..10000 - stack
> 400000.. - kernel
> 3ea0000.. - initramdisk
> 
> This OF CI does not implement "interpret".
> 
> Unlike SLOF, this does not format uninitialized nvram. Instead, this
> includes a disk image with pre-formatted nvram.
> 
> With this basic support, this can only boot into kernel directly.
> However this is just enough for the petitboot kernel and initradmdisk to
> boot from any possible source. Note this requires reasonably recent guest
> kernel with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
> 
> The immediate benefit is much faster booting time which especially
> crucial with fully emulated early CPU bring up environments. Also this
> may come handy when/if GRUB-in-the-userspace sees light of the day.
> 
> This separates VOF and sPAPR in a hope that VOF bits may be reused by
> other POWERPC boards which do not support pSeries.
> 
> This is coded in assumption that later on we might be adding support for
> booting from QEMU backends (blockdev is the first candidate) without
> devices/drivers in between as OF1275 does not require that and
> it is quite easy to so.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> The example command line is:
> 
> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> -nodefaults \
> -chardev stdio,id=STDIO0,signal=off,mux=on \
> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
> -mon id=MON0,chardev=STDIO0,mode=readline \
> -nographic \
> -vga none \
> -enable-kvm \
> -m 8G \
> -machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
> -kernel pbuild/kernel-le-guest/vmlinux \
> -initrd pb/rootfs.cpio.xz \
> -drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw \
> -global spapr-nvram.drive=DRIVE0 \
> -snapshot \
> -smp 8,threads=8 \
> -L /home/aik/t/qemu-ppc64-bios/ \
> -trace events=qemu_trace_events \
> -d guest_errors \
> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
> -mon chardev=SOCKET0,mode=control
> 
> ---
> Changes:
> v20:
> * compile vof.bin with -mcpu=power4 for better compatibility
> * s/std/stw/ in entry.S to make it work on ppc32
> * fixed dt_available property to support both 32 and 64bit
> * shuffled prom_args handling code
> * do not enforce 32bit in MSR (again, to support 32bit platforms)
>

[...]

> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
> index ae0841fa3a18..9fb201dfacfa 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -9,3 +9,4 @@ CONFIG_POWERNV=y
>  # For pSeries
>  CONFIG_PSERIES=y
>  CONFIG_NVDIMM=y
> +CONFIG_VOF=y
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e51e0e5e5ac6..964510dfc73d 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -143,3 +143,6 @@ config FW_CFG_PPC
>
>  config FDT_PPC
>      bool
> +
> +config VOF
> +    bool

I think you should just add "select VOF" to config PSERIES section in 
Kconfig instead of adding it to default-configs/devices/ppc64-softmmu.mak. 
That should do it, it works in my updated pegasos2 patch:

https://osdn.net/projects/qmiga/scm/git/qemu/commits/3c1fad08469b4d3c04def22044e52b2d27774a61

[...]
> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
> new file mode 100644
> index 000000000000..569688714c91
> --- /dev/null
> +++ b/pc-bios/vof/entry.S
> @@ -0,0 +1,51 @@
> +#define LOAD32(rn, name)    \
> +	lis     rn,name##@h;    \
> +	ori     rn,rn,name##@l
> +
> +#define ENTRY(func_name)    \
> +	.text;                  \
> +	.align  2;              \
> +	.globl  .func_name;     \
> +	.func_name:             \
> +	.globl  func_name;      \
> +	func_name:
> +
> +#define KVMPPC_HCALL_BASE       0xf000
> +#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
> +
> +	. = 0x100 /* Do exactly as SLOF does */
> +
> +ENTRY(_start)
> +#	LOAD32(%r31, 0) /* Go 32bit mode */
> +#	mtmsrd %r31,0
> +	LOAD32(2, __toc_start)
> +	b entry_c
> +
> +ENTRY(_prom_entry)
> +	LOAD32(2, __toc_start)
> +	stwu    %r1,-112(%r1)
> +	stw     %r31,104(%r1)
> +	mflr    %r31
> +	bl prom_entry
> +	nop
> +	mtlr    %r31
> +	ld      %r31,104(%r1)

It's getting there, now I see the first client call from the guest boot 
code but then it crashes on this ld opcode which apparently is 64 bit 
only:

IN:
0x00c00214:  9421ffd0  stwu     r1, -0x30(r1)
0x00c00218:  7c691b78  mr       r9, r3
0x00c0021c:  7c0802a6  mflr     r0
0x00c00220:  7d2903a6  mtctr    r9
0x00c00224:  3d2000d9  lis      r9, 0xd9
0x00c00228:  39400001  li       r10, 1
0x00c0022c:  3929fc58  addi     r9, r9, 0xfc58
0x00c00230:  90010034  stw      r0, 0x34(r1)
0x00c00234:  38610008  addi     r3, r1, 8
0x00c00238:  39000000  li       r8, 0
0x00c0023c:  90810014  stw      r4, 0x14(r1)
0x00c00240:  91210008  stw      r9, 8(r1)
0x00c00244:  9141000c  stw      r10, 0xc(r1)
0x00c00248:  91410010  stw      r10, 0x10(r1)
0x00c0024c:  91010018  stw      r8, 0x18(r1)
0x00c00250:  4e800421  bctrl

----------------
IN:
0x0000010c:  3c400000  lis      r2, 0
0x00000110:  60428e00  ori      r2, r2, 0x8e00
0x00000114:  9421ff90  stwu     r1, -0x70(r1)
0x00000118:  93e10068  stw      r31, 0x68(r1)
0x0000011c:  7fe802a6  mflr     r31
0x00000120:  4800028d  bl       0x3ac
[...]

IN:
0x000003e4:  7c691b78  mr       r9, r3
0x000003e8:  2c090000  cmpwi    r9, 0
0x000003ec:  4182000c  beq      0x3f8

----------------
IN:
0x000003f0:  807f0008  lwz      r3, 8(r31)
0x000003f4:  4bfffd45  bl       0x138

Raise exception at 00000144 => 00000008 (01)
hypercall r3=000000000000f005 r4=000000000000fae8 r5=000000000000010c r6=0000000000000005 r7=0000000000000e80 r8=0000000000000000 r9=00000000ffffffff r10=0000000000000063 r11=000000000000fa50 r12=0000000000000040 nip=00000144
vof_finddevice "/" => ph=0x1
----------------
IN:
0x000003f8:  60000000  nop
0x000003fc:  397f0020  addi     r11, r31, 0x20
0x00000400:  800b0004  lwz      r0, 4(r11)
0x00000404:  7c0803a6  mtlr     r0
0x00000408:  83cbfff8  lwz      r30, -8(r11)
0x0000040c:  83ebfffc  lwz      r31, -4(r11)
0x00000410:  7d615b78  mr       r1, r11
0x00000414:  4e800020  blr

invalid/unsupported opcode: 3a - 14 - 01 - 01 (ebe10068) 0000012c
----------------
IN:
0x00000124:  60000000  nop
0x00000128:  7fe803a6  mtlr     r31
0x0000012c:  ebe10068  ld       r31, 0x68(r1)

Raise exception at 0000012c => 00000060 (21)
invalid/unsupported opcode: 00 - 00 - 00 - 00 (00000000) fff00700
----------------
IN:
0xfff00700:  00000000  .byte    0x00, 0x00, 0x00, 0x00

Hopefully this is the last such opcode left before I can really test this.

Do you have some info on how the stdout works in VOF? I think I'll need 
that to test with Linux and get output but I'm not sure what's needed on 
the machine side.

Regards,
BALATON Zoltan

> +	addi    %r1,%r1,112
> +	blr
> +
> +ENTRY(ci_entry)
> +	mr	4,3
> +	LOAD32(3,KVMPPC_H_VOF_CLIENT)
> +	sc	1
> +	blr
> +
> +/* This is the actual RTAS blob copied to the OS at instantiate-rtas */
> +ENTRY(hv_rtas)
> +	mr      %r4,%r3
> +	LOAD32(3,KVMPPC_H_RTAS)
> +	sc	1
> +	blr
> +	.globl hv_rtas_size
> +hv_rtas_size:
> +	.long . - hv_rtas;
> diff --git a/pc-bios/vof/l.lds b/pc-bios/vof/l.lds
> new file mode 100644
> index 000000000000..10b557a81f78
> --- /dev/null
> +++ b/pc-bios/vof/l.lds
> @@ -0,0 +1,48 @@
> +OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
> +OUTPUT_ARCH(powerpc:common)
> +
> +/* set the entry point */
> +ENTRY ( __start )
> +
> +SECTIONS {
> +	__executable_start = .;
> +
> +	.text : {
> +		*(.text)
> +	}
> +
> +	__etext = .;
> +
> +	. = ALIGN(8);
> +
> +	.data : {
> +		*(.data)
> +		*(.rodata .rodata.*)
> +		*(.got1)
> +		*(.sdata)
> +		*(.opd)
> +	}
> +
> +	/* FIXME bss at end ??? */
> +
> +	. = ALIGN(8);
> +	__bss_start = .;
> +	.bss : {
> +		*(.sbss) *(.scommon)
> +		*(.dynbss)
> +		*(.bss)
> +	}
> +
> +	. = ALIGN(8);
> +	__bss_end = .;
> +	__bss_size = (__bss_end - __bss_start);
> +
> +	. = ALIGN(256);
> +	__toc_start = DEFINED (.TOC.) ? .TOC. : ADDR (.got) + 0x8000;
> +	.got :
> +	{
> +		 *(.toc .got)
> +	}
> +	. = ALIGN(8);
> +	__toc_end = .;
> +}
> -- 
> 2.30.2
> 
>

