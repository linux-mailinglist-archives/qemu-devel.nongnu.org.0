Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB9B3A7BFE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:31:55 +0200 (CEST)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6MM-0004CE-QA
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lt6KR-0002bs-HK; Tue, 15 Jun 2021 06:29:55 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:35615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lt6KM-0007dG-Rb; Tue, 15 Jun 2021 06:29:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4527874570B;
 Tue, 15 Jun 2021 12:29:44 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 92647745708; Tue, 15 Jun 2021 12:29:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8CD9A7456B4;
 Tue, 15 Jun 2021 12:29:43 +0200 (CEST)
Date: Tue, 15 Jun 2021 12:29:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v21] spapr: Implement Open Firmware client interface
In-Reply-To: <20210615070612.22679-1-aik@ozlabs.ru>
Message-ID: <8987bd7c-dfe1-cb73-e388-ae26ed5a69@eik.bme.hu>
References: <20210615070612.22679-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021, Alexey Kardashevskiy wrote:
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
> This make VOF optional, it is disabled by default, add --enable-vof
> to ./configure to enable it.
>
> This assumes potential support for booting from QEMU backends
> such as blockdev or netdev without devices/drivers used.
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

I haven't looked at it in detail yet, just some quick comments I have on 
first skim through.

> ---
> Changes:
> v21:
> * s/ld/ldz/ in entry.S

Typo? Has this become lwz?

> * moved CONFIG_VOF from default-configs/devices/ppc64-softmmu.mak to Kconfig
> * made CONFIG_VOF optional

This won't work for pegasos2, see below.

> * s/l.lds/vof.lds/
> * force 32 BE in spapr_machine_reset() instead of the firmware
> * added checks for non-null methods of VofMachineIfClass
> * moved OF_STACK_SIZE to vof.h, renamed to VOF_..., added a better comment
> * added  path_offset wrapper for handling mixed case for addresses
> after "@" in node names
> * changed getprop() to check for actual "name" property in the fdt
> * moved VOF_MEM_READ/VOF_MEM_WRITE to vof.h for sharing as (unlike similar
> rtas_ld/ldl_be_*) they return error codes
> * VOF_MEM_READ uses now address_space_read (it was address_space_read_full
> before, not sure why)
[...]
> ---
> configure               |    9 +
> pc-bios/vof/Makefile    |   23 +
> include/hw/ppc/spapr.h  |   25 +-
> include/hw/ppc/vof.h    |   55 ++
> pc-bios/vof/vof.h       |   43 ++
> hw/ppc/spapr.c          |   87 +++-
> hw/ppc/spapr_hcall.c    |   29 +-
> hw/ppc/spapr_vof.c      |  153 ++++++
> hw/ppc/vof.c            | 1052 +++++++++++++++++++++++++++++++++++++++
> pc-bios/vof/bootmem.c   |   14 +
> pc-bios/vof/ci.c        |   91 ++++
> pc-bios/vof/libc.c      |   92 ++++
> pc-bios/vof/main.c      |   21 +
> tests/qtest/rtas-test.c |   17 +-
> MAINTAINERS             |   12 +
> hw/ppc/Kconfig          |    3 +
> hw/ppc/meson.build      |    3 +
> hw/ppc/trace-events     |   24 +
> meson.build             |    1 +
> pc-bios/README          |    2 +
> pc-bios/vof-nvram.bin   |  Bin 0 -> 16384 bytes
> pc-bios/vof.bin         |  Bin 0 -> 3784 bytes
> pc-bios/vof/entry.S     |   49 ++
> pc-bios/vof/vof.lds     |   48 ++
> 24 files changed, 1840 insertions(+), 13 deletions(-)
> create mode 100644 pc-bios/vof/Makefile
> create mode 100644 include/hw/ppc/vof.h
> create mode 100644 pc-bios/vof/vof.h
> create mode 100644 hw/ppc/spapr_vof.c
> create mode 100644 hw/ppc/vof.c
> create mode 100644 pc-bios/vof/bootmem.c
> create mode 100644 pc-bios/vof/ci.c
> create mode 100644 pc-bios/vof/libc.c
> create mode 100644 pc-bios/vof/main.c
> create mode 100644 pc-bios/vof-nvram.bin
> create mode 100755 pc-bios/vof.bin
> create mode 100644 pc-bios/vof/entry.S
> create mode 100644 pc-bios/vof/vof.lds
>
> diff --git a/configure b/configure
> index 8dcb9965b24e..00dc29c027fa 100755
> --- a/configure
> +++ b/configure
> @@ -445,6 +445,7 @@ fuse="auto"
> fuse_lseek="auto"
> multiprocess="auto"
> slirp_smbd="$default_feature"
> +vof="no"

Why is this disabled by default? I pretty much need VOF in pegasos2 as 
there would be no other firmware otherwise. So it means I have to select 
VOF in pegasos2 config and then VOF itself cannot be optional any more. If 
you want it to be optional for spapr then you can't use CONFIG_VOF for 
that but need to add a separate CONFIG_VOF_SPAPR or CONFIG_SPAPR_VOF 
option that you can set to no by default even when CONFIG_VOF is yes and 
make VOF usage conditional on that variable within spapr files.

Hope this make sense. But I don't really see why you need to do that when 
you already have this turned off by default for spapr unless the x-vof 
option is used. Isn't that enough to make this optional? If not then you 
need another spapr specific CONFIG_* variable because CONFIG_PEGASOS2 has 
to select CONFIG_VOF as it will be its default firmware. For the same 
reason you should not put it behind a config option especially one that 
needs to be explicitely enabled.

> malloc_trim="auto"
> gio="$default_feature"
> @@ -1561,6 +1562,10 @@ for opt do
>   ;;
>   --disable-slirp-smbd) slirp_smbd=no
>   ;;
> +  --enable-vof) vof=yes
> +  ;;
> +  --disable-vof) vof=no
> +  ;;
>   *)
>       echo "ERROR: unknown option $opt"
>       echo "Try '$0 --help' for more information"
> @@ -1940,6 +1945,7 @@ disabled with --disable-FEATURE, default is enabled if available
>   multiprocess    Out of process device emulation support
>   gio             libgio support
>   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
> +  vof             Virtual Open Firmware support (powerpc/pseries, experimental)
>
> NOTE: The object files are built at the place where configure is launched
> EOF
> @@ -5555,6 +5561,9 @@ if test "$slirp_smbd" = "yes" ; then
>   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
>   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
> fi
> +if test "$vof" = "yes" ; then
> +  echo "CONFIG_VOF=y" >> $config_host_mak
> +fi
> if test "$vde" = "yes" ; then
>   echo "CONFIG_VDE=y" >> $config_host_mak
>   echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> new file mode 100644
> index 000000000000..aa1678c4d889
> --- /dev/null
> +++ b/pc-bios/vof/Makefile
> @@ -0,0 +1,23 @@
> +all: build-all
> +
> +build-all: vof.bin
> +
> +CROSS ?=
> +CC = $(CROSS)gcc
> +LD = $(CROSS)ld
> +OBJCOPY = $(CROSS)objcopy
> +
> +%.o: %.S
> +	$(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
> +
> +%.o: %.c
> +	$(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o $@ $<
> +
> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
> +	$(LD) -nostdlib -e_start -Tvof.lds -EB -o $@ $^
> +
> +%.bin: %.elf
> +	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> +
> +clean:
> +	rm -f *.o vof.bin vof.elf *~
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f05219f75ef6..39b5581ae650 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -12,6 +12,9 @@
> #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
> #include "hw/ppc/xics.h"        /* For ICSState */
> #include "hw/ppc/spapr_tpm_proxy.h"
> +#ifdef CONFIG_VOF
> +#include "hw/ppc/vof.h"
> +#endif
>
> struct SpaprVioBus;
> struct SpaprPhbState;
> @@ -180,6 +183,9 @@ struct SpaprMachineState {
>     uint64_t kernel_addr;
>     uint32_t initrd_base;
>     long initrd_size;
> +#ifdef CONFIG_VOF
> +    Vof *vof;
> +#endif
>     uint64_t rtc_offset; /* Now used only during incoming migration */
>     struct PPCTimebase tb;
>     bool has_graphics;
> @@ -558,7 +564,9 @@ struct SpaprMachineState {
> /* Client Architecture support */
> #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
> #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
>
> /*
>  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
> @@ -956,4 +964,19 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
> void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
> hwaddr spapr_get_rtas_addr(void);
> bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> +
> +#ifdef CONFIG_VOF
> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> +                     target_ulong *stack_ptr, Error **errp);
> +void spapr_vof_quiesce(MachineState *ms);
> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char *propname,
> +                       void *val, int vallen);
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                target_ulong opcode, target_ulong *args);
> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
> +                                                   CPUState *cs,
> +                                                   target_ulong ovec_addr);
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
> +#endif
> +
> #endif /* HW_SPAPR_H */
> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
> new file mode 100644
> index 000000000000..65ca2fed0d41
> --- /dev/null
> +++ b/include/hw/ppc/vof.h
> @@ -0,0 +1,55 @@
> +/*
> + * Virtual Open Firmware
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_VOF_H
> +#define HW_VOF_H
> +
> +typedef struct Vof {
> +    uint64_t top_addr; /* copied from rma_size */
> +    GArray *claimed; /* array of SpaprOfClaimed */
> +    uint64_t claimed_base;
> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
> +    uint32_t of_instance_last;
> +    char *bootargs;
> +    long fw_size;
> +} Vof;
> +
> +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
> +                    target_ulong args_real);
> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t align);
> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
> +void vof_cleanup(Vof *vof);
> +void vof_build_dt(void *fdt, Vof *vof);
> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
> +                               const char *prop, const char *path);
> +
> +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
> +
> +typedef struct VofMachineIfClass VofMachineIfClass;
> +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, TYPE_VOF_MACHINE_IF)
> +
> +struct VofMachineIfClass {
> +    InterfaceClass parent;
> +    target_ulong (*client_architecture_support)(MachineState *ms, CPUState *cs,
> +                                                target_ulong vec);
> +    void (*quiesce)(MachineState *ms);
> +    bool (*setprop)(MachineState *ms, const char *path, const char *propname,
> +                    void *val, int vallen);
> +};
> +
> +/*
> + * Initial stack size is from
> + * https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html
> + */
> +#define VOF_STACK_SIZE       0x8000

Maybe also add a define for RTAS_SIZE here? We'll need to put that in the 
device tree but it depends on the rtas shim size that's part of VOF so it 
should be defined here instead of hardcoding it in boards that use VOF so 
it can be updated later at one place if needed.

> +
> +#define VOF_MEM_READ(pa, buf, size) \
> +    address_space_read(&address_space_memory, \
> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
> +#define VOF_MEM_WRITE(pa, buf, size) \
> +    address_space_write(&address_space_memory, \
> +    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))

These aren't much useful without the struct definition that you typically 
want to read data into using these.

> +
> +#endif /* HW_VOF_H */
[...]
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> new file mode 100644
> index 000000000000..1068a1e58388
> --- /dev/null
> +++ b/hw/ppc/vof.c
> +
> +/* Defined as Big Endian */
> +struct prom_args {
> +    uint32_t service;
> +    uint32_t nargs;
> +    uint32_t nret;
> +    uint32_t args[10];
> +} QEMU_PACKED;

I mean this one, this could be in vof.h too. But this may better be in a 
generic rtas.h with the rtas_* macros so maybe done at a later point. So 
maybe just forget it for now.

> +
> +int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
> +                    target_ulong args_real)
> +{
> +    struct prom_args args_be;
> +    uint32_t args[ARRAY_SIZE(args_be.args)];
> +    uint32_t rets[ARRAY_SIZE(args_be.args)] = { 0 }, ret;
> +    char service[64];
> +    unsigned nargs, nret, i;
> +
> +    if (address_space_rw(&address_space_memory, args_real,
> +                         MEMTXATTRS_UNSPECIFIED, &args_be, sizeof(args_be),
> +                         false) != MEMTX_OK) {
> +        return -EINVAL;
> +    }
> +    nargs = be32_to_cpu(args_be.nargs);
> +    if (nargs >= ARRAY_SIZE(args_be.args)) {
> +        return -EINVAL;
> +    }
> +
> +    if (address_space_rw(&address_space_memory, be32_to_cpu(args_be.service),
> +                         MEMTXATTRS_UNSPECIFIED, service, sizeof(service),
> +                         false) != MEMTX_OK) {
> +        return -EINVAL;
> +    }
> +    if (strnlen(service, sizeof(service)) == sizeof(service)) {
> +        /* Too long service name */
> +        return -EINVAL;
> +    }
> +
> +    for (i = 0; i < nargs; ++i) {
> +        args[i] = be32_to_cpu(args_be.args[i]);
> +    }
> +
> +    nret = be32_to_cpu(args_be.nret);
> +    ret = vof_client_handle(ms, fdt, vof, service, args, nargs, rets, nret);
> +    if (!nret) {
> +        return 0;
> +    }
> +
> +    args_be.args[nargs] = cpu_to_be32(ret);
> +    for (i = 1; i < nret; ++i) {
> +        args_be.args[nargs + i] = cpu_to_be32(rets[i - 1]);
> +    }
> +
> +    if (address_space_rw(&address_space_memory,
> +                         args_real + offsetof(struct prom_args, args[nargs]),
> +                         MEMTXATTRS_UNSPECIFIED, args_be.args + nargs,
> +                         sizeof(args_be.args[0]) * nret, true) != MEMTX_OK) {
> +        return -EINVAL;

Also you're still not using your macros here. Why?

Regards,
BALATON Zoltan

