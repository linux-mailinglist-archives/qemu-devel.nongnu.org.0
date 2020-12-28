Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28F2E3498
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:01:11 +0100 (CET)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktmWk-0001dY-EB
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmUo-0000dj-MU; Mon, 28 Dec 2020 01:59:10 -0500
Received: from ozlabs.org ([203.11.71.1]:47913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmUm-0003pl-0F; Mon, 28 Dec 2020 01:59:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D47gg5VF9z9sWR; Mon, 28 Dec 2020 17:58:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609138735;
 bh=2ITqsK2hZYxtmIYEvd5ZoLRe/q6Vefm2S7pt3JbM2Lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LlRFXhPrugaLza0bYuVTlqQr1/99n84/bqmLkxmEtcHRuP+uEps56ABhKV9iQyW6r
 SUbJKkzNgvb8OsKq9r9FV8zhToNtsMwz++8f+wG/a+779Ko/bDGH/pgM5bS4vDj5gl
 SP9FiWHb/QgEWkeyzhaHMoMSdbPn+BPln39YESh4=
Date: Mon, 28 Dec 2020 17:58:24 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: g00517791 <gaojinhao@huawei.com>
Subject: Re: [PATCH 4/8] spapr_pci: Fix memory leak of vmstate_spapr_pci
Message-ID: <20201228065824.GB6952@yekko.fritz.box>
References: <20201226103347.868-1-gaojinhao@huawei.com>
 <20201226103347.868-5-gaojinhao@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <20201226103347.868-5-gaojinhao@huawei.com>
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 26, 2020 at 06:33:43PM +0800, g00517791 wrote:
> From: Jinhao Gao <gaojinhao@huawei.com>
>=20
> When VM migrate VMState of spapr_pci, the field(msi_devs) of spapr_pci
> having a flag of VMS_ALLOC need to allocate memory. If the src doesn't fr=
ee
> memory of msi_devs in SaveStateEntry of spapr_pci after QEMUFile save
> VMState of spapr_pci, it may result in memory leak of msi_devs. We add the
> post_save func to free memory, which prevents memory leak.
>=20
> Signed-off-by: Jinhao Gao <gaojinhao@huawei.com>

Not really a memory leak, since it will get freed on the next
pre_save.  But, we might as well free it earlier if we can ,so

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_pci.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 76d7c91e9c..1b2b940606 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2173,6 +2173,16 @@ static int spapr_pci_pre_save(void *opaque)
>      return 0;
>  }
> =20
> +static int spapr_pci_post_save(void *opaque)
> +{
> +    SpaprPhbState *sphb =3D opaque;
> +
> +    g_free(sphb->msi_devs);
> +    sphb->msi_devs =3D NULL;
> +    sphb->msi_devs_num =3D 0;
> +    return 0;
> +}
> +
>  static int spapr_pci_post_load(void *opaque, int version_id)
>  {
>      SpaprPhbState *sphb =3D opaque;
> @@ -2205,6 +2215,7 @@ static const VMStateDescription vmstate_spapr_pci =
=3D {
>      .version_id =3D 2,
>      .minimum_version_id =3D 2,
>      .pre_save =3D spapr_pci_pre_save,
> +    .post_save =3D spapr_pci_post_save,
>      .post_load =3D spapr_pci_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT64_EQUAL(buid, SpaprPhbState, NULL),

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/pgg8ACgkQbDjKyiDZ
s5KFqxAAu19amYibbvM+fCmCkAyoUEayjBKnkriB2L7EsXc5z9CxiWtodslwJ04D
AIBH5DtQN6tsT76ScGVrNO65U4fAKX0ZTEtJCpbDtNYOLOgE63IJ/xgGuTulHj8p
1KEV+WABzoJq8gQPEfaCW5lyJg7A7cd60zkXvm1mUgwgNO1/2Afba3+fn2yvR+dK
qBeLMqkYHmK2YR+YshDZM4MI5DLSwCwSN4EuDWVPe8rgW6Afwlm+JymrjOcdVLeP
5+EDREb3GbbtozxfcmyqHuUv/Yqrt16q4N3lxghyNVMZqFJR+pIFFDe/+PjevNxX
idSq/IjqQYaUPww76a4AiDFV5B53lEK9cK+zlQjclZQ/mt0ElbqOMqeP+16/1Hkf
SVstXFQ3BmwuaEz9u6/p98Eifly3lpqaSKsS87HYE48RtJot6oJm1wQT0mCkn3kB
QiRx9VZB1qG/E5sgvKyMMMwN9HJapQqtfiDmgbt2K2Zx+o/P+7kMTsHNi2V5W64q
x9pqeVSoBqdswO693VfcZcLoeZ/XCa+Sum8pA/q/cYBRgVgmEqF6nI1jV9cIDdRp
0CJ7A4Uo2f20Ik2J8fHVfZMVvV59El7z2aSPmwqBs9OyzbFYcBNLETVcZF6SR7MD
FdsTcvTUr8meLlUUeeWbMueITDBqAbQFNd+O1r/33RO1/MlbLMQ=
=4t62
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--

