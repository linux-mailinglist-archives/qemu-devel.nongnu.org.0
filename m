Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7364BD6D4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 08:34:46 +0100 (CET)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM3DZ-0005WJ-Cq
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 02:34:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM3AR-0004Wd-P5
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:31:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM3AO-0003L9-Bh
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645428686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ahPHimZsQ2sv/IVieJaDo6Bj0pzBzI/VI/ciHrGoEo=;
 b=RO746LJrdvkZ+7MI8rkMUwTV1tYEGp9ot1uLO7/Q0X0p54V9fqaASxNUURav9xMy5pgOv/
 jO+BvLSD6Bds56idjAOxIii7ZBlNTMK9kg910zThoOlHuHSZEmnAdk69Gveu6XiMnC9TJE
 AGfDe/1ndA9Csnu5zJtYuIbZisjbHic=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-GAiI0psNNIahQZdeTGcDDA-1; Mon, 21 Feb 2022 02:31:22 -0500
X-MC-Unique: GAiI0psNNIahQZdeTGcDDA-1
Received: by mail-pj1-f69.google.com with SMTP id
 q68-20020a17090a17ca00b001bc1004382fso3742018pja.1
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 23:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7ahPHimZsQ2sv/IVieJaDo6Bj0pzBzI/VI/ciHrGoEo=;
 b=wB8QjoD1LWTjyquuJrrywUWBEmf8SDe91Lcisc0WSZ+fbex4KZ2Bqfvg2s7BZ7G8nc
 kjZAN5Gq+tx24ij603aMl1IEv6uhWumBCl/cmw5JQQfCglTdLoWPIXdJP3a8xBeVrHfs
 PFgW0g6vf6kukUqVW4t/Jbys2WyD6P94F9TlWxaG1nXpdgDXdWnUxWu7rMtOXTWLCM8f
 tshALGZM5H0FdfCR78bmt307uQvbllFaayMnDqXMKjG2YDimv5mKMTdo5k8W5+o3gxEb
 cnSWsD0skSgO8VaU3ibnjj2c1CHcjsEyW6yf7TjxR3FcdXHt3PubVMJP1KSRmAAHBzvj
 sSOQ==
X-Gm-Message-State: AOAM5337c94rPagjWl6VG9Cg6i0VURtLTNDiAORrPbGePC4pr+G8T6Vv
 /D1MbBhLi0U/i3aBk5FSvA3yGPw9YCd+LpYHq9lKIriT6u2JjLgkF9qkBAlUGhlitObh0UZ6Bb5
 822jIyv8etsQ9Qdc=
X-Received: by 2002:a17:903:183:b0:14f:2e5:4a85 with SMTP id
 z3-20020a170903018300b0014f02e54a85mr18193459plg.45.1645428681672; 
 Sun, 20 Feb 2022 23:31:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxa4BJWNGemcwUU9bXy9x9QuxRP3jZOJRYubMBy7Z+6z48v6vBy3HLVUfIF7/G3XMZhnUzTA==
X-Received: by 2002:a17:903:183:b0:14f:2e5:4a85 with SMTP id
 z3-20020a170903018300b0014f02e54a85mr18193429plg.45.1645428681338; 
 Sun, 20 Feb 2022 23:31:21 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s5sm17545818pgo.37.2022.02.20.23.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 23:31:20 -0800 (PST)
Message-ID: <2de34fc2-3184-accb-6c3d-327d62cb330c@redhat.com>
Date: Mon, 21 Feb 2022 15:31:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 01/31] vdpa: Reorder virtio/vhost-vdpa.c functions
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-2-eperezma@redhat.com>
 <bb5490a4-8fae-0cc8-56dd-0953a2b40922@redhat.com>
 <CAJaqyWffGzYv2+HufFZzzBPtu5z3_vaKh4evGXqj7hqTB0WU3A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWffGzYv2+HufFZzzBPtu5z3_vaKh4evGXqj7hqTB0WU3A@mail.gmail.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/28 下午3:57, Eugenio Perez Martin 写道:
> On Fri, Jan 28, 2022 at 6:59 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> vhost_vdpa_set_features and vhost_vdpa_init need to use
>>> vhost_vdpa_get_features in svq mode.
>>>
>>> vhost_vdpa_dev_start needs to use almost all _set_ functions:
>>> vhost_vdpa_set_vring_dev_kick, vhost_vdpa_set_vring_dev_call,
>>> vhost_vdpa_set_dev_vring_base and vhost_vdpa_set_dev_vring_num.
>>>
>>> No functional change intended.
>>
>> Is it related (a must) to the SVQ code?
>>
> Yes, SVQ needs to access the device variants to configure it, while
> exposing the SVQ ones.
>
> For example for set_features, SVQ needs to set device features in the
> start code, but expose SVQ ones to the guest.
>
> Another possibility is to forward-declare them but I feel it pollutes
> the code more, doesn't it? Is there any reason to avoid the reordering
> beyond reducing the number of changes/patches?


No, but for reviewer, it might be easier if you squash the reordering 
logic into the patch which needs that.

Thanks


>
> Thanks!
>
>
>> Thanks
>>
>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 164 ++++++++++++++++++++---------------------
>>>    1 file changed, 82 insertions(+), 82 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 04ea43704f..6c10a7f05f 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -342,41 +342,6 @@ static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
>>>        return v->index != 0;
>>>    }
>>>
>>> -static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>> -{
>>> -    struct vhost_vdpa *v;
>>> -    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>>> -    trace_vhost_vdpa_init(dev, opaque);
>>> -    int ret;
>>> -
>>> -    /*
>>> -     * Similar to VFIO, we end up pinning all guest memory and have to
>>> -     * disable discarding of RAM.
>>> -     */
>>> -    ret = ram_block_discard_disable(true);
>>> -    if (ret) {
>>> -        error_report("Cannot set discarding of RAM broken");
>>> -        return ret;
>>> -    }
>>> -
>>> -    v = opaque;
>>> -    v->dev = dev;
>>> -    dev->opaque =  opaque ;
>>> -    v->listener = vhost_vdpa_memory_listener;
>>> -    v->msg_type = VHOST_IOTLB_MSG_V2;
>>> -
>>> -    vhost_vdpa_get_iova_range(v);
>>> -
>>> -    if (vhost_vdpa_one_time_request(dev)) {
>>> -        return 0;
>>> -    }
>>> -
>>> -    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>> -                               VIRTIO_CONFIG_S_DRIVER);
>>> -
>>> -    return 0;
>>> -}
>>> -
>>>    static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
>>>                                                int queue_index)
>>>    {
>>> @@ -506,24 +471,6 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
>>>        return 0;
>>>    }
>>>
>>> -static int vhost_vdpa_set_features(struct vhost_dev *dev,
>>> -                                   uint64_t features)
>>> -{
>>> -    int ret;
>>> -
>>> -    if (vhost_vdpa_one_time_request(dev)) {
>>> -        return 0;
>>> -    }
>>> -
>>> -    trace_vhost_vdpa_set_features(dev, features);
>>> -    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
>>> -    if (ret) {
>>> -        return ret;
>>> -    }
>>> -
>>> -    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
>>> -}
>>> -
>>>    static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>>>    {
>>>        uint64_t features;
>>> @@ -646,35 +593,6 @@ static int vhost_vdpa_get_config(struct vhost_dev *dev, uint8_t *config,
>>>        return ret;
>>>     }
>>>
>>> -static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>> -{
>>> -    struct vhost_vdpa *v = dev->opaque;
>>> -    trace_vhost_vdpa_dev_start(dev, started);
>>> -
>>> -    if (started) {
>>> -        vhost_vdpa_host_notifiers_init(dev);
>>> -        vhost_vdpa_set_vring_ready(dev);
>>> -    } else {
>>> -        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>> -    }
>>> -
>>> -    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
>>> -        return 0;
>>> -    }
>>> -
>>> -    if (started) {
>>> -        memory_listener_register(&v->listener, &address_space_memory);
>>> -        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>> -    } else {
>>> -        vhost_vdpa_reset_device(dev);
>>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>> -        memory_listener_unregister(&v->listener);
>>> -
>>> -        return 0;
>>> -    }
>>> -}
>>> -
>>>    static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
>>>                                         struct vhost_log *log)
>>>    {
>>> @@ -735,6 +653,35 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
>>>        return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
>>>    }
>>>
>>> +static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>> +{
>>> +    struct vhost_vdpa *v = dev->opaque;
>>> +    trace_vhost_vdpa_dev_start(dev, started);
>>> +
>>> +    if (started) {
>>> +        vhost_vdpa_host_notifiers_init(dev);
>>> +        vhost_vdpa_set_vring_ready(dev);
>>> +    } else {
>>> +        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>> +    }
>>> +
>>> +    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    if (started) {
>>> +        memory_listener_register(&v->listener, &address_space_memory);
>>> +        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>> +    } else {
>>> +        vhost_vdpa_reset_device(dev);
>>> +        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>> +                                   VIRTIO_CONFIG_S_DRIVER);
>>> +        memory_listener_unregister(&v->listener);
>>> +
>>> +        return 0;
>>> +    }
>>> +}
>>> +
>>>    static int vhost_vdpa_get_features(struct vhost_dev *dev,
>>>                                         uint64_t *features)
>>>    {
>>> @@ -745,6 +692,24 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
>>>        return ret;
>>>    }
>>>
>>> +static int vhost_vdpa_set_features(struct vhost_dev *dev,
>>> +                                   uint64_t features)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (vhost_vdpa_one_time_request(dev)) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    trace_vhost_vdpa_set_features(dev, features);
>>> +    ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
>>> +    if (ret) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
>>> +}
>>> +
>>>    static int vhost_vdpa_set_owner(struct vhost_dev *dev)
>>>    {
>>>        if (vhost_vdpa_one_time_request(dev)) {
>>> @@ -772,6 +737,41 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>>>        return true;
>>>    }
>>>
>>> +static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>>> +{
>>> +    struct vhost_vdpa *v;
>>> +    assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
>>> +    trace_vhost_vdpa_init(dev, opaque);
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * Similar to VFIO, we end up pinning all guest memory and have to
>>> +     * disable discarding of RAM.
>>> +     */
>>> +    ret = ram_block_discard_disable(true);
>>> +    if (ret) {
>>> +        error_report("Cannot set discarding of RAM broken");
>>> +        return ret;
>>> +    }
>>> +
>>> +    v = opaque;
>>> +    v->dev = dev;
>>> +    dev->opaque =  opaque ;
>>> +    v->listener = vhost_vdpa_memory_listener;
>>> +    v->msg_type = VHOST_IOTLB_MSG_V2;
>>> +
>>> +    vhost_vdpa_get_iova_range(v);
>>> +
>>> +    if (vhost_vdpa_one_time_request(dev)) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>> +                               VIRTIO_CONFIG_S_DRIVER);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    const VhostOps vdpa_ops = {
>>>            .backend_type = VHOST_BACKEND_TYPE_VDPA,
>>>            .vhost_backend_init = vhost_vdpa_init,


