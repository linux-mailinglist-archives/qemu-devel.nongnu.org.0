Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA36B442
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 04:03:05 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnZHc-0005lD-G4
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 22:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45035)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hnZGB-00011n-9M
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 22:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hnZGA-0008Eu-05
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 22:01:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58917 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hnZG9-0008CP-9y; Tue, 16 Jul 2019 22:01:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45pL906HV0z9sNp; Wed, 17 Jul 2019 12:01:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1563328884;
 bh=91TitBDOhwxzRn0q9RRrsll5WxUp3E/p7v0dA7Zsvrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HgU+pTD1zLvzFk3Gj9+IlnemyTgEnmjd1GqzlZhikPmZ5ESY+x5GLPziESJTjro7V
 AEGlnt8XgTUg0P4kmYl4w3nAQP8dt1fuDLQ1twtk+az17j9a/CXO/e8EYIX9zNqMkF
 fzNroIhRCL9fsl5PlVAyvXob2DSndhkS+L4JL/8U=
Date: Wed, 17 Jul 2019 12:01:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20190717020115.GD9123@umbus.fritz.box>
References: <20190716235313.29806-1-mdroth@linux.vnet.ibm.com>
 <20190716235313.29806-3-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <20190716235313.29806-3-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH for-4.2 2/2] spapr: initial implementation
 for H_TPM_COMM/spapr-tpm-proxy
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
Cc: linuxram@us.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2019 at 06:53:13PM -0500, Michael Roth wrote:
> This implements the H_TPM_COMM hypercall, which is used by an
> Ultravisor to pass TPM commands directly to the host's TPM device, or
> a TPM Resource Manager associated with the device.
>=20
> This also introduces a new virtual device, spapr-tpm-proxy, which
> is used to configure the host TPM path to be used to service
> requests sent by H_TPM_COMM hcalls, for example:
>=20
>   -device spapr-tpm-proxy,id=3Dtpmp0,host-path=3D/dev/tpmrm0
>=20
> By default, no spapr-tpm-proxy will be created, and hcalls will return
> H_FUNCTION.
>=20
> The full specification for this hypercall can be found in
> docs/specs/ppc-spapr-uv-hcalls.txt

Mostly LGTM, but..

[...]
>  #define H_SUCCESS         0
> @@ -490,8 +492,9 @@ struct SpaprMachineState {
>  #define H_INT_ESB               0x3C8
>  #define H_INT_SYNC              0x3CC
>  #define H_INT_RESET             0x3D0
> +#define H_TPM_COMM              0xEF10

This is vastly increasing the size of the hcall dispatch table, which
isn't great.  Is the 0xE... range reserved for PEF related hypercalls?
I'm wondering if we want to make a third table here (we already have a
separate one for the qemu-specific hypercalls).

> =20
> -#define MAX_HCALL_OPCODE        H_INT_RESET
> +#define MAX_HCALL_OPCODE        H_TPM_COMM
> =20
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.
> diff --git a/include/hw/ppc/spapr_tpm_proxy.h b/include/hw/ppc/spapr_tpm_=
proxy.h
> new file mode 100644
> index 0000000000..4843cdaf58
> --- /dev/null
> +++ b/include/hw/ppc/spapr_tpm_proxy.h
> @@ -0,0 +1,31 @@
> +/*
> + * SPAPR TPM Proxy/Hypercall
> + *
> + * Copyright IBM Corp. 2019
> + *
> + * Authors:
> + *  Michael Roth      <mdroth@linux.vnet.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_SPAPR_TPM_PROXY_H
> +#define HW_SPAPR_TPM_PROXY_H
> +
> +#include "qom/object.h"
> +#include "hw/qdev.h"
> +
> +#define TYPE_SPAPR_TPM_PROXY "spapr-tpm-proxy"
> +#define SPAPR_TPM_PROXY(obj) OBJECT_CHECK(SpaprTpmProxy, (obj), \
> +                                          TYPE_SPAPR_TPM_PROXY)
> +
> +typedef struct SpaprTpmProxy {
> +    /*< private >*/
> +    DeviceState parent;
> +
> +    char *host_path;
> +    int host_fd;
> +} SpaprTpmProxy;
> +
> +#endif /* HW_SPAPR_TPM_PROXY_H */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0ugWsACgkQbDjKyiDZ
s5LrkxAAuBkg/Pjr6e47I4EMnzRflp2MKqh4XnuJ6Krg/ND09HJt59qZ6SGBv2X3
NhUe0va6FlnfB8HdrY75Vlv+ASo8rbpgOcdegYh9BfiUDpS+Ybhy5092ETpsJkYP
9/IagQMEVijgDXhMFaarwMgGOmQqmzP7ElijB4PtKQaUtwbjyc5vj5Cy4z9GRwsn
6iBDemkfbCaK4T9iSeUgvhcUZMUayiqnJDbq0l88yUishqJ7wwawTFOi/yC+MhUe
W4o/b1/RJuSZ6sMk6x4BkycqkpDK+xpfQRf6o/8WFS65tBfa4m07S+P+oELTmn7N
CpUcLoYf+hgciKQdZ6RsTip8omkJHR0nT9oZ0A76ngsbIRQ5FeMbmBwtnY1MH2gj
AmLlKemPXsjRRP3NkN49YEPVN8LwI/WUoHqmGdGJMe2kyugWUthqLXqB10n07mua
Y9wunGTwI745Dt1i+BrwYrHPR9ci496+aFOZ6TnQup3JMRAxlnCQk6cyh+6oCzuo
kkCWQz528+JnJ7EU7PAbGFUhPjrdG+k9Qt22yMehxV7y4441NJfS0iJDDvxX2jqV
tAUsl7rngEc6DeXYFO1hsOXI30xOmy91EyEfheLONkWm4DswKeQqmE+NsEbRUtp5
p2sBn0Db2hxqQqqIzAlzbMFXLuferS4oHuF7OWzy+TtoFZwKoBI=
=U6Vs
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--

