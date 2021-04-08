Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C62357A9E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 05:02:10 +0200 (CEST)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUKvp-0000lC-50
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 23:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKtk-00005f-Vw; Wed, 07 Apr 2021 23:00:01 -0400
Received: from ozlabs.org ([203.11.71.1]:41367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lUKti-0004gi-1m; Wed, 07 Apr 2021 23:00:00 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FG5bD4RDsz9sWQ; Thu,  8 Apr 2021 12:59:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617850792;
 bh=PC4LJaBOMzcsljMAInfqDD6y2D1E41cpTqt1ZnKlP/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bke8p/2esqc3nNRpHAVDyMpEytRdOfRZCyTUTPgJNkO937NByQnGBT03MmYXp6uRU
 ShzTqhBuntJy1EC9HTqlCB2UQQc56EGaIRt0b2VBs/F4OQ8fKL1xBIz+ZOgRD1/WMD
 dcoXB2nM94nCZa8SM5nmG0ov97HcXX/8ZzooJrVY=
Date: Thu, 8 Apr 2021 12:58:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] ppc/spapr: Add support for implement support for
 H_SCM_HEALTH
Message-ID: <YG5xcIRs/lAwniFn@yekko.fritz.box>
References: <20210402102128.213943-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vllbt3Jqk6rt+UYs"
Content-Disposition: inline
In-Reply-To: <20210402102128.213943-1-vaibhav@linux.ibm.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, groug@kaod.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com,
 imammedo@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vllbt3Jqk6rt+UYs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2021 at 03:51:28PM +0530, Vaibhav Jain wrote:
> Add support for H_SCM_HEALTH hcall described at [1] for spapr
> nvdimms. This enables guest to detect the 'unarmed' status of a
> specific spapr nvdimm identified by its DRC and if its unarmed, mark
> the region backed by the nvdimm as read-only.
>=20
> The patch adds h_scm_health() to handle the H_SCM_HEALTH hcall which
> returns two 64-bit bitmaps (health bitmap, health bitmap mask) derived
> from 'struct nvdimm->unarmed' member.
>=20
> Linux kernel side changes to enable handling of 'unarmed' nvdimms for
> ppc64 are proposed at [2].
>=20
> References:
> [1] "Hypercall Op-codes (hcalls)"
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Documentation/powerpc/papr_hcalls.rst#n220
> [2] "powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe"
>     https://lore.kernel.org/linux-nvdimm/20210329113103.476760-1-vaibhav@=
linux.ibm.com/
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
> Changelog
>=20
> v3:
> * Switched to PPC_BIT macro for definitions of the health bits. [ Greg, D=
avid ]
> * Updated h_scm_health() to use a const uint64_t to denote supported
>   bits in 'hbitmap_mask'.
> * Fixed an error check for drc->dev to return H_PARAMETER in case nvdimm
>   is not yet plugged in [ Greg ]
> * Fixed an wrong error check for ensuring drc and drc-type are correct
>   [ Greg ]
>=20
> v2:
> * Added a check for drc->dev to ensure that the dimm is plugged in
>   when servicing H_SCM_HEALTH. [ Shiva ]
> * Instead of accessing the 'nvdimm->unarmed' member directly use the
>   object_property_get_bool accessor to fetch it. [ Shiva ]
> * Update the usage of PAPR_PMEM_UNARMED* macros [ Greg ]
> * Updated patch description reference#1 to point appropriate section
>   in the documentation. [ Greg ]
> ---
>  hw/ppc/spapr_nvdimm.c  | 36 ++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |  3 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index b46c36917c..252204e25f 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -31,6 +31,10 @@
>  #include "qemu/range.h"
>  #include "hw/ppc/spapr_numa.h"
> =20
> +/* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c =
*/
> +/* SCM device is unable to persist memory contents */
> +#define PAPR_PMEM_UNARMED PPC_BIT(0)
> +
>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nv=
dimm,
>                             uint64_t size, Error **errp)
>  {
> @@ -467,6 +471,37 @@ static target_ulong h_scm_unbind_all(PowerPCCPU *cpu=
, SpaprMachineState *spapr,
>      return H_SUCCESS;
>  }
> =20
> +static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *spa=
pr,
> +                                 target_ulong opcode, target_ulong *args)
> +{
> +
> +    NVDIMMDevice *nvdimm;
> +    uint64_t hbitmap =3D 0;
> +    uint32_t drc_index =3D args[0];
> +    SpaprDrc *drc =3D spapr_drc_by_index(drc_index);
> +    const uint64_t hbitmap_mask =3D PAPR_PMEM_UNARMED;
> +
> +
> +    /* Ensure that the drc is valid & is valid PMEM dimm and is plugged =
in */
> +    if (!drc || !drc->dev ||
> +        spapr_drc_type(drc) !=3D SPAPR_DR_CONNECTOR_TYPE_PMEM) {
> +        return H_PARAMETER;
> +    }
> +
> +    nvdimm =3D NVDIMM(drc->dev);
> +
> +    /* Update if the nvdimm is unarmed and send its status via health bi=
tmaps */
> +    if (object_property_get_bool(OBJECT(nvdimm), NVDIMM_UNARMED_PROP, NU=
LL)) {
> +        hbitmap |=3D PAPR_PMEM_UNARMED;
> +    }
> +
> +    /* Update the out args with health bitmap/mask */
> +    args[0] =3D hbitmap;
> +    args[1] =3D hbitmap_mask;
> +
> +    return H_SUCCESS;
> +}
> +
>  static void spapr_scm_register_types(void)
>  {
>      /* qemu/scm specific hcalls */
> @@ -475,6 +510,7 @@ static void spapr_scm_register_types(void)
>      spapr_register_hypercall(H_SCM_BIND_MEM, h_scm_bind_mem);
>      spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
>      spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
> +    spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
>  }
> =20
>  type_init(spapr_scm_register_types)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 47cebaf3ac..6e1eafb05d 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -538,8 +538,9 @@ struct SpaprMachineState {
>  #define H_SCM_BIND_MEM          0x3EC
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_UNBIND_ALL        0x3FC
> +#define H_SCM_HEALTH            0x400
> =20
> -#define MAX_HCALL_OPCODE        H_SCM_UNBIND_ALL
> +#define MAX_HCALL_OPCODE        H_SCM_HEALTH
> =20
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vllbt3Jqk6rt+UYs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBucW8ACgkQbDjKyiDZ
s5LB2Q//UmqKPYnV8TvyJ5l4Cwqwlh+ov9YxeJUNnyqCYhwX8SWpx8xWvcMPhBbK
hjeArKMjBFtsarNgTivi0D7BdNEkh41fTcllZjq9I2rItciXbjh8bh6E8aYvCcyS
nYYVjEqidDaIuRcqsXDC75ZvPD42vtfI22ES60Ma3A4BZfop79G9hnkQhD52Wpcp
tE6jvmXQ0kGLD+hjV5TcNTKeJoF45PBCrrwWqNfnwTsjUT7Hv7e9+b25fet8FVnE
qYLsP6ogtVpjJbYJx3Z8wUY+btGyCyYJoM9SQT41JkcMpkF+JiWHZby85ISi9qoN
lKM+HuFy8lCTR49yJAMJzdyu6g95F0jz7k0GJldX/1i8Fy6aLPwQRp0y/5eiCb+8
I99QLvSZsjxnPkkfMHRhzd8leaAW+xWsOgs9F5ahfYk/MVlls//4I43MECgukXGb
SfzQGpvd8yLCER4dmegZpTl/FL/9PsThRuD2HA463+oTLot/ELUyd5nBMTKcG4rf
Oo+Q58p4hjESoa82Unz8Zg1NV6alKoxjO1BKtb6/V+2preWZ5WbipsZms4XTs5EY
1tMkeHEZl3o/gGvU0L753y92F62e2XQj9Iv52J8Ph2HbuVBr7tjBmo3LNfuuHyAs
RiZTCfY2eM9WegeL1Bksyd0DLp74tM+z1ZdImDZtINT0Bjcjpyo=
=Ea03
-----END PGP SIGNATURE-----

--vllbt3Jqk6rt+UYs--

