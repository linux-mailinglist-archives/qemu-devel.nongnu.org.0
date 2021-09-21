Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E1412EB5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:40:47 +0200 (CEST)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZSQ-0004ew-IY
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSZM7-0002Jb-Gt; Tue, 21 Sep 2021 02:34:15 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSZM3-0002xe-U1; Tue, 21 Sep 2021 02:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632206039;
 bh=NsRLljEEFUoh5BRCbSG2i/cbqOMfUnrjSang9GEHcHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SpNrXtRg2X+sO75CSH6WbOmrRUO/Evpz+2KbWhqNq1SrAmsSD0Z5N/zZqk+lrGN1p
 nWdhxQqB+06gK732Op22r8jr5qYLcN0+YLdnZ+NjDvjm4Gs75YlamoiiP2KQRmV/69
 l7lGcxiB/XnDqijerD9fYkt+lvgVmpQnLhhjuUvQ=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HDBTg37yGz9t0p; Tue, 21 Sep 2021 16:33:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 16:32:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH REBASED v5 2/2] spapr: nvdimm: Introduce spapr-nvdimm
 device
Message-ID: <YUl8e5NLb1Jnn5W6@yekko>
References: <162571302321.1030381.15196355582642786915.stgit@lep8c.aus.stglabs.ibm.com>
 <162571304881.1030381.2406869533148471546.stgit@lep8c.aus.stglabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R6vzE2RZledxjS/Z"
Content-Disposition: inline
In-Reply-To: <162571304881.1030381.2406869533148471546.stgit@lep8c.aus.stglabs.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: nvdimm@lists.linux.dev, aneesh.kumar@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--R6vzE2RZledxjS/Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 07, 2021 at 09:57:31PM -0500, Shivaprasad G Bhat wrote:
> If the device backend is not persistent memory for the nvdimm, there is
> need for explicit IO flushes on the backend to ensure persistence.
>=20
> On SPAPR, the issue is addressed by adding a new hcall to request for
> an explicit flush from the guest when the backend is not pmem. So, the
> approach here is to convey when the hcall flush is required in a device
> tree property. The guest once it knows the device backend is not pmem,
> makes the hcall whenever flush is required.
>=20
> To set the device tree property, the patch introduces a new papr specific
> device type inheriting the nvdimm device. When the backend doesn't have
> pmem=3D"yes", the device tree property "ibm,hcall-flush-required" is set,
> and the guest makes hcall H_SCM_FLUSH requesting for an explicit flush.
>=20
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  hw/ppc/spapr_nvdimm.c         |   46 +++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/ppc/spapr_nvdimm.h |    4 ++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 4f8931ab15..4dc7c3f147 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -54,6 +54,8 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev,=
 NVDIMMDevice *nvdimm,
>  {
>      const MachineClass *mc =3D MACHINE_GET_CLASS(hotplug_dev);
>      const MachineState *ms =3D MACHINE(hotplug_dev);
> +    PCDIMMDevice *dimm =3D PC_DIMM(nvdimm);
> +    MemoryRegion *mr =3D host_memory_backend_get_memory(dimm->hostmem);
>      g_autofree char *uuidstr =3D NULL;
>      QemuUUID uuid;
>      int ret;
> @@ -91,6 +93,14 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev=
, NVDIMMDevice *nvdimm,
>          return false;
>      }
> =20
> +    if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM) &&
> +        (memory_region_get_fd(mr) < 0)) {
> +        error_setg(errp, "spapr-nvdimm device requires the "
> +                   "memdev %s to be of memory-backend-file type",
> +                   object_get_canonical_path_component(OBJECT(dimm->host=
mem)));

It's not obvious to me why the spapr nvdimm device has an additional
restriction here over the regular nvdimm device.

> +        return false;
> +    }
> +
>      return true;
>  }
> =20
> @@ -162,6 +172,21 @@ static int spapr_dt_nvdimm(SpaprMachineState *spapr,=
 void *fdt,
>                               "operating-system")));
>      _FDT(fdt_setprop(fdt, child_offset, "ibm,cache-flush-required", NULL=
, 0));
> =20
> +    if (object_dynamic_cast(OBJECT(nvdimm), TYPE_SPAPR_NVDIMM)) {
> +        bool is_pmem =3D false;
> +#ifdef CONFIG_LIBPMEM
> +        PCDIMMDevice *dimm =3D PC_DIMM(nvdimm);
> +        HostMemoryBackend *hostmem =3D dimm->hostmem;
> +
> +        is_pmem =3D object_property_get_bool(OBJECT(hostmem), "pmem",
> +                                           &error_abort);

Presenting to the guest a property of the backend worries me
slightly.  How the backends are synchronized between the source and
destination is out of scope for qemu: is there any possibility that we
could migrate from a host where the backend is pmem to one where it is
not (or the reverse).

I think at the least we want a property on the spapr-nvdimm object
which will override what's presented to the guest (which, yes, might
mean lying to the guest).  I think that could be important for
testing, if nothing else.

> +#endif
> +        if (!is_pmem) {
> +            _FDT(fdt_setprop(fdt, child_offset, "ibm,hcall-flush-require=
d",
> +                             NULL, 0));
> +        }
> +    }
> +
>      return child_offset;
>  }
> =20
> @@ -585,7 +610,16 @@ static target_ulong h_scm_flush(PowerPCCPU *cpu, Spa=
prMachineState *spapr,
>      }
> =20
>      dimm =3D PC_DIMM(drc->dev);
> +    if (!object_dynamic_cast(OBJECT(dimm), TYPE_SPAPR_NVDIMM)) {
> +        return H_PARAMETER;
> +    }

Hmm.  If you're going to make flushes specific to spapr nvdimms, you
could put the queue of pending flushes into the spapr-nvdimm object,
rather than having a global list in the machine.

> +
>      backend =3D MEMORY_BACKEND(dimm->hostmem);
> +#ifdef CONFIG_LIBPMEM
> +    if (object_property_get_bool(OBJECT(backend), "pmem", &error_abort))=
 {
> +        return H_UNSUPPORTED;

Could you make this not be UNSUPPORTED, but instead fake the flush for
the pmem device?  Either as a no-op, or simulating the guest invoking
the right cpu cache flushes?  That seems like it would be more useful:
that way users who don't care too much about performance could just
always do a flush hcall and not have to have another path for the
"real" pmem case.

> +    }
> +#endif
>      fd =3D memory_region_get_fd(&backend->mr);
> =20
>      if (fd < 0) {
> @@ -766,3 +800,15 @@ static void spapr_scm_register_types(void)
>  }
> =20
>  type_init(spapr_scm_register_types)
> +
> +static TypeInfo spapr_nvdimm_info =3D {
> +    .name          =3D TYPE_SPAPR_NVDIMM,
> +    .parent        =3D TYPE_NVDIMM,
> +};
> +
> +static void spapr_nvdimm_register_types(void)
> +{
> +    type_register_static(&spapr_nvdimm_info);
> +}
> +
> +type_init(spapr_nvdimm_register_types)
> diff --git a/include/hw/ppc/spapr_nvdimm.h b/include/hw/ppc/spapr_nvdimm.h
> index 24d8e37b33..fb4e56418e 100644
> --- a/include/hw/ppc/spapr_nvdimm.h
> +++ b/include/hw/ppc/spapr_nvdimm.h
> @@ -13,6 +13,10 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
> =20
> +#define TYPE_SPAPR_NVDIMM "spapr-nvdimm"
> +OBJECT_DECLARE_SIMPLE_TYPE(SpaprNVDIMMDevice, SPAPR_NVDIMM)
> +
> +typedef struct SpaprNVDIMMDevice  SpaprNVDIMMDevice;
>  typedef struct SpaprDrc SpaprDrc;
>  typedef struct SpaprMachineState SpaprMachineState;
> =20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--R6vzE2RZledxjS/Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJfHsACgkQbDjKyiDZ
s5LpVRAAh46RIJyui8X4bCzAlHqrpp1IIm7YtbPsywngD9UZgkJfhBzqLnUC9GoM
bqOslsGRKNyVUtwc5pBjkoZkDHrc8ZVDAlwrn+4jl0LBD9oAnSfMjukeRxf9lJ4Y
s6mGd7SnPqy0EgezCCH6hj4YmcyMvqstCApkUWqglmoULr1hpLw3pkmP/bYHysOy
FArrhU8o3LU03JBlhfH/RqHu4WFLKPxsLM9KONCHHNjYzlpZP/Y/iE70viWpiWiQ
AXAvb6FUrCNEk3YFechA7SJJPXPkgK/T3Up7SHogIJQ5Ws9v1knyUhOWj2AE7H4B
s2+OVuh3JuEfeQSy2l0n05zGcLUnZYI56t1xiy4u8WUFbcySntXM9TrsvV1QLcFg
YWzzxK1ZQXRKQWU4dIwQc/jJD8sRt8+el0/szQ2quib2Vyyfg0FGNkNbR2ZAHwEd
bSKihW53wAvVnToLnYpm+6TE4a4X6nPx+wiNkkTtbYiKYKfI1FZ/aD0Yyvdb7cSf
KLa2SmJdFx0fBT+1Q9u3dqYr9krjvm+1rm8+7IIQ+QZAzHJkvvnQR1oJpRjsWUvU
J8x1m9WjrfTKhrle9pkAu4KOoZLCDlMttquU3ySASub4NMxWSRlFxUCVzFXv0DAU
817HZn67ZeM8hrp/OkDBikz6AlCxSlBMNHnLzMfbTFMgxAI+Azg=
=Crkm
-----END PGP SIGNATURE-----

--R6vzE2RZledxjS/Z--

