Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7C4B7FFC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:20:52 +0100 (CET)
Received: from localhost ([::1]:41034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKCkF-0004Mk-1n
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:20:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7V-0001HE-MB; Tue, 15 Feb 2022 23:40:58 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKC7O-0000Im-8B; Tue, 15 Feb 2022 23:40:49 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz4y33SbTz4y4F; Wed, 16 Feb 2022 15:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644986411;
 bh=nWlVbSi1miLOEaxA+w8gwP/o8JIf5yTneXmpONoW4x0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IDY3L3V6XLYpmuRE9Ds7hDIMalV/72z3TfCjL/8ErSI5c5ZYqA6taU1n4KKF594qB
 PzE0OR/zyuNXmN7hGXPdKpIoOWWJF0oMijlnxtPx5Dptb/3iELYE/NPaXj3CO2f7Ut
 vxZPWX1Yoe1s+qkEcrtdgM3kYnxoQAQJ0jxClGik=
Date: Wed, 16 Feb 2022 13:23:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 14/27] target/ppc: cpu_init: Deduplicate 755 SPR
 registration
Message-ID: <YgxgN2W6ziAOr7pL@yekko>
References: <20220215214148.1848266-1-farosas@linux.ibm.com>
 <20220215214148.1848266-15-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9KUo/tddqjNByQZE"
Content-Disposition: inline
In-Reply-To: <20220215214148.1848266-15-farosas@linux.ibm.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


--9KUo/tddqjNByQZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:41:35PM -0300, Fabiano Rosas wrote:
> The 745 and 755 can share the HID registration, so move it all into
> register_755_sprs, which applies for both CPUs.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu_init.c | 44 ++++++++++++++++---------------------------
>  1 file changed, 16 insertions(+), 28 deletions(-)
>=20
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 2fd6bf21ca..03aa543814 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -485,6 +485,22 @@ static void register_755_sprs(CPUPPCState *env)
>                   SPR_NOACCESS, SPR_NOACCESS,
>                   &spr_read_generic, &spr_write_generic,
>                   0x00000000);
> +
> +    /* Hardware implementation registers */
> +    spr_register(env, SPR_HID0, "HID0",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_HID1, "HID1",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
> +
> +    spr_register(env, SPR_HID2, "HID2",
> +                 SPR_NOACCESS, SPR_NOACCESS,
> +                 &spr_read_generic, &spr_write_generic,
> +                 0x00000000);
>  }
> =20
>  /* SPR common to all 7xx PowerPC implementations */
> @@ -4476,21 +4492,7 @@ static void init_proc_745(CPUPPCState *env)
>      register_755_sprs(env);
>      /* Thermal management */
>      register_thrm_sprs(env);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID2, "HID2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      register_high_BATs(env);
> @@ -4559,21 +4561,7 @@ static void init_proc_755(CPUPPCState *env)
>                   0x00000000);
>      /* Thermal management */
>      register_thrm_sprs(env);
> -    /* Hardware implementation registers */
> -    spr_register(env, SPR_HID0, "HID0",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> =20
> -    spr_register(env, SPR_HID1, "HID1",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
> -
> -    spr_register(env, SPR_HID2, "HID2",
> -                 SPR_NOACCESS, SPR_NOACCESS,
> -                 &spr_read_generic, &spr_write_generic,
> -                 0x00000000);
>      /* Memory management */
>      register_low_BATs(env);
>      register_high_BATs(env);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9KUo/tddqjNByQZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMYDEACgkQgypY4gEw
YSLNnw/+PKAkjM1S90wHp7YvGBI65f5fjVm67LrzVy+5+SYjKeYVRG1kfCz8ul3H
5L54e1KVpyMrPLVXbNwe3AIl/oVdxMoF9HS0HC1iiSvynnhRiuDF3GuLaPohjNb0
7+jSuzF+yhKDbnGOpxklnWHMDMGTvqQ6nEu+GST0pjG8TEx5kX5Gwavm6dzvohFQ
9wV7IYs1js7Y9UjStC7tQvtNfV37QYY0KgMecVjLtkpR7QpdNhAT7awVEivznwN1
ctMpHzCcOA9Ww8JDHaH+MJiKykzVNMOQmKiHJK7CQItkR6C37HEV8SAA0iOJtGuE
Fhv3JccnS1tnmppo6F+v6eXMpyZxOXn4//GguWcHGJV8KeWF50hVihpAHE5VmFdy
k5xS2siYfRxTpQfaVu/ycEyc6iI93yj+lW+ddrpyV0HzOUQU2ICZUqfoOAIb9igk
EBSlcqTF/9q2lZ9I74WCb507TsEkcfS0cHU8sMLjDJ5VIx7ha+j/DJ79wW0oeU/x
3WObk2E+tNAURjP9DFgSsGWMAtGqpLGcqBccPQFuVSljZOlhenpngDaqIJiaAzbg
H9DZfzFaOjb67r1HdmUIZhfQ66gP6v8VPqPeT/+6Q07oG3tDqy6jp21h0BUVVYNu
896/Hn5Sn2EO4FESwhtWcMna4OosArg2CsvsrGRBfaWUAWzWw+o=
=C9S+
-----END PGP SIGNATURE-----

--9KUo/tddqjNByQZE--

