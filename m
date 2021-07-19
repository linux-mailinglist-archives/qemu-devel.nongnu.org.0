Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E343CEE07
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:14:48 +0200 (CEST)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ab8-00075H-Qe
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m5aaL-0006Fr-6F
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m5aaH-0003IB-Rl
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626729232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MQ1jw/CBZ8fhCsw/DwAbmILGiV/EzFgc4A46h5Q5+L4=;
 b=X9TgMk0UzE6tJh1VOM2zRU0XAq30KuSnkb4aRED9o/nxw5FgaeFNOWy1Goe7t9E1VKUpWJ
 UpEwfKcb4+RwyWF2r4DslrQzgfaIqLBRGYHt7ss7rGW+Xb5k8GsVfFrrEUW8uYCEqgQY/p
 RLof1/ooxr/wibc6GhSOsEdvgnnS1pc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-CDpKw7TnNMeLxfIm0gFFZQ-1; Mon, 19 Jul 2021 17:13:51 -0400
X-MC-Unique: CDpKw7TnNMeLxfIm0gFFZQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 p20-20020a1709064994b02903cd421d7803so5930886eju.22
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MQ1jw/CBZ8fhCsw/DwAbmILGiV/EzFgc4A46h5Q5+L4=;
 b=B7bUrEH0/RgYSJV+O5prMVZgii+tAVOX2ACua7HFhAYJ0CZcD7MmB/WxZcNoCT7D6R
 cZv5Mx/9HfJULs2ttreZlFioWs8jqcl849Ynui5in0A3XkgeNUosGt6XE+p81Boet96w
 OPcJ6AoRRSfuedrsG+K0AwSTKuRIea876HhHk9a9cxOTiBefbXvWPJgtvdoreAWK0qy4
 +FzWvR/Y0z0LSuC7rjYIh6miZSJij32WzJmtvhWN6t+18IJjLMbl8hZOWmkn0hm3BJzq
 BmNsDvYC76Q6nSK+kV3PervwZ+Z3A9YZCo/+560oSZ6fAkWNNQR1PK70wBd5FEwNcnaz
 TmLw==
X-Gm-Message-State: AOAM530pNsLxPruANOkr3Mr+WhujToa2CyUifTbzuAdUKpSri8X5SlkA
 +xoSDXXPZf2xlt/S92rSl6dvoZYeHDjBtu+rrQ18Q7hSst+ud+yEHXhu0z5rBy6UjzJZz/wKzWf
 s8pL/xUhNUXpabHk=
X-Received: by 2002:a50:baa4:: with SMTP id x33mr17479247ede.259.1626729230025; 
 Mon, 19 Jul 2021 14:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6/y1b8sqsn+ogMHsfx0uFuOrtIEUvdFR7pYmNPv4YFLb2pz41Y7own2BgpNNF9aJZ5T0nJA==
X-Received: by 2002:a50:baa4:: with SMTP id x33mr17479224ede.259.1626729229734; 
 Mon, 19 Jul 2021 14:13:49 -0700 (PDT)
Received: from redhat.com ([2.55.139.106])
 by smtp.gmail.com with ESMTPSA id bm1sm6384980ejb.38.2021.07.19.14.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:13:48 -0700 (PDT)
Date: Mon, 19 Jul 2021 17:13:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-6.2 v6 7/7] memory_hotplug.c: send
 DEVICE_UNPLUG_ERROR in acpi_memory_hotplug_write()
Message-ID: <20210719171324-mutt-send-email-mst@kernel.org>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
 <20210719200827.1507276-8-danielhb413@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210719200827.1507276-8-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com, groug@kaod.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 05:08:27PM -0300, Daniel Henrique Barboza wrote:
> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
> 
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls merge with rest of series.

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
> -- 
> 2.31.1


