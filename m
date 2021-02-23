Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48032248E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 04:13:58 +0100 (CET)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEO97-0004Vo-3o
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 22:13:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO3H-0006Xl-3U; Mon, 22 Feb 2021 22:07:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55557 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lEO3A-0003J4-Uj; Mon, 22 Feb 2021 22:07:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Dl3rV05z1z9sWP; Tue, 23 Feb 2021 14:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614049658;
 bh=W0KW4qIIR/RrwIgZRXr9PP+Gq+mRKRNUUXJxzHXhGqw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWOcHcVHzjLIc8LyppuElXimtiN8Ucyb6SUNEAiCkswpofc5XLxmZkIUYtqZw6t+J
 fktyzqiCcy3LQFtjW42lOgYX5L3DGWYMlArLQe1ObJUuW/MVzJup0h7ntX+bk9DMNc
 TcEJOUiwteCm0utV2NnbPXXWg8OQz6L+MuxI8Ma0=
Date: Tue, 23 Feb 2021 14:07:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v13] spapr: Implement Open Firmware client interface
Message-ID: <YDRxdIIiX9gCLEFM@yekko.fritz.box>
References: <20210209110252.110107-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yf7U2K7N9OuYe/Y8"
Content-Disposition: inline
In-Reply-To: <20210209110252.110107-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--Yf7U2K7N9OuYe/Y8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 10:02:52PM +1100, Alexey Kardashevskiy wrote:
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
> 0..4000 - the initial firmware
> 10000..180000 - stack
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
> This does not use the QEMU coding style for the firmware as using
> it for assemler is rather strange in the POWERPC world, according
> to POWERPC veterans; mixing styles in the firmware's .c and .s is
> weird too IMO.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>=20
> The example command line is:
>=20
> -c 0 /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
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
> -initrd t/le.cpio \
> -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof/nvram.b=
in,format=3Draw \
> -global spapr-nvram.drive=3DDRIVE0 \
> -snapshot \
> -smp 8,threads=3D8 \
> -L /home/aik/t/qemu-ppc64-bios/ \
> -trace events=3Dqemu_trace_events \
> -d guest_errors \
> -chardev socket,id=3DSOCKET0,server,nowait,path=3Dqemu.mon.tmux26 \
> -mon chardev=3DSOCKET0,mode=3Dcontrol
>=20
>=20
>=20
> ---
> Changes:
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
>  pc-bios/vof/Makefile      |  18 +
>  hw/ppc/vof.h              |  44 ++
>  include/hw/ppc/spapr.h    |  21 +-
>  pc-bios/vof/vof.h         |  44 ++
>  hw/ppc/spapr.c            |  75 +++-
>  hw/ppc/spapr_hcall.c      |  26 +-
>  hw/ppc/spapr_vof_client.c | 125 ++++++
>  hw/ppc/vof.c              | 905 ++++++++++++++++++++++++++++++++++++++
>  pc-bios/vof/bootmem.c     |  13 +
>  pc-bios/vof/ci.c          | 108 +++++
>  pc-bios/vof/libc.c        |  91 ++++
>  pc-bios/vof/main.c        |  22 +
>  hw/ppc/meson.build        |   2 +
>  hw/ppc/trace-events       |  21 +
>  pc-bios/README            |   2 +
>  pc-bios/vof.bin           | Bin 0 -> 3680 bytes
>  pc-bios/vof/entry.S       |  51 +++
>  pc-bios/vof/l.lds         |  48 ++
>  pc-bios/vof/nvram.bin     | Bin 0 -> 16384 bytes
>  19 files changed, 1607 insertions(+), 9 deletions(-)
>  create mode 100644 pc-bios/vof/Makefile
>  create mode 100644 hw/ppc/vof.h
>  create mode 100644 pc-bios/vof/vof.h
>  create mode 100644 hw/ppc/spapr_vof_client.c
>  create mode 100644 hw/ppc/vof.c
>  create mode 100644 pc-bios/vof/bootmem.c
>  create mode 100644 pc-bios/vof/ci.c
>  create mode 100644 pc-bios/vof/libc.c
>  create mode 100644 pc-bios/vof/main.c
>  create mode 100755 pc-bios/vof.bin
>  create mode 100644 pc-bios/vof/entry.S
>  create mode 100644 pc-bios/vof/l.lds
>  create mode 100644 pc-bios/vof/nvram.bin
>=20
> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> new file mode 100644
> index 000000000000..49f7e240eeff
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
> +	cc -m32 -mbig-endian -c -fno-stack-protector -Wno-builtin-declaration-m=
ismatch -o $@ $<
> +
> +vof.elf: entry.o main.o libc.o ci.o bootmem.o
> +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
> +
> +%.bin: %.elf
> +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> +
> +clean:
> +	rm -f *.o *.bin *.elf *~
> diff --git a/hw/ppc/vof.h b/hw/ppc/vof.h
> new file mode 100644
> index 000000000000..5964693c0de8
> --- /dev/null
> +++ b/hw/ppc/vof.h
> @@ -0,0 +1,44 @@
> + /* Virtual Open Firmware */
> +#ifndef HW_VOF_H
> +#define HW_VOF_H
> +
> +typedef struct Vof {
> +    bool on;
> +    uint32_t rtas_base;
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
> +void vof_reset(Vof *vof, uint32_t top_addr);
> +uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
> +                         uint32_t *args, unsigned nargs,
> +                         uint32_t *rets, unsigned nrets);
> +uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
> +                   uint64_t align);
> +void vof_build_dt(void *fdt, Vof *vof);
> +uint32_t vof_client_open(void *fdt, Vof *vof, const char *nodename,
> +                         const char *prop, const char *path);
> +
> +/* ibm,client-architecture-support */
> +#define TYPE_CLIENT_ARCHITECTURE_SUPPORT "client-architecture-support"
> +#define CLIENT_ARCHITECTURE_SUPPORT(obj) \
> +    INTERFACE_CHECK(ClientArchitectureSupport, (obj), TYPE_CLIENT_ARCHIT=
ECTURE_SUPPORT)
> +
> +typedef struct ClientArchitectureSupportClass ClientArchitectureSupportC=
lass;
> +DECLARE_CLASS_CHECKERS(ClientArchitectureSupportClass,
> +                       CLIENT_ARCHITECTURE_SUPPORT,
> +                       TYPE_CLIENT_ARCHITECTURE_SUPPORT)
> +
> +struct ClientArchitectureSupportClass {
> +    InterfaceClass parent;
> +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
> +    void (*quiesce)(void);
> +};
> +
> +#endif /* HW_VOF_H */
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ccbeeca1de84..e8c49e5a828c 100644
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
> @@ -180,6 +181,7 @@ struct SpaprMachineState {
>      uint64_t kernel_addr;
>      uint32_t initrd_base;
>      long initrd_size;
> +    Vof vof;

Since vof is optional, I think it would be better to make this a
pointer, and only allocate in the vof=3Don case.  You can then also use
(vof =3D=3D NULL) instead of the vof->on boolean.

>      uint64_t rtc_offset; /* Now used only during incoming migration */
>      struct PPCTimebase tb;
>      bool has_graphics;
> @@ -554,7 +556,8 @@ struct SpaprMachineState {
>  /* Client Architecture support */
>  #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>  #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)

Any reason this is 0x5, rather than 0x4?

> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
> =20
>  /*
>   * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
> @@ -944,4 +947,20 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, =
hwaddr pagesize,
>  void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>  hwaddr spapr_get_rtas_addr(void);
>  bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr);
> +void spapr_vof_quiesce(void);
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> +                                target_ulong opcode, target_ulong *args);
> +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
> +                                                   target_ulong ovec_add=
r);
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000
> +
> +/* 0..10000 is reserved for the VOF fw */
> +#define OF_STACK_ADDR       0x10000
> +
>  #endif /* HW_SPAPR_H */


VOF is pretty much inherently papr specific, so I'm not really seeing
a clear rationale for the distinction between vof_*() things and
spapr_vof_*() things.

> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
> new file mode 100644
> index 000000000000..cd5989952a98
> --- /dev/null
> +++ b/pc-bios/vof/vof.h
> @@ -0,0 +1,44 @@
> +#include <stdarg.h>
> +
> +typedef unsigned char uint8_t;
> +typedef unsigned short uint16_t;
> +typedef unsigned long uint32_t;
> +typedef unsigned long long uint64_t;
> +#define NULL (0)
> +#define PROM_ERROR (-1u)
> +typedef unsigned char bool;
> +typedef unsigned long ihandle;
> +typedef unsigned long phandle;
> +#define false ((bool)0)
> +#define true ((bool)1)
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
> +/* Prom */
> +typedef unsigned long prom_arg_t;
> +int call_prom(const char *service, int nargs, int nret, ...);
> +
> +/* CI wrappers */
> +void ci_panic(const char *str);
> +phandle ci_finddevice(const char *path);
> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int le=
n);
> +ihandle ci_open(const char *path);
> +void ci_close(ihandle ih);
> +void *ci_claim(void *virt, uint32_t size, uint32_t align);
> +uint32_t ci_release(void *virt, uint32_t size);
> +
> +/* booting from -kernel */
> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);


It seems to me you shouldn't need even this much in terms of in-guest
code, but more on that later.

> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2e2ac20193fb..547b2bd8ac77 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -101,6 +101,7 @@
>  #define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that =
*/
>  #define FW_MAX_SIZE             0x400000
>  #define FW_FILE_NAME            "slof.bin"
> +#define FW_FILE_NAME_VOF        "vof.bin"
>  #define FW_OVERHEAD             0x2800000
>  #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
> =20
> @@ -1561,6 +1562,7 @@ static void spapr_machine_reset(MachineState *machi=
ne)
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(machine);
>      PowerPCCPU *first_ppc_cpu;
>      hwaddr fdt_addr;
> +    target_ulong stack_ptr =3D 0;
>      void *fdt;
>      int rc;
> =20
> @@ -1621,24 +1623,48 @@ static void spapr_machine_reset(MachineState *mac=
hine)
>       */
>      fdt_addr =3D MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
> =20
> +    if (spapr->vof.on) {
> +        /* Resets the VOF's internal state */
> +        vof_reset(&spapr->vof, spapr->rma_size);
> +    }
> +
>      fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
> =20
> -    rc =3D fdt_pack(fdt);
> +    if (spapr->vof.on) {
> +        /*
> +         * Claims initramdisk and stack which changes "available" so
> +         * doing it befofe packing.
> +         */
> +        spapr_vof_reset(spapr, fdt, &stack_ptr);

Not really seeing why vof_reset() and spapr_vof_reset() are separate things.

> =20
> -    /* Should only fail if we've built a corrupted tree */
> -    assert(rc =3D=3D 0);
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  stack_ptr, spapr->initrd_base,
> +                                  spapr->initrd_size);
> +        /*
> +         * We do not pack the FDT as the client may change properties and
> +         * do not write FDT to the VM as the client does not expect it.
> +         */
> +    } else {
> +        rc =3D fdt_pack(fdt);
> +        /* Should only fail if we've built a corrupted tree */
> +        assert(rc =3D=3D 0);
> =20
> -    /* Load the fdt */
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
> +    if (!spapr->vof.on) {
> +        /* Load the fdt */
> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_=
size);
> +    }
> =20
>      spapr->fwnmi_system_reset_addr =3D -1;
>      spapr->fwnmi_machine_check_addr =3D -1;
> @@ -2638,7 +2664,8 @@ static void spapr_machine_init(MachineState *machin=
e)
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(machine);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> -    const char *bios_name =3D machine->firmware ?: FW_FILE_NAME;
> +    const char *bios_default =3D spapr->vof.on ? FW_FILE_NAME_VOF : FW_F=
ILE_NAME;
> +    const char *bios_name =3D machine->firmware ?: bios_default;
>      const char *kernel_filename =3D machine->kernel_filename;
>      const char *initrd_filename =3D machine->initrd_filename;
>      PCIHostState *phb;
> @@ -2990,6 +3017,10 @@ static void spapr_machine_init(MachineState *machi=
ne)
>      }
> =20
>      qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
> +
> +    if (spapr->vof.on) {
> +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client=
);
> +    }
>  }
> =20
>  #define DEFAULT_KVM_TYPE "auto"
> @@ -3180,6 +3211,20 @@ static void spapr_set_resize_hpt(Object *obj, cons=
t char *value, Error **errp)
>      }
>  }
> =20
> +static bool spapr_get_vof(Object *obj, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    return spapr->vof.on;
> +}
> +
> +static void spapr_set_vof(Object *obj, bool value, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    spapr->vof.on =3D value;
> +}
> +
>  static char *spapr_get_ic_mode(Object *obj, Error **errp)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> @@ -3305,6 +3350,10 @@ static void spapr_instance_init(Object *obj)
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
> @@ -4402,6 +4451,7 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
>      XICSFabricClass *xic =3D XICS_FABRIC_CLASS(oc);
>      InterruptStatsProviderClass *ispc =3D INTERRUPT_STATS_PROVIDER_CLASS=
(oc);
>      XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
> +    ClientArchitectureSupportClass *casc =3D CLIENT_ARCHITECTURE_SUPPORT=
_CLASS(oc);
> =20
>      mc->desc =3D "pSeries Logical Partition (PAPR compliant)";
>      mc->ignore_boot_device_suffixes =3D true;
> @@ -4481,6 +4531,9 @@ static void spapr_machine_class_init(ObjectClass *o=
c, void *data)
>      smc->smp_threads_vsmt =3D true;
>      smc->nr_xirqs =3D SPAPR_NR_XIRQS;
>      xfc->match_nvt =3D spapr_match_nvt;
> +
> +    casc->cas =3D spapr_vof_client_architecture_support;
> +    casc->quiesce =3D spapr_vof_quiesce;
>  }
> =20
>  static const TypeInfo spapr_machine_info =3D {
> @@ -4500,6 +4553,7 @@ static const TypeInfo spapr_machine_info =3D {
>          { TYPE_XICS_FABRIC },
>          { TYPE_INTERRUPT_STATS_PROVIDER },
>          { TYPE_XIVE_FABRIC },
> +        { TYPE_CLIENT_ARCHITECTURE_SUPPORT },
>          { }
>      },
>  };
> @@ -4968,9 +5022,16 @@ static void spapr_machine_2_1_class_options(Machin=
eClass *mc)
>  }
>  DEFINE_SPAPR_MACHINE(2_1, "2.1", false);
> =20
> +static const TypeInfo client_archivecture_support_info =3D {
> +    .name =3D TYPE_CLIENT_ARCHITECTURE_SUPPORT,
> +    .parent =3D TYPE_INTERFACE,
> +    .class_size =3D sizeof(ClientArchitectureSupportClass),
> +};
> +
>  static void spapr_machine_register_types(void)
>  {
>      type_register_static(&spapr_machine_info);
> +    type_register_static(&client_archivecture_support_info);
>  }
> =20
>  type_init(spapr_machine_register_types)
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c26..0043ca057ba5 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1806,7 +1806,13 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>          spapr_setup_hpt(spapr);
>      }
> =20
> -    fdt =3D spapr_build_fdt(spapr, false, fdt_bufsize);
> +    if (spapr->vof.on && spapr->vof.initrd_base && spapr->vof.initrd_siz=
e) {
> +        /* Update initramdisk location so the right area gets reserved b=
elow */
> +        spapr->initrd_base =3D spapr->vof.initrd_base;
> +        spapr->initrd_size =3D spapr->vof.initrd_size;

Why do you need a separate vof initrd base & size in the first place?

> +    }
> +
> +    fdt =3D spapr_build_fdt(spapr, spapr->vof.on, fdt_bufsize);
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
> diff --git a/hw/ppc/spapr_vof_client.c b/hw/ppc/spapr_vof_client.c
> new file mode 100644
> index 000000000000..a8f056938b31
> --- /dev/null
> +++ b/hw/ppc/spapr_vof_client.c
> @@ -0,0 +1,125 @@
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
> +                                target_ulong opcode, target_ulong *args)
> +{
> +    target_ulong of_client_args =3D ppc64_phys_to_real(args[0]);
> +    struct prom_args pargs =3D { 0 };
> +    char service[64];
> +    unsigned nargs, nret, i;
> +
> +    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));

Need to check for read errors in case an out of bounds address is passed.

> +    nargs =3D be32_to_cpu(pargs.nargs);
> +    if (nargs >=3D ARRAY_SIZE(pargs.args)) {
> +        return H_PARAMETER;
> +    }
> +
> +    cpu_physical_memory_read(be32_to_cpu(pargs.service), service,
> +                             sizeof(service));
> +    if (strnlen(service, sizeof(service)) =3D=3D sizeof(service)) {
> +        /* Too long service name */
> +        return H_PARAMETER;
> +    }
> +
> +    for (i =3D 0; i < nargs; ++i) {
> +        pargs.args[i] =3D be32_to_cpu(pargs.args[i]);

In general I dislike in-place endian conversion of structs, since I
think it's less confusing to think of the endianness as a property of
the type.

> +    }
> +
> +    nret =3D be32_to_cpu(pargs.nret);
> +    pargs.args[nargs] =3D vof_client_call(spapr->fdt_blob, &spapr->vof, =
service,
> +                                        pargs.args, nargs,
> +                                        pargs.args + nargs + 1, nret);
> +    if (!nret) {
> +        return H_SUCCESS;
> +    }
> +
> +    for (i =3D 0; i < nret; ++i) {
> +        pargs.args[nargs + i] =3D cpu_to_be32(pargs.args[nargs + i]);
> +    }
> +    cpu_physical_memory_write(of_client_args + sizeof(uint32_t) * (3 + n=
args),
> +                              pargs.args + nargs, sizeof(uint32_t) * nre=
t);
> +
> +    return H_SUCCESS;
> +}
> +
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
> +{
> +    char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> +
> +    /* Creates phandles, required by vof_client_open below */
> +    vof_build_dt(fdt, &spapr->vof);
> +
> +    /*
> +     * SLOF-less setup requires an open instance of stdout for early
> +     * kernel printk. By now all phandles are settled so we can open
> +     * the default serial console.
> +     */
> +    if (stdout_path) {
> +        _FDT(vof_client_open(fdt, &spapr->vof, "/chosen", "stdout",
> +                             stdout_path));
> +    }
> +}
> +
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr)
> +{
> +    Vof *vof =3D &spapr->vof;
> +
> +    spapr_vof_client_dt_finalize(spapr, fdt);
> +
> +    *stack_ptr =3D vof_claim(spapr->fdt_blob, vof, OF_STACK_ADDR, OF_STA=
CK_SIZE,
> +                           OF_STACK_SIZE);
> +    if (*stack_ptr =3D=3D -1) {
> +        error_report("Memory allocation for stack failed");
> +        exit(1);
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
> +        error_report("Memory for kernel is in use");
> +        exit(1);
> +    }
> +
> +    if (spapr->initrd_size &&
> +        vof_claim(spapr->fdt_blob, vof, spapr->initrd_base, spapr->initr=
d_size,
> +                  0) =3D=3D -1) {
> +        error_report("Memory for initramdisk is in use");
> +        exit(1);
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
> +}
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> new file mode 100644
> index 000000000000..8aea2450762d
> --- /dev/null
> +++ b/hw/ppc/vof.c
> @@ -0,0 +1,905 @@
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
> +#include <sys/ioctl.h>
> +#include "exec/ram_addr.h"
> +#include "qemu/timer.h"
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

Yeah, I discovered that and similar things when writing dtc and libfdt.

> + */
> +#define OF_PROPNAME_LEN_MAX 64
> +
> +#define ALIGN(x, a) (((x) + (a) - 1) & ~((a) - 1))

You can use QEMU_ALIGN_UP instead of redefining this.

> +typedef struct {
> +    uint64_t start;
> +    uint64_t size;
> +} OfClaimed;
> +
> +typedef struct {
> +    char *params;
> +    char *path; /* the path used to open the instance */
> +    uint32_t phandle;
> +} OfInstance;
> +
> +static void readstr(hwaddr pa, char *buf, int size)
> +{
> +    cpu_physical_memory_read(pa, buf, size);
> +    if (strnlen(buf, size) =3D=3D size) {
> +        buf[size - 1] =3D '\0';
> +        trace_vof_error_str_truncated(buf, size);
> +    }
> +}
> +
> +static bool cmpservice(const char *s, size_t len,
> +                       unsigned nargs, unsigned nret,
> +                       const char *s1, size_t len1,
> +                       unsigned nargscheck, unsigned nretcheck)
> +{
> +    if (strcmp(s, s1)) {
> +        return false;
> +    }
> +    if ((nargscheck && (nargs !=3D nargscheck)) ||
> +        (nretcheck && (nret !=3D nretcheck))) {
> +        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
> +        return false;
> +    }

len & len1 are unused - what are they for?

> +    return true;
> +}
> +
> +static void split_path(const char *fullpath, char **node, char **unit,
> +                       char **part)
> +{
> +    const char *c, *p =3D NULL, *u =3D NULL;
> +
> +    *node =3D *unit =3D *part =3D NULL;
> +
> +    if (fullpath[0] =3D=3D '\0') {
> +        *node =3D g_strdup(fullpath);
> +        return;
> +    }

A comment describing what you expect paths to look like would make
this a bunch easier to interpret.

> +
> +    for (c =3D fullpath + strlen(fullpath) - 1; c > fullpath; --c) {
> +        if (*c =3D=3D '/') {
> +            break;
> +        }
> +        if (*c =3D=3D ':') {
> +            p =3D c + 1;
> +            continue;
> +        }
> +        if (*c =3D=3D '@') {
> +            u =3D c + 1;
> +            continue;
> +        }
> +    }
> +
> +    if (p && u && p < u) {
> +        p =3D NULL;
> +    }
> +
> +    if (u && p) {
> +        *node =3D g_strndup(fullpath, u - fullpath - 1);
> +        *unit =3D g_strndup(u, p - u - 1);
> +        *part =3D g_strdup(p);
> +    } else if (!u && p) {
> +        *node =3D g_strndup(fullpath, p - fullpath - 1);
> +        *part =3D g_strdup(p);
> +    } else if (!p && u) {
> +        *node =3D g_strndup(fullpath, u - fullpath - 1);
> +        *unit =3D g_strdup(u);
> +    } else {
> +        *node =3D g_strdup(fullpath);
> +    }
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
> +static int vof_fdt_path_offset(const void *fdt, const char *node,
> +                               const char *unit)
> +{
> +    int offset;
> +
> +    offset =3D fdt_path_offset(fdt, node);
> +
> +    if (offset < 0 && unit) {

I don't think this is right.  I'm guessing if unit is supplied you
definitely want to match on the unit address.  But if there is any
node matching the name, but not matching the unit, then the original
fdt_path_offset() will succeed, meaning we don't get into the unit
matching logic.

> +        g_autofree char *tmp =3D g_strdup_printf("%s@%s", node, unit);
> +
> +        offset =3D fdt_path_offset(fdt, tmp);
> +    }
> +
> +    return offset;
> +}
> +
> +static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
> +{
> +    g_autofree char *node =3D NULL, *unit =3D NULL, *part =3D NULL;
> +    char fullnode[1024];
> +    uint32_t ret =3D -1;
> +    int offset;
> +
> +    readstr(nodeaddr, fullnode, sizeof(fullnode));

Should you detect a truncation error from readstr() here?

> +
> +    split_path(fullnode, &node, &unit, &part);
> +    offset =3D vof_fdt_path_offset(fdt, node, unit);

It seems a bit weird to split the node and unit address apart, just to
glue them back together to look them up in the tree.

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
> +
> +    readstr(pname, propname, sizeof(propname));
> +    if (strcmp(propname, "name") =3D=3D 0) {
> +        prop =3D fdt_get_name(fdt, nodeoff, &proplen);
> +        proplen +=3D 1;
> +    } else {
> +        prop =3D fdt_getprop(fdt, nodeoff, propname, &proplen);
> +    }
> +
> +    if (prop) {
> +        int cb =3D MIN(proplen, vallen);
> +
> +        cpu_physical_memory_write(valaddr, prop, cb);
> +        /*
> +         * OF1275 says:
> +         * "Size is either the actual size of the property, or =E2=80=93=
1 if name

That appears to be a weird unicode minus sign, rather than a plain old '-'.

> +         * does not exist", hence returning proplen instead of cb.
> +         */
> +        ret =3D proplen;
> +        prop_format(trval, sizeof(trval), prop, ret);
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
> +    readstr(pname, propname, sizeof(propname));
> +    if (strcmp(propname, "name") =3D=3D 0) {
> +        prop =3D fdt_get_name(fdt, nodeoff, &proplen);
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
> +
> +    readstr(pname, propname, sizeof(propname));
> +    /*
> +     * We only allow changing properties which we know how to update on
> +     * the QEMU side.
> +     */
> +    if (vallen =3D=3D sizeof(uint32_t)) {
> +        uint32_t val32 =3D ldl_be_phys(first_cpu->as, valaddr);
> +
> +        if ((strcmp(propname, "linux,rtas-base") =3D=3D 0) ||
> +            (strcmp(propname, "linux,rtas-entry") =3D=3D 0)) {
> +            vof->rtas_base =3D val32;
> +        } else if (strcmp(propname, "linux,initrd-start") =3D=3D 0) {
> +            vof->initrd_base =3D val32;
> +        } else if (strcmp(propname, "linux,initrd-end") =3D=3D 0) {
> +            vof->initrd_size =3D val32 - vof->initrd_base;
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else if (vallen =3D=3D sizeof(uint64_t)) {
> +        uint64_t val64 =3D ldq_be_phys(first_cpu->as, valaddr);
> +
> +        if (strcmp(propname, "linux,initrd-start") =3D=3D 0) {
> +            vof->initrd_base =3D val64;
> +        } else if (strcmp(propname, "linux,initrd-end") =3D=3D 0) {
> +            vof->initrd_size =3D val64 - vof->initrd_base;
> +        } else {
> +            goto trace_exit;
> +        }
> +    } else if (strcmp(propname, "bootargs") =3D=3D 0) {
> +        char val[1024];
> +
> +        readstr(valaddr, val, sizeof(val));
> +        g_free(vof->bootargs);
> +        vof->bootargs =3D g_strdup(val);
> +    } else {
> +        goto trace_exit;
> +    }
> +
> +    offset =3D fdt_node_offset_by_phandle(fdt, nodeph);
> +    if (offset >=3D 0) {
> +        uint8_t data[vallen];
> +
> +        cpu_physical_memory_read(valaddr, data, vallen);
> +        if (!fdt_setprop(fdt, offset, propname, data, vallen)) {
> +            ret =3D vallen;
> +            prop_format(trval, sizeof(trval), data, ret);
> +        }
> +    }
> +
> +trace_exit:
> +    trace_vof_setprop(nodeph, propname, trval, ret);
> +
> +    return ret;
> +}
> +
> +static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
> +                             uint32_t prevaddr, uint32_t nameaddr)
> +{
> +    int offset =3D fdt_node_offset_by_phandle(fdt, phandle);
> +    char prev[OF_PROPNAME_LEN_MAX + 1];
> +    const char *tmp;
> +
> +    readstr(prevaddr, prev, sizeof(prev));
> +    for (offset =3D fdt_first_property_offset(fdt, offset);
> +         offset >=3D 0;
> +         offset =3D fdt_next_property_offset(fdt, offset)) {
> +
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
> +            cpu_physical_memory_write(nameaddr, tmp, strlen(tmp) + 1);
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
> +    g_autofree char *node =3D NULL, *unit =3D NULL, *part =3D NULL;
> +
> +    if (vof->of_instance_last =3D=3D 0xFFFFFFFF) {
> +        /* We do not recycle ihandles yet */
> +        goto trace_exit;
> +    }
> +
> +    split_path(path, &node, &unit, &part);
> +
> +    offset =3D vof_fdt_path_offset(fdt, node, unit);
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
> +    inst->params =3D part;
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
> +uint32_t vof_client_open(void *fdt, Vof *vof, const char *nodename,
> +                         const char *prop, const char *path)

AFAICT this has just one caller - handling the open of stdout.  It
might be simpler to just open code it there.

> +{
> +    int node =3D fdt_path_offset(fdt, nodename);
> +    uint32_t inst =3D vof_do_open(fdt, vof, path);
> +
> +    return fdt_setprop_cell(fdt, node, prop, inst);
> +}
> +
> +static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
> +{
> +    char path[256];
> +
> +    readstr(pathaddr, path, sizeof(path));
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
> +    char tmp[256] =3D "";
> +
> +    if (!fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle), tmp,
> +                      sizeof(tmp))) {
> +        tmp[sizeof(tmp) - 1] =3D 0;
> +        ret =3D MIN(len, strlen(tmp) + 1);
> +        cpu_physical_memory_write(buf, tmp, ret);
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
> +    char tmp[256] =3D "";
> +
> +    if (phandle !=3D -1) {
> +        if (!fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle),
> +                          tmp, sizeof(tmp))) {
> +            tmp[sizeof(tmp) - 1] =3D 0;
> +            ret =3D MIN(len, strlen(tmp) + 1);
> +            cpu_physical_memory_write(buf, tmp, ret);
> +        }
> +    }
> +    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
> +
> +    return ret;
> +}
> +
> +static void vof_clamed_dump(GArray *claimed)

s/clamed/claimed/ ?

> +{
> +#ifdef DEBUG
> +    int i;
> +    OfClaimed c;
> +
> +    for (i =3D 0; i < claimed->len; ++i) {
> +        c =3D g_array_index(claimed, OfClaimed, i);
> +        error_printf("CLAIMED %lx..%lx size=3D%ld\n", c.start, c.start +=
 c.size,
> +                     c.size);
> +    }
> +#endif
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
> +        if ((c.start <=3D virt && virt < c.start + c.size) ||
> +            (virt <=3D c.start && c.start < virt + size)) {

You can use the ranges_overlap() function to simplify this.

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
> +    struct { uint64_t start, size; } *avail;
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
> +    vof_clamed_dump(claimed);
> +
> +    avail =3D g_malloc0(sizeof(uint64_t) * 2 * claimed->len);
> +    for (i =3D 0, n =3D 0; i < claimed->len; ++i) {
> +        OfClaimed c =3D g_array_index(claimed, OfClaimed, i);
> +
> +        avail[n].start =3D c.start + c.size;
> +        if (i < claimed->len - 1) {
> +            OfClaimed cn =3D g_array_index(claimed, OfClaimed, i + 1);
> +
> +            avail[n].size =3D cn.start - avail[n].start;
> +        } else {
> +            avail[n].size =3D be64_to_cpu(mem0_reg[1]) - avail[n].start;
> +        }
> +
> +        if (avail[n].size) {
> +#ifdef DEBUG
> +            error_printf("AVAIL %lx..%lx size=3D%ld\n", avail[n].start,
> +                         avail[n].start + avail[n].size, avail[n].size);
> +#endif
> +            avail[n].start =3D cpu_to_be64(avail[n].start);
> +            avail[n].size =3D cpu_to_be64(avail[n].size);
> +            ++n;
> +        }
> +    }
> +    _FDT((fdt_setprop(fdt, offset, "available", avail,
> +                      sizeof(uint64_t) * 2 * n)));
> +    g_free(avail);
> +}
> +
> +/*
> + * "claim" claims memory at @virt if @align=3D=3D0; otherwise it allocat=
es
> + * memory at the requested alignment.

=46rom the logic, I'm guessing that this should be called with exactly
one of @virt and @align non-zero.  Is that right?  Might be best to
clarify that here.

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
> +        vof->claimed_base =3D ALIGN(vof->claimed_base, align);
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
> +static uint32_t vof_release(Vof *vof, uint64_t virt, uint64_t size)
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
> +            ret =3D 0;

This should also rewrite the "available" property, shouldn't it?

> +            break;
> +        }
> +    }
> +
> +    trace_vof_release(virt, size, ret);
> +
> +    return ret;
> +}
> +
> +static void vof_instantiate_rtas(void)
> +{
> +    error_report("The firmware should have instantiated RTAS");
> +    exit(1);
> +}
> +
> +static uint32_t vof_call_method(Vof *vof, uint32_t methodaddr,
> +                                uint32_t ihandle,
> +                                uint32_t param1, uint32_t param2,
> +                                uint32_t param3, uint32_t param4,
> +                                uint32_t *ret2)
> +{
> +    uint32_t ret =3D -1;
> +    char method[256] =3D "";
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
> +    readstr(methodaddr, method, sizeof(method));
> +
> +    if (strcmp(inst->path, "/") =3D=3D 0) {
> +        if (strcmp(method, "ibm,client-architecture-support") =3D=3D 0) {
> +            Object *cas_if =3D object_dynamic_cast(
> +                    qdev_get_machine(), TYPE_CLIENT_ARCHITECTURE_SUPPORT=
);
> +
> +            if (cas_if) {
> +                ClientArchitectureSupportClass *casc =3D
> +                    CLIENT_ARCHITECTURE_SUPPORT_GET_CLASS(cas_if);
> +
> +                ret =3D casc->cas(first_cpu, param1);

Vof is pretty unavoidably tied to spapr, so I don't think you really
need an interface to abstract this.

> +            }
> +
> +            *ret2 =3D 0;
> +        }
> +    } else if (strcmp(inst->path, "/rtas") =3D=3D 0) {
> +        if (strcmp(method, "instantiate-rtas") =3D=3D 0) {
> +            vof_instantiate_rtas();
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
> +    char cmd[256] =3D "";
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
> +    Object *cas_if =3D object_dynamic_cast(
> +        qdev_get_machine(), TYPE_CLIENT_ARCHITECTURE_SUPPORT);
> +
> +    int rc =3D fdt_pack(fdt);
> +
> +    assert(rc =3D=3D 0);
> +
> +    if (cas_if) {
> +        ClientArchitectureSupportClass *casc =3D
> +            CLIENT_ARCHITECTURE_SUPPORT_GET_CLASS(cas_if);
> +
> +        casc->quiesce();
> +    }
> +
> +    vof_clamed_dump(vof->claimed);
> +}
> +
> +uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
> +                         uint32_t *args, unsigned nargs,
> +                         uint32_t *rets, unsigned nrets)
> +{
> +    int servicelen =3D strlen(service);
> +    uint32_t ret =3D 0;
> +
> +    /* @nrets includes the value which this function returns */
> +#define cmpserv(s, a, r) \
> +    cmpservice(service, servicelen, nargs, nrets, (s), sizeof(s), (a), (=
r))
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
> +    } else if (cmpserv("claim", 3, 1)) {
> +        ret =3D vof_claim(fdt, vof, args[0], args[1], args[2]);
> +    } else if (cmpserv("release", 2, 0)) {
> +        ret =3D vof_release(vof, args[0], args[1]);
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
> +    g_free(inst->params);
> +    g_free(inst->path);
> +    g_free(inst);
> +}
> +
> +void vof_reset(Vof *vof, uint32_t top_addr)
> +{
> +    if (vof->claimed) {
> +        g_array_unref(vof->claimed);
> +    }
> +    if (vof->of_instances) {
> +        g_hash_table_unref(vof->of_instances);
> +    }
> +
> +    vof->claimed =3D g_array_new(false, false, sizeof(OfClaimed));
> +    vof->of_instances =3D g_hash_table_new_full(g_direct_hash, g_direct_=
equal,
> +                                              NULL, of_instance_free);
> +    vof->top_addr =3D top_addr;
> +}
> +
> +void vof_build_dt(void *fdt, Vof *vof)
> +{
> +    uint32_t phandle;
> +    int i, offset, proplen =3D 0;
> +    const void *prop;
> +    bool found =3D false;
> +    GArray *phandles =3D g_array_new(false, false, sizeof(uint32_t));
> +
> +    /* Add options now, doing it at the end of this __func__ breaks it :=
-/ */
> +    offset =3D fdt_add_subnode(fdt, 0, "options");
> +    if (offset > 0) {

Probably best to just fail outright if the add_subnode() fails, rather
than just skipping some things.

> +        struct winsize ws;
> +
> +        if (ioctl(1, TIOCGWINSZ, &ws) !=3D -1) {
> +            _FDT(fdt_setprop_cell(fdt, offset, "screen-#columns", ws.ws_=
col));
> +            _FDT(fdt_setprop_cell(fdt, offset, "screen-#rows", ws.ws_row=
));
> +        }

This is only correct in a pretty narrow set of circumstances - a
serial guest console attached to qemu's stdout.

> +        _FDT(fdt_setprop_cell(fdt, offset, "real-mode?", 1));
> +    }
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
> +
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

A simpler way would be just to call fdt_get_max_phandle() first, then
allocate all the new phandles from that value upwards.  In theory it
can fail if the tree has some high phandle values, but it's basically
not going to happen in practice.

> +    g_array_unref(phandles);
> +
> +    vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
> +}
> diff --git a/pc-bios/vof/bootmem.c b/pc-bios/vof/bootmem.c
> new file mode 100644
> index 000000000000..de7d5fc76431
> --- /dev/null
> +++ b/pc-bios/vof/bootmem.c
> @@ -0,0 +1,13 @@
> +#include "vof.h"
> +
> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize)
> +{
> +	uint64_t kern[2];
> +	phandle chosen =3D ci_finddevice("/chosen");
> +
> +	if (ci_getprop(chosen, "qemu,boot-kernel", kern, sizeof(kern)) !=3D
> +			sizeof(kern))
> +		return;
> +
> +	do_boot(kern[0], initrd, initrdsize);

All do_boot() does is set up some register entry conditions, so AFAICT
you could do this just as well from the qemu side.

> +}
> diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
> new file mode 100644
> index 000000000000..4880b3d2047c
> --- /dev/null
> +++ b/pc-bios/vof/ci.c
> @@ -0,0 +1,108 @@
> +#include "vof.h"
> +
> +struct prom_args {
> +        uint32_t service;
> +        uint32_t nargs;
> +        uint32_t nret;
> +        uint32_t args[10];
> +};
> +
> +#define ADDR(x) (uint32_t)(x)
> +
> +extern uint32_t ci_entry(uint32_t params);
> +
> +extern unsigned long hv_rtas(unsigned long params);
> +extern unsigned int hv_rtas_size;
> +
> +bool prom_handle(struct prom_args *pargs)
> +{
> +	void *rtasbase;
> +	uint32_t rtassize =3D 0;
> +	phandle rtas;
> +
> +	if (strcmp("call-method", (void *)(unsigned long) pargs->service))
> +		return false;
> +
> +	if (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->args[0]))
> +		return false;
> +
> +	rtas =3D ci_finddevice("/rtas");
> +	ci_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));
> +	if (rtassize < hv_rtas_size)
> +		return false;
> +
> +	rtasbase =3D (void *)(unsigned long) pargs->args[2];
> +
> +	memcpy(rtasbase, hv_rtas, hv_rtas_size);
> +	pargs->args[pargs->nargs] =3D 0;
> +	pargs->args[pargs->nargs + 1] =3D pargs->args[2];

This is just a write to guest memory, why can't it be done from the
qemu side?

> +	return true;
> +}
> +
> +void prom_entry(uint32_t args)
> +{
> +	if (!prom_handle((void *)(unsigned long) args))
> +		ci_entry(args);
> +}
> +
> +int call_prom(const char *service, int nargs, int nret, ...)
> +{
> +        int i;
> +        struct prom_args args;
> +        va_list list;
> +
> +        args.service =3D ADDR(service);
> +        args.nargs =3D nargs;
> +        args.nret =3D nret;
> +
> +        va_start(list, nret);
> +        for (i =3D 0; i < nargs; i++)
> +                args.args[i] =3D va_arg(list, prom_arg_t);
> +        va_end(list);
> +
> +        for (i =3D 0; i < nret; i++)
> +                args.args[nargs+i] =3D 0;
> +
> +        if (ci_entry((uint32_t)(&args)) < 0)
> +                return PROM_ERROR;
> +
> +        return (nret > 0) ? args.args[nargs] : 0;
> +}
> +
> +void ci_panic(const char *str)
> +{
> +	call_prom("exit", 0, 0);
> +}
> +
> +phandle ci_finddevice(const char *path)
> +{
> +	return call_prom("finddevice", 1, 1, path);
> +}
> +
> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int le=
n)
> +{
> +	return call_prom("getprop", 4, 1, ph, propname, prop, len);
> +}
> +
> +ihandle ci_open(const char *path)
> +{
> +	return call_prom("open", 1, 1, path);
> +}
> +
> +void ci_close(ihandle ih)
> +{
> +	call_prom("close", 1, 0, ih);
> +}
> +
> +void *ci_claim(void *virt, uint32_t size, uint32_t align)
> +{
> +	uint32_t ret =3D call_prom("claim", 3, 1, ADDR(virt), size, align);
> +
> +	return (void *) (unsigned long) ret;
> +}
> +
> +uint32_t ci_release(void *virt, uint32_t size)
> +{
> +	return call_prom("release", 2, 1, ADDR(virt), size);
> +}
> diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
> new file mode 100644
> index 000000000000..8603aedcb32c
> --- /dev/null
> +++ b/pc-bios/vof/libc.c
> @@ -0,0 +1,91 @@
> +#include "vof.h"
> +
> +int strlen(const char *s)
> +{
> +	int len =3D 0;
> +
> +	while (*s !=3D 0) {
> +		len +=3D 1;
> +		s +=3D 1;
> +	}
> +
> +	return len;
> +}
> +
> +int strcmp(const char *s1, const char *s2)
> +{
> +        while (*s1 !=3D 0 && *s2 !=3D 0) {
> +                if (*s1 !=3D *s2)
> +                        break;
> +                s1 +=3D 1;
> +                s2 +=3D 1;
> +        }
> +
> +        return *s1 - *s2;
> +}
> +
> +void *memcpy(void *dest, const void *src, size_t n)
> +{
> +        char *cdest;
> +        const char *csrc =3D src;
> +
> +        cdest =3D dest;
> +        while (n-- > 0) {
> +                *cdest++ =3D *csrc++;
> +        }
> +
> +        return dest;
> +}
> +
> +int memcmp(const void *ptr1, const void *ptr2, size_t n)
> +{
> +        const unsigned char *p1 =3D ptr1;
> +        const unsigned char *p2 =3D ptr2;
> +
> +        while (n-- > 0) {
> +                if (*p1 !=3D *p2)
> +                        return (*p1 - *p2);
> +                p1 +=3D 1;
> +                p2 +=3D 1;
> +        }
> +
> +        return 0;
> +}
> +
> +void *memmove(void *dest, const void *src, size_t n)
> +{
> +        char *cdest;
> +        const char *csrc;
> +        int i;
> +
> +        /* Do the buffers overlap in a bad way? */
> +        if (src < dest && src + n >=3D dest) {
> +                /* Copy from end to start */
> +                cdest =3D dest + n - 1;
> +                csrc =3D src + n - 1;
> +                for (i =3D 0; i < n; i++) {
> +                        *cdest-- =3D *csrc--;
> +                }
> +        }
> +        else {
> +                /* Normal copy is possible */
> +                cdest =3D dest;
> +                csrc =3D src;
> +                for (i =3D 0; i < n; i++) {
> +                        *cdest++ =3D *csrc++;
> +                }
> +        }
> +
> +        return dest;
> +}
> +
> +void *memset(void *dest, int c, size_t size)
> +{
> +        unsigned char *d =3D (unsigned char *)dest;
> +
> +        while (size-- > 0) {
> +                *d++ =3D (unsigned char)c;
> +        }
> +
> +        return dest;
> +}

AFAICT most of this code exists only to support boot_from_mem() and
prom_handle(), which I don't actually see a need to be in guest code
anyway.

> diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
> new file mode 100644
> index 000000000000..34299a9cc5ad
> --- /dev/null
> +++ b/pc-bios/vof/main.c
> @@ -0,0 +1,22 @@
> +#include "vof.h"
> +
> +
> +void do_boot(unsigned long addr, unsigned long _r3, unsigned long _r4)
> +{
> +	register unsigned long r3 __asm__("r3") =3D _r3;
> +	register unsigned long r4 __asm__("r4") =3D _r4;
> +	register unsigned long r5 __asm__("r5") =3D (unsigned long) _prom_entry;
> +
> +	((client *)(uint32_t)addr)();
> +}
> +
> +void entry_c(void)
> +{
> +	register unsigned long r3 __asm__("r3");
> +	register unsigned long r4 __asm__("r4");
> +	register unsigned long r5 __asm__("r5");
> +	uint64_t initrd =3D r3, initrdsize =3D r4;
> +
> +	boot_from_memory(initrd, initrdsize);
> +	ci_panic("*** No boot target ***\n");
> +}
> diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
> index ffa2ec37fa25..5776cc8d955a 100644
> --- a/hw/ppc/meson.build
> +++ b/hw/ppc/meson.build
> @@ -27,6 +27,8 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
>    'spapr_nvdimm.c',
>    'spapr_rtas_ddw.c',
>    'spapr_numa.c',
> +  'spapr_vof_client.c',
> +  'vof.c',
>  ))
>  ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
>  ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 1e91984526a3..017c48624f96 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -71,6 +71,27 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t in=
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
> +vof_finddevice(const char *path, uint32_t ph) "\"%s\" =3D> ph=3D0x%x"
> +vof_canon(const char *path) "\"%s\""
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
> +vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t ret=
) "ph=3D0x%x \"%s\" [%s] =3D> len=3D%d"
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
> +
>  # ppc.c
>  ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seco=
nds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
> =20
> diff --git a/pc-bios/README b/pc-bios/README
> index 33f9754ad30f..7839ab5364c5 100644
> --- a/pc-bios/README
> +++ b/pc-bios/README
> @@ -16,6 +16,8 @@
>    https://github.com/aik/SLOF, and the image currently in qemu is
>    built from git tag qemu-slof-20200717.
> =20
> +- vof is a minimalistic firmware to work with -machine pseries,x-vof=3Do=
n.
> +
>  - sgabios (the Serial Graphics Adapter option ROM) provides a means for
>    legacy x86 software to communicate with an attached serial console as
>    if a video card were attached.  The master sources reside in a subvers=
ion
> diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
> new file mode 100755
> index 0000000000000000000000000000000000000000..0606d9451c6bff39b32879c2a=
3369406a6a0d07d
> GIT binary patch
> literal 3680
> zcmd^BUuauZ82{2_+ue2@_aP6FMSANxX=3D=3D+V^r6wxq_aZW%u<<!iXBNzt}d80wap}x
> z#N4z}S8<TCJvivU2Pyj2hY5XKg&_s^u!ji|bnD&*d)b3vWu4dGckj6_{g=3Dh<(ZJ!H
> zob#RU_kF+b&$&eZ?_Xe@C~goH)*Xq?AW`(>B?=3DMUwAULA#>}I8bhdE6ZYf0j&qP62
> z;l6X}0rol?XtZA^HJ3P=3D?ZiPe{%~Ip(aYQR$lk+M_mu|YR!*v0DmkeA@{iPX`5v|8
> z0*A9F7ieE$t!^oBha7L*`MOjpkW^YAxpbWry+E?QKuWPor~L77wiqBO?{hBo>#hd2
> z$6uf}{V=3D(5l5=3DVDXJcdXfw7s7y`N<}YQ$4>$)nks0Lgxp2(y%%KF0su;=3DiJ^9e2qM
> zTO`;bhv?8H{d3(Fq5~Idv7ype_~x;3z_pkC@%zZZxLA9{+QaK<AJK_vqTsyoo9Xwl
> zaF+eu#m{wMc)+KZ`Ly|i{&v1M-Aja7W_^XPLc!oX1$n;$R~Bp8loz<&^QL{~Jz>W+
> z=3D#<!JTQ1*h#>AA#`vwN`mW}EzHm<_P4%pZ!Z1f<;Uc^|1E-&+s*~2^lqp=3Du4Jeo~j
> zOq=3D`%v95<NeMDC+e^h_3Va!BGW!t*vj9YwP;0OOBzKLtw0sH~1ckl*2*j9;o-0ru{
> z^&XsVxAj}jfoHNcV#dT{#&MQPutx<~-h6YP8?(9JJx5$8s^4cAyvJuEzwA9zo;kO3
> z9QL<aoP$#<7LxxU)>}DOgntTT6~=3D%a)IDpg;r=3DlGZ{cyL?yB+JQ#b2<Ca#1%u+6Ho
> zUf@SiXW(nFZ-3Vwc~pK1UJX6$%i9%o&OCXFoHLE#Ecyn8jm>ws=3Da_jrZ^ZyMa*eZ`
> zEaY5}^X(#c4LVRG&NE!+{s1W*tK{O|sL$)Njy;@xZ^oxfR~T31iWzI*WCRZ9gp9sw
> z%82{i<7D6t3K<vlcm{pS>zqS~z3dO7NA{Za&$hZaA6TZ?NA6<1kZrPLSq?ei5V5P)
> zr`N^1&{)~Ww!RBfI{OQ|B-R%;{=3DQ&ygMMcE9X9?t&%FsfQmyhPv<a-+z*<8;y1DZW
> znsNhc2>odo{V7_yOR17Uqo{=3DpILppNC>NZf#&Ur4a)d6H3sfpE&^P7lv{=3D4N-<1to
> z{<WS~VC#^mrD4pR2T{!Yt~jp-D9H7Jxf?MoW4{M8pNB-<a34%eL+;gSI)Iwyo*3f)
> z+zSUK<ZnF%?btw;_4oLD$p!m*idKvyKKIvyGb<*Fh~1OkA2B%{7Il230=3Dpe}T+<TA
> z-qZtGkq1ge9&FbY6}oP~AK8l4pTD#3<{L6+_R!(&`Z!PFgT(kEUv5>2VGa56#Q^6^
> z$0AXOPK28Aocigt3FM6<N>9y^8uU*-Wc~OqU<?N^9Ki5e7?0;TH-#V7a<PV9GI^14
> z?C&Auq8nUtttq;Jynll40=3D_EnU#h@=3D&bphFcJZ^(!rA<x0;igvHSjsHSb@VaV?LV%
> z&f7J_Y*o~CPvv*U)*dp^35?3`4i9)#!J{|-N;oUx=3Dmc(yh5P6i_764rZ{I<02|iz5
> z7FX<ea&2)8E3oT;-6pW#tC8Df;rF}nJA{6AYG*$y@;6}<a;OFUtPMHT4jjBgk6&b4
> zP^bKcDB=3Dxp>Da@W#`x$x3i@jcY~?rKoe!PnZ;KYJ+w*Uo&hlH8cfN^!{Ks*wUlFH)
> zy*NVYQFC*%+MiZGNT)MuCN}nwmQk^Fh~lwSs`Z?fIh#&Ua%4Oc8_6VN8Lf3J6C3Ay
> zC&YrM*74+L8uqkoGQ(#dCPxwp?bBo&n@~79mL8?_s5Zi9@l<-8W#g$>@*L(dEv3b<
> zb0U5g2P5=3D}cJ6!&ThscnHa4QA_zsc7L-axxql7Vwv5c{TeVjXnu)cwD6Qhi=3Dj&UF3
> NA;t#L5!^o_{R4q+IM@IH
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

Since this is intimately tied to qemu, you can just assume the startup
cpu mode and shouldn't need to manage it with guest instructions.

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
> diff --git a/pc-bios/vof/nvram.bin b/pc-bios/vof/nvram.bin
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Yf7U2K7N9OuYe/Y8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA0cXIACgkQbDjKyiDZ
s5IgJA//Q5QLuOj6dwLOQF92wU6ytH2fpWVMfkdEAoNA1vAX2Bo54VDot6a+mH1l
2xwhtaOGiDi6+vFPjvNAA/Y9DXOTMGZcwenJ2B6z1hp46UGet3gpJgqaeqRzhpTd
LOaI5FdQAdXV9KEIfizzCYKnvAlDcAT4E61Ew3URS2Bc+FTPkPxwV8U0gTNwDQOU
EkSyto+kidWzPo9bv6La+6lfLowHwV2gaoBAq6xWV7Xoy2VkEkVKwKZ+GN9G8vgS
JZMboG08P4MnAqyPuC3xhn/n4tt9vt8bkfBAJkt2VfzUu7c6PnTiXhv0Zvz7Gg4w
tpSMLLoqnluqhRN6zQgYIQIwPfiP9KYwgQDRFNZyPzUHnyt3wmiSO4M/AWsRP2Ih
9r5kXLGSwxYb6OxKF8ZxMGQxp0z7jHjlO7dFvUt7t5Knd+zyy227dKcR8bf4hWI/
Obqi1C0e6a6tiKy4/WclqBnj4xleMB5dKW4yTYhOFzWY52lIflTkizZ2xIwPfz3s
Y3+pmeezwN3pEVJedkAEqvZVtn5Fzp59h60bwnK5HMsxkmGEMew/Oe/xPvV3WIUc
gWe+cvIW3nqeRZOPBtRDIsLufhSlm2sMn8Qh6z8Q3G8gG3jnG7l5bB71vXRlfLCN
S2v1rDarmfV584nF2QfwKuPXO7kUYSXmTEF/Mvrc22cFUVNyL6s=
=o+3o
-----END PGP SIGNATURE-----

--Yf7U2K7N9OuYe/Y8--

