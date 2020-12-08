Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E02B2D221C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 05:32:39 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmUg2-0007Js-9a
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 23:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmUdk-0006Op-B9; Mon, 07 Dec 2020 23:30:17 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54689 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kmUdh-0007eH-Ao; Mon, 07 Dec 2020 23:30:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CqnKG2cGGz9sWQ; Tue,  8 Dec 2020 15:30:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607401810;
 bh=gg/Qhy3c0ZdwVsRLHsNmbdRNzvxojHQFcJnFQfjHe74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mM1pVtDV4LsXtUVGtSJAEgOCH++Z96PrL4mpZImzOq3kagANzzfVSQ3YeUa9K21BY
 YSJLBAoWMR5TwEVox3pjvjMRT+iCC0C1Z8XF+lm9eDWRpR6a1OnkdEhiChlRSorhRN
 5rCOylYqDXDd9GupSZ/o6lF2Kr8XXFHD0749XBHQ=
Date: Tue, 8 Dec 2020 15:30:04 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0] spapr: Allow memory unplug to always succeed
Message-ID: <20201208043004.GE2555@yekko.fritz.box>
References: <20201207133704.952459-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BQPnanjtCNWHyqYD"
Content-Disposition: inline
In-Reply-To: <20201207133704.952459-1-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BQPnanjtCNWHyqYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2020 at 02:37:04PM +0100, Greg Kurz wrote:
> It is currently impossible to hot-unplug a memory device between
> machine reset and CAS.
>=20
> (qemu) device_del dimm1
> Error: Memory hot unplug not supported for this guest
>=20
> This limitation was introduced in order to provide an explicit
> error path for older guests that didn't support hot-plug event
> sources (and thus memory hot-unplug).
>=20
> The linux kernel has been supporting these since 4.11. All recent
> enough guests are thus capable of handling the removal of a memory
> device at all time, including during early boot.
>=20
> Lift the limitation for the latest machine type. This means that
> trying to unplug memory from a guest that doesn't support it will
> likely just do nothing and the memory will only get removed at
> next reboot. Such older guests can still get the existing behavior
> by using an older machine type.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Looks like this conflicts with something I've added to for-6.0
recently.  Can you rebase and resend, please.

> ---
> Based-on: 20201109173928.1001764-1-cohuck@redhat.com
> ---
>  include/hw/ppc/spapr.h | 1 +
>  hw/ppc/spapr.c         | 6 +++++-
>  hw/ppc/spapr_events.c  | 3 ++-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index b7ced9faebf5..7aa630350326 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -139,6 +139,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_0_memory_unplug;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 7e954bc84bed..f0b26b2af30d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4044,7 +4044,8 @@ static void spapr_machine_device_unplug_request(Hot=
plugHandler *hotplug_dev,
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> =20
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -        if (spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
> +        if (!smc->pre_6_0_memory_unplug ||
> +            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
>              spapr_memory_unplug_request(hotplug_dev, dev, errp);
>          } else {
>              /* NOTE: this means there is a window after guest reset, pri=
or to
> @@ -4530,8 +4531,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> +
>      spapr_machine_6_0_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    smc->pre_6_0_memory_unplug =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 1add53547ec3..c30123177b16 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -659,7 +659,8 @@ static void spapr_hotplug_req_event(uint8_t hp_id, ui=
nt8_t hp_action,
>          /* we should not be using count_indexed value unless the guest
>           * supports dedicated hotplug event source
>           */
> -        g_assert(spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
> +        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug =
||
> +                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
>          hp->drc_id.count_indexed.count =3D
>              cpu_to_be32(drc_id->count_indexed.count);
>          hp->drc_id.count_indexed.index =3D

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BQPnanjtCNWHyqYD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/PATQACgkQbDjKyiDZ
s5KSFRAA4KbCFwmHI9qLF1900NzI1FfhLZhwlh4Jt92LOQC9DXQtAKV/7cF9Zvs/
XMMSg/dHj9K7ff+APliFugTlhXP0lrH0hZ4deHwa7NAg8NiBRM7cLDQUtK4VciuJ
WLN03NDIuUvP9mm+B+fKDgDIdHN914URJHtVCzrHmPjt6QY8OdCO7GXRGGM1FqOY
b6Khs27xCWNo99AaqC0H+NM7h/IBBmCyNz2IQ34PJrbjyvcNirDhpY1Ii+cfFfLc
wAZ826UzjQKvSzy8gx2ztRpdG4XYtJVukeGgKbhghoDsiXGL36V69qtdctPy+IdI
aOeDlDL99pkqbJ91vAKBd6iMoZh2zOdC+Z0Vs7eABDIOssPpOuvpYYfPSB6Ws+TX
GhoXZuohBVE9w7V5x/uIo/r5WmRD7O9naHSqRoQpuQ0kY2WndCoR80ufy0QIQcC+
RvemyY/TJlkudnhW/EHlo/aJuwIdE9q54S8DB/Ofuq6t3Az3zeOtK/XPwNPsYM/c
iRP1KNDcp62vS925EXAoZtxFtuhaqJSGabc/1yIkDvlLzF0DJZNFyOVH5+EFTCpx
WAvdvt5/qIkxQJrnmRRvlsokiu2miE7SAppAqqg7kohdg8VsJZoFxKt/6ohwfLCw
cSQGT/QVafJPsWRwouEDdI03KYaOhd96lNXK1zB44DBlY/vdsms=
=73wH
-----END PGP SIGNATURE-----

--BQPnanjtCNWHyqYD--

