Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966366B62A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 04:33:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHGEU-0001eg-1A; Sun, 15 Jan 2023 22:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHGEP-0001e1-9q
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:32:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHGEN-0006jG-Bt
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 22:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673839937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQsIknu/4Ky0M0JL26f/4DBySR8DQm2OvF4VHl4DsGY=;
 b=LTw2r9EuH0PgXsezLundoO4gwoVybT/LVgDJwHfgXInxjXZEkKnEU5WKAWoST1BWrWnyfU
 6R6GtRWfiaOnzs3ZZaCDloqjLtth3H/Kru0e6nlkShLz6jOVGVYVWFSDkgdtXT2yCMP61U
 XI5OCZn5jmPmpi8Yc60bMV+wIJ75O88=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-2tXWyXcZNF2MP-sxELBGfg-1; Sun, 15 Jan 2023 22:32:16 -0500
X-MC-Unique: 2tXWyXcZNF2MP-sxELBGfg-1
Received: by mail-pg1-f200.google.com with SMTP id
 j21-20020a63fc15000000b00476d6932baeso12266718pgi.23
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 19:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JQsIknu/4Ky0M0JL26f/4DBySR8DQm2OvF4VHl4DsGY=;
 b=XyM54O87jQlOJWYI7qsy0vjblzLOmHhUdFo455gOMRCwkO1LRE//L7YBbcVajGGE28
 vUqPLWShrj/38HrX4P7t7G+WsMsnoDPfmmbp5tGW8Ariv8PWJRoFWxl8CBTjxrydRwCu
 kdpUQxkBDUZKFGDX5+RuRObKoP7V7JMKdqlhMkN0ZUAnBd8V5iD9nyNxoUv1VanE0RrE
 uVA1t4dWdhO82Jyotod3KQgc7/o3bzsheP7o6gnv9H7lvsUpA7w/zS5E4Fabq/89NYP6
 +OfOdbt2sgQzB9WCvk64Mh13IAywml2vDU7F+nZ9c1jJhNAB3xAdh9+r7H2E9en9cGJh
 w95Q==
X-Gm-Message-State: AFqh2kpRoO8TulMMK9WMeHe5pjnBuj5SGOLXA//CQpHXEFgXKHJLpg9r
 7R0fNLGdWHyvM7K60Ma+rFCrScFymZBZb0ddmoDZP9ejO7dXJM1nKBfm+E3DnBh0yiy7SO6JTkH
 MSnNNWmDQM0+fPB8=
X-Received: by 2002:a17:902:ce82:b0:194:84ef:5f9c with SMTP id
 f2-20020a170902ce8200b0019484ef5f9cmr9663401plg.29.1673839935797; 
 Sun, 15 Jan 2023 19:32:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNZfVJFCBoMsbvpKIZ3qP5mTuCBxSaIP2jTldZNCVoOGScQzYduSujvfOAURwf3wBWYse/Fg==
X-Received: by 2002:a17:902:ce82:b0:194:84ef:5f9c with SMTP id
 f2-20020a170902ce8200b0019484ef5f9cmr9663358plg.29.1673839935409; 
 Sun, 15 Jan 2023 19:32:15 -0800 (PST)
Received: from [10.72.13.117] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm4923574plh.143.2023.01.15.19.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 19:32:14 -0800 (PST)
Message-ID: <68d2c045-e260-140c-9525-2fc265ae9291@redhat.com>
Date: Mon, 16 Jan 2023 11:32:07 +0800
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWd3N3+78r_ZNNxZZMVJFpkqceYjOXtOrx6WSK62naN+jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/1/13 15:40, Eugenio Perez Martin 写道:
> On Fri, Jan 13, 2023 at 5:10 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jan 13, 2023 at 1:24 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> At this moment it is only possible to migrate to a vdpa device running
>>> with x-svq=on. As a protective measure, the rewind of the inflight
>>> descriptors was done at the destination. That way if the source sent a
>>> virtqueue with inuse descriptors they are always discarded.
>>>
>>> Since this series allows to migrate also to passthrough devices with no
>>> SVQ, the right thing to do is to rewind at the source so base of vrings
>>> are correct.
>>>
>>> Support for inflight descriptors may be added in the future.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   include/hw/virtio/vhost-backend.h |  4 +++
>>>   hw/virtio/vhost-vdpa.c            | 46 +++++++++++++++++++------------
>>>   hw/virtio/vhost.c                 |  3 ++
>>>   3 files changed, 36 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>> index c5ab49051e..ec3fbae58d 100644
>>> --- a/include/hw/virtio/vhost-backend.h
>>> +++ b/include/hw/virtio/vhost-backend.h
>>> @@ -130,6 +130,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>>>
>>>   typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
>>>                                          int fd);
>>> +
>>> +typedef void (*vhost_reset_status_op)(struct vhost_dev *dev);
>>> +
>>>   typedef struct VhostOps {
>>>       VhostBackendType backend_type;
>>>       vhost_backend_init vhost_backend_init;
>>> @@ -177,6 +180,7 @@ typedef struct VhostOps {
>>>       vhost_get_device_id_op vhost_get_device_id;
>>>       vhost_force_iommu_op vhost_force_iommu;
>>>       vhost_set_config_call_op vhost_set_config_call;
>>> +    vhost_reset_status_op vhost_reset_status;
>>>   } VhostOps;
>>>
>>>   int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 542e003101..28a52ddc78 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -1132,14 +1132,23 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>       if (started) {
>>>           memory_listener_register(&v->listener, &address_space_memory);
>>>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>> -    } else {
>>> -        vhost_vdpa_reset_device(dev);
>>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>> -        memory_listener_unregister(&v->listener);
>>> +    }
>>>
>>> -        return 0;
>>> +    return 0;
>>> +}
>>> +
>>> +static void vhost_vdpa_reset_status(struct vhost_dev *dev)
>>> +{
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +
>>> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
>>> +        return;
>>>       }
>>> +
>>> +    vhost_vdpa_reset_device(dev);
>>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>> +                                VIRTIO_CONFIG_S_DRIVER);
>>> +    memory_listener_unregister(&v->listener);
>>>   }
>>>
>>>   static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>>> @@ -1182,18 +1191,7 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
>>>                                          struct vhost_vring_state *ring)
>>>   {
>>>       struct vhost_vdpa *v = dev->opaque;
>>> -    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>>>
>>> -    /*
>>> -     * vhost-vdpa devices does not support in-flight requests. Set all of them
>>> -     * as available.
>>> -     *
>>> -     * TODO: This is ok for networking, but other kinds of devices might
>>> -     * have problems with these retransmissions.
>>> -     */
>>> -    while (virtqueue_rewind(vq, 1)) {
>>> -        continue;
>>> -    }
>>>       if (v->shadow_vqs_enabled) {
>>>           /*
>>>            * Device vring base was set at device start. SVQ base is handled by
>>> @@ -1212,6 +1210,19 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>>>       int ret;
>>>
>>>       if (v->shadow_vqs_enabled) {
>>> +        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>>> +
>>> +        /*
>>> +         * vhost-vdpa devices does not support in-flight requests. Set all of
>>> +         * them as available.
>>> +         *
>>> +         * TODO: This is ok for networking, but other kinds of devices might
>>> +         * have problems with these retransmissions.
>>> +         */
>>> +        while (virtqueue_rewind(vq, 1)) {
>>> +            continue;
>>> +        }
>>> +
>>>           ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
>>>           return 0;
>>>       }
>>> @@ -1326,4 +1337,5 @@ const VhostOps vdpa_ops = {
>>>           .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>>>           .vhost_force_iommu = vhost_vdpa_force_iommu,
>>>           .vhost_set_config_call = vhost_vdpa_set_config_call,
>>> +        .vhost_reset_status = vhost_vdpa_reset_status,
>> Can we simply use the NetClient stop method here?
>>
> Ouch, I squashed two patches by mistake here.
>
> All the vhost_reset_status part should be independent of this patch,
> and I was especially interested in its feedback. It had this message:
>
>      vdpa: move vhost reset after get vring base
>
>      The function vhost.c:vhost_dev_stop calls vhost operation
>      vhost_dev_start(false). In the case of vdpa it totally reset and wipes
>      the device, making the fetching of the vring base (virtqueue state) totally
>      useless.
>
>      The kernel backend does not use vhost_dev_start vhost op callback, but
>      vhost-user do. A patch to make vhost_user_dev_start more similar to vdpa
>      is desirable, but it can be added on top.
>
> I can resend the series splitting it again but conversation may
> scatter between versions. Would you prefer me to send a new version?


I think it can be done in next version (after we finalize the discussion 
for this version).


>
> Regarding the use of NetClient, it feels weird to call net specific
> functions in VhostOps, doesn't it?


Basically, I meant, the patch call vhost_reset_status() in 
vhost_dev_stop(). But we've already had vhost_dev_start ops where we 
implement per backend start/stop logic.

I think it's better to do things in vhost_dev_start():

For device that can do suspend, we can do suspend. For other we need to 
do reset as a workaround.

And if necessary, we can call nc client ops for net specific operations 
(if it has any).

Thanks


> At the moment vhost ops is
> specialized in vhost-kernel, vhost-user and vhost-vdpa. If we want to
> make it specific to the kind of device, that makes vhost-vdpa-net too.
>
> Thanks!
>
>
>> Thanks
>>
>>>   };
>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>> index eb8c4c378c..a266396576 100644
>>> --- a/hw/virtio/vhost.c
>>> +++ b/hw/virtio/vhost.c
>>> @@ -2049,6 +2049,9 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
>>>                                hdev->vqs + i,
>>>                                hdev->vq_index + i);
>>>       }
>>> +    if (hdev->vhost_ops->vhost_reset_status) {
>>> +        hdev->vhost_ops->vhost_reset_status(hdev);
>>> +    }
>>>
>>>       if (vhost_dev_has_iommu(hdev)) {
>>>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>>> --
>>> 2.31.1
>>>


