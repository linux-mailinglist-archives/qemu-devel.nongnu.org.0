Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09021AF6E8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:29:52 +0200 (CEST)
Received: from localhost ([::1]:47392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7x4Z-00037G-2R
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i7x3F-0002J4-Ky
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i7x3E-0007ED-3s
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:28:29 -0400
Received: from 8.mo5.mail-out.ovh.net ([178.32.116.78]:51165)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i7x3D-0007DH-Ui
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:28:28 -0400
Received: from player716.ha.ovh.net (unknown [10.109.159.69])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id E99CD24D73D
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 09:28:24 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 6834E99CB25B;
 Wed, 11 Sep 2019 07:28:17 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
 <20190911040452.8341-4-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5cef1668-c20f-03aa-eab9-ba305891bad0@kaod.org>
Date: Wed, 11 Sep 2019 09:28:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911040452.8341-4-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11680085637292264230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtddugdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.116.78
Subject: Re: [Qemu-devel] [PATCH 3/7] spapr: Fixes a leak in CAS
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
Cc: aik@ozlabs.ru, lvivier@redhat.com, philmd@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/09/2019 06:04, David Gibson wrote:
> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>=20
> Add a missing g_free(fdt) if the resulting tree is bigger
> than the space allocated by SLOF.
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/ppc/spapr.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e03e874d94..d93dacd483 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1024,6 +1024,7 @@ int spapr_h_cas_compose_response(SpaprMachineStat=
e *spapr,
>      _FDT((fdt_pack(fdt)));
> =20
>      if (fdt_totalsize(fdt) + sizeof(hdr) > size) {
> +        g_free(fdt);
>          trace_spapr_cas_failed(size);
>          return -1;
>      }
>=20


