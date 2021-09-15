Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279C40BE28
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 05:24:57 +0200 (CEST)
Received: from localhost ([::1]:46570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQLXb-0002HI-R1
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 23:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQLUQ-0001Oi-Tc; Tue, 14 Sep 2021 23:21:38 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQLUM-0001G6-8l; Tue, 14 Sep 2021 23:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631676085;
 bh=6xC04rIk3PZ6gR+Tpri0M4zOs83YX5nqB6TZRttkg6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gn98CxdMLQKWSsVtaUG4sVbhUCtr9bYJtfmmv041I+iUPvgiUoqumH+YOcsK236wd
 xOvZQuDuUAqbu0G29Q21wzr53la936aSsjSV1zQLQjSnL+9kQFPFPP2quGqPCyrR3C
 aMhNUwFPXAYKqfFXTtK6EXHOyOxshi7fuG/Jd8EE=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H8QVF5DMdz9sVw; Wed, 15 Sep 2021 13:21:25 +1000 (AEST)
Date: Wed, 15 Sep 2021 13:15:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Luis Pires <luis.pires@eldorado.org.br>
Subject: Re: [PATCH v3 00/22] target/ppc: DFP instructions using decodetree
Message-ID: <YUFlQcHovtytx90O@yekko>
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QPOJWgVO/1sLfA4+"
Content-Disposition: inline
In-Reply-To: <20210910112624.72748-1-luis.pires@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QPOJWgVO/1sLfA4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 08:26:02AM -0300, Luis Pires wrote:
> This series moves all existing DFP instructions to decodetree and
> implements the 2 new instructions (dcffixqq and dctfixqq) from
> Power ISA 3.1.
>=20
> In order to implement dcffixqq, divu128/divs128 were modified to
> support 128-bit quotients (previously, they were limited to 64-bit
> quotients), along with adjustments being made to their existing callers.
> libdecnumber was also expanded to allow creating decimal numbers from
> 128-bit integers.
>=20
> Similarly, for dctfixqq, mulu128 (host-utils) and decNumberIntegralToInt1=
28
> (libdecnumber) were introduced to support 128-bit integers.
>=20
> The remaining patches of this series move all of the already existing
> DFP instructions to decodetree, and end up removing dfp-ops.c.inc, which
> is no longer needed.
>=20
> NOTE 1: The previous, non-decodetree code, was updating ctx->nip for all =
the
> DFP instructions. I've removed that, but it would be great if someone cou=
ld
> confirm that updating nip really wasn't necessary.
>=20
> NOTE 2: Some arithmetic function support for 128-bit integers was added,
> for now, still using 64-bit pairs. In the near future, I think we should
> modify all of them to use Int128 (and introduce UInt128). But I'll send
> out an RFC to discuss how to do that in another patch series.
>=20
> NOTE 3: The helper names are in uppercase, to match the instruction
> names and to simplify the macros that define trans* functions.
> Previously, this wasn't the case, as we were using lowercase instruction
> names in the pre-decodetree code. Another standalone patch will be sent
> later on, changing to uppercase the other new (decodetree) helpers whose
> names are directly related to instruction names, eventually making PPC
> helper names consistent.
>=20
> Based-on: 20210823150235.35759-1-luis.pires@eldorado.org.br
> (target/ppc: fix setting of CR flags in bcdcfsq)
> This series assumes bcdcfsq's fix is already in.

I've applied 1..4 to ppc-for-6.2, since those have acks.  Waiting on
reviews (probably from Richard) before applying the rest.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QPOJWgVO/1sLfA4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFBZT8ACgkQbDjKyiDZ
s5Kbpw/+N5RC2W1MJ6t6iZgMfXoabCe1zXY/RWZHl9SCEU4cmvZHoD0bx3MNn6/J
jq0NaF5R1GqKU/EHxNCZ4V8qJvNNAP4N0cGbORB5xL3nGd/PzJ9Q0g/o+IweOyaA
37lqwy4gehDm9I0O2o1PI35ole/X7By5ierast5ZzTZzt5sMXDs4CMlNLkAeSnn2
m+7uK8IFcEVe3mKWtRj7AAfcJRbhg9LWXZfe4Jt1XHSovnSsWd7QcsqKQm1AMYU5
rggvW8I0SNzRL/by/PEBE/GohsljyIsH6bUTJBsLTxKA2UiOXomq+6lfMGUrwb9w
YPfosJOM1pMkrR1pCcxyM2jFNqZtSGFeo7sl8Wo0rB40ZtnRrLgDWaUghKzuUI4N
1OAvIk9nt3NiK/TF3GB/W4fISCE5QONZkEInjrcQV00mYm819/xnslbDiIg7keoX
laqZ41GSO9HajkYCuCwsleSgFx8s4kkOMTPiHdv0enVbajiIn80rchQh8DmQlhPb
8TvMgv00ZYcT8YlBonIOrSmZItc0kinjJGHoJZB2yvuHAUbB1mqKGTDa2/1wpLm7
tpwPFyuAHLRB1SvznP2j70Bo7eFOv/WDg00UmGkHZoxcOIYYuxtG3li/vvZZBsOM
rWWoD2oDzedrzWXDD27RFYx7OCJIpOHpdjCnKkIVH0h0kvuMV2U=
=gjba
-----END PGP SIGNATURE-----

--QPOJWgVO/1sLfA4+--

