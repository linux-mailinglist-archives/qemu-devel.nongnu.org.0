Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F6597EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:32:23 +0200 (CEST)
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZ4o-00035u-EV
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYo1-0004tF-N0; Thu, 18 Aug 2022 02:15:03 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:55685
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnv-0007RD-Th; Thu, 18 Aug 2022 02:15:01 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj5WsDz4x7X; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=LVcVxFlyc/VhBoe80OAswsuC6tJ2aV/3tniZNEtQqUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dFDQXWGqLuHKE5ejQFvsscX9pqIiiTqOhwWBL5bmm6ydVDYB7dUtv/7He0q2Sb5k6
 teJ+I5qTSmQL+kXOaoTCKsKOspTIUt6mkJz5PxhZCRkW2zs3cDcG6iImsqzC3ddtt5
 ES5QGNgLURYdS3Lls+v0R/kqk0/iffO/mX42yK9g=
Date: Thu, 18 Aug 2022 11:31:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v3 16/20] device_tree.c: support string array
 prop in fdt_format_node()
Message-ID: <Yv2Wf3LxLQf8LfP1@yekko>
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-17-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wt0ZnXhsYQyZesI2"
Content-Disposition: inline
In-Reply-To: <20220816173428.157304-17-danielhb413@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
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


--wt0ZnXhsYQyZesI2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 02:34:24PM -0300, Daniel Henrique Barboza wrote:
> To support printing string properties in 'info fdt' we need to determine
> whether a void data might contain a string array.
>=20
> We do that by casting the void data to a string array and:
>=20
> - check if the array finishes with a null character
> - check if there's no empty string in the middle of the array (i.e.
> consecutive \0\0 characters)
> - check if all characters of each substring are printable
>=20
> If all conditions are met, we'll consider it to be a string array data
> type and print it accordingly. After this change, 'info fdt' is now able
> to print string arrays. Here's an example of string arrays we're able to
> print in the /rtas node of the ppc64 pSeries machine:
>=20
> (qemu) info fdt /rtas
> rtas {
>     (...)
>     qemu,hypertas-functions =3D "hcall-memop1";
>     ibm,hypertas-functions =3D "hcall-pft","hcall-term","hcall-dabr",
> "hcall-interrupt","hcall-tce","hcall-vio","hcall-splpar","hcall-join",
> "hcall-bulk","hcall-set-mode","hcall-sprg0","hcall-copy","hcall-debug",
> "hcall-vphn","hcall-multi-tce","hcall-hpt-resize","hcall-watchdog";

nit: typical dts style would have extra spaces:
	prop =3D "foo", "bar";
i.e. separated by ", " not just ",".

> }
>=20
> 'qemu,hypertas-functions' is a property with a single string while
> 'ibm,hypertas-functions' is a string array.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  softmmu/device_tree.c | 64 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3fb07b537f..d32d6856da 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -663,6 +663,63 @@ void qemu_fdt_qmp_dumpdtb(const char *filename, Erro=
r **errp)
>      error_setg(errp, "Error when saving machine FDT to file %s", filenam=
e);
>  }
> =20
> +static bool fdt_prop_is_string_array(const void *data, int size)
> +{
> +    const char *str_arr, *str;
> +    int i, str_len;
> +
> +    str_arr =3D str =3D data;
> +
> +    if (size <=3D 0 || str_arr[size - 1] !=3D '\0') {
> +        return false;
> +    }
> +
> +    while (str < str_arr + size) {
> +        str_len =3D strlen(str);
> +
> +        /*
> +         * Do not consider empty strings (consecutives \0\0)
> +         * as valid.
> +         */
> +        if (str_len =3D=3D 0) {
> +            return false;
> +        }
> +
> +        for (i =3D 0; i < str_len; i++) {
> +            if (!g_ascii_isprint(str[i])) {
> +                return false;
> +            }
> +        }
> +
> +        str +=3D str_len + 1;
> +    }
> +
> +    return true;
> +}
> +
> +static void fdt_prop_format_string_array(GString *buf,
> +                                         const char *propname,
> +                                         const char *data,
> +                                         int prop_size, int padding)
> +{
> +    const char *str =3D data;
> +
> +    g_string_append_printf(buf, "%*s%s =3D ", padding, "", propname);
> +
> +    while (str < data + prop_size) {
> +        /* appends up to the next '\0' */
> +        g_string_append_printf(buf, "\"%s\"", str);
> +
> +        str +=3D strlen(str) + 1;
> +        if (str < data + prop_size) {
> +            /* add a comma separator for the next string */
> +            g_string_append_printf(buf, ",");
> +        }
> +    }
> +
> +    g_string_append_printf(buf, ";\n");
> +}
> +
>  static void fdt_format_node(GString *buf, int node, int depth)
>  {
>      const struct fdt_property *prop =3D NULL;
> @@ -681,7 +738,12 @@ static void fdt_format_node(GString *buf, int node, =
int depth)
>          prop =3D fdt_get_property_by_offset(fdt, property, &prop_size);
>          propname =3D fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
> =20
> -        g_string_append_printf(buf, "%*s%s;\n", padding, "", propname);
> +        if (fdt_prop_is_string_array(prop->data, prop_size)) {
> +            fdt_prop_format_string_array(buf, propname, prop->data,
> +                                         prop_size, padding);
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

--wt0ZnXhsYQyZesI2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9lmgACgkQgypY4gEw
YSKsjg//WfqqFZuC6nu+C4x9c6Gl+gSXPZZBQv7c10l9NYy3heVfwX+PyYbQEheB
N5i/N+KUlu4RCVn+VMTSPjrr/ltxDVXThdlYc8ILgNKalDFp3m1B1u1MRXt5uxA2
QAtpiev/b84Xkc7o6sfFHCfPA6Z4tTkGMuW1sLV48znI4R5e5yPDJSQDoKwePD6L
k2dlid3gSenSya2X6NZpgHPWBvHqbewL9lgonOd6gr6b3whg6kI9UY41DkpQOt6p
pCNiK6nrzmKQQQUwaQ9Mt6TwMnypiUuCKq/DAZirQpie+0l9Yuv/tXeAj7MGtgA3
p27+lwrACWKX8kHq7Tgeqtb70e6RU5jxS/MzddW9SG+1EENvW2KLL+9yR5GDJIlY
GnLmKlNtfMv3poPWUnkt3gK7cGNqV3iKp5aHdMqjOPpyB7z6EZF14/xQ66jCFKdD
u3QMAb9r1Qa34RWrGmtZ7/D9BPkOmYrk7MyxNIRKH0+tC4Wxpc5V0CWztqTjEyVW
JpmXzOQfhy7evix5AOvprnCC/Y7MJvlrrKERj1LXGPxiSwj5KoNC1xfIOUlONn6M
6udpNGapJtRDaAIhxocvTGDa7H8PV07MP+WtlLpbsMPBGg36wfSjgjgpr1qKNGUI
p/vZrl/wTZFLpSjV1m+z7uJUlgoliNtUAk9olDe+a4b8zB5QCIc=
=79a5
-----END PGP SIGNATURE-----

--wt0ZnXhsYQyZesI2--

