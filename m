Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33953CB77A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:46:10 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NEH-0006IG-ER
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4ND5-0005Mc-Lc
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:44:55 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:25154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4ND4-0000Bc-AP
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:44:55 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-0k6LpLLuNkS9nE2Sh6hdgQ-1; Fri, 16 Jul 2021 08:44:47 -0400
X-MC-Unique: 0k6LpLLuNkS9nE2Sh6hdgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF40F1B18BC0;
 Fri, 16 Jul 2021 12:44:46 +0000 (UTC)
Received: from bahia.lan (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 417835C1A1;
 Fri, 16 Jul 2021 12:44:41 +0000 (UTC)
Date: Fri, 16 Jul 2021 14:44:39 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 3/7] spapr_drc.c: do not error_report() when
 drc->dev->id == NULL
Message-ID: <20210716144439.0ac277ac@bahia.lan>
In-Reply-To: <20210712194339.813152-4-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
 <20210712194339.813152-4-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 16:43:35 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The error_report() call in drc_unisolate_logical() is not considering
> that drc->dev->id can be NULL, and the underlying functions error_report(=
)
> calls to do its job (vprintf(), g_strdup_printf() ...) has undefined
> behavior when trying to handle "%s" with NULL arguments.
>=20
> Besides, there is no utility into reporting that an unknown device was
> rejected by the guest.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_drc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a2f2634601..a4d9496f76 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -167,8 +167,11 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>              }
> =20
>              drc->unplug_requested =3D false;
> -            error_report("Device hotunplug rejected by the guest "
> -                         "for device %s", drc->dev->id);
> +
> +            if (drc->dev->id) {
> +                error_report("Device hotunplug rejected by the guest "
> +                             "for device %s", drc->dev->id);
> +            }
> =20
>              /*
>               * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when


