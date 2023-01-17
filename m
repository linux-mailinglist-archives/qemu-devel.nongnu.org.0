Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14266D565
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 05:39:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHdkU-00088I-2d; Mon, 16 Jan 2023 23:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHdkR-000887-Uo
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 23:38:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHdkQ-0003Ru-0s
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 23:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673930336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaM+flDxo6/gFamgMBgWc1osZ7hvwujzB1jXy0xbmlk=;
 b=Pfyd33E/t4yMzChJkOiMaukb1FjcBTtZpcwVF6DjDRT6RxmQh0dXDCtJCA1T8uUTjtZN4a
 bKDMvRK2SaB1lqkLyTbN4y7PXvaIIM/pR4NTBHxRaefN0ofx02SdovNLDO+QHedH3723is
 /V0b4+dHSRgfXGBG98yocVxkn06656c=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-CJ2OgtYjN8SAaFm-FIvivw-1; Mon, 16 Jan 2023 23:38:53 -0500
X-MC-Unique: CJ2OgtYjN8SAaFm-FIvivw-1
Received: by mail-pj1-f70.google.com with SMTP id
 s22-20020a17090aad9600b002271d094c82so14932172pjq.7
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 20:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SaM+flDxo6/gFamgMBgWc1osZ7hvwujzB1jXy0xbmlk=;
 b=c/4TJz0wLJuL4oWMYO7Cxs4gC+2f0YdOyhC/fj1KMGIQu6yQy8EcFLnFQwIogs6O3E
 6NQY8f4mHl7NgP3wdDGxPXD1fCHTj8/q/JVpeHZe4BDspfFTpD1FllmnrbUZHfxHdcUC
 KYNKmxmBwUK54ojI6c485NNsxPjTssu923dAp+grLuzML8+IMsij+6dNIAwDqd7N9e3o
 3aUv/Js+6LGLSP7cKavkE9PUtPu86ALV751+krS7mQabGqTw7Y1jNSYkzAKNa56xuF62
 85laKHtBTyutEnHHVh2eAbvAp59Ro86zKRyeosGc0EiSBsi1RoLwO/uvGjfSWQaTE3pp
 EQag==
X-Gm-Message-State: AFqh2koskUby0j/tYHj9qlAVafmgLVDVOVgd3gSOdAaTFUzrnq4+anpT
 Mnwc1/VS6FcXjzGA85E4z+o3IT27UuQwBdkfZBjBbUEg+GIay1rzfOHbeQgl11AuITAF2OFb206
 yllwuTaJIngmYgd8=
X-Received: by 2002:a05:6a00:27a8:b0:58b:a4bd:e82d with SMTP id
 bd40-20020a056a0027a800b0058ba4bde82dmr2098457pfb.26.1673930331952; 
 Mon, 16 Jan 2023 20:38:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvGNjC2gEPVt7SuZJRCTDk2YKiUAoVIH6Rd7MiTE859GM2XA1AdwLOz0j6JoHg1EXrrDYI6+Q==
X-Received: by 2002:a05:6a00:27a8:b0:58b:a4bd:e82d with SMTP id
 bd40-20020a056a0027a800b0058ba4bde82dmr2098416pfb.26.1673930331551; 
 Mon, 16 Jan 2023 20:38:51 -0800 (PST)
Received: from [10.72.13.215] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 w4-20020aa79544000000b0058db5d4b391sm1927271pfq.19.2023.01.16.20.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 20:38:51 -0800 (PST)
Message-ID: <0ce077ab-068f-e715-d4de-21a00f579860@redhat.com>
Date: Tue, 17 Jan 2023 12:38:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC v2 04/13] vdpa: rewind at get_base, not set_base
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-5-eperezma@redhat.com>
 <CACGkMEvo4fS0AZ7_i3MnpLJwic7VEX3x7BaaB=w1t7y2Fri9EQ@mail.gmail.com>
 <CAJaqyWd3N3+78r_ZNNxZZMVJFpkqceYjOXtOrx6WSK62naN+jA@mail.gmail.com>
 <68d2c045-e260-140c-9525-2fc265ae9291@redhat.com>
 <CAJaqyWeY30QETgksM2_zrc8xvOABSTAhwFUXRJRHumX0FFrqpw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWeY30QETgksM2_zrc8xvOABSTAhwFUXRJRHumX0FFrqpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/1/16 17:53, Eugenio Perez Martin 写道:
> On Mon, Jan 16, 2023 at 4:32 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2023/1/13 15:40, Eugenio Perez Martin 写道:
>>> On Fri, Jan 13, 2023 at 5:10 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On Fri, Jan 13, 2023 at 1:24 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> At this moment it is only possible to migrate to a vdpa device running
>>>>> with x-svq=on. As a protective measure, the rewind of the inflight
>>>>> descriptors was done at the destination. That way if the source sent a
>>>>> virtqueue with inuse descriptors they are always discarded.
>>>>>
>>>>> Since this series allows to migrate also to passthrough devices with no
>>>>> SVQ, the right thing to do is to rewind at the source so base of vrings
>>>>> are correct.
>>>>>
>>>>> Support for inflight descriptors may be added in the future.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>    include/hw/virtio/vhost-backend.h |  4 +++
>>>>>    hw/virtio/vhost-vdpa.c            | 46 +++++++++++++++++++------------
>>>>>    hw/virtio/vhost.c                 |  3 ++
>>>>>    3 files changed, 36 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>>>> index c5ab49051e..ec3fbae58d 100644
>>>>> --- a/include/hw/virtio/vhost-backend.h
>>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>>> @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>>>>>
>>>>>    typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
>>>>>                                           int fd);
>>>>> +
>>>>> +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
>>>>> +
>>>>>    typedef struct VhostOps {
>>>>>        VhostBackendType backend_type;
>>>>>        vhost_backend_init vhost_backend_init;
>>>>> @@ -177,6 +180,7 @@ typedef struct VhostOps {
>>>>>        vhost_get_device_id_op vhost_get_device_id;
>>>>>        vhost_force_iommu_op vhost_force_iommu;
>>>>>        vhost_set_config_call_op vhost_set_config_call;
>>>>> +    vhost_reset_status_op vhost_reset_status;
>>>>>    } VhostOps;
>>>>>
>>>>>    int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index 542e003101..28a52ddc78 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -1132,14 +1132,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>>>        if (started) {
>>>>>            memory_listener_register(&v->listener, &address_space_memory);
>>>>>            return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>>>> -    } else {
>>>>> -        vhost_vdpa_reset_device(dev);
>>>>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>>>> -        memory_listener_unregister(&v->listener);
>>>>> +    }
>>>>>
>>>>> -        return 0;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void vhost_vdpa_reset_status(struct vhost_dev *dev)
>>>>> +{
>>>>> +    struct vhost_vdpa *v = dev->opaque;
>>>>> +
>>>>> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
>>>>> +        return;
>>>>>        }
>>>>> +
>>>>> +    vhost_vdpa_reset_device(dev);
>>>>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>>> +                                VIRTIO_CONFIG_S_DRIVER);
>>>>> +    memory_listener_unregister(&v->listener);
>>>>>    }
>>>>>
>>>>>    static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>>>>> @@ -1182,18 +1191,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>>>>>                                           struct vhost_vring_state *ring)
>>>>>    {
>>>>>        struct vhost_vdpa *v = dev->opaque;
>>>>> -    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>>>>>
>>>>> -    /*
>>>>> -     * vhost-vdpa devices does not support in-flight requests. Set all of them
>>>>> -     * as available.
>>>>> -     *
>>>>> -     * TODO: This is ok for networking, but other kinds of devices might
>>>>> -     * have problems with these retransmissions.
>>>>> -     */
>>>>> -    while (virtqueue_rewind(vq, 1)) {
>>>>> -        continue;
>>>>> -    }
>>>>>        if (v->shadow_vqs_enabled) {
>>>>>            /*
>>>>>             * Device vring base was set at device start. SVQ base is handled by
>>>>> @@ -1212,6 +1210,19 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>>>>>        int ret;
>>>>>
>>>>>        if (v->shadow_vqs_enabled) {
>>>>> +        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>>>>> +
>>>>> +        /*
>>>>> +         * vhost-vdpa devices does not support in-flight requests. Set all of
>>>>> +         * them as available.
>>>>> +         *
>>>>> +         * TODO: This is ok for networking, but other kinds of devices might
>>>>> +         * have problems with these retransmissions.
>>>>> +         */
>>>>> +        while (virtqueue_rewind(vq, 1)) {
>>>>> +            continue;
>>>>> +        }
>>>>> +
>>>>>            ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
>>>>>            return 0;
>>>>>        }
>>>>> @@ -1326,4 +1337,5 @@ const VhostOps vdpa_ops = {
>>>>>            .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>>>>>            .vhost_force_iommu = vhost_vdpa_force_iommu,
>>>>>            .vhost_set_config_call = vhost_vdpa_set_config_call,
>>>>> +        .vhost_reset_status = vhost_vdpa_reset_status,
>>>> Can we simply use the NetClient stop method here?
>>>>
>>> Ouch, I squashed two patches by mistake here.
>>>
>>> All the vhost_reset_status part should be independent of this patch,
>>> and I was especially interested in its feedback. It had this message:
>>>
>>>       vdpa: move vhost reset after get vring base
>>>
>>>       The function vhost.c:vhost_dev_stop calls vhost operation
>>>       vhost_dev_start(false). In the case of vdpa it totally reset and wipes
>>>       the device, making the fetching of the vring base (virtqueue state) totally
>>>       useless.
>>>
>>>       The kernel backend does not use vhost_dev_start vhost op callback, but
>>>       vhost-user do. A patch to make vhost_user_dev_start more similar to vdpa
>>>       is desirable, but it can be added on top.
>>>
>>> I can resend the series splitting it again but conversation may
>>> scatter between versions. Would you prefer me to send a new version?
>>
>> I think it can be done in next version (after we finalize the discussion
>> for this version).
>>
>>
>>> Regarding the use of NetClient, it feels weird to call net specific
>>> functions in VhostOps, doesn't it?
>>
>> Basically, I meant, the patch call vhost_reset_status() in
>> vhost_dev_stop(). But we've already had vhost_dev_start ops where we
>> implement per backend start/stop logic.
>>
>> I think it's better to do things in vhost_dev_start():
>>
>> For device that can do suspend, we can do suspend. For other we need to
>> do reset as a workaround.
>>
> If the device implements _F_SUSPEND we can call suspend in
> vhost_dev_start(false) and fetch the vq base after it. But we cannot
> call vhost_dev_reset until we get the vq base. If we do it, we will
> always get zero there.


I'm not sure I understand here, that is kind of expected. For the device 
that doesn't support suspend, we can't get base anyhow since we need to 
emulate the stop with reset then we lose all the states.


>
> If we don't reset the device at vhost_vdpa_dev_start(false) we need to
> call a proper reset after getting the base, at least in vdpa.


This looks racy if we do get base before reset? Device can move the 
last_avail_idx.


> So to
> create a new vhost_op should be the right thing to do, isn't it?


So we did:

vhost_dev_stop()
     hdev->vhost_ops->vhost_dev_start(hdev, false);
     vhost_virtqueue_stop()
         vhost_get_vring_base()

I don't see any issue if we do suspend in vhost_dev_stop() in this case?

For the device that doesn't support suspend, we do reset in the stop and 
fail the get_vring_base() then we can use software fallback 
virtio_queue_restore_last_avail_idx()

?


>
> Hopefully with a better name than vhost_vdpa_reset_status, that's for sure :).
>
> I'm not sure how vhost-user works with this or when it does reset the
> indexes. My bet is that it never does at the device reinitialization
> and it trusts VMM calls to vhost_user_set_base but I may be wrong.


I think it's more safe to not touch the code path for vhost-user, it may 
connect to various kind of backends some of which might be fragile.

Thanks


>
> Thanks!
>
>> And if necessary, we can call nc client ops for net specific operations
>> (if it has any).
>>
>> Thanks
>>
>>
>>> At the moment vhost ops is
>>> specialized in vhost-kernel, vhost-user and vhost-vdpa. If we want to
>>> make it specific to the kind of device, that makes vhost-vdpa-net too.
>>>
>>> Thanks!
>>>
>>>
>>>> Thanks
>>>>
>>>>>    };
>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>>> index eb8c4c378c..a266396576 100644
>>>>> --- a/hw/virtio/vhost.c
>>>>> +++ b/hw/virtio/vhost.c
>>>>> @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
>>>>>                                 hdev->vqs + i,
>>>>>                                 hdev->vq_index + i);
>>>>>        }
>>>>> +    if (hdev->vhost_ops->vhost_reset_status) {
>>>>> +        hdev->vhost_ops->vhost_reset_status(hdev);
>>>>> +    }
>>>>>
>>>>>        if (vhost_dev_has_iommu(hdev)) {
>>>>>            if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>>>>> --
>>>>> 2.31.1
>>>>>


