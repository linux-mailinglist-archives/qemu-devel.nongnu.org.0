Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1F33CCEF3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:56:39 +0200 (CEST)
Received: from localhost ([::1]:40150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5O8k-0007Sp-CF
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m5O7p-0006Tj-SS
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:55:42 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m5O7o-0005Mr-5y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:55:41 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-zTU-0RPFOYishrnb3qBU_g-1; Mon, 19 Jul 2021 03:55:32 -0400
X-MC-Unique: zTU-0RPFOYishrnb3qBU_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76D180430B;
 Mon, 19 Jul 2021 07:55:31 +0000 (UTC)
Received: from bahia.lan (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6801E5C1C5;
 Mon, 19 Jul 2021 07:55:29 +0000 (UTC)
Date: Mon, 19 Jul 2021 09:55:28 +0200
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] ppc/vof: Fix Coverity issues
Message-ID: <20210719095528.5e8527a8@bahia.lan>
In-Reply-To: <20210713134638.1803316-1-aik@ozlabs.ru>
References: <20210713134638.1803316-1-aik@ozlabs.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 23:46:38 +1000
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> This fixes NEGATIVE_RETURNS, OVERRUN issues reported by the Coverity.
>=20
> This adds a comment about the return parameters number in the VOF hcall.
> The reason for such counting is to keep the numbers look the same in
> vof_client_handle() and the Linux (an OF client).
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>=20
> Will this make COverity happy? What is the canonical way of fixing these
> uint32_t vs. int? Thanks,
>=20

You might want to mention the Coverity IDs fixed by this
patch in the changelog, e.g.

Fixes: CID xxxxxxx, yyyyyyy

> ---
>  hw/ppc/vof.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
> index 81f65962156c..872f671babbe 100644
> --- a/hw/ppc/vof.c
> +++ b/hw/ppc/vof.c
> @@ -517,7 +517,7 @@ static uint32_t vof_instance_to_package(Vof *vof, uin=
t32_t ihandle)
>  static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
>                                      uint32_t buf, uint32_t len)
>  {
> -    uint32_t ret =3D -1;
> +    int ret =3D -1;
>      char tmp[VOF_MAX_PATH] =3D "";
> =20
>      ret =3D phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
> @@ -529,13 +529,13 @@ static uint32_t vof_package_to_path(const void *fdt=
, uint32_t phandle,
> =20
>      trace_vof_package_to_path(phandle, tmp, ret);
> =20
> -    return ret;
> +    return (uint32_t) ret;
>  }
> =20
>  static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihand=
le,
>                                       uint32_t buf, uint32_t len)
>  {
> -    uint32_t ret =3D -1;
> +    int ret =3D -1;
>      uint32_t phandle =3D vof_instance_to_package(vof, ihandle);
>      char tmp[VOF_MAX_PATH] =3D "";
> =20
> @@ -549,7 +549,7 @@ static uint32_t vof_instance_to_path(void *fdt, Vof *=
vof, uint32_t ihandle,
>      }
>      trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
> =20
> -    return ret;
> +    return (uint32_t) ret;
>  }
> =20
>  static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
> @@ -965,11 +965,15 @@ int vof_client_call(MachineState *ms, Vof *vof, voi=
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


