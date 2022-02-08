Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25854AD000
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:59:28 +0100 (CET)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHHf5-00088K-LJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHHe0-0007RP-4n
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:58:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHHdv-0006FJ-J5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644292690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z71Y7mAci7WudsLVnnxS6ExjSgl5fpuaW6hKF3XF864=;
 b=hALPiOKTbiQCrgulZ2Axh3I52eIf2oTMvEFI9p4lTIWPom6raLchJ2rQv/KvupktpFol3i
 TGhGbHy+8W3G1olsmF3Bq1G7D8Xv6gX5Hvx22C+dgTXC+rqEryUEIaxoUKYtns6MIpj32X
 htlxlwBLvfelIOgYDRbao1vSJxoqK2I=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-2kNITH2IP26XzEJdBIcz4g-1; Mon, 07 Feb 2022 22:58:09 -0500
X-MC-Unique: 2kNITH2IP26XzEJdBIcz4g-1
Received: by mail-pl1-f198.google.com with SMTP id
 q4-20020a170902f78400b0014d57696618so2844297pln.20
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z71Y7mAci7WudsLVnnxS6ExjSgl5fpuaW6hKF3XF864=;
 b=heoUnTuudVQeP2j+fvPdcVqw/jvyqfah5JiVVyg93sPx7aiMwcW0b8WqdhzJ5Ps1py
 6jza5dxfVj+3Ge6316jQs6ccRnIPVKQDe79vC2tbtzAvyhilNDtnqI7rMg6o6oEhr6HQ
 y/yC8Sj+LGiQWGPQ0sALpRYfPnZ3HxpN9cMkUhl8Q02FSGpR8FLz3NbN36EmHwucVfNh
 ktKjevrJkcamPYo48MiNgwEzi80AiA0xcbEhcQ/LKCWZtPLCxK1rAZXlscZbn9JUW1lj
 VhY0RQuVxF6Cp9ZLmgZUd3RYki4Z0YECYABy3+EwB9n39s5rswwt0W/ig0NuDKJ3xzbN
 kA9A==
X-Gm-Message-State: AOAM532iFKt2g2TAxzu4L92tv8yncPr6mlxeGsNdlXkpbuNsIhrDPaYH
 7RuL3ohFv9UQTb7wvlEsktcMG+r4XdJwN3XbNgo0Tioc2kwdqLeKAfWn4KYN39x/1KtxwfZvDRq
 UpVq4BP8EvMipMdE=
X-Received: by 2002:a63:2c16:: with SMTP id s22mr2009676pgs.297.1644292688518; 
 Mon, 07 Feb 2022 19:58:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9JwQP0iEEay3cftKFLYNY8OLGJatgqmLrrsOZtTmMke6ErdSkHREjsziUdiSnxxmUEIILNw==
X-Received: by 2002:a63:2c16:: with SMTP id s22mr2009642pgs.297.1644292688200; 
 Mon, 07 Feb 2022 19:58:08 -0800 (PST)
Received: from [10.72.13.233] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h5sm14053164pfi.111.2022.02.07.19.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 19:58:07 -0800 (PST)
Message-ID: <3d0dfaaa-a67c-6f48-fd03-45d2661ba92a@redhat.com>
Date: Tue, 8 Feb 2022 11:57:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 17/31] vdpa: adapt vhost_ops callbacks to svq
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-18-eperezma@redhat.com>
 <82b8c3bf-1b11-86c7-4fad-294f5ccf1278@redhat.com>
 <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdRKZp6CwnE+HAr0JALhSRh-trJbZ01kddnLTuRX_tMKQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/2/1 上午2:58, Eugenio Perez Martin 写道:
> On Sun, Jan 30, 2022 at 5:03 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> First half of the buffers forwarding part, preparing vhost-vdpa
>>> callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
>>> this is effectively dead code at the moment, but it helps to reduce
>>> patch size.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |   2 +-
>>>    hw/virtio/vhost-shadow-virtqueue.c |  21 ++++-
>>>    hw/virtio/vhost-vdpa.c             | 133 ++++++++++++++++++++++++++---
>>>    3 files changed, 143 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index 035207a469..39aef5ffdf 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -35,7 +35,7 @@ size_t vhost_svq_device_area_size(const VhostShadowVirtqueue *svq);
>>>
>>>    void vhost_svq_stop(VhostShadowVirtqueue *svq);
>>>
>>> -VhostShadowVirtqueue *vhost_svq_new(void);
>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize);
>>>
>>>    void vhost_svq_free(VhostShadowVirtqueue *vq);
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index f129ec8395..7c168075d7 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -277,9 +277,17 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>    /**
>>>     * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>>>     * methods and file descriptors.
>>> + *
>>> + * @qsize Shadow VirtQueue size
>>> + *
>>> + * Returns the new virtqueue or NULL.
>>> + *
>>> + * In case of error, reason is reported through error_report.
>>>     */
>>> -VhostShadowVirtqueue *vhost_svq_new(void)
>>> +VhostShadowVirtqueue *vhost_svq_new(uint16_t qsize)
>>>    {
>>> +    size_t desc_size = sizeof(vring_desc_t) * qsize;
>>> +    size_t device_size, driver_size;
>>>        g_autofree VhostShadowVirtqueue *svq = g_new0(VhostShadowVirtqueue, 1);
>>>        int r;
>>>
>>> @@ -300,6 +308,15 @@ VhostShadowVirtqueue *vhost_svq_new(void)
>>>        /* Placeholder descriptor, it should be deleted at set_kick_fd */
>>>        event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
>>>
>>> +    svq->vring.num = qsize;
>>
>> I wonder if this is the best. E.g some hardware can support up to 32K
>> queue size. So this will probably end up with:
>>
>> 1) SVQ use 32K queue size
>> 2) hardware queue uses 256
>>
> In that case SVQ vring queue size will be 32K and guest's vring can
> negotiate any number with SVQ equal or less than 32K,


Sorry for being unclear what I meant is actually

1) SVQ uses 32K queue size

2) guest vq uses 256

This looks like a burden that needs extra logic and may damage the 
performance.

And this can lead other interesting situation:

1) SVQ uses 256

2) guest vq uses 1024

Where a lot of more SVQ logic is needed.


> including 256.
> Is that what you mean?


I mean, it looks to me the logic will be much more simplified if we just 
allocate the shadow virtqueue with the size what guest can see (guest 
vring).

Then we don't need to think if the difference of the queue size can have 
any side effects.


>
> If with hardware queues you mean guest's vring, not sure why it is
> "probably 256". I'd say that in that case with the virtio-net kernel
> driver the ring size will be the same as the device export, for
> example, isn't it?
>
> The implementation should support any combination of sizes, but the
> ring size exposed to the guest is never bigger than hardware one.
>
>> ? Or we SVQ can stick to 256 but this will this cause trouble if we want
>> to add event index support?
>>
> I think we should not have any problem with event idx. If you mean
> that the guest could mark more buffers available than SVQ vring's
> size, that should not happen because there must be less entries in the
> guest than SVQ.
>
> But if I understood you correctly, a similar situation could happen if
> a guest's contiguous buffer is scattered across many qemu's VA chunks.
> Even if that would happen, the situation should be ok too: SVQ knows
> the guest's avail idx and, if SVQ is full, it will continue forwarding
> avail buffers when the device uses more buffers.
>
> Does that make sense to you?


Yes.

Thanks


