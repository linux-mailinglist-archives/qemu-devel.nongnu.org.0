Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924902E34C6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:36:57 +0100 (CET)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktn5M-0007To-LN
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy3-0002Ig-M3; Mon, 28 Dec 2020 02:29:23 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52825 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy0-0000Mc-Ep; Mon, 28 Dec 2020 02:29:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lh0Ls8z9sWh; Mon, 28 Dec 2020 18:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140556;
 bh=KpvegEa7eNS9vEEkKXY+tKjjLIbgftOeHAfLI/SpSgE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BDSC9yrIaFqrEzxcK8GBYN2UcU/PNIFAoK73RFc8iWfYTWce0A2wFDhwDHWdGJnjR
 K2jvx2uu78E4qmpmHrsXCneQsBH+0udGebh+9X5QrMvAsy+GAzhhODInD46jw/nCGw
 V+oYs78HtNp3h/5aHBimIdKo/FD0fMP2LP5x5mHY=
Date: Mon, 28 Dec 2020 18:24:31 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/6] spapr: Fix reset of transient DR connectors
Message-ID: <20201228072431.GH6952@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-3-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/9ZOS6odDaRI+0hI"
Content-Disposition: inline
In-Reply-To: <20201218103400.689660-3-groug@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/9ZOS6odDaRI+0hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 11:33:56AM +0100, Greg Kurz wrote:
> Documentation of object_property_iter_init() clearly stipulates that
> "it is forbidden to modify the property list while iterating". But this
> is exactly what we do when resetting transient DR connectors during CAS.
> The call to spapr_drc_reset() can finalize the hot-unplug sequence of a
> PHB or a PCI bridge, both of which will then in turn destroy their PCI
> DRCs. This could potentially invalidate the iterator. It is pure luck
> that this haven't caused any issues so far.
>=20
> Change spapr_drc_reset() to return true if it caused a device to be
> removed. Restart from scratch in this case. This can potentially
> increase the overall DRC reset time, especially with a high maxmem
> which generates a lot of LMB DRCs. But this kind of setup is rare,
> and so is the use case of rebooting a guest while doing hot-unplug.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, thanks.

> ---
>  include/hw/ppc/spapr_drc.h | 3 ++-
>  hw/ppc/spapr_drc.c         | 6 +++++-
>  hw/ppc/spapr_hcall.c       | 8 +++++++-
>  3 files changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> index cff5e707d0d9..5d80019f82e2 100644
> --- a/include/hw/ppc/spapr_drc.h
> +++ b/include/hw/ppc/spapr_drc.h
> @@ -224,7 +224,8 @@ static inline bool spapr_drc_hotplugged(DeviceState *=
dev)
>      return dev->hotplugged && !runstate_check(RUN_STATE_INMIGRATE);
>  }
> =20
> -void spapr_drc_reset(SpaprDrc *drc);
> +/* Returns true if an unplug request completed */
> +bool spapr_drc_reset(SpaprDrc *drc);
> =20
>  uint32_t spapr_drc_index(SpaprDrc *drc);
>  SpaprDrcType spapr_drc_type(SpaprDrc *drc);
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8d62f55066b6..5b5e2ac58a7e 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -417,9 +417,10 @@ void spapr_drc_detach(SpaprDrc *drc)
>      spapr_drc_release(drc);
>  }
> =20
> -void spapr_drc_reset(SpaprDrc *drc)
> +bool spapr_drc_reset(SpaprDrc *drc)
>  {
>      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> +    bool unplug_completed =3D false;
> =20
>      trace_spapr_drc_reset(spapr_drc_index(drc));
> =20
> @@ -428,6 +429,7 @@ void spapr_drc_reset(SpaprDrc *drc)
>       */
>      if (drc->unplug_requested) {
>          spapr_drc_release(drc);
> +        unplug_completed =3D true;
>      }
> =20
>      if (drc->dev) {
> @@ -444,6 +446,8 @@ void spapr_drc_reset(SpaprDrc *drc)
>          drc->ccs_offset =3D -1;
>          drc->ccs_depth =3D -1;
>      }
> +
> +    return unplug_completed;
>  }
> =20
>  static bool spapr_drc_unplug_requested_needed(void *opaque)
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 4e9d50c254f0..aa22830ac4bd 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1639,6 +1639,7 @@ static void spapr_handle_transient_dev_before_cas(S=
paprMachineState *spapr)
>      ObjectPropertyIterator iter;
> =20
>      drc_container =3D container_get(object_get_root(), "/dr-connector");
> +restart:
>      object_property_iter_init(&iter, drc_container);
>      while ((prop =3D object_property_iter_next(&iter))) {
>          SpaprDrc *drc;
> @@ -1652,8 +1653,13 @@ static void spapr_handle_transient_dev_before_cas(=
SpaprMachineState *spapr)
> =20
>          /*
>           * This will complete any pending plug/unplug requests.
> +         * In case of a unplugged PHB or PCI bridge, this will
> +         * cause some DRCs to be destroyed and thus potentially
> +         * invalidate the iterator.
>           */
> -        spapr_drc_reset(drc);
> +        if (spapr_drc_reset(drc)) {
> +            goto restart;
> +        }
>      }
> =20
>      spapr_clear_pending_hotplug_events(spapr);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/9ZOS6odDaRI+0hI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/piC8ACgkQbDjKyiDZ
s5I2bxAAmw+O1LDjW9ZgExv1g6XCakIggGWksjmbtJapaHTSaWmlSi9US51EhT0c
WwvKsapQJrETRxS5ajJEZG9XVCY39bO2vZBOs0d6O6dCwiMYcKRRe4NmS4CjDBiy
pS1neUvOl03OKKMD7q5bG0Lyt12g+nBKSWMr3snI0F+dwRvbFcFrwSmR/VUlhOe2
u2mWgbs3B8WDy5dhiGYCKIV+ConFzw+wU54nozTQtWewp0D5XTzYcKxpxcEAFqWh
eRgr21s3MjzMVw7jE9lelyW1Tdzo+zwpIw/DGTb+LYQhgtHfXlgSFzJNTy0RzdnA
XTGRMIVbC9xOKqMFr2wknmol/AnYKc2RrYQivlZWMA9uNVuyHaB93739dRQ6nfOw
3d72+QBkkJeGT30rexdEONhUEv1eaFxok9V94no1Tr1Pv72xfnkHugWAHAY9RKtD
H4XRyCc4YuJkI4nNF4+/G/6aPMh3yrK6CEtFBpMdkukN7E4RRXBd1xRezJx5dVdT
DZdBB0Nc824/kyIIZUyLWZGe6t07GRu6aAw3Vf3+Fth0PdrinbdjKnH8M4KUR3yF
aYpxsGUG1fPybRBOdr5mScRh/Q/dv8wo4YAdmb0nT3zklryc79GetzXh9v/TddlN
OJOukSjnfG5ylAofi/S0yCRQQHS2/KuBCuO4ZM6R7rjoAYYt/Bo=
=xDQN
-----END PGP SIGNATURE-----

--/9ZOS6odDaRI+0hI--

