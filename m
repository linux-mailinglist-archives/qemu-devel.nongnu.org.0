Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723463BF40B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 04:44:03 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1K1C-0004Qz-Df
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 22:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Jxy-0003R3-IO; Wed, 07 Jul 2021 22:40:42 -0400
Received: from ozlabs.org ([203.11.71.1]:33071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1Jxu-0004eA-3t; Wed, 07 Jul 2021 22:40:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL0rx3M81z9sWq; Thu,  8 Jul 2021 12:40:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625712033;
 bh=q0zmFvLI6EjYNhIYhRf+xmaD4QgLPRf1QMrVlBBT3zQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mGc9x1FXnnAWhLQxbAdFpEmXRTV7JuddE+wUTXTeaJQZdpRAF4W8Lk9OmjAZ2H9Rh
 P5CEE80iHiqqRyD87thcdHPZcDsKCsACVnlA34DllS49jrQaOjVvpSyzGwbOqqYGpF
 C9by4re1G+1haaij7treBOXxLovX9xu29b3xhrl0=
Date: Thu, 8 Jul 2021 12:40:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v22] spapr: Implement Open Firmware client interface
Message-ID: <YOZlnOiCeeF4mwJO@yekko>
References: <20210625055155.2252896-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eDB5VDGEyUn2PGcS"
Content-Disposition: inline
In-Reply-To: <20210625055155.2252896-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--eDB5VDGEyUn2PGcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 03:51:55PM +1000, Alexey Kardashevskiy wrote:
> The PAPR platform describes an OS environment that's presented by
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
> This assumes potential support for booting from QEMU backends
> such as blockdev or netdev without devices/drivers used.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to ppc-for-6.1.  However, I'm going to make a number of
comments on minor nits.  If they can be addressed as follow up
patches, I'd appreciate it.

[snip]
> diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
> new file mode 100644
> index 000000000000..2d8958076907
> --- /dev/null
> +++ b/pc-bios/vof/vof.h
> @@ -0,0 +1,43 @@
> +/*
> + * Virtual Open Firmware
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
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

AFAICT 'client' is only used in one place, might as well just open
code it.

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
> index 9e19c570327e..e9b6d0f58756 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -101,6 +101,7 @@
>  #define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>  #define FW_MAX_SIZE             0x400000
>  #define FW_FILE_NAME            "slof.bin"
> +#define FW_FILE_NAME_VOF        "vof.bin"
>  #define FW_OVERHEAD             0x2800000
>  #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
> =20
> @@ -1643,22 +1644,37 @@ static void spapr_machine_reset(MachineState *mac=
hine)
>      fdt_addr =3D MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
> =20
>      fdt =3D spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
> +    if (spapr->vof) {
> +        target_ulong stack_ptr =3D 0;
> =20
> -    rc =3D fdt_pack(fdt);
> +        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
> =20
> -    /* Should only fail if we've built a corrupted tree */
> -    assert(rc =3D=3D 0);
> +        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
> +                                  stack_ptr, spapr->initrd_base,
> +                                  spapr->initrd_size);
> +        /* VOF is 32bit BE so enforce MSR here */
> +        first_ppc_cpu->env.msr &=3D ~((1ULL << MSR_SF) | (1ULL << MSR_LE=
));
> +        /*
> +         * Do not pack the FDT as the client may change properties.
> +         * VOF client does not expect the FDT so we do not load it to th=
e VM.
> +         */

I think it would be cleaner to fold the rest of this if clause into
spapr_vof_reset() (adding some parameters as necessary).

[snip]
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index f25014afda40..03fc191599fe 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1080,7 +1080,7 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>      SpaprOptionVector *ov1_guest, *ov5_guest;
>      bool guest_radix;
>      bool raw_mode_supported =3D false;
> -    bool guest_xive;
> +    bool guest_xive, reset_fdt =3D false;

Initialization of reset_fdt is redundant, since you set it
unconditionally before you use it.

>      CPUState *cs;
>      void *fdt;
>      uint32_t max_compat =3D spapr->max_compat_pvr;
> @@ -1233,8 +1233,8 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>          spapr_setup_hpt(spapr);
>      }
> =20
> -    fdt =3D spapr_build_fdt(spapr, false, fdt_bufsize);
> -
> +    reset_fdt =3D spapr->vof !=3D NULL;
> +    fdt =3D spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
>      g_free(spapr->fdt_blob);
>      spapr->fdt_size =3D fdt_totalsize(fdt);
>      spapr->fdt_initial_size =3D spapr->fdt_size;
[snip]
> @@ -1277,6 +1277,25 @@ static target_ulong h_client_architecture_support(=
PowerPCCPU *cpu,
>      return ret;
>  }
> =20
> +target_ulong spapr_vof_client_architecture_support(MachineState *ms,
> +                                                   CPUState *cs,
> +                                                   target_ulong ovec_add=
r)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(ms);
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
> index 000000000000..1d5bec146c49
> --- /dev/null
> +++ b/hw/ppc/spapr_vof.c
> @@ -0,0 +1,154 @@
> +/*
> + * SPAPR machine hooks to Virtual Open Firmware,
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include <sys/ioctl.h>
> +#include "qapi/error.h"
> +#include "hw/ppc/spapr.h"
> +#include "hw/ppc/spapr_vio.h"
> +#include "hw/ppc/fdt.h"
> +#include "hw/ppc/vof.h"
> +#include "sysemu/sysemu.h"
> +#include "qom/qom-qobject.h"
> +#include "trace.h"
> +
> +target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spap=
r,
> +                                target_ulong opcode, target_ulong *_args)
> +{
> +    int ret =3D vof_client_call(MACHINE(spapr), spapr->vof, spapr->fdt_b=
lob,
> +                              ppc64_phys_to_real(_args[0]));
> +
> +    if (ret) {
> +        return H_PARAMETER;
> +    }
> +    return H_SUCCESS;
> +}
> +
> +void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
> +{
> +    char *stdout_path =3D spapr_vio_stdout_path(spapr->vio_bus);
> +    int chosen;
> +
> +    vof_build_dt(fdt, spapr->vof);
> +
> +    _FDT(chosen =3D fdt_path_offset(fdt, "/chosen"));
> +    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
> +                            spapr->vof->bootargs ? : ""));

You do several things with vof->bootargs, but if you've initialized it
=66rom machine->kernel_cmdline, I didn't spot it.

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
[snip]
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> new file mode 100644
> index 000000000000..a17fd9d2fe94
> --- /dev/null
> +++ b/hw/ppc/vof.c
[snip]
> +static int path_offset(const void *fdt, const char *path)
> +{
> +    g_autofree char *p =3D NULL;
> +    char *at;
> +
> +    /*
> +     * https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc=
-2_1.html#HDR16
> +     *
> +     * "Conversion from numeric representation to text representation sh=
all use
> +     * the lower case forms of the hexadecimal digits in the range a..f,
> +     * suppressing leading zeros".

Huh... that suggests that Zoltan's firmware which passes a caps hex
and expects it to work is doing the wrong thing.  We still need to
accomodate it, though.

> +     */
> +    at =3D strchr(path, '@');
> +    if (!at) {
> +        return fdt_path_offset(fdt, path);
> +    }
> +
> +    p =3D g_strdup(path);
> +    for (at =3D at - path + p + 1; *at; ++at) {
> +        *at =3D tolower(*at);
> +    }

This isn't quite right, though we might get away with it in practice.
You're taking a whole path here, and each path component could
potentially have a unit address.  This will tolower() everything after
the first @, potentially case mangling the base names of later
components.

> +    return fdt_path_offset(fdt, p);
> +}

[snip]
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
> +    bool write0;
> +
> +    if (nodeoff < 0) {
> +        return -1;

Shouldn't many of these explicit -1s be PROM_ERR, since you defined it?

> +    }
> +    if (readstr(pname, propname, sizeof(propname))) {
> +        return -1;
> +    }
> +    prop =3D getprop(fdt, nodeoff, propname, &proplen, &write0);
> +    if (prop) {
> +        const char zero =3D 0;
> +        int cb =3D MIN(proplen, vallen);
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

[snip]
> +static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
> +                            uint32_t nodeph, uint32_t pname,
> +                            uint32_t valaddr, uint32_t vallen)
> +{
> +    char propname[OF_PROPNAME_LEN_MAX + 1];
> +    uint32_t ret =3D -1;
> +    int offset;
> +    char trval[64] =3D "";
> +    char nodepath[VOF_MAX_PATH] =3D "";
> +    Object *vmo =3D object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
> +    g_autofree char *val =3D NULL;
> +
> +    if (vallen > VOF_MAX_SETPROPLEN) {
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
> +    val =3D g_malloc0(vallen);
> +    if (VOF_MEM_READ(valaddr, val, vallen) !=3D MEMTX_OK) {
> +        goto trace_exit;
> +    }
> +
> +    if (vmo) {
> +        VofMachineIfClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> +
> +        if (vmc->setprop &&
> +            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
> +            goto trace_exit;

This defaults to allowing the setprop if the machine doesn't provide a
setprop callback.  I think it would be safer to default to prohibiting
all setprops except those the machine explicitly allows.

> +        }
> +    }
> +
> +    ret =3D fdt_setprop(fdt, offset, propname, val, vallen);
> +    if (ret) {
> +        goto trace_exit;
> +    }
> +
> +    if (trace_event_get_state(TRACE_VOF_SETPROP) &&
> +        qemu_loglevel_mask(LOG_TRACE)) {
> +        prop_format(trval, sizeof(trval), val, vallen);
> +    }
> +    ret =3D vallen;
> +
> +trace_exit:
> +    trace_vof_setprop(nodeph, propname, trval, vallen, ret);
> +
> +    return ret;
> +}

[snip]
> +static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
> +                          uint32_t len)
> +{
> +    char tmp[VOF_VTY_BUF_SIZE];
> +    unsigned cb;
> +    OfInstance *inst =3D (OfInstance *)
> +        g_hash_table_lookup(vof->of_instances, GINT_TO_POINTER(ihandle));
> +
> +    if (!inst) {
> +        trace_vof_error_write(ihandle);
> +        return -1;
> +    }
> +
> +    for ( ; len > 0; len -=3D cb) {
> +        cb =3D MIN(len, sizeof(tmp) - 1);
> +        if (VOF_MEM_READ(buf, tmp, cb) !=3D MEMTX_OK) {
> +            return -1;
> +        }
> +
> +        /* FIXME: there is no backend(s) yet so just call a trace */

Improving that I think should count as a high priority enhancement.

> +        if (trace_event_get_state(TRACE_VOF_WRITE) &&
> +            qemu_loglevel_mask(LOG_TRACE)) {
> +            tmp[cb] =3D '\0';
> +            trace_vof_write(ihandle, cb, tmp);
> +        }
> +    }
> +
> +    return len;
> +}

[snip]
> +
> +static void vof_instantiate_rtas(Error **errp)
> +{
> +    error_setg(errp, "The firmware should have instantiated RTAS");

Since this always fails...

> +}
> +
> +static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t met=
hodaddr,
> +                                uint32_t ihandle, uint32_t param1,
> +                                uint32_t param2, uint32_t param3,
> +                                uint32_t param4, uint32_t *ret2)
> +{
> +    uint32_t ret =3D -1;
> +    char method[VOF_MAX_METHODLEN] =3D "";
> +    OfInstance *inst;
> +
> +    if (!ihandle) {
> +        goto trace_exit;
> +    }
> +
> +    inst =3D (OfInstance *)g_hash_table_lookup(vof->of_instances,
> +                                             GINT_TO_POINTER(ihandle));
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
> +            Object *vmo =3D object_dynamic_cast(OBJECT(ms), TYPE_VOF_MAC=
HINE_IF);
> +
> +            if (vmo) {
> +                VofMachineIfClass *vmc =3D VOF_MACHINE_GET_CLASS(vmo);
> +
> +                g_assert(vmc->client_architecture_support);
> +                ret =3D vmc->client_architecture_support(ms, first_cpu, =
param1);
> +            }
> +
> +            *ret2 =3D 0;
> +        }
> +    } else if (strcmp(inst->path, "/rtas") =3D=3D 0) {
> +        if (strcmp(method, "instantiate-rtas") =3D=3D 0) {

=2E.. why do you even need to handle it here?

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

[snip]
> +static uint32_t vof_client_handle(MachineState *ms, void *fdt, Vof *vof,
> +                                  const char *service,
> +                                  uint32_t *args, unsigned nargs,
> +                                  uint32_t *rets, unsigned nrets)
> +{
> +    uint32_t ret =3D 0;
> +
> +    /* @nrets includes the value which this function returns */
> +#define cmpserv(s, a, r) \
> +    cmpservice(service, nargs, nrets, (s), (a), (r))

Since this macro is intended to be purely local, you should #undef it
at the end of the function.

> +
> +    if (cmpserv("finddevice", 1, 1)) {
> +        ret =3D vof_finddevice(fdt, args[0]);
> +    } else if (cmpserv("getprop", 4, 1)) {
> +        ret =3D vof_getprop(fdt, args[0], args[1], args[2], args[3]);
> +    } else if (cmpserv("getproplen", 2, 1)) {
> +        ret =3D vof_getproplen(fdt, args[0], args[1]);
> +    } else if (cmpserv("setprop", 4, 1)) {
> +        ret =3D vof_setprop(ms, fdt, vof, args[0], args[1], args[2], arg=
s[3]);
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
> +        ret =3D vof_claim(vof, args[0], args[1], args[2]);
> +        if (ret !=3D -1) {
> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base=
);
> +        }
> +    } else if (cmpserv("release", 2, 0)) {
> +        ret =3D vof_release(vof, args[0], args[1]);
> +        if (ret !=3D -1) {
> +            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base=
);
> +        }
> +    } else if (cmpserv("call-method", 0, 0)) {
> +        ret =3D vof_call_method(ms, vof, args[0], args[1], args[2], args=
[3],
> +                              args[4], args[5], rets);
> +    } else if (cmpserv("interpret", 0, 0)) {
> +        ret =3D vof_call_interpret(args[0], args[1], args[2], rets);
> +    } else if (cmpserv("milliseconds", 0, 1)) {
> +        ret =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    } else if (cmpserv("quiesce", 0, 0)) {
> +        vof_quiesce(ms, fdt, vof);
> +    } else if (cmpserv("exit", 0, 0)) {
> +        error_report("Stopped as the VM requested \"exit\"");
> +        vm_stop(RUN_STATE_PAUSED);
> +    } else {
> +        trace_vof_error_unknown_service(service, nargs, nrets);
> +        ret =3D -1;
> +    }
> +
> +    return ret;
> +}


[snip]
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

I don't see any callers of your memmove().
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7d9cd2904264..6fb202f99e90 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1356,6 +1356,18 @@ F: hw/pci-host/mv64361.c
>  F: hw/pci-host/mv643xx.h
>  F: include/hw/pci-host/mv64361.h
> =20
> +Virtual Open Firmware (VOF)
> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
> +M: David Gibson <david@gibson.dropbear.id.au>
> +M: Greg Kurz <groug@kaod.org>

I think "R" might be more appropriate for me and Greg, rather than "M".

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eDB5VDGEyUn2PGcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmZZkACgkQbDjKyiDZ
s5J3wA/9FEyA2O3yn4eHJ4V1Kb6AmNj88cxPJBrwJEH3g5gmf4O43LWnL39DRzQk
nbcVfj1ETO6tRyjq7ALNWrpzQ/dMW685frQiwhWrlyPdPNBslsQM7Csqt8gaWzag
hWBijU8vtpnz2UaDsYqzd8EBmdvitMe94R/mGxTPwivntSCuWz2wRX54/yDIRwLM
w/lPj7g9IK7mwnU4U3xI7AZunLih+HmvAmCjrs3m3/+XbVdeuC83ZNtuYxLT6REY
Z37Ferma+CFSNxy7aBcIrVep+4BtE0Xp+W6J7cekz2ghTT56JPbPWCp0vmpXi33y
l6/3kPjU1BO1WIQRuPexDq8tNR6vGTiS2aAtrG4BPRZna8hobsvxhMm/1HQkQDb/
aDcspyJduez17MlD9tm4COULLrkzlVzH1luYXL4yT4efZBpySSh51V+m8hntM5gr
HD/BhXVC4Wg82R/tIo0fHKGb3R7GRyBl+o2yu29FMhkY8cZIL2587cLYtueriGQg
UeXtNSt38QugKDzYOC55uDDuU2BfrCsfbHB2itotomKX0/PeMEdqwiSmjtcyi0Ct
FyoAw56Oxs53CQsNZ2YQKViIx5d/ybQnKe/N/bY19uL+VNY9tHeGVAeWze4f/0SW
U4QxH0K0Synlf3R5uphfh2I7gAcvWmIdt6EjDaEIQke7t7N43Ks=
=YF+c
-----END PGP SIGNATURE-----

--eDB5VDGEyUn2PGcS--

