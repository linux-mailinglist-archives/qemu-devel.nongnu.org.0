Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A5E3E35D0
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 16:11:23 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCN2o-0006o1-52
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 10:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCN1N-0005rx-N1
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 10:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCN1L-0004dM-3x
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 10:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628345390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3JEtcVMWFM1ZJBF6w+8Fy9ENvk+uiIjRZgqU93VBjK0=;
 b=ZOv+mlTDjukVy256JG4pUPklVFG2SlyV9BK0z2M/U/HEeRGNUj7tqcT7DpeGaDR33wdRBG
 +Nbd2emL0I353/Wp1NSylCqx0hr4AaMIAeNESoN1fmBkzzmkHOHWU/BhjRDAG2xs7BUcW5
 BuSdb6BwC6Ssptfs5HJZgpmtxDkMfHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-_8ZRC8fVP4eEh-iNNB83jA-1; Sat, 07 Aug 2021 10:09:47 -0400
X-MC-Unique: _8ZRC8fVP4eEh-iNNB83jA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1E763639F;
 Sat,  7 Aug 2021 14:09:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 079A65DAA5;
 Sat,  7 Aug 2021 14:09:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9300311380A0; Sat,  7 Aug 2021 16:09:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 7/7] memory_hotplug.c: send
 DEVICE_UNPLUG_ERROR in acpi_memory_hotplug_write()
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-8-danielhb413@gmail.com>
Date: Sat, 07 Aug 2021 16:09:40 +0200
In-Reply-To: <20210719200827.1507276-8-danielhb413@gmail.com> (Daniel Henrique
 Barboza's message of "Mon, 19 Jul 2021 17:08:27 -0300")
Message-ID: <875ywhbb2z.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
>
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/acpi/memory_hotplug.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index e37acb0367..a0772fe083 100644
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
> @@ -181,10 +182,19 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>  
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
>  
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
>                  if (dev->id) {
>                      qapi_event_send_mem_unplug_error(dev->id, error_pretty);
>                  }
>  
> +                qapi_event_send_device_unplug_error(!!dev->id, dev->id,
> +                                                    dev->canonical_path,
> +                                                    true, error_pretty);
> +
>                  error_free(local_err);
>                  break;
>              }

Unlike the previous patch, "msg" is present even when !dev->id.  Makes
me doubt the previous patch's conditional passing of "msg" some more.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


