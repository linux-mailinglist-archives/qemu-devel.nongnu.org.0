Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179816B7CD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 03:34:29 +0100 (CET)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Q3I-0008PW-8P
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 21:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1j6Q2V-0007w8-IP
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:33:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1j6Q2T-0001J9-BI
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:33:39 -0500
Received: from ozlabs.org ([203.11.71.1]:54191)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1j6Q2S-0001Gg-Iw; Mon, 24 Feb 2020 21:33:37 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48RNK80NL0z9sQt; Tue, 25 Feb 2020 13:33:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1582598012;
 bh=pfA0U7ghr86Mf28OFrqEpdJS6LwoMzPmLrYHU/8d5fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8VpGMZ1IGXKrfSd4UrChD0YWM3HXU6Ri+BzgyayxgptAfDsaeqCNKqY6Q3BvLRVE
 akNgCisT/D15wx8Peysb0RTOSu90MWtv9l8XTqqsVJMWUEJ8qSTpf3f4sFCrg8hdBo
 ln/dg1zaWAwQqbAdCNgdXVkhV2wAeeC37ouEzJuo=
Date: Tue, 25 Feb 2020 11:55:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Handle pending hot plug/unplug requests at CAS
Message-ID: <20200225005554.GF41629@umbus.fritz.box>
References: <158257222352.4102917.8984214333937947307.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Content-Disposition: inline
In-Reply-To: <158257222352.4102917.8984214333937947307.stgit@bahia.lan>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 08:23:43PM +0100, Greg Kurz wrote:
> If a hot plug or unplug request is pending at CAS, we currently trigger
> a CAS reboot, which severely increases the guest boot time. This is
> because SLOF doesn't handle hot plug events and we had no way to fix
> the FDT that gets presented to the guest.
>=20
> We can do better thanks to recent changes in QEMU and SLOF:
>=20
> - we now return a full FDT to SLOF during CAS
>=20
> - SLOF was fixed to correctly detect any device that was either added or
>   removed since boot time and to update its internal DT accordingly.
>=20
> The right solution is to process all pending hot plug/unplug requests
> during CAS: convert hot plugged devices to cold plugged devices and
> remove the hot unplugged ones, which is exactly what spapr_drc_reset()
> does. Also clear all hot plug events that are currently queued since
> they're no longer relevant.
>=20
> Note that SLOF cannot currently populate hot plugged PCI bridges or PHBs
> at CAS. Until this limitation is lifted, SLOF will reset the machine when
> this scenario occurs : this will allow the FDT to be fully processed when
> SLOF is started again (ie. the same effect as the CAS reboot that would
> occur anyway without this patch).
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

LGTM, applied to ppc-for-5.0.

> ---
>  hw/ppc/spapr_events.c  |   13 +++++++++++++
>  hw/ppc/spapr_hcall.c   |   11 +++++------
>  include/hw/ppc/spapr.h |    1 +
>  3 files changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 8b32b7eea526..2afd1844e4d4 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -983,6 +983,19 @@ void spapr_clear_pending_events(SpaprMachineState *s=
papr)
>      }
>  }
> =20
> +void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr)
> +{
> +    SpaprEventLogEntry *entry =3D NULL, *next_entry;
> +
> +    QTAILQ_FOREACH_SAFE(entry, &spapr->pending_events, next, next_entry)=
 {
> +        if (spapr_event_log_entry_type(entry) =3D=3D RTAS_LOG_TYPE_HOTPL=
UG) {
> +            QTAILQ_REMOVE(&spapr->pending_events, entry, next);
> +            g_free(entry->extended_log);
> +            g_free(entry);
> +        }
> +    }
> +}
> +
>  void spapr_events_init(SpaprMachineState *spapr)
>  {
>      int epow_irq =3D SPAPR_IRQ_EPOW;
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 6db3dbde9c92..5992849c1664 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1640,7 +1640,7 @@ static uint32_t cas_check_pvr(SpaprMachineState *sp=
apr, PowerPCCPU *cpu,
>      return best_compat;
>  }
> =20
> -static bool spapr_transient_dev_before_cas(void)
> +static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spa=
pr)
>  {
>      Object *drc_container;
>      ObjectProperty *prop;
> @@ -1658,10 +1658,11 @@ static bool spapr_transient_dev_before_cas(void)
>                                                            prop->name, NU=
LL));
> =20
>          if (spapr_drc_transient(drc)) {
> -            return true;
> +            spapr_drc_reset(drc);
>          }
>      }
> -    return false;
> +
> +    spapr_clear_pending_hotplug_events(spapr);
>  }
> =20
>  static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
> @@ -1834,9 +1835,7 @@ static target_ulong h_client_architecture_support(P=
owerPCCPU *cpu,
> =20
>      spapr_irq_update_active_intc(spapr);
> =20
> -    if (spapr_transient_dev_before_cas()) {
> -        spapr->cas_reboot =3D true;
> -    }
> +    spapr_handle_transient_dev_before_cas(spapr);
> =20
>      if (!spapr->cas_reboot) {
>          void *fdt;
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 09110961a589..a4216935a148 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -824,6 +824,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
>  void spapr_reallocate_hpt(SpaprMachineState *spapr, int shift,
>                            Error **errp);
>  void spapr_clear_pending_events(SpaprMachineState *spapr);
> +void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
>  int spapr_max_server_number(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5UcJoACgkQbDjKyiDZ
s5JkhQ/+P8jhAuoYyCjasXHgiCxR0qmo3lkso1fq31TIbk8u7qLldXF7n/zCQZ8z
5lqq6MHOhGsVO/DxCcfYMUE5e8/exneOz9adu9eFA/Kn2XpRmPzGEPmt2yuhVrcu
2lMYC1v+83AJc8cINpyBMKU6TxeYNqxQcFMV1D7fkyTvm5iwVrk8M2ye4Yo2kdxL
BEWJ+0eDMYX2EHIUBx+nerze3WnZHtJsD+8wnHVl9YhmLK0GahZVrgUSdqOf15gD
Pr5HvPZjGVRsRc7KU6OCwloJeR4fVZvJk9FaBj+3C+qeRhndghRKZFfwKcRKBoYn
FK+JPntB70j7mHPiu2mRrTfCyfZETjZqB8gkGIyfSOdY2LKvwR33HU5bcigDj8GQ
2cmvXFxxoU9bmSMbmtDAsa3KNLWRlU/cIV1ajN9MAHwtumSpB6Yhb7Q9Aoo6x7XH
93xnSOD70Y+9kSa2ZzBAG9CmAMcqaMcrgJgqsYLrwhulyKtz+yEP+a4lwhoO2mZs
bUWXmB5mUmGNvdu8Cxp2VinyyTAgzySAp2N2Hvujouq1ZWbg+HFGD+ww6nMdUpCw
kZa+Ibm9xODPvzsCZK9jN6k99ZYjZscE+NM6AalcVvLOgsIE3NkK8tfg8Gm9UU9h
fr6pBH2Okj/ICUFgAQW82V4fXs1XuOKrY5gebvFwkB3e47sxAK4=
=hFLz
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--

