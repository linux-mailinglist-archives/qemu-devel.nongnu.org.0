Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE493454BC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 02:13:42 +0100 (CET)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOVc6-0006be-2G
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 21:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVbJ-00066x-1h; Mon, 22 Mar 2021 21:12:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38285 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVbG-0001is-6L; Mon, 22 Mar 2021 21:12:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4Cyz5Dchz9sWk; Tue, 23 Mar 2021 12:12:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616461963;
 bh=Z0VfJRLWzbnaLMOFPqk0qMnvvAfavMHb3JtNJOJCPPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AZ87OnwK59ITdZOuN80CVRPYgRFgrEHhbYEmjAybCS0mKsu3sdiw6csCp/mRy02wP
 nU8ZqtFhg58ZF8kGqaVvPc1tOLCDIrJhn7paknaybi6YDflgBr0IWD8bXmPGt9BmHm
 8YYjtJ3d/EifwoJbPT90zg71bt9BnYOzlOz16tg4=
Date: Tue, 23 Mar 2021 12:12:37 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
Message-ID: <YFlAheldkqCkZytI@yekko.fritz.box>
References: <20210312200740.815014-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iIHs/oIDXTqPhERm"
Content-Disposition: inline
In-Reply-To: <20210312200740.815014-1-danielhb413@gmail.com>
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iIHs/oIDXTqPhERm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
>=20
> Patches 1 and 3 are independent of the ppc patches and can be applied
> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
> are dependent on the QAPI patches.

Implementation looks fine, but I think there's a bit more to discuss
before we can apply.

I think it would make sense to re-order this and put UNPLUG_ERROR
first.  Its semantics are clearer, and I think there's a stronger case
for it.

I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
it really tell the user/management anything useful beyond what
receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iIHs/oIDXTqPhERm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZQIUACgkQbDjKyiDZ
s5K+NhAAn/kETQkPyGM8T9AVxlNXWnkmpgJeToGL4fwri7oHFMwjzIvfhJUEQiMk
ryKYf1rjfc2aDD0GMa0sI20qv7HPDjTc9fRYSEWxBlkZ3976nR2NHWTbMA60sGIz
rgI8sK+4chz+3Jxt5YFboSUzECcQXTJqlF0x+Efh7kHIv55THLpoNrCZ7c3wLBcQ
v0CcOTOXN2OK94yIiw1H3BxdYQo++OvUX0L4ChP5vL6BvEy1ijQPh5vKm1Q1OOch
HM2Bzr4DGMN7TmN1ZxxDhILXtOVjKSUjPCjrmknrg2sfzFpkQalNU+z2pHU940F1
GqRzIb+jMH3KgvJptC70PSCANVYr8gyA/PIbe3yZaijokwwcWRk0RAqI6qXwTVnR
mbU2iEH8piaslJl3/zdAkQuWVOVtdELZ0dm3VHeJctQeRUzZUKfIzaducRIQo42G
b5lzpzQmwQVZ9bkT7+OmVgjiDNlfBxXSISVL4c4uDWwHVyWgshp3uB2l6uCR1s0T
k2e1OG9MjwxS9n6gG0+v39LuVk6aWpamL3FO2dFgaaPWtH9lWAwNo9L912eapZGB
sAeUvZbw9LdXkSoiBHqFal0sObwgrlNyK4Z32FP4VJrQ7tuNf+GhgxHONZjpUG3C
PSO2wvqeH3wuLcQzREO+GT8gOtwUP3nVg+7Vb2CyJs09IT+bdcc=
=01I3
-----END PGP SIGNATURE-----

--iIHs/oIDXTqPhERm--

