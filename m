Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB416597EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:35:55 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZ8E-0005GL-Iv
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnz-0004rh-1a; Thu, 18 Aug 2022 02:14:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnw-0007RG-0h; Thu, 18 Aug 2022 02:14:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj5g6wz4xD2; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=OlZOKxc0GNHIg7gwAoNlkJ645i9mJYCOIofUpgWVgFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d+BhNgIKd/H2jPHvTpssxlTrRJbIgIJBnbB/RFPLbwMBOfzi0r72vlX3H34RRdvWa
 gY/svD1+Wp0cJnYV+PpN2VlmANOhzPMs9V2Z3vfA2x0RyzVgYAncaZn8PKoS2yti8x
 KsmFXtEHOwrpasYjxqFTP4xydT9HZzo+k46ZtO0Y=
Date: Thu, 18 Aug 2022 11:33:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v3 18/20] device_node.c: enable 'info fdt' to
 print subnodes
Message-ID: <Yv2W2rD4NzDllUSS@yekko>
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-19-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CEhomsZplrrhGZM6"
Content-Disposition: inline
In-Reply-To: <20220816173428.157304-19-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--CEhomsZplrrhGZM6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 02:34:26PM -0300, Daniel Henrique Barboza wrote:
> Printing subnodes of a given node will allow us to show a whole subtree,
> which the additional perk of 'info fdt /' being able to print the whole
> FDT.
>=20
> Since we're now printing more than one subnode, change 'fdt_info' to
> print the full path of the first node. This small tweak helps
> identifying which node or subnode are being displayed.
>=20
> To demostrate this capability without printing the whole FDT, the
> '/cpus/cpu-map' node from the ARM 'virt' machine has a lot of subnodes:
>=20
> (qemu) info fdt /cpus/cpu-map
> /cpus/cpu-map {
>     socket0 {
>         cluster0 {
>             core0 {
>                 cpu =3D <0x8001>
>             }
>         }
>     }
> }

nit: dts format requires a ; after each closing }
	foo {
		bar {
		};
	};

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  softmmu/device_tree.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 43f96e371b..a6bfbc0617 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -766,17 +766,26 @@ static void fdt_prop_format_val(GString *buf, const=
 char *propname,
>      g_string_append_printf(buf, "];\n");
>  }
> =20
> -static void fdt_format_node(GString *buf, int node, int depth)
> +
> +static void fdt_format_node(GString *buf, int node, int depth,
> +                            const char *fullpath)
>  {
>      const struct fdt_property *prop =3D NULL;
> +    const char *nodename =3D NULL;
>      const char *propname =3D NULL;
>      void *fdt =3D current_machine->fdt;
>      int padding =3D depth * 4;
>      int property =3D 0;
> +    int parent =3D node;
>      int prop_size;
> =20
> -    g_string_append_printf(buf, "%*s%s {\n", padding, "",
> -                           fdt_get_name(fdt, node, NULL));
> +    if (fullpath !=3D NULL) {
> +        nodename =3D fullpath;
> +    } else {
> +        nodename =3D fdt_get_name(fdt, node, NULL);
> +    }
> +
> +    g_string_append_printf(buf, "%*s%s {\n", padding, "", nodename);
> =20
>      padding +=3D 4;
> =20
> @@ -801,6 +810,10 @@ static void fdt_format_node(GString *buf, int node, =
int depth)
>          }
>      }
> =20
> +    fdt_for_each_subnode(node, fdt, parent) {
> +        fdt_format_node(buf, node, depth + 1, NULL);
> +    }
> +
>      padding -=3D 4;
>      g_string_append_printf(buf, "%*s}\n", padding, "");
>  }
> @@ -821,7 +834,7 @@ HumanReadableText *qemu_fdt_qmp_query_fdt(const char =
*nodepath, Error **errp)
>          return NULL;
>      }
> =20
> -    fdt_format_node(buf, node, 0);
> +    fdt_format_node(buf, node, 0, nodepath);
> =20
>      return human_readable_text_from_str(buf);
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--CEhomsZplrrhGZM6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9ltQACgkQgypY4gEw
YSJFqRAAmUfkY5d7IFVdYfYjUOo7Aw1tS+z9YbbU0OpuIWwD5oJKr/SqtJKO8D4Z
ht3Ep94dTEWvvgctZxa33P9ewJbNeSS+gHsGPl5HTHGrBHfBpr9zIcfLJwlT7Plg
O6Fw6GYciiHGaTDXcaTSpgeWmF6l2udG1a4Dg8ROXOO987O6mMvOn1CQnc/KAs4S
5Q0nKEu04xpp2Cmc6z+h5/55xhjFbmony8yk6sEYKyuMR7Ang0240W0Q7yS+w/Nd
VXc5nHUGYsUk/8AMWVNu9JWm1Ekk5F+iRNlL4xHZhpng8h+aJ4Ecxy+4Rs/Gye22
oqVTMqiin+Rg46RTL0t2XWub3m4W4uVQYKL6JE8YF3FdCQ4BCZymVSbO1LNn3jXc
88EdkVOScvd4KJ/+Py0Czpdo6nIxMVduqrKtL6HH5CtsVnFRCHFu5CNFUVKYrSXj
H3bLE/S4UBMjHCRAbu6if7JfqjPp9v10ogGAcLN+wCfClnMjI0FnSu/OC+xTAIPd
1VIuF5RReMtECy58l2db3KtPfa6lj7QiP8XlZJKXw4Bi2j7RzLawjzh9nyX4IHez
muKYlOEGp4AU3DUBRh1zaM6m0rI2DwXWOeHXJzZo1o/r3eXEEE1mxcbAGgbvB020
NQ161PZLT7YWaKf2Ag44t1ylfb0DOY5J+2VFqtBjw5qkDrS1RL8=
=XUjP
-----END PGP SIGNATURE-----

--CEhomsZplrrhGZM6--

