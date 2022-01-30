Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2838D4A33A3
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 05:05:40 +0100 (CET)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE1T8-0001sG-Ne
	for lists+qemu-devel@lfdr.de; Sat, 29 Jan 2022 23:05:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE1RW-0001CT-C8
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 23:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nE1RS-0005nH-DT
 for qemu-devel@nongnu.org; Sat, 29 Jan 2022 23:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643515432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFIaqK7M9BAi53NL1rhH7gNbtHPeQB0H6j65AiGJWBg=;
 b=bdIQ84MEDjDSH2u5Exp99LKc6BtpYj75/eYTf7TeYBiqR275kevWV5mJNli+zGuZ58ayt/
 /FvBXfdHxPJJ/1f+GkpzmWx0+o3BuluM6tCROSTAjqAzPmZa8oQ/u+qSRra8k8DZIa2r6A
 vFM2VDltFhb5qOHOeFH7XEfYPb3Qk5A=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-k2FEldSxMb-dIn_KAVYakg-1; Sat, 29 Jan 2022 23:03:50 -0500
X-MC-Unique: k2FEldSxMb-dIn_KAVYakg-1
Received: by mail-pg1-f199.google.com with SMTP id
 127-20020a630585000000b0035de5e88314so6077986pgf.2
 for <qemu-devel@nongnu.org>; Sat, 29 Jan 2022 20:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HFIaqK7M9BAi53NL1rhH7gNbtHPeQB0H6j65AiGJWBg=;
 b=N8TPnvXDRF9R4yp3ENn4Sx83xvMb5XBVbrQWzmY0mRn4VXBRI4AO/Rb86e09DAIpOs
 WswAnRXwP1f/ccm5OrhIOdPYrnowkxiZDeR+FEo8HycR64qpZaU3tJsxcQ0F8rz32NEJ
 LayNqZIGRavUNyRkBe/NH35WSw/WKo95/njChrfFSze0stQ0SW1r5V/jpJScvj6/iqGA
 82kc7DSc9lJLhBiWuPgC174sVPr23RpYvZpzuRn0m81C4Zv5W0mBq327rnTLUofCKjbo
 S3Lu8ff55k/iuHyZS24Q0Aw+tFN9R8VsNvzQwdsTP9WnCnqjSBxrSJarIyqshvcer0Ti
 kBTA==
X-Gm-Message-State: AOAM5335oyhrzGrtp+V0EvL47UwnwFmIiTMz+fg55y1QWsr6fEDxM8fE
 gvOyRU5OEOIYa5iIuptKvbUgBoIpxC64LvPitVJry1cmNtStCeR5cAzlr+WeGjHaw9Rjl+ZQCva
 grqADoCxjzTS0Xc8=
X-Received: by 2002:a17:90b:4a12:: with SMTP id
 kk18mr27929736pjb.227.1643515429604; 
 Sat, 29 Jan 2022 20:03:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKwxwopr8ME/4KezW9LHVHcLAS/GF6p7bPNTRyCivwXXBqWiXSVQdRO4a11lM6RAazoGsdfg==
X-Received: by 2002:a17:90b:4a12:: with SMTP id
 kk18mr27929696pjb.227.1643515429204; 
 Sat, 29 Jan 2022 20:03:49 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id nk11sm6644594pjb.55.2022.01.29.20.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jan 2022 20:03:48 -0800 (PST)
Message-ID: <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
Date: Sun, 30 Jan 2022 12:03:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220121202733.404989-18-eperezma@redhat.com>
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
> First half of the buffers forwarding part, preparing vhost-vdpa
> callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
> this is effectively dead code at the moment, but it helps to reduce
> patch size.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |   2 +-
>   hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
>   hw/virtio/vhost-vdpa.c             | 133 ++++++++++++++++++++++++++---
>   3 files changed, 143 insertions(+), 13 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 035207a469..39aef5ffdf 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>   
>   void vhost_svq_stop(VhostShadowVirtqueue *svq);
>   
> -VhostShadowVirtqueue *vhost_svq_new(void);
> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
>   
>   void vhost_svq_free(VhostShadowVirtqueue *vq);
>   
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index f129ec8395..7c168075d7 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   /**
>    * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>    * methods and file descriptors.
> + *
> + * @qsize Shadow VirtQueue size
> + *
> + * Returns the new virtqueue or NULL.
> + *
> + * In case of error, reason is reported through error_report.
>    */
> -VhostShadowVirtqueue *vhost_svq_new(void)
> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
>   {
> +    size_t desc_size = sizeof(vring_desc_t) * qsize;
> +    size_t device_size, driver_size;
>       g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>       int r;
>   
> @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
>       /* Placeholder descriptor, it should be deleted at set_kick_fd */
>       event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
>   
> +    svq->vring.num = qsize;


I wonder if this is the best. E.g some hardware can support up to 32K 
queue size. So this will probably end up with:

1) SVQ use 32K queue size
2) hardware queue uses 256

? Or we SVQ can stick to 256 but this will this cause trouble if we want 
to add event index support?


> +    driver_size = vhost_svq_driver_area_size(svq);
> +    device_size = vhost_svq_device_area_size(svq);
> +    svq->vring.desc = qemu_memalign(qemu_real_host_page_size, driver_size);
> +    svq->vring.avail = (void *)((char *)svq->vring.desc + desc_size);
> +    memset(svq->vring.desc, 0, driver_size);
> +    svq->vring.used = qemu_memalign(qemu_real_host_page_size, device_size);
> +    memset(svq->vring.used, 0, device_size);
> +
>       event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
>       return g_steal_pointer(&svq);
>   
> @@ -318,5 +335,7 @@ void vhost_svq_free(VhostShadowVirtqueue *vq)
>       event_notifier_cleanup(&vq->hdev_kick);
>       event_notifier_set_handler(&vq->hdev_call, NULL);
>       event_notifier_cleanup(&vq->hdev_call);
> +    qemu_vfree(vq->vring.desc);
> +    qemu_vfree(vq->vring.used);
>       g_free(vq);
>   }
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 9d801cf907..53e14bafa0 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -641,20 +641,52 @@ static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
>   }
>   
> -static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
> -                                      struct vhost_vring_state *ring)
> +static int vhost_vdpa_set_dev_vring_num(struct vhost_dev *dev,
> +                                        struct vhost_vring_state *ring)
>   {
>       trace_vhost_vdpa_set_vring_num(dev, ring->index, ring->num);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_NUM, ring);
>   }
>   
> -static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
> -                                       struct vhost_vring_state *ring)
> +static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
> +                                    struct vhost_vring_state *ring)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    if (v->shadow_vqs_enabled) {
> +        /*
> +         * Vring num was set at device start. SVQ num is handled by VirtQueue
> +         * code
> +         */
> +        return 0;
> +    }
> +
> +    return vhost_vdpa_set_dev_vring_num(dev, ring);
> +}
> +
> +static int vhost_vdpa_set_dev_vring_base(struct vhost_dev *dev,
> +                                         struct vhost_vring_state *ring)
>   {
>       trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
>       return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
>   }
>   
> +static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
> +                                     struct vhost_vring_state *ring)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    if (v->shadow_vqs_enabled) {
> +        /*
> +         * Vring base was set at device start. SVQ base is handled by VirtQueue
> +         * code
> +         */
> +        return 0;
> +    }
> +
> +    return vhost_vdpa_set_dev_vring_base(dev, ring);
> +}
> +
>   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>                                          struct vhost_vring_state *ring)
>   {
> @@ -784,8 +816,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       }
>   }
>   
> -static int vhost_vdpa_get_features(struct vhost_dev *dev,
> -                                     uint64_t *features)
> +static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
> +                                       uint64_t *features)
>   {
>       int ret;
>   
> @@ -794,15 +826,64 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
>       return ret;
>   }
>   
> +static int vhost_vdpa_get_features(struct vhost_dev *dev, uint64_t *features)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    int ret = vhost_vdpa_get_dev_features(dev, features);
> +
> +    if (ret == 0 && v->shadow_vqs_enabled) {
> +        /* Filter only features that SVQ can offer to guest */
> +        vhost_svq_valid_guest_features(features);
> +    }


Sorry if I've asked before, I think it's sufficient to filter out the 
device features that we don't support during and fail the vhost 
initialization. Any reason we need do it again here?


> +
> +    return ret;
> +}
> +
>   static int vhost_vdpa_set_features(struct vhost_dev *dev,
>                                      uint64_t features)
>   {
> +    struct vhost_vdpa *v = dev->opaque;
>       int ret;
>   
>       if (vhost_vdpa_one_time_request(dev)) {
>           return 0;
>       }
>   
> +    if (v->shadow_vqs_enabled) {
> +        uint64_t dev_features, svq_features, acked_features;
> +        bool ok;
> +
> +        ret = vhost_vdpa_get_dev_features(dev, &dev_features);
> +        if (ret != 0) {
> +            error_report("Can't get vdpa device features, got (%d)", ret);
> +            return ret;
> +        }
> +
> +        svq_features = dev_features;
> +        ok = vhost_svq_valid_device_features(&svq_features);
> +        if (unlikely(!ok)) {
> +            error_report("SVQ Invalid device feature flags, offer: 0x%"
> +                         PRIx64", ok: 0x%"PRIx64, dev->features, svq_features);
> +            return -1;
> +        }
> +
> +        ok = vhost_svq_valid_guest_features(&features);
> +        if (unlikely(!ok)) {
> +            error_report(
> +                "Invalid guest acked feature flag, acked: 0x%"
> +                PRIx64", ok: 0x%"PRIx64, dev->acked_features, features);
> +            return -1;
> +        }
> +
> +        ok = vhost_svq_ack_guest_features(svq_features, features,
> +                                          &acked_features);
> +        if (unlikely(!ok)) {
> +            return -1;
> +        }
> +
> +        features = acked_features;
> +    }
> +
>       trace_vhost_vdpa_set_features(dev, features);
>       ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
>       if (ret) {
> @@ -822,13 +903,31 @@ static int vhost_vdpa_set_owner(struct vhost_dev *dev)
>       return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
>   }
>   
> -static int vhost_vdpa_vq_get_addr(struct vhost_dev *dev,
> -                    struct vhost_vring_addr *addr, struct vhost_virtqueue *vq)
> +static void vhost_vdpa_vq_get_guest_addr(struct vhost_vring_addr *addr,
> +                                         struct vhost_virtqueue *vq)
>   {
> -    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>       addr->desc_user_addr = (uint64_t)(unsigned long)vq->desc_phys;
>       addr->avail_user_addr = (uint64_t)(unsigned long)vq->avail_phys;
>       addr->used_user_addr = (uint64_t)(unsigned long)vq->used_phys;
> +}
> +
> +static int vhost_vdpa_vq_get_addr(struct vhost_dev *dev,
> +                                  struct vhost_vring_addr *addr,
> +                                  struct vhost_virtqueue *vq)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +
> +    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> +
> +    if (v->shadow_vqs_enabled) {
> +        int idx = vhost_vdpa_get_vq_index(dev, addr->index);
> +        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
> +
> +        vhost_svq_get_vring_addr(svq, addr);
> +    } else {
> +        vhost_vdpa_vq_get_guest_addr(addr, vq);
> +    }
> +
>       trace_vhost_vdpa_vq_get_addr(dev, vq, addr->desc_user_addr,
>                                    addr->avail_user_addr, addr->used_user_addr);
>       return 0;
> @@ -849,6 +948,12 @@ static void vhost_psvq_free(gpointer svq)
>       vhost_svq_free(svq);
>   }
>   
> +static int vhost_vdpa_get_max_queue_size(struct vhost_dev *dev,
> +                                         uint16_t *qsize)
> +{
> +    return vhost_vdpa_call(dev, VHOST_VDPA_GET_VRING_NUM, qsize);
> +}
> +
>   static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>                                  Error **errp)
>   {
> @@ -857,6 +962,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>                                                              vhost_psvq_free);
>       uint64_t dev_features;
>       uint64_t svq_features;
> +    uint16_t qsize;
>       int r;
>       bool ok;
>   
> @@ -864,7 +970,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>           goto out;
>       }
>   
> -    r = vhost_vdpa_get_features(hdev, &dev_features);
> +    r = vhost_vdpa_get_dev_features(hdev, &dev_features);
>       if (r != 0) {
>           error_setg(errp, "Can't get vdpa device features, got (%d)", r);
>           return r;
> @@ -879,9 +985,14 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>           return -1;
>       }
>   
> +    r = vhost_vdpa_get_max_queue_size(hdev, &qsize);
> +    if (unlikely(r)) {
> +        qsize = 256;
> +    }


Should we fail instead of having a "default" value here?

Thanks


> +
>       shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
>       for (unsigned n = 0; n < hdev->nvqs; ++n) {
> -        VhostShadowVirtqueue *svq = vhost_svq_new();
> +        VhostShadowVirtqueue *svq = vhost_svq_new(qsize);
>   
>           if (unlikely(!svq)) {
>               error_setg(errp, "Cannot create svq %u", n);


