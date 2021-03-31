Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5738134F5B5
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 03:05:47 +0200 (CEST)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRPIo-0004eM-Dv
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 21:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRPH6-0003Tr-3b; Tue, 30 Mar 2021 21:04:00 -0400
Received: from ozlabs.org ([203.11.71.1]:48573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRPH1-00047u-4E; Tue, 30 Mar 2021 21:03:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F97P16Pydz9sVm; Wed, 31 Mar 2021 12:03:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617152629;
 bh=/kMgxIn/23roXTujgEqLMilPHZkv5586PWfZ4KIiE9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V0a78eq21XTuzfxys124bksFkuK9gGlGciEO1ALPQsVwgokYPq8AYb7b4yvBVX1Wx
 QlVOxgfS+APBYOfO7TL5SCL8BPYin0EM6uM+FBKQB9JQD55o9aB1dQ96CTeDX2rzJG
 Ud1FnX3XZz3zchJx3gR5H/PEp5wNvnunFOCUgpxo=
Date: Wed, 31 Mar 2021 12:03:44 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v16] spapr: Implement Open Firmware client interface
Message-ID: <YGPKcKqPtKCTdMCi@yekko.fritz.box>
References: <20210323025830.104781-1-aik@ozlabs.ru>
 <YFv69rtZd6yzKAtU@yekko.fritz.box>
 <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XSgN6dg+WEIDfjh+"
Content-Disposition: inline
In-Reply-To: <98565b10-debd-be0a-79f7-9f08737a49d1@ozlabs.ru>
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


--XSgN6dg+WEIDfjh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 02:25:33PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 25/03/2021 13:52, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 01:58:30PM +1100, Alexey Kardashevskiy wrote:
> > > The PAPR platform which describes an OS environment that's presented =
by
> > > a combination of a hypervisor and firmware. The features it specifies
> > > require collaboration between the firmware and the hypervisor.
> > >=20
> > > Since the beginning, the runtime component of the firmware (RTAS) has
> > > been implemented as a 20 byte shim which simply forwards it to
> > > a hypercall implemented in qemu. The boot time firmware component is
> > > SLOF - but a build that's specific to qemu, and has always needed to =
be
> > > updated in sync with it. Even though we've managed to limit the amount
> > > of runtime communication we need between qemu and SLOF, there's some,
> > > and it has become increasingly awkward to handle as we've implemented
> > > new features.
> > >=20
> > > This implements a boot time OF client interface (CI) which is
> > > enabled by a new "x-vof" pseries machine option (stands for "Virtual =
Open
> > > Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> > > which implements Open Firmware Client Interface (OF CI). This allows
> > > using a smaller stateless firmware which does not have to manage
> > > the device tree.
> > >=20
> > > The new "vof.bin" firmware image is included with source code under
> > > pc-bios/. It also includes RTAS blob.
> > >=20
> > > This implements a handful of CI methods just to get -kernel/-initrd
> > > working. In particular, this implements the device tree fetching and
> > > simple memory allocator - "claim" (an OF CI memory allocator) and upd=
ates
> > > "/memory@0/available" to report the client about available memory.
> > >=20
> > > This implements changing some device tree properties which we know how
> > > to deal with, the rest is ignored. To allow changes, this skips
> > > fdt_pack() when x-vof=3Don as not packing the blob leaves some room f=
or
> > > appending.
> > >=20
> > > In absence of SLOF, this assigns phandles to device tree nodes to make
> > > device tree traversing work.
> > >=20
> > > When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds a tre=
e.
> > >=20
> > > This adds basic instances support which are managed by a hash map
> > > ihandle -> [phandle].
> > >=20
> > > Before the guest started, the used memory is:
> > > 0..e60 - the initial firmware
> > > 8000..10000 - stack
> > > 400000.. - kernel
> > > 3ea0000.. - initramdisk
> > >=20
> > > This OF CI does not implement "interpret".
> > >=20
> > > Unlike SLOF, this does not format uninitialized nvram. Instead, this
> > > includes a disk image with pre-formatted nvram.
> > >=20
> > > With this basic support, this can only boot into kernel directly.
> > > However this is just enough for the petitboot kernel and initradmdisk=
 to
> > > boot from any possible source. Note this requires reasonably recent g=
uest
> > > kernel with:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3Ddf5be5be8735
> > >=20
> > > The immediate benefit is much faster booting time which especially
> > > crucial with fully emulated early CPU bring up environments. Also this
> > > may come handy when/if GRUB-in-the-userspace sees light of the day.
> > >=20
> > > This separates VOF and sPAPR in a hope that VOF bits may be reused by
> > > other POWERPC boards which do not support pSeries.
> > >=20
> > > This is coded in assumption that later on we might be adding support =
for
> > > booting from QEMU backends (blockdev is the first candidate) without
> > > devices/drivers in between as OF1275 does not require that and
> > > it is quite easy to so.
> > >=20
> > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >=20
> > I have some comments below, but they're basically all trivial at this
> > point.  We've missed qemu-6.0 obviously, but I'm hoping I can merge
> > the next spin to my ppc-for-6.1 tree.
> >=20
> > > ---
> > >=20
> > > The example command line is:
> > >=20
> > > /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> > > -nodefaults \
> > > -chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \
> > > -device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \
> > > -mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \
> > > -nographic \
> > > -vga none \
> > > -enable-kvm \
> > > -m 2G \
> > > -machine pseries,x-vof=3Don,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-i=
bs=3Dbroken,cap-ccf-assist=3Doff \
> > > -kernel pbuild/kernel-le-guest/vmlinux \
> > > -initrd pb/rootfs.cpio.xz \
> > > -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof-nvr=
am.bin,format=3Draw \
> >=20
> > Removing the need for a prebuild NVRAM image is something I'd like to
> > see as a followup.
>=20
>=20
> We do not _need_ NVRAM in the VM to begin with, or is this a requirement?

Actually.. I'm not certain.

> The whole VOF thing is more like a hack and I do not recall myself on doi=
ng
> anything useful with NVRAM.
>=20
> If we really need it, then when to format it - in QEMU or VOF.bin? This
> alone will trigger a (lengthy) discussion :)

I prefer qemu, but we can worry about that later.

> > > -global spapr-nvram.drive=3DDRIVE0 \
> > > -snapshot \
> > > -smp 8,threads=3D8 \
> > > -L /home/aik/t/qemu-ppc64-bios/ \
> > > -trace events=3Dqemu_trace_events \
> > > -d guest_errors \
> > > -chardev socket,id=3DSOCKET0,server,nowait,path=3Dqemu.mon.tmux26 \
> > > -mon chardev=3DSOCKET0,mode=3Dcontrol
> > >=20
> > > ---
> > > Changes:
> > > v16:
> > > * rebased on dwg/ppc-for-6.1
> > > * s/SpaprVofInterface/VofMachineInterface/
> > >=20
> > > v15:
> > > * bugfix: claimed memory for the VOF itself
> > > * ditched OF_STACK_ADDR and allocate one instead, now it starts from =
0x8000
> > > because it is aligned to its size (no particular reason though)
> > > * coding style
> > > * moved nvram.bin up one level
> > > * ditched bool in the firmware
> > > * made debugging code conditional using trace_event_get_state() + qem=
u_loglevel_mask()
> > > * renamed the CAS interface to SpaprVofInterface
> > > * added "write" which for now dumps the message and ihandle via
> > > trace point for early debug assistance
> > > * commented on when we allocate of_instances in vof_build_dt()
> > > * store fw_size is SpaprMachine to let spapr_vof_reset() claim it
> > > * many small fixes from v14's review
> > >=20
> > > v14:
> > > * check for truncates in readstr()
> > > * ditched a separate vof_reset()
> > > * spapr->vof is a pointer now, dropped the "on" field
> > > * removed rtas_base from vof and updated comment why we allow setting=
 it
> > > * added myself to maintainers
> > > * updated commit log about blockdev and other possible platforms
> > > * added a note why new hcall is 0x5
> > > * no in place endianness convertion in spapr_h_vof_client
> > > * converted all cpu_physical_memory_read/write to address_space_rw
> > > * git mv hw/ppc/spapr_vof_client.c hw/ppc/spapr_vof.c
> > >=20
> > > v13:
> > > * rebase on latest ppc-for-6.0
> > > * shuffled code around to touch spapr.c less
> > >=20
> > > v12:
> > > * split VOF and SPAPR
> > >=20
> > > v11:
> > > * added g_autofree
> > > * fixed gcc warnings
> > > * fixed few leaks
> > > * added nvram image to make "nvram --print-config" not crash;
> > > Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum s=
ize
> > > is 16K, or it just does not work (empty output from "nvram")
> > >=20
> > > v10:
> > > * now rebased to compile with meson
> > >=20
> > > v9:
> > > * remove special handling of /rtas/rtas-size as now we always add it =
in QEMU
> > > * removed leftovers from scsi/grub/stdout/stdin/...
> > >=20
> > > v8:
> > > * no read/write/seek
> > > * no @dev in instances
> > > * the machine flag is "x-vof" for now
> > >=20
> > > v7:
> > > * now we have a small firmware which loads at 0 as SLOF and starts fr=
om
> > > 0x100 as SLOF
> > > * no MBR/ELF/GRUB business in QEMU anymore
> > > * blockdev is a separate patch
> > > * networking is a separate patch
> > >=20
> > > v6:
> > > * borrowed a big chunk of commit log introduction from David
> > > * fixed initial stack pointer (points to the highest address of stack)
> > > * traces for "interpret" and others
> > > * disabled  translate_kernel_address() hack so grub can load (work in
> > > progress)
> > > * added "milliseconds" for grub
> > > * fixed "claim" allocator again
> > > * moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for=
 CAS
> > > * moved the most code possible from spapr.c to spapr_of_client.c, suc=
h as
> > > RTAS, prom entry and FDT build/finalize
> > > * separated blobs
> > > * GRUB now proceeds to its console prompt (there are still other issu=
es)
> > > * parse MBR/GPT to find PReP and load GRUB
> > >=20
> > > v5:
> > > * made instances keep device and chardev pointers
> > > * removed VIO dependencies
> > > * print error if RTAS memory is not claimed as it should have been
> > > * pack FDT as "quiesce"
> > >=20
> > > v4:
> > > * fixed open
> > > * validate ihandles in "call-method"
> > >=20
> > > v3:
> > > * fixed phandles allocation
> > > * s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
> > > * fixed size of /chosen/stdout
> > > * bunch of renames
> > > * do not create rtas properties at all, let the client deal with it;
> > > instead setprop allows changing these in the FDT
> > > * no more packing FDT when bios=3Doff - nobody needs it and getprop d=
oes not
> > > work otherwise
> > > * allow updating initramdisk device tree properties (for zImage)
> > > * added instances
> > > * fixed stdout on OF's "write"
> > > * removed special handling for stdout in OF client, spapr-vty handles=
 it
> > > instead
> > >=20
> > > v2:
> > > * fixed claim()
> > > * added "setprop"
> > > * cleaner client interface and RTAS blobs management
> > > * boots to petitboot and further to the target system
> > > * more trace points
> > > ---
> > >   pc-bios/vof/Makefile   |  18 +
> > >   hw/ppc/vof.h           |  37 ++
> > >   include/hw/ppc/spapr.h |  17 +-
> > >   pc-bios/vof/vof.h      |  38 ++
> > >   hw/ppc/spapr.c         |  83 +++-
> > >   hw/ppc/spapr_hcall.c   |  26 +-
> > >   hw/ppc/spapr_vof.c     | 148 +++++++
> > >   hw/ppc/vof.c           | 982 ++++++++++++++++++++++++++++++++++++++=
+++
> > >   pc-bios/vof/bootmem.c  |  14 +
> > >   pc-bios/vof/ci.c       |  91 ++++
> > >   pc-bios/vof/libc.c     |  92 ++++
> > >   pc-bios/vof/main.c     |  21 +
> > >   MAINTAINERS            |  11 +
> > >   hw/ppc/meson.build     |   2 +
> > >   hw/ppc/trace-events    |  24 +
> > >   pc-bios/README         |   2 +
> > >   pc-bios/vof-nvram.bin  | Bin 0 -> 16384 bytes
> > >   pc-bios/vof.bin        | Bin 0 -> 3128 bytes
> > >   pc-bios/vof/entry.S    |  51 +++
> > >   pc-bios/vof/l.lds      |  48 ++
> > >   20 files changed, 1693 insertions(+), 12 deletions(-)
> > >   create mode 100644 pc-bios/vof/Makefile
> > >   create mode 100644 hw/ppc/vof.h
> > >   create mode 100644 pc-bios/vof/vof.h
> > >   create mode 100644 hw/ppc/spapr_vof.c
> > >   create mode 100644 hw/ppc/vof.c
> > >   create mode 100644 pc-bios/vof/bootmem.c
> > >   create mode 100644 pc-bios/vof/ci.c
> > >   create mode 100644 pc-bios/vof/libc.c
> > >   create mode 100644 pc-bios/vof/main.c
> > >   create mode 100644 pc-bios/vof-nvram.bin
> > >   create mode 100755 pc-bios/vof.bin
> > >   create mode 100644 pc-bios/vof/entry.S
> > >   create mode 100644 pc-bios/vof/l.lds
> > >=20
> > > diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> > > new file mode 100644
> > > index 000000000000..1451e0551818
> > > --- /dev/null
> > > +++ b/pc-bios/vof/Makefile
> > > @@ -0,0 +1,18 @@
> > > +all: build-all
> > > +
> > > +build-all: vof.bin
> > > +
> > > +%.o: %.S
> > > +	cc -m32 -mbig-endian -c -o $@ $<
> > > +
> > > +%.o: %.c
> > > +	cc -m32 -mbig-endian -c -fno-stack-protector -o $@ $<
> > > +
> > > +vof.elf: entry.o main.o ci.o bootmem.o libc.o
> > > +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
> > > +
> > > +%.bin: %.elf
> > > +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> > > +
> > > +clean:
> > > +	rm -f *.o vof.bin vof.elf *~
> > > diff --git a/hw/ppc/vof.h b/hw/ppc/vof.h
> >=20
> > Qemu conventions meant this should be in include/hw/ppc/vof.h.
> >=20
> > > new file mode 100644
> > > index 000000000000..fc397e4e0c9b
> > > --- /dev/null
> > > +++ b/hw/ppc/vof.h
> > > @@ -0,0 +1,37 @@
> > > + /* Virtual Open Firmware */
> > > +#ifndef HW_VOF_H
> > > +#define HW_VOF_H
> >=20
> > Probably worth adding an SPDX-License-Identifier line, just for
> > completeness.
> >=20
> > > +
> > > +typedef struct Vof {
> > > +    uint32_t top_addr; /* copied from rma_size */
> > > +    GArray *claimed; /* array of SpaprOfClaimed */
> > > +    uint64_t claimed_base;
> > > +    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
> > > +    uint32_t of_instance_last;
> > > +    char *bootargs;
> > > +    uint32_t initrd_base; /* Updated in spapr at CAS */
> > > +    long initrd_size; /* Updated in spapr at CAS */
> > > +} Vof;
> > > +
> > > +uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
> > > +                         uint32_t *args, unsigned nargs,
> > > +                         uint32_t *rets, unsigned nrets);
> > > +uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
> > > +                   uint64_t align);
> > > +void vof_cleanup(Vof *vof);
> > > +void vof_build_dt(void *fdt, Vof *vof, uint32_t top_addr);
> > > +uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *node=
name,
> > > +                               const char *prop, const char *path);
> > > +
> > > +#define TYPE_VOF_MACHINE "vof-machine"
> > > +
> > > +typedef struct VofMachineClass VofMachineClass;
> >=20
> > Probably call this VofMachineInterface rather than VofMachineClass.
> >=20
> > > +DECLARE_CLASS_CHECKERS(VofMachineClass, VOF_MACHINE, TYPE_VOF_MACHIN=
E)
> > > +
> > > +struct VofMachineClass {
> > > +    InterfaceClass parent;
> > > +    target_ulong (*client_architecture_support)(CPUState *cs, target=
_ulong vec);
> > > +    void (*quiesce)(void);
> > > +};
> > > +
> > > +#endif /* HW_VOF_H */
> > > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > > index bf7cab7a2ce1..3cb121dae707 100644
> > > --- a/include/hw/ppc/spapr.h
> > > +++ b/include/hw/ppc/spapr.h
> > > @@ -12,6 +12,7 @@
> > >   #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
> > >   #include "hw/ppc/xics.h"        /* For ICSState */
> > >   #include "hw/ppc/spapr_tpm_proxy.h"
> > > +#include "hw/ppc/vof.h"
> > >   struct SpaprVioBus;
> > >   struct SpaprPhbState;
> > > @@ -180,6 +181,8 @@ struct SpaprMachineState {
> > >       uint64_t kernel_addr;
> > >       uint32_t initrd_base;
> > >       long initrd_size;
> > > +    long fw_size;
> > > +    Vof *vof;
> > >       uint64_t rtc_offset; /* Now used only during incoming migration=
 */
> > >       struct PPCTimebase tb;
> > >       bool has_graphics;
> > > @@ -554,7 +557,9 @@ struct SpaprMachineState {
> > >   /* Client Architecture support */
> > >   #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
> > >   #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
> > > -#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
> > > +/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
> > > +#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
> > > +#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
> > >   /*
> > >    * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilita=
ting
> > > @@ -945,4 +950,14 @@ bool spapr_check_pagesize(SpaprMachineState *spa=
pr, hwaddr pagesize,
> > >   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
> > >   hwaddr spapr_get_rtas_addr(void);
> > >   bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> > > +
> > > +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> > > +                     target_ulong *stack_ptr, Error **errp);
> > > +void spapr_vof_quiesce(void);
> > > +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *=
spapr,
> > > +                                target_ulong opcode, target_ulong *a=
rgs);
> > > +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
> > > +                                                   target_ulong ovec=
_addr);
> > > +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fd=
t);
> > > +
> > >   #endif /* HW_SPAPR_H */
> > > diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
> > > new file mode 100644
> > > index 000000000000..29c80374d6dd
> > > --- /dev/null
> > > +++ b/pc-bios/vof/vof.h
> > > @@ -0,0 +1,38 @@
> >=20
> > Especially as some guest code that's a bit more separated from the
> > qemu core, it's probably worth putting an SPDX line here.
> >=20
> > > +#include <stdarg.h>
> > > +
> > > +typedef unsigned char uint8_t;
> > > +typedef unsigned short uint16_t;
> > > +typedef unsigned long uint32_t;
> > > +typedef unsigned long long uint64_t;
> > > +#define NULL (0)
> > > +#define PROM_ERROR (-1u)
> > > +typedef unsigned long ihandle;
> > > +typedef unsigned long phandle;
> > > +typedef int size_t;
> > > +typedef void client(void);
> > > +
> > > +/* globals */
> > > +extern void _prom_entry(void); /* OF CI entry point (i.e. this firmw=
are) */
> > > +
> > > +void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
> > > +
> > > +/* libc */
> > > +int strlen(const char *s);
> > > +int strcmp(const char *s1, const char *s2);
> > > +void *memcpy(void *dest, const void *src, size_t n);
> > > +int memcmp(const void *ptr1, const void *ptr2, size_t n);
> > > +void *memmove(void *dest, const void *src, size_t n);
> > > +void *memset(void *dest, int c, size_t size);
> > > +
> > > +/* CI wrappers */
> > > +void ci_panic(const char *str);
> > > +phandle ci_finddevice(const char *path);
> > > +uint32_t ci_getprop(phandle ph, const char *propname, void *prop, in=
t len);
> > > +
> > > +/* booting from -kernel */
> > > +void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
> > > +
> > > +/* Entry points for CI and RTAS */
> > > +extern uint32_t ci_entry(uint32_t params);
> > > +extern unsigned long hv_rtas(unsigned long params);
> > > +extern unsigned int hv_rtas_size;
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 73a06df3b1b1..0a41fd893c47 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -103,6 +103,7 @@
> > >   #define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below =
that */
> > >   #define FW_MAX_SIZE             0x400000
> > >   #define FW_FILE_NAME            "slof.bin"
> > > +#define FW_FILE_NAME_VOF        "vof.bin"
> > >   #define FW_OVERHEAD             0x2800000
> > >   #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
> > > @@ -1625,22 +1626,41 @@ static void spapr_machine_reset(MachineState =
*machine)
> > >       fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
> > > -    rc =3D fdt_pack(fdt);
> > > +    if (spapr->vof) {
> > > +        target_ulong stack_ptr =3D 0;
> > > -    /* Should only fail if we've built a corrupted tree */
> > > -    assert(rc =3D=3D 0);
> > > +        /*
> > > +         * Claims initramdisk and stack which changes "available" so
> > > +         * doing it befofe packing.
> > > +         */
> > > +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
> > > -    /* Load the fdt */
> > > +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> > > +                                  stack_ptr, spapr->initrd_base,
> > > +                                  spapr->initrd_size);
> > > +        /* We do not pack the FDT as the client may change propertie=
s. */
> > > +    } else {
> > > +        rc =3D fdt_pack(fdt);
> > > +        /* Should only fail if we've built a corrupted tree */
> > > +        assert(rc =3D=3D 0);
> > > +
> > > +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> > > +                                  0, fdt_addr, 0);
> > > +    }
> > >       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> > > -    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
> > > +
> > >       g_free(spapr->fdt_blob);
> > >       spapr->fdt_size =3D fdt_totalsize(fdt);
> > >       spapr->fdt_initial_size =3D spapr->fdt_size;
> > >       spapr->fdt_blob =3D fdt;
> > >       /* Set up the entry state */
> > > -    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, f=
dt_addr, 0);
> > >       first_ppc_cpu->env.gpr[5] =3D 0;
> > > +    /* VOF client does not expect the FDT so we do not load it to th=
e VM. */
> > > +    if (!spapr->vof) {
> > > +        /* Load the fdt */
> > > +        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->=
fdt_size);
> > > +    }
> > >       spapr->fwnmi_system_reset_addr =3D -1;
> > >       spapr->fwnmi_machine_check_addr =3D -1;
> > > @@ -2640,13 +2660,14 @@ static void spapr_machine_init(MachineState *=
machine)
> > >       SpaprMachineState *spapr =3D SPAPR_MACHINE(machine);
> > >       SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
> > >       MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> > > -    const char *bios_name =3D machine->firmware ?: FW_FILE_NAME;
> > > +    const char *bios_default =3D !!spapr->vof ? FW_FILE_NAME_VOF : F=
W_FILE_NAME;
> > > +    const char *bios_name =3D machine->firmware ?: bios_default;
> > >       const char *kernel_filename =3D machine->kernel_filename;
> > >       const char *initrd_filename =3D machine->initrd_filename;
> > >       PCIHostState *phb;
> > >       int i;
> > >       MemoryRegion *sysmem =3D get_system_memory();
> > > -    long load_limit, fw_size;
> > > +    long load_limit;
> > >       char *filename;
> > >       Error *resize_hpt_err =3D NULL;
> > > @@ -2963,8 +2984,8 @@ static void spapr_machine_init(MachineState *ma=
chine)
> > >           error_report("Could not find LPAR firmware '%s'", bios_name=
);
> > >           exit(1);
> > >       }
> > > -    fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
> > > -    if (fw_size <=3D 0) {
> > > +    spapr->fw_size =3D load_image_targphys(filename, 0, FW_MAX_SIZE);
> > > +    if (spapr->fw_size <=3D 0) {
> > >           error_report("Could not load LPAR firmware '%s'", filename);
> > >           exit(1);
> > >       }
> > > @@ -2997,6 +3018,10 @@ static void spapr_machine_init(MachineState *m=
achine)
> > >       }
> > >       qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
> > > +
> > > +    if (spapr->vof) {
> > > +        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_cl=
ient);
> > > +    }
> > >   }
> > >   #define DEFAULT_KVM_TYPE "auto"
> > > @@ -3187,6 +3212,28 @@ static void spapr_set_resize_hpt(Object *obj, =
const char *value, Error **errp)
> > >       }
> > >   }
> > > +static bool spapr_get_vof(Object *obj, Error **errp)
> > > +{
> > > +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> > > +
> > > +    return spapr->vof !=3D NULL;
> > > +}
> > > +
> > > +static void spapr_set_vof(Object *obj, bool value, Error **errp)
> > > +{
> > > +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> > > +
> > > +    if (spapr->vof) {
> > > +        vof_cleanup(spapr->vof);
> > > +        g_free(spapr->vof);
> > > +        spapr->vof =3D NULL;
> > > +    }
> > > +    if (!value) {
> > > +        return;
> > > +    }
> > > +    spapr->vof =3D g_malloc0(sizeof(*spapr->vof));
> > > +}
> > > +
> > >   static char *spapr_get_ic_mode(Object *obj, Error **errp)
> > >   {
> > >       SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> > > @@ -3312,6 +3359,10 @@ static void spapr_instance_init(Object *obj)
> > >                                       stringify(KERNEL_LOAD_ADDR)
> > >                                       " for -kernel is the default");
> > >       spapr->kernel_addr =3D KERNEL_LOAD_ADDR;
> > > +    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_=
vof);
> > > +    object_property_set_description(obj, "x-vof",
> > > +                                    "Enable Virtual Open Firmware");
> > > +
> > >       /* The machine class defines the default interrupt controller m=
ode */
> > >       spapr->irq =3D smc->irq;
> > >       object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
> > > @@ -4470,6 +4521,7 @@ static void spapr_machine_class_init(ObjectClas=
s *oc, void *data)
> > >       XICSFabricClass *xic =3D XICS_FABRIC_CLASS(oc);
> > >       InterruptStatsProviderClass *ispc =3D INTERRUPT_STATS_PROVIDER_=
CLASS(oc);
> > >       XiveFabricClass *xfc =3D XIVE_FABRIC_CLASS(oc);
> > > +    VofMachineClass *vmc =3D VOF_MACHINE_CLASS(oc);
> > >       mc->desc =3D "pSeries Logical Partition (PAPR compliant)";
> > >       mc->ignore_boot_device_suffixes =3D true;
> > > @@ -4549,6 +4601,9 @@ static void spapr_machine_class_init(ObjectClas=
s *oc, void *data)
> > >       smc->smp_threads_vsmt =3D true;
> > >       smc->nr_xirqs =3D SPAPR_NR_XIRQS;
> > >       xfc->match_nvt =3D spapr_match_nvt;
> > > +
> > > +    vmc->client_architecture_support =3D spapr_vof_client_architectu=
re_support;
> > > +    vmc->quiesce =3D spapr_vof_quiesce;
> > >   }
> > >   static const TypeInfo spapr_machine_info =3D {
> > > @@ -4568,6 +4623,7 @@ static const TypeInfo spapr_machine_info =3D {
> > >           { TYPE_XICS_FABRIC },
> > >           { TYPE_INTERRUPT_STATS_PROVIDER },
> > >           { TYPE_XIVE_FABRIC },
> > > +        { TYPE_VOF_MACHINE },
> > >           { }
> > >       },
> > >   };
> > > @@ -5036,9 +5092,16 @@ static void spapr_machine_2_1_class_options(Ma=
chineClass *mc)
> > >   }
> > >   DEFINE_SPAPR_MACHINE(2_1, "2.1", false);
> > > +static const TypeInfo vof_machine_info =3D {
> > > +    .name =3D TYPE_VOF_MACHINE,
> > > +    .parent =3D TYPE_INTERFACE,
> > > +    .class_size =3D sizeof(VofMachineClass),
> > > +};
> >=20
> > I think this belongs in vof.c rather than spapr.c
> >=20
> > > +
> > >   static void spapr_machine_register_types(void)
> > >   {
> > >       type_register_static(&spapr_machine_info);
> > > +    type_register_static(&vof_machine_info);
> > >   }
> > >   type_init(spapr_machine_register_types)
> > > diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> > > index 7b5cd3553c26..0cdf90af6afb 100644
> > > --- a/hw/ppc/spapr_hcall.c
> > > +++ b/hw/ppc/spapr_hcall.c
> > > @@ -1806,7 +1806,13 @@ target_ulong do_client_architecture_support(Po=
werPCCPU *cpu,
> > >           spapr_setup_hpt(spapr);
> > >       }
> > > -    fdt =3D spapr_build_fdt(spapr, false, fdt_bufsize);
> > > +    if (spapr->vof && spapr->vof->initrd_base && spapr->vof->initrd_=
size) {
> > > +        /* Update initramdisk location so the right area gets reserv=
ed below */
> > > +        spapr->initrd_base =3D spapr->vof->initrd_base;
> > > +        spapr->initrd_size =3D spapr->vof->initrd_size;
> > > +    }
> > > +
> > > +    fdt =3D spapr_build_fdt(spapr, spapr->vof !=3D NULL, fdt_bufsize=
);
> > >       g_free(spapr->fdt_blob);
> > >       spapr->fdt_size =3D fdt_totalsize(fdt);
> > > @@ -1850,6 +1856,24 @@ static target_ulong h_client_architecture_supp=
ort(PowerPCCPU *cpu,
> > >       return ret;
> > >   }
> > > +target_ulong spapr_vof_client_architecture_support(CPUState *cs,
> > > +                                                  target_ulong ovec_=
addr)
> > > +{
> > > +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> > > +
> > > +    target_ulong ret =3D do_client_architecture_support(POWERPC_CPU(=
cs), spapr,
> > > +                                                      ovec_addr, FDT=
_MAX_SIZE);
> > > +
> > > +    /*
> > > +     * This adds stdout and generates phandles for boottime and CAS =
FDTs.
> > > +     * It is alright to update the FDT here as do_client_architectur=
e_support()
> > > +     * does not pack it.
> > > +     */
> > > +    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > >   static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
> > >                                                 SpaprMachineState *sp=
apr,
> > >                                                 target_ulong opcode,
> > > diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
> > > new file mode 100644
> > > index 000000000000..8a58364490f4
> > > --- /dev/null
> > > +++ b/hw/ppc/spapr_vof.c
> >=20
> > SPDX.
> >=20
> > > @@ -0,0 +1,148 @@
> > > +#include "qemu/osdep.h"
> > > +#include "qemu-common.h"
> > > +#include <sys/ioctl.h>
> > > +#include "qapi/error.h"
> > > +#include "hw/ppc/spapr.h"
> > > +#include "hw/ppc/spapr_vio.h"
> > > +#include "hw/ppc/fdt.h"
> > > +#include "sysemu/sysemu.h"
> > > +#include "qom/qom-qobject.h"
> > > +#include "trace.h"
> > > +
> > > +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> > > +#define OF_STACK_SIZE       0x8000
> > > +
> > > +/* Defined as Big Endian */
> > > +struct prom_args {
> > > +    uint32_t service;
> > > +    uint32_t nargs;
> > > +    uint32_t nret;
> > > +    uint32_t args[10];
> > > +} QEMU_PACKED;
> > > +
> > > +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *=
spapr,
> > > +                                target_ulong opcode, target_ulong *_=
args)
> > > +{
> > > +    target_ulong args_real =3D ppc64_phys_to_real(_args[0]);
> > > +    struct prom_args args_be;
> > > +    uint32_t args[ARRAY_SIZE(args_be.args)];
> > > +    uint32_t rets[ARRAY_SIZE(args_be.args)] =3D { 0 }, ret;
> > > +    char service[64];
> > > +    unsigned nargs, nret, i;
> > > +
> > > +    if (address_space_rw(&address_space_memory, args_real,
> > > +                         MEMTXATTRS_UNSPECIFIED, &args_be, sizeof(ar=
gs_be),
> > > +                         false) !=3D MEMTX_OK) {
> > > +        return H_HARDWARE;
> >=20
> > Probably H_PARAMETER rather than H_HARDWARE - the most likely cause
> > here is that a bad address was specified for the arguments.
> >=20
> > > +    }
> > > +    nargs =3D be32_to_cpu(args_be.nargs);
> > > +    if (nargs >=3D ARRAY_SIZE(args_be.args)) {
> > > +        return H_PARAMETER;
> > > +    }
> > > +
> > > +    if (address_space_rw(&address_space_memory, be32_to_cpu(args_be.=
service),
> > > +                         MEMTXATTRS_UNSPECIFIED, service, sizeof(ser=
vice),
> > > +                         false) !=3D MEMTX_OK) {
> > > +        return H_HARDWARE;
> >=20
> > Likewise here and the rest.
> >=20
> > > +    }
> > > +    if (strnlen(service, sizeof(service)) =3D=3D sizeof(service)) {
> > > +        /* Too long service name */
> > > +        return H_PARAMETER;
> > > +    }
> > > +
> > > +    for (i =3D 0; i < nargs; ++i) {
> > > +        args[i] =3D be32_to_cpu(args_be.args[i]);
> > > +    }
> > > +
> > > +    nret =3D be32_to_cpu(args_be.nret);
> > > +    ret =3D vof_client_call(spapr->fdt_blob, spapr->vof, service,
> > > +                          args, nargs, rets, nret);
> > > +    if (!nret) {
> > > +        return H_SUCCESS;
> > > +    }
> > > +
> > > +    args_be.args[nargs] =3D cpu_to_be32(ret);
> > > +    for (i =3D 1; i < nret; ++i) {
> > > +        args_be.args[nargs + i] =3D cpu_to_be32(rets[i - 1]);
> > > +    }
> > > +
> > > +    if (address_space_rw(&address_space_memory,
> > > +                         args_real + offsetof(struct prom_args, args=
[nargs]),
> > > +                         MEMTXATTRS_UNSPECIFIED, args_be.args + narg=
s,
> > > +                         sizeof(args_be.args[0]) * nret, true) !=3D =
MEMTX_OK) {
> > > +        return H_HARDWARE;
> > > +    }
> > > +
> > > +    return H_SUCCESS;
> > > +}
> > > +
> > > +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fd=
t)
> > > +{
> > > +    char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> > > +
> > > +    vof_build_dt(fdt, spapr->vof, spapr->rma_size);
> > > +
> > > +    /*
> > > +     * SLOF-less setup requires an open instance of stdout for early
> > > +     * kernel printk. By now all phandles are settled so we can open
> > > +     * the default serial console.
> > > +     */
> > > +    if (stdout_path) {
> > > +        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdo=
ut",
> > > +                                   stdout_path));
> > > +    }
> > > +}
> > > +
> > > +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> > > +                     target_ulong *stack_ptr, Error **errp)
> > > +{
> > > +    Vof *vof =3D spapr->vof;
> > > +
> > > +    vof_cleanup(vof);
> > > +
> > > +    spapr_vof_client_dt_finalize(spapr, fdt);
> > > +
> > > +    if (vof_claim(spapr->fdt_blob, vof, 0, spapr->fw_size, 0) =3D=3D=
 -1) {
> > > +        error_setg(errp, "Memory for firmware is in use");
> >=20
> > This could probably be an assert, yes?  IIUC this the very first
> > claim, so if this fails then we've placed things incorrectly in the
> > first place, so it's a code error rather than a user error.
>=20
>=20
> Passing &error_fatal as errp is an assert pretty much but more informative
> imho.

Not quite.  Passing &error_abort is similar to an assert, but
&error_fatal is not.  The rule is that error_abort or assert() should
be used for things that can only occur as a result of a bug in qemu
itself, whereas error_fatal and other errors should be used for things
where the failure may be because of user configuration, or something
wrong on the host or in the guest.

Since the VOF image is being provided by qemu and this is too early
for the guest to have messed with it, this counts as something that is
necessarily a problem in qemu itself.

> In a followup I'd rather shuffle this function to claim kernel/initrd fir=
st

That seems like an odd choice to me.

> and only then claim space the VOF firmware which can fail so I can then t=
ry
> allocating the space for it, return that to spapr_machine_reset() to chan=
ge
> the entry point. This way I'll be able to pass 0 to -machine
> pseries,kernel-addr=3D to allow having kernel at 0 so when debugging via =
the
> qemu gdb stub, I could set breakpoints at addresses from "objdump vmlinux"
> without adding the default kernel addr 0x400000 every time. When I do tha=
t -
> this is definitely going to be not an assert.

Hmm... I guess.

> > > +        return;
> > > +    }
> > > +
> > > +    *stack_ptr =3D vof_claim(spapr->fdt_blob, vof, 0, OF_STACK_SIZE,
> > > +                           OF_STACK_SIZE);
> > > +    if (*stack_ptr =3D=3D -1) {
> >=20
> > Likewise here.
>=20
> This passes alignment so it is allocating and not claiming and if it fails
> to allocate - it is most likely because the user cafefully prepared the v=
of
> blob big enough to exhaust the VM memory.

But the vof blob is being supplied with qemu - if it's too big, that's
qemu's fault.

> > > +        error_setg(errp, "Memory allocation for stack failed");
> > > +        return;
> > > +    }
> > > +    /*
> > > +     * Stack grows downwards and we also reserve here space for
> > > +     * the minimum stack frame.
> > > +     */
> > > +    *stack_ptr +=3D OF_STACK_SIZE - 0x20;
> > > +
> > > +    if (spapr->kernel_size &&
> > > +        vof_claim(spapr->fdt_blob, vof, spapr->kernel_addr, spapr->k=
ernel_size,
> > > +                  0) =3D=3D -1) {
> > > +        error_setg(errp, "Memory for kernel is in use");
> > > +        return;
> > > +    }
> > > +
> > > +    if (spapr->initrd_size &&
> > > +        vof_claim(spapr->fdt_blob, vof, spapr->initrd_base, spapr->i=
nitrd_size,
> > > +                  0) =3D=3D -1) {
> > > +        error_setg(errp, "Memory for initramdisk is in use");
> > > +        return;
> > > +    }
> > > +
> > > +    /*
> > > +     * We skip writing FDT as nothing expects it; OF client interfac=
e is
> > > +     * going to be used for reading the device tree.
> > > +     */
> > > +}
> > > +
> > > +void spapr_vof_quiesce(void)
> > > +{
> > > +    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
> > > +
> > > +    spapr->fdt_size =3D fdt_totalsize(spapr->fdt_blob);
> > > +    spapr->fdt_initial_size =3D spapr->fdt_size;
> >=20
> > I suspect this doesn't matter.  AFAICT the only use of
> > fdt_initial_size is for the H_UPDATE_DT call, which shouldn't be used
> > with VOF.  But, that can be a later cleanup.
>=20
> It does not (like the whole quiesce thing - I only pack the FDT to get
> errors if the client tries updating it) but I really like having all fdt
> properties in sync.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XSgN6dg+WEIDfjh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBjynAACgkQbDjKyiDZ
s5Igaw/9Fhf5YZNCjPgUUUAi1joRCsL9uBtF9pn5SfVz7PxOk4/XnURPxQDc3EMR
+DoEJiwortaH6Unjzt1gsJxga9SuOYfWrK8XdkEfqcIK6GB7jeN5H7OsPuSJGCFZ
0mEuU1wz9H0JlC0/gdVIIM9gZ+gxZz568MwZL/cagB+KXlIOTF9c0eGEl2083ee3
Y2k+HoYrf6xgXG/KtjpslOBjwrntdnwuT/LYIMqWygXvfF3vwRrfudAD3fAckb6k
u0V+5LtfTh9WyUbJQUJA216WUngcRphOuWt4h941Lm5IjQCbUn4g3kujnc92EHUJ
jjjaCKR3UJgFQQzzMYfhtuuFkptBCRSCUx2scKU5RwgC34eBdRJfNVHhg88NiVV8
0R7ULKoDf6qTV1uoMhNkBmXUxIe7l6sGMavNvJpj/GL0mPoe3JTkHzdlChAMrCXz
kOZjEIMT1ODD/x9+WouY6fGZ6BMH+iTW/0FYvVz+MhfR1SLrGKnDrYJ/i2/j6LRI
09sItjprxVC+7xFq4xGlolvv+OPiIdviZx3M2EhgpD6b6dC9fFxatIJZFUGyxNbJ
8RD5r1vnM6OKu8JcW8HZUMCdtxV+lMHEzRC7+vDiUWaO1mLlBUK3wz1s9Gu5x7sY
nuMtLpQjl1ecxvjPj0pYL0pZejm6IRewtVInbIkgaOYuSzVxhZw=
=f4jN
-----END PGP SIGNATURE-----

--XSgN6dg+WEIDfjh+--

