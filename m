Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD32BFF50
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 06:11:04 +0100 (CET)
Received: from localhost ([::1]:52464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh47z-0005ho-9k
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 00:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh45p-0004GO-Cb; Mon, 23 Nov 2020 00:08:49 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:52031 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh45m-0000km-La; Mon, 23 Nov 2020 00:08:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZtd40cqz9sTv; Mon, 23 Nov 2020 16:08:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606108121;
 bh=CkA7FJJ5SJYcUSfvJa+XPqv+8EZE8bKG0/hdSzdgrQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sc6/jSBngWm7qeRBmJTtcI7d0JXLWSBC13VbCW1iw8SfQb7D/R/g+jyXEiyj25gFS
 Q+U+5D/GrWpMZuPi99KrILf3w6KTgKREWIfgzxd34NBBLY9M0bicOwbyJjqichnTDt
 aG9WCx7SgoXcO/zXE5+LHqUHnPxgUSbH3y8M+378=
Date: Mon, 23 Nov 2020 16:03:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 3/9] spapr: Fix pre-2.10 dummy ICP hack
Message-ID: <20201123050307.GK521467@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-4-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2feizKym29CxAecD"
Content-Disposition: inline
In-Reply-To: <20201120234208.683521-4-groug@kaod.org>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2feizKym29CxAecD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2020 at 12:42:02AM +0100, Greg Kurz wrote:
> This hack registers dummy VMState entries of ICPs in order to
> support migration of old pseries machine types that used to
> create all smp.max_cpus possible ICPs at machine init.
>=20
> Part of the work is to unregister the dummy entries when plugging
> an actual vCPU core, and to register them back when unplugging the
> core. The code that unregisters the dummy ICPs in spapr_core_plug()
> is misplaced: if ppc_set_compat() fails afterwards, the hotplug
> operation will be cancelled and the dummy ICPs won't be registered
> back since the unplug handler isn't called.
>=20
> Unregister the dummy ICPs at the end of spapr_core_plug().
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.0, thanks.

> ---
>=20
> The next patch makes this patch a bit useless. I post it
> anyway for the records because it is a programming error.
> ---
>  hw/ppc/spapr.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 394d28d9e081..f58f77389e8e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3785,13 +3785,6 @@ static void spapr_core_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
> =20
>      core_slot->cpu =3D OBJECT(dev);
> =20
> -    if (smc->pre_2_10_has_unused_icps) {
> -        for (i =3D 0; i < cc->nr_threads; i++) {
> -            cs =3D CPU(core->threads[i]);
> -            pre_2_10_vmstate_unregister_dummy_icp(cs->cpu_index);
> -        }
> -    }
> -
>      /*
>       * Set compatibility mode to match the boot CPU, which was either set
>       * by the machine reset code or by CAS.
> @@ -3805,6 +3798,13 @@ static void spapr_core_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
>              }
>          }
>      }
> +
> +    if (smc->pre_2_10_has_unused_icps) {
> +        for (i =3D 0; i < cc->nr_threads; i++) {
> +            cs =3D CPU(core->threads[i]);
> +            pre_2_10_vmstate_unregister_dummy_icp(cs->cpu_index);
> +        }
> +    }
>  }
> =20
>  static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState=
 *dev,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2feizKym29CxAecD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7QosACgkQbDjKyiDZ
s5LTmxAAzIVzSsRIe+KhodTqlgRsFLayno31p3WsBwZcKDXKxF9nZKuDewNINqp+
8zyynBCQGQSCf597nhqI41gzbznmPiFkLOYshqL65N3h2OM5zMdU9mwrKv2sSQoM
tCdZKvkFATNF+7X5fYeAb4aEmcf3cj5WEHaOSI6d5A9ctSzaEjUzGD8qkPBWBHju
quK9yTNvEv9OhDLUc50EElMeT/aYjQkxDyRAgfWFSHvEguYfhsdzJU0n+8YlSBM4
LfnE8YjQY7LSCsdcxk+9lNfZtnzmo3L6oU1PyqQJJGqwznmgFxXjXif+O5X5SShV
nCj972gXErf0jv4gIFUr27CFHWCUKpA2muhvuSVDb7U4xNW7IxBuFbYLsbx3jTKm
VAmZqtdylcdNlNh4670roZcabk1GRazRhX+6aDyirp/E0L0ftgv29ekEWxgxzzX/
hQQOLyelIjd6G73Nkx184sUCSpeCuKEm5EvWk104Pz+tVlsbjWrUfUJ0N0WOwueS
nBCnEIgPXeNTBxgNtVhGLZYc+r99N43YSaKnMOsp+sSCSAdJ8gns60EBrHAHBCOE
4oBKLhTAxx2vPfV9EGGl70qXTjsigb00z2FfOFvX599tqkg5swphLhdVIutabDid
abhv9a7MLH5C29EDp0SDR7iz1xMmVwMN0b6qA94LLY8eMgaiTXg=
=wXHB
-----END PGP SIGNATURE-----

--2feizKym29CxAecD--

