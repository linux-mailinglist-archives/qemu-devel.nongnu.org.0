Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70673F9288
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 04:47:23 +0200 (CEST)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJRtq-00011I-Tg
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 22:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJRqR-0007c3-Sg; Thu, 26 Aug 2021 22:43:51 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50971 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJRqP-0001zH-OV; Thu, 26 Aug 2021 22:43:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwkYX55SHz9sVw; Fri, 27 Aug 2021 12:43:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630032224;
 bh=YaEuG9QLYNpFxC15x4OOvih8N1OVx27wnkxhdBo9g6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fo5gkjzw9RT6BC5+v6qIDJ6nKCZd1HRTRZCcql7lBS16/KKtucclTE9NixOeyefNB
 4FNxBFaCkyqD0zcrMsolhk+ALwt/G0WE4Kh1gltBRxVLb7sRHJxaVgBgqzAbBCQhsr
 WwOGkC6l7kX1zi9QlfJdl9u5q6wYgj0UB4i8q1h4=
Date: Fri, 27 Aug 2021 12:42:00 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: matheus.ferst@eldorado.org.br
Subject: Re: [PATCH v2 0/2] target/ppc: Fix vextu[bhw][lr]x on big endian hosts
Message-ID: <YShQ+JgQYH316OE7@yekko>
References: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FSjjP+wpJJP3AA+w"
Content-Disposition: inline
In-Reply-To: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FSjjP+wpJJP3AA+w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 11:14:44AM -0300, matheus.ferst@eldorado.org.br wro=
te:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> The definition of struct Int128 is currently independent of the host
> endianness, causing different results when using the member s128 of
> union ppc_vsr_t in big-endian builds with CONFIG_INT128 or
> !CONFIG_INT128.
>=20
> The only PPC instructions that seem to be affected by this issue are the
> "Vector Extract Unsigned Byte/Halfword/Word to GPR using GPR-specified
> Left/Right-Index." Even on builds with Int128 support, however, their
> helpers give the wrong result on big-endian hosts.
>=20
> The first patch in this series changes the definition of struct Int128
> to allow its use in the ppc_vsr_t union. The second patch fixes the
> helper definition.

Applied to ppc-for-6.2, thanks.

>=20
> Matheus Ferst (2):
>   include/qemu/int128.h: define struct Int128 according to the host
>     endianness
>   target/ppc: fix vextu[bhw][lr]x helpers
>=20
>  include/qemu/int128.h   | 27 ++++++++++++++++++++-------
>  target/ppc/int_helper.c | 38 ++++++++++----------------------------
>  2 files changed, 30 insertions(+), 35 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FSjjP+wpJJP3AA+w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEoUPgACgkQbDjKyiDZ
s5Ij/RAAi8gKLnOfjpgQv3sWeG/ZajPzXV1vYDQ22Wt1/MNHdETGk/Pdu43FoW+O
6oDE2nL1flwQaBoJBsx3LhU4F1pju/ZT+/ucJ9B0TsczOuihvIyKdvb7Rl1aN6Pz
6b+qdW6x9RFVIWGQxiPsFVnek91OU7amKI7P30m1cpuNNfsweNkPXpZ1jfMAIv6D
8MlakgnaRnxLTXJdgjVjHykchm2yfyJbOGYABSjoghrE7N4++zYETWPSTJzi2Gi4
spJj/nxmGV13FJCy80xbgODO4Xeam8HTq+FNi46vzZr9fjTGGtmXYhZDvl81t571
ynQaktt9f8z/xygL+f5/k6ciX1tPF1CMwzfXzeFCcYxYIIGyjkMwzI3IZVIWCkC+
gYMvpPgVHPfkw9z8y4x9OPkShzNaJno1+HeGrh1tUVTWbi3Q/kH3tmTs/KblCeyi
1MRoY/HPlMBGf6P9Or03T0VmOQ6ytUet8bLoEcMv/T/RCELXk6dIfZFI6EE2Ietn
uz615ZPJ/xcBn0We0ka2LdzK1ZnW4xtmsOC30vCmShcSTQ45oRK0lABhqIF85jcU
IgkPNmz49EOFSpeoDlagq7LgdPmpifAWI4Z+vLjKoxr2GddJ3Tt2e47IIYRm9Uhq
/mlH2BL9f2GvLSTm5RIfjROseUI3s7y4EjneqnNvpMS41wUOQ40=
=+umK
-----END PGP SIGNATURE-----

--FSjjP+wpJJP3AA+w--

