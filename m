Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6107266731
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 08:47:18 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlpKv-0004Hk-0g
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 02:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54087)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hlpKO-0002zA-J5
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 02:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hlpKM-0004D2-Kc
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 02:46:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58431 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hlpKI-00047L-Pa; Fri, 12 Jul 2019 02:46:41 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45lNkD26Pzz9sBF; Fri, 12 Jul 2019 16:46:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1562913988;
 bh=wAzxlfJLe1vqjhc+MFOA9oeqo4RGUKYOh5/ui2HK8gU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hmcHhbwjuRSSf8kS1/Z08VT/Olk5joZsP8h9UzUW0192ryc7wtCFygZ9jV0zEKVXC
 6mWI5zL4go0Gshe1teEzMs08RTbooTfRHfGwdaXg3fbXpQKHYF3Hsrs4xelTtlM4H7
 CR6IjxlkBy2jr9PsCikipyN2SV8PfrDTOnSY6QTY=
Date: Fri, 12 Jul 2019 16:46:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20190712064619.GH2561@umbus.fritz.box>
References: <20190712011934.29863-1-mdroth@linux.vnet.ibm.com>
 <20190712011934.29863-3-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline
In-Reply-To: <20190712011934.29863-3-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH 2/2] spapr: initial implementation for
 H_TPM_COMM hcall
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
Cc: linuxram@us.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2019 at 08:19:34PM -0500, Michael Roth wrote:
> This implements the H_TPM_COMM hypercall, which is used by an
> Ultravisor to pass TPM commands directly to the host's TPM device, or
> a TPM Resource Manager associated with the device.
>=20
> This also introduces a new pseries machine option which is used to
> configure what TPM device to pass commands to, for example:
>=20
>   -machine pseries,...,tpm-device-file=3D/dev/tmprm0

Bolting this into yet another machine parameter seems kind of ugly.
Wouldn't it make more sense to treat this as an virtual device (say
"spapr-vtpm").  Adding that device would enable the hcall, and would
have properties for the back end host device.

> By default, no tpm-device-file is defined and hcalls will return
> H_RESOURCE.

Wouldn't H_FUNCTION make more sense?

>=20
> The full specification for this hypercall can be found in
> docs/specs/ppc-spapr-uv-hcalls.txt
>=20
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com
> ---
>  hw/ppc/Makefile.objs     |   1 +
>  hw/ppc/spapr.c           |  27 ++++++++
>  hw/ppc/spapr_hcall_tpm.c | 135 +++++++++++++++++++++++++++++++++++++++
>  hw/ppc/trace-events      |   4 ++
>  include/hw/ppc/spapr.h   |   7 +-
>  5 files changed, 173 insertions(+), 1 deletion(-)
>  create mode 100644 hw/ppc/spapr_hcall_tpm.c
>=20
> diff --git a/hw/ppc/Makefile.objs b/hw/ppc/Makefile.objs
> index 9da93af905..5aa120cae6 100644
> --- a/hw/ppc/Makefile.objs
> +++ b/hw/ppc/Makefile.objs
> @@ -5,6 +5,7 @@ obj-$(CONFIG_PSERIES) +=3D spapr.o spapr_caps.o spapr_vio=
=2Eo spapr_events.o
>  obj-$(CONFIG_PSERIES) +=3D spapr_hcall.o spapr_iommu.o spapr_rtas.o
>  obj-$(CONFIG_PSERIES) +=3D spapr_pci.o spapr_rtc.o spapr_drc.o
>  obj-$(CONFIG_PSERIES) +=3D spapr_cpu_core.o spapr_ovec.o spapr_irq.o
> +obj-$(CONFIG_PSERIES) +=3D spapr_hcall_tpm.o
>  obj-$(CONFIG_SPAPR_RNG) +=3D  spapr_rng.o
>  # IBM PowerNV
>  obj-$(CONFIG_POWERNV) +=3D pnv.o pnv_xscom.o pnv_core.o pnv_lpc.o pnv_ps=
i.o pnv_occ.o pnv_bmc.o
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 821f0d4a49..eb3421673b 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1776,6 +1776,10 @@ static void spapr_machine_reset(MachineState *mach=
ine)
>       */
>      object_child_foreach_recursive(object_get_root(), spapr_reset_drcs, =
NULL);
> =20
> +    if (spapr->tpm_device_file) {
> +        spapr_hcall_tpm_reset();
> +    }
> +
>      spapr_clear_pending_events(spapr);
> =20
>      /*
> @@ -3340,6 +3344,21 @@ static void spapr_set_host_serial(Object *obj, con=
st char *value, Error **errp)
>      spapr->host_serial =3D g_strdup(value);
>  }
> =20
> +static char *spapr_get_tpm_device_file(Object *obj, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    return g_strdup(spapr->tpm_device_file);
> +}
> +
> +static void spapr_set_tpm_device_file(Object *obj, const char *value, Er=
ror **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    g_free(spapr->tpm_device_file);
> +    spapr->tpm_device_file =3D g_strdup(value);
> +}
> +
>  static void spapr_instance_init(Object *obj)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> @@ -3396,6 +3415,14 @@ static void spapr_instance_init(Object *obj)
>          &error_abort);
>      object_property_set_description(obj, "host-serial",
>          "Host serial number to advertise in guest device tree", &error_a=
bort);
> +    object_property_add_str(obj, "tpm-device-file",
> +                            spapr_get_tpm_device_file,
> +                            spapr_set_tpm_device_file, &error_abort);
> +    object_property_set_description(obj, "tpm-device-file",
> +                 "Specifies the path to the TPM character device file to=
 use"
> +                 " for TPM communication via hypercalls (usually a TPM"
> +                 " resource manager)",
> +                 &error_abort);
>  }
> =20
>  static void spapr_machine_finalizefn(Object *obj)
> diff --git a/hw/ppc/spapr_hcall_tpm.c b/hw/ppc/spapr_hcall_tpm.c
> new file mode 100644
> index 0000000000..75e2b6d594
> --- /dev/null
> +++ b/hw/ppc/spapr_hcall_tpm.c
> @@ -0,0 +1,135 @@
> +/*
> + * SPAPR TPM Hypercall
> + *
> + * Copyright IBM Corp. 2019
> + *
> + * Authors:
> + *  Michael Roth      <mdroth@linux.vnet.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "cpu.h"
> +#include "hw/ppc/spapr.h"
> +#include "trace.h"
> +
> +#define TPM_SPAPR_BUFSIZE 4096
> +
> +enum {
> +    TPM_COMM_OP_EXECUTE =3D 1,
> +    TPM_COMM_OP_CLOSE_SESSION =3D 2,
> +};
> +
> +static int tpm_devfd =3D -1;

A global?  Really?  You can do better.

> +
> +static ssize_t tpm_execute(SpaprMachineState *spapr, target_ulong *args)
> +{
> +    uint64_t data_in =3D ppc64_phys_to_real(args[1]);
> +    target_ulong data_in_size =3D args[2];
> +    uint64_t data_out =3D ppc64_phys_to_real(args[3]);
> +    target_ulong data_out_size =3D args[4];
> +    uint8_t buf_in[TPM_SPAPR_BUFSIZE];
> +    uint8_t buf_out[TPM_SPAPR_BUFSIZE];
> +    ssize_t ret;
> +
> +    trace_spapr_tpm_execute(data_in, data_in_size, data_out, data_out_si=
ze);
> +
> +    if (data_in_size > TPM_SPAPR_BUFSIZE) {
> +        error_report("invalid TPM input buffer size: " TARGET_FMT_lu "\n=
",
> +                     data_in_size);
> +        return H_P3;
> +    }
> +
> +    if (data_out_size < TPM_SPAPR_BUFSIZE) {
> +        error_report("invalid TPM output buffer size: " TARGET_FMT_lu "\=
n",
> +                     data_out_size);
> +        return H_P5;
> +    }
> +
> +    if (tpm_devfd =3D=3D -1) {
> +        tpm_devfd =3D open(spapr->tpm_device_file, O_RDWR);
> +        if (tpm_devfd =3D=3D -1) {
> +            error_report("failed to open TPM device %s: %d",
> +                         spapr->tpm_device_file, errno);
> +            return H_RESOURCE;
> +        }
> +    }
> +
> +    cpu_physical_memory_read(data_in, buf_in, data_in_size);
> +
> +    do {
> +        ret =3D write(tpm_devfd, buf_in, data_in_size);
> +        if (ret > 0) {
> +            data_in_size -=3D ret;
> +        }
> +    } while ((ret >=3D 0 && data_in_size > 0) || (ret =3D=3D -1 && errno=
 =3D=3D EINTR));
> +
> +    if (ret =3D=3D -1) {
> +        error_report("failed to write to TPM device %s: %d",
> +                     spapr->tpm_device_file, errno);
> +        return H_RESOURCE;
> +    }
> +
> +    do {
> +        ret =3D read(tpm_devfd, buf_out, data_out_size);
> +    } while (ret =3D=3D 0 || (ret =3D=3D -1 && errno =3D=3D EINTR));
> +
> +    if (ret =3D=3D -1) {
> +        error_report("failed to read from TPM device %s: %d",
> +                     spapr->tpm_device_file, errno);
> +        return H_RESOURCE;
> +    }
> +
> +    cpu_physical_memory_write(data_out, buf_out, ret);
> +    args[0] =3D ret;
> +
> +    return H_SUCCESS;
> +}
> +
> +static target_ulong h_tpm_comm(PowerPCCPU *cpu,
> +                               SpaprMachineState *spapr,
> +                               target_ulong opcode,
> +                               target_ulong *args)
> +{
> +    target_ulong op =3D args[0];
> +
> +    trace_spapr_h_tpm_comm(spapr->tpm_device_file ?: "null", op);
> +
> +    if (!spapr->tpm_device_file) {
> +        error_report("TPM device not specified");
> +        return H_RESOURCE;
> +    }
> +
> +    switch (op) {
> +        case TPM_COMM_OP_EXECUTE:
> +            return tpm_execute(spapr, args);
> +        case TPM_COMM_OP_CLOSE_SESSION:
> +            if (tpm_devfd !=3D -1) {
> +                close(tpm_devfd);
> +                tpm_devfd =3D -1;
> +            }
> +            return H_SUCCESS;
> +        default:
> +            return H_PARAMETER;
> +    }
> +}
> +
> +void spapr_hcall_tpm_reset(void)
> +{
> +    if (tpm_devfd !=3D -1) {
> +        close(tpm_devfd);
> +        tpm_devfd =3D -1;
> +    }
> +}
> +
> +static void hypercall_register_types(void)
> +{
> +    spapr_register_hypercall(H_TPM_COMM, h_tpm_comm);
> +}
> +
> +type_init(hypercall_register_types)
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index f76448f532..96dad767a1 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -25,6 +25,10 @@ spapr_update_dt(unsigned cb) "New blob %u bytes"
>  spapr_update_dt_failed_size(unsigned cbold, unsigned cbnew, unsigned mag=
ic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
>  spapr_update_dt_failed_check(unsigned cbold, unsigned cbnew, unsigned ma=
gic) "Old blob %u bytes, new blob %u bytes, magic 0x%x"
> =20
> +# spapr_hcall_tpm.c
> +spapr_h_tpm_comm(const char *device_path, uint64_t operation) "tpm_devic=
e_path=3D%s operation=3D0x%"PRIu64
> +spapr_tpm_execute(uint64_t data_in, uint64_t data_in_sz, uint64_t data_o=
ut, uint64_t data_out_sz) "data_in=3D0x%"PRIx64", data_in_sz=3D%"PRIu64", d=
ata_out=3D0x%"PRIx64", data_out_sz=3D%"PRIu64
> +
>  # spapr_iommu.c
>  spapr_iommu_put(uint64_t liobn, uint64_t ioba, uint64_t tce, uint64_t re=
t) "liobn=3D0x%"PRIx64" ioba=3D0x%"PRIx64" tce=3D0x%"PRIx64" ret=3D%"PRId64
>  spapr_iommu_get(uint64_t liobn, uint64_t ioba, uint64_t ret, uint64_t tc=
e) "liobn=3D0x%"PRIx64" ioba=3D0x%"PRIx64" ret=3D%"PRId64" tce=3D0x%"PRIx64
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 60553d32c4..7bd47575d7 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -198,6 +198,7 @@ struct SpaprMachineState {
>      SpaprXive  *xive;
>      SpaprIrq *irq;
>      qemu_irq *qirqs;
> +    char *tpm_device_file;
> =20
>      bool cmd_line_caps[SPAPR_CAP_NUM];
>      SpaprCapabilities def, eff, mig;
> @@ -490,8 +491,9 @@ struct SpaprMachineState {
>  #define H_INT_ESB               0x3C8
>  #define H_INT_SYNC              0x3CC
>  #define H_INT_RESET             0x3D0
> +#define H_TPM_COMM              0xEF10
> =20
> -#define MAX_HCALL_OPCODE        H_INT_RESET
> +#define MAX_HCALL_OPCODE        H_TPM_COMM
> =20
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.
> @@ -864,6 +866,9 @@ int spapr_caps_post_migration(SpaprMachineState *spap=
r);
> =20
>  void spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
>                            Error **errp);
> +
> +void spapr_hcall_tpm_reset(void);
> +
>  /*
>   * XIVE definitions
>   */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0oLLsACgkQbDjKyiDZ
s5K0uw/+OY3EFdbBV4M57R4jNr1m3JaE30qj4FCMpq/KVzeSALAM08j6DknYBqm+
uXRWmI3Yzaxb1HiAYDb38hbpsJOkjwRuEfWCuYeASDNi3AqaNA9UkqLo/HZ6st0s
xcUqPNNtIxzGasJTzmJpRGCctAymS/v/d6vJyCPu8/1pKb+/FeybZpt7I+t4XaDA
GWhXHSlH9NiK675OF22yjddz3PJkg1yREWyBrFsNUgPaTO0ydejEK9f6erJcBLR1
ViDCiG1PskWVq0xpDHD1XypcB9MAq1SlFF3Bc+2AfYWkBUWTSvnArqI1mOMjOFz2
acn/tI9w0sBWVvnKxw9wuJY1jBT+kTL2IX/w/W1foRnMhRZlIvno/hhzUO3Xdme9
V3LOXoBa3xYx7B5dX+dYX1ftIuuq0ZZEmuKHlvSEZ1oT6OrxM0jKQOa7jgZRIEOO
FtTrDkscoAxa6LtBB4b1Z4ejUCdD08RMvzvYYx85WvDvAvgQLw4ICrXzYxwVBJPa
6C7t3fOehM8z5yg+p1c8DJYwsx2upG4RgzJBmNhP5P/HVwXIWEWXEPZRJfgVtJha
77ZFpOTsi9rDIUvinR8iNhcJkYEgpfq18RKaZ/kvSeV6Nexhunouc6+RLUO/PGvh
kCf3m43UhsJGqXVbIwgLHlolW8jRg4GY9MuEcR5Xl+MsMXqXAFU=
=w02J
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--

