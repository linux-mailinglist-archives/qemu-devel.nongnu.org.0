Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B841FABB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 11:58:53 +0200 (CEST)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbnA-0003ub-D2
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 05:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWblS-00016x-PN
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mWblN-0004L5-2y
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P559N1O7PEVCoAsvAwmGaDYrx1qHEaI8oenXIYw9UjQ=;
 b=AK9bjCCWIpGto2DLe4mrtvQReVJGBY2DyHo24FKWHayC6cuePzf09gUbbRxcd2G9aHmLYD
 4I12TvewdGM1yUsSft1UpuTnmd8Mtp0wE9Y/zPcLs45bOKpFtuCTMdYOJ4RyoOz8ab09Tt
 tA07GlgDkppSajzsbAVyCkgLjEzbWXU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-CMmArdnENoCFBWehS8hr6A-1; Sat, 02 Oct 2021 05:56:58 -0400
X-MC-Unique: CMmArdnENoCFBWehS8hr6A-1
Received: by mail-ed1-f72.google.com with SMTP id
 z6-20020a50cd06000000b003d2c2e38f1fso12677863edi.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 02:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P559N1O7PEVCoAsvAwmGaDYrx1qHEaI8oenXIYw9UjQ=;
 b=5+9fDyM323hqtOnTg32HxlVJ7cYJsaN4thCEa9LKk4h4sJ8GxA76on1MpfAuPyuEHy
 r3QNqrOjinpkJyF0u2df8hTzukFMTojoCHNaJsR6MvrECvQ5aVy8GTOUWSDhjeZmCW+g
 yZsrVihdh/S0f1ttjwl4pZCx4ab3AWCvodvZD+WyI1DGGHKdyiVXH/EZvtIdrYYbcMCA
 +Z1yO97+ZI2epXruXPDRucLTPWY0DU/fU8IuCL72Kgb/9KOSAEziCaPHeaZyJbvhS3jV
 6ioppBouh920CNAaxE9PBHAuLelhaaaieGLrlO9f6+NAoDVt75GEZVkAPqhY4xRDwv11
 p1eQ==
X-Gm-Message-State: AOAM532sQhNgyX8NPbEnCbK/Y8Cd4yBGx8ZXGz2SkbJEJRuTzxUZP26l
 TaHckxA/j0Jq9/IjWSHSttKzT5M0MTW74xJcDnyglhb49HjXMR4y7lMams87EkZLolW51672+le
 yD3dBQZiMk0C793I=
X-Received: by 2002:a17:906:60c7:: with SMTP id
 f7mr3190606ejk.57.1633168617480; 
 Sat, 02 Oct 2021 02:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJNai6jGuN/1hYOm7jdfJoa77T1xRLacc5IYr4E+HB9n+MGi3C3XCRipoHj/VgZeC18JY30g==
X-Received: by 2002:a17:906:60c7:: with SMTP id
 f7mr3190590ejk.57.1633168617265; 
 Sat, 02 Oct 2021 02:56:57 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j22sm4143060ejt.11.2021.10.02.02.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 02:56:56 -0700 (PDT)
Message-ID: <1377c90c-a24f-cd86-455a-9efc5f7c8aa5@redhat.com>
Date: Sat, 2 Oct 2021 11:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210922125734.79712-1-david@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210922125734.79712-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/09/21 14:57, David Hildenbrand wrote:
> We want to rate-limit MEMORY_DEVICE_SIZE_CHANGE events per device,
> otherwise we can lose some events for devices. As we might not always have
> a device id, add the qom-path to the event and use that to rate-limit
> per device.
> 
> This was noticed by starting a VM with two virtio-mem devices that each
> have a requested size > 0. The Linux guest will initialize both devices
> in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
> one of the devices.
> 
> Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---

I cannot find v3 in my inbox, but I queued it from patchew.

Thanks,

Paolo

> 
> Follow up of:
>      https://lkml.kernel.org/r/20210921102434.24273-1-david@redhat.com
> 
> v1 -> v2:
> - Add the qom-path and use that identifier to rate-limit per device
> - Rephrase subject/description
> 
> ---
>   hw/virtio/virtio-mem-pci.c | 3 ++-
>   monitor/monitor.c          | 9 +++++++++
>   qapi/machine.json          | 5 ++++-
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
> index fa5395cd88..dd5085497f 100644
> --- a/hw/virtio/virtio-mem-pci.c
> +++ b/hw/virtio/virtio-mem-pci.c
> @@ -87,6 +87,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>       VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
>                                            size_change_notifier);
>       DeviceState *dev = DEVICE(pci_mem);
> +    const char * qom_path = object_get_canonical_path(OBJECT(dev));
>       const uint64_t * const size_p = data;
>       const char *id = NULL;
>   
> @@ -94,7 +95,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>           id = g_strdup(dev->id);
>       }
>   
> -    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
> +    qapi_event_send_memory_device_size_change(!!id, id, *size_p, qom_path);
>   }
>   
>   static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 46a171bca6..21c7a68758 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -474,6 +474,10 @@ static unsigned int qapi_event_throttle_hash(const void *key)
>           hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
>       }
>   
> +    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
> +        hash += g_str_hash(qdict_get_str(evstate->data, "qom-path"));
> +    }
> +
>       return hash;
>   }
>   
> @@ -496,6 +500,11 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
>                          qdict_get_str(evb->data, "node-name"));
>       }
>   
> +    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
> +        return !strcmp(qdict_get_str(eva->data, "qom-path"),
> +                       qdict_get_str(evb->data, "qom-path"));
> +    }
> +
>       return TRUE;
>   }
>   
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..2487c92f18 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1245,8 +1245,11 @@
>   # action).
>   #
>   # @id: device's ID
> +#
>   # @size: the new size of memory that the device provides
>   #
> +# @qom-path: path to the device object in the QOM tree (since 6.2)
> +#
>   # Note: this event is rate-limited.
>   #
>   # Since: 5.1
> @@ -1259,7 +1262,7 @@
>   #
>   ##
>   { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
> -  'data': { '*id': 'str', 'size': 'size' } }
> +  'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
>   
>   
>   ##
> 


