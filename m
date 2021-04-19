Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6F363A1E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 06:10:24 +0200 (CEST)
Received: from localhost ([::1]:46542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYLEt-00037Y-9n
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 00:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYLDd-0002cv-Nw; Mon, 19 Apr 2021 00:09:05 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:54207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYLDb-0008KL-Fh; Mon, 19 Apr 2021 00:09:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNtbs0VnQz9vGP; Mon, 19 Apr 2021 14:08:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618805337;
 bh=PD0/FeYoIvA+36Kg8ODLFUUeBgs8YaUV0EphIUWsS5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BQjf/X7swGnaJrDKXxBAM7j8PNHiFkJkrbrEWuKvr3stHHqwIyzuqlOjbGPw8GEmZ
 3CGZnoC7WIcTXW+0tgC/jeMQO1vIkZqGeOiUYkSlfmaEJiAWW9I2auaQncx8at4BHk
 bSPcuoQD4KtWUWKu+hzICCR9OArigfzAGkOUdgc4=
Date: Mon, 19 Apr 2021 14:08:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr_drc.c: handle hotunplug errors in
 drc_unisolate_logical()
Message-ID: <YH0CToT0lEcvmtxy@yekko.fritz.box>
References: <20210416210941.381119-1-danielhb413@gmail.com>
 <20210416210941.381119-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6UcFtMAAqDzqWEW5"
Content-Disposition: inline
In-Reply-To: <20210416210941.381119-2-danielhb413@gmail.com>
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


--6UcFtMAAqDzqWEW5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 06:09:41PM -0300, Daniel Henrique Barboza wrote:
> The Linux kernel will call set-indicator to move a DRC to 'unisolate' in
> the case a device removal fails. Setting a DRC that is already

Only issue I have with this patch is that this isn't quite accurate
yet.  Can you reword this to include some of the rationale from the
cover letters about how a previous no-op is a safe choice to allow
guest->hv error signalling and that we expect the Linux kernel to use
it at some point.

> unisolated or configured to 'unisolate' is a no-op for the current
> hypervisors that supports pSeries guests, namely QEMU and phyp, and is
> being used to signal hotunplug errors if the hypervisor has the code for
> it.
>=20
> This patch changes drc_unisolate_logical() to implement in the pSeries
> machine. For CPUs it's a simple matter of setting drc->unplug_requested
> to 'false', while for LMBs the process is similar to the rollback that
> is done in rtas_ibm_configure_connector(). Although at this moment the
> Linux kernel is only reporting CPU removal errors, let's get the code
> ready to handle LMBs as well.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Otherwise,

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_drc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 9e16505fa1..6918e0c9d1 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -151,9 +151,32 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
> =20
>  static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>  {
> +    SpaprMachineState *spapr =3D NULL;
> +
>      switch (drc->state) {
>      case SPAPR_DRC_STATE_LOGICAL_UNISOLATE:
>      case SPAPR_DRC_STATE_LOGICAL_CONFIGURED:
> +        /*
> +         * Unisolating a logical DRC that was marked for unplug
> +         * means that the kernel is refusing the removal.
> +         */
> +        if (drc->unplug_requested && drc->dev) {
> +            if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_LMB) {
> +                spapr =3D SPAPR_MACHINE(qdev_get_machine());
> +
> +                spapr_memory_unplug_rollback(spapr, drc->dev);
> +            }
> +
> +            drc->unplug_requested =3D false;
> +            error_report("Device hotunplug rejected by the guest "
> +                         "for device %s", drc->dev->id);
> +
> +            /*
> +             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> +             * it is implemented.
> +             */
> +        }
> +
>          return RTAS_OUT_SUCCESS; /* Nothing to do */
>      case SPAPR_DRC_STATE_LOGICAL_AVAILABLE:
>          break; /* see below */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6UcFtMAAqDzqWEW5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9Ak4ACgkQbDjKyiDZ
s5JWgA/9HmZiYz0I1p123y2lYF6BPCM35l0U/WpvsBzXkvtFjkDqL2tTtt1/jnVJ
2inych2JiZ8m1Epua9HMA/r2bJnXMmgIC9kBpwC+K7GZ0SPA5HaUGVjCfNfAd3ng
J0GllJq1+E+LVV51JoGu23Cobe58fTJWrTpIY1ZsMtOjA9PZdSN6A0SDZYcwhTBi
WF5yJB1YJ7jGhcwmjiYP3xEJW6zQ6voH+JkJgXo0/qLxehmLCx7BoPQs2eLpFOGN
VAF4JZqMpJh6jYvZTprEgfIegCYTSTNuqjwTFHPvxUCdxMSwl58akZIQfxYRnlR9
Mlmj4aPE30AlkyvhfwRMKTe62bQqkxBIzrBs1zGGXSDMPRQYIRFJjCC7QiGBFd/x
O2/wWNpjha8vXdyGopgItWn/ZtzkpOKYXLa8iTMQluo6tbnpKkiHVrGmrvVGD59c
GswXCvcN0PCx2bMcap3209X/k10u1YVNof1z7Iyudm6fpFmQEYWBL2gS6gfWK624
ukWjvkAqDA31A9SD5LptvyMLlN71tdiA2E7rBofKqB4oeF43cv1g9qEpRBLNAWv5
f8TqXs/dya02bBSIO+cueA/vDwUBBZ4/aI2ZBrHEGg2eYGz+v99uTrirYvIKtwb7
K3r2be7lQzu9/XQKg3iFQF8bgr1G6B26TOKg2zHzQVQpIoJr2/w=
=7UVB
-----END PGP SIGNATURE-----

--6UcFtMAAqDzqWEW5--

