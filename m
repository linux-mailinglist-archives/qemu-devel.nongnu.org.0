Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE2374D6E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:19:59 +0200 (CEST)
Received: from localhost ([::1]:37434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTcM-0007t6-0p
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTas-0005oI-TI; Wed, 05 May 2021 22:18:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:32783 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTaq-0004cU-8S; Wed, 05 May 2021 22:18:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbHLH61bsz9sPf; Thu,  6 May 2021 12:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620267495;
 bh=4vc8Cn7d16bjCvwzRyLTX4TfHZwJJcUHiaXo2HIDV1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wy+kwmW8lq/oxVqXrRCfQ55FxTEAMNMQ6deGeNOrGGav1yqtLXx4aPOBdRt+UlEhD
 56CbdXZRxzdstl+P8MovfKM3w95ZgeTLb7MBHz4dfO1CDRUYbVHb6YxICXjdKbrESL
 aqxEK8AZbIPu2dO1rQQ3SvPJ6mE7HybIXdsvGQt8=
Date: Thu, 6 May 2021 12:12:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 10/23] hw/ppc/pnv: Avoid dynamic stack allocation
Message-ID: <YJNQiUXSfTgD1q19@yekko>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-11-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bj2N5Wdb33lTc/+h"
Content-Disposition: inline
In-Reply-To: <20210505211047.1496765-11-philmd@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bj2N5Wdb33lTc/+h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:10:34PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/pnv.c               | 4 ++--
>  hw/ppc/spapr.c             | 8 ++++----
>  hw/ppc/spapr_pci_nvlink2.c | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 77af846cdfe..f6e3d37b751 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -141,7 +141,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, v=
oid *fdt)
>      int smt_threads =3D CPU_CORE(pc)->nr_threads;
>      CPUPPCState *env =3D &cpu->env;
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
> -    uint32_t servers_prop[smt_threads];
> +    g_autofree uint32_t *servers_prop =3D g_new(uint32_t, smt_threads);
>      int i;
>      uint32_t segs[] =3D {cpu_to_be32(28), cpu_to_be32(40),
>                         0xffffffff, 0xffffffff};
> @@ -244,7 +244,7 @@ static void pnv_dt_core(PnvChip *chip, PnvCore *pc, v=
oid *fdt)
>          servers_prop[i] =3D cpu_to_be32(pc->pir + i);
>      }
>      _FDT((fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
> -                       servers_prop, sizeof(servers_prop))));
> +                       servers_prop, sizeof(*servers_prop) * smt_threads=
)));
>  }
> =20
>  static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 529ff056dd2..31c2c0d97bf 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -176,8 +176,8 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int offs=
et, PowerPCCPU *cpu,
>                                    int smt_threads)
>  {
>      int i, ret =3D 0;
> -    uint32_t servers_prop[smt_threads];
> -    uint32_t gservers_prop[smt_threads * 2];
> +    g_autofree uint32_t *servers_prop =3D g_new(uint32_t, smt_threads);
> +    g_autofree uint32_t *gservers_prop =3D g_new(uint32_t, smt_threads *=
 2);
>      int index =3D spapr_get_vcpu_id(cpu);
> =20
>      if (cpu->compat_pvr) {
> @@ -195,12 +195,12 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int of=
fset, PowerPCCPU *cpu,
>          gservers_prop[i*2 + 1] =3D 0;
>      }
>      ret =3D fdt_setprop(fdt, offset, "ibm,ppc-interrupt-server#s",
> -                      servers_prop, sizeof(servers_prop));
> +                      servers_prop, sizeof(*servers_prop) * smt_threads);
>      if (ret < 0) {
>          return ret;
>      }
>      ret =3D fdt_setprop(fdt, offset, "ibm,ppc-interrupt-gserver#s",
> -                      gservers_prop, sizeof(gservers_prop));
> +                      gservers_prop, sizeof(*gservers_prop) * smt_thread=
s * 2);
> =20
>      return ret;
>  }
> diff --git a/hw/ppc/spapr_pci_nvlink2.c b/hw/ppc/spapr_pci_nvlink2.c
> index 8ef9b40a18d..bb61adb114c 100644
> --- a/hw/ppc/spapr_pci_nvlink2.c
> +++ b/hw/ppc/spapr_pci_nvlink2.c
> @@ -401,7 +401,7 @@ void spapr_phb_nvgpu_populate_pcidev_dt(PCIDevice *de=
v, void *fdt, int offset,
>              continue;
>          }
>          if (dev =3D=3D nvslot->gpdev) {
> -            uint32_t npus[nvslot->linknum];
> +            g_autofree uint32_t *npus =3D g_new(uint32_t, nvslot->linknu=
m);
> =20
>              for (j =3D 0; j < nvslot->linknum; ++j) {
>                  PCIDevice *npdev =3D nvslot->links[j].npdev;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bj2N5Wdb33lTc/+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCTUIgACgkQbDjKyiDZ
s5Jv9RAAymc7V6GbetBJrq5NCa1o+oaVDos9bv7kYKu4JxUPZL5gdC47s7PZm117
d7DEJ3JsPanfbmTM8Uyk+yiuAUkBpOSINHAstpUD12b8/6SyauiyWAkoKApCcJx6
Plh8sVpJioU1iVyQp82vhm6UxcHsfheB1t4U1DjFhsJBTEhhORWqbYV5E6g7DtsK
3I7w9Vqs92L0GBxL4cvw3y2RSSyk8nv4fZCOQagWhN/cfwHvYeKkIaeCFTRtYULs
yPL6xplZ6/MSHTix5GLl1t2WkyKqBgFMqXfO99Jl/05BU/FdUSY6ovWseWG500f+
+2+mQTD7KvG5c+Vblgmcz364vZp6p/dgOz/0Ezk/zR/sFbBtSQSe65tE6iIrvVeP
RSz1Mkngi2gKuplwLibdNwIiDK8eOGkD8SuHipaJ7hMoX0nOCAagrTRyi37nwol8
kfHD9OyLCj04XOvJh7mpUudzubhusvcosR9+lF6N8gb2sF8lqKbYI8EL2TgKqHtR
ct1syph1zToAx+KvsHMDHVIVFr7Bmb0twJ/LiKAKdRSRy1rCKIu+iWNJLHUoJTCX
9m93k/QD0Iwu/DIdRWjdQVlp/Ss4LVZ+kAjps2ktDp/E/3oDbK6EtneLMUTEMovh
zGUQZak/bVgji8Jqqdb2SisrzQFThLaNacHhIv8JF/L6xlVlsEo=
=Dkz6
-----END PGP SIGNATURE-----

--bj2N5Wdb33lTc/+h--

