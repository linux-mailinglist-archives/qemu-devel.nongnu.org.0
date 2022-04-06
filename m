Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D44F5971
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:24:23 +0200 (CEST)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1tm-0001tJ-Dn
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nc1mT-0008AT-BA; Wed, 06 Apr 2022 05:16:49 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nc1mP-0007U5-0Y; Wed, 06 Apr 2022 05:16:48 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KYJmM4TnRz4xXk; Wed,  6 Apr 2022 19:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1649236595;
 bh=N8ObPSS0SMJQsqUa32X1STHRDZPBY6X0yuw8VjjLr7A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H9H1P9m1Hm3I4uEEBNc6HDzP8bvrNAK6a0gXiLx6ugCmnZdcio2F8M5tQncOqBcjk
 NpF40A31wjHHTDzecpUmYVYA+JkPWwV5onNpppBre5n0vOCazBaPTC2e5pzLa1L7BW
 k3lEgRcxO47+lt9nBlOWQwuiB1qyLAAkLzZBc7TY=
Date: Wed, 6 Apr 2022 13:03:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-7.1 1/1] hw/ppc: check if spapr_drc_index() returns
 NULL in spapr_nvdimm.c
Message-ID: <Yk0DD+B7MmRtcILR@yekko>
References: <20220405203416.75952-1-danielhb413@gmail.com>
 <20220405203416.75952-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W7ftJep6zhvTBCYl"
Content-Disposition: inline
In-Reply-To: <20220405203416.75952-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W7ftJep6zhvTBCYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 05:34:16PM -0300, Daniel Henrique Barboza wrote:
> spapr_nvdimm_flush_completion_cb() and flush_worker_cb() are using the
> DRC object returned by spapr_drc_index() without checking it for NULL.
> In this case we would be dereferencing a NULL pointer when doing
> SPAPR_NVDIMM(drc->dev) and PC_DIMM(drc->dev).
>=20
> This can happen if, during a scm_flush(), the DRC object is wrongly
> freed/released by another part of the code (i.e. hotunplug the device).
> spapr_drc_index() would then return NULL in the callbacks.

I'm not entirely clear if you're saying this would only happen due to
a bug elsewhere in the code, or if there's some unusual race case or
set of guest/user actions that could trigger this.

>=20
> Fixes: Coverity CID 1487108, 1487178
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_nvdimm.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index c4c97da5de..e92d92fdae 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -447,9 +447,19 @@ static int flush_worker_cb(void *opaque)
>  {
>      SpaprNVDIMMDeviceFlushState *state =3D opaque;
>      SpaprDrc *drc =3D spapr_drc_by_index(state->drcidx);
> -    PCDIMMDevice *dimm =3D PC_DIMM(drc->dev);
> -    HostMemoryBackend *backend =3D MEMORY_BACKEND(dimm->hostmem);
> -    int backend_fd =3D memory_region_get_fd(&backend->mr);
> +    PCDIMMDevice *dimm;
> +    HostMemoryBackend *backend;
> +    int backend_fd;
> +
> +    if (!drc) {
> +        error_report("papr_scm: Could not find nvdimm device with DRC 0x=
%u",
> +                     state->drcidx);
> +        return H_HARDWARE;

If this does indicate a bug elswhere in qemu, this should probably be
an assert rather than an H_HARDWARE.

> +    }
> +
> +    dimm =3D PC_DIMM(drc->dev);
> +    backend =3D MEMORY_BACKEND(dimm->hostmem);
> +    backend_fd =3D memory_region_get_fd(&backend->mr);
> =20
>      if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
>          MemoryRegion *mr =3D host_memory_backend_get_memory(dimm->hostme=
m);
> @@ -475,7 +485,15 @@ static void spapr_nvdimm_flush_completion_cb(void *o=
paque, int hcall_ret)
>  {
>      SpaprNVDIMMDeviceFlushState *state =3D opaque;
>      SpaprDrc *drc =3D spapr_drc_by_index(state->drcidx);
> -    SpaprNVDIMMDevice *s_nvdimm =3D SPAPR_NVDIMM(drc->dev);
> +    SpaprNVDIMMDevice *s_nvdimm;
> +
> +    if (!drc) {
> +        error_report("papr_scm: Could not find nvdimm device with DRC 0x=
%u",
> +                     state->drcidx);
> +        return;
> +    }
> +
> +    s_nvdimm =3D SPAPR_NVDIMM(drc->dev);
> =20
>      state->hcall_ret =3D hcall_ret;
>      QLIST_REMOVE(state, node);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--W7ftJep6zhvTBCYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJNAwgACgkQgypY4gEw
YSJ1lg/+MXtNpMHsSa5yjx/rJzXKCxoJwBMOwFTufmIK3DpVkxq7yzRGixlHBo1V
ft9kkpmkFdzyoScLuiBrivMe863M6idQz5Nu9GR4l8qFuVmQXDTLjPjDhsIokMow
gTmA2QB+XuqVCAyLfrypAvOGaN84LwNkb9i8RJ+84AddK4f9wssGIiZQVG8G65Nj
WIow9PHePRtJTfqOoUmb1W/mjhRyIMHjd5gf0Ztlz0afEFWeUm5DMNn1h9/u+NMd
lLi0TNCsE881mufs+N4b7ENt+MkOjfcBbGQ2W4Mmomodz7mAkL8nJRphKBlbnaYs
sVECj1Ll+SbE+HwMmWp4ROBNXmxv+wNYisnyTOURa+F03rQow7GjnXIxU5J5ZRWV
qqgJ/tFJKoQN8jpvrPNUg1GVG+vftSJjx76LjWOaRCNduNASWbNuPtrVKLIR1iwV
KcsvPkNFN6MihC5sgUqo0JgZXo57gLDp0FLPTg2420GbNttzurbYWi6BgyH41t6s
1ildJYBa+hj5Pn9ERuHMtDOft8T3LuDjVF+VjjJhZVXov/xQk4hLD5etA0y6bgkM
Lokmcg79xZ4K/vUtMw3vBZxQQYdsGwdq+p33/N6cmoXQKcnXCSvNYOipHmeiJhgl
R8iOj7hxSJHB6+yc2LwqGm+noxM4DJzZ4+D4/hVSE+j+BIzjzrQ=
=LJNe
-----END PGP SIGNATURE-----

--W7ftJep6zhvTBCYl--

