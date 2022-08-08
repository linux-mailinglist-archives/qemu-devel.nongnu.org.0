Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2705858C29F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 06:49:25 +0200 (CEST)
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKuhf-0000u3-QP
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 00:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKubm-0006IS-UZ
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 00:43:19 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:45427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oKubj-0006gr-SY
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 00:43:18 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M1Nqf07M6z4xTr; Mon,  8 Aug 2022 14:43:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1659933790;
 bh=a8b9fBEKsxJbionPA3/58nypwKhxNsqFW6NWybS3w8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tz5p8lMexEDPldU1756blqQEmPZXSxNjeZpKJW08fYBSJ9CEKv+UQdiE6pxLfX4Hg
 9XFqGyR0obbbyjG1jL97MLcslNPw7TSCxHgZgdeKzY4UtVfJfooG7/KAqXa8MO9qt0
 jfMw5YgSvtpHwf6fUX6EMh2HvZEYjFrghtey9z6s=
Date: Mon, 8 Aug 2022 14:40:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v2 17/20] device_tree.c: support remaining FDT
 prop types
Message-ID: <YvCT0XkOH03HJtCv@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-18-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Zhu+CI+PKaeRcjOz"
Content-Disposition: inline
In-Reply-To: <20220805093948.82561-18-danielhb413@gmail.com>
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


--Zhu+CI+PKaeRcjOz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 06:39:45AM -0300, Daniel Henrique Barboza wrote:
> When printing a blob with 'dtc' using the '-O dts' option there are 3
> distinct data types being printed: strings, arrays of uint32s and
> regular byte arrays.
>=20
> Previous patch added support to print strings. Let's add the remaining
> formats. We want to resemble the format that 'dtc -O dts' uses, so every
> uint32 array uses angle brackets (<>), and regular byte array uses square
> brackets ([]). For properties that has no values we keep printing just
> its name.
>=20
> The /chosen FDT node from the pSeris machine gives an example of all
> property types 'info fdt' is now able to display:
>=20
> (qemu) info fdt /chosen
> chosen {
>     ibm,architecture-vec-5 =3D [0 0]
>     rng-seed =3D <0x5967a270 0x62b0fb4f 0x8262b46a 0xabf48423 0xcce9615 0=
xf9daae64 0x66564790 0x357d1604>
>     ibm,arch-vec-5-platform-support =3D <0x178018c0 0x19001a40>
>     linux,pci-probe-only =3D <0x0>
>     stdout-path =3D '/vdevice/vty@71000000'
>     linux,stdout-path =3D '/vdevice/vty@71000000'
>     qemu,graphic-depth =3D <0x20>
>     qemu,graphic-height =3D <0x258>
>     qemu,graphic-width =3D <0x320>
> }
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  softmmu/device_tree.c | 58 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 8691c3ccc0..9d95e4120b 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -681,6 +681,53 @@ static bool fdt_prop_is_string(const void *data, int=
 size)
>      return true;
>  }
> =20
> +static bool fdt_prop_is_uint32_array(int size)
> +{
> +    return size % 4 =3D=3D 0;
> +}
> +
> +static void fdt_prop_format_uint32_array(GString *buf,
> +                                         const char *propname,
> +                                         const void *data,
> +                                         int prop_size, int padding)
> +{
> +    const fdt32_t *array =3D data;
> +    int array_len =3D prop_size / 4;
> +    int i;
> +
> +    g_string_append_printf(buf, "%*s%s =3D <", padding, "", propname);
> +
> +    for (i =3D 0; i < array_len; i++) {
> +        g_string_append_printf(buf, "0x%" PRIx32, fdt32_to_cpu(array[i])=
);
> +
> +        if (i < array_len - 1) {
> +            g_string_append_printf(buf, " ");
> +        }
> +    }
> +
> +    g_string_append_printf(buf, ">\n");

Add a ';' to match dts.

> +}
> +
> +static void fdt_prop_format_val(GString *buf, const char *propname,
> +                                const void *data, int prop_size,
> +                                int padding)
> +{
> +    const char *val =3D data;
> +    int i;
> +
> +    g_string_append_printf(buf, "%*s%s =3D [", padding, "", propname);
> +
> +    for (i =3D 0; i < prop_size; i++) {
> +        g_string_append_printf(buf, "%x", val[i]);

For dts like output you need %02x.  In [] notation, the spaces are
actually optional and ignored, so [0 0] is equivalent to [00], which is
equivalent to "".

> +
> +        if (i < prop_size - 1) {
> +            g_string_append_printf(buf, " ");
> +        }
> +    }
> +
> +    g_string_append_printf(buf, "]\n");

;

> +}
> +
>  static void fdt_format_node(GString *buf, int node, int depth)
>  {
>      const struct fdt_property *prop =3D NULL;
> @@ -699,11 +746,20 @@ static void fdt_format_node(GString *buf, int node,=
 int depth)
>          prop =3D fdt_get_property_by_offset(fdt, property, &prop_size);
>          propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> =20
> +        if (prop_size =3D=3D 0) {
> +            g_string_append_printf(buf, "%*s%s;\n", padding, "", propnam=
e);
> +            continue;
> +        }
> +
>          if (fdt_prop_is_string(prop->data, prop_size)) {
>              g_string_append_printf(buf, "%*s%s =3D '%s'\n",
>                                     padding, "", propname, prop->data);
> +        } else if (fdt_prop_is_uint32_array(prop_size)) {
> +            fdt_prop_format_uint32_array(buf, propname, prop->data, prop=
_size,
> +                                         padding);
>          } else {
> -            g_string_append_printf(buf, "%*s%s;\n", padding, "", propnam=
e);
> +            fdt_prop_format_val(buf, propname, prop->data,
> +                                prop_size, padding);
>          }
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Zhu+CI+PKaeRcjOz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmLwk8oACgkQgypY4gEw
YSLguA//R9FABYEhy/3Nxpyj0tx9bLliSnP2EAfgeyzBrm61QQ1Ote5RztkZqVbb
ePiln366BKJ5DhPErXCKUOuWGWJCmXeSknEnIXh7Q4hPaQMQzIOn4T8h0Pvlw/GH
2QtTDxEgldrPRDluvVtGMbo54dJBOwPkocvb7Kcor5C6zD4jf3apAaAekc1Atr9Y
llR3FGOOWNs6DQcpzA8w/Ba7006e/YWE8tONp5yW/AyqUs0wLKMpJBUznfxqq6WI
V9WDn7s5hTzUrJIriFhPhDpwOJDvaKhQG+hc7QJKpbwvylUlqFatqBST+nNxuXGL
ShENXD7i1WAgb9Qv79mF0Dz1sDsHKiUiSDR2wxAkyZFA8A8QYHjkcXetBnKVezqQ
TTi75trlqZG7wW04IYYnCuody4m/dkfzNnB+aoylywcpZONCZHIVy95/IXgD2lYO
fMQKBnmOj9M/w1/Pp9wHp4b28ZTwek5zjOfk+vsplFYIHYv11SFfrrJQYvfCm8Q9
4cW+3b0yx3h89gsE8XBHsaKk24QCuky+7oVpLDoFbrDpYaRGd29jC1rZGyx2JTsB
VePYxLzPUL9HHmTAoyCdR1VB3ZXW/qbAijhsKcSUvJVmat7FEM1pWuUF4F4ox85H
NbnG9OTrf4taEAOGH45cAoFcYFgMxqdXAMFpxcdH3IPjygsVQdA=
=xJfN
-----END PGP SIGNATURE-----

--Zhu+CI+PKaeRcjOz--

