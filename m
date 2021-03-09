Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9A331EBB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 06:36:52 +0100 (CET)
Received: from localhost ([::1]:33382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJV35-0000EV-Ns
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 00:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJV01-0006me-8X; Tue, 09 Mar 2021 00:33:41 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJUzx-0004EC-Ey; Tue, 09 Mar 2021 00:33:41 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DvkQL6DP5z9sW8; Tue,  9 Mar 2021 16:33:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615268010;
 bh=p2KLijLeLWo7xwoHITQEfcOBG0KZfm1Crsnnqw0cZKo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=py/iazs9IMGF2PEmwGmpykRicBLOdgU/KQ6s2jI9z8UOvm9xiGBmXZmj2FpVi0HVS
 SQSWW6XsLPg67VWJXefM6UDLw3i7iSjwqvmrWUJg5ijcC8+2mWZAR/lkvVkXDI4Sgo
 jwkswyeXvi9nJ91fZObpHwXh+BCRcH9icO/j1ocA=
Date: Tue, 9 Mar 2021 16:29:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
Message-ID: <YEcHxEvVPPO85BGE@yekko.fritz.box>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <YD2yd42dv/7/m94f@yekko.fritz.box>
 <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eeiJctttGS0teNQa"
Content-Disposition: inline
In-Reply-To: <08781378-b4ba-12bf-2ae8-f3da9db9342c@ozlabs.ru>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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


--eeiJctttGS0teNQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 06:21:51PM +1100, Alexey Kardashevskiy wrote:
>=20
>=20
> On 02/03/2021 14:35, David Gibson wrote:
> > On Wed, Feb 24, 2021 at 04:41:30PM +1100, Alexey Kardashevskiy wrote:
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
> > > 0..4000 - the initial firmware
> > > 10000..180000 - stack
> > >=20
> > > This OF CI does not implement "interpret".
> > >=20
> > > Unlike SLOF, this does not format uninitialized nvram. Instead, this
> > > includes a disk image with pre-formatted nvram.
> >=20
> > I think we'll need to improve this, but that can be a later patch.
> >=20
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
> > > -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof/nvr=
am.bin,format=3Draw \
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
> > >   hw/ppc/vof.h           |  42 ++
> > >   include/hw/ppc/spapr.h |  22 +-
> > >   pc-bios/vof/vof.h      |  44 +++
> > >   hw/ppc/spapr.c         |  78 +++-
> > >   hw/ppc/spapr_hcall.c   |  26 +-
> > >   hw/ppc/spapr_vof.c     | 138 +++++++
> > >   hw/ppc/vof.c           | 864 ++++++++++++++++++++++++++++++++++++++=
+++
> > >   pc-bios/vof/bootmem.c  |  13 +
> > >   pc-bios/vof/ci.c       | 108 ++++++
> > >   pc-bios/vof/libc.c     |  91 +++++
> > >   pc-bios/vof/main.c     |  22 ++
> > >   MAINTAINERS            |  11 +
> > >   hw/ppc/meson.build     |   2 +
> > >   hw/ppc/trace-events    |  21 +
> > >   pc-bios/README         |   2 +
> > >   pc-bios/vof.bin        | Bin 0 -> 3680 bytes
> > >   pc-bios/vof/entry.S    |  51 +++
> > >   pc-bios/vof/l.lds      |  48 +++
> > >   pc-bios/vof/nvram.bin  | Bin 0 -> 16384 bytes
> > >   20 files changed, 1592 insertions(+), 9 deletions(-)
> > >   create mode 100644 pc-bios/vof/Makefile
> > >   create mode 100644 hw/ppc/vof.h
> > >   create mode 100644 pc-bios/vof/vof.h
> > >   create mode 100644 hw/ppc/spapr_vof.c
> > >   create mode 100644 hw/ppc/vof.c
> > >   create mode 100644 pc-bios/vof/bootmem.c
> > >   create mode 100644 pc-bios/vof/ci.c
> > >   create mode 100644 pc-bios/vof/libc.c
> > >   create mode 100644 pc-bios/vof/main.c
> > >   create mode 100755 pc-bios/vof.bin
> > >   create mode 100644 pc-bios/vof/entry.S
> > >   create mode 100644 pc-bios/vof/l.lds
> > >   create mode 100644 pc-bios/vof/nvram.bin
> > >=20
> > > diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> > > new file mode 100644
> > > index 000000000000..49f7e240eeff
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
> > > +	cc -m32 -mbig-endian -c -fno-stack-protector -Wno-builtin-declarati=
on-mismatch -o $@ $<
> > > +
> > > +vof.elf: entry.o main.o libc.o ci.o bootmem.o
> > > +	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
> > > +
> > > +%.bin: %.elf
> > > +	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
> > > +
> > > +clean:
> > > +	rm -f *.o *.bin *.elf *~
> > > diff --git a/hw/ppc/vof.h b/hw/ppc/vof.h
> > > new file mode 100644
> > > index 000000000000..c8fadf23ea5b
> > > --- /dev/null
> > > +++ b/hw/ppc/vof.h
> > > @@ -0,0 +1,42 @@
> > > + /* Virtual Open Firmware */
> > > +#ifndef HW_VOF_H
> > > +#define HW_VOF_H
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
> > > +/* ibm,client-architecture-support */
> > > +#define TYPE_CLIENT_ARCHITECTURE_SUPPORT "client-architecture-suppor=
t"
> > > +#define CLIENT_ARCHITECTURE_SUPPORT(obj) \
> > > +    INTERFACE_CHECK(ClientArchitectureSupport, (obj), TYPE_CLIENT_AR=
CHITECTURE_SUPPORT)
> > > +
> > > +typedef struct ClientArchitectureSupportClass ClientArchitectureSupp=
ortClass;
> > > +DECLARE_CLASS_CHECKERS(ClientArchitectureSupportClass,
> > > +                       CLIENT_ARCHITECTURE_SUPPORT,
> > > +                       TYPE_CLIENT_ARCHITECTURE_SUPPORT)
> > > +
> > > +struct ClientArchitectureSupportClass {
> > > +    InterfaceClass parent;
> > > +    target_ulong (*cas)(CPUState *cs, target_ulong vec);
> > > +    void (*quiesce)(void);
> >=20
> > Is there actually any real connection of quiesce behaviour to cas
> > behaviour?  Basically, I'm wondering if this is not so much about
> > client-architecture-support fundamentally as just about
> > machine-specific parts of the VOF behaviour.  Which would be fine, but
> > suggests a different name for the interface.
>=20
> The most canonical way would be having 2 interfaces.

Why?  I don't see any reason these shouldn't be a single interface, it
just has a bad name.

> I thought it would be
> too much and left one. Then I thought may be the name should be PAPR but
> "quiesce" is ... I actually cannot spot where it came from, I do not see =
it
> neither in OF1275 nor PAPR. So the new name is fine but which one? I can
> make it

Huh, weird.  I'm pretty sure it's not PAPR specific - it was used on
ppc based Macs as well.  But as you say, it doesn't appear in IEEE1275
(although the concept of a quiescent state is mentioned with the
'reset' method).  My guess would be it's described in one of those
early OF extension documents that we basically assume is always
implemented (like the interrupt mapping bindings or the generic names
convention).

> struct VofSupportClass {
>  target_ulong callmethod(const char *method, int nargs, target_ulong *arg=
s,
> int nret, target_ulong *rets);
> }
>=20
> but it looks too vague and makes it harder for the reader.

No, that would be silly.  Just have separate methods in the one
interface for cas and quiesce.

> > > +};
> > > +
> > > +#endif /* HW_VOF_H */
> > > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > > index ccbeeca1de84..4896b9fae784 100644
> > > --- a/include/hw/ppc/spapr.h
> > > +++ b/include/hw/ppc/spapr.h
> > > @@ -12,6 +12,7 @@
> > >   #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
> > >   #include "hw/ppc/xics.h"        /* For ICSState */
> > >   #include "hw/ppc/spapr_tpm_proxy.h"
> > > +#include "hw/ppc/vof.h"
> > >   struct SpaprVioBus;
> > >   struct SpaprPhbState;
> > > @@ -180,6 +181,7 @@ struct SpaprMachineState {
> > >       uint64_t kernel_addr;
> > >       uint32_t initrd_base;
> > >       long initrd_size;
> > > +    Vof *vof;
> > >       uint64_t rtc_offset; /* Now used only during incoming migration=
 */
> > >       struct PPCTimebase tb;
> > >       bool has_graphics;
> > > @@ -554,7 +556,9 @@ struct SpaprMachineState {
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
> > > @@ -944,4 +948,20 @@ bool spapr_check_pagesize(SpaprMachineState *spa=
pr, hwaddr pagesize,
> > >   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
> > >   hwaddr spapr_get_rtas_addr(void);
> > >   bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
> > > +
> > > +void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
> > > +                     target_ulong *stack_ptr);
> > > +void spapr_vof_quiesce(void);
> > > +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *=
spapr,
> > > +                                target_ulong opcode, target_ulong *a=
rgs);
> >=20
> > Alexey or Zoltan, any thoughts on how non-PAPR versions of this would
> > call into qemu to get the non-guest parts of VOF to execute?
>=20
> Non-PAPR could do it as we do it for soft breakpoints in KVM - some
> predefined illegal instruction which KVM knows that it is used for soft
> breakpoints.

Yeah, I guess.

[snip]
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
> > > +/* Prom */
> > > +typedef unsigned long prom_arg_t;
> > > +int call_prom(const char *service, int nargs, int nret, ...);
> >=20
> > AIUI this isn't so much about calling the PROM, since this *is* the
> > PROM code, but rather about calling the parts that are implemented on
> > the qemu side.  Different names might clarify that.
>=20
> "call_ci"?

Works for me.

[snip]
> > > +static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32=
_t pname,
> > > +                            uint32_t valaddr, uint32_t vallen)
> > > +{
> > > +    char propname[OF_PROPNAME_LEN_MAX + 1];
> > > +    uint32_t ret =3D 0;
> > > +    int proplen =3D 0;
> > > +    const void *prop;
> > > +    char trval[64] =3D "";
> > > +    int nodeoff =3D fdt_node_offset_by_phandle(fdt, nodeph);
> > > +
> > > +    if (readstr(pname, propname, sizeof(propname))) {
> > > +        return -1;
> > > +    }
> > > +    if (strcmp(propname, "name") =3D=3D 0) {
> > > +        prop =3D fdt_get_name(fdt, nodeoff, &proplen);
> > > +        proplen +=3D 1;
> >=20
> > This isn't quite right, I don't think.  fdt_get_name() returns the
> > name *including* unit address, but the 'name' property will omit the
> > unit address.
>=20
> Ok, will fix. Is there a helper to chop off the unit address btw, since I
> gave up my split()?

I'm afraid not.  It's not really feasible to "chop" strings in libfdt,
since we don't use malloc().  fdt_get_name() just returns a pointer
into the dtb at the relevant place, which will include the unit
address.

[snip]
> > > +    } else {
> > > +        goto trace_exit;
> > > +    }
> > > +
> > > +    offset =3D fdt_node_offset_by_phandle(fdt, nodeph);
> > > +    if (offset >=3D 0) {
> > > +        uint8_t data[vallen];
> >=20
> > We probably want some limit on vallen so the guest can't force
> > allocation of arbitrary amounts of qemu stack space.
>=20
> Indeed. 1024 + 1?

Seems reasonable for now.

[snip]
> > > diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
> > > new file mode 100644
> > > index 000000000000..4880b3d2047c
> > > --- /dev/null
> > > +++ b/pc-bios/vof/ci.c
> > > @@ -0,0 +1,108 @@
> > > +#include "vof.h"
> > > +
> > > +struct prom_args {
> > > +        uint32_t service;
> > > +        uint32_t nargs;
> > > +        uint32_t nret;
> > > +        uint32_t args[10];
> > > +};
> > > +
> > > +#define ADDR(x) (uint32_t)(x)
> > > +
> > > +extern uint32_t ci_entry(uint32_t params);
> > > +
> > > +extern unsigned long hv_rtas(unsigned long params);
> > > +extern unsigned int hv_rtas_size;
> > > +
> > > +bool prom_handle(struct prom_args *pargs)
> > > +{
> > > +	void *rtasbase;
> > > +	uint32_t rtassize =3D 0;
> > > +	phandle rtas;
> > > +
> > > +	if (strcmp("call-method", (void *)(unsigned long) pargs->service))
> > > +		return false;
> > > +
> > > +	if (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->args[=
0]))
> > > +		return false;
> > > +
> > > +	rtas =3D ci_finddevice("/rtas");
> > > +	ci_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));
> >=20
> > Why do we need this?  IIRC the "rtas-size" property is a qemu
> > extension we used to use for the interaction between SLOF and qemu -
> > can't we just use hv_rtas_size directly for the VOF case?
>=20
>=20
> It depends on the FWNMI capability, it is either RTAS or RTAS + log
> size.

Ah, right.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eeiJctttGS0teNQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBHB8IACgkQbDjKyiDZ
s5LYNg//Uy/WTTe18OJsgRL6L5zF8xtfVH6+dhywYNL/Ra+b62fuafCWTAXiw8Zq
YMNVRUd2+eVLcOsLDEKc7OEqusuYQjhtfIoyQ1C85+7YKjBP1OUBLW4saRAbqxTz
anIJ4+4pZUL+X1hSDL7gcTQs9V0OGfZpDth7mJPm/kBLBwSqMZ0PPQ15xjo9U1lH
TyZaClfBCdDCVyk3VedoWWowVCW+oALFeFJLyYcjZZF1DOz7lfUh6P6eKbHUAloa
5IExWAXXw5Q1S67kwuucXKrxPpnCmDOdhjXkCtgLhl368Cs42VGFT2yQ36E286JT
njR99fDrl64M7fklR55TNd3ikxDPf03SzpO3nrraoOcQ9XlhNw1476tWQWm0IJHN
fwTQ1XOL9UCMl5ue0SJUbeXCsbzJ1w8UTa/5C5sDlnyz+n16GmkEX3EZvAy5wDcp
N03cwk+Gv4eQbmCitrV176YobeUxvHyPQnt5g+5oLjpBGbP9CQs+kgTyPs2PURKU
rPq0to0QukzWZ9QGzYgRYNrkYZS84GaBfN+Uaqy4/Ke8E429OVLAJFNaRa52gQ5a
Z/fbfwKx+rlY8o3J9cteKIRxtr6XUW55e+8G/hR8SiyTikHHoVCgkXcHpOmKsPkd
F4TicfB56OCEqzOHMrufmIWY7nc4M5EmYcHEhKqIhyqNC1eYilU=
=3cVz
-----END PGP SIGNATURE-----

--eeiJctttGS0teNQa--

