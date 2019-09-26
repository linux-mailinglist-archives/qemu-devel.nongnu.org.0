Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95908BEA8D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 04:22:07 +0200 (CEST)
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDJPv-0005yn-0d
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 22:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iDJOV-0005PT-W3
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 22:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iDJOU-0000hk-MD
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 22:20:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49939 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iDJOR-0000Xm-H1; Wed, 25 Sep 2019 22:20:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46dzD95tbsz9sPS; Thu, 26 Sep 2019 12:20:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569464425;
 bh=t61iG0MXgkG+YXNblGyvinUZyY2RMIWp77NPVJHCrBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MUegAfK8ZulZud2PUbAarB8APe61otbPoyBUyytH1zm1YaXhmzhcvC2UUugF63VaT
 Q0q8krYDne7gbWGZnH7U/J+1l2EkwrxABPpgWHdvFmBDkNaV66qPH32BA10511YTNd
 aVE8Cv76FTuNZwyNmwdreVogfM/1NYiUVAcwrsqI=
Date: Thu, 26 Sep 2019 11:38:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr/irq: Fix migration of older machine types with XIVE
Message-ID: <20190926013808.GV17405@umbus>
References: <156942766014.1274533.10792048853177121231.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N4FnyIpcgIJc+tmW"
Content-Disposition: inline
In-Reply-To: <156942766014.1274533.10792048853177121231.stgit@bahia.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
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
Cc: qemu-ppc@nongnu.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--N4FnyIpcgIJc+tmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2019 at 06:07:40PM +0200, Greg Kurz wrote:
> Recent patch "spapr/irq: Only claim VALID interrupts at the KVM level"
> broke migration of older machine types started with ic-mode=3Dxive:
>=20
> qemu-system-ppc64: KVM_SET_DEVICE_ATTR failed: Group 3 attr 0x00000000000=
01300: Invalid argument
> qemu-system-ppc64: error while loading state for instance 0x0 of device '=
spapr'
> qemu-system-ppc64: load of migration failed: Operation not permitted
>=20
> This is because we should set the interrupt source in KVM at post load,
> since we no longer do it unconditionaly at reset time for all interrupts.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> David,
>=20
> I guess you should probably fold this fix directly into Cedric's
> patch (currently SHA1 966d526cdfd9 in ppc-for-4.2) to avoid
> bisection breakage.

Done.

> ---
>  hw/intc/spapr_xive_kvm.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> index 71b88d7797bc..2006f96aece1 100644
> --- a/hw/intc/spapr_xive_kvm.c
> +++ b/hw/intc/spapr_xive_kvm.c
> @@ -678,6 +678,17 @@ int kvmppc_xive_post_load(SpaprXive *xive, int versi=
on_id)
>              continue;
>          }
> =20
> +        /*
> +         * We can only restore the source config if the source has been
> +         * previously set in KVM. Since we don't do that for all interru=
pts
> +         * at reset time anymore, let's do it now.
> +         */
> +        kvmppc_xive_source_reset_one(&xive->source, i, &local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            return -1;
> +        }
> +
>          kvmppc_xive_set_source_config(xive, i, &xive->eat[i], &local_err=
);
>          if (local_err) {
>              error_report_err(local_err);
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--N4FnyIpcgIJc+tmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2MFoAACgkQbDjKyiDZ
s5JazxAAiEwcQNYP/IZ5PmS3CmXb72zryY7ScUljVy7bnQxPmNi6pXW8LA9IvGCz
47/RjOQSc2GkhvRDeBiyuDRD6ZX1x0qlDr33ZIfm0WYzC8kPyAm8Z8NMbfWZcOo3
fDZVahXCYr5rxShfr7L57EfG9a2Bx3GLwzQ7KEHafLB+AhLhQtj6ffibDqxlLrg/
NEphjw9ylPROIkZ9N17W/y8th4S6xMyFAn/W7GV6Kr4Y9gi90gmq+s5xocUgjOk7
0Yd3qiFMPTsUrAQcgn5EXWk75oDrrLvfPnaDDxF3IvE20ViSL/IxtoHIcC99qKUi
9oGQQuimasxzFHE5tGHQrIGadKevjuXKMDLP2z+4ga3n+RnL/eRprmZtXKUeqzuH
yuYstcSQkaCHOLpo7QcbLU0NmcaFuREptZMt96UqvcnNT7hxOPP88PCxYrG6OsLT
b5MB/hdPk5bUMSLkmAo5Jhur02pbkg6IzkTy5GTrirT3U2uKO7XDOuvAPaCuunRe
WY+w2o4eJNUzIqUTzsWoZZZBeQcFo7RJvv9gImmk1ETK7gL2MHDtKTdmxX3D2tqp
l+SvYXGGT74zDnvSeiHswtLyliWemG7+9gWyLnp++MEoMWsf5rCIcYHzfD+aFBN4
iikVDqFgcYUJ8PKdEPT3H1rptxGCYq2JBukC+ZudklTcMR+ZmXY=
=9lea
-----END PGP SIGNATURE-----

--N4FnyIpcgIJc+tmW--

