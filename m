Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466F3CB7BE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:14:11 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NfO-0004oW-D7
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4NeM-0003yI-Am
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:13:06 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4NeK-0006mo-IP
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:13:06 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-O_rGTFePN4-5b4ANI1_j4w-1; Fri, 16 Jul 2021 09:13:02 -0400
X-MC-Unique: O_rGTFePN4-5b4ANI1_j4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A83980006E;
 Fri, 16 Jul 2021 13:13:01 +0000 (UTC)
Received: from bahia.lan (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93E0E5C1A1;
 Fri, 16 Jul 2021 13:12:59 +0000 (UTC)
Date: Fri, 16 Jul 2021 15:12:58 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 6/7] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
Message-ID: <20210716151258.743aa4ce@bahia.lan>
In-Reply-To: <20210712194339.813152-7-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
 <20210712194339.813152-7-danielhb413@gmail.com>
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 eblake@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 16:43:38 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
> error path, signalling that the hotunplug process wasn't successful.
> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
> to signal this error to the management layer.
>=20
> We also have another error path in spapr_memory_unplug_rollback() for
> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
> in the hotunplug error path, but it will reconfigure them. Let's send
> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
> case of older kernels.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c     |  9 ++++++++-
>  hw/ppc/spapr_drc.c | 17 +++++++++++------
>  2 files changed, 19 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 1611d7ab05..5459f9a7e9 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -29,6 +29,7 @@
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-machine.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "qapi/visitor.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/hostmem.h"
> @@ -3686,13 +3687,19 @@ void spapr_memory_unplug_rollback(SpaprMachineSta=
te *spapr, DeviceState *dev)
> =20
>      /*
>       * Tell QAPI that something happened and the memory
> -     * hotunplug wasn't successful.
> +     * hotunplug wasn't successful. Keep sending
> +     * MEM_UNPLUG_ERROR even while sending DEVICE_UNPLUG_ERROR
> +     * until the deprecation MEM_UNPLUG_ERROR is due.
>       */
>      if (dev->id) {
>          qapi_error =3D g_strdup_printf("Memory hotunplug rejected by the=
 guest "
>                                       "for device %s", dev->id);
>          qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>      }
> +
> +    qapi_event_send_device_unplug_error(!!dev->id, dev->id,
> +                                        dev->canonical_path,
> +                                        qapi_error !=3D NULL, qapi_error=
);
>  }
> =20
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a4d9496f76..a3a15fd2ed 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -17,6 +17,8 @@
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-events-qdev.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>  #include "hw/ppc/spapr.h" /* for RTAS return codes */
> @@ -160,6 +162,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>           * means that the kernel is refusing the removal.
>           */
>          if (drc->unplug_requested && drc->dev) {
> +            const char qapi_error_fmt[] =3D "Device hotunplug rejected b=
y the "
> +                                          "guest for device %s";

It is usually preferable to keep error messages on one line to ease
grepping. No big deal.

Reviewed-by: Greg Kurz <groug@kaod.org>

> +            g_autofree char *qapi_error =3D NULL;
> +
>              if (spapr_drc_type(drc) =3D=3D SPAPR_DR_CONNECTOR_TYPE_LMB) =
{
>                  spapr =3D SPAPR_MACHINE(qdev_get_machine());
> =20
> @@ -169,14 +175,13 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc=
)
>              drc->unplug_requested =3D false;
> =20
>              if (drc->dev->id) {
> -                error_report("Device hotunplug rejected by the guest "
> -                             "for device %s", drc->dev->id);
> +                qapi_error =3D g_strdup_printf(qapi_error_fmt, drc->dev-=
>id);
> +                error_report(qapi_error_fmt, drc->dev->id);
>              }
> =20
> -            /*
> -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> -             * it is implemented.
> -             */
> +            qapi_event_send_device_unplug_error(!!drc->dev->id, drc->dev=
->id,
> +                                                drc->dev->canonical_path=
,
> +                                                qapi_error !=3D NULL, qa=
pi_error);
>          }
> =20
>          return RTAS_OUT_SUCCESS; /* Nothing to do */


