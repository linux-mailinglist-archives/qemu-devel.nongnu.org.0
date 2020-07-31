Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA6233EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 07:23:52 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1NWJ-00058x-6z
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 01:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k1NVR-0004bS-Gg; Fri, 31 Jul 2020 01:22:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:36387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1k1NVO-0007uN-KW; Fri, 31 Jul 2020 01:22:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BHwdz1pX7z9sT6; Fri, 31 Jul 2020 15:22:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1596172967;
 bh=M4gcUv3vDrXwSxP+7v6sh5RHzwlkiiBvOK9SktiDxsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oogN39PqbDsyfyki4KeEk0k2S7yJ7u52gH5oSbq43cZif5DbENvmexZFbGeK37FCT
 mTUD2MznPZvMxOMlwtuTTQEKWlOOGJGlmNv/I7Qhvz2tHtSDLDThgwJinxKdyqs/i5
 Vg+K9R1pbQr0n/KLP22/qU6RF6n/kwUjduDGKFpI=
Date: Fri, 31 Jul 2020 13:22:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-5.2] spapr: Avoid some integer conversions in
 spapr_phb_realize()
Message-ID: <20200731032214.GC12398@yekko.fritz.box>
References: <159592765385.99837.12059368746532345109.stgit@bahia.lan>
 <20200729025441.GJ84173@umbus.fritz.box>
 <20200730185518.774172c9@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline
In-Reply-To: <20200730185518.774172c9@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2020 at 06:55:18PM +0200, Greg Kurz wrote:
> On Wed, 29 Jul 2020 12:54:41 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Jul 28, 2020 at 11:14:13AM +0200, Greg Kurz wrote:
> > > Without this patch, the irq number gets converted uselessly from int
> > > to int32_t, back and forth.
> > >=20
> > > This doesn't fix an actual issue, it's just to make the code neater.
> > >=20
> > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> >=20
> > Applied to ppc-for-5.2, thanks.
> >=20
>=20
> Daniel reported a crash that happens systematically on some systems that
> don't support KVM XIVE (aka. bostons) since the patch "spapr: Simplify
> error handling in spapr_phb_realize()" landed in the ppc-for-5.2 tree.
>=20
> The patch is good but it uncovered an issue we have in the KVM XIVE code
> in QEMU (basically we should ignore the absence of KVM XIVE device when
> claiming IRQ numbers).
>=20
> The fix is trivial but to avoid breaking bisect, it should rather go
> before the patch mentioned above. Also I want to consolidate the error
> handling a bit more so, in the meantime, for others to be able to use
> the ppc-for-5.2 branch, I suggest you simply drop:
>=20
> spapr: Simplify error handling in spapr_phb_realize()
>=20
> and the current patch as well since it's a follow-up.
>=20
> I'll send a new patchset later.

Ok, done, I've removed both those patches from ppc-for-5.2, resend the
new version whenever you're ready.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl8jjmUACgkQbDjKyiDZ
s5IJig//YK3cS7kPF/RcQFZ0YOqsiXg1Z6qKvArcv0n7wjVqO6O5W7RQgNrpk/42
U7PSPsBWMswXtYCySRwsZ+L2a6LdD8onjcqSlj0YCSTfp2E8xyK8osVE99neFaGq
Qj3QYSxDgFmQYBOWozQ2FI+tZoMCpADFp74Vag0UKo1WithnkNw4PZKx/JafsMIC
Lgs/gz2Ex9JpFMaBlRbUvvR2A+jqFq4Bguce/bWJAntiH6r5nPITsZji7f66AxXD
V8LeHlAYPli1q2O3Xdl1XPZTd0ZCW9nXzwrmLdvBxu6J8EOEifi3tN5Ygp2H6Vw9
Qb1WwPMWazYom8CeEJ2yxtyzIkqtfVVPvIiaqR2Y2U/PGjmbcXX5fBjb5AKvkKot
k1tXeh6Ham6nUliJ5lY8eKp5YcoXihTp0KHyf2F9QUv0L5IqVe8vRN5ds7YX6bzd
BwFAkEw6igoKUyelPSW+SQED5KzXG5x/ZjKEB0nZDW1QQoegHFCguBxyNqu1p9j/
V3yZAOQC2+iLNNYt+Kvg/S11MWIxjnLWIDnI+v7fTru9H2I/ARizxPNF4hMFwoSk
QiP7xwUTKUiztJ8URCyY5Nq+jTqJsUqrUyeKNz3Gr9/RlwbVCGFbTbeJheoHDc7P
CHr4xcq9ypCEV4qg+ZDN5ncByMIH9MaG2REGf9SCcvAnw2KgPJA=
=Xnbl
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--

