Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4D3FBEF6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:23:33 +0200 (CEST)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpgi-0003j7-87
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKpfK-0002oO-61
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKpfF-0004Ph-12
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630362118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEtmDi4N2E392sMoVWkGdOltIrapUkBcloZx2FL7iHk=;
 b=AxoWXuZAmbBJ9eLQBklD0Lm+v6YsFGh9JmQBIPuE0XoN7meoR7iRSpVtx8sxQxaDBqlMEC
 dh109uqOIIAVmma+rB4WUnuBsOLPFIiXRTH4j2R5yMu1+Lj5P+KTnMy5x1KSYdK3sMjzzs
 MBhsIvfprAncXf+qdnbrmA+QdG7bWQo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-48I8DIcOOG6_GXZrMBKHEQ-1; Mon, 30 Aug 2021 18:21:57 -0400
X-MC-Unique: 48I8DIcOOG6_GXZrMBKHEQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 bf22-20020a0564021a5600b003c86b59e291so5524430edb.18
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cEtmDi4N2E392sMoVWkGdOltIrapUkBcloZx2FL7iHk=;
 b=octqydnVVIvH1o2hIqyg/btskFM+WjK/SGMkbSeMTYOGbCy6iSd4jcopBqxpKxxtDg
 gE9EFq0iwLcDY2YKy+o+7BbZcbsMjCcfNmYjadTmCdln5XxAS0krxR0s0xidRNVgoPyI
 +PhkLvjywRX4JlXOQY7xdTGN2isk3tBiLTPUOTmeDD9sX0hQXbCxy3/U/GoDOY7IcBk2
 u4lKEkv2T9JLyt9tAmSUDMkVD0CR7/9OxgMQX7DTlPGQMXRKj6xukWihgQDe3TZLMTCi
 YB0CLh8OllqTtISufgpnLgijMd8ASoVDIkzkL2On2vDigZbjoNO0XS1JIdQp/L/R+W6q
 WP9A==
X-Gm-Message-State: AOAM533TI3DF4QmeNnn3TQCwQY/epiFG+fi+T/RzaToRp92h5yCukMSy
 HITlJDAm4IzYwRyy3cFJQ53WmU79EhI6Qb6aok/dciNsM28knE5urswExBw2bpjYhgf64rVZmtf
 RjlzdoNRjcGkTfG0=
X-Received: by 2002:a50:9e41:: with SMTP id z59mr24138356ede.376.1630362115954; 
 Mon, 30 Aug 2021 15:21:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2YK8MusiaT7DWEuXCYplIOqjbjO0ZFGPdCaByTfO6241lPmMBtUc/hVL+d/2HCw2oOYxbfA==
X-Received: by 2002:a50:9e41:: with SMTP id z59mr24138341ede.376.1630362115800; 
 Mon, 30 Aug 2021 15:21:55 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
 by smtp.gmail.com with ESMTPSA id o12sm8214130edv.19.2021.08.30.15.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 15:21:54 -0700 (PDT)
Date: Mon, 30 Aug 2021 18:21:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 7/7] memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR
 in acpi_memory_hotplug_write()
Message-ID: <20210830182133-mutt-send-email-mst@kernel.org>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-8-danielhb413@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210825004835.472919-8-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Aug 24, 2021 at 09:48:35PM -0300, Daniel Henrique Barboza wrote:
> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_GUEST_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
> 
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

feel free to include with the rest of the patchset

> ---
>  hw/acpi/memory_hotplug.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 6a71de408b..d0fffcf787 100644
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
> @@ -178,8 +179,16 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> +
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_GUEST_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
>                  qapi_event_send_mem_unplug_error(dev->id ? : "",
>                                                   error_get_pretty(local_err));
> +                qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
> +                                                          dev->canonical_path);
>                  error_free(local_err);
>                  break;
>              }
> -- 
> 2.31.1


