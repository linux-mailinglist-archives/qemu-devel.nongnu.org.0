Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7449386B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:29:28 +0100 (CET)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA8DW-0000FD-Ii
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86b-0003O5-4y; Wed, 19 Jan 2022 05:22:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nA86X-0007or-3Z; Wed, 19 Jan 2022 05:22:16 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jf1sT1tHCz4y4g; Wed, 19 Jan 2022 21:22:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1642587725;
 bh=KbHvoLTgS4iYBTQ9XD0ook+u+378dzYb6gIvAzpYaVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9wr+AXrzg2IQ5UAGTseddYAB29INp4ySn9qWINDY3D81RFOa1bxHi8YuHeMmDFXT
 3gWb5IIiuZD2apRG1Ka4j9sj5MrHd0vxgxhPwxmv/+FJKYxyKm55uy9ELrXe+AefJP
 NslQ/YZ/uHI2Rc6QX6HNBcGVzb8LPbVmGHgeYBno=
Date: Wed, 19 Jan 2022 17:11:17 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 09/14] target/ppc: 405: Alignment exception cleanup
Message-ID: <YeerhckutNobPSY8@yekko>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-10-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="maHiS+J2lsPfFqIQ"
Content-Disposition: inline
In-Reply-To: <20220118184448.852996-10-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--maHiS+J2lsPfFqIQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 03:44:43PM -0300, Fabiano Rosas wrote:
> There is no DSISR in the 405. It uses DEAR which we already set
> earlier at ppc_cpu_do_unaligned_access.

Enabled specifically, I note, by env->mmu_model rather than
env->excp_model, which doesn't make a lot of sense.  Another cleanup
for later.

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au

> ---
>  target/ppc/excp_helper.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 9a6f8365d6..d263f20002 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -474,13 +474,6 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int ex=
cp)
>      case POWERPC_EXCP_EXTERNAL:  /* External input                      =
     */
>          break;
>      case POWERPC_EXCP_ALIGN:     /* Alignment exception                 =
     */
> -        /* Get rS/rD and rA from faulting opcode */
> -        /*
> -         * Note: the opcode fields will not be set properly for a
> -         * direct store load/store, but nobody cares as nobody
> -         * actually uses direct store segments.
> -         */
> -        env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
>          break;
>      case POWERPC_EXCP_PROGRAM:   /* Program exception                   =
     */
>          switch (env->error_code & ~0xF) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--maHiS+J2lsPfFqIQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmHnq30ACgkQgypY4gEw
YSKxZg//RYmVyBaekfb0hSD9ZoZCOBsARqdpERUNuEGVRXBqaBTT+YuWLulYF1q2
AXxw6LtOpRrrKGkSjJcooFAuZU9npqz8qr5A1y23sPb3zL8TOYxPH26Xx72DzD0j
WnxNjaIzNABmqi3rBj3/l6E17NhYRpv9ZWbwaBDSCSlB1yQr1fm4oNjlqoZmiGpt
WuvBgyOLK5tlEmOBDehC8RbmZk/s73rYhLzwOQpDxQnajwusNnPKAmnmbTynmdVb
E4B975PuQIKxbvyTgbASSfMcl3L4uJCAKnKYnPwH0DuSui4rdDjbT2Ap1wzwpV25
GCjYVZdo5P2zEkO0yE0LDlvBe3b4hoUdkQbY8n/FbMzJAgaE+vh/TLXtNlvUUzej
1xmLBCMwDfxN7CzcNRRV+V/lDRcOY/Yw7Qc3nZkAioMfsYKT6jfEffZQYLspZCAQ
E+oxVtbDEdX6crLgxZb9B60LU04ecuZGBolKYqeaPmpFAID8dbNE/FhB+JJPfcUM
+0ryz57KJZXqwSyXvD0E7ldrUoX3GFzda+mQoCZE6spHRZYiVU6pmTcfEDVvXmIz
tbJpekOoCSOPDP+1FxWDn9+DCfR0NGRdDBXPQizTGsFpWzRFU5haCNsnJJ4gCz9v
XzPYuz2A0dCWH1nE6lQSYxpnbngr2vIPS+/zfiTSsx+IVhwh/Rc=
=0iSu
-----END PGP SIGNATURE-----

--maHiS+J2lsPfFqIQ--

