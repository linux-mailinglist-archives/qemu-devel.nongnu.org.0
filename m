Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8458C2A0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 06:49:25 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKuhg-0000u1-7X
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 00:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKubo-0006Ii-CN
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 00:43:20 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKubj-0006gs-Re
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 00:43:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1Nqf00xKz4xTp; Mon,  8 Aug 2022 14:43:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659933790;
 bh=4XFVC/GIJziL8VypnxRrARWdknnT3MafWC5E0bwM+dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=khZNMIM99YXzUvsDkda5qyI7JDlFCVkGEuWARSRyyz2gy3aVjYTMSqeyKfj4+h3JO
 suRckMVFmRcDjL0aozWWsqClPm5m723VpSTMirBgN1ULqAZ+0gUMoEM+C/xrKl8ThM
 RhuEYEixYEyFTOMzZOv09M5oKlDjcp3vcKyyVEMY=
Date: Mon, 8 Aug 2022 14:36:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v2 16/20] device_tree.c: support string props in
 fdt_format_node()
Message-ID: <YvCSx8eV5jkMbD6C@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-17-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NN2oHeqAbo6YwoOW"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-17-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NN2oHeqAbo6YwoOW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:44AM -0300, Daniel Henrique Barboza wrote:
> To support printing string properties in 'info fdt' we need to determine
> whether a void data might contain a string.

Oh... sorry, obviously I hadn't read these later patches when I
complained about the command not printing property values.

>=20
> We do that by casting the void data to a string array and:
>=20
> - check if the array finishes with a null character
> - check if all characters are printable

This won't handle the case of the "string list" several strings tacked
together, separated by their terminating \0 characters.

>=20
> If both conditions are met, we'll consider it to be a string data type
> and print it accordingly. After this change, 'info fdt' is now able to
> print string properties. Here's an example with the ARM 'virt' machine:
>=20
> (qemu) info fdt /chosen
> chosen {
>     stdout-path =3D '/pl011@9000000'
>     rng-seed;
>     kaslr-seed;
> }
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  softmmu/device_tree.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3fb07b537f..8691c3ccc0 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -663,6 +663,24 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Erro=
r **errp)
>      error_setg(errp, "Error when saving machine FDT to file %s", filenam=
e);
>  }
> =20
> +static bool fdt_prop_is_string(const void *data, int size)
> +{
> +    const char *str =3D data;
> +    int i;
> +
> +    if (size <=3D 0 || str[size - 1] !=3D '\0') {
> +        return false;
> +    }
> +
> +    for (i =3D 0; i < size - 1; i++) {
> +        if (!g_ascii_isprint(str[i])) {
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}
> +
>  static void fdt_format_node(GString *buf, int node, int depth)
>  {
>      const struct fdt_property *prop =3D NULL;
> @@ -681,7 +699,12 @@ static void fdt_format_node(GString *buf, int node, =
int depth)
>          prop =3D fdt_get_property_by_offset(fdt, property, &prop_size);
>          propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> =20
> -        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
> +        if (fdt_prop_is_string(prop->data, prop_size)) {
> +            g_string_append_printf(buf, "%*s%s =3D '%s'\n",
> +                                   padding, "", propname, prop->data);

If you're going for dts like output, I'd suggest going all the way.
That means \" instead of \' and a ';' at the end of the line.

> +        } else {
> +            g_string_append_printf(buf, "%*s%s;\n", padding, "", propnam=
e);
> +        }
>      }
> =20
>      padding -=3D 4;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NN2oHeqAbo6YwoOW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwksAACgkQgypY4gEw
YSKexxAApopyXv9sfxTf3kziMbxcAlQs+DxP8QHOQNFf+y6VHxqH/V2JlvtGEAoa
PVGghGlqqg6ls+u1BInxVZU9ZEMAD7AzrYMTBwHnioIhSiUCNbEBwABPnUBux12p
7qY9YSiTrxEg6wRo3wInGBb0+h0WsAZgiuMUda4YGRsGwN51AnU6CXQ60XKdaGH3
G5KeUytoktFOYkKo2swBZk/WFYqwuQ+s5752GaJLLq/Y/ODhQwAqkJHRgNOwwUyN
gdq8FyRCX/BgUrDHA4kiJoY5CINehmkdCUNdXtHWbgX3FCXqkTto6vkqUJaDBl3+
HiutVlkXsuAF34SRsChyli6DzKZSa8Ib74MY1ozcdAZDAU+5LrFoTBQMRwjs1yXn
WAWViCN732Zv17AHVaQN6yzvFaznuvNbpljv95SjNNCe/KPnhCV2o+Sh7q/KL88s
59UB596JEJzfD9oYdaBbinyCCKN239577XjU+etm6zXkD4B7rh13Q6rOn85TX0Z1
BCodWoM06ikfvIuQi23rCWqgukREav4LnUUq9jjOHN9JiGjvqGyXUDS/sEzXiuj6
dGXJngrYgWbwl03izUDW+UUlT2NNWccO1G08+S3w08P6rbb7K+tvfoBQqmtH5kx1
vijs1Q7cJHHHg1k9+NGvnRr3WVR4vFa9EKdF1i49/+9T8TG58dM=
=aYLv
-----END PGP SIGNATURE-----

--NN2oHeqAbo6YwoOW--

