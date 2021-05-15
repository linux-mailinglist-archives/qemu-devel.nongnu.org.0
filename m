Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9F381AC7
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:33:20 +0200 (CEST)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li02J-00007B-5q
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li00h-0007dZ-R2; Sat, 15 May 2021 15:31:39 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li00b-0002AP-8r; Sat, 15 May 2021 15:31:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CA92B745709;
 Sat, 15 May 2021 21:31:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2DDF2745708; Sat, 15 May 2021 21:31:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2C1117456B4;
 Sat, 15 May 2021 21:31:27 +0200 (CEST)
Date: Sat, 15 May 2021 21:31:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
In-Reply-To: <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
Message-ID: <dbdc9e7-b179-6c5e-61ef-297e72e086b5@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 May 2021, BALATON Zoltan wrote:
> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>> The PAPR platform describes an OS environment that's presented by
>> a combination of a hypervisor and firmware. The features it specifies
>> require collaboration between the firmware and the hypervisor.
>> 
>> Since the beginning, the runtime component of the firmware (RTAS) has
>> been implemented as a 20 byte shim which simply forwards it to
>> a hypercall implemented in qemu. The boot time firmware component is
>> SLOF - but a build that's specific to qemu, and has always needed to be
>> updated in sync with it. Even though we've managed to limit the amount
>> of runtime communication we need between qemu and SLOF, there's some,
>> and it has become increasingly awkward to handle as we've implemented
>> new features.
>> 
>> This implements a boot time OF client interface (CI) which is
>> enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
>> Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
>> which implements Open Firmware Client Interface (OF CI). This allows
>> using a smaller stateless firmware which does not have to manage
>> the device tree.
>> 
>> The new "vof.bin" firmware image is included with source code under
>> pc-bios/. It also includes RTAS blob.
>> 
>> This implements a handful of CI methods just to get -kernel/-initrd
>> working. In particular, this implements the device tree fetching and
>> simple memory allocator - "claim" (an OF CI memory allocator) and updates
>> "/memory@0/available" to report the client about available memory.
>> 
>> This implements changing some device tree properties which we know how
>> to deal with, the rest is ignored. To allow changes, this skips
>> fdt_pack() when x-vof=on as not packing the blob leaves some room for
>> appending.
>> 
>> In absence of SLOF, this assigns phandles to device tree nodes to make
>> device tree traversing work.
>> 
>> When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.
>> 
>> This adds basic instances support which are managed by a hash map
>> ihandle -> [phandle].
>> 
>> Before the guest started, the used memory is:
>> 0..e60 - the initial firmware
>> 8000..10000 - stack
>> 400000.. - kernel
>> 3ea0000.. - initramdisk
>> 
>> This OF CI does not implement "interpret".
>> 
>> Unlike SLOF, this does not format uninitialized nvram. Instead, this
>> includes a disk image with pre-formatted nvram.
>> 
>> With this basic support, this can only boot into kernel directly.
>> However this is just enough for the petitboot kernel and initradmdisk to
>> boot from any possible source. Note this requires reasonably recent guest
>> kernel with:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735
>> 
>> The immediate benefit is much faster booting time which especially
>> crucial with fully emulated early CPU bring up environments. Also this
>> may come handy when/if GRUB-in-the-userspace sees light of the day.
>> 
>> This separates VOF and sPAPR in a hope that VOF bits may be reused by
>> other POWERPC boards which do not support pSeries.
>> 
>> This is coded in assumption that later on we might be adding support for
>> booting from QEMU backends (blockdev is the first candidate) without
>> devices/drivers in between as OF1275 does not require that and
>> it is quite easy to so.
>> 
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> 
>> The example command line is:
>> 
>> /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
>> -nodefaults \
>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>> -mon id=MON0,chardev=STDIO0,mode=readline \
>> -nographic \
>> -vga none \
>> -enable-kvm \
>> -m 8G \
>> -machine 
>> pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off 
>> \
>> -kernel pbuild/kernel-le-guest/vmlinux \
>> -initrd pb/rootfs.cpio.xz \
>> -drive 
>> id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof-nvram.bin,format=raw \
>> -global spapr-nvram.drive=DRIVE0 \
>> -snapshot \
>> -smp 8,threads=8 \
>> -L /home/aik/t/qemu-ppc64-bios/ \
>> -trace events=qemu_trace_events \
>> -d guest_errors \
>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
>> -mon chardev=SOCKET0,mode=control
>> 
>> ---
>> Changes:
>> v19:
>> * put bootargs in the FDT
>> * moved setting properties to a VOF machine hook
>> * moved fw_size and claim for it to vof_init()
>> * added CROSS to the VOF's makefile
>> * simplified phandles assigning
>> * pass MachineState to all machine hooks instead of calling
>> qdev_get_machine (following QOM)
>> * bunch of smaller changes and added comments
>> * added simple test to attempt to start with x-vof=on
>> 
>> v18:
>> * fixed top addr (max address for "claim") on radix - it equals to ram_size
>> and vof->top_addr was uint32_t
>> * fixed "available" property which got broken in v14 but it is only visible
>> to clients which care (== grub)
>> * reshuffled vof_dt_memory_available() calls, added vof_init() to allow
>> vof_claim() before rendering the FDT
>> 
>> v17:
>> * mv hw/ppc/vof.h include/hw/ppc/vof.h
>> * VofMachineIfClass -> VofMachineClass; it is not VofMachineInterface as
>> nobody used this scheme, usually "Interface" is dropped, a couple of times
>> it is "xxxInterfaceClass" or "xxxIfClass", as used the latter as it is
>> used by include/hw/vmstate-if.h
>> * added SPDX
>> * other fixes from v16 review
>> 
>> v16:
>> * rebased on dwg/ppc-for-6.1
>> * s/SpaprVofInterface/VofMachineInterface/
>> 
>> v15:
>> * bugfix: claimed memory for the VOF itself
>> * ditched OF_STACK_ADDR and allocate one instead, now it starts from 0x8000
>> because it is aligned to its size (no particular reason though)
>> * coding style
>> * moved nvram.bin up one level
>> * ditched bool in the firmware
>> * made debugging code conditional using trace_event_get_state() + 
>> qemu_loglevel_mask()
>> * renamed the CAS interface to SpaprVofInterface
>> * added "write" which for now dumps the message and ihandle via
>> trace point for early debug assistance
>> * commented on when we allocate of_instances in vof_build_dt()
>> * store fw_size is SpaprMachine to let spapr_vof_reset() claim it
>> * many small fixes from v14's review
>> 
>> v14:
>> * check for truncates in readstr()
>> * ditched a separate vof_reset()
>> * spapr->vof is a pointer now, dropped the "on" field
>> * removed rtas_base from vof and updated comment why we allow setting it
>> * added myself to maintainers
>> * updated commit log about blockdev and other possible platforms
>> * added a note why new hcall is 0x5
>> * no in place endianness convertion in spapr_h_vof_client
>> * converted all cpu_physical_memory_read/write to address_space_rw
>> * git mv hw/ppc/spapr_vof_client.c hw/ppc/spapr_vof.c
>> 
>> v13:
>> * rebase on latest ppc-for-6.0
>> * shuffled code around to touch spapr.c less
>> 
>> v12:
>> * split VOF and SPAPR
>> 
>> v11:
>> * added g_autofree
>> * fixed gcc warnings
>> * fixed few leaks
>> * added nvram image to make "nvram --print-config" not crash;
>> Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
>> is 16K, or it just does not work (empty output from "nvram")
>> 
>> v10:
>> * now rebased to compile with meson
>> 
>> v9:
>> * remove special handling of /rtas/rtas-size as now we always add it in 
>> QEMU
>> * removed leftovers from scsi/grub/stdout/stdin/...
>> 
>> v8:
>> * no read/write/seek
>> * no @dev in instances
>> * the machine flag is "x-vof" for now
>> 
>> v7:
>> * now we have a small firmware which loads at 0 as SLOF and starts from
>> 0x100 as SLOF
>> * no MBR/ELF/GRUB business in QEMU anymore
>> * blockdev is a separate patch
>> * networking is a separate patch
>> 
>> v6:
>> * borrowed a big chunk of commit log introduction from David
>> * fixed initial stack pointer (points to the highest address of stack)
>> * traces for "interpret" and others
>> * disabled  translate_kernel_address() hack so grub can load (work in
>> progress)
>> * added "milliseconds" for grub
>> * fixed "claim" allocator again
>> * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for CAS
>> * moved the most code possible from spapr.c to spapr_of_client.c, such as
>> RTAS, prom entry and FDT build/finalize
>> * separated blobs
>> * GRUB now proceeds to its console prompt (there are still other issues)
>> * parse MBR/GPT to find PReP and load GRUB
>> 
>> v5:
>> * made instances keep device and chardev pointers
>> * removed VIO dependencies
>> * print error if RTAS memory is not claimed as it should have been
>> * pack FDT as "quiesce"
>> 
>> v4:
>> * fixed open
>> * validate ihandles in "call-method"
>> 
>> v3:
>> * fixed phandles allocation
>> * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
>> * fixed size of /chosen/stdout
>> * bunch of renames
>> * do not create rtas properties at all, let the client deal with it;
>> instead setprop allows changing these in the FDT
>> * no more packing FDT when bios=off - nobody needs it and getprop does not
>> work otherwise
>> * allow updating initramdisk device tree properties (for zImage)
>> * added instances
>> * fixed stdout on OF's "write"
>> * removed special handling for stdout in OF client, spapr-vty handles it
>> instead
>> 
>> v2:
>> * fixed claim()
>> * added "setprop"
>> * cleaner client interface and RTAS blobs management
>> * boots to petitboot and further to the target system
>> * more trace points
>> ---
>> pc-bios/vof/Makefile    |  23 +
>> include/hw/ppc/spapr.h  |  19 +-
>> include/hw/ppc/vof.h    |  43 ++
>> pc-bios/vof/vof.h       |  43 ++
>> hw/ppc/spapr.c          |  68 ++-
>> hw/ppc/spapr_hcall.c    |  21 +-
>> hw/ppc/spapr_vof.c      | 208 +++++++++
>> hw/ppc/vof.c            | 934 ++++++++++++++++++++++++++++++++++++++++
>> pc-bios/vof/bootmem.c   |  14 +
>> pc-bios/vof/ci.c        |  91 ++++
>> pc-bios/vof/libc.c      |  92 ++++
>> pc-bios/vof/main.c      |  21 +
>> tests/qtest/rtas-test.c |  15 +-
>> MAINTAINERS             |  12 +
>> hw/ppc/meson.build      |   2 +
>> hw/ppc/trace-events     |  24 ++
>> pc-bios/README          |   2 +
>> pc-bios/vof-nvram.bin   | Bin 0 -> 16384 bytes
>> pc-bios/vof.bin         | Bin 0 -> 3128 bytes
>> pc-bios/vof/entry.S     |  51 +++
>> pc-bios/vof/l.lds       |  48 +++
>> 21 files changed, 1720 insertions(+), 11 deletions(-)
>> create mode 100644 pc-bios/vof/Makefile
>> create mode 100644 include/hw/ppc/vof.h
>> create mode 100644 pc-bios/vof/vof.h
>> create mode 100644 hw/ppc/spapr_vof.c
>> create mode 100644 hw/ppc/vof.c
>> create mode 100644 pc-bios/vof/bootmem.c
>> create mode 100644 pc-bios/vof/ci.c
>> create mode 100644 pc-bios/vof/libc.c
>> create mode 100644 pc-bios/vof/main.c
>> create mode 100644 pc-bios/vof-nvram.bin
>> create mode 100755 pc-bios/vof.bin
>> create mode 100644 pc-bios/vof/entry.S
>> create mode 100644 pc-bios/vof/l.lds
>> 
>> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
>> new file mode 100644
>> index 000000000000..a32fe6d5f24d
>> --- /dev/null
>> +++ b/pc-bios/vof/Makefile
>> @@ -0,0 +1,23 @@
>> +all: build-all
>> +
>> +build-all: vof.bin
>> +
>> +CROSS ?=
>> +CC = $(CROSS)gcc
>> +LD = $(CROSS)ld
>> +OBJCOPY = $(CROSS)objcopy
>> +
>> +%.o: %.S
>> +	$(CC) -m32 -mbig-endian -c -o $@ $<
>> +
>> +%.o: %.c
>> +	$(CC) -m32 -mbig-endian -c -fno-stack-protector -o $@ $<
>> +
>> +vof.elf: entry.o main.o ci.o bootmem.o libc.o
>> +	$(LD) -nostdlib -e_start -Tl.lds -EB -o $@ $^
>> +
>> +%.bin: %.elf
>> +	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
>> +
>> +clean:
>> +	rm -f *.o vof.bin vof.elf *~
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index d2b5a9bdf9f5..13db2c7598f5 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -12,6 +12,7 @@
>> #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
>> #include "hw/ppc/xics.h"        /* For ICSState */
>> #include "hw/ppc/spapr_tpm_proxy.h"
>> +#include "hw/ppc/vof.h"
>> 
>> struct SpaprVioBus;
>> struct SpaprPhbState;
>> @@ -180,6 +181,7 @@ struct SpaprMachineState {
>>     uint64_t kernel_addr;
>>     uint32_t initrd_base;
>>     long initrd_size;
>> +    Vof *vof;
>>     uint64_t rtc_offset; /* Now used only during incoming migration */
>>     struct PPCTimebase tb;
>>     bool has_graphics;
>> @@ -555,7 +557,9 @@ struct SpaprMachineState {
>> /* Client Architecture support */
>> #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
>> #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
>> -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
>> +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
>> +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
>> +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
>> 
>> /*
>>  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
>> @@ -946,4 +950,17 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, 
>> hwaddr pagesize,
>> void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>> hwaddr spapr_get_rtas_addr(void);
>> bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>> +
>> +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
>> +                     target_ulong *stack_ptr, Error **errp);
>> +void spapr_vof_quiesce(MachineState *ms);
>> +bool spapr_vof_setprop(MachineState *ms, const char *path, const char 
>> *propname,
>> +                       void *val, int vallen);
>> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
>> +                                target_ulong opcode, target_ulong *args);
>> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>> +                                                   CPUState *cs,
>> +                                                   target_ulong 
>> ovec_addr);
>> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
>> +
>> #endif /* HW_SPAPR_H */
>> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
>> new file mode 100644
>> index 000000000000..bb657116b30c
>> --- /dev/null
>> +++ b/include/hw/ppc/vof.h
>> @@ -0,0 +1,43 @@
>> +/*
>> + * Virtual Open Firmware
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#ifndef HW_VOF_H
>> +#define HW_VOF_H
>> +
>> +typedef struct Vof {
>> +    uint64_t top_addr; /* copied from rma_size */
>> +    GArray *claimed; /* array of SpaprOfClaimed */
>> +    uint64_t claimed_base;
>> +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
>> +    uint32_t of_instance_last;
>> +    char *bootargs;
>> +    long fw_size;
>> +} Vof;
>> +
>> +uint32_t vof_client_call(MachineState *ms, void *fdt, Vof *vof,
>> +                         const char *service, uint32_t *args, unsigned 
>> nargs,
>> +                         uint32_t *rets, unsigned nrets);
>> +uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t 
>> align);
>> +void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
>> +void vof_cleanup(Vof *vof);
>> +void vof_build_dt(void *fdt, Vof *vof);
>> +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
>> +                               const char *prop, const char *path);
>> +
>> +#define TYPE_VOF_MACHINE_IF "vof-machine-if"
>> +
>> +typedef struct VofMachineIfClass VofMachineIfClass;
>> +DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, 
>> TYPE_VOF_MACHINE_IF)
>> +
>> +struct VofMachineIfClass {
>> +    InterfaceClass parent;
>> +    target_ulong (*client_architecture_support)(MachineState *ms, CPUState 
>> *cs,
>> +                                                target_ulong vec);
>> +    void (*quiesce)(MachineState *ms);
>> +    bool (*setprop)(MachineState *ms, const char *path, const char 
>> *propname,
>> +                    void *val, int vallen);
>> +};
>> +
>> +#endif /* HW_VOF_H */
>> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
>> new file mode 100644
>> index 000000000000..2d8958076907
>> --- /dev/null
>> +++ b/pc-bios/vof/vof.h
>> @@ -0,0 +1,43 @@
>> +/*
>> + * Virtual Open Firmware
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#include <stdarg.h>
>> +
>> +typedef unsigned char uint8_t;
>> +typedef unsigned short uint16_t;
>> +typedef unsigned long uint32_t;
>> +typedef unsigned long long uint64_t;
>> +#define NULL (0)
>> +#define PROM_ERROR (-1u)
>> +typedef unsigned long ihandle;
>> +typedef unsigned long phandle;
>> +typedef int size_t;
>> +typedef void client(void);
>> +
>> +/* globals */
>> +extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware) 
>> */
>> +
>> +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
>> +
>> +/* libc */
>> +int strlen(const char *s);
>> +int strcmp(const char *s1, const char *s2);
>> +void *memcpy(void *dest, const void *src, size_t n);
>> +int memcmp(const void *ptr1, const void *ptr2, size_t n);
>> +void *memmove(void *dest, const void *src, size_t n);
>> +void *memset(void *dest, int c, size_t size);
>> +
>> +/* CI wrappers */
>> +void ci_panic(const char *str);
>> +phandle ci_finddevice(const char *path);
>> +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int 
>> len);
>> +
>> +/* booting from -kernel */
>> +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
>> +
>> +/* Entry points for CI and RTAS */
>> +extern uint32_t ci_entry(uint32_t params);
>> +extern unsigned long hv_rtas(unsigned long params);
>> +extern unsigned int hv_rtas_size;
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index ea76f72f1b88..b334934afa5e 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -103,6 +103,7 @@
>> #define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>> #define FW_MAX_SIZE             0x400000
>> #define FW_FILE_NAME            "slof.bin"
>> +#define FW_FILE_NAME_VOF        "vof.bin"
>> #define FW_OVERHEAD             0x2800000
>> #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
>> 
>> @@ -1625,22 +1626,37 @@ static void spapr_machine_reset(MachineState 
>> *machine)
>>
>>     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>> 
>> -    rc = fdt_pack(fdt);
>> +    if (spapr->vof) {
>> +        target_ulong stack_ptr = 0;
>> 
>> -    /* Should only fail if we've built a corrupted tree */
>> -    assert(rc == 0);
>> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
>> 
>> -    /* Load the fdt */
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  stack_ptr, spapr->initrd_base,
>> +                                  spapr->initrd_size);
>> +        /* We do not pack the FDT as the client may change properties. */
>> +    } else {
>> +        rc = fdt_pack(fdt);
>> +        /* Should only fail if we've built a corrupted tree */
>> +        assert(rc == 0);
>> +
>> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
>> +                                  0, fdt_addr, 0);
>> +    }
>>     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>> -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
>> +
>>     g_free(spapr->fdt_blob);
>>     spapr->fdt_size = fdt_totalsize(fdt);
>>     spapr->fdt_initial_size = spapr->fdt_size;
>>     spapr->fdt_blob = fdt;
>>
>>     /* Set up the entry state */
>> -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, 
>> fdt_addr, 0);
>>     first_ppc_cpu->env.gpr[5] = 0;
>> +    /* VOF client does not expect the FDT so we do not load it to the VM. 
>> */
>> +    if (!spapr->vof) {
>> +        /* Load the fdt */
>> +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, 
>> spapr->fdt_size);
>> +    }
>>
>>     spapr->fwnmi_system_reset_addr = -1;
>>     spapr->fwnmi_machine_check_addr = -1;
>> @@ -2640,7 +2656,8 @@ static void spapr_machine_init(MachineState *machine)
>>     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
>>     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>> -    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
>> +    const char *bios_default = !!spapr->vof ? FW_FILE_NAME_VOF : 
>> FW_FILE_NAME;
>> +    const char *bios_name = machine->firmware ?: bios_default;
>>     const char *kernel_filename = machine->kernel_filename;
>>     const char *initrd_filename = machine->initrd_filename;
>>     PCIHostState *phb;
>> @@ -2997,6 +3014,11 @@ static void spapr_machine_init(MachineState 
>> *machine)
>>     }
>>
>>     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
>> +
>> +    if (spapr->vof) {
>> +        spapr->vof->fw_size = fw_size;
>> +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
>> +    }
>> }
>> 
>> #define DEFAULT_KVM_TYPE "auto"
>> @@ -3187,6 +3209,28 @@ static void spapr_set_resize_hpt(Object *obj, const 
>> char *value, Error **errp)
>>     }
>> }
>> 
>> +static bool spapr_get_vof(Object *obj, Error **errp)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> +
>> +    return spapr->vof != NULL;
>> +}
>> +
>> +static void spapr_set_vof(Object *obj, bool value, Error **errp)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> +
>> +    if (spapr->vof) {
>> +        vof_cleanup(spapr->vof);
>> +        g_free(spapr->vof);
>> +        spapr->vof = NULL;
>> +    }
>> +    if (!value) {
>> +        return;
>> +    }
>> +    spapr->vof = g_malloc0(sizeof(*spapr->vof));
>> +}
>> +
>> static char *spapr_get_ic_mode(Object *obj, Error **errp)
>> {
>>     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>> @@ -3312,6 +3356,10 @@ static void spapr_instance_init(Object *obj)
>>                                     stringify(KERNEL_LOAD_ADDR)
>>                                     " for -kernel is the default");
>>     spapr->kernel_addr = KERNEL_LOAD_ADDR;
>> +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
>> +    object_property_set_description(obj, "x-vof",
>> +                                    "Enable Virtual Open Firmware 
>> (experimental)");
>> +
>>     /* The machine class defines the default interrupt controller mode */
>>     spapr->irq = smc->irq;
>>     object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
>> @@ -4475,6 +4523,7 @@ static void spapr_machine_class_init(ObjectClass *oc, 
>> void *data)
>>     XICSFabricClass *xic = XICS_FABRIC_CLASS(oc);
>>     InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
>>     XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
>> +    VofMachineIfClass *vmc = VOF_MACHINE_CLASS(oc);
>>
>>     mc->desc = "pSeries Logical Partition (PAPR compliant)";
>>     mc->ignore_boot_device_suffixes = true;
>> @@ -4554,6 +4603,10 @@ static void spapr_machine_class_init(ObjectClass 
>> *oc, void *data)
>>     smc->smp_threads_vsmt = true;
>>     smc->nr_xirqs = SPAPR_NR_XIRQS;
>>     xfc->match_nvt = spapr_match_nvt;
>> +
>> +    vmc->client_architecture_support = 
>> spapr_vof_client_architecture_support;
>> +    vmc->quiesce = spapr_vof_quiesce;
>> +    vmc->setprop = spapr_vof_setprop;
>> }
>> 
>> static const TypeInfo spapr_machine_info = {
>> @@ -4573,6 +4626,7 @@ static const TypeInfo spapr_machine_info = {
>>         { TYPE_XICS_FABRIC },
>>         { TYPE_INTERRUPT_STATS_PROVIDER },
>>         { TYPE_XIVE_FABRIC },
>> +        { TYPE_VOF_MACHINE_IF },
>>         { }
>>     },
>> };
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 7b5cd3553c26..3081b42bedc0 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1806,7 +1806,7 @@ target_ulong 
>> do_client_architecture_support(PowerPCCPU *cpu,
>>         spapr_setup_hpt(spapr);
>>     }
>> 
>> -    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
>> +    fdt = spapr_build_fdt(spapr, spapr->vof != NULL, fdt_bufsize);
>>
>>     g_free(spapr->fdt_blob);
>>     spapr->fdt_size = fdt_totalsize(fdt);
>> @@ -1850,6 +1850,25 @@ static target_ulong 
>> h_client_architecture_support(PowerPCCPU *cpu,
>>     return ret;
>> }
>> 
>> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
>> +                                                   CPUState *cs,
>> +                                                   target_ulong ovec_addr)
>> +{
>> +    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
>> +
>> +    target_ulong ret = do_client_architecture_support(POWERPC_CPU(cs), 
>> spapr,
>> +                                                      ovec_addr, 
>> FDT_MAX_SIZE);
>> +
>> +    /*
>> +     * This adds stdout and generates phandles for boottime and CAS FDTs.
>> +     * It is alright to update the FDT here as 
>> do_client_architecture_support()
>> +     * does not pack it.
>> +     */
>> +    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
>> +
>> +    return ret;
>> +}
>> +
>> static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
>>                                               SpaprMachineState *spapr,
>>                                               target_ulong opcode,
>> diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
>> new file mode 100644
>> index 000000000000..0d9e0d01c3a2
>> --- /dev/null
>> +++ b/hw/ppc/spapr_vof.c
>> @@ -0,0 +1,208 @@
>> +/*
>> + * SPAPR machine hooks to Virtual Open Firmware,
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#include "qemu/osdep.h"
>> +#include "qemu-common.h"
>> +#include <sys/ioctl.h>
>> +#include "qapi/error.h"
>> +#include "hw/ppc/spapr.h"
>> +#include "hw/ppc/spapr_vio.h"
>> +#include "hw/ppc/fdt.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qom/qom-qobject.h"
>> +#include "trace.h"
>> +
>> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
>> +#define OF_STACK_SIZE       0x8000
>> +
>> +/* Defined as Big Endian */
>> +struct prom_args {
>> +    uint32_t service;
>> +    uint32_t nargs;
>> +    uint32_t nret;
>> +    uint32_t args[10];
>> +} QEMU_PACKED;
>
> This #define and struct definition should probably be moved to 
> include/hw/ppc/vof.h as I had to copy these when trying to get VOF running 
> with pegasos2 and these seem to be VOF specific not spapr.
>
> I was trying to wire up VOF on pegasos2 as proof of concept but I did not get 
> very far as it crashed at the first move due to using mtmsrd which does not 
> exist on the 32 bit CPUs (G4 or G3) used by pegasos2:
>
> vof_claim virt=0x0 size=0xc38 align=0x0 => 0x0
> vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
> vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
> vof_claimed 0x0..0xc38 size=0xc38
> vof_claimed 0x8000..0x10000 size=0x8000
> vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
> vof_avail 0xc38..0x8000 size=0x73c8
> vof_avail 0x10000..0xc00000 size=0xbf0000
> vof_avail 0xd8fd62..0x20000000 size=0x1f27029e
> via_superio_cfg: unimplemented register 0xf2
> via_superio_cfg: unimplemented register 0xf4
> via_superio_cfg: unimplemented register 0xf6
> via_superio_cfg: unimplemented register 0xf7
> invalid/unsupported opcode: 1f - 12 - 05 - 00 (7fe00164) fff00108 0
> ----------------
> IN:
> 0xfff00100:  3fe00000  lis      r31, 0
> 0xfff00104:  63ff0000  ori      r31, r31, 0
> 0xfff00108:  7fe00164  mtmsrd   r31
>
> ----------------
> IN:
> 0xfff00700:  807e8020  lwz      r3, -0x7fe0(r30)
> 0xfff00704:  4cc63182  crclr    6
> 0xfff00708:  4bfffd1d  bl       0xfff00424
>
> Invalid access at addr 0xFFFF8020, size 4, region '(null)', reason: rejected
>
> Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit mode? I'd 
> expect them to be in compatibility mode unless 64 bit is enabled but I did 
> not check the docs. If it's needed maybe a dummy handler has to be at 0x700 
> to ignore this exception if it's running on a 32-bit CPU.
>
> By the way does vof need to be loaded at addr 0 or it could work at the 
> default ROM address as well? That would simplify usage if it could run 
> position independent.

Just for the sake of experimenting I've patched out the mtmsrd for now 
from vof.bin and got a bit further to the point that it's trying to do 
hypercalls now but there must be something wrong with decoding the 
parameters as I'm getting:

IN:
0xfff00590:  393f000c  addi     r9, r31, 0xc
0xfff00594:  7d234b78  mr       r3, r9
0xfff00598:  4bfffbad  bl       0xfff00144

----------------
IN:
0xfff00144:  7c641b78  mr       r4, r3
0xfff00148:  3c600000  lis      r3, 0
0xfff0014c:  6063f005  ori      r3, r3, 0xf005
0xfff00150:  44000022  sc       1

Raise exception at fff00150 => 00000008 (01)
hypercall r3=000000000000f005 r4=000000000000fe7c r5=0000000000000001 r6=0000000000000be8 r7=0000000000000000 r8=000000000000fe78 r9=000000000000fe7c r10=0000000000000001 r11=0000000000000000 r12=0000000000000000 nip=fff00150
vof_error_unknown_service "" args=1 rets=1

(This is the first hypercall vof does, did not check what this should be.) 
I've basically blindly copied spapr_h_vof_client() from spapr_vof.c but I 
only vagely understand what it tries to do. Since I did not have 
ppc64_phys_to_real() on the 32-bit PPC CPU pegasos2 is using I've just 
dropped that and using _args[0] as args_real but maybe that's wrong and it 
needs some conversion? For other hypercalls later I get same result with 
service being empty while args and rets change. Any idea what I could be 
missing or how to debug it?

One thing I don't get is how it will find the kernel entry point to start 
executing? Does it have to be in the device tree somewhere or it expects a 
fixed address? (I could probably find out from the source but it's easier 
to ask.)

Regards,
BALATON Zoltan

