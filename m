Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442E83295A5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:19:26 +0100 (CET)
Received: from localhost ([::1]:34420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGudA-0001qf-LX
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVq-00068m-VA; Mon, 01 Mar 2021 21:11:50 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43665 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGuVn-0005ZQ-4C; Mon, 01 Mar 2021 21:11:50 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLGb34Qzz9sVw; Tue,  2 Mar 2021 13:11:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614651095;
 bh=rMurwJDyfYyHUXxmJCbOmIlLxMHmbDQ36oY7Wa7mJjw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CgPeru5y+gl6wwbpq8igodsp/jkrDUuaSb47gv8AlF/svSaUY5TqLyF0Ann+LUd6r
 vKAXioqjqWLgypXE9oltIuURUemgghT3f+YtPETarw3mQlayqnCSPatey26sQKmqJT
 VL2fVvnDYm1TiXlZCqms38+dVFlireM2k7wnrzRA=
Date: Tue, 2 Mar 2021 13:03:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 2/5] spapr.c: check unplug_request flag in
 spapr_memory_unplug_request()
Message-ID: <YD2dDcCGenJC27kC@yekko.fritz.box>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5sllHzOWWdMWY84G"
Content-Disposition: inline
In-Reply-To: <20210226163301.419727-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5sllHzOWWdMWY84G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 01:32:58PM -0300, Daniel Henrique Barboza wrote:
> Now that we're asserting the first DRC LMB earlier, use it to query if
> the DRC is already pending unplug and, in this case, issue the same
> error we already do.
>=20
> The previous check was introduced in commit 2a129767ebb1 and it works,
> but it's easier to check the unplug_requested  flag instead of looking
> for the existence of the sPAPRDIMMState. It's also compliant with what
> is already done in other unplug_request functions for other devices.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

I'm having some trouble completely convincing myself this is right.

What about this situation:
     1. We initiate a DIMM unplug
     	- unplug_request is set on all the LMBs
	- all the LMBs go on the pending_unplug list
     2. The guest encounters no problems, and starts issuing set
        indicator calls to mark the LMBs unusable, starting from the
	lowest address
     3. On drc_set_unusable() for the first LMB, we see that unplug is
        requested and call spapr_drc_release()
     4. spapr_drc_release() on the first LMB clears unplug_requested
     5. At this point, but before this is done on *all* of the DIMM's
        LMBs, the user attempts another unplug triggering the code
	below

AFAICT this will now skip the error, since the first LMB is no longer
in unplug_requested state, but there *are* still pending unplugs for
some of the remaining LMBs, so the old code would have tripped the
error.

> ---
>  hw/ppc/spapr.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 74e046b522..149dc2113f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3681,13 +3681,7 @@ static void spapr_memory_unplug_request(HotplugHan=
dler *hotplug_dev,
>                                  addr_start / SPAPR_MEMORY_BLOCK_SIZE);
>      g_assert(drc_start);
> =20
> -    /*
> -     * An existing pending dimm state for this DIMM means that there is =
an
> -     * unplug operation in progress, waiting for the spapr_lmb_release
> -     * callback to complete the job (BQL can't cover that far). In this =
case,
> -     * bail out to avoid detaching DRCs that were already released.
> -     */
> -    if (spapr_pending_dimm_unplugs_find(spapr, dimm)) {
> +    if (spapr_drc_unplug_requested(drc_start)) {
>          error_setg(errp, "Memory unplug already in progress for device %=
s",
>                     dev->id);
>          return;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5sllHzOWWdMWY84G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9nQsACgkQbDjKyiDZ
s5I7TQ/9FGETk0K2v7jlKENSJpwkHxmSqGYPg+AjoTvmWSHc3Xk/YakOqiYOma0G
O1pePTzeBDr/QkmphfEkmjDQvW56As6Uc8v9lRXhS+rTvraLnCN3xCX1hir2uY78
XXw7fuLjjDHkJazVTyaaSHNBe7/1n2+u70RnYaGlZb7KfYHorJjGa7I+1rTPUbQm
lt94lJW2xDU8Wbj43Q0ka+Vjj9YNBi7zWXQr2lIJMqw1Li4gG2ITlGhBZhAgCedv
FWTNmaFAAZjfazzG28h/IKFInRMC2NE5OB1PnZmDR0D720OkPA4qo/UWCyaRa400
5mc3qh6jl4ono7BkQw/R0oKGZALbT9WMhGFLpTw5wwrfWhO1H8iPohlFwBwVOQFL
lhbAESj5NPhgKiNdCwQ+egrLMlsS6OSaZ78jujKWloqWFOeX9cCoGJkMu0Qc113b
CFmB5pq9e438ZXnxWxBIJZqPpnUIFWCL7BfB9QoZd7HiX02klQcp2kDCxBhruqRp
xPMXxA/5Gcj+G/3kCYVsgOvE7Kl4UauD5Kn0+NOwNCjLmXQsd1hNAJH6D5YM3MnO
g6snRXxaUQau8FPcP4+NGMeFofIOqNVV0Fl1KwZ2nFk1Ixt2hipDrCkSArMVtk8C
/1zssKTARQGb6XELKzRFhMZ35YxHt9AwO+sIersTAgi7ZAzI4+M=
=DphC
-----END PGP SIGNATURE-----

--5sllHzOWWdMWY84G--

