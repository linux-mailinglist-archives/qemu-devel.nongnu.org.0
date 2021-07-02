Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DD3BA260
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 16:55:34 +0200 (CEST)
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKZo-0001bm-Tq
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 10:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKYQ-0000K7-Pw
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKYN-0007lS-2S
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 10:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625237642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qr12SrQHU3gKtG0i3bMSLTafryj3tMJSCs05G6Eet2w=;
 b=FkHoby7ZF03L1+bARSrZY2WkUY88rAaJ3Oj3spGBdNTzrr8s1frqjrSn454YpCDyHf+yN5
 Tq7B4VxHgQLjxko4S3eLG8E46E3O28HKm8mSamTjYDqFfWT4vEK9mxpN4N67XMmn4mpNTv
 KL1JEk9YOA4Kapusf+7JHdrZp47oB38=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-uarlPixPNs-G5w2gB-Gj-Q-1; Fri, 02 Jul 2021 10:54:01 -0400
X-MC-Unique: uarlPixPNs-G5w2gB-Gj-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so6342960wms.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 07:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qr12SrQHU3gKtG0i3bMSLTafryj3tMJSCs05G6Eet2w=;
 b=q0h+D0nVFBbXU62VA+XBjAZXo8UYrYTmKQZqCu6SDn4B9/AF7VVn/Hawyq8Hh6IJ5h
 kPkJyOag1WnJPRMGWcmH3Qpy0xpL9woRr7/jrd4gkvsz5NkTx2D+jayKMjS9EqYib7ON
 EG8otsSkndPeRnHBUIDd/KFsNbuajE3gT1ujsbV8s2nHlZqdrDs9yIg7eCahf6rbiDto
 BK0eAUQJGeXEoxoMqmxo7saFlvinapKPUVpNAqRtAGpsCA/GO/BdyeiI07ace7Cjjt6s
 XUEBU/o0VflWETTZQDtzVwfWWhlhmaXNVFvDJtzsB7wEWSnSqZ+Y9fXP+9BmhhfHFFiy
 q4qQ==
X-Gm-Message-State: AOAM533IoSclizKj5/8LAH//tLtahz4DdsfIhWeM+IbjOTJZIWzuBqm5
 4DQfZ7xeyeAXxLMNpRMxtgEizRoDEKVbebXhc4PWrbwu9ZO78QOJSZlxmN7fOgHQZj7l1OJX8Gz
 bBtTnqusWFhztH70=
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr144012wmr.117.1625237640193; 
 Fri, 02 Jul 2021 07:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz67/yFaRM8Yj8zjl6JxlpsnBQLCycpj5HDj8ll5voG74HKESEedpc/7sc8VB1xhkaJVcAwVA==
X-Received: by 2002:a05:600c:b59:: with SMTP id
 k25mr143991wmr.117.1625237639949; 
 Fri, 02 Jul 2021 07:53:59 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id y7sm3613674wro.51.2021.07.02.07.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 07:53:59 -0700 (PDT)
Date: Fri, 2 Jul 2021 10:53:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 4/6] virtio-mem: Drop precopy notifier
Message-ID: <20210702105337-mutt-send-email-mst@kernel.org>
References: <20210616162940.28630-1-david@redhat.com>
 <20210616162940.28630-5-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210616162940.28630-5-david@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 teawater <teawaterz@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 06:29:38PM +0200, David Hildenbrand wrote:
> Migration code now properly handles RAMBlocks which are indirectly managed
> by a RamDiscardManager. No need for manual handling via the free page
> optimization interface, let's get rid of it.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

but really this is all migration code and should go through that tree.

> ---
>  hw/virtio/virtio-mem.c         | 34 ----------------------------------
>  include/hw/virtio/virtio-mem.h |  3 ---
>  2 files changed, 37 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 284096ec5f..d5a578142b 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -776,7 +776,6 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>      host_memory_backend_set_mapped(vmem->memdev, true);
>      vmstate_register_ram(&vmem->memdev->mr, DEVICE(vmem));
>      qemu_register_reset(virtio_mem_system_reset, vmem);
> -    precopy_add_notifier(&vmem->precopy_notifier);
>  
>      /*
>       * Set ourselves as RamDiscardManager before the plug handler maps the
> @@ -796,7 +795,6 @@ static void virtio_mem_device_unrealize(DeviceState *dev)
>       * found via an address space anymore. Unset ourselves.
>       */
>      memory_region_set_ram_discard_manager(&vmem->memdev->mr, NULL);
> -    precopy_remove_notifier(&vmem->precopy_notifier);
>      qemu_unregister_reset(virtio_mem_system_reset, vmem);
>      vmstate_unregister_ram(&vmem->memdev->mr, DEVICE(vmem));
>      host_memory_backend_set_mapped(vmem->memdev, false);
> @@ -1089,43 +1087,11 @@ static void virtio_mem_set_block_size(Object *obj, Visitor *v, const char *name,
>      vmem->block_size = value;
>  }
>  
> -static int virtio_mem_precopy_exclude_range_cb(const VirtIOMEM *vmem, void *arg,
> -                                               uint64_t offset, uint64_t size)
> -{
> -    void * const host = qemu_ram_get_host_addr(vmem->memdev->mr.ram_block);
> -
> -    qemu_guest_free_page_hint(host + offset, size);
> -    return 0;
> -}
> -
> -static void virtio_mem_precopy_exclude_unplugged(VirtIOMEM *vmem)
> -{
> -    virtio_mem_for_each_unplugged_range(vmem, NULL,
> -                                        virtio_mem_precopy_exclude_range_cb);
> -}
> -
> -static int virtio_mem_precopy_notify(NotifierWithReturn *n, void *data)
> -{
> -    VirtIOMEM *vmem = container_of(n, VirtIOMEM, precopy_notifier);
> -    PrecopyNotifyData *pnd = data;
> -
> -    switch (pnd->reason) {
> -    case PRECOPY_NOTIFY_AFTER_BITMAP_SYNC:
> -        virtio_mem_precopy_exclude_unplugged(vmem);
> -        break;
> -    default:
> -        break;
> -    }
> -
> -    return 0;
> -}
> -
>  static void virtio_mem_instance_init(Object *obj)
>  {
>      VirtIOMEM *vmem = VIRTIO_MEM(obj);
>  
>      notifier_list_init(&vmem->size_change_notifiers);
> -    vmem->precopy_notifier.notify = virtio_mem_precopy_notify;
>      QLIST_INIT(&vmem->rdl_list);
>  
>      object_property_add(obj, VIRTIO_MEM_SIZE_PROP, "size", virtio_mem_get_size,
> diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
> index 9a6e348fa2..a5dd6a493b 100644
> --- a/include/hw/virtio/virtio-mem.h
> +++ b/include/hw/virtio/virtio-mem.h
> @@ -65,9 +65,6 @@ struct VirtIOMEM {
>      /* notifiers to notify when "size" changes */
>      NotifierList size_change_notifiers;
>  
> -    /* don't migrate unplugged memory */
> -    NotifierWithReturn precopy_notifier;
> -
>      /* listeners to notify on plug/unplug activity. */
>      QLIST_HEAD(, RamDiscardListener) rdl_list;
>  };
> -- 
> 2.31.1


