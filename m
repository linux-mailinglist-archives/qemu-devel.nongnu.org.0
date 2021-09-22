Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E085E414D40
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:41:32 +0200 (CEST)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4NI-0002yG-0h
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mT4M5-0002CS-M7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mT4Ls-0000ss-Ft
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:40:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632325203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5z67Ep+no88HjIRJrmEl8NI98iYYtZQtixND248vFlI=;
 b=WynPEJ8ySMLQv6B6iigrYci7VsaQvb3FZngFYdraed+5D36RtcwZ9tCEbFT7KeKfZdxwUI
 xjcmt+Qt9KQZUg3LLx0lr88GkpWSMvil2K0KMTzFqW86acH/E7R7IgHBHNhiKdRIHfSeQR
 rS19Isgz/BR5ikF3Oot6sWcGzW1P8ts=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-yrkHmhrHNRSE7IbuLkPm1Q-1; Wed, 22 Sep 2021 11:40:02 -0400
X-MC-Unique: yrkHmhrHNRSE7IbuLkPm1Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso2506327wrb.20
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5z67Ep+no88HjIRJrmEl8NI98iYYtZQtixND248vFlI=;
 b=zKBR2wiVbVo/ZzTtxraWUgvEMPry98YR5lg6Xv3ubtEFitOxHqymZ+tSLHOD05npLI
 qethsuL76BGxu90/4Ow1DpK94dHTk9KwAuA9CQDU8jk/YG/TKsM3JPkqCn6iWTKd0rDx
 Q7hb7sjW6L7fsgSJy1JFnqu8XvZEvz0Q8RDkwR5jtg+/OcR9P8Ed39T1n+WU+y27w2IF
 Eb4iAlk87fTmEPoRzIiTUMrEPb/T3aHgr+N5ZskitTyJlG2OeJUW7zALJFQMrWrnT7d4
 afUDH4GI/BWb0/iholOODUmvUeNsgwGODfyok0oAFP73awSm6O3Wb3k34jrl3zVQ0hNw
 RZRA==
X-Gm-Message-State: AOAM530qw82UUkXkcI0uw3T9QwY1drg9Za6itUs4saRvCbfvZJUChVGo
 F6yUW+M6nqEUNgcXEZ4U5Q50aH2vOg0NErrZMUoSCaqdz2/RCUjbr+qVYifQtLku4RoTEZOrsqd
 KCjtzeryW44nliIY=
X-Received: by 2002:a5d:6551:: with SMTP id z17mr254039wrv.414.1632325201410; 
 Wed, 22 Sep 2021 08:40:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC2CLkZVkV0YLk3snQh4Jj8qngIIRJpOfUk/ae1g+CawVWb7gC5755fj2fKJPPCslGiSYyLA==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr254022wrv.414.1632325201274; 
 Wed, 22 Sep 2021 08:40:01 -0700 (PDT)
Received: from work-vm (cpc109011-salf6-2-0-cust1562.10-2.cable.virginm.net.
 [82.29.118.27])
 by smtp.gmail.com with ESMTPSA id z13sm2902970wrs.90.2021.09.22.08.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 08:40:00 -0700 (PDT)
Date: Wed, 22 Sep 2021 16:39:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi
 events per device
Message-ID: <YUtOTk+R9G8spK6a@work-vm>
References: <20210922125734.79712-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210922125734.79712-1-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
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
> 
> Follow up of:
>     https://lkml.kernel.org/r/20210921102434.24273-1-david@redhat.com
> 
> v1 -> v2:
> - Add the qom-path and use that identifier to rate-limit per device
> - Rephrase subject/description
> 
> ---
>  hw/virtio/virtio-mem-pci.c | 3 ++-
>  monitor/monitor.c          | 9 +++++++++
>  qapi/machine.json          | 5 ++++-
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
> index fa5395cd88..dd5085497f 100644
> --- a/hw/virtio/virtio-mem-pci.c
> +++ b/hw/virtio/virtio-mem-pci.c
> @@ -87,6 +87,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>      VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
>                                           size_change_notifier);
>      DeviceState *dev = DEVICE(pci_mem);
> +    const char * qom_path = object_get_canonical_path(OBJECT(dev));
>      const uint64_t * const size_p = data;
>      const char *id = NULL;
>  
> @@ -94,7 +95,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
>          id = g_strdup(dev->id);
>      }
>  
> -    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
> +    qapi_event_send_memory_device_size_change(!!id, id, *size_p, qom_path);
>  }
>  
>  static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 46a171bca6..21c7a68758 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -474,6 +474,10 @@ static unsigned int qapi_event_throttle_hash(const void *key)
>          hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
>      }
>  
> +    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
> +        hash += g_str_hash(qdict_get_str(evstate->data, "qom-path"));
> +    }

It makes me wonder if all these entries could turn into:
  str = qdict_get_try_str(qdict, "qom-path");
  if (str) {
      hash += g_str_hash(str);
  }

and then stop worrying about checking each eventtype there?

Dave

> +
>      return hash;
>  }
>  
> @@ -496,6 +500,11 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
>                         qdict_get_str(evb->data, "node-name"));
>      }
>  
> +    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
> +        return !strcmp(qdict_get_str(eva->data, "qom-path"),
> +                       qdict_get_str(evb->data, "qom-path"));
> +    }
> +
>      return TRUE;
>  }
>  
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..2487c92f18 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1245,8 +1245,11 @@
>  # action).
>  #
>  # @id: device's ID
> +#
>  # @size: the new size of memory that the device provides
>  #
> +# @qom-path: path to the device object in the QOM tree (since 6.2)
> +#
>  # Note: this event is rate-limited.
>  #
>  # Since: 5.1
> @@ -1259,7 +1262,7 @@
>  #
>  ##
>  { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
> -  'data': { '*id': 'str', 'size': 'size' } }
> +  'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
>  
>  
>  ##
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


