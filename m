Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA685345313
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:34:41 +0100 (CET)
Received: from localhost ([::1]:60792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOU4G-0001xa-VL
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOU2l-0000tH-SX; Mon, 22 Mar 2021 19:33:07 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54471 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOU2j-0007Dk-W5; Mon, 22 Mar 2021 19:33:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F49lw5hPYz9sW4; Tue, 23 Mar 2021 10:33:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616455980;
 bh=sgIi/FIztXr46bhJ39tFbAMl2DUhKQobXqS8cnS8xps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AvgbQoVPuCJ/3bVLQS8WJ+2I62iLBUVNaVVzLIrC+D4UhQzIxvojvfKxDgl2qEe11
 Jd3JJW0zPZ5qjEzfs4p6fi1gmuAX9FLo0vhDw7y3jOjPJmcyNasjXteKbX9h8VzJPK
 mJOIkV5U2T3VIWvBTDHfzNzZsbi7WJbByvLjQp50=
Date: Tue, 23 Mar 2021 10:19:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 03/17] target/ppc: Properly sync cpu state with new
 msr in cpu_load_old
Message-ID: <YFkmFeXqQYFi4QJ1@yekko.fritz.box>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
 <20210315184615.1985590-4-richard.henderson@linaro.org>
 <d54aebb1-59b6-cea2-556c-4434845bf0c3@kaod.org>
 <b1548d17-042b-3959-ac31-254fd0cc724b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LEWjCMwU19mNepxg"
Content-Disposition: inline
In-Reply-To: <b1548d17-042b-3959-ac31-254fd0cc724b@linaro.org>
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LEWjCMwU19mNepxg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 10:53:01AM -0600, Richard Henderson wrote:
> On 3/16/21 2:15 AM, C=E9dric Le Goater wrote:
> > On 3/15/21 7:46 PM, Richard Henderson wrote:
> > > Match cpu_post_load in using ppc_store_msr to set all of
> > > the cpu state implied by the value of msr.  Do not restore
> > > hflags or hflags_nmsr, as we recompute them in ppc_store_msr.
> > >=20
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >=20
> > Could we add a common routine used by cpu_post_load() and cpu_load_old(=
) ?
>=20
> Will do.  David, would you like to unqueue this one, or shall I send anot=
her
> patch on top?

Pulling that one out causes conflicts with later patches, so another
one on top, please.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LEWjCMwU19mNepxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZJhUACgkQbDjKyiDZ
s5L01w//eiw2o6ROah8glydHa9FU0abG30BREZrDYNZA+LIYH///HhPxwUT7lnnM
RfRPuDBlE2Wnh+CUTy0fGxC7qkMUQXgM/TB3mLu+wKfkkp1Rk67pxnXHmpvP4yrg
yp1dSm8c9WH+XLL/NOFYu8aIzEd0qfVBISnXz390uNG4+qeBqQsvEDeJAm0eY1UJ
vyjffUazQ6pmHdlOTnKNWAEPmUxuhrGZ4rex0fWTZCK1CjFfQKVhapz/6k4cg5bg
7T/F6gjsdGBuK6JWyHEx3FmobuLgYsIiPbw89rqJtbrm3cpE8zzpmsOjkf7Rslow
xAxrB6eMSW/5N1B/MlBybKATLEGOC9VXv5+721Yt/Wrs9OycU2X1+U6y4V3sBpS+
FQYMhqOyE0ckkmRtxi/LEppgYIurD/0YbZgD9K7EShYJcpN0Zl7TEVkBR6hcYny8
Lt9JkUO5y1PmZIbj3HTkR5V2QBoefj/OuueEoj06RRbEeSo++1OHK62IFfWXrYg6
ya6zrOcpcZgFJoxxMx2HsOp4/5LwH6CWWTAxv2+jou6GdFKkU2o8AxczuR/pLaiQ
/FjlviTkrop35ewJFEUTjn45aL/QvUJALRz8wvVTCSgJZ566Wp9zYNq7pqne6eGk
2QxF1LVVR+ds52LEHzkxHNRbuepjUNWV9KRaq9ed5t45NLa4nxs=
=lQdf
-----END PGP SIGNATURE-----

--LEWjCMwU19mNepxg--

