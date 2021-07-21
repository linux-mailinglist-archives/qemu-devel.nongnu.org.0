Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514273D090C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:38:29 +0200 (CEST)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65sC-0008F0-C2
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65ng-0003cv-OM; Wed, 21 Jul 2021 02:33:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50331 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nb-0006q1-Qu; Wed, 21 Jul 2021 02:33:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv5Thwz9sXJ; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=grVaRaUwhoCulJlwSNlhXtcDbNysp6yAWndemI+8314=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pFg2TXMn+35dOuTJPW7rDsKMSfodzFrOZEKz+sQpH2BkAx7yEtZiXAs8VXv0IsFMm
 Em01w57R8CGclLBMVJOoOt3c9U5GtBHNo71yyjXUvGtYainTl4ovD/eBMStdDlVtwV
 6J3h7WpN4qLVPxaW9cLcYXNb5UruJuEqzCLa3Uy8=
Date: Wed, 21 Jul 2021 16:19:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v2] ppc/vof: Fix Coverity issues
Message-ID: <YPe8XJdXgJBBBxG2@yekko>
References: <20210720050726.2737405-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KxPMcULsrNHt1x+E"
Content-Disposition: inline
In-Reply-To: <20210720050726.2737405-1-aik@ozlabs.ru>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--KxPMcULsrNHt1x+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 03:07:26PM +1000, Alexey Kardashevskiy wrote:
> Coverity reported issues which are caused by mixing of signed return codes
> from DTC and unsigned return codes of the client interface.
>=20
> This introduces PROM_ERROR and makes distinction between the error types.
>=20
> This fixes NEGATIVE_RETURNS, OVERRUN issues reported by Coverity.
>=20
> This adds a comment about the return parameters number in the VOF hcall.
> The reason for such counting is to keep the numbers look the same in
> vof_client_handle() and the Linux (an OF client).
>=20
> vmc->client_architecture_support() returns target_ulong and we want to
> propagate this to the client (for example H_MULTI_THREADS_ACTIVE).
> The VOF path to do_client_architecture_support() needs chopping off
> the top 32bit but SLOF's H_CAS does not; and either way the return values
> are either 0 or 32bit negative error code. For now this chops
> the top 32bits.
>=20
> This makes "claim" fail if the allocated address is above 4GB as
> the client interface is 32bit. This still allows claiming memory above
> 4GB as potentially initrd can be put there and the client can read
> the address from the FDT's "available" property.
>=20
> Fixes: CID 1458139, 1458138, 1458137, 1458133, 1458132
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Well, I don't know for sure if it will fix every one, but it certainly
looks like an improvement.  So, applied to ppc-for-6.1.

Couple of minor notes:
[snip]
> @@ -461,18 +458,18 @@ trace_exit:
>  uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
>                                 const char *prop, const char *path)
>  {
> -    int node =3D fdt_path_offset(fdt, nodename);
> -    int inst, offset;
> +    int offset, node =3D fdt_path_offset(fdt, nodename);
> +    uint32_t inst;
> =20
>      offset =3D fdt_path_offset(fdt, path);
>      if (offset < 0) {
>          trace_vof_error_unknown_path(path);
> -        return offset;
> +        return PROM_ERROR;

Note that this case was a real bug, not just Coverity being pedantic.

>      }
> =20
>      inst =3D vof_do_open(fdt, vof, offset, path);
> =20
> -    return fdt_setprop_cell(fdt, node, prop, inst);
> +    return fdt_setprop_cell(fdt, node, prop, inst) >=3D 0 ? 0 : PROM_ERR=
OR;
>  }
> =20
>  static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
> @@ -481,13 +478,13 @@ static uint32_t vof_open(void *fdt, Vof *vof, uint3=
2_t pathaddr)
>      int offset;
> =20
>      if (readstr(pathaddr, path, sizeof(path))) {
> -        return -1;
> +        return PROM_ERROR;
>      }
> =20
>      offset =3D path_offset(fdt, path);
>      if (offset < 0) {
>          trace_vof_error_unknown_path(path);
> -        return offset;
> +        return PROM_ERROR;

As is this one.

[snip]
> @@ -826,7 +824,7 @@ trace_exit:
>  static uint32_t vof_call_interpret(uint32_t cmdaddr, uint32_t param1,
>                                     uint32_t param2, uint32_t *ret2)
>  {
> -    uint32_t ret =3D -1;
> +    uint32_t ret =3D PROM_ERROR;
>      char cmd[VOF_MAX_FORTHCODE] =3D "";
> =20
>      /* No interpret implemented so just call a trace */
> @@ -895,13 +893,20 @@ static uint32_t vof_client_handle(MachineState *ms,=
 void *fdt, Vof *vof,
>      } else if (cmpserv("write", 3, 1)) {
>          ret =3D vof_write(vof, args[0], args[1], args[2]);
>      } else if (cmpserv("claim", 3, 1)) {
> -        ret =3D vof_claim(vof, args[0], args[1], args[2]);
> -        if (ret !=3D -1) {
> +        uint64_t ret64 =3D vof_claim(vof, args[0], args[1], args[2]);
> +
> +        if (ret64 < 0x100000000UL) {

This assumes that 2^32 fits in an unsigned long; I'm not certainly if
that's true for all supported qemu host arches.  ULL would be safer
here.

>              vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base=
);
> +            ret =3D (uint32_t)ret64;
> +        } else {
> +            if (ret64 !=3D -1) {
> +                vof_release(vof, ret, args[1]);
> +            }
> +            ret =3D PROM_ERROR;
>          }
>      } else if (cmpserv("release", 2, 0)) {
>          ret =3D vof_release(vof, args[0], args[1]);
> -        if (ret !=3D -1) {
> +        if (ret !=3D PROM_ERROR) {
>              vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base=
);
>          }
>      } else if (cmpserv("call-method", 0, 0)) {
> @@ -965,11 +970,15 @@ int vof_client_call(MachineState *ms, Vof *vof, voi=
d *fdt,
>      }
> =20
>      nret =3D be32_to_cpu(args_be.nret);
> +    if (nret > ARRAY_SIZE(args_be.args) - nargs) {
> +        return -EINVAL;
> +    }
>      ret =3D vof_client_handle(ms, fdt, vof, service, args, nargs, rets, =
nret);
>      if (!nret) {
>          return 0;
>      }
> =20
> +    /* @nrets includes the value which this function returns */
>      args_be.args[nargs] =3D cpu_to_be32(ret);
>      for (i =3D 1; i < nret; ++i) {
>          args_be.args[nargs + i] =3D cpu_to_be32(rets[i - 1]);
> diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
> index 6e90a0107247..da6e74b80dc1 100644
> --- a/hw/ppc/trace-events
> +++ b/hw/ppc/trace-events
> @@ -88,8 +88,8 @@ vof_getproplen(uint32_t ph, const char *prop, uint32_t =
ret) "ph=3D0x%x \"%s\" =3D> l
>  vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t val=
len, uint32_t ret) "ph=3D0x%x \"%s\" [%s] len=3D%d =3D> ret=3D%d"
>  vof_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=3D0x%x =3D> =
ih=3D0x%x"
>  vof_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_=
t ret, uint32_t ret2) "[%s] 0x%x 0x%x =3D> 0x%x 0x%x"
> -vof_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=3D0x=
%x =3D> %s len=3D%d"
> -vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t=
 ret) "ih=3D0x%x ph=3D0x%x =3D> %s len=3D%d"
> +vof_package_to_path(uint32_t ph, const char *tmp, int ret) "ph=3D0x%x =
=3D> %s len=3D%d"
> +vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, int ret)=
 "ih=3D0x%x ph=3D0x%x =3D> %s len=3D%d"
>  vof_instance_to_package(uint32_t ih, uint32_t ph) "ih=3D0x%x =3D> ph=3D0=
x%x"
>  vof_write(uint32_t ih, unsigned cb, const char *msg) "ih=3D0x%x [%u] \"%=
s\""
>  vof_avail(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%=
"PRIx64" size=3D0x%"PRIx64

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KxPMcULsrNHt1x+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3vFoACgkQbDjKyiDZ
s5JcQA//SlqjajDDlDdO9yZ2+7ePxyLxYiWjFvf9j1+W7GcA/uSIAn3E9i03Jvb/
timDVEgIoYJdXWRBamR3NpoJuy3VStmxipnyoOJMFQR7zhDkNCxcumbt4+8gbQ5n
lcQGP/A+dddBfMKDJnUrz91NMgDfl7zhd3Q8dMxkB8sHbb/nJ0ko39FaFkyBv6N2
54rQbWCgoYONpQmEHSPBkUL39jlH8qci/I0erMJ8/0jcmVGxzI1ldu+Dpnkx5T/P
q1RSktnIGkqxamePEn22XBR8Ly50NWvC6s8vjf17CA3LIeSPYTi1LdWF6b1IFwM3
SxBdr7Qjb8aowzeRRz8WenUnPMUsbIBOG0Efv6DYP+nj1a+k61raTldQC/kmvbGt
iYMKOceBDy04tTy+V09J6VZgsbIjXGEyEBcYR97rF2MGAUeBasFyGEbKN/48i8jI
59CgQt5YQ/UJDbr48HZ8vznQXAlrossf1h43aCpn/RNKyXvdppxQTN2QI65GxYXw
x4o1XqEancRGaFrnnQgneLPIDx4LDB0nXdptZfMh6QV4WZtBANFMnpyAYB6kHfrW
la9xo3XpreLai8V1fUO/1yY1jCG84G8VnmQ6wOAtmEZnSnsE77FFqHXcNCQMO0aW
FJYBvTTz09hZKdUDNcrj6DosFkr82oTKvgXNLevJsqzL7bgNjxY=
=YT8y
-----END PGP SIGNATURE-----

--KxPMcULsrNHt1x+E--

