Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4BB3FFD6C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:47:38 +0200 (CEST)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5nN-0002Pv-Rz
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mM5m0-0001Ne-Qr
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:46:14 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:43155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mM5lz-0006ma-EB
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:46:12 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-darIF3AuO8-HZkN2iB6bpg-1; Fri, 03 Sep 2021 05:46:07 -0400
X-MC-Unique: darIF3AuO8-HZkN2iB6bpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BBAA107ACC7;
 Fri,  3 Sep 2021 09:46:06 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.192.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9363B179B3;
 Fri,  3 Sep 2021 09:46:05 +0000 (UTC)
Date: Fri, 3 Sep 2021 11:46:04 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 02/20] ppc/pnv: Add an assert when calculating the
 RAM distribution on chips
Message-ID: <20210903114604.2f54da87@bahia.lan>
In-Reply-To: <20210902130928.528803-3-clg@kaod.org>
References: <20210902130928.528803-1-clg@kaod.org>
 <20210902130928.528803-3-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sep 2021 15:09:10 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>=20

Reviewed-by: Greg Kurz <groug@kaod.org>

>  v2: fixed assert value ...
>=20
>  hw/ppc/pnv.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 03c86508d2f7..71e45515f136 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -723,6 +723,8 @@ static uint64_t pnv_chip_get_ram_size(PnvMachineState=
 *pnv, int chip_id)
>          return QEMU_ALIGN_DOWN(ram_per_chip, 1 * MiB);
>      }
> =20
> +    assert(pnv->num_chips > 1);
> +
>      ram_per_chip =3D (machine->ram_size - 1 * GiB) / (pnv->num_chips - 1=
);
>      return chip_id =3D=3D 0 ? 1 * GiB : QEMU_ALIGN_DOWN(ram_per_chip, 1 =
* MiB);
>  }


