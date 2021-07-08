Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F013C141E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:19:22 +0200 (CEST)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tw1-0004kM-5a
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1TlS-0005w8-0C
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:08:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1TlK-0008Rx-Ok
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wP92sXKXLxnQpVJ+LknyKWGNevAG+16AcK28kcEVYLY=;
 b=YiIx4WuyY8QUV46GDmJt35+JUw4Bkasc4dYlrLnEQ5Bkys/L97JTXA5pq+u4vhwmoougoH
 REvg0UGfQ6z07Gl9+yd7LJaYCoR33S/DQt7KgBIPlTlXZpHQGMNYkJCG69q6sdmKHuhAvp
 T/ZBB//IFc5N2nuO49SnqfDejQJvdvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-FvXmY0PmMA63-7GnDpfqmg-1; Thu, 08 Jul 2021 09:08:16 -0400
X-MC-Unique: FvXmY0PmMA63-7GnDpfqmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62006A0CAB;
 Thu,  8 Jul 2021 13:08:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC1810074FC;
 Thu,  8 Jul 2021 13:08:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB1C31132B52; Thu,  8 Jul 2021 15:08:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 2/3] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-3-danielhb413@gmail.com>
Date: Thu, 08 Jul 2021 15:08:13 +0200
In-Reply-To: <20210707003314.37110-3-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 6 Jul 2021 21:33:13 -0300")
Message-ID: <87lf6h6jia.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eblake@redhat.com, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> Linux Kernel 5.12 is now unisolating CPU DRCs in the device_removal
> error path, signalling that the hotunplug process wasn't successful.
> This allow us to send a DEVICE_UNPLUG_ERROR in drc_unisolate_logical()
> to signal this error to the management layer.
>
> We also have another error path in spapr_memory_unplug_rollback() for
> configured LMB DRCs. Kernels older than 5.13 will not unisolate the LMBs
> in the hotunplug error path, but it will reconfigure them. Let's send
> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
> case of older kernels.
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c     |  8 ++++++++
>  hw/ppc/spapr_drc.c | 15 +++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4dd90b75cc..fc071a1767 100644
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
> @@ -3641,7 +3642,14 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>       */
>      qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>                                   "for device %s", dev->id);
> +
> +    /*
> +     * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> +     * while the deprecation of MEM_UNPLUG_ERROR is
> +     * pending.
> +     */
>      qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    qapi_event_send_device_unplug_error(dev->id, qapi_error);

Can dev->id be null here?

Such devices exist, but maybe not here.

If dev->id can be null, we pass null to
qapi_event_send_device_unplug_error(), which is not okay.  The output
visitor papers over by replacing with "".  Let's not rely on this
misfeature.

>  }
>  
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a2f2634601..45a7b1aa16 100644
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
> +            const char qapi_error_fmt[] = "Device hotunplug rejected by the "
> +                                          "guest for device %s";
> +            g_autofree char *qapi_error = NULL;
> +
>              if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
>                  spapr = SPAPR_MACHINE(qdev_get_machine());
>  
> @@ -167,13 +173,10 @@ static uint32_t drc_unisolate_logical(SpaprDrc *drc)
>              }
>  
>              drc->unplug_requested = false;
> -            error_report("Device hotunplug rejected by the guest "
> -                         "for device %s", drc->dev->id);
> +            error_report(qapi_error_fmt, drc->dev->id);
>  
> -            /*
> -             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
> -             * it is implemented.
> -             */
> +            qapi_error = g_strdup_printf(qapi_error_fmt, drc->dev->id);
> +            qapi_event_send_device_unplug_error(drc->dev->id, qapi_error);
>          }
>  
>          return RTAS_OUT_SUCCESS; /* Nothing to do */

Likewise, only here we also pass it to g_strdup_printf() and possibly
vprintf() via error_report().  Null arguments to %s crash on some
systems.  The issue predates your patch.

I'm not sure reporting failed unplug with error_report() is a good idea,
but it's not your patch's idea.


