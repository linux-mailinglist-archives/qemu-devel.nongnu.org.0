Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5863F2DBB49
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:36:28 +0100 (CET)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQQF-0003L3-5Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpQJy-000707-BO; Wed, 16 Dec 2020 01:29:58 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35097 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpQJr-0004ua-VD; Wed, 16 Dec 2020 01:29:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cwlbb5hGZz9sRR; Wed, 16 Dec 2020 17:29:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608100187;
 bh=2FjAdWifZZ2GL73Z6qAZ/IFQbaTElw61Xi8QDjR/Sf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VkKLqEVXirwUOpi4aSnhKsVNs5nM6fuvMLCpzJvBhDmpqtui4R87cwA3PLnXzLqO8
 LWPKq420YvqZ1UlkYfZ88OgdE48PfiZj8IeB2b/Lk7XfCpUNTDgDAIKS3Ui3skRvxA
 fxGgJUJp42Pw/ZSFYKoWSbZ2g6Rkl3lk0JGwgORc=
Date: Wed, 16 Dec 2020 16:45:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH REPOST] spapr: Allow memory unplug to always succeed
Message-ID: <20201216054507.GA310465@yekko.fritz.box>
References: <160794035064.23292.17560963281911312439.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <160794035064.23292.17560963281911312439.stgit@bahia.lan>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 11:05:50AM +0100, Greg Kurz wrote:
65;6201;1c> It is currently impossible to hot-unplug a memory device between
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
> ---
> This patch was initially posted before the compat machine types
> for 6.0 got merged upstream. During the same period, David was
> also transitioning from github to gitlab, and the patch didn't
> applied cleanly. Now it does. Just reposting it unchanged for
> convenience.

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c         |    6 +++++-
>  hw/ppc/spapr_events.c  |    3 ++-
>  include/hw/ppc/spapr.h |    1 +
>  3 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index dee48a0043bb..481c800a5a33 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4051,7 +4051,8 @@ static void spapr_machine_device_unplug_request(Hot=
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
> @@ -4537,8 +4538,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
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
> index 3f37b49fd8ad..6aedd988b3d0 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -658,7 +658,8 @@ static void spapr_hotplug_req_event(uint8_t hp_id, ui=
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
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index e0f10f252c08..06a5b4259f20 100644
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
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/ZnuMACgkQbDjKyiDZ
s5JRog/8D9xX6+owH9fwzJS4geESxUo+F9AY+YEVz+GtA+bhP8lSjpocXFcFNvby
/u2o0XbCI3M0u0XJM6xxHsdCFdrwjNQoOp3uBHgfz4P7AVKtn0HYmwYm+AObbpkT
+wIqSL0XxtZSGIE4afrBUJ1Is8/ctgAca1Du+WX5ZdOK/dBjun+c0dBCKgJ6G8bu
VCJ/ObX/X1Ri5SWdZ+u24YV1lbHQI4cHbSGnqAwCJXKUHwWnoEu0M96O5FMbuq+I
EZM8K2A7ZWCabv5somqc+ZWIQ+Ug/UzHkD8j+qDIFooUW76L2GYA5uMc3V05gD/L
2ZW9IQy4OHrGewEgLr2ApbBY/6hgZRrgjjJWL+apSxxIEr2zb29KSnrl+GHU1No9
XjnAtyHpdUbBFSaDwl5ZBrfWcGbGbIGcLLQfi/AxCGa58OiSisV7nyL8e+iQL1dm
Y9/G2X9oByP+ytxCYIeoIr/Iz6OaF+Pi6iSzXt6B1j9FK2q2kWfT2vY6l7dO2vNu
8NxIQrSWdODGcaSZJC6gLstlUQSof/hsQvhdS1MzTr1QdElLqy/oLMm7L/8cqdim
gPTnAgs5t3KWWVBd/x7mxRWWJNhNAFUk1ZQB2F0IpOekpAd6+rJMfToTznCI/iQn
IF8DEdJx21kxLiKO0HGMQDUx+DbD/MFzA57G/uaE9s63AMdHk4E=
=s4C4
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

