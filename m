Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEBB3BE5A5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:32:23 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m13uo-0007kR-AV
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m13r9-0002hx-S1
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:28:37 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m13r8-0002y9-IF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 05:28:35 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-4_q9u4XoO4Kz-2lSef8Wow-1; Wed, 07 Jul 2021 05:28:30 -0400
X-MC-Unique: 4_q9u4XoO4Kz-2lSef8Wow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5590879533;
 Wed,  7 Jul 2021 09:28:29 +0000 (UTC)
Received: from bahia.lan (ovpn-113-94.ams2.redhat.com [10.36.113.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A74EA5D741;
 Wed,  7 Jul 2021 09:28:24 +0000 (UTC)
Date: Wed, 7 Jul 2021 11:28:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Message-ID: <20210707112823.140e5987@bahia.lan>
In-Reply-To: <20210707003314.37110-4-danielhb413@gmail.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-4-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  6 Jul 2021 21:33:14 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
>=20
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/acpi/memory_hotplug.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..fb9f4d2de7 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -8,6 +8,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
>  #include "qapi/qapi-events-machine.h"
> +#include "qapi/qapi-events-qdev.h"
> =20
>  #define MEMORY_SLOTS_NUMBER          "MDNR"
>  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, =
hwaddr addr, uint64_t data,
>              /* call pc-dimm unplug cb */
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
> +                const char *error_pretty =3D error_get_pretty(local_err)=
;
> +
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> -                                                 error_get_pretty(local_=
err));
> +
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
> +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
> +                qapi_event_send_device_unplug_error(dev->id, error_prett=
y);
>                  error_free(local_err);
>                  break;
>              }


