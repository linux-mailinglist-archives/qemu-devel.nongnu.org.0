Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C7315C0D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 02:19:40 +0100 (CET)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9eAN-0000m1-F5
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 20:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9e7q-0007fu-FU; Tue, 09 Feb 2021 20:17:02 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42283 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9e7m-0000Ze-6u; Tue, 09 Feb 2021 20:17:02 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db20V1MH8z9sVF; Wed, 10 Feb 2021 12:16:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612919802;
 bh=IP8mMo4SIBPh0jDbVLUSwlACt+lMWVrDvVK53Cx7kS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sdqw9gGh1EX9QXd2E2La47CYsbnoZA2DCVhvLoeCemuULh/G7lgn5+/dyak4yvYlV
 za7nVlItZtfGOsLFjFY+ErK3yiisqDv1sMAEJBM9uDvRUmktnc5NOzKRWUkAJlmJjc
 lIUapoYtFwucTULj9J9yRuFFcOBrBI9txu9i7WKQ=
Date: Wed, 10 Feb 2021 11:05:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 2/2] spapr_iommu: Fix vhost integration regression
Message-ID: <20210210000513.GA4450@yekko.fritz.box>
References: <20210209213233.40985-1-eric.auger@redhat.com>
 <20210209213233.40985-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20210209213233.40985-3-eric.auger@redhat.com>
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
Cc: peter.maydell@linaro.org, mst@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, groug@kaod.org, eperezma@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 10:32:33PM +0100, Eric Auger wrote:
> Previous work on dev-iotlb message broke spapr_iommu/vhost integration
> as it did for SMMU and virtio-iommu. The spapr_iommu currently
> only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
> 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"=
),
> VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
> and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
> spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> registration.
>=20
> Reported-by: Peter Xu <peterx@redhat.com>
> Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_iommu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 30352df00e..24537ffcbd 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -212,6 +212,11 @@ static int spapr_tce_notify_flag_changed(IOMMUMemory=
Region *iommu,
>  {
>      struct SpaprTceTable *tbl =3D container_of(iommu, SpaprTceTable, iom=
mu);
> =20
> +    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
> +        error_setg(errp, "spart_tce does not support dev-iotlb yet");
> +        return -EINVAL;
> +    }
> +
>      if (old =3D=3D IOMMU_NOTIFIER_NONE && new !=3D IOMMU_NOTIFIER_NONE) {
>          spapr_tce_set_need_vfio(tbl, true);
>      } else if (old !=3D IOMMU_NOTIFIER_NONE && new =3D=3D IOMMU_NOTIFIER=
_NONE) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAjIzcACgkQbDjKyiDZ
s5LGtg//bzh8C6Krz0m+Q0uYq8Yf5opN+pXTZ7B3TBkhoRxLjURvUkbTdF0FE+oW
SP+G2Ssll7d+d5fz9o+cxij42QeCkySmSEoIUKKYhJAgXGQZwdz796wrE70JMbsm
57N6CTC+WuFCGLR1JrfDwqCIGlkmpWc5N6tE+zq2EeHCXp9C9FEMfooYlOkd25TL
UJuJaDpXV057wh6veRx1pTZ3XY79+dAUNC9d8KznC1sFmNluBmTRlHfyPG+a6lir
3OjNS48yvFfFmhuiIDpZvqyMKTF2CytFRoBynTSaF+9zVdCFp9swtPUXbVStD05s
OBZc9GcPUfs+UdoJh19eo33JyqUD6XhDDn3k8zfKl7hHSizGNxhMkEXiyyMv3DQR
SAsKauA6S2fpbJh/rd0frs7Xh5qeGYDoT1NgGxUPojVOZiwTNRPrVE3iG3gTuv6i
OwdY8zFEd0he9SSlWEbV7h7jaPQLmtqFdG9CD3NgBMmG+hMkRepAG5r2TymogY6Q
R5niIzWiNgsGEJAW7L9lwCOESQhOw7UGcuT0pT1VV48vY53/Yi/ihB+bprKgpIKK
mWwBkS7dnq1DuK3w7mmKdrsD1u6uVCsTzDW/sg2ckYYeMBcbbQIbDKvWs8pyovmX
uO9LD5nMRqCqKsB96Lk0ng1O7ZrT8SBYj/kVEXPhjFXg/F1/Hr4=
=9igK
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--

