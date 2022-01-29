Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3E4A2D05
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 09:20:06 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDixp-00065K-1Z
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 03:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDipN-0002xo-Nz
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nDipM-0005DU-2G
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 03:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643443879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSiqpHC2F7MZ+jp51/naZ8daN+DMPf4P0m+aaZYxKSs=;
 b=FUhY+l+kJik5sS5F2ao3bvPBFj6wGl4/W/vyL0Tv7qMMDM417jcZXUbCd+jI1Qu4mTuRcC
 Gu32WGJ0K3ikTMtlY4zPk9I3FuL162yw7NWP320/lqIOWvYOmqp9MTbtEuxEB15ajNPpoL
 wSsSdMNkfo8lCnlHgLKOxcEa+1T1+H4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-ku4AVW68M9mCU1YfRg6Zog-1; Sat, 29 Jan 2022 03:11:17 -0500
X-MC-Unique: ku4AVW68M9mCU1YfRg6Zog-1
Received: by mail-pg1-f200.google.com with SMTP id
 c75-20020a63354e000000b003408e4153d1so4727826pga.9
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 00:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSiqpHC2F7MZ+jp51/naZ8daN+DMPf4P0m+aaZYxKSs=;
 b=o7eeOE6VaeNCX/ZOL3zyM31E6Q6IQjXrq89nj30Cvy3NREOwZO3a4ahtTk4R4zeye+
 zAlLUfdnBMf1ipmThI08KdeHtqNUpb641TffVWt78fc7MayOzkNzkjo5od+GyC/FMyGm
 Br+AJv3VKCBIlHQfejqYNYZ1DxWNgIAbgXVwE4VUdvFAYsG6Xf3wfHOZEtSdyIg7sVlk
 0kkuzZoFHsYuP6MOkiQ9NZwN73rIcSeAGH9xBQMETTVMp7+eOLn87Q68/FuqfDyiayYD
 Kv+2bEP6i0yuhxxYPy4ctka6tSKGHsABc73zYus8nt2UF/H9s+aiCu68qJPpUp594Q84
 ahyw==
X-Gm-Message-State: AOAM530JdVEkuEp6SfbHftEI45oQHlzCBPqJcF6p0tnKcuO13A8+L8Wr
 QkNZKz1BM0JFx39SH+El0nbcNlcXyWWO9+ggZp31FIM07Vq36whkKXjmnwPQcsv11X/e8e/304n
 xP7LuiZ4KkS5fkWk=
X-Received: by 2002:a63:5306:: with SMTP id h6mr9418355pgb.298.1643443876615; 
 Sat, 29 Jan 2022 00:11:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFmd/OpM+Vv3EjICOPmSXCzITs12WatKY/fCGWDguLXTEn2aIEjcShBUw3BWEkuYHF+Do2fw==
X-Received: by 2002:a63:5306:: with SMTP id h6mr9418317pgb.298.1643443876234; 
 Sat, 29 Jan 2022 00:11:16 -0800 (PST)
Received: from [10.72.12.112] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f22sm10372225pfj.206.2022.01.29.00.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 00:11:15 -0800 (PST)
Message-ID: <660257ba-6445-3fb2-1da4-3b141e382191@redhat.com>
Date: Sat, 29 Jan 2022 16:11:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 11/31] vhost: Add vhost_svq_valid_device_features to
 shadow vq
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-12-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/22 上午4:27, Eugenio Pérez 写道:
> This allows SVQ to negotiate features with the device. For the device,
> SVQ is a driver. While this function needs to bypass all non-transport
> features, it needs to disable the features that SVQ does not support
> when forwarding buffers. This includes packed vq layout, indirect
> descriptors or event idx.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 44 ++++++++++++++++++++++++++++++
>   hw/virtio/vhost-vdpa.c             | 21 ++++++++++++++
>   3 files changed, 67 insertions(+)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index c9ffa11fce..d963867a04 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -15,6 +15,8 @@
>   
>   typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>   
> +bool vhost_svq_valid_device_features(uint64_t *features);
> +
>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
>   const EventNotifier *vhost_svq_get_dev_kick_notifier(
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 9619c8082c..51442b3dbf 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
>       return &svq->hdev_kick;
>   }
>   
> +/**
> + * Validate the transport device features that SVQ can use with the device
> + *
> + * @dev_features  The device features. If success, the acknowledged features.
> + *
> + * Returns true if SVQ can go with a subset of these, false otherwise.
> + */
> +bool vhost_svq_valid_device_features(uint64_t *dev_features)
> +{
> +    bool r = true;
> +
> +    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END;
> +         ++b) {
> +        switch (b) {
> +        case VIRTIO_F_NOTIFY_ON_EMPTY:
> +        case VIRTIO_F_ANY_LAYOUT:
> +            continue;
> +
> +        case VIRTIO_F_ACCESS_PLATFORM:
> +            /* SVQ does not know how to translate addresses */


I may miss something but any reason that we need to disable 
ACCESS_PLATFORM? I'd expect the vring helper we used for shadow 
virtqueue can deal with vIOMMU perfectly.


> +            if (*dev_features & BIT_ULL(b)) {
> +                clear_bit(b, dev_features);
> +                r = false;
> +            }
> +            break;
> +
> +        case VIRTIO_F_VERSION_1:


I had the same question here.

Thanks


> +            /* SVQ trust that guest vring is little endian */
> +            if (!(*dev_features & BIT_ULL(b))) {
> +                set_bit(b, dev_features);
> +                r = false;
> +            }
> +            continue;
> +
> +        default:
> +            if (*dev_features & BIT_ULL(b)) {
> +                clear_bit(b, dev_features);
> +            }
> +        }
> +    }
> +
> +    return r;
> +}
> +
>   /* Forward guest notifications */
>   static void vhost_handle_guest_kick(EventNotifier *n)
>   {
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index bdb45c8808..9d801cf907 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -855,10 +855,31 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>       size_t n_svqs = v->shadow_vqs_enabled ? hdev->nvqs : 0;
>       g_autoptr(GPtrArray) shadow_vqs = g_ptr_array_new_full(n_svqs,
>                                                              vhost_psvq_free);
> +    uint64_t dev_features;
> +    uint64_t svq_features;
> +    int r;
> +    bool ok;
> +
>       if (!v->shadow_vqs_enabled) {
>           goto out;
>       }
>   
> +    r = vhost_vdpa_get_features(hdev, &dev_features);
> +    if (r != 0) {
> +        error_setg(errp, "Can't get vdpa device features, got (%d)", r);
> +        return r;
> +    }
> +
> +    svq_features = dev_features;
> +    ok = vhost_svq_valid_device_features(&svq_features);
> +    if (unlikely(!ok)) {
> +        error_setg(errp,
> +            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok: 0x%"PRIx64,
> +            hdev->features, svq_features);
> +        return -1;
> +    }
> +
> +    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
>           VhostShadowVirtqueue *svq = vhost_svq_new();
>   


