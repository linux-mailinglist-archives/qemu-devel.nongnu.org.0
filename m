Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546E2E34CC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:44:17 +0100 (CET)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnCS-0005Ja-Aq
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy3-0002IS-IK; Mon, 28 Dec 2020 02:29:23 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:50995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ktmy0-0000M4-Qr; Mon, 28 Dec 2020 02:29:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D48Lg5jnBz9sWd; Mon, 28 Dec 2020 18:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609140555;
 bh=UNYG3MSF635yhF5ehONQwmJK2PUtifCtuLT5dOsU9Ms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnatpgQIHDwupOWLbpdGhoQlPttgKFoG3WaUfOU8o/jlD1EFFPX7jXjw9OUo2Og0u
 +zvL1qJUKPs7Hlzkd2zFFqBAiX21d15W8Upn5GShwON/6hF4EfYF6tBKUNeaMomLla
 ekI0bha7BQHzIHIoQuNWCytjk4FmqNKW7gKjLX+0=
Date: Mon, 28 Dec 2020 18:13:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Fix buffer overflow in
 spapr_numa_associativity_init()
Message-ID: <20201228071358.GF6952@yekko.fritz.box>
References: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="924gEkU1VlJlwnwX"
Content-Disposition: inline
In-Reply-To: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--924gEkU1VlJlwnwX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 02:53:24PM +0100, Greg Kurz wrote:
> Running a guest with 128 NUMA nodes crashes QEMU:
>=20
> ../../util/error.c:59: error_setv: Assertion `*errp =3D=3D NULL' failed.
>=20
> The crash happens when setting the FWNMI migration blocker:
>=20
> 2861	    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI) =3D=3D SPAPR_CAP_ON) {
> 2862	        /* Create the error string for live migration blocker */
> 2863	        error_setg(&spapr->fwnmi_migration_blocker,
> 2864	            "A machine check is being handled during migration. The =
handler"
> 2865	            "may run and log hardware error on the destination");
> 2866	    }
>=20
> Inspection reveals that papr->fwnmi_migration_blocker isn't NULL:
>=20
> (gdb) p spapr->fwnmi_migration_blocker
> $1 =3D (Error *) 0x8000000004000000
>=20
> Since this is the only place where papr->fwnmi_migration_blocker is
> set, this means someone wrote there in our back. Further analysis
> points to spapr_numa_associativity_init(), especially the part
> that initializes the associative arrays for NVLink GPUs:
>=20
>     max_nodes_with_gpus =3D nb_numa_nodes + NVGPU_MAX_NUM;
>=20
> ie. max_nodes_with_gpus =3D 128 + 6, but the array isn't sized to
> accommodate the 6 extra nodes:
>=20
> #define MAX_NODES 128
>=20
> struct SpaprMachineState {
>     .
>     .
>     .
>     uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
>=20
>     Error *fwnmi_migration_blocker;
> };
>=20
> and the following loops happily overwrite spapr->fwnmi_migration_blocker,
> and probably more:
>=20
>     for (i =3D nb_numa_nodes; i < max_nodes_with_gpus; i++) {
>         spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_PO=
INTS);
>=20
>         for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>             uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
>                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>             spapr->numa_assoc_array[i][j] =3D gpu_assoc;
>         }
>=20
>         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_be=
32(i);
>     }
>=20
> Fix the size of the array. This requires "hw/ppc/spapr.h" to see
> NVGPU_MAX_NUM. Including "hw/pci-host/spapr.h" introduces a
> circular dependency that breaks the build, so this moves the
> definition of NVGPU_MAX_NUM to "hw/ppc/spapr.h" instead.
>=20
> Reported-by: Min Deng <mdeng@redhat.com>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1908693
> Fixes: dd7e1d7ae431 ("spapr_numa: move NVLink2 associativity handling to =
spapr_numa.c")
> Cc: danielhb413@gmail.com
> Signed-off-by: Greg Kurz <groug@kaod.org>

Oof.  Applied.

> ---
>  include/hw/pci-host/spapr.h |    2 --
>  include/hw/ppc/spapr.h      |    5 ++++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> index 4f58f0223b56..bd014823a933 100644
> --- a/include/hw/pci-host/spapr.h
> +++ b/include/hw/pci-host/spapr.h
> @@ -115,8 +115,6 @@ struct SpaprPhbState {
>  #define SPAPR_PCI_NV2RAM64_WIN_BASE  SPAPR_PCI_LIMIT
>  #define SPAPR_PCI_NV2RAM64_WIN_SIZE  (2 * TiB) /* For up to 6 GPUs 256GB=
 each */
> =20
> -/* Max number of these GPUsper a physical box */
> -#define NVGPU_MAX_NUM                6
>  /* Max number of NVLinks per GPU in any physical box */
>  #define NVGPU_MAX_LINKS              3
> =20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 06a5b4259f20..1cc19575f548 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -112,6 +112,9 @@ typedef enum {
>  #define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
>  #define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
> =20
> +/* Max number of these GPUsper a physical box */
> +#define NVGPU_MAX_NUM                6
> +
>  typedef struct SpaprCapabilities SpaprCapabilities;
>  struct SpaprCapabilities {
>      uint8_t caps[SPAPR_CAP_NUM];
> @@ -240,7 +243,7 @@ struct SpaprMachineState {
>      unsigned gpu_numa_id;
>      SpaprTpmProxy *tpm_proxy;
> =20
> -    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> +    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE=
];
> =20
>      Error *fwnmi_migration_blocker;
>  };
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--924gEkU1VlJlwnwX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/phbYACgkQbDjKyiDZ
s5LLyw//SRD85mRgKIH+T6hvWsMpsxi2WVxjj2jW8O/xu7v6VfWKLhQHWWm7LUTq
k58IHAqK5+NOvEPSvkKnOJ8bIxLMOBLdhIo5w4hmykiDCD46bIZZbGi3SCKhzmGS
GefzZdPum1ad5QmJcnDwGzbP7LSMw5/eAQzsY2+Zv3s0bYW3J3lACTksNjVf4ou1
R026+L7uZOlBKD+Ik9T4aaUU0HmZjwMEPbWW80BBxqwJD5oGpzTNANO0pmq/AjH1
IR8c3dPsu8Q36XdUz++zwsqwo2+zLyQXhPiGR9YSEpRTLuqYalcGObyxJvu7ikvh
yW4vYnX4a1JNNsHeXs7eP0W9mVa1pyxvg0hF/Aex1PMVb7jS0KY/nx0a0USIWQwV
JDP7Nb3/dSolCwt2z/b/2AJsussp5dJ0cfucB7nutGqCh5JYocJG9Pkj3KToVUhF
XZf11L57NHF0sBtnKeKV/BTnF4nKSGrBQu6Pcg0bbamjSGV20xSCSpbH2mNHAMj/
1Bp2GeCG723DmtMVHU0kTAQnrv05Hpmae/9ADdOKd1OGZQvdFk+9gODvdOwsWkfw
iLsElxo7Nd7f7rElNTDcLcCireXGwqlMpGG+3eDFgKLzMDg/mVguE8zrwKQ0+2wJ
gEAAD3GxwLv6YRJOsGyPj1m2xDpRXUitUV8Y95Gqs/F3PMibJQs=
=MTRS
-----END PGP SIGNATURE-----

--924gEkU1VlJlwnwX--

