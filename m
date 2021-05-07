Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8310375F18
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:19:51 +0200 (CEST)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ler1q-0000bz-Rp
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzb-0007R3-2i; Thu, 06 May 2021 23:17:31 -0400
Received: from ozlabs.org ([203.11.71.1]:44397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leqzX-0007lE-Ff; Thu, 06 May 2021 23:17:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fbwc307gHz9sj1; Fri,  7 May 2021 13:17:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620357443;
 bh=t5T7Vc9Up1FZdvH788yBmqRR5EsiU3e4JIGUdS7NO+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f5R/V601pahCuqCEpS5pY/cyhBfGiKR+wUbQJJsqPMQxjpWOdj/MSnHnu4+136AoM
 fkgD7MzAEMPcpMST8Ch7+ISWLozYILm980C6WIS9pdK97GmNJWe90v0sArMhWQJJI+
 jQbCV/pqMp9F3UGfeAAgSJyeGMWzWq5M4X+J5k2w=
Date: Fri, 7 May 2021 13:17:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: Re: [PATCH v3 4/4] hw/ppc: Altered calls from oea_read to read
Message-ID: <YJSxPcnakGxhVMwE@yekko>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
 <20210506163941.106984-5-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dj3/OL+omNYdILMD"
Content-Disposition: inline
In-Reply-To: <20210506163941.106984-5-lucas.araujo@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dj3/OL+omNYdILMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 01:39:41PM -0300, Lucas Mateus Castro (alqotel) wro=
te:
> Changed spapr.c and pnv.c from calls of ppc_spr_t.oea_read to
> ppc_spr_t.name as oea_read is not available in !TCG builds.

This is correct, but I think we can do it a little more cleanly.  This
logic is identical to has_spr() in spapr_hcall.c.

Can you move has_spr() to the target/ppc logic instead and rename it
to, say, ppc_has_spr().  It's simple enough that it could just go
inline in target/ppc/cpu.h.  Then we can use that in these places as
well as the places its used in spapr_hcall.c.

>=20
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.b=
r>
> ---
>  hw/ppc/pnv.c   | 2 +-
>  hw/ppc/spapr.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 77af846cdf..06849b8802 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -199,7 +199,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, v=
oid *fdt)
>      _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
>      _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
> =20
> -    if (env->spr_cb[SPR_PURR].oea_read) {
> +    if (env->spr_cb[SPR_PURR].name) {
>          _FDT((fdt_setprop(fdt, offset, "ibm,purr", NULL, 0)));
>      }
> =20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b37ceb8ee8..61653cbe2e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -705,10 +705,10 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, i=
nt offset,
>      _FDT((fdt_setprop_string(fdt, offset, "status", "okay")));
>      _FDT((fdt_setprop(fdt, offset, "64-bit", NULL, 0)));
> =20
> -    if (env->spr_cb[SPR_PURR].oea_read) {
> +    if (env->spr_cb[SPR_PURR].name) {
>          _FDT((fdt_setprop_cell(fdt, offset, "ibm,purr", 1)));
>      }
> -    if (env->spr_cb[SPR_SPURR].oea_read) {
> +    if (env->spr_cb[SPR_SPURR].name) {
>          _FDT((fdt_setprop_cell(fdt, offset, "ibm,spurr", 1)));
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dj3/OL+omNYdILMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCUsT0ACgkQbDjKyiDZ
s5KDSA//aGJeR9jyxEVdWdlPdZy42e549CgfZ2f7fpWCogcRBFie4/3WsNzWdW1X
gPSYU+J7r3Ij65/x1bDjwx1fLK9tvWkZYQHWT5okHSE10XOUe27hLM9Z0yVSFPur
a2WXj70fHKb3uRgXApsHpOJePnFjnmsoYr0JKYfup4Zr2vK6V/f+bTpT0+jf7wIK
DOquzhi/umJYgE9tomxNOmnNEDQbXlDu00y7LUkDns3AM18O+XfSQQ+p3BR+T/MQ
JnG6TJ37NhZoP+W9V8zX8XE/snSMfHde8UUtQJn0SPz1saGgsQ/bpM2awXwcO2xM
c1kPMJSkItB+BJ3rUXit+Fki3h7BuQSo+/tv9xuvtulr7Ar/wq4T1wbqR5ypi5K+
w1IBne7z2eQj1EUiiDjyZRZRwf/WctNFMYmLxNbsTZrwZtB+u6Cdp+huHOH/E3nb
MCBmPW081YeXXjhaHlPBTjJcslVAYWTc4ssoXHIWA8l+UJf/9cB7rdxnHM4ajYLb
x0AYAoQqqLX1MkRKc+K5ulUIOxvgomnsJnJAZ1+N7nX1/0uKin03HMD6UisXfQtN
1RQT9ZpTfdPS7h/e5tBf5qH9xn9nT/ueqMqrlM6d7EGw2vEtqIkqkkQ0YVcmgszC
skINmjEIat+SBFO8RZ9/k4zXDM6zos695ymqj1qaGerFgcExl2o=
=ln2p
-----END PGP SIGNATURE-----

--dj3/OL+omNYdILMD--

