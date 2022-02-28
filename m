Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6304C61C8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 04:26:57 +0100 (CET)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOWga-0001z6-2A
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 22:26:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOWfR-0000zC-JC
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:25:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOWfO-0007Xt-Bz
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646018740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBGmmgh3L921GFnnUvUto7LBuBjp7TB4MQ++o/+HMgg=;
 b=edPdSDuqy8pg90aHLYR2K7keFpWGmyBpPFDWTzkzkOAXhiLOab2c4m8Dv6faHML1p8lHJP
 cMHsQlejyTRa7hlkdvUDU3GM7cq6cXP8J0ZY3uvn6jI9t1bgoZI13EzO2HtrqNGICSuMwn
 H/78tl2LoitCXKbXzvKXu6aSQaVTeu4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-YGke268IOMGta4_jc0Tv0w-1; Sun, 27 Feb 2022 22:25:39 -0500
X-MC-Unique: YGke268IOMGta4_jc0Tv0w-1
Received: by mail-pj1-f69.google.com with SMTP id
 97-20020a17090a09ea00b001bc54996b62so10509102pjo.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 19:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uBGmmgh3L921GFnnUvUto7LBuBjp7TB4MQ++o/+HMgg=;
 b=VDewJq7MFmYu7vxn70RoCd4BbR5T5i32FyD4jMoZuevWBWREMaM/Op0EW9LjgZbTko
 rX/pyWCvzKUMrSgd/ue0rMiwzdKPJLGfUKfUgSbHV2xJkdI8bM7LlhpCZq+Ld1KfnbUA
 9MvjqrNHq2JlszuuIky7+egf5HziU+zckeN4MMn6iqZqt58T4S+w7e71y63eVOddEYBS
 eF7NvS1lt409zSM9OxLEwGsYgnaGI9HdPyESpAISa7zixM6Py5FqJkoEZMO1ogJUkjll
 lWCH+kCCmmd5c2Np8lXLF+vqyX+eg32hg0K9F6S1nNxBZrBWd8XcwTovbjHJr8mU2ukG
 21cw==
X-Gm-Message-State: AOAM531jRhZGVVNjp2YtGHSuqb8DJjTKSgRUsQKYC2LadbtkKOlzJpQc
 93NpF71lnzEQ9K49wztPIZRwzVa9LIGQd2R/60ZXs1+Ort+WYp6BhNGCRwwNqT8ebKfOgyjAdEw
 XugBEuHOA9rP+4BQ=
X-Received: by 2002:a17:902:d0d2:b0:14f:d360:c103 with SMTP id
 n18-20020a170902d0d200b0014fd360c103mr18219675pln.7.1646018738261; 
 Sun, 27 Feb 2022 19:25:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+UxnYE3e32yzxHP9sAdijs47rgWR/U9zXtvLtRRUhDMEg50hRt5las68gLILhDz/fQcof2A==
X-Received: by 2002:a17:902:d0d2:b0:14f:d360:c103 with SMTP id
 n18-20020a170902d0d200b0014fd360c103mr18219633pln.7.1646018737913; 
 Sun, 27 Feb 2022 19:25:37 -0800 (PST)
Received: from [10.72.13.215] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 d32-20020a631d60000000b003650a9d8f9asm8770479pgm.33.2022.02.27.19.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 19:25:37 -0800 (PST)
Message-ID: <562b97bc-860e-b2e6-0f45-945a75c25da5@redhat.com>
Date: Mon, 28 Feb 2022 11:25:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 04/14] vhost: Add vhost_svq_valid_features to shadow vq
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220227134111.3254066-5-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/27 下午9:41, Eugenio Pérez 写道:
> This allows SVQ to negotiate features with the guest and the device. For
> the device, SVQ is a driver. While this function bypasses all
> non-transport features, it needs to disable the features that SVQ does
> not support when forwarding buffers. This includes packed vq layout,
> indirect descriptors or event idx.
>
> Future changes can add support to offer more features to the guest,
> since the use of VirtQueue gives this for free. This is left out at the
> moment for simplicity.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 39 ++++++++++++++++++++++++++++++
>   hw/virtio/vhost-vdpa.c             | 18 ++++++++++++++
>   3 files changed, 59 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 1d4c160d0a..84747655ad 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -33,6 +33,8 @@ typedef struct VhostShadowVirtqueue {
>       EventNotifier svq_call;
>   } VhostShadowVirtqueue;
>   
> +bool vhost_svq_valid_features(uint64_t *features);
> +
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 54c701a196..34354aea2c 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -14,6 +14,45 @@
>   #include "qemu/main-loop.h"
>   #include "linux-headers/linux/vhost.h"
>   
> +/**
> + * Validate the transport device features that both guests can use with the SVQ
> + * and SVQs can use with the device.
> + *
> + * @dev_features  The features. If success, the acknowledged features. If
> + *                failure, the minimal set from it.
> + *
> + * Returns true if SVQ can go with a subset of these, false otherwise.
> + */
> +bool vhost_svq_valid_features(uint64_t *features)
> +{
> +    bool r = true;
> +
> +    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END;
> +         ++b) {
> +        switch (b) {
> +        case VIRTIO_F_ANY_LAYOUT:
> +            continue;
> +
> +        case VIRTIO_F_ACCESS_PLATFORM:
> +            /* SVQ trust in the host's IOMMU to translate addresses */
> +        case VIRTIO_F_VERSION_1:
> +            /* SVQ trust that the guest vring is little endian */
> +            if (!(*features & BIT_ULL(b))) {
> +                set_bit(b, features);
> +                r = false;
> +            }
> +            continue;


It looks to me the *features is only used for logging errors, if this is 
the truth. I suggest to do error_setg in this function instead of 
letting the caller to pass a pointer.


> +
> +        default:
> +            if (*features & BIT_ULL(b)) {
> +                clear_bit(b, features);
> +            }


Do we need to check indirect and event idx here?

Thanks


> +        }
> +    }
> +
> +    return r;
> +}
> +
>   /** Forward guest notifications */
>   static void vhost_handle_guest_kick(EventNotifier *n)
>   {
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c73215751d..d614c435f3 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -348,11 +348,29 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>                                  Error **errp)
>   {
>       g_autoptr(GPtrArray) shadow_vqs = NULL;
> +    uint64_t dev_features, svq_features;
> +    int r;
> +    bool ok;
>   
>       if (!v->shadow_vqs_enabled) {
>           return 0;
>       }
>   
> +    r = hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
> +    if (r != 0) {
> +        error_setg_errno(errp, -r, "Can't get vdpa device features");
> +        return r;
> +    }
> +
> +    svq_features = dev_features;
> +    ok = vhost_svq_valid_features(&svq_features);
> +    if (unlikely(!ok)) {
> +        error_setg(errp,
> +            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok: 0x%"PRIx64,
> +            dev_features, svq_features);
> +        return -1;
> +    }
> +
>       shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
>           g_autoptr(VhostShadowVirtqueue) svq = vhost_svq_new();


