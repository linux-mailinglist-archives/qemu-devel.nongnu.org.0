Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7A3A41E0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 14:19:59 +0200 (CEST)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrg8k-0000vp-5q
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 08:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrg7v-000051-Tw
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 08:19:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrg7s-0000Fe-Ef
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 08:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623413943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Wjij/BB0tTbq8OZciyzxORWKaRtsTzRmLfa5OujE58=;
 b=IjAo+2mUSSNSxFEGnq9uaEc6yQrrM6Axb8dF0i5MFcHkqusX1TFt7+GQqT/fuRWBNGD3Rg
 DJV1RynsDFo2cf9ctn5Qfoau7MAO8UfLE+Fuv8CiMTPOo+NVEPVer+/BM1EzSwSrerV2PO
 jQokicXL+GtEHyNSPEPHVvUzd4IRp8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-Z1wbsJA9M3uXh4kCjxrulw-1; Fri, 11 Jun 2021 08:19:00 -0400
X-MC-Unique: Z1wbsJA9M3uXh4kCjxrulw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82DA019200C4;
 Fri, 11 Jun 2021 12:18:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30BB35D9C6;
 Fri, 11 Jun 2021 12:18:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 72899113865F; Fri, 11 Jun 2021 14:18:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 2/2] spapr: use DEVICE_UNPLUG_ERROR to report unplug
 errors
References: <20210604200353.1206897-1-danielhb413@gmail.com>
 <20210604200353.1206897-3-danielhb413@gmail.com>
Date: Fri, 11 Jun 2021 14:18:56 +0200
In-Reply-To: <20210604200353.1206897-3-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Fri, 4 Jun 2021 17:03:53 -0300")
Message-ID: <87y2bgppan.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
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
> in the hotunplug error path, but it will reconfigure them.  Let's send
> the DEVICE_UNPLUG_ERROR event in that code path as well to cover the
> case of older kernels.
>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c     |  2 +-
>  hw/ppc/spapr_drc.c | 15 +++++++++------
>  2 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c23bcc4490..29aa2f467d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3639,7 +3639,7 @@ void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>       */
>      qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>                                   "for device %s", dev->id);
> -    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
> +    qapi_event_send_device_unplug_error(dev->id, qapi_error);

Incompatible change: we now emit DEVICE_UNPLUG_ERROR instead of
MEM_UNPLUG_ERROR.  Intentional?

If yes, we need a release note.

To avoid the incompatible, we can emit both, and deprecate
MEM_UNPLUG_ERROR.

What about the MEM_UNPLUG_ERROR in acpi_memory_hotplug_write()?

>  }
>  
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index a2f2634601..0e1a8733bc 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -17,6 +17,8 @@
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-events-machine.h"
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

Reporting both to stderr and QMP is odd.  Can you describe a use case
where the report to stderr is useful?


