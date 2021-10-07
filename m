Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F9424B65
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 02:52:58 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYHeb-0008Jb-75
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 20:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHap-0006KL-1u; Wed, 06 Oct 2021 20:49:04 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mYHal-0005LH-Gh; Wed, 06 Oct 2021 20:49:02 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HPt3x0NJ4z4xbQ; Thu,  7 Oct 2021 11:48:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633567725;
 bh=1R/pVJSPDwjqSqjd+C4oBMaHzjNixProxzv0G4sZNGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hbAH1/a4/8EIIwic33un3+9ZkYaToS+Fo0YZmNKGnHIsM3RScCHoyHwjp1SM5qxXn
 brECVeTjst8v89rJjOn/lEKi89r1tWinGuhreLCpb9riU9rI255q50LXY0AVBHBPHI
 YwxUjMkAMy+9YZRPYZe+KLaDyvN8XzRx54MME4aA=
Date: Thu, 7 Oct 2021 11:48:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/ppc: Fix iothread locking in the 405 code
Message-ID: <YV5D5nkCtA3NlgZC@yekko>
References: <20211006071140.565952-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GcODRT+4sJ24AYWi"
Content-Disposition: inline
In-Reply-To: <20211006071140.565952-1-thuth@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GcODRT+4sJ24AYWi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 09:11:40AM +0200, Thomas Huth wrote:
> When using u-boot as firmware with the taihu board, QEMU aborts with
> this assertion:
>=20
>  ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion fa=
iled:
>   (qemu_mutex_iothread_locked())
>=20
> Running QEMU with "-d in_asm" shows that the crash happens when writing
> to SPR 0x3f2, so we are missing to lock the iothread in the code path
> here.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Applied to ppc-for-6.2, thanks.

> ---
>  hw/ppc/ppc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index f5d012f860..bb57f1c9ed 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -336,6 +336,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
> =20
> +    qemu_mutex_lock_iothread();
> +
>      switch ((val >> 28) & 0x3) {
>      case 0x0:
>          /* No action */
> @@ -353,6 +355,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
>          ppc40x_system_reset(cpu);
>          break;
>      }
> +
> +    qemu_mutex_unlock_iothread();
>  }
> =20
>  /* PowerPC 40x internal IRQ controller */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GcODRT+4sJ24AYWi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFeQ+YACgkQbDjKyiDZ
s5I+5hAAi3B7tgwqd/hqeELhxxoafnZsZ/QjCWLRJOLKxNHKlzLaffbB6ztT/Ajd
k64LwHMeQaeThkgU9jB4IEKyMFBwfJUQBSisA8gBcMt8kxlhc4Ji7LS4UVLAxpLM
tX4h32EYsxyDChEjuzjYhAk7LUxZr6gOqOxeLNaho5k8pRk7QxWo8I4FJer5FkOm
ukdXUcdKRRgmYb/UNlz87bgc2Iyv4xQa1RER4qZAob5rpSm346Y6APemwzRPMt29
qP4vakG5RwRNd33lECFIFi2GUlobNlc1LhiJnHolUJEy4YNfbccHpabYga6kSG1e
KqjIM4H0/KQXMSNIa9Qu8RXz6CQD18Q0abXxEjnR3CLLzqmropr+Y2Q2qExjSoYX
HLDzzzuHVRfuLXBuMZHYaOvsSZVv/6BpSE9Xz/KXxitcpdvBWn+CqOJ4I+N8jWQI
VWNzR5n4hRk6VZMAlBae1rLtiuRGrKYo6nUFnUbp/+ZTYC74ER8dGJIJJMbDZecm
/EE+Wcij9dZkg7gqZ3gp+6EwlvamI6W5vlrj9MvuV13OU9OAWEMcdCZPrdkxRLq9
+dw+mBXkHs8laARQEtudDe8zj56sA3xD1TdqaKn5UjLzTZUNQsM5ndGBGLJbK4z9
/1IvjOuVFGmbFyNHqLV4dNgRmDdu1vNje4DxeCXk9l1tfy4K/6o=
=LWWV
-----END PGP SIGNATURE-----

--GcODRT+4sJ24AYWi--

