Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8634ACFD5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:40:02 +0100 (CET)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHHMH-0000zP-2A
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:40:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHHKh-00080Q-SD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:38:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHHKN-0003Ih-QI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644291482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBJDGjWqVOtiSrvehByB/6mHxa5s6JVt4CfgbH5eOCw=;
 b=bW5biYQqao7dZCKHwySIbC/pmbIDT+y2VnZdjwDVrzujSq/24QqGvaghBlsZDKFFshBEE6
 /K0hxEBGzR54X0N+ZULYqQzZM5BwblvgcxwcDB/FyxmAhcL/NMWarVIzcAdaviAdcOX1tR
 TPo3Z9QqtXVUBCcuR+osWM4Ix0lDk58=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-TcJp9UJ_NlOzyzOBq0__Vg-1; Mon, 07 Feb 2022 22:37:59 -0500
X-MC-Unique: TcJp9UJ_NlOzyzOBq0__Vg-1
Received: by mail-pj1-f70.google.com with SMTP id
 iy10-20020a17090b16ca00b001b8a7ed5b2cso674985pjb.7
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WBJDGjWqVOtiSrvehByB/6mHxa5s6JVt4CfgbH5eOCw=;
 b=B9R1oXzjwGG/0T+rZNYHxObn1uXPEHeYZohehL1Nb3ibQ8vpyLW4W8ICG8JPQGAp1N
 V+n1nVK47/Rj2JqpXHWCz0ASJyhpIEwNYqdYAGQz8D1/YYmnYoZKjyxfPCtjpH0mz3ap
 uI4OdWRYM7OLzICsdZzBOI58B56nd6zAKHhJ/q5lLW/T2biw5WG3H19PPCP6MJN2zw5v
 0G4PGws1Nhb8VZiTmnfzdiTFAcZ1vbFxv7g1+/A5yr4cB+chQaaYV2xthpcJ3oGrMY5w
 er2CRsbvj/A+e34CaPy5MtUGNi7qXubkiviE561lTahYA3tdto2Qv38imeZtSBepEPgS
 bdaw==
X-Gm-Message-State: AOAM533k0xQtX+3LsiZiYCjSE9yp5krMIGk1wAojMvxN4S4CXHmlwNBf
 sRtdjxA4CoKhC4Y6woPtkW76QuxFF1+Bn65kE8wkylh0qIiHcZi40ON0oSUxwcuNSSb8Aka8XrH
 fEeIDPCapNP57bVA=
X-Received: by 2002:a63:8648:: with SMTP id x69mr2012600pgd.25.1644291478521; 
 Mon, 07 Feb 2022 19:37:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt+5PbADUI11q2peCXupot8uYUWm5YMKSY/KIIntuRrfcbN/FhzVjVKAvRjgqVVgStAK0OYw==
X-Received: by 2002:a63:8648:: with SMTP id x69mr2012564pgd.25.1644291478117; 
 Mon, 07 Feb 2022 19:37:58 -0800 (PST)
Received: from [10.72.13.233] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f3sm13802408pfe.43.2022.02.07.19.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 19:37:57 -0800 (PST)
Message-ID: <74f2ed86-d936-4d0c-83cb-9e5d86425bc1@redhat.com>
Date: Tue, 8 Feb 2022 11:37:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 11/31] vhost: Add vhost_svq_valid_device_features to
 shadow vq
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-12-eperezma@redhat.com>
 <660257ba-6445-3fb2-1da4-3b141e382191@redhat.com>
 <CAJaqyWfaf0RG9AzW4ktH2L3wyfOGuSk=rNm-j7xRkpdfVvkY-g@mail.gmail.com>
 <CAJaqyWc6BqJBDcUE36AQ=bgWjJYkyMo1ZYxRwmc5ZgGj4T-pVg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWc6BqJBDcUE36AQ=bgWjJYkyMo1ZYxRwmc5ZgGj4T-pVg@mail.gmail.com>
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


在 2022/2/1 下午6:57, Eugenio Perez Martin 写道:
> On Mon, Jan 31, 2022 at 4:49 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
>> On Sat, Jan 29, 2022 at 9:11 AM Jason Wang <jasowang@redhat.com> wrote:
>>>
>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>> This allows SVQ to negotiate features with the device. For the device,
>>>> SVQ is a driver. While this function needs to bypass all non-transport
>>>> features, it needs to disable the features that SVQ does not support
>>>> when forwarding buffers. This includes packed vq layout, indirect
>>>> descriptors or event idx.
>>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>>    hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>>>>    hw/virtio/vhost-shadow-virtqueue.c | 44 ++++++++++++++++++++++++++++++
>>>>    hw/virtio/vhost-vdpa.c             | 21 ++++++++++++++
>>>>    3 files changed, 67 insertions(+)
>>>>
>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>>> index c9ffa11fce..d963867a04 100644
>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>>> @@ -15,6 +15,8 @@
>>>>
>>>>    typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>>
>>>> +bool vhost_svq_valid_device_features(uint64_t *features);
>>>> +
>>>>    void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>>>>    void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int call_fd);
>>>>    const EventNotifier *vhost_svq_get_dev_kick_notifier(
>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>> index 9619c8082c..51442b3dbf 100644
>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>> @@ -45,6 +45,50 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
>>>>        return &svq->hdev_kick;
>>>>    }
>>>>
>>>> +/**
>>>> + * Validate the transport device features that SVQ can use with the device
>>>> + *
>>>> + * @dev_features  The device features. If success, the acknowledged features.
>>>> + *
>>>> + * Returns true if SVQ can go with a subset of these, false otherwise.
>>>> + */
>>>> +bool vhost_svq_valid_device_features(uint64_t *dev_features)
>>>> +{
>>>> +    bool r = true;
>>>> +
>>>> +    for (uint64_t b = VIRTIO_TRANSPORT_F_START; b <= VIRTIO_TRANSPORT_F_END;
>>>> +         ++b) {
>>>> +        switch (b) {
>>>> +        case VIRTIO_F_NOTIFY_ON_EMPTY:
>>>> +        case VIRTIO_F_ANY_LAYOUT:
>>>> +            continue;
>>>> +
>>>> +        case VIRTIO_F_ACCESS_PLATFORM:
>>>> +            /* SVQ does not know how to translate addresses */
>>>
>>> I may miss something but any reason that we need to disable
>>> ACCESS_PLATFORM? I'd expect the vring helper we used for shadow
>>> virtqueue can deal with vIOMMU perfectly.
>>>
>> This function is validating SVQ <-> Device communications features,
>> that may or may not be the same as guest <-> SVQ. These feature flags
>> are valid for guest <-> SVQ communication, same as with indirect
>> descriptors one.
>>
>> Having said that, there is a point in the series where
>> VIRTIO_F_ACCESS_PLATFORM is actually mandatory, so I think we could
>> use the latter addition of x-svq cmdline parameter and delay the
>> feature validations where it makes more sense.
>>
>>>> +            if (*dev_features & BIT_ULL(b)) {
>>>> +                clear_bit(b, dev_features);
>>>> +                r = false;
>>>> +            }
>>>> +            break;
>>>> +
>>>> +        case VIRTIO_F_VERSION_1:
>>>
>>> I had the same question here.
>>>
>> For VERSION_1 it's easier to assume that guest is little endian at
>> some points, but we could try harder to support both endianness if
>> needed.
>>
> Re-thinking the SVQ feature isolation stuff for this first iteration
> based on your comments.
>
> Maybe it's easier to simply fail if the device does not *match* the
> expected feature set, and add all of the "feature isolation" later.
> While a lot of guest <-> SVQ communication details are already solved
> for free with qemu's VirtQueue (indirect, packed, ...), we may
> simplify this series in particular and add the support for it later.
>
> For example, at this moment would be valid for the device to export
> indirect descriptors feature flag, and SVQ simply forward that feature
> flag offering to the guest. So the guest <-> SVQ communication could
> have indirect descriptors (qemu's VirtQueue code handles it for free),
> but SVQ would not acknowledge it for the device. As a side note, to
> negotiate it would have been harmless actually, but it's not the case
> of packed vq.
>
> So maybe for the v2 we can simply force the device to just export the
> strictly needed features and nothing else with qemu cmdline, and then
> enable the feature negotiation isolation for each side of SVQ?


Yes, that's exactly my point.

Thanks


>
> Thanks!
>
>
>> Thanks!
>>
>>> Thanks
>>>
>>>
>>>> +            /* SVQ trust that guest vring is little endian */
>>>> +            if (!(*dev_features & BIT_ULL(b))) {
>>>> +                set_bit(b, dev_features);
>>>> +                r = false;
>>>> +            }
>>>> +            continue;
>>>> +
>>>> +        default:
>>>> +            if (*dev_features & BIT_ULL(b)) {
>>>> +                clear_bit(b, dev_features);
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return r;
>>>> +}
>>>> +
>>>>    /* Forward guest notifications */
>>>>    static void vhost_handle_guest_kick(EventNotifier *n)
>>>>    {
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index bdb45c8808..9d801cf907 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -855,10 +855,31 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vdpa *v,
>>>>        size_t n_svqs = v->shadow_vqs_enabled ? hdev->nvqs : 0;
>>>>        g_autoptr(GPtrArray) shadow_vqs = g_ptr_array_new_full(n_svqs,
>>>>                                                               vhost_psvq_free);
>>>> +    uint64_t dev_features;
>>>> +    uint64_t svq_features;
>>>> +    int r;
>>>> +    bool ok;
>>>> +
>>>>        if (!v->shadow_vqs_enabled) {
>>>>            goto out;
>>>>        }
>>>>
>>>> +    r = vhost_vdpa_get_features(hdev, &dev_features);
>>>> +    if (r != 0) {
>>>> +        error_setg(errp, "Can't get vdpa device features, got (%d)", r);
>>>> +        return r;
>>>> +    }
>>>> +
>>>> +    svq_features = dev_features;
>>>> +    ok = vhost_svq_valid_device_features(&svq_features);
>>>> +    if (unlikely(!ok)) {
>>>> +        error_setg(errp,
>>>> +            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok: 0x%"PRIx64,
>>>> +            hdev->features, svq_features);
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    shadow_vqs = g_ptr_array_new_full(hdev->nvqs, vhost_psvq_free);
>>>>        for (unsigned n = 0; n < hdev->nvqs; ++n) {
>>>>            VhostShadowVirtqueue *svq = vhost_svq_new();
>>>>


