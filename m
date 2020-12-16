Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9368F2DB7EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 01:50:22 +0100 (CET)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpL1J-00038k-50
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 19:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpKzu-00028D-VQ; Tue, 15 Dec 2020 19:48:54 -0500
Received: from ozlabs.org ([203.11.71.1]:43333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpKzr-0000ug-Vu; Tue, 15 Dec 2020 19:48:54 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cwc233l4hz9sTK; Wed, 16 Dec 2020 11:48:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608079723;
 bh=apY/2BoI7lU1c36HLZmmyOZvYdjXERakFOxLrhU7oNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XrgkOC+cJtHSC8gYGe2yfoHUo0zZydr1RlcjRqWZE+cNWOBAyr9MzRPKUGe1KDLf+
 v9OSdhYBFNQpVktY+FrewmJ8B/l3uLzDORiYnfNgmVAJeEdU1mfjyu+bLumpqTRZkX
 YR15z8bddPov1IoO71h5QFIbV7/URkZg3/sn9Nh0=
Date: Wed, 16 Dec 2020 11:46:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: DRC lookup cannot fail
Message-ID: <20201216004641.GI4717@yekko.fritz.box>
References: <160805381160.228955.5388294067094240175.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GBuTPvBEOL0MYPgd"
Content-Disposition: inline
In-Reply-To: <160805381160.228955.5388294067094240175.stgit@bahia.lan>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GBuTPvBEOL0MYPgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 06:36:51PM +0100, Greg Kurz wrote:
> All memory DRC objects are created during machine init. It is thus safe
> to assume spapr_drc_by_id() cannot return NULL when hot-plug/unplugging
> memory.
>=20
> Make this clear with an assertion, like the code already does a few lines
> above when looping over memory DRCs. This fixes Coverity reports 1437757
> and 1437758.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>  hw/ppc/spapr.c |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index dee48a0043bb..c283ff639040 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3424,6 +3424,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64=
_t addr_start, uint64_t size,
>          if (dedicated_hp_event_source) {
>              drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
>                                    addr_start / SPAPR_MEMORY_BLOCK_SIZE);
> +            g_assert(drc);
>              spapr_hotplug_req_add_by_count_indexed(SPAPR_DR_CONNECTOR_TY=
PE_LMB,
>                                                     nr_lmbs,
>                                                     spapr_drc_index(drc));
> @@ -3664,6 +3665,7 @@ static void spapr_memory_unplug_request(HotplugHand=
ler *hotplug_dev,
> =20
>      drc =3D spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
>                            addr_start / SPAPR_MEMORY_BLOCK_SIZE);
> +    g_assert(drc);
>      spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LM=
B,
>                                                nr_lmbs, spapr_drc_index(d=
rc));
>  }
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GBuTPvBEOL0MYPgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/ZWO8ACgkQbDjKyiDZ
s5JBQRAAgaGSGSBAW1jm5DV+HHrulmH1lm3Za3t9X3MFPz8i8oxCdNK/Riy4cYou
B4k9tSnxTufGwGTkIvddyPvGymsjyJ29MdJlo0GOed+iRzgMLBNfcsRl3TWRezH2
jg1kr1uhSbYjvt7YNlnYzI0DC9x72q0VdwIiDGbcQEC6K/j0lqz+GGwfSAdaLn6K
2A/xR9/DEoibSSAVSNoxkTTk6XWlbimEjkkHUTSYebXNqbzR1zhWsUjODJ5OH//c
706IZXNo4eby5499vfCvB0qTfWBFQAldlpoiyP1Xwt8gE7GntFbPfjXvxZLGG8D2
68G8XbboSbUkBZNSELUtPKVY2PcjHfc6NGdPQBkfJnJ1rmTooxWccjoOrjepdOol
phNXrSuHt9mi+DuH/7HsGG6IoXvC5/ck433t8RZEvDZifpHVKmA4B0IeKOVVrLky
6QMJStXnFDFCuGOYtCQZPerWB5ZaeM+3HuAgq9Mb/xTbChMugZ5NO36ZsgkbusvS
NdmPd75kn4LCds3XOn8bBFxm5Ntur/Ab6zKiux6ORqRNEoQih/Dmg/zfLUCoOWTP
ovr8o6gCw2PJ8+n9DzXePojI5Z3ABHvujeNWJ/pAPsPwfYGemOxycYsxx6UsX1t9
LGkBOq2+JBiYX/oT3YdnCwdd39pXQqSg33de56E/ZOyeY4kAG5w=
=2+sB
-----END PGP SIGNATURE-----

--GBuTPvBEOL0MYPgd--

