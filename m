Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A23C13F6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:12:07 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Tp0-0000LU-LP
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1TmC-0006O9-B1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:09:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m1Tm7-0000AJ-Qu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625749747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AF/bPJOkcOlx58TPsVxcEyWeW8HltvByGmN7ylfms6U=;
 b=APqmlE6yPaAPcuQiBlpRfuiixX+DQp2HbObJF8LEpa0Q6CtwTaYS2NS++o6f0fyQ2TJwT1
 z/tOfDS+ZbaB69EjF7Pe+Kf9ei6F386gXmJOlfrvSJ7mrSsp5bdKj8vfLbPR6i5Ub/ftq7
 KS124wBsjhjstebEAA7NlM47I/2jzT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-FYzKBRUSM4mslNOjeEoWIg-1; Thu, 08 Jul 2021 09:09:04 -0400
X-MC-Unique: FYzKBRUSM4mslNOjeEoWIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8A148042DE;
 Thu,  8 Jul 2021 13:09:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8E65D705;
 Thu,  8 Jul 2021 13:08:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACA7B1132B52; Thu,  8 Jul 2021 15:08:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 3/3] memory_hotplug.c: send DEVICE_UNPLUG_ERROR in
 acpi_memory_hotplug_write()
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-4-danielhb413@gmail.com>
Date: Thu, 08 Jul 2021 15:08:57 +0200
In-Reply-To: <20210707003314.37110-4-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Tue, 6 Jul 2021 21:33:14 -0300")
Message-ID: <87h7h56jh2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
>
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/acpi/memory_hotplug.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index af37889423..fb9f4d2de7 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -8,6 +8,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
>  #include "qapi/qapi-events-machine.h"
> +#include "qapi/qapi-events-qdev.h"
>  
>  #define MEMORY_SLOTS_NUMBER          "MDNR"
>  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> @@ -177,9 +178,17 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>              /* call pc-dimm unplug cb */
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
> +                const char *error_pretty = error_get_pretty(local_err);
> +
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> -                qapi_event_send_mem_unplug_error(dev->id,
> -                                                 error_get_pretty(local_err));
> +
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
> +                qapi_event_send_mem_unplug_error(dev->id, error_pretty);
> +                qapi_event_send_device_unplug_error(dev->id, error_pretty);
>                  error_free(local_err);
>                  break;
>              }

Same question as for PATCH 2: can dev->id be null?


