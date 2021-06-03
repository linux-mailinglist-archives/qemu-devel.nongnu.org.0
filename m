Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B975E399A66
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 08:03:12 +0200 (CEST)
Received: from localhost ([::1]:57646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1logRi-000240-DM
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 02:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logQN-0001Gl-78
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1logQK-0008Db-RQ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 02:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622700103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5t236dlLOzCRSuuJRp8sh7wsx5NlYZGcwRMTk73keKk=;
 b=KTrIdiiFFQfsY5CNy3/8odPxHjupI37g/T9i2iSg2fZ/xVn27o2q7ss9R1F8QhoTBuhroX
 qcNEqFcwWkAz3cDbt/tj3YYLtzNnGRtFq53xMTCDq9X2kdEoUYG08odlzRDc2bC2uOFr/7
 +d4zdfPr8nMUcnXlZGp29bW5yanSDJI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-adNDM-kFMIyPk9JcQDo6Eg-1; Thu, 03 Jun 2021 02:01:41 -0400
X-MC-Unique: adNDM-kFMIyPk9JcQDo6Eg-1
Received: by mail-pl1-f199.google.com with SMTP id
 o12-20020a170902778cb02900ff01bc1ddbso2186917pll.2
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 23:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5t236dlLOzCRSuuJRp8sh7wsx5NlYZGcwRMTk73keKk=;
 b=UZPgPZhfE0Ckb15DJ5IW5Wc2+xpoREEfMQR/ZrY2Sp/8pDVtX6eElXtKpmjjqxJHSP
 g09G1hZqRlVzPDCLUXdyY+5WKM+6dm7cPkq8b9cTbdF6RT8C91jAwF8zG8kvQAuWK9j0
 bUxTqP9LocDm83F3gnzUgnfSasOqRGVaROtGH1sD9w0cRpI6N4AUuCUh8tGn0p1Yasrk
 0IFhDTcLe2H2Zs1aJZCkJv8ngFDc/qkGwn5KqgVGOaSSv2qivyJOkn78u1+DI8EIlYap
 DfF7ZRJAkf3QFMkFTAgfJPogXysvegDUdKpa3K8wTbZZ+wT+FT5xwev8GeI8DvlIzbNB
 ue+g==
X-Gm-Message-State: AOAM530Qh5zWFqEwxssTJmObwqFy8m42h/1SNg3FlKZmfANCUenKX6CQ
 BUtP248CkCxRF7O3L3SBYfA9MRtuvme61vGi/CccPsz3U6zu5KapPCsqz9XxLFXWF5/bufnHk5G
 1LO/uOsQ/KUWBCWB8wm8u3V7ZwoHdscBkasfX61d+G9cCEC0BqDhwKEDtZTzuGwh8Oqw=
X-Received: by 2002:a63:7e0a:: with SMTP id z10mr36922363pgc.12.1622700100134; 
 Wed, 02 Jun 2021 23:01:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYmnBiyaDRl8DiNP+9LhBG26XHhNssrb+r7C7IDN0Est0AL1EYuASF+rX7KQGmsh/Oo1aMag==
X-Received: by 2002:a63:7e0a:: with SMTP id z10mr36922328pgc.12.1622700099749; 
 Wed, 02 Jun 2021 23:01:39 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n2sm1494008pgl.59.2021.06.02.23.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 23:01:39 -0700 (PDT)
Subject: Re: [PATCH v7 03/10] virtio: decouple virtqueue from set notifier fd
 handler
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1e90824a-297b-a3f2-c34b-1230ffbc386b@redhat.com>
Date: Thu, 3 Jun 2021 14:01:35 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602034750.23377-4-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/2 ÉÏÎç11:47, Cindy Lu Ð´µÀ:
> To support config interrupt.we need to decouple virtqueue number


s/we/ We/


> from virtio_queue_set_guest_notifier_fd_handler,
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/s390x/virtio-ccw.c      |  6 +++---
>   hw/virtio/virtio-mmio.c    |  4 ++--
>   hw/virtio/virtio-pci.c     |  4 ++--
>   hw/virtio/virtio.c         | 17 +++++++++++------
>   include/hw/virtio/virtio.h |  2 +-
>   5 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 8195f3546e..58bb5232fd 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -1028,11 +1028,11 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
>           if (with_irqfd) {
>               r = virtio_ccw_add_irqfd(dev, n);
>               if (r) {
> -                virtio_queue_set_guest_notifier_fd_handler(vq, false,
> +                virtio_set_notifier_fd_handler(vdev, n, false,
>                                                              with_irqfd);
>                   return r;
>               }
> @@ -1056,7 +1056,7 @@ static int virtio_ccw_set_guest_notifier(VirtioCcwDevice *dev, int n,
>           if (with_irqfd) {
>               virtio_ccw_remove_irqfd(dev, n);
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>       return 0;
> diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
> index 342c918ea7..13772d52bb 100644
> --- a/hw/virtio/virtio-mmio.c
> +++ b/hw/virtio/virtio-mmio.c
> @@ -658,9 +658,9 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
>       } else {
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>   
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index c5c080ec94..6a4ef413a4 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -958,9 +958,9 @@ static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool assign,
>           if (r < 0) {
>               return r;
>           }
> -        virtio_queue_set_guest_notifier_fd_handler(vq, true, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, true, with_irqfd);
>       } else {
> -        virtio_queue_set_guest_notifier_fd_handler(vq, false, with_irqfd);
> +        virtio_set_notifier_fd_handler(vdev, n, false, with_irqfd);
>           event_notifier_cleanup(notifier);
>       }
>   
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 07f4e60b30..c5d786bb5e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3505,19 +3505,24 @@ static void virtio_queue_guest_notifier_read(EventNotifier *n)
>       }
>   }
>   
> -void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
> -                                                bool with_irqfd)
> +
> +void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int queue_no,
> +                               bool assign, bool with_irqfd)


Let's use "virtio_set_guest_notifier_fd_handler()".


>   {
> +    EventNotifier *e ;
> +    EventNotifierHandler *handler;
> +    VirtQueue *vq = virtio_get_queue(vdev, queue_no);
> +    e = &vq->guest_notifier;


So you still depends on the vq implicitly.

How about keep virtio_queue_set_guest_notifier_fd_handler() and factor 
its core logic to

virtio_set_guest_notifier_fd_handler() by passing the EventNotifier to 
this new helper?


> +    handler = virtio_queue_guest_notifier_read;
>       if (assign && !with_irqfd) {
> -        event_notifier_set_handler(&vq->guest_notifier,
> -                                   virtio_queue_guest_notifier_read);
> +        event_notifier_set_handler(e, handler);
>       } else {
> -        event_notifier_set_handler(&vq->guest_notifier, NULL);
> +        event_notifier_set_handler(e, NULL);
>       }
>       if (!assign) {
>           /* Test and clear notifier before closing it,
>            * in case poll callback didn't have time to run. */
> -        virtio_queue_guest_notifier_read(&vq->guest_notifier);
> +        handler(e);


Any reason for this change?

Thanks


>       }
>   }
>   
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 63cb9455ed..447899dea5 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -310,7 +310,7 @@ void virtio_queue_update_used_idx(VirtIODevice *vdev, int n);
>   VirtQueue *virtio_get_queue(VirtIODevice *vdev, int n);
>   uint16_t virtio_get_queue_index(VirtQueue *vq);
>   EventNotifier *virtio_queue_get_guest_notifier(VirtQueue *vq);
> -void virtio_queue_set_guest_notifier_fd_handler(VirtQueue *vq, bool assign,
> +void virtio_set_notifier_fd_handler(VirtIODevice *vdev, int n, bool assign,
>                                                   bool with_irqfd);
>   int virtio_device_start_ioeventfd(VirtIODevice *vdev);
>   int virtio_device_grab_ioeventfd(VirtIODevice *vdev);


