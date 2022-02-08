Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CE4AD53D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:56:35 +0100 (CET)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNEg-0005jC-Go
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHMAh-0006b7-Dj
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHMAd-0006C7-0C
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:48:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644310097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLt73gH0j+J0bmE9qEJG+tuGXBlIAzTPan6D+JUTiMg=;
 b=CELzs47xz7kvwHlyEI1lgn8Brt1Iv+zRzEf6YCi7cGSMz24S5dYXFSs9PAqggGv7DDwfhT
 knuMwDCIkZCLeu27fWq/81LWrbO5Vt3qPYN4tOuDGIVfXMAvRNUyWkJBoV6LIeznQ35EWI
 dh3TJqjCkNKBR5XNnPAe6i8IeoFW/xI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-jkx8bDKqMIO8ZmnzmnKiMA-1; Tue, 08 Feb 2022 03:48:14 -0500
X-MC-Unique: jkx8bDKqMIO8ZmnzmnKiMA-1
Received: by mail-pl1-f200.google.com with SMTP id
 y3-20020a1709029b8300b0014c8bcb70a1so7076316plp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LLt73gH0j+J0bmE9qEJG+tuGXBlIAzTPan6D+JUTiMg=;
 b=A/TkPDDkVP+tpxb7jyNPwtNgeoue+FbaoTG8/9FHePqsGJ5ZcPZqoCHzJRgnybnFAH
 4yr3qmXVLtrKguisuH38wutP6vUPR54P4rQ4wiPN0xi+IDH7gYxXv+L97tWBriQTxD24
 4umzYkeYXZm8uAkWeiGL18KVqeph3DErHLsCIr0v/hyvh2tpzAXblD8JH1iW95tlbfhc
 4v/H6gtjj1ce4NA+ShuNGuVcqR/uoB56tFBDX6nKRwrW0AUHiBVQx93r9h2iIDCh7vvF
 A5wlCeEpg4trB550SKgXR7jBoasd16mR2L56SkbXoxnbIQFJ93iDxpbtGBHLY0TKihsp
 T5cw==
X-Gm-Message-State: AOAM530+7ou9oU0fdQd3PjiYI6E4flC/nkB5sDJ/SRFRr39k8nMmtQSm
 xWomtw8RV8xvoZsic5ugo5APg3MB+QBQNDIx/Fbb6IFkciQB7AxYm0AzIQU/wzX8YsoaWMzpD2m
 pNxwQfhFyO4kYh9o=
X-Received: by 2002:a63:f006:: with SMTP id k6mr2735973pgh.173.1644310092915; 
 Tue, 08 Feb 2022 00:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydSy49qfAat3dxJ3ZZMPwR8zeF8OvmFndOyeIxRgM8PMjea66NwPqYo4/Kf/Wuh8rVZe18Ig==
X-Received: by 2002:a63:f006:: with SMTP id k6mr2735935pgh.173.1644310092530; 
 Tue, 08 Feb 2022 00:48:12 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id om18sm2061145pjb.39.2022.02.08.00.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:48:12 -0800 (PST)
Message-ID: <2c9e8791-9e0b-0e84-00c2-cb7e693194f1@redhat.com>
Date: Tue, 8 Feb 2022 16:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 04/31] vdpa: Add vhost_svq_set_svq_kick_fd
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-5-eperezma@redhat.com>
 <e10a7631-f1f9-5597-dd74-0f5301a68e27@redhat.com>
 <CAJaqyWc7fbgN-W7y3=iFqHsJzj+1Mg0cuwSu+my=62nu9vGOqA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWc7fbgN-W7y3=iFqHsJzj+1Mg0cuwSu+my=62nu9vGOqA@mail.gmail.com>
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


在 2022/1/31 下午6:18, Eugenio Perez Martin 写道:
> On Fri, Jan 28, 2022 at 7:29 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> This function allows the vhost-vdpa backend to override kick_fd.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |  1 +
>>>    hw/virtio/vhost-shadow-virtqueue.c | 45 ++++++++++++++++++++++++++++++
>>>    2 files changed, 46 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index 400effd9f2..a56ecfc09d 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -15,6 +15,7 @@
>>>
>>>    typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>
>>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>>>    const EventNotifier *vhost_svq_get_dev_kick_notifier(
>>>                                                  const VhostShadowVirtqueue *svq);
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index bd87110073..21534bc94d 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -11,6 +11,7 @@
>>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>
>>>    #include "qemu/error-report.h"
>>> +#include "qemu/main-loop.h"
>>>
>>>    /* Shadow virtqueue to relay notifications */
>>>    typedef struct VhostShadowVirtqueue {
>>> @@ -18,8 +19,20 @@ typedef struct VhostShadowVirtqueue {
>>>        EventNotifier hdev_kick;
>>>        /* Shadow call notifier, sent to vhost */
>>>        EventNotifier hdev_call;
>>> +
>>> +    /*
>>> +     * Borrowed virtqueue's guest to host notifier.
>>> +     * To borrow it in this event notifier allows to register on the event
>>> +     * loop and access the associated shadow virtqueue easily. If we use the
>>> +     * VirtQueue, we don't have an easy way to retrieve it.
>>> +     *
>>> +     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
>>> +     */
>>> +    EventNotifier svq_kick;
>>>    } VhostShadowVirtqueue;
>>>
>>> +#define INVALID_SVQ_KICK_FD -1
>>> +
>>>    /**
>>>     * The notifier that SVQ will use to notify the device.
>>>     */
>>> @@ -29,6 +42,35 @@ const EventNotifier *vhost_svq_get_dev_kick_notifier(
>>>        return &svq->hdev_kick;
>>>    }
>>>
>>> +/**
>>> + * Set a new file descriptor for the guest to kick SVQ and notify for avail
>>> + *
>>> + * @svq          The svq
>>> + * @svq_kick_fd  The new svq kick fd
>>> + */
>>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>>> +{
>>> +    EventNotifier tmp;
>>> +    bool check_old = INVALID_SVQ_KICK_FD !=
>>> +                     event_notifier_get_fd(&svq->svq_kick);
>>> +
>>> +    if (check_old) {
>>> +        event_notifier_set_handler(&svq->svq_kick, NULL);
>>> +        event_notifier_init_fd(&tmp, event_notifier_get_fd(&svq->svq_kick));
>>> +    }
>>
>> It looks to me we don't do similar things in vhost-net. Any reason for
>> caring about the old svq_kick?
>>
> Do you mean to check for old kick_fd in case we miss notifications,
> and explicitly omit the INVALID_SVQ_KICK_FD?


Yes.


>
> If you mean qemu's vhost-net, I guess it's because the device's kick
> fd is never changed in all the vhost device lifecycle, it's only set
> at the beginning. Previous RFC also depended on that, but you
> suggested better vhost and SVQ in v4 feedback if I understood
> correctly [1]. Or am I missing something?


No, I forgot that. But in this case we should have a better dealing with 
the the conversion from valid fd to -1 by disabling the handler.


>
> Qemu's vhost-net does not need to use this because it is not polling
> it. For kernel's vhost, I guess the closest is the use of pollstop and
> pollstart at vhost_vring_ioctl.
>
> In my opinion, I think that SVQ code size can benefit from now
> allowing to override kick_fd from the start of the operation. Not from
> initialization, but start. But I can see the benefits of having the
> change into account from this moment so it's more resilient to the
> future.
>
>>> +
>>> +    /*
>>> +     * event_notifier_set_handler already checks for guest's notifications if
>>> +     * they arrive to the new file descriptor in the switch, so there is no
>>> +     * need to explicitely check for them.
>>> +     */
>>> +    event_notifier_init_fd(&svq->svq_kick, svq_kick_fd);
>>> +
>>> +    if (!check_old || event_notifier_test_and_clear(&tmp)) {
>>> +        event_notifier_set(&svq->hdev_kick);
>>
>> Any reason we need to kick the device directly here?
>>
> At this point of the series only notifications are forwarded, not
> buffers. If kick_fd is set, we need to check the old one, the same way
> as vhost checks the masked notifier in case of change.


I meant we need to kick the svq instead of vhost-vdpa in this case?

Thanks


>
> Thanks!
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg03152.html
> , from "I'd suggest to not depend on this since it:"
>
>
>> Thanks
>>
>>
>>> +    }
>>> +}
>>> +
>>>    /**
>>>     * Creates vhost shadow virtqueue, and instruct vhost device to use the shadow
>>>     * methods and file descriptors.
>>> @@ -52,6 +94,9 @@ VhostShadowVirtqueue *vhost_svq_new(void)
>>>            goto err_init_hdev_call;
>>>        }
>>>
>>> +    /* Placeholder descriptor, it should be deleted at set_kick_fd */
>>> +    event_notifier_init_fd(&svq->svq_kick, INVALID_SVQ_KICK_FD);
>>> +
>>>        return g_steal_pointer(&svq);
>>>
>>>    err_init_hdev_call:


