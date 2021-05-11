Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24337B3F7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 04:01:29 +0200 (CEST)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgeBk-0006Ff-Rk
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 22:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lge9x-0005Nw-Qq; Tue, 11 May 2021 21:59:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58003 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lge9v-00008w-4J; Tue, 11 May 2021 21:59:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Ffydk5SPwz9sXb; Wed, 12 May 2021 11:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620784762;
 bh=pv+q3ieKZmhhbC/7jjznUgkXE0vqnH/Hu0W7PdJghVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcZifX8KGypzLguGMNqzDNB4s1WHpyutxIFvA04JG/utZTYuUvE/6QxoPDh1CBXwv
 svWsrIIWxxrA6TehmdMhmyzMr8DX4d5OAM7HuOqBv8aVd0fg4QyqngRu11V/YiPsOJ
 5FOrzg3lb73Hzo01NIEfLPlbl1n8DVR+6NXCttd0=
Date: Tue, 11 May 2021 14:50:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH] ppc/spapr: advertise secure boot in the guest device tree
Message-ID: <YJoNJDaN2SlyuwZZ@yekko>
References: <20210510120713.90053-1-dja@axtens.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PLcXZIUGFdj9VZTx"
Content-Disposition: inline
In-Reply-To: <20210510120713.90053-1-dja@axtens.net>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PLcXZIUGFdj9VZTx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:07:13PM +1000, Daniel Axtens wrote:
> The ibm,secure-boot property of the / node determines how firmware
> and the operating system should enforce secure boot. The meaning
> of the various values are:
>=20
>  0   - secure boot is disabled
>  1   - secure boot in log-only mode
>  2   - secure boot enabled and enforced
>  3-9 - secure boot enabled and enforced; requirements at the
>          discretion of the operating system
>=20
> We expose this as two properties:
>=20
>  - secure-boot: determines whether the property is advertised in the
>                 guest device tree. The default is false.
>=20
>  - secure-boot-level: what value is advertised if enabled?
>                       The default is 2.
>=20
> This doesn't make the firmware or OS actually _do_ any verification, it
> just advises them that they should.

So.. what's the point?  AFAIK we have no secure boot support in SLOF,
so what would advertising it in the device tree accomplish?

>=20
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>=20
> ---
>=20
> Linux already reads this property. Versions of SLOF and grub that do
> verification are available on my GitHub:
>  - github.com/daxtens/SLOF branch ibm,secure-boot (not production ready!)
>  - github.com/daxtens/grub branch appendedsig-2.06
> ---
>  hw/ppc/spapr.c         | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |  4 ++++
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3b1a5ed86518..544a412c3d18 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1157,6 +1157,20 @@ static void spapr_dt_hypervisor(SpaprMachineState =
*spapr, void *fdt)
>      }
>  }
> =20
> +static void spapr_dt_stb(SpaprMachineState *spapr, void *fdt)
> +{
> +    /*
> +     * PowerVM may provide fw-secure-boot, which purports to tell a part=
ition
> +     * if the underlying firmware was booted securely. It's not meaningf=
ul
> +     * for KVM as there are no agreed semantics for what it would mean (=
host
> +     * secure boot only gives you integrity for the host kernel, not host
> +     * qemu). So we omit the property for now.
> +     */
> +    if (spapr->secure_boot)
> +        _FDT(fdt_setprop_cell(fdt, 0, "ibm,secure-boot",
> +            spapr->secure_boot_level));
> +}
> +
>  void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
>  {
>      MachineState *machine =3D MACHINE(spapr);
> @@ -1263,6 +1277,9 @@ void *spapr_build_fdt(SpaprMachineState *spapr, boo=
l reset, size_t space)
>          spapr_dt_hypervisor(spapr, fdt);
>      }
> =20
> +    /* /ibm,secureboot */
> +    spapr_dt_stb(spapr, fdt);
> +
>      /* Build memory reserve map */
>      if (reset) {
>          if (spapr->kernel_size) {
> @@ -3298,6 +3315,20 @@ static void spapr_set_host_serial(Object *obj, con=
st char *value, Error **errp)
>      spapr->host_serial =3D g_strdup(value);
>  }
> =20
> +static bool spapr_get_secure_boot(Object *obj, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    return spapr->secure_boot;
> +}
> +
> +static void spapr_set_secure_boot(Object *obj, bool value, Error **errp)
> +{
> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> +
> +    spapr->secure_boot =3D value;
> +}
> +
>  static void spapr_instance_init(Object *obj)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(obj);
> @@ -3353,6 +3384,17 @@ static void spapr_instance_init(Object *obj)
>          spapr_get_host_serial, spapr_set_host_serial);
>      object_property_set_description(obj, "host-serial",
>          "Host serial number to advertise in guest device tree");
> +
> +    /* If we have secure boot, the default level is 2: enable and enforc=
e */
> +    spapr->secure_boot_level =3D 2;
> +    object_property_add_bool(obj, "secure-boot",
> +        spapr_get_secure_boot, spapr_set_secure_boot);
> +    object_property_set_description(obj, "secure-boot",
> +        "Advertise secure boot in the guest device tree");
> +    object_property_add_uint8_ptr(obj, "secure-boot-level",
> +        &spapr->secure_boot_level, OBJ_PROP_FLAG_READWRITE);
> +    object_property_set_description(obj, "secure-boot-level",
> +        "Level of secure boot advertised in the guest device tree");
>  }
> =20
>  static void spapr_machine_finalizefn(Object *obj)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index c421410e3fb8..d829d0c27011 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -210,6 +210,10 @@ struct SpaprMachineState {
>      int fwnmi_machine_check_interlock;
>      QemuCond fwnmi_machine_check_interlock_cond;
> =20
> +    /* Secure Boot */
> +    bool secure_boot;
> +    uint8_t secure_boot_level;
> +
>      /*< public >*/
>      char *kvm_type;
>      char *host_model;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--PLcXZIUGFdj9VZTx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCaDSIACgkQbDjKyiDZ
s5J1lA//WNaWsKb728bN0cl4Pj175fsmLOviQuyYBX468hjcDv/dtAe380060Xqu
LrA9rin1t8jAuetQr1YRv3gCpw4X3/bO5V1LLyfvaQzccwPle10k4drqpnVcbVJW
YJRLfcTVtdN0v0dorfEXAOMemgJ1ZAbChvf84H2qy5W3gmSTFI8Hb7VWAqQThAhs
cwr3vbuZFyenPsmeQbobIbnBDoMa48v0kI1QUJBNgfwCDi4/St2DiVSMc5T6ud/N
TK3SLl+vSA4fZKbDRkftMa7NTFTWcI1kIcflDRV4pEy9f35W2AfLh3RNaY3IU9VE
caObOpvIMXNjupPo6KmrqbNd9IfFBPdVmXZGuMvuhhXdOtzpOAvC0RebZgOlyble
n9o60Xh5yJtdIVx/9VEAJL7yidjyRFpFw/dxSGSNs3Aa+6uxpzF6CFWjAJcovhGt
gWaWXY3EhdAqS+Og0YCGklx+7jb+b8x5dw/go2enQFDHrtYZfWqh0xgPK6PLR5lf
lfheOkvJ3AvhWv//i+Dd+g6lIuxI2vdoAd/HGq/xS6rKqjn26Jn/BR9t/mf8uXqY
8CFtCsh8R0uoGvkqhWjJBjIp6NbLkbmubcv41bVRqayuKYG4416EKgxoiBQyORFs
CS9Hr267xUNO2lQD3Vr+LVIW7MOFyVz/CcO1dXOUc/i5i/cZGhU=
=7mtj
-----END PGP SIGNATURE-----

--PLcXZIUGFdj9VZTx--

