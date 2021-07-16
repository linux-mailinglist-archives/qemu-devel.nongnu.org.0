Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244393CB7C4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:16:23 +0200 (CEST)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4NhW-0006a6-1e
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4Ng4-0005fh-41
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:14:52 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:23837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1m4Ng2-0007eU-Ln
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:14:51 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-3jeD0wsFMgaB1M5NeUlgMQ-1; Fri, 16 Jul 2021 09:14:46 -0400
X-MC-Unique: 3jeD0wsFMgaB1M5NeUlgMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5028283DD09;
 Fri, 16 Jul 2021 13:14:45 +0000 (UTC)
Received: from bahia.lan (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A476B26FB9;
 Fri, 16 Jul 2021 13:14:33 +0000 (UTC)
Date: Fri, 16 Jul 2021 15:14:32 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 7/7] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
Message-ID: <20210716151432.2e40138c@bahia.lan>
In-Reply-To: <20210712194339.813152-8-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
 <20210712194339.813152-8-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 16:43:39 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
>=20
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/acpi/memory_hotplug.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index e37acb0367..a0772fe083 100644
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
> @@ -181,10 +182,19 @@ static void acpi_memory_hotplug_write(void *opaque,=
 hwaddr addr, uint64_t data,
> =20
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> =20
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
>                  if (dev->id) {
>                      qapi_event_send_mem_unplug_error(dev->id, error_pret=
ty);
>                  }
> =20
> +                qapi_event_send_device_unplug_error(!!dev->id, dev->id,
> +                                                    dev->canonical_path,
> +                                                    true, error_pretty);
> +
>                  error_free(local_err);
>                  break;
>              }


