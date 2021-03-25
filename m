Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E658348736
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:57:07 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPGBB-0001lr-Bz
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPG7I-0007fL-1p; Wed, 24 Mar 2021 22:53:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50621 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPG78-00043K-ER; Wed, 24 Mar 2021 22:52:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5V5T5m1kz9sWQ; Thu, 25 Mar 2021 13:52:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616640765;
 bh=wNQ+EQ5URrOhMK0GJtcNJKtKJuWbwT5IsUUGHVK0MMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KC4g6k+J5P3hhrz2Hllw74ktPTEHF2OAUyb2A3ZH8bRBk/DvcuYCX4cMcrdk4xemE
 bYVt4s2ROmC6RjhAthLM6YMOpvElgCZwAe6/IEJ41zLEHzmKNpbiJF8oNPaIKela0c
 FEjs6YoUDAgv/gu6MDl6ZgzCTD0MXnpRP23TVSp0=
Date: Thu, 25 Mar 2021 13:52:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v16] spapr: Implement Open Firmware client interface
Message-ID: <YFv69rtZd6yzKAtU@yekko.fritz.box>
References: <20210323025830.104781-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SOlI3FegC4VBGFHW"
Content-Disposition: inline
In-Reply-To: <20210323025830.104781-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SOlI3FegC4VBGFHW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 01:58:30PM +1100, Alexey Kardashevskiy wrote:
> The PAPR platform which describes an OS environment that's presented by
> a combination of a hypervisor and firmware. The features it specifies
> require collaboration between the firmware and the hypervisor.
>=20
> Since the beginning, the runtime component of the firmware (RTAS) has
> been implemented as a 20 byte shim which simply forwards it to
> a hypercall implemented in qemu. The boot time firmware component is
> SLOF - but a build that's specific to qemu, and has always needed to be
> updated in sync with it. Even though we've managed to limit the amount
> of runtime communication we need between qemu and SLOF, there's some,
> and it has become increasingly awkward to handle as we've implemented
> new features.
>=20
> This implements a boot time OF client interface (CI) which is
> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> which implements Open Firmware Client Interface (OF CI). This allows
> using a smaller stateless firmware which does not have to manage
> the device tree.
>=20
> The new "vof.bin" firmware image is included with source code under
> pc-bios/. It also includes RTAS blob.
>=20
> This implements a handful of CI methods just to get -kernel/-initrd
> working. In particular, this implements the device tree fetching and
> simple memory allocator - "claim" (an OF CI memory allocator) and updates
> "/memory@0/available" to report the client about available memory.
>=20
> This implements changing some device tree properties which we know how
> to deal with, the rest is ignored. To allow changes, this skips
> fdt_pack() when x-vof=3Don as not packing the blob leaves some room for
> appending.
>=20
> In absence of SLOF, this assigns phandles to device tree nodes to make
> device tree traversing work.
>=20
> When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds a tree.
>=20
> This adds basic instances support which are managed by a hash map
> ihandle -> [phandle].
>=20
> Before the guest started, the used memory is:
> 0..e60 - the initial firmware
> 8000..10000 - stack
> 400000.. - kernel
> 3ea0000.. - initramdisk
>=20
> This OF CI does not implement "interpret".
>=20
> Unlike SLOF, this does not format uninitialized nvram. Instead, this
> includes a disk image with pre-formatted nvram.
>=20
> With this basic support, this can only boot into kernel directly.
> However this is just enough for the petitboot kernel and initradmdisk to
> boot from any possible source. Note this requires reasonably recent guest
> kernel with:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ddf5be5be8735
>=20
> The immediate benefit is much faster booting time which especially
> crucial with fully emulated early CPU bring up environments. Also this
> may come handy when/if GRUB-in-the-userspace sees light of the day.
>=20
> This separates VOF and sPAPR in a hope that VOF bits may be reused by
> other POWERPC boards which do not support pSeries.
>=20
> This is coded in assumption that later on we might be adding support for
> booting from QEMU backends (blockdev is the first candidate) without
> devices/drivers in between as OF1275 does not require that and
> it is quite easy to so.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

I have some comments below, but they're basically all trivial at this
point.  We've missed qemu-6.0 obviously, but I'm hoping I can merge
the next spin to my ppc-for-6.1 tree.

> ---
>=20
> The example command line is:
>=20
> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> -nodefaults \
> -chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \
> -device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \
> -mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \
> -nographic \
> -vga none \
> -enable-kvm \
> -m 2G \
> -machine pseries,x-vof=3Don,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=
=3Dbroken,cap-ccf-assist=3Doff \
> -kernel pbuild/kernel-le-guest/vmlinux \
> -initrd pb/rootfs.cpio.xz \
> -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof-nvram.b=
in,format=3Draw \

Removing the need for a prebuild NVRAM image is something I'd like to
see as a followup.

> -global spapr-nvram.drive=3DDRIVE0 \
> -snapshot \
> -smp 8,threads=3D8 \
> -L /home/aik/t/qemu-ppc64-bios/ \
> -trace events=3Dqemu_trace_events \
> -d guest_errors \
> -chardev socket,id=3DSOCKET0,server,nowait,path=3Dqemu.mon.tmux26 \
> -mon chardev=3DSOCKET0,mode=3Dcontrol
>=20
> ---
> Changes:
> v16:
> * rebased on dwg/ppc-for-6.1
> * s/SpaprVofInterface/VofMachineInterface/
>=20
> v15:
> * bugfix: claimed memory for the VOF itself
> * ditched OF_STACK_ADDR and allocate one instead, now it starts from 0x80=
00
> because it is aligned to its size (no particular reason though)
> * coding style
> * moved nvram.bin up one level
> * ditched bool in the firmware
> * made debugging code conditional using trace_event_get_state() + qemu_lo=
glevel_mask()
> * renamed the CAS interface to SpaprVofInterface
> * added "write" which for now dumps the message and ihandle via
> trace point for early debug assistance
> * commented on when we allocate of_instances in vof_build_dt()
> * store fw_size is SpaprMachine to let spapr_vof_reset() claim it
> * many small fixes from v14's review
>=20
> v14:
> * check for truncates in readstr()
> * ditched a separate vof_reset()
> * spapr->vof is a pointer now, dropped the "on" field
> * removed rtas_base from vof and updated comment why we allow setting it
> * added myself to maintainers
> * updated commit log about blockdev and other possible platforms
> * added a note why new hcall is 0x5
> * no in place endianness convertion in spapr_h_vof_client
> * converted all cpu_physical_memory_read/write to address_space_rw
> * git mv hw/ppc/spapr_vof_client.c hw/ppc/spapr_vof.c
>=20
> v13:
> * rebase on latest ppc-for-6.0
> * shuffled code around to touch spapr.c less
>=20
> v12:
> * split VOF and SPAPR
>=20
> v11:
> * added g_autofree
> * fixed gcc warnings
> * fixed few leaks
> * added nvram image to make "nvram --print-config" not crash;
> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
> is 16K, or it just does not work (empty output from "nvram")
>=20
> v10:
> * now rebased to compile with meson
>=20
> v9:
> * remove special handling of /rtas/rtas-size as now we always add it in Q=
EMU
> * removed leftovers from scsi/grub/stdout/stdin/...
>=20
> v8:
> * no read/write/seek
> * no @dev in instances
> * the machine flag is "x-vof" for now
>=20
> v7:
> * now we have a small firmware which loads at 0 as SLOF and starts from
> 0x100 as SLOF
> * no MBR/ELF/GRUB business in QEMU anymore
> * blockdev is a separate patch
> * networking is a separate patch
>=20
> v6:
> * borrowed a big chunk of commit log introduction from David
> * fixed initial stack pointer (points to the highest address of stack)
> * traces for "interpret" and others
> * disabled  translate_kernel_address() hack so grub can load (work in
> progress)
> * added "milliseconds" for grub
> * fixed "claim" allocator again
> * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for CAS
> * moved the most code possible from spapr.c to spapr_of_client.c, such as
> RTAS, prom entry and FDT build/finalize
> * separated blobs
> * GRUB now proceeds to its console prompt (there are still other issues)
> * parse MBR/GPT to find PReP and load GRUB
>=20
> v5:
> * made instances keep device and chardev pointers
> * removed VIO dependencies
> * print error if RTAS memory is not claimed as it should have been
> * pack FDT as "quiesce"
>=20
> v4:
> * fixed open
> * validate ihandles in "call-method"
>=20
> v3:
> * fixed phandles allocation
> * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
> * fixed size of /chosen/stdout
> * bunch of renames
> * do not create rtas properties at all, let the client deal with it;
> instead setprop allows changing these in the FDT
> * no more packing FDT when bios=3Doff - nobody needs it and getprop does =
not
> work otherwise
> * allow updating initramdisk device tree properties (for zImage)
> * added instances
> * fixed stdout on OF's "write"
> * removed special handling for stdout in OF client, spapr-vty handles it
> instead
>=20
> v2:
> * fixed claim()
> * added "setprop"
> * cleaner client interface and RTAS blobs management
> * boots to petitboot and further to the target system
> * more trace points
> ---
>  pc-bios/vof/Makefile   |  18 +
>  hw/ppc/vof.h           |  37 ++
>  include/hw/ppc/spapr.h |  17 +-
>  pc-bios/vof/vof.h      |  38 ++
>  hw/ppc/spapr.c         |  83 +++-
>  hw/ppc/spapr_hcall.c   |  26 +-
>  hw/ppc/spapr_vof.c     | 148 +++++++
>  hw/ppc/vof.c           | 982 +++++++++++++++++++++++++++++++++++++++++
>  pc-bios/vof/bootmem.c  |  14 +
>  pc-bios/vof/ci.c       |  91 ++++
>  pc-bios/vof/libc.c     |  92 ++++
>  pc-bios/vof/main.c     |  21 +
>  MAINTAINERS            |  11 +
>  hw/ppc/meson.build     |   2 +
>  hw/ppc/trace-events    |  24 +
>  pc-bios/README         |   2 +
>  pc-bios/vof-nvram.bin  | Bin 0 -> 16384 bytes
>  pc-bios/vof.bin        | Bin 0 -> 3128 bytes
>  pc-bios/vof/entry.S    |  51 +++
>  pc-bios/vof/l.lds      |  48 ++
>  20 files changed, 1693 insertions(+), 12 deletions(-)
>  create mode 100644 pc-bios/vof/Makefile
>  create mode 100644 hw/ppc/vof.h
>  create mode 100644 pc-bios/vof/vof.h
>  create mode 100644 hw/ppc/spapr_vof.c
>  create mode 100644 hw/ppc/vof.c
>  create mode 100644 pc-bios/vof/bootmem.c
>  create mode 100644 pc-bios/vof/ci.c
>  create mode 100644 pc-bios/vof/libc.c
>  create mode 100644 pc-bios/vof/main.c
>  create mode 100644 pc-bios/vof-nvram.bin
>  create mode 100755 pc-bios/vof.bin
>  create mode 100644 pc-bios/vof/entry.S
>  create mode 100644 pc-bios/vof/l.lds
>=20
> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> new file mode 100644
> index 000000000000..1451e0551818
> --- /dev/null
> +++ b/pc-bios/vof/Makefile
> @@ -0,0 +1,18 @@
> +all: build-all
> +
> +build-all: vof.bin
> +
> +%.o: %.S
> +	cc -m32 -mbig-endian -c -o $@ $<
> +
> +%.o: %.c
> +	cc -m32 -mbig-endian -c -fno-stack-protector -o $@ $<
> +
> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
> +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
> +
> +%.bin: %.elf
> +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> +
> +clean:
> +	rm -f *.o vof.bin vof.elf *~
> diff --git a/hw/ppc/vof.h b/hw/ppc/vof.h

Qemu conventions meant this should be in include/hw/ppc/vof.h.

> new file mode 100644
> index 000000000000..fc397e4e0c9b
> --- /dev/null
> +++ b/hw/ppc/vof.h
> @@ -0,0 +1,37 @@
> + /* Virtual Open Firmware */
> +#ifndef HW_VOF_H
> +#define HW_VOF_H

Probably worth adding an SPDX-License-Identifier line, just for
completeness.

> +
> +typedef struct Vof {
> +    uint32_t top_addr; /* copied from rma_size */
> +    GArray *claimed; /* array of SpaprOfClaimed */
> +    uint64_t claimed_base;
> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
> +    uint32_t of_instance_last;
> +    char *bootargs;
> +    uint32_t initrd_base; /* Updated in spapr at CAS */
> +    long initrd_size; /* Updated in spapr at CAS */
> +} Vof;
> +
> +uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
> +                         uint32_t *args, unsigned nargs,
> +                         uint32_t *rets, unsigned nrets);
> +uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
> +                   uint64_t align);
> +void vof_cleanup(Vof *vof);
> +void vof_build_dt(void *fdt, Vof *vof, uint32_t top_addr);
> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
> +                               const char *prop, const char *path);
> +
> +#define TYPE_VOF_MACHINE "vof-machine"
> +
> +typedef struct VofMachineClass VofMachineClass;

Probably call this VofMachineInterface rather than VofMachineClass.

> +DECLARE_CLASS_CHECKERS(VofMachineClass, VOF_MACHINE, TYPE_VOF_MACHINE)
> +
> +struct VofMachineClass {
> +    InterfaceClass parent;
> +    target_ulong (*client_architecture_support)(CPUState *cs, target_ulo=
ng vec);
> +    void (*quiesce)(void);
> +};
> +
> +#endif /* HW_VOF_H */
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index bf7cab7a2ce1..3cb121dae707 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -12,6 +12,7 @@
>  #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>  #include "hw/ppc/xics.h"        /* For ICSState */
>  #include "hw/ppc/spapr_tpm_proxy.h"
> +#include "hw/ppc/vof.h"
> =20
>  struct SpaprVioBus;
>  struct SpaprPhbState;
> @@ -180,6 +181,8 @@ struct SpaprMachineState {
>      uint64_t kernel_addr;
>      uint32_t initrd_base;
>      long initrd_size;
> +    long fw_size;
> +    Vof *vof;
>      uint64_t rtc_offset; /* Now used only during incoming migration */
>      struct PPCTimebase tb;
>      bool has_graphics;
> @@ -554,7 +557,9 @@ struct SpaprMachineState {
>  /* Client Architecture support */
>  #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>  #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
> =20
>  /*
>   * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
> @@ -945,4 +950,14 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, =
hwaddr pagesize,
>  void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>  hwaddr spapr_get_rtas_addr(void);
>  bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp);
> +void spapr_vof_quiesce(void);
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> +                                target_ulong opcode, target_ulong *args);
> +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
> +                                                   target_ulong ovec_add=
r);
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
> +
>  #endif /* HW_SPAPR_H */
> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
> new file mode 100644
> index 000000000000..29c80374d6dd
> --- /dev/null
> +++ b/pc-bios/vof/vof.h
> @@ -0,0 +1,38 @@

Especially as some guest code that's a bit more separated from the
qemu core, it's probably worth putting an SPDX line here.

> +#include <stdarg.h>
> +
> +typedef unsigned char uint8_t;
> +typedef unsigned short uint16_t;
> +typedef unsigned long uint32_t;
> +typedef unsigned long long uint64_t;
> +#define NULL (0)
> +#define PROM_ERROR (-1u)
> +typedef unsigned long ihandle;
> +typedef unsigned long phandle;
> +typedef int size_t;
> +typedef void client(void);
> +
> +/* globals */
> +extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware)=
 */
> +
> +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
> +
> +/* libc */
> +int strlen(const char *s);
> +int strcmp(const char *s1, const char *s2);
> +void *memcpy(void *dest, const void *src, size_t n);
> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
> +void *memmove(void *dest, const void *src, size_t n);
> +void *memset(void *dest, int c, size_t size);
> +
> +/* CI wrappers */
> +void ci_panic(const char *str);
> +phandle ci_finddevice(const char *path);
> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int le=
n);
> +
> +/* booting from -kernel */
> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
> +
> +/* Entry points for CI and RTAS */
> +extern uint32_t ci_entry(uint32_t params);
> +extern unsigned long hv_rtas(unsigned long params);
> +extern unsigned int hv_rtas_size;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 73a06df3b1b1..0a41fd893c47 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -103,6 +103,7 @@
>  #define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that =
*/
>  #define FW_MAX_SIZE             0x400000
>  #define FW_FILE_NAME            "slof.bin"
> +#define FW_FILE_NAME_VOF        "vof.bin"
>  #define FW_OVERHEAD             0x2800000
>  #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
> =20
> @@ -1625,22 +1626,41 @@ static void spapr_machine_reset(MachineState *mac=
hine)
> =20
>      fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
> =20
> -    rc =3D fdt_pack(fdt);
> +    if (spapr->vof) {
> +        target_ulong stack_ptr =3D 0;
> =20
> -    /* Should only fail if we've built a corrupted tree */
> -    assert(rc =3D=3D 0);
> +        /*
> +         * Claims initramdisk and stack which changes "available" so
> +         * doing it befofe packing.
> +         */
> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
> =20
> -    /* Load the fdt */
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  stack_ptr, spapr->initrd_base,
> +                                  spapr->initrd_size);
> +        /* We do not pack the FDT as the client may change properties. */
> +    } else {
> +        rc =3D fdt_pack(fdt);
> +        /* Should only fail if we've built a corrupted tree */
> +        assert(rc =3D=3D 0);
> +
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  0, fdt_addr, 0);
> +    }
>      qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
> +
>      g_free(spapr->fdt_blob);
>      spapr->fdt_size =3D fdt_totalsize(fdt);
>      spapr->fdt_initial_size =3D spapr->fdt_size;
>      spapr->fdt_blob =3D fdt;
> =20
>      /* Set up the entry state */
> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_a=
ddr, 0);
>      first_ppc_cpu->env.gpr[5] =3D 0;
> +    /* VOF client does not expect the FDT so we do not load it to the VM=
=2E */
> +    if (!spapr->vof) {
> +        /* Load the fdt */
> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_=
size);
> +    }
> =20
>      spapr->fwnmi_system_reset_addr =3D -1;
>      spapr->fwnmi_machine_check_addr =3D -1;
> @@ -2640,13 +2660,14 @@ static void spapr_machine_init(MachineState *mach=
ine)
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(machine);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> -    const char *bios_name =3D machine->firmware ?: FW_FILE_NAME;
> +    const char *bios_default =3D !!spapr->vof ? FW_FILE_NAME_VOF : FW_FI=
LE_NAME;
> +    const char *bios_name =3D machine->firmware ?: bios_default;
>      const char *kernel_filename =3D machine->kernel_filename;
>      const char *initrd_filename =3D machine->initrd_filename;
>      PCIHostState *phb;
>      int i;
>      MemoryRegion *sysmem =3D get_system_memory();
> -    long load_limit, fw_size;
> +    long load_limit;
>      char *filename;
>      Error *resize_hpt_err =3D NULL;
> =20
> @@ -2963,8 +2984,8 @@ static void spapr_machine_init(MachineState *machin=
e)
>          error_report("Could not find LPAR firmware '%s'", bios_name);
>          exit(1);
>      }
> -    fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
> -    if (fw_size <=3D 0) {
> +    spapr->fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
> +    if (spapr->fw_size <=3D 0) {
>          error_report("Could not load LPAR firmware '%s'", filename);
>          exit(1);
>      }
> @@ -2997,6 +3018,10 @@ static void spapr_machine_init(MachineState *machi=
ne)
>      }
> =20
>      qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
> +
> +    if (spapr->vof) {
> +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client=
);
> +    }
>  }
> =20
>  #define DEFAULT_KVM_TYPE "auto"
> @@ -3187,6 +3212,28 @@ static void spapr_set_resize_hpt(Object *obj, cons=
t char *value, Error **errp)
>      }
>  }
> =20
> +static bool spapr_get_vof(Object *obj, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    return spapr->vof !=3D NULL;
> +}
> +
> +static void spapr_set_vof(Object *obj, bool value, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    if (spapr->vof) {
> +        vof_cleanup(spapr->vof);
> +        g_free(spapr->vof);
> +        spapr->vof =3D NULL;
> +    }
> +    if (!value) {
> +        return;
> +    }
> +    spapr->vof =3D g_malloc0(sizeof(*spapr->vof));
> +}
> +
>  static char *spapr_get_ic_mode(Object *obj, Error **errp)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> @@ -3312,6 +3359,10 @@ static void spapr_instance_init(Object *obj)
>                                      stringify(KERNEL_LOAD_ADDR)
>                                      " for -kernel is the default");
>      spapr->kernel_addr =3D KERNEL_LOAD_ADDR;
> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
> +    object_property_set_description(obj, "x-vof",
> +                                    "Enable Virtual Open Firmware");
> +
>      /* The machine class defines the default interrupt controller mode */
>      spapr->irq =3D smc->irq;
>      object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
> @@ -4470,6 +4521,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
>      XICSFabricClass *xic =3D XICS_FABRIC_CLASS(oc);
>      InterruptStatsProviderClass *ispc =3D INTERRUPT_STATS_PROVIDER_CLASS=
(oc);
>      XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
> +    VofMachineClass *vmc =3D VOF_MACHINE_CLASS(oc);
> =20
>      mc->desc =3D "pSeries Logical Partition (PAPR compliant)";
>      mc->ignore_boot_device_suffixes =3D true;
> @@ -4549,6 +4601,9 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
>      smc->smp_threads_vsmt =3D true;
>      smc->nr_xirqs =3D SPAPR_NR_XIRQS;
>      xfc->match_nvt =3D spapr_match_nvt;
> +
> +    vmc->client_architecture_support =3D spapr_vof_client_architecture_s=
upport;
> +    vmc->quiesce =3D spapr_vof_quiesce;
>  }
> =20
>  static const TypeInfo spapr_machine_info =3D {
> @@ -4568,6 +4623,7 @@ static const TypeInfo spapr_machine_info =3D {
>          { TYPE_XICS_FABRIC },
>          { TYPE_INTERRUPT_STATS_PROVIDER },
>          { TYPE_XIVE_FABRIC },
> +        { TYPE_VOF_MACHINE },
>          { }
>      },
>  };
> @@ -5036,9 +5092,16 @@ static void spapr_machine_2_1_class_options(Machin=
eClass *mc)
>  }
>  DEFINE_SPAPR_MACHINE(2_1, "2.1", false);
> =20
> +static const TypeInfo vof_machine_info =3D {
> +    .name =3D TYPE_VOF_MACHINE,
> +    .parent =3D TYPE_INTERFACE,
> +    .class_size =3D sizeof(VofMachineClass),
> +};

I think this belongs in vof.c rather than spapr.c

> +
>  static void spapr_machine_register_types(void)
>  {
>      type_register_static(&spapr_machine_info);
> +    type_register_static(&vof_machine_info);
>  }
> =20
>  type_init(spapr_machine_register_types)
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c26..0cdf90af6afb 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1806,7 +1806,13 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>          spapr_setup_hpt(spapr);
>      }
> =20
> -    fdt =3D spapr_build_fdt(spapr, false, fdt_bufsize);
> +    if (spapr->vof && spapr->vof->initrd_base && spapr->vof->initrd_size=
) {
> +        /* Update initramdisk location so the right area gets reserved b=
elow */
> +        spapr->initrd_base =3D spapr->vof->initrd_base;
> +        spapr->initrd_size =3D spapr->vof->initrd_size;
> +    }
> +
> +    fdt =3D spapr_build_fdt(spapr, spapr->vof !=3D NULL, fdt_bufsize);
> =20
>      g_free(spapr->fdt_blob);
>      spapr->fdt_size =3D fdt_totalsize(fdt);
> @@ -1850,6 +1856,24 @@ static target_ulong h_client_architecture_support(=
PowerPCCPU *cpu,
>      return ret;
>  }
> =20
> +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
> +                                                  target_ulong ovec_addr)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> +
> +    target_ulong ret =3D do_client_architecture_support(POWERPC_CPU(cs),=
 spapr,
> +                                                      ovec_addr, FDT_MAX=
_SIZE);
> +
> +    /*
> +     * This adds stdout and generates phandles for boottime and CAS FDTs.
> +     * It is alright to update the FDT here as do_client_architecture_su=
pport()
> +     * does not pack it.
> +     */
> +    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
> +
> +    return ret;
> +}
> +
>  static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
>                                                SpaprMachineState *spapr,
>                                                target_ulong opcode,
> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> new file mode 100644
> index 000000000000..8a58364490f4
> --- /dev/null
> +++ b/hw/ppc/spapr_vof.c

SPDX.

> @@ -0,0 +1,148 @@
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include <sys/ioctl.h>
> +#include "qapi/error.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/fdt.h"
> +#include "sysemu/sysemu.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000
> +
> +/* Defined as Big Endian */
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +} QEMU_PACKED;
> +
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> +                                target_ulong opcode, target_ulong *_args)
> +{
> +    target_ulong args_real =3D ppc64_phys_to_real(_args[0]);
> +    struct prom_args args_be;
> +    uint32_t args[ARRAY_SIZE(args_be.args)];
> +    uint32_t rets[ARRAY_SIZE(args_be.args)] =3D { 0 }, ret;
> +    char service[64];
> +    unsigned nargs, nret, i;
> +
> +    if (address_space_rw(&address_space_memory, args_real,
> +                         MEMTXATTRS_UNSPECIFIED, &args_be, sizeof(args_b=
e),
> +                         false) !=3D MEMTX_OK) {
> +        return H_HARDWARE;

Probably H_PARAMETER rather than H_HARDWARE - the most likely cause
here is that a bad address was specified for the arguments.

> +    }
> +    nargs =3D be32_to_cpu(args_be.nargs);
> +    if (nargs >=3D ARRAY_SIZE(args_be.args)) {
> +        return H_PARAMETER;
> +    }
> +
> +    if (address_space_rw(&address_space_memory, be32_to_cpu(args_be.serv=
ice),
> +                         MEMTXATTRS_UNSPECIFIED, service, sizeof(service=
),
> +                         false) !=3D MEMTX_OK) {
> +        return H_HARDWARE;

Likewise here and the rest.

> +    }
> +    if (strnlen(service, sizeof(service)) =3D=3D sizeof(service)) {
> +        /* Too long service name */
> +        return H_PARAMETER;
> +    }
> +
> +    for (i =3D 0; i < nargs; ++i) {
> +        args[i] =3D be32_to_cpu(args_be.args[i]);
> +    }
> +
> +    nret =3D be32_to_cpu(args_be.nret);
> +    ret =3D vof_client_call(spapr->fdt_blob, spapr->vof, service,
> +                          args, nargs, rets, nret);
> +    if (!nret) {
> +        return H_SUCCESS;
> +    }
> +
> +    args_be.args[nargs] =3D cpu_to_be32(ret);
> +    for (i =3D 1; i < nret; ++i) {
> +        args_be.args[nargs + i] =3D cpu_to_be32(rets[i - 1]);
> +    }
> +
> +    if (address_space_rw(&address_space_memory,
> +                         args_real + offsetof(struct prom_args, args[nar=
gs]),
> +                         MEMTXATTRS_UNSPECIFIED, args_be.args + nargs,
> +                         sizeof(args_be.args[0]) * nret, true) !=3D MEMT=
X_OK) {
> +        return H_HARDWARE;
> +    }
> +
> +    return H_SUCCESS;
> +}
> +
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
> +{
> +    char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> +
> +    vof_build_dt(fdt, spapr->vof, spapr->rma_size);
> +
> +    /*
> +     * SLOF-less setup requires an open instance of stdout for early
> +     * kernel printk. By now all phandles are settled so we can open
> +     * the default serial console.
> +     */
> +    if (stdout_path) {
> +        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdout",
> +                                   stdout_path));
> +    }
> +}
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp)
> +{
> +    Vof *vof =3D spapr->vof;
> +
> +    vof_cleanup(vof);
> +
> +    spapr_vof_client_dt_finalize(spapr, fdt);
> +
> +    if (vof_claim(spapr->fdt_blob, vof, 0, spapr->fw_size, 0) =3D=3D -1)=
 {
> +        error_setg(errp, "Memory for firmware is in use");

This could probably be an assert, yes?  IIUC this the very first
claim, so if this fails then we've placed things incorrectly in the
first place, so it's a code error rather than a user error.

> +        return;
> +    }
> +
> +    *stack_ptr =3D vof_claim(spapr->fdt_blob, vof, 0, OF_STACK_SIZE,
> +                           OF_STACK_SIZE);
> +    if (*stack_ptr =3D=3D -1) {

Likewise here.

> +        error_setg(errp, "Memory allocation for stack failed");
> +        return;
> +    }
> +    /*
> +     * Stack grows downwards and we also reserve here space for
> +     * the minimum stack frame.
> +     */
> +    *stack_ptr +=3D OF_STACK_SIZE - 0x20;
> +
> +    if (spapr->kernel_size &&
> +        vof_claim(spapr->fdt_blob, vof, spapr->kernel_addr, spapr->kerne=
l_size,
> +                  0) =3D=3D -1) {
> +        error_setg(errp, "Memory for kernel is in use");
> +        return;
> +    }
> +
> +    if (spapr->initrd_size &&
> +        vof_claim(spapr->fdt_blob, vof, spapr->initrd_base, spapr->initr=
d_size,
> +                  0) =3D=3D -1) {
> +        error_setg(errp, "Memory for initramdisk is in use");
> +        return;
> +    }
> +
> +    /*
> +     * We skip writing FDT as nothing expects it; OF client interface is
> +     * going to be used for reading the device tree.
> +     */
> +}
> +
> +void spapr_vof_quiesce(void)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> +
> +    spapr->fdt_size =3D fdt_totalsize(spapr->fdt_blob);
> +    spapr->fdt_initial_size =3D spapr->fdt_size;

I suspect this doesn't matter.  AFAICT the only use of
fdt_initial_size is for the H_UPDATE_DT call, which shouldn't be used
with VOF.  But, that can be a later cleanup.

> +}
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> new file mode 100644
> index 000000000000..86e4c20b67e7
> --- /dev/null
> +++ b/hw/ppc/vof.c
> @@ -0,0 +1,982 @@
> +/*
> + * QEMU PowerPC Virtual Open Firmware.
> + *
> + * This implements client interface from OpenFirmware IEEE1275 on the QE=
MU
> + * side to leave only a very basic firmware in the VM.
> + *
> + * Copyright (c) 2020 IBM Corporation.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> + * of this software and associated documentation files (the "Software"),=
 to deal
> + * in the Software without restriction, including without limitation the=
 rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.

Could probably replace all this boilerplate with an SPDX line.

> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qapi/error.h"
> +#include <sys/ioctl.h>
> +#include "exec/ram_addr.h"
> +#include "exec/address-spaces.h"
> +#include "qemu/timer.h"
> +#include "qemu/range.h"
> +#include "hw/ppc/vof.h"
> +#include "hw/ppc/fdt.h"
> +#include "sysemu/runstate.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +#include <libfdt.h>
> +
> +/*
> + * OF 1275 "nextprop" description suggests is it 32 bytes max but
> + * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars =
long.

Yeah, maximum property name length seems to have exceeded 32 in
practice for a long time, despite 1275.

> + */
> +#define OF_PROPNAME_LEN_MAX 64
> +
> +#define VOF_MAX_PATH        256
> +#define VOF_MAX_PROPLEN     2048
> +#define VOF_MAX_METHODLEN   256
> +#define VOF_MAX_FORTHCODE   256
> +#define VOF_VTY_BUF_SIZE    256
> +
> +typedef struct {
> +    uint64_t start;
> +    uint64_t size;
> +} OfClaimed;
> +
> +typedef struct {
> +    char *path; /* the path used to open the instance */
> +    uint32_t phandle;
> +} OfInstance;
> +
> +#define VOF_MEM_READ(pa, buf, size) \
> +    address_space_read_full(&address_space_memory, \
> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> +#define VOF_MEM_WRITE(pa, buf, size) \
> +    address_space_write(&address_space_memory, \
> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> +
> +static int readstr(hwaddr pa, char *buf, int size)
> +{
> +    if (VOF_MEM_READ(pa, buf, size) !=3D MEMTX_OK) {
> +        return -1;
> +    }
> +    if (strnlen(buf, size) =3D=3D size) {
> +        buf[size - 1] =3D '\0';
> +        trace_vof_error_str_truncated(buf, size);
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
> +                       const char *s1, unsigned nargscheck, unsigned nre=
tcheck)
> +{
> +    if (strcmp(s, s1)) {
> +        return false;
> +    }
> +    if ((nargscheck && (nargs !=3D nargscheck)) ||
> +        (nretcheck && (nret !=3D nretcheck))) {
> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void prop_format(char *tval, int tlen, const void *prop, int len)
> +{
> +    int i;
> +    const unsigned char *c;
> +    char *t;
> +    const char bin[] =3D "...";
> +
> +    for (i =3D 0, c =3D prop; i < len; ++i, ++c) {
> +        if (*c =3D=3D '\0' && i =3D=3D len - 1) {
> +            strncpy(tval, prop, tlen - 1);
> +            return;
> +        }
> +        if (*c < 0x20 || *c >=3D 0x80) {
> +            break;
> +        }
> +    }
> +
> +    for (i =3D 0, c =3D prop, t =3D tval; i < len; ++i, ++c) {
> +        if (t >=3D tval + tlen - sizeof(bin) - 1 - 2 - 1) {
> +            strcpy(t, bin);
> +            return;
> +        }
> +        if (i && i % 4 =3D=3D 0 && i !=3D len - 1) {
> +            strcat(t, " ");
> +            ++t;
> +        }
> +        t +=3D sprintf(t, "%02X", *c & 0xFF);
> +    }
> +}
> +
> +static int get_path(const void *fdt, int offset, char *buf, int len)
> +{
> +    int ret;
> +
> +    ret =3D fdt_get_path(fdt, offset, buf, len - 1);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    buf[len - 1] =3D 0;
> +
> +    return strlen(buf) + 1;
> +}
> +
> +static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, int =
len)
> +{
> +    int ret;
> +
> +    ret =3D fdt_node_offset_by_phandle(fdt, ph);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    return get_path(fdt, ret, buf, len);
> +}
> +
> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
> +{
> +    char fullnode[1024];
> +    uint32_t ret =3D -1;
> +    int offset;
> +
> +    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
> +        return (uint32_t) ret;
> +    }
> +
> +    offset =3D fdt_path_offset(fdt, fullnode);
> +    if (offset >=3D 0) {
> +        ret =3D fdt_get_phandle(fdt, offset);
> +    }
> +    trace_vof_finddevice(fullnode, ret);
> +    return (uint32_t) ret;
> +}
> +
> +static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t p=
name,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret =3D 0;
> +    int proplen =3D 0;
> +    const void *prop;
> +    char trval[64] =3D "";
> +    int nodeoff =3D fdt_node_offset_by_phandle(fdt, nodeph);
> +    bool write0 =3D false;
> +
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        return -1;
> +    }
> +    if (strcmp(propname, "name") =3D=3D 0) {
> +        prop =3D fdt_get_name(fdt, nodeoff, &proplen);
> +        if (prop) {
> +            const void *unit =3D memchr(prop, '@', proplen);
> +
> +            if (unit) {
> +                proplen =3D unit - prop;
> +                write0 =3D true;
> +            }
> +        }
> +        proplen +=3D 1;
> +    } else {
> +        prop =3D fdt_getprop(fdt, nodeoff, propname, &proplen);
> +    }
> +
> +    if (prop) {
> +        int cb =3D MIN(proplen, vallen);
> +        const char zero =3D 0;
> +
> +        if (VOF_MEM_WRITE(valaddr, prop, cb) !=3D MEMTX_OK ||
> +            /* if that was "name" with a unit address, overwrite '@' wit=
h '0' */
> +            (write0 &&
> +             cb =3D=3D proplen &&
> +             VOF_MEM_WRITE(valaddr + cb - 1, &zero, 1) !=3D MEMTX_OK)) {
> +            ret =3D -1;
> +        } else {
> +            /*
> +             * OF1275 says:
> +             * "Size is either the actual size of the property, or -1 if=
 name
> +             * does not exist", hence returning proplen instead of cb.
> +             */
> +            ret =3D proplen;
> +            /* Do not format a value if tracepoint is silent, for perfor=
mance */
> +            if (trace_event_get_state(TRACE_VOF_GETPROP) &&
> +                qemu_loglevel_mask(LOG_TRACE)) {
> +                prop_format(trval, sizeof(trval), prop, ret);
> +            }
> +        }
> +    } else {
> +        ret =3D -1;
> +    }
> +    trace_vof_getprop(nodeph, propname, ret, trval);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_getproplen(const void *fdt, uint32_t nodeph, uint32_=
t pname)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret =3D 0;
> +    int proplen =3D 0;
> +    const void *prop;
> +    int nodeoff =3D fdt_node_offset_by_phandle(fdt, nodeph);
> +
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        return -1;
> +    }
> +    if (strcmp(propname, "name") =3D=3D 0) {
> +        prop =3D fdt_get_name(fdt, nodeoff, &proplen);
> +        if (prop) {
> +            const void *unit =3D memchr(prop, '@', proplen);
> +
> +            if (unit) {
> +                proplen =3D unit - prop;
> +            }
> +        }
> +        proplen +=3D 1;
> +    } else {
> +        prop =3D fdt_getprop(fdt, nodeoff, propname, &proplen);
> +    }
> +
> +    if (prop) {
> +        ret =3D proplen;
> +    } else {
> +        ret =3D -1;
> +    }
> +    trace_vof_getproplen(nodeph, propname, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_setprop(void *fdt, Vof *vof,
> +                            uint32_t nodeph, uint32_t pname,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret =3D -1;
> +    int offset;
> +    char trval[64] =3D "";
> +    char nodepath[VOF_MAX_PATH] =3D "";
> +    g_autofree char *data =3D NULL;
> +
> +    if (vallen > VOF_MAX_PROPLEN) {
> +        goto trace_exit;
> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        goto trace_exit;
> +    }
> +    offset =3D fdt_node_offset_by_phandle(fdt, nodeph);
> +    if (offset < 0) {
> +        goto trace_exit;
> +    }
> +    ret =3D get_path(fdt, offset, nodepath, sizeof(nodepath));
> +    if (ret <=3D 0) {
> +        goto trace_exit;
> +    }
> +
> +    ret =3D -1;
> +    /*
> +     * We only allow changing properties which we know how to update in =
QEMU
> +     * OR
> +     * the ones which we know that they need to survive during "quiesce".
> +     */
> +    if (strcmp(nodepath, "/rtas") =3D=3D 0) {
> +        if (strcmp(propname, "linux,rtas-base") =3D=3D 0 ||
> +             strcmp(propname, "linux,rtas-entry") =3D=3D 0) {
> +            /* These need to survive quiesce so let them store in the FD=
T */
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else if (strcmp(nodepath, "/chosen") =3D=3D 0) {
> +        if (strcmp(propname, "bootargs") =3D=3D 0) {
> +            char val[1024];
> +
> +            if (readstr(valaddr, val, sizeof(val))) {
> +                goto trace_exit;
> +            }
> +            g_free(vof->bootargs);
> +            vof->bootargs =3D g_strdup(val);
> +            vallen =3D strlen(vof->bootargs) + 1;
> +        } else  if (strcmp(propname, "linux,initrd-start") =3D=3D 0) {
> +            if (vallen =3D=3D sizeof(uint32_t)) {
> +                vof->initrd_base =3D ldl_be_phys(first_cpu->as, valaddr);
> +            } else if (vallen =3D=3D sizeof(uint64_t)) {
> +                vof->initrd_base =3D ldq_be_phys(first_cpu->as, valaddr);
> +            } else {
> +                goto trace_exit;
> +            }
> +        } else if (strcmp(propname, "linux,initrd-end") =3D=3D 0) {
> +            if (vallen =3D=3D sizeof(uint32_t)) {
> +                vof->initrd_size =3D ldl_be_phys(first_cpu->as, valaddr)=
 -
> +                    vof->initrd_base;
> +            } else if (vallen =3D=3D sizeof(uint64_t)) {
> +                vof->initrd_size =3D ldq_be_phys(first_cpu->as, valaddr)=
 -
> +                    vof->initrd_base;
> +            } else {
> +                goto trace_exit;
> +            }
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else {
> +        goto trace_exit;
> +    }
> +
> +    data =3D g_malloc0(vallen);
> +    if ((VOF_MEM_READ(valaddr, data, vallen) =3D=3D MEMTX_OK) &&
> +        !fdt_setprop(fdt, offset, propname, data, vallen)) {
> +        ret =3D vallen;
> +        if (trace_event_get_state(TRACE_VOF_SETPROP) &&
> +            qemu_loglevel_mask(LOG_TRACE)) {
> +            prop_format(trval, sizeof(trval), data, ret);
> +        }
> +    }
> +
> +trace_exit:
> +    trace_vof_setprop(nodeph, propname, trval, vallen, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
> +                             uint32_t prevaddr, uint32_t nameaddr)
> +{
> +    int offset, nodeoff =3D fdt_node_offset_by_phandle(fdt, phandle);
> +    char prev[OF_PROPNAME_LEN_MAX + 1];
> +    const char *tmp;
> +
> +    if (readstr(prevaddr, prev, sizeof(prev))) {
> +        return -1;
> +    }
> +
> +    fdt_for_each_property_offset(offset, fdt, nodeoff) {
> +        if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
> +            return 0;
> +        }
> +        if (prev[0] =3D=3D '\0' || strcmp(prev, tmp) =3D=3D 0) {
> +            if (prev[0] !=3D '\0') {
> +                offset =3D fdt_next_property_offset(fdt, offset);
> +                if (offset < 0) {
> +                    return 0;
> +                }
> +            }
> +            if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
> +                return 0;
> +            }
> +
> +            if (VOF_MEM_WRITE(nameaddr, tmp, strlen(tmp) + 1) !=3D MEMTX=
_OK) {
> +                return -1;
> +            }
> +            return 1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static uint32_t vof_peer(const void *fdt, uint32_t phandle)
> +{
> +    int ret;
> +
> +    if (phandle =3D=3D 0) {
> +        ret =3D fdt_path_offset(fdt, "/");
> +    } else {
> +        ret =3D fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, ph=
andle));
> +    }
> +
> +    if (ret < 0) {
> +        ret =3D 0;
> +    } else {
> +        ret =3D fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_child(const void *fdt, uint32_t phandle)
> +{
> +    int ret =3D fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, p=
handle));
> +
> +    if (ret < 0) {
> +        ret =3D 0;
> +    } else {
> +        ret =3D fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_parent(const void *fdt, uint32_t phandle)
> +{
> +    int ret =3D fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, p=
handle));
> +
> +    if (ret < 0) {
> +        ret =3D 0;
> +    } else {
> +        ret =3D fdt_get_phandle(fdt, ret);
> +    }
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_do_open(void *fdt, Vof *vof, const char *path)
> +{
> +    int offset;
> +    uint32_t ret =3D 0;
> +    OfInstance *inst =3D NULL;
> +
> +    if (vof->of_instance_last =3D=3D 0xFFFFFFFF) {
> +        /* We do not recycle ihandles yet */
> +        goto trace_exit;
> +    }
> +
> +    offset =3D fdt_path_offset(fdt, path);
> +    if (offset < 0) {
> +        trace_vof_error_unknown_path(path);
> +        goto trace_exit;
> +    }
> +
> +    inst =3D g_new0(OfInstance, 1);
> +    inst->phandle =3D fdt_get_phandle(fdt, offset);
> +    g_assert(inst->phandle);
> +    ++vof->of_instance_last;
> +
> +    inst->path =3D g_strdup(path);
> +    g_hash_table_insert(vof->of_instances,
> +                        GINT_TO_POINTER(vof->of_instance_last),
> +                        inst);
> +    ret =3D vof->of_instance_last;
> +
> +trace_exit:
> +    trace_vof_open(path, inst ? inst->phandle : 0, ret);
> +
> +    return ret;
> +}
> +
> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
> +                               const char *prop, const char *path)
> +{
> +    int node =3D fdt_path_offset(fdt, nodename);
> +    uint32_t inst =3D vof_do_open(fdt, vof, path);
> +
> +    return fdt_setprop_cell(fdt, node, prop, inst);
> +}
> +
> +static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
> +{
> +    char path[VOF_MAX_PATH];
> +
> +    if (readstr(pathaddr, path, sizeof(path))) {
> +        return -1;
> +    }
> +
> +    return vof_do_open(fdt, vof, path);
> +}
> +
> +static void vof_close(Vof *vof, uint32_t ihandle)
> +{
> +    if (!g_hash_table_remove(vof->of_instances, GINT_TO_POINTER(ihandle)=
)) {
> +        trace_vof_error_unknown_ihandle_close(ihandle);
> +    }
> +}
> +
> +static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
> +{
> +    gpointer instp =3D g_hash_table_lookup(vof->of_instances,
> +                                         GINT_TO_POINTER(ihandle));
> +    uint32_t ret =3D -1;
> +
> +    if (instp) {
> +        ret =3D ((OfInstance *)instp)->phandle;
> +    }
> +    trace_vof_instance_to_package(ihandle, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
> +                                    uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret =3D -1;
> +    char tmp[VOF_MAX_PATH] =3D "";
> +
> +    ret =3D phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> +    if (ret > 0) {
> +        if (VOF_MEM_WRITE(buf, tmp, ret) !=3D MEMTX_OK) {
> +            ret =3D -1;
> +        }
> +    }
> +
> +    trace_vof_package_to_path(phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihand=
le,
> +                                     uint32_t buf, uint32_t len)
> +{
> +    uint32_t ret =3D -1;
> +    uint32_t phandle =3D vof_instance_to_package(vof, ihandle);
> +    char tmp[VOF_MAX_PATH] =3D "";
> +
> +    if (phandle !=3D -1) {
> +        ret =3D phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> +        if (ret > 0) {
> +            if (VOF_MEM_WRITE(buf, tmp, ret) !=3D MEMTX_OK) {
> +                ret =3D -1;
> +            }
> +        }
> +    }
> +    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
> +                          uint32_t len)
> +{
> +    char tmp[VOF_VTY_BUF_SIZE];
> +    int toread, toprint, cb =3D MIN(len, sizeof(tmp) - 1);
> +    OfInstance *inst =3D (OfInstance *)
> +        g_hash_table_lookup(vof->of_instances, GINT_TO_POINTER(ihandle));
> +
> +    if (!inst) {
> +        trace_vof_error_write(ihandle);
> +        return -1;
> +    }
> +    while (cb > 0) {
> +        toread =3D MIN(cb, sizeof(tmp) - 1);
> +
> +        cpu_physical_memory_read(buf, tmp, toread);
> +
> +        toprint =3D toread;
> +
> +        if (trace_event_get_state(TRACE_VOF_WRITE) &&
> +            qemu_loglevel_mask(LOG_TRACE)) {
> +            char *c;
> +
> +            for (c =3D tmp; c < tmp + toprint; ++c) {
> +                if (*c < 0x20 || *c >=3D 0x7f) {
> +                    *c =3D '~';
> +                }
> +            }
> +            tmp[toprint] =3D '\0';
> +            trace_vof_write(ihandle, toprint, tmp);
> +        }
> +
> +        buf +=3D toprint;
> +        cb -=3D toprint;
> +    }
> +
> +    return len;
> +}
> +
> +static void vof_claimed_dump(GArray *claimed)
> +{
> +    int i;
> +    OfClaimed c;
> +
> +    if (trace_event_get_state(TRACE_VOF_CLAIMED) &&
> +        qemu_loglevel_mask(LOG_TRACE)) {
> +
> +        for (i =3D 0; i < claimed->len; ++i) {
> +            c =3D g_array_index(claimed, OfClaimed, i);
> +            trace_vof_claimed(c.start, c.start + c.size, c.size);
> +        }
> +    }
> +}
> +
> +static bool vof_claim_avail(GArray *claimed, uint64_t virt, uint64_t siz=
e)
> +{
> +    int i;
> +    OfClaimed c;
> +
> +    for (i =3D 0; i < claimed->len; ++i) {
> +        c =3D g_array_index(claimed, OfClaimed, i);
> +        if (ranges_overlap(c.start, c.size, virt, size)) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
> +static void vof_claim_add(GArray *claimed, uint64_t virt, uint64_t size)
> +{
> +    OfClaimed newclaim;
> +
> +    newclaim.start =3D virt;
> +    newclaim.size =3D size;
> +    g_array_append_val(claimed, newclaim);
> +}
> +
> +static gint of_claimed_compare_func(gconstpointer a, gconstpointer b)
> +{
> +    return ((OfClaimed *)a)->start - ((OfClaimed *)b)->start;
> +}
> +
> +static void vof_dt_memory_available(void *fdt, GArray *claimed, uint64_t=
 base)
> +{
> +    int i, n, offset, proplen =3D 0;
> +    uint64_t *mem0_reg;
> +    g_autofree struct { uint64_t start, size; } *avail =3D NULL;
> +
> +    if (!fdt || !claimed) {
> +        return;
> +    }
> +
> +    offset =3D fdt_path_offset(fdt, "/memory@0");
> +    _FDT(offset);
> +
> +    mem0_reg =3D (uint64_t *) fdt_getprop(fdt, offset, "reg", &proplen);
> +    if (!mem0_reg || proplen !=3D 2 * sizeof(uint64_t)) {
> +        return;
> +    }
> +
> +    g_array_sort(claimed, of_claimed_compare_func);
> +    vof_claimed_dump(claimed);
> +
> +    avail =3D g_malloc0(sizeof(avail[0]) * claimed->len);
> +    for (i =3D 0, n =3D 0; i < claimed->len; ++i) {
> +        OfClaimed c =3D g_array_index(claimed, OfClaimed, i);
> +        uint64_t size;
> +
> +        if (i < claimed->len - 1) {
> +            OfClaimed cn =3D g_array_index(claimed, OfClaimed, i + 1);
> +
> +            size =3D cn.start - avail[n].start;
> +        } else {
> +            size =3D be64_to_cpu(mem0_reg[1]) - avail[n].start;
> +        }
> +        avail[n].start =3D cpu_to_be64(c.start + c.size);
> +        avail[n].size =3D cpu_to_be64(size);
> +
> +        if (size) {
> +            trace_vof_avail(c.start + c.size, c.start + c.size + size, s=
ize);
> +            ++n;
> +        }
> +    }
> +    _FDT((fdt_setprop(fdt, offset, "available", avail, sizeof(avail[0]) =
* n)));
> +}
> +
> +/*
> + * OF1275:
> + * "Allocates size bytes of memory. If align is zero, the allocated range
> + * begins at the virtual address virt. Otherwise, an aligned address is
> + * automatically chosen and the input argument virt is ignored".
> + *
> + * In other words, exactly one of @virt and @align is non-zero.
> + */
> +uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
> +                   uint64_t align)
> +{
> +    uint64_t ret;
> +
> +    if (size =3D=3D 0) {
> +        ret =3D -1;
> +    } else if (align =3D=3D 0) {
> +        if (!vof_claim_avail(vof->claimed, virt, size)) {
> +            ret =3D -1;
> +        } else {
> +            ret =3D virt;
> +        }
> +    } else {
> +        vof->claimed_base =3D QEMU_ALIGN_UP(vof->claimed_base, align);
> +        while (1) {
> +            if (vof->claimed_base >=3D vof->top_addr) {
> +                error_report("Out of RMA memory for the OF client");
> +                return -1;
> +            }
> +            if (vof_claim_avail(vof->claimed, vof->claimed_base, size)) {
> +                break;
> +            }
> +            vof->claimed_base +=3D size;
> +        }
> +        ret =3D vof->claimed_base;
> +    }
> +
> +    if (ret !=3D -1) {
> +        vof->claimed_base =3D MAX(vof->claimed_base, ret + size);
> +        vof_claim_add(vof->claimed, ret, size);
> +        /* The client reads "/memory@0/available" to know where it can c=
laim */
> +        vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
> +    }
> +    trace_vof_claim(virt, size, align, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_release(void *fdt, Vof *vof, uint64_t virt, uint64_t=
 size)
> +{
> +    uint32_t ret =3D -1;
> +    int i;
> +    GArray *claimed =3D vof->claimed;
> +    OfClaimed c;
> +
> +    for (i =3D 0; i < claimed->len; ++i) {
> +        c =3D g_array_index(claimed, OfClaimed, i);
> +        if (c.start =3D=3D virt && c.size =3D=3D size) {
> +            g_array_remove_index(claimed, i);
> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base=
);
> +            ret =3D 0;
> +            break;
> +        }
> +    }
> +
> +    trace_vof_release(virt, size, ret);
> +
> +    return ret;
> +}
> +
> +static void vof_instantiate_rtas(Error **errp)
> +{
> +    error_setg(errp, "The firmware should have instantiated RTAS");
> +}
> +
> +static uint32_t vof_call_method(Vof *vof, uint32_t methodaddr, uint32_t =
ihandle,
> +                                uint32_t param1, uint32_t param2,
> +                                uint32_t param3, uint32_t param4,
> +                                uint32_t *ret2)
> +{
> +    uint32_t ret =3D -1;
> +    char method[VOF_MAX_METHODLEN] =3D "";
> +    OfInstance *inst;
> +
> +    if (!ihandle) {
> +        goto trace_exit;
> +    }
> +
> +    inst =3D (OfInstance *) g_hash_table_lookup(vof->of_instances,
> +                                              GINT_TO_POINTER(ihandle));
> +    if (!inst) {
> +        goto trace_exit;
> +    }
> +
> +    if (readstr(methodaddr, method, sizeof(method))) {
> +        goto trace_exit;
> +    }
> +
> +    if (strcmp(inst->path, "/") =3D=3D 0) {
> +        if (strcmp(method, "ibm,client-architecture-support") =3D=3D 0) {
> +            Object *vmo =3D object_dynamic_cast(qdev_get_machine(),
> +                                              TYPE_VOF_MACHINE);
> +
> +            if (vmo) {
> +                VofMachineClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> +
> +                ret =3D vmc->client_architecture_support(first_cpu, para=
m1);
> +            }
> +
> +            *ret2 =3D 0;
> +        }
> +    } else if (strcmp(inst->path, "/rtas") =3D=3D 0) {
> +        if (strcmp(method, "instantiate-rtas") =3D=3D 0) {
> +            vof_instantiate_rtas(&error_fatal);
> +            ret =3D 0;
> +            *ret2 =3D param1; /* rtas-base */
> +        }
> +    } else {
> +        trace_vof_error_unknown_method(method);
> +    }
> +
> +trace_exit:
> +    trace_vof_method(ihandle, method, param1, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_call_interpret(uint32_t cmdaddr, uint32_t param1,
> +                                   uint32_t param2, uint32_t *ret2)
> +{
> +    uint32_t ret =3D -1;
> +    char cmd[VOF_MAX_FORTHCODE] =3D "";
> +
> +    /* No interpret implemented */
> +    readstr(cmdaddr, cmd, sizeof(cmd));
> +    trace_vof_interpret(cmd, param1, param2, ret, *ret2);
> +
> +    return ret;
> +}
> +
> +static void vof_quiesce(void *fdt, Vof *vof)
> +{
> +    Object *vmo =3D object_dynamic_cast(qdev_get_machine(), TYPE_VOF_MAC=
HINE);
> +    /*
> +     * After "quiesce", no change should be made to the FDT and
> +     * packing FDT ensures this.
> +     */
> +    int rc =3D fdt_pack(fdt);
> +
> +    assert(rc =3D=3D 0);
> +
> +    if (vmo) {
> +        VofMachineClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> +
> +        vmc->quiesce();
> +    }
> +
> +    vof_claimed_dump(vof->claimed);
> +}
> +
> +uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
> +                         uint32_t *args, unsigned nargs,
> +                         uint32_t *rets, unsigned nrets)
> +{
> +    uint32_t ret =3D 0;
> +
> +    /* @nrets includes the value which this function returns */
> +#define cmpserv(s, a, r) \
> +    cmpservice(service, nargs, nrets, (s), (a), (r))
> +
> +    if (cmpserv("finddevice", 1, 1)) {
> +        ret =3D vof_finddevice(fdt, args[0]);
> +    } else if (cmpserv("getprop", 4, 1)) {
> +        ret =3D vof_getprop(fdt, args[0], args[1], args[2], args[3]);
> +    } else if (cmpserv("getproplen", 2, 1)) {
> +        ret =3D vof_getproplen(fdt, args[0], args[1]);
> +    } else if (cmpserv("setprop", 4, 1)) {
> +        ret =3D vof_setprop(fdt, vof, args[0], args[1], args[2], args[3]=
);
> +    } else if (cmpserv("nextprop", 3, 1)) {
> +        ret =3D vof_nextprop(fdt, args[0], args[1], args[2]);
> +    } else if (cmpserv("peer", 1, 1)) {
> +        ret =3D vof_peer(fdt, args[0]);
> +    } else if (cmpserv("child", 1, 1)) {
> +        ret =3D vof_child(fdt, args[0]);
> +    } else if (cmpserv("parent", 1, 1)) {
> +        ret =3D vof_parent(fdt, args[0]);
> +    } else if (cmpserv("open", 1, 1)) {
> +        ret =3D vof_open(fdt, vof, args[0]);
> +    } else if (cmpserv("close", 1, 0)) {
> +        vof_close(vof, args[0]);
> +    } else if (cmpserv("instance-to-package", 1, 1)) {
> +        ret =3D vof_instance_to_package(vof, args[0]);
> +    } else if (cmpserv("package-to-path", 3, 1)) {
> +        ret =3D vof_package_to_path(fdt, args[0], args[1], args[2]);
> +    } else if (cmpserv("instance-to-path", 3, 1)) {
> +        ret =3D vof_instance_to_path(fdt, vof, args[0], args[1], args[2]=
);
> +    } else if (cmpserv("write", 3, 1)) {
> +        ret =3D vof_write(vof, args[0], args[1], args[2]);
> +    } else if (cmpserv("claim", 3, 1)) {
> +        ret =3D vof_claim(fdt, vof, args[0], args[1], args[2]);
> +    } else if (cmpserv("release", 2, 0)) {
> +        ret =3D vof_release(fdt, vof, args[0], args[1]);
> +    } else if (cmpserv("call-method", 0, 0)) {
> +        ret =3D vof_call_method(vof, args[0], args[1], args[2], args[3],=
 args[4],
> +                              args[5], rets);
> +    } else if (cmpserv("interpret", 0, 0)) {
> +        ret =3D vof_call_interpret(args[0], args[1], args[2], rets);
> +    } else if (cmpserv("milliseconds", 0, 1)) {
> +        ret =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    } else if (cmpserv("quiesce", 0, 0)) {
> +        vof_quiesce(fdt, vof);
> +    } else if (cmpserv("exit", 0, 0)) {
> +        error_report("Stopped as the VM requested \"exit\"");
> +        vm_stop(RUN_STATE_PAUSED); /* Or qemu_system_guest_panicked(NULL=
); ? */
> +    } else {
> +        trace_vof_error_unknown_service(service, nargs, nrets);
> +        ret =3D -1;
> +    }
> +
> +    return ret;
> +}
> +
> +static void of_instance_free(gpointer data)
> +{
> +    OfInstance *inst =3D (OfInstance *) data;
> +
> +    g_free(inst->path);
> +    g_free(inst);
> +}
> +
> +void vof_cleanup(Vof *vof)
> +{
> +    if (vof->claimed) {
> +        g_array_unref(vof->claimed);
> +    }
> +    if (vof->of_instances) {
> +        g_hash_table_unref(vof->of_instances);
> +    }
> +    vof->claimed =3D NULL;
> +    vof->of_instances =3D NULL;
> +}
> +
> +void vof_build_dt(void *fdt, Vof *vof, uint32_t top_addr)
> +{
> +    uint32_t phandle;
> +    int i, offset, proplen =3D 0;
> +    const void *prop;
> +    bool found =3D false;
> +    GArray *phandles =3D g_array_new(false, false, sizeof(uint32_t));
> +
> +    /*
> +     * Here is the first time we need of_instances and claimed. These are
> +     * released on vof_cleanup() (called when reset) or when vof=3Doff b=
ut
> +     * they need to survive ibm,client-architecture-support so we do not
> +     * always reset them here.
> +     */
> +    if (!vof->of_instances) {
> +        vof->of_instances =3D g_hash_table_new_full(g_direct_hash, g_dir=
ect_equal,
> +                                                  NULL, of_instance_free=
);
> +    }
> +    if (!vof->claimed) {
> +        vof->claimed =3D g_array_new(false, false, sizeof(OfClaimed));
> +    }
> +
> +    vof->top_addr =3D top_addr;
> +
> +    /* Find all predefined phandles */
> +    for (offset =3D fdt_next_node(fdt, -1, NULL);
> +         offset >=3D 0;
> +         offset =3D fdt_next_node(fdt, offset, NULL)) {
> +        prop =3D fdt_getprop(fdt, offset, "phandle", &proplen);
> +        if (prop && proplen =3D=3D sizeof(uint32_t)) {
> +            phandle =3D fdt32_ld(prop);
> +            g_array_append_val(phandles, phandle);
> +        }
> +    }
> +
> +    /* Assign phandles skipping the predefined ones */
> +    for (offset =3D fdt_next_node(fdt, -1, NULL), phandle =3D 1;
> +         offset >=3D 0;
> +         offset =3D fdt_next_node(fdt, offset, NULL), ++phandle) {
> +        prop =3D fdt_getprop(fdt, offset, "phandle", &proplen);
> +        if (prop) {
> +            continue;
> +        }
> +        /* Check if the current phandle is not allocated already */
> +        for ( ; ; ++phandle) {
> +            for (i =3D 0, found =3D false; i < phandles->len; ++i) {
> +                if (phandle =3D=3D g_array_index(phandles, uint32_t, i))=
 {
> +                    found =3D true;
> +                    break;
> +                }
> +            }
> +            if (!found) {
> +                break;
> +            }
> +        }
> +        _FDT(fdt_setprop_cell(fdt, offset, "phandle", phandle));
> +    }
> +    g_array_unref(phandles);
> +
> +    vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
> +}
> diff --git a/pc-bios/vof/bootmem.c b/pc-bios/vof/bootmem.c
> new file mode 100644
> index 000000000000..771b9e95f95d
> --- /dev/null
> +++ b/pc-bios/vof/bootmem.c
> @@ -0,0 +1,14 @@
> +#include "vof.h"
> +
> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize)
> +{
> +    uint64_t kern[2];
> +    phandle chosen =3D ci_finddevice("/chosen");
> +
> +    if (ci_getprop(chosen, "qemu,boot-kernel", kern, sizeof(kern)) !=3D
> +        sizeof(kern)) {
> +        return;
> +    }
> +
> +    do_boot(kern[0], initrd, initrdsize);
> +}
> diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
> new file mode 100644
> index 000000000000..a80806580dd0
> --- /dev/null
> +++ b/pc-bios/vof/ci.c
> @@ -0,0 +1,91 @@
> +#include "vof.h"
> +
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +};
> +
> +typedef unsigned long prom_arg_t;
> +
> +#define ADDR(x) (uint32_t)(x)
> +
> +static int prom_handle(struct prom_args *pargs)
> +{
> +    void *rtasbase;
> +    uint32_t rtassize =3D 0;
> +    phandle rtas;
> +
> +    if (strcmp("call-method", (void *)(unsigned long) pargs->service)) {
> +        return -1;
> +    }
> +
> +    if (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->args[0=
])) {
> +        return -1;
> +    }
> +
> +    rtas =3D ci_finddevice("/rtas");
> +    /* rtas-size is set by QEMU depending of FWNMI support */
> +    ci_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));
> +    if (rtassize < hv_rtas_size) {
> +        return -1;
> +    }
> +
> +    rtasbase =3D (void *)(unsigned long) pargs->args[2];
> +
> +    memcpy(rtasbase, hv_rtas, hv_rtas_size);
> +    pargs->args[pargs->nargs] =3D 0;
> +    pargs->args[pargs->nargs + 1] =3D pargs->args[2];
> +
> +    return 0;
> +}
> +
> +void prom_entry(uint32_t args)
> +{
> +    if (prom_handle((void *)(unsigned long) args)) {
> +        ci_entry(args);
> +    }
> +}
> +
> +static int call_ci(const char *service, int nargs, int nret, ...)
> +{
> +    int i;
> +    struct prom_args args;
> +    va_list list;
> +
> +    args.service =3D ADDR(service);
> +    args.nargs =3D nargs;
> +    args.nret =3D nret;
> +
> +    va_start(list, nret);
> +    for (i =3D 0; i < nargs; i++) {
> +        args.args[i] =3D va_arg(list, prom_arg_t);
> +    }
> +    va_end(list);
> +
> +    for (i =3D 0; i < nret; i++) {
> +        args.args[nargs + i] =3D 0;
> +    }
> +
> +    if (ci_entry((uint32_t)(&args)) < 0) {
> +        return PROM_ERROR;
> +    }
> +
> +    return (nret > 0) ? args.args[nargs] : 0;
> +}
> +
> +void ci_panic(const char *str)
> +{
> +    call_ci("exit", 0, 0);
> +}
> +
> +phandle ci_finddevice(const char *path)
> +{
> +    return call_ci("finddevice", 1, 1, path);
> +}
> +
> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int le=
n)
> +{
> +    return call_ci("getprop", 4, 1, ph, propname, prop, len);
> +}
> diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
> new file mode 100644
> index 000000000000..00c10e6e7da1
> --- /dev/null
> +++ b/pc-bios/vof/libc.c
> @@ -0,0 +1,92 @@
> +#include "vof.h"
> +
> +int strlen(const char *s)
> +{
> +    int len =3D 0;
> +
> +    while (*s !=3D 0) {
> +        len +=3D 1;
> +        s +=3D 1;
> +    }
> +
> +    return len;
> +}
> +
> +int strcmp(const char *s1, const char *s2)
> +{
> +    while (*s1 !=3D 0 && *s2 !=3D 0) {
> +        if (*s1 !=3D *s2) {
> +            break;
> +        }
> +        s1 +=3D 1;
> +        s2 +=3D 1;
> +    }
> +
> +    return *s1 - *s2;
> +}
> +
> +void *memcpy(void *dest, const void *src, size_t n)
> +{
> +    char *cdest;
> +    const char *csrc =3D src;
> +
> +    cdest =3D dest;
> +    while (n-- > 0) {
> +        *cdest++ =3D *csrc++;
> +    }
> +
> +    return dest;
> +}
> +
> +int memcmp(const void *ptr1, const void *ptr2, size_t n)
> +{
> +    const unsigned char *p1 =3D ptr1;
> +    const unsigned char *p2 =3D ptr2;
> +
> +    while (n-- > 0) {
> +        if (*p1 !=3D *p2) {
> +            return *p1 - *p2;
> +        }
> +        p1 +=3D 1;
> +        p2 +=3D 1;
> +    }
> +
> +    return 0;
> +}
> +
> +void *memmove(void *dest, const void *src, size_t n)
> +{
> +    char *cdest;
> +    const char *csrc;
> +    int i;
> +
> +    /* Do the buffers overlap in a bad way? */
> +    if (src < dest && src + n >=3D dest) {
> +        /* Copy from end to start */
> +        cdest =3D dest + n - 1;
> +        csrc =3D src + n - 1;
> +        for (i =3D 0; i < n; i++) {
> +            *cdest-- =3D *csrc--;
> +        }
> +    } else {
> +        /* Normal copy is possible */
> +        cdest =3D dest;
> +        csrc =3D src;
> +        for (i =3D 0; i < n; i++) {
> +            *cdest++ =3D *csrc++;
> +        }
> +    }
> +
> +    return dest;
> +}
> +
> +void *memset(void *dest, int c, size_t size)
> +{
> +    unsigned char *d =3D (unsigned char *)dest;
> +
> +    while (size-- > 0) {
> +        *d++ =3D (unsigned char)c;
> +    }
> +
> +    return dest;
> +}
> diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
> new file mode 100644
> index 000000000000..9fc30d2d0957
> --- /dev/null
> +++ b/pc-bios/vof/main.c
> @@ -0,0 +1,21 @@
> +#include "vof.h"
> +
> +void do_boot(unsigned long addr, unsigned long _r3, unsigned long _r4)
> +{
> +    register unsigned long r3 __asm__("r3") =3D _r3;
> +    register unsigned long r4 __asm__("r4") =3D _r4;
> +    register unsigned long r5 __asm__("r5") =3D (unsigned long) _prom_en=
try;
> +
> +    ((client *)(uint32_t)addr)();
> +}
> +
> +void entry_c(void)
> +{
> +    register unsigned long r3 __asm__("r3");
> +    register unsigned long r4 __asm__("r4");
> +    register unsigned long r5 __asm__("r5");
> +    uint64_t initrd =3D r3, initrdsize =3D r4;
> +
> +    boot_from_memory(initrd, initrdsize);
> +    ci_panic("*** No boot target ***\n");
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9147e9a429a0..cfad58685d91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1366,6 +1366,17 @@ F: pc-bios/canyonlands.dt[sb]
>  F: pc-bios/u-boot-sam460ex-20100605.bin
>  F: roms/u-boot-sam460ex
> =20
> +Virtual Open Firmware (VOF)
> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
> +M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>
> +L: qemu-ppc@nongnu.org
> +S: Maintained
> +F: hw/ppc/spapr_vof*
> +F: hw/ppc/vof*
> +F: pc-bios/vof/*
> +F: pc-bios/vof*
> +
>  RISC-V Machines
>  ---------------
>  OpenTitan
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index 218631c883be..24427d3f51c1 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -28,6 +28,8 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>    'spapr_rtas_ddw.c',
>    'spapr_numa.c',
>    'pef.c',
> +  'spapr_vof.c',
> +  'vof.c',
>  ))
>  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index b4bbfbb01348..da5e6809eba3 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -71,6 +71,30 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t in=
dex) "DRC index: 0x%"PRIx3
>  spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_le=
n) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
>  spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
> =20
> +# vof.c
> +vof_error_str_truncated(const char *s, int len) "%s truncated to %d"
> +vof_error_param(const char *method, int nargscheck, int nretcheck, int n=
args, int nret) "%s takes/returns %d/%d, not %d/%d"
> +vof_error_unknown_service(const char *service, int nargs, int nret) "\"%=
s\" args=3D%d rets=3D%d"
> +vof_error_unknown_method(const char *method) "\"%s\""
> +vof_error_unknown_ihandle_close(uint32_t ih) "ih=3D0x%x"
> +vof_error_unknown_path(const char *path) "\"%s\""
> +vof_error_write(uint32_t ih) "ih=3D0x%x"
> +vof_finddevice(const char *path, uint32_t ph) "\"%s\" =3D> ph=3D0x%x"
> +vof_claim(uint32_t virt, uint32_t size, uint32_t align, uint32_t ret) "v=
irt=3D0x%x size=3D0x%x align=3D0x%x =3D> 0x%x"
> +vof_release(uint32_t virt, uint32_t size, uint32_t ret) "virt=3D0x%x siz=
e=3D0x%x =3D> 0x%x"
> +vof_method(uint32_t ihandle, const char *method, uint32_t param, uint32_=
t ret, uint32_t ret2) "ih=3D0x%x \"%s\"(0x%x) =3D> 0x%x 0x%x"
> +vof_getprop(uint32_t ph, const char *prop, uint32_t ret, const char *val=
) "ph=3D0x%x \"%s\" =3D> len=3D%d [%s]"
> +vof_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=3D0x%x \=
"%s\" =3D> len=3D%d"
> +vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t val=
len, uint32_t ret) "ph=3D0x%x \"%s\" [%s] len=3D%d =3D> ret=3D%d"
> +vof_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=3D0x%x =3D> =
ih=3D0x%x"
> +vof_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_=
t ret, uint32_t ret2) "[%s] 0x%x 0x%x =3D> 0x%x 0x%x"
> +vof_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=3D0x=
%x =3D> %s len=3D%d"
> +vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t=
 ret) "ih=3D0x%x ph=3D0x%x =3D> %s len=3D%d"
> +vof_instance_to_package(uint32_t ih, uint32_t ph) "ih=3D0x%x =3D> ph=3D0=
x%x"
> +vof_write(uint32_t ih, unsigned cb, const char *msg) "ih=3D0x%x [%u] \"%=
s\""
> +vof_avail(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%=
"PRIx64" size=3D%"PRId64
> +vof_claimed(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0=
x%"PRIx64" size=3D%"PRId64
> +
>  # ppc.c
>  ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seco=
nds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
> =20
> diff --git a/pc-bios/README b/pc-bios/README
> index c101c9a04f8f..6e6556e91c92 100644
> --- a/pc-bios/README
> +++ b/pc-bios/README
> @@ -16,6 +16,8 @@
>    https://github.com/aik/SLOF, and the image currently in qemu is
>    built from git tag qemu-slof-20210217.
> =20
> +- vof is a minimalistic firmware to work with -machine pseries,x-vof=3Do=
n.
> +
>  - sgabios (the Serial Graphics Adapter option ROM) provides a means for
>    legacy x86 software to communicate with an attached serial console as
>    if a video card were attached.  The master sources reside in a subvers=
ion
> diff --git a/pc-bios/vof-nvram.bin b/pc-bios/vof-nvram.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..d183901cf980a91d81c4348bb=
20487c7bb62a2ec
> GIT binary patch
> literal 16384
> zcmeI%Jx;?g6bEpZJ8*)oSZeqZi&Z2pKnD)sI4{AHlNb4;RW}a70XPHaW57uo=3D-#R7
> zKSLBhJJ0sdixY3IuY@hzo0r$OmE%T;XE9uh@s1k=3DAOHafKmY;|fB*y_009U<00Izz
> z00bZa0SG_<0uX=3Dz1Rwwb2tWV=3DXCbip6d#B4{{rX#XR%}$Bm^J;0SG|gWP$!?Aq=3D-I
> zcT+0Ix{{?1q>9J8r+eW^JK1tYYZZMWQCUwW%0S*~w^p@wfkX-<yRFx)H*+YEt0RRd
> zmn}6xtwbP`yp4O=3D>kxMAEA<~5@*g)@mb%KD5!;O~8c)>8rRQBx55=3Dtrhk#+1+T3J_
> zaf*G4vZAduqy$qda{``6Gnc2DQg<Es<GLxL#9<Oj*zP!8ZSnwf@-j7l47!nFXQO$a
> z^Hes6YU^_M<KsM*k~zwOSa+2g3Sx{*Eyu^XrB0FM5IJ-*?8`VvpBc4}vS(+_UKJ;=3D
> xITAns0uX=3Dz1Rwwb2tWV=3D5P-nt34DD||Nni|VfbXeJORuY0uX=3Dz1R!vE0>7B^s4f5i
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
> new file mode 100755
> index 0000000000000000000000000000000000000000..f52e8e6a6da36791cbc97ecc4=
20c7a41fe8e76f0
> GIT binary patch
> literal 3128
> zcmd^AO=3Dufe5FS}_yQy{9gARhIc-^>QsWx`O2XAYlb?Sg@2V+PLhPp_KrPiXh<=3DSf5
> z7O7e_O&X;wNF;>>VmpT*(nBGK9FkL9D8*18e8@q8Hg=3D!~LoPWcr0MpX-M6tKC#opD
> zRq%ML_h#ptpKrb;`hWkzJ47=3DkQGUmj7}SVjN4}v5(WdkKu){1rzDKk9-Ihv(TE2^+
> zT=3D`vh<vz{^I%sj+ASIhPs1M>IHuIo$nCP{-Gjh)Gs_%S<xs{b#DkT^7pZkfr&fTN#
> zY`9H7vPP}>jh0IIF1g;mdsZ*yNh+<8w{(kSBTrsqjpV{%gL1Er>4h*!xuCl;Zg@I4
> z9yL#WMjLsulDl&9SM%Y?`{tjy_<K6X(IlRfO&!$BVe+a95q2qCJjDNf;=3DgQg9NXkW
> zED~bzM#%HX_`>i+$o<2A6GQP^<m`9wkfXm4B+7M;>A*oxTEFKQdy7Ovs~o3kqEEjG
> zJFl=3DqJgxK3vAYf*5@LOy>#BxH9#|(2*V0%uyqpu~QHWYKmKisHHlk^lp5kN#j*n}E
> zK3F#5eXa@W(OMQZ9{BN32IaSMp;4b2gbxih9U*e=3Dapq#1!YKI)?ZURpwq-l6LGI9)
> z{ttcK5j^SykNn_KU_Xz}3~;`{mDt~y`PXN)wL#p{nEB+W=3D%3PnLwy44Hn28;wYeYb
> z>rG%yfwR-#Y^=3D0Rb0w1&%k7jw&Gd4Vvf63ttcJ;`M(Ip7Po?S_U8vro%hheVS~cm~
> zop!o`Sf{KShiMwSjQ=3Dt0%tQCZFlk&H>_g~b73ag)`930egFaHC2)j3m^zzUOb)wD@
> z{;wV&*QE5);fw90IlX}``yW<E$b<NX3wDnrzE|5(GrK3U=3D$*uU1C|7zT+?ZAgoZAe
> z=3DWDS0aW{=3DSiF<GPfvw<yT*HHUUoqk9XXN9xd-eE7&Yk(Lt&qZa_5PTr$U$O!!I!ND
> zJ#2z6rzPggz-6KVg9tO@KlaO;UxGKT7+E^gh$Bt-KXsM;Lq{0H1q>H30yf5z73QYM
> zqY+LM`guxY97jLFMIY+NvnCrRv~&;O1AIl`zgmOeNKdbcS$G$-5Wy@Q+dm6m{Q>+g
> z;CEvd`hedL96}v`=3DeW>g)*o5uhsT~nGsyVht*ot5H{zASC0{Obob|pN&;7Zh$92}Z
> zockTj@}ryFd(oGP27TXhzA?ad^p)o%0Ka=3DY4CBt`w;$*JBDiI7Z`EXtwe*AasP5ac
> z<LHi4Z}{zJ`=3DUKdUiM>Y=3D_+Y;cwT|$wd@5Rw4LL!-V^xOoje`8T*&$cS~j`h#Dv3{
> zy4cnc+aULb^F}WM=3DmpPF05i;(ex7CcW{vQwA#1j+SXe8dTT*cpT4U#-s3WFXj*`ML
> z4Xv14{Jy}|n#8s69DLwT;CWx2kUz&Laoy_kbZYxlhmc224eMjPQlksa#Td0}?-$>`
> z65>!$n*i$<cIzCP%6wGRplR|M-&vZtcV^jhjfF1Ch`Z0OF=3D}YnUQ!R>`PmxFA{XX8
> z>#`y=3DaRcwOran`@{k|La?}fhE@4x9IVzTFF1h`S_n-G{B#rNg;e5t+&Clm@P<7wqY
> zI-OB6@ud%w83jkL&`f-8u4g`(nN24swXmFtFJw~jOtNPw6JLfDQ?Gd7t!Fv)c@k$y
> zJ(c0R4^j(>MDo+r3=3DZLNaVfn>y)(1v<>Uf=3DoSgrpo6&kcN-ixV=3Dh&Xe<tJ)0ur6R-
> Y!McI9j&t0*rtrLpbsK93YZvRm-zr#Zp8x;=3D
>=20
> literal 0
> HcmV?d00001
>=20
> diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
> new file mode 100644
> index 000000000000..90f4b859a059
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
> +	. =3D 0x100 /* Do exactly as SLOF does */
> +
> +ENTRY(_start)
> +	LOAD32(%r31, 0) /* Go 32bit mode */
> +	mtmsrd %r31,0
> +	LOAD32(2, __toc_start)
> +	b entry_c
> +
> +ENTRY(_prom_entry)
> +	LOAD32(2, __toc_start)
> +	stdu    %r1,-112(%r1)
> +	std     %r31,104(%r1)
> +	mflr    %r31
> +	bl prom_entry
> +	nop
> +	mtlr    %r31
> +	ld      %r31,104(%r1)
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
> +	__executable_start =3D .;
> +
> +	.text : {
> +		*(.text)
> +	}
> +
> +	__etext =3D .;
> +
> +	. =3D ALIGN(8);
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
> +	. =3D ALIGN(8);
> +	__bss_start =3D .;
> +	.bss : {
> +		*(.sbss) *(.scommon)
> +		*(.dynbss)
> +		*(.bss)
> +	}
> +
> +	. =3D ALIGN(8);
> +	__bss_end =3D .;
> +	__bss_size =3D (__bss_end - __bss_start);
> +
> +	. =3D ALIGN(256);
> +	__toc_start =3D DEFINED (.TOC.) ? .TOC. : ADDR (.got) + 0x8000;
> +	.got :
> +	{
> +		 *(.toc .got)
> +	}
> +	. =3D ALIGN(8);
> +	__toc_end =3D .;
> +}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SOlI3FegC4VBGFHW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb+vQACgkQbDjKyiDZ
s5KXDhAAgkdUpp90E5LY6hpJZsQlDskmX+UOwkQCkJ/mUNGq0sp6APQrAdihnaWD
efcerCz6b/YT/tLAsTY54+Yv0ajtpIkN8rr0ex/i8L1ryCflSBYg335wSSy4VXbn
YROLPBoizpq+1sWyITgBNWOv0w8wYfdqxjK3L83MGQh1XxcdO+xXNeF21zs5uEim
ZbyywmDBRz4uXFH8xyJzq//6uPcPUIZkOnVPtEWiCn8WTrkFwoyzZowpOUOh5UVv
BayLK0frrE4YV0JoHfHsPpACWDwW4JWDZzO0ezhH25kdR6OPj1bC3b8T3uQzWsVD
nfriHoC1/QrSa6ZDkUJcjVMm+iKw9KkK+AFIP5LxCsLfQl2e81gNJTM5XdSimsZq
MzBbUXuL82gPuL1WqoyrlMgvz+jUYoNBvDcPtiVCaJkEB475LYSZa454vfm+knhq
s6DqALwBnb/Lzilwg481NQnAEVMem6XE7K7Lj09idPKHx8ydY3Oy5rrQHsW4asgV
6oxcxoDzbGN57fpgWvvCt5Vi03jk2gJcwmbGnl6Zocy9raA9wkpNKx5cFEusFbbV
NAJcritK2CGq+7yk7oxK0dAsw+IyC+7jZ7xmMeCNhfxvin5Oq3zCM3JlsN2TCcu5
Tzhje8k1KRYoNKFx4wpwE+rA3vB228MDzX3xfqJi1RKE8ktSA8Y=
=Z6ew
-----END PGP SIGNATURE-----

--SOlI3FegC4VBGFHW--

