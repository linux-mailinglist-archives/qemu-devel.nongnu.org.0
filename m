Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC6838E09C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 07:14:39 +0200 (CEST)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2vF-0008LY-Vx
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 01:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2td-0007Vx-Le; Mon, 24 May 2021 01:12:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll2tb-0005z5-DD; Mon, 24 May 2021 01:12:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpQMP0L42z9sRf; Mon, 24 May 2021 15:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621833169;
 bh=dQJjwb87hFskMlJenLEGV3FHCNxROKnW9ki+ZIUZJLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c9vUww7MPzxZx/p6eKDq+ly0NhncjqWkj7kisovg+A0v3tS4mTEZI13X0K2Hp+dBe
 Sn99/AROMGJLM2jtsTBgKAcK+ZF1GB3cxqS2XOqKrruiMDKNafoxYcFlGWZHZT2XjP
 KZCXzoiWmNMANqFuWf3pwnJY3GoODoI44zrcYxos=
Date: Mon, 24 May 2021 15:11:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 16/24] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
Message-ID: <YKs1aTFIaqW9BGmP@yekko>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-17-richard.henderson@linaro.org>
 <YKsdQ4IKyLJpGi4Y@yekko>
 <52a1be8e-da96-3146-5ab5-e46735f683fc@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rR72Gq4PnR5le0K+"
Content-Disposition: inline
In-Reply-To: <52a1be8e-da96-3146-5ab5-e46735f683fc@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rR72Gq4PnR5le0K+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2021 at 11:36:44PM -0500, Richard Henderson wrote:
65;6401;1c> On 5/23/21 10:28 PM, David Gibson wrote:
> > On Tue, May 18, 2021 at 03:11:38PM -0500, Richard Henderson wrote:
> > > Instead, use a switch on env->mmu_model.  This avoids some
> > > replicated information in cpu setup.
> >=20
> > I have mixed feelings about this, since I introduced
> > pcc->handle_mmu_fault specifically to get rid of the nasty
> > mega-switch, with the hope of eventually getting rid of env->mmu_model
> > entirely.
> >=20
> > But.. it does simplify your patch series, which makes a good change
> > overall.
>=20
> Having browsed the mmu code for a while, I would imagine a good change wo=
uld
> be to have several hooks, and the mmu_model enum, all in the same const
> struct. But the current situation is untennable.

Yeah, fair.

>=20
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rR72Gq4PnR5le0K+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrNWkACgkQbDjKyiDZ
s5JHWA/+NyM+rdfXNWzCqaqBKGnutLQeWy2WzRWWKZUWPLhPREEiHue6dO+dytQe
zF3f5odPqs7VyCDBnSa/1Rbe+D8+mN9SFqH9Coyuzcsvyf5MDyVzm/rKis1/AYT1
s061/e5kn/Wv8HiZD8yyJtVdzjkNB217cFktog/0wB4BeQO7WKG5/kpHUJGgyIRP
fPgb+n2r2vhDcIViY3PJdqOIQy3h1M80cd979osLcdP3r/KBsfr8X4dZenpC9ZzB
dX67pl6UYopzwZ1+B4OihbzBnuPKgOX6hILOevS3sKBq1SYzmb+v+NqbLje6T2T1
PQCkLQbLWDWCIMXhz6fhDawEjHo78mEYlFxHYFIg7pnrOdls55wet2R6wMYv1Pmt
KycKAxlC2526Coefz/waJX27X7wI747I998Mr4duoLtEke7QovdXI3DPTSm6Dgix
RaQAAXOTzfAa6ZBKudOO8Kv0oI0fY0QIFA5cZaSIEDLhfaPWiKQ/7Zosxz9s0xFA
CZyEIMs0wKAjCrSTnFPRGFGGFvEtcV7xTrutsfHSxdkbRA9uVfhx4fmioHaUgRLv
BsbWJeAnp5v3RXN6Cwxz+Qtr97YFi6pTSHPm08U55fyfWRESJY7DEAb+rtGl7jfn
+fEsHs7yLaQYn3YZNTSQ0++W51Qt6bNCSv7/5zTyN9vnhMQGuKU=
=1wLd
-----END PGP SIGNATURE-----

--rR72Gq4PnR5le0K+--

