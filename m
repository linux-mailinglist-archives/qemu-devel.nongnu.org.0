Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2275A4BD6C8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 08:22:00 +0100 (CET)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM31D-0001fJ-71
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 02:21:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM2uo-000695-R8
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:15:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM2um-0007tG-KP
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645427719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrN8XsW/BOgueqLR4Y6t/TA6fNns23B14ddLmdsBcG0=;
 b=RsHoMm9Z06XHCfOaugtYdKqR8Uc4FEoTzdScJh0YyrQMLAPOXX7g38bcjq/3XnxKM9+NUq
 D84YLvEO43yDbt6Ec2NQrRzyDWnpC+SuaE+BgYfMK24kS+8nJ8o2maY3PH0ItjcyO2ysS5
 0tvwCzQBgsmpX6UadLWqjBuQrL9oSWo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-WrJjN9pPMIaLhsHap-wBOw-1; Mon, 21 Feb 2022 02:15:17 -0500
X-MC-Unique: WrJjN9pPMIaLhsHap-wBOw-1
Received: by mail-pf1-f197.google.com with SMTP id
 y28-20020aa793dc000000b004e160274e3eso4509037pff.18
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 23:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jrN8XsW/BOgueqLR4Y6t/TA6fNns23B14ddLmdsBcG0=;
 b=TPb55TzZIJRyF95EY34HQv+azKROyl+zd68nXqZyoA+pbGt43lBq9bPOMBWXO1OXyi
 xukXEGBh7bF0lOHDj5qmejxPxJYBJ6Wg3gh5pQNvLJEsEYkSvghEJjhnSLWYs10UpPgV
 CGgbwkNYLsOpl943bpC8U4nCYkIzo8+mmk781qQUdA3y1OCN4Ngsfx3vjSqhiTAG/7HZ
 WJ0wIL7meIth5vqwlW3ZYzhuTpGoP3fUearkCz1Nqx7qEUKs1yAL2QGAFLSP8tL/XOHt
 JoXE0JLpcZeebZZZN4LZRtQuBa+EwqvfqLxhhrrR7eskbnFC1ujX2j3S0tX0IwzU9+Ng
 6jZg==
X-Gm-Message-State: AOAM531JN20D1bCC3JrSGVEVH+42KE41UWt4w7C7zcHIzK/4U2qdgNQc
 Jm4WkQe7GyC0DXRwKAJ17zAGLuOWLweto72b2pgxJbJ475594TqymkX6YafDEwbkQdLt1fZ5Ef2
 4IyWxwI5RTK3CrV4=
X-Received: by 2002:a17:902:d642:b0:14c:e9a7:d542 with SMTP id
 y2-20020a170902d64200b0014ce9a7d542mr17838073plh.38.1645427716057; 
 Sun, 20 Feb 2022 23:15:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXEdYXXygo2Bn/aG8AOxUtXK0uqh288rJiPaDSm5yyd3B2kkBgqHyxfMkmGU8ykvmhchguIg==
X-Received: by 2002:a17:902:d642:b0:14c:e9a7:d542 with SMTP id
 y2-20020a170902d64200b0014ce9a7d542mr17838032plh.38.1645427715684; 
 Sun, 20 Feb 2022 23:15:15 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i22sm959549pjz.3.2022.02.20.23.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 23:15:15 -0800 (PST)
Message-ID: <02f29b62-6656-ba2f-1475-251b16e0e978@redhat.com>
Date: Mon, 21 Feb 2022 15:15:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
 <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
 <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
 <3d0dfaaa-a67c-6f48-fd03-45d2661ba92a@redhat.com>
 <CAJaqyWfEEg2PKgxBAFwYhF9LD1oDtwVYXSjHHnCbstT3dvL2GA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfEEg2PKgxBAFwYhF9LD1oDtwVYXSjHHnCbstT3dvL2GA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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


在 2022/2/18 上午1:13, Eugenio Perez Martin 写道:
> On Tue, Feb 8, 2022 at 4:58 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/2/1 上午2:58, Eugenio Perez Martin 写道:
>>> On Sun, Jan 30, 2022 at 5:03 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>>> First half of the buffers forwarding part, preparing vhost-vdpa
>>>>> callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
>>>>> this is effectively dead code at the moment, but it helps to reduce
>>>>> patch size.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>     hw/virtio/vhost-shadow-virtqueue.h |   2 +-
>>>>>     hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
>>>>>     hw/virtio/vhost-vdpa.c             | 133 ++++++++++++++++++++++++++---
>>>>>     3 files changed, 143 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>>>> index 035207a469..39aef5ffdf 100644
>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>>>> @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>>>>>
>>>>>     void vhost_svq_stop(VhostShadowVirtqueue *svq);
>>>>>
>>>>> -VhostShadowVirtqueue *vhost_svq_new(void);
>>>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
>>>>>
>>>>>     void vhost_svq_free(VhostShadowVirtqueue *vq);
>>>>>
>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>>> index f129ec8395..7c168075d7 100644
>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>>> @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>>>     /**
>>>>>      * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>>>>>      * methods and file descriptors.
>>>>> + *
>>>>> + * @qsize Shadow VirtQueue size
>>>>> + *
>>>>> + * Returns the new virtqueue or NULL.
>>>>> + *
>>>>> + * In case of error, reason is reported through error_report.
>>>>>      */
>>>>> -VhostShadowVirtqueue *vhost_svq_new(void)
>>>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
>>>>>     {
>>>>> +    size_t desc_size = sizeof(vring_desc_t) * qsize;
>>>>> +    size_t device_size, driver_size;
>>>>>         g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>>>>>         int r;
>>>>>
>>>>> @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
>>>>>         /* Placeholder descriptor, it should be deleted at set_kick_fd */
>>>>>         event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
>>>>>
>>>>> +    svq->vring.num = qsize;
>>>> I wonder if this is the best. E.g some hardware can support up to 32K
>>>> queue size. So this will probably end up with:
>>>>
>>>> 1) SVQ use 32K queue size
>>>> 2) hardware queue uses 256
>>>>
>>> In that case SVQ vring queue size will be 32K and guest's vring can
>>> negotiate any number with SVQ equal or less than 32K,
>>
>> Sorry for being unclear what I meant is actually
>>
>> 1) SVQ uses 32K queue size
>>
>> 2) guest vq uses 256
>>
>> This looks like a burden that needs extra logic and may damage the
>> performance.
>>
> Still not getting this point.
>
> An available guest buffer, although contiguous in GPA/GVA, can expand
> in multiple buffers if it's not contiguous in qemu's VA (by the while
> loop in virtqueue_map_desc [1]). In that scenario it is better to have
> "plenty" of SVQ buffers.


Yes, but this case should be rare. So in this case we should deal with 
overrun on SVQ, that is

1) SVQ is full
2) guest VQ isn't

We need to

1) check the available buffer slots
2) disable guest kick and wait for the used buffers

But it looks to me the current code is not ready for dealing with this case?


>
> I'm ok if we decide to put an upper limit though, or if we decide not
> to handle this situation. But we would leave out valid virtio drivers.
> Maybe to set a fixed upper limit (1024?)? To add another parameter
> (x-svq-size-n=N)?
>
> If you mean we lose performance because memory gets more sparse I
> think the only possibility is to limit that way.


If guest is not using 32K, having a 32K for svq may gives extra stress 
on the cache since we will end up with a pretty large working set.


>
>> And this can lead other interesting situation:
>>
>> 1) SVQ uses 256
>>
>> 2) guest vq uses 1024
>>
>> Where a lot of more SVQ logic is needed.
>>
> If we agree that a guest descriptor can expand in multiple SVQ
> descriptors, this should be already handled by the previous logic too.
>
> But this should only happen in case that qemu is launched with a "bad"
> cmdline, isn't it?


This seems can happen when we use -device 
virtio-net-pci,tx_queue_size=1024 with a 256 size vp_vdpa device at least?


>
> If I run that example with vp_vdpa, L0 qemu will happily accept 1024
> as a queue size [2]. But if the vdpa device maximum queue size is
> effectively 256, this will result in an error: We're not exposing it
> to the guest at any moment but with qemu's cmdline.
>
>>> including 256.
>>> Is that what you mean?
>>
>> I mean, it looks to me the logic will be much more simplified if we just
>> allocate the shadow virtqueue with the size what guest can see (guest
>> vring).
>>
>> Then we don't need to think if the difference of the queue size can have
>> any side effects.
>>
> I think that we cannot avoid that extra logic unless we force GPA to
> be contiguous in IOVA. If we are sure the guest's buffers cannot be at
> more than one descriptor in SVQ, then yes, we can simplify things. If
> not, I think we are forced to carry all of it.


Yes, I agree, the code should be robust to handle any case.

Thanks


>
> But if we prove it I'm not opposed to simplifying things and making
> head at SVQ == head at guest.
>
> Thanks!
>
> [1] https://gitlab.com/qemu-project/qemu/-/blob/17e31340/hw/virtio/virtio.c#L1297
> [2] But that's not the whole story: I've been running limited in tx
> descriptors because of virtio_net_max_tx_queue_size, which predates
> vdpa. I'll send a patch to also un-limit it.
>
>>> If with hardware queues you mean guest's vring, not sure why it is
>>> "probably 256". I'd say that in that case with the virtio-net kernel
>>> driver the ring size will be the same as the device export, for
>>> example, isn't it?
>>>
>>> The implementation should support any combination of sizes, but the
>>> ring size exposed to the guest is never bigger than hardware one.
>>>
>>>> ? Or we SVQ can stick to 256 but this will this cause trouble if we want
>>>> to add event index support?
>>>>
>>> I think we should not have any problem with event idx. If you mean
>>> that the guest could mark more buffers available than SVQ vring's
>>> size, that should not happen because there must be less entries in the
>>> guest than SVQ.
>>>
>>> But if I understood you correctly, a similar situation could happen if
>>> a guest's contiguous buffer is scattered across many qemu's VA chunks.
>>> Even if that would happen, the situation should be ok too: SVQ knows
>>> the guest's avail idx and, if SVQ is full, it will continue forwarding
>>> avail buffers when the device uses more buffers.
>>>
>>> Does that make sense to you?
>>
>> Yes.
>>
>> Thanks
>>


