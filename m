Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12C2F4128
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 02:25:21 +0100 (CET)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzUuV-0006uK-Uz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 20:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqW-0004pK-Qx; Tue, 12 Jan 2021 20:21:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:51291 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzUqU-0006Tx-8G; Tue, 12 Jan 2021 20:21:12 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFqQT6Yjtz9sWr; Wed, 13 Jan 2021 12:21:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610500865;
 bh=sZIVH+CZu1TxpNvU1X1FxGUjx+7JXcpnKHzPCoUWr/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hXqUpOULlbnfLFaEjNRxpCbqz0bar3n1QMlISX3Gv5RTJDPuBZAThqP9lPokd0x2b
 HLhIa7DAGQ8SdyJO4XS5B96NW5n5HjsN2eMZWWkP0K5RqwkDI91sZWOI5aeRwcNc/0
 CRJkFxB5sh5DMf/JxDrgCOXsHw2bEuYcTLNW21mU=
Date: Wed, 13 Jan 2021 12:20:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Improve handling of memory unplug with old guests
Message-ID: <20210113012058.GJ435587@yekko.fritz.box>
References: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BOmey7/79ja+7F5w"
Content-Disposition: inline
In-Reply-To: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BOmey7/79ja+7F5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 06:31:27PM +0100, Greg Kurz wrote:
> Since commit 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
> trying to unplug memory from a guest that doesn't support it (eg. rhel6)
> no longer generates an error like it used to. Instead, it leaves the
> memory around : only a subsequent reboot or manual use of drmgr within
> the guest can complete the hot-unplug sequence. A flag was added to
> SpaprMachineClass so that this new behavior only applies to the default
> machine type.
>=20
> We can do better. CAS processes all pending hot-unplug requests. This
> means that we don't really care about what the guest supports if
> the hot-unplug request happens before CAS.
>=20
> All guests that we care for, even old ones, set enough bits in OV5
> that lead to a non-empty bitmap in spapr->ov5_cas. Use that as a
> heuristic to decide if CAS has already occured or not.
>=20
> Always accept unplug requests that happen before CAS since CAS will
> process them. Restore the previous behavior of rejecting them after
> CAS when we know that the guest doesn't support memory hot-unplug.
>=20
> This behavior is suitable for all machine types : this allows to
> drop the pre_6_0_memory_unplug flag.
>=20
> Fixes: 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied, sorry it too me so long.

> ---
>  hw/ppc/spapr.c              |   24 +++++++++++++-----------
>  hw/ppc/spapr_events.c       |    3 +--
>  hw/ppc/spapr_ovec.c         |    7 +++++++
>  include/hw/ppc/spapr.h      |    2 +-
>  include/hw/ppc/spapr_ovec.h |    1 +
>  5 files changed, 23 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2c403b574e37..6c47466fc2f1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4048,6 +4048,18 @@ static void spapr_machine_device_unplug(HotplugHan=
dler *hotplug_dev,
>      }
>  }
> =20
> +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr)
> +{
> +    return spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT) ||
> +        /*
> +         * CAS will process all pending unplug requests.
> +         *
> +         * HACK: a guest could theoretically have cleared all bits in OV=
5,
> +         * but none of the guests we care for do.
> +         */

Hrm.  This is pretty ugly - I thought we had a better canonical way of
determining if CAS had already happened this boot, but it appears
not.  I don't want to delay this patch, since it is an important fix,
but it would be nice if you could do a later cleanup to have a nicer
way of detecting CAS-hasn't-happened.

> +        spapr_ovec_empty(spapr->ov5_cas);
> +}
> +
>  static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_=
dev,
>                                                  DeviceState *dev, Error =
**errp)
>  {
> @@ -4056,16 +4068,9 @@ static void spapr_machine_device_unplug_request(Ho=
tplugHandler *hotplug_dev,
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> =20
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -        if (!smc->pre_6_0_memory_unplug ||
> -            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
> +        if (spapr_memory_hot_unplug_supported(sms)) {
>              spapr_memory_unplug_request(hotplug_dev, dev, errp);
>          } else {
> -            /* NOTE: this means there is a window after guest reset, pri=
or to
> -             * CAS negotiation, where unplug requests will fail due to t=
he
> -             * capability not being detected yet. This is a bit differen=
t than
> -             * the case with PCI unplug, where the events will be queued=
 and
> -             * eventually handled by the guest after boot
> -             */
>              error_setg(errp, "Memory hot unplug not supported for this g=
uest");
>          }
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
> @@ -4543,11 +4548,8 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> -    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> -
>      spapr_machine_6_0_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> -    smc->pre_6_0_memory_unplug =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 6aedd988b3d0..d51daedfa6e0 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -658,8 +658,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, ui=
nt8_t hp_action,
>          /* we should not be using count_indexed value unless the guest
>           * supports dedicated hotplug event source
>           */
> -        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug =
||
> -                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
> +        g_assert(spapr_memory_hot_unplug_supported(spapr));
>          hp->drc_id.count_indexed.count =3D
>              cpu_to_be32(drc_id->count_indexed.count);
>          hp->drc_id.count_indexed.index =3D
> diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
> index dd003f1763fd..b2567caa5cf4 100644
> --- a/hw/ppc/spapr_ovec.c
> +++ b/hw/ppc/spapr_ovec.c
> @@ -125,6 +125,13 @@ bool spapr_ovec_test(SpaprOptionVector *ov, long bit=
nr)
>      return test_bit(bitnr, ov->bitmap) ? true : false;
>  }
> =20
> +bool spapr_ovec_empty(SpaprOptionVector *ov)
> +{
> +    g_assert(ov);
> +
> +    return bitmap_empty(ov->bitmap, OV_MAXBITS);
> +}
> +
>  static void guest_byte_to_bitmap(uint8_t entry, unsigned long *bitmap,
>                                   long bitmap_offset)
>  {
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 1cc19575f548..3ad2ff713279 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -142,7 +142,6 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> -    bool pre_6_0_memory_unplug;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,=20
> @@ -950,4 +949,5 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, h=
waddr pagesize,
> =20
>  void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>  hwaddr spapr_get_rtas_addr(void);
> +bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
>  #endif /* HW_SPAPR_H */
> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
> index d4dee9e06a01..48b716a060c2 100644
> --- a/include/hw/ppc/spapr_ovec.h
> +++ b/include/hw/ppc/spapr_ovec.h
> @@ -71,6 +71,7 @@ void spapr_ovec_cleanup(SpaprOptionVector *ov);
>  void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
>  void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
>  bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
> +bool spapr_ovec_empty(SpaprOptionVector *ov);
>  SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int =
vector);
>  int spapr_dt_ovec(void *fdt, int fdt_offset,
>                    SpaprOptionVector *ov, const char *name);
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BOmey7/79ja+7F5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/+SvoACgkQbDjKyiDZ
s5IfhRAA1vJ1ReFC92PVYGafUPOuUDet3b+Ui9Ju10Nmd8sCltUn1I6WsBollx3g
6lX6aeBnQ0oNsUKWmd7xq6MMapR+YYGbiCx/rEliqSDIMCMUl+FBOoABS6YVxRi4
OdQ18Ljo3o0gWfHHc7mxVlCtnmI/vW4YN9HAndJas+57lFGz5+ssp8FbGSA1bI79
VOlZIT+zI0hMsa0Xkn2YCN0bjfyZpBznmEjVjnWHlMQYYo2jJ+dQ6/TTbxXb/839
QAghuEjjO5kvHbt+J7d4xNYdCui0HvDDwFNNPY4lhg6l/VPNDJa2Ej6XWT6F3BOs
GN+0/fQtOX+l+N51+4yIJzsuuCjHFvc4mSw1eR828rF/cYPWr0jiN5qZ+3zczVQK
OjEcEMIZdazYNKRfpY3EiNI0pfgvlm12EP0xddS6mh/+fnpmwzo/pAbC59BZSrxE
BylDXMuHDYsO0+MyWDDRbBVa845Ygm/I8ZPHY5IkpyAc74dtkElw6GGiDZ41TRXv
uPKWiK1X+oKyJoFyqgIRAbnDbNjbcbNwr/cUoUEq6L+epJQM7hs8v7S0wvUE49cP
mBkuYsnZ5lRtj8TrAakLMlsjz9QZHW6fBmsNcyeyxxNZf6qqv2G406pZeYiv2xg9
d5nNbPL+EZkYjgoGY6DPgjTW9GpQgj/rm9qrosZ2ezgv+/h3ypM=
=HycG
-----END PGP SIGNATURE-----

--BOmey7/79ja+7F5w--

