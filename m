Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDFB3BF007
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:07:03 +0200 (CEST)
Received: from localhost ([::1]:48984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Csv-0008QT-Pv
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Crp-0007ZV-64
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:05:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1Crm-0003uQ-Lj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625684749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEbKHqukhfgnoMAGGsgb1K8RcwQIsPpspwyL2vrO/0c=;
 b=YCr1y633AhZ2TkcRkdBQc1pOhGZq30ERMmsarNlgp0xYaqOGFCcp/9j+1eX5fhap+30MLF
 QcjXaDfvtJjjtiNWCUxAIASrQeYqV6/gyKxr487ThpDC3HdOeRm0ZW1A7I19TqOWPDqOxA
 S17RW1zH/ProeZIwSdBOS0BDuRmgCBU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-jfg5DGu0P4eMtMmwbd-DJA-1; Wed, 07 Jul 2021 15:05:48 -0400
X-MC-Unique: jfg5DGu0P4eMtMmwbd-DJA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso1917403edc.2
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 12:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jEbKHqukhfgnoMAGGsgb1K8RcwQIsPpspwyL2vrO/0c=;
 b=h3Q9ZohIH1eHgHiS3hgNwRwOqinezKSv4bdklgK1n2jE8P+19K7Ux2krAiokDHW7Ix
 trKg3moTSYM65x5IUwd9DA63t+GjP/oIxFr+lW6lyyPWD+qu/NCMKib7RFazElH4AeRt
 Z8FvLqNKmXOYO645qdqw9Euia1f4gl3kO1Z/Rpdma/KFTKszvn9lB5AlmJpG5RplGokY
 //Nhf8SEM8D7vobVXbbKx4vZqFfQ6NJm3xIB/Z5Dr8dxQlziYHp3eY5omq+PGN51l57X
 toIAuqXwzfwqofM0R67q8WFKJJABt2w2F2/GNLzd9Qj1CZfalL22HofyDuNOTIEZo4dO
 NcAw==
X-Gm-Message-State: AOAM533VsznZVk2xGxxwcSi3eWvSBt1t38hXsBbUQLoZdgzsnBjuP7nW
 DTAxlxPPL6lKdWccNgOS9PjQCCPoWB05lEPg3KWiUkYwTwqTptAt0DgTJrfpQ4dlwcirwdag8hk
 +xIiHt6c5uRc8gxg=
X-Received: by 2002:a17:907:7212:: with SMTP id
 dr18mr26167088ejc.552.1625684746868; 
 Wed, 07 Jul 2021 12:05:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0uScH6FSJb2bP+IViK+7H4Gb+PyCoaPS2Kg8JOrNt6/6wpVhuiRQK8DhFR3sfzWH/WV3aqA==
X-Received: by 2002:a17:907:7212:: with SMTP id
 dr18mr26167052ejc.552.1625684746651; 
 Wed, 07 Jul 2021 12:05:46 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id j6sm1083016eds.58.2021.07.07.12.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 12:05:45 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:05:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] virtio-balloon: disallow postcopy with
 VIRTIO_BALLOON_F_FREE_PAGE_HINT
Message-ID: <20210707150038-mutt-send-email-mst@kernel.org>
References: <20210707140655.30982-1-david@redhat.com>
 <20210707140655.30982-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210707140655.30982-3-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-stable@nongnu.org,
 Wei Wang <wei.w.wang@intel.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 04:06:55PM +0200, David Hildenbrand wrote:
> Postcopy never worked properly with 'free-page-hint=on', as there are
> at least two issues:
> 
> 1) With postcopy, the guest will never receive a VIRTIO_BALLOON_CMD_ID_DONE
>    and consequently won't release free pages back to the OS once
>    migration finishes.
> 
>    The issue is that for postcopy, we won't do a final bitmap sync while
>    the guest is stopped on the source and
>    virtio_balloon_free_page_hint_notify() will only call
>    virtio_balloon_free_page_done() on the source during
>    PRECOPY_NOTIFY_CLEANUP, after the VM state was already migrated to
>    the destination.
> 
> 2) Once the VM touches a page on the destination that has been excluded
>    from migration on the source via qemu_guest_free_page_hint() while
>    postcopy is active, that thread will stall until postcopy finishes
>    and all threads are woken up. (with older Linux kernels that won't
>    retry faults when woken up via userfaultfd, we might actually get a
>    SEGFAULT)
> 
>    The issue is that the source will refuse to migrate any pages that
>    are not marked as dirty in the dirty bmap -- for example, because the
>    page might just have been sent. Consequently, the faulting thread will
>    stall, waiting for the page to be migrated -- which could take quite
>    a while and result in guest OS issues.

OK so if source gets a request for a page which is not dirty
it does not respond immediately? Why not just teach it to
respond? It would seem that if destination wants a page we
should just give it to the destination ...


> 
> While we could fix 1), for example, by calling
> virtio_balloon_free_page_done() via pre_save callbacks of the
> vmstate, 2) is mostly impossible to fix without additional tracking,
> such that we can actually identify these hinted pages and handle
> them accordingly.
> As it never worked properly, let's disable it via the postcopy notifier on
> the destination. Trying to set "migrate_set_capability postcopy-ram on"
> on the destination now results in "virtio-balloon: 'free-page-hint' does
> not support postcopy Error: Postcopy is not supported".
> Note 1: We could let qemu_guest_free_page_hint() mark postcopy
>         as broken once actually clearing bits on the source. However, it's
>         harder to realize as we can race with users starting postcopy
>         and we cannot produce an expressive error message easily.


How about the reverse? Ignore qemu_guest_free_page_hint if postcopy
started?  Seems better than making it user/guest visible ..

> Note 2: virtio-mem has similar issues, however, access to "unplugged"
>         memory by the guest is very rare and we would have to be very
>         lucky for it to happen during migration. The spec states
>         "The driver SHOULD NOT read from unplugged memory blocks ..."
>         and "The driver MUST NOT write to unplugged memory blocks".
>         virtio-mem will move away from virtio_balloon_free_page_done()
>         soon and handle this case explicitly on the destination.
> 
> Fixes: c13c4153f76d ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")

OK it's not too bad, but I wonder whether above aideas have been
explored.

> Cc: qemu-stable@nongnu.org
> Cc: Wei Wang <wei.w.wang@intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Alexander Duyck <alexander.duyck@gmail.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/virtio/virtio-balloon.c         | 26 ++++++++++++++++++++++++++
>  include/hw/virtio/virtio-balloon.h |  1 +
>  2 files changed, 27 insertions(+)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 4b5d9e5e50..d0c9dc677c 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -30,6 +30,7 @@
>  #include "trace.h"
>  #include "qemu/error-report.h"
>  #include "migration/misc.h"
> +#include "migration/postcopy-ram.h"
>  
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
> @@ -692,6 +693,28 @@ virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
>      return 0;
>  }
>  
> +
> +static int virtio_balloon_postcopy_notify(NotifierWithReturn *n, void *opaque)
> +{
> +    VirtIOBalloon *dev = container_of(n, VirtIOBalloon, postcopy_notifier);
> +    PostcopyNotifyData *pnd = opaque;
> +
> +    /* We register the notifier only with 'free-page-hint=on' for now. */
> +    g_assert(virtio_has_feature(dev->host_features,
> +                                VIRTIO_BALLOON_F_FREE_PAGE_HINT));
> +
> +    /*
> +     * Pages hinted via qemu_guest_free_page_hint() are cleared from the dirty
> +     * bitmap and will not get migrated, especially also not when the postcopy
> +     * destination starts using them and requests migration from the source; the
> +     * faulting thread will stall until postcopy migration finishes and
> +     * all threads are woken up.
> +     */
> +    error_setg(pnd->errp,
> +               "virtio-balloon: 'free-page-hint' does not support postcopy");
> +    return -ENOENT;
> +}
> +
>  static size_t virtio_balloon_config_size(VirtIOBalloon *s)
>  {
>      uint64_t features = s->host_features;
> @@ -911,6 +934,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>          s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
>                                             virtio_balloon_handle_free_page_vq);
>          precopy_add_notifier(&s->free_page_hint_notify);
> +        postcopy_add_notifier(&s->postcopy_notifier);
>  
>          object_ref(OBJECT(s->iothread));
>          s->free_page_bh = aio_bh_new(iothread_get_aio_context(s->iothread),
> @@ -935,6 +959,7 @@ static void virtio_balloon_device_unrealize(DeviceState *dev)
>          object_unref(OBJECT(s->iothread));
>          virtio_balloon_free_page_stop(s);
>          precopy_remove_notifier(&s->free_page_hint_notify);
> +        postcopy_remove_notifier(&s->postcopy_notifier);
>      }
>      balloon_stats_destroy_timer(s);
>      qemu_remove_balloon_handler(s);
> @@ -1008,6 +1033,7 @@ static void virtio_balloon_instance_init(Object *obj)
>      qemu_cond_init(&s->free_page_cond);
>      s->free_page_hint_cmd_id = VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN;
>      s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
> +    s->postcopy_notifier.notify = virtio_balloon_postcopy_notify;
>  
>      object_property_add(obj, "guest-stats", "guest statistics",
>                          balloon_stats_get_all, NULL, NULL, s);
> diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
> index 5139cf8ab6..d0d5b793b9 100644
> --- a/include/hw/virtio/virtio-balloon.h
> +++ b/include/hw/virtio/virtio-balloon.h
> @@ -65,6 +65,7 @@ struct VirtIOBalloon {
>       */
>      bool block_iothread;
>      NotifierWithReturn free_page_hint_notify;
> +    NotifierWithReturn postcopy_notifier;
>      int64_t stats_last_update;
>      int64_t stats_poll_interval;
>      uint32_t host_features;
> -- 
> 2.31.1


