Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21F4535A8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:22:08 +0100 (CET)
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0Hf-0005MV-VQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mn0GY-0004fn-9E
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:20:58 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:49249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mn0GW-00031m-Kl
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:20:57 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-6FZHbcGPODmL4PzIKUqOng-1; Tue, 16 Nov 2021 10:20:51 -0500
X-MC-Unique: 6FZHbcGPODmL4PzIKUqOng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFBB780A5C3;
 Tue, 16 Nov 2021 15:20:49 +0000 (UTC)
Received: from bahia (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E09C719D9B;
 Tue, 16 Nov 2021 15:20:48 +0000 (UTC)
Date: Tue, 16 Nov 2021 16:20:47 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] pmu: fix pmu vmstate subsection list
Message-ID: <20211116162047.5cf2676d@bahia>
In-Reply-To: <20211116150837.169291-1-lvivier@redhat.com>
References: <20211116150837.169291-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 16:08:37 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> The subsection is not closed by a NULL marker so this can trigger
> a segfault when the pmu vmstate is saved.
>=20
> This can be easily shown with:
>=20
>   $ ./qemu-system-ppc64  -dump-vmstate vmstate.json
>   Segmentation fault (core dumped)
>=20
> Fixes: d811d61fbc6c ("mac_newworld: add PMU device")
> Cc: mark.cave-ayland@ilande.co.uk
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/misc/macio/pmu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 4ad4f50e08c3..eb39c64694aa 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -718,6 +718,7 @@ static const VMStateDescription vmstate_pmu =3D {
>      },
>      .subsections =3D (const VMStateDescription * []) {
>          &vmstate_pmu_adb,
> +        NULL
>      }
>  };
> =20

This fix is so obvious that I guess you could carry it through the
trivial tree IMHO.


