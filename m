Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4344C4CB786
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 08:14:22 +0100 (CET)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPffI-00045f-So
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 02:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPfdm-0002k3-PL
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPfdj-0003JQ-CZ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646291561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u03toGc1Cuj4ki0WWn7NaYZO/CaX2s4sPSYAy/b0ovo=;
 b=hS8H/YM27K/9bpwqd3/1tA+C4LjW9SS7Fo+QE9+3flMg3zdgcltVYvr+62IyYphf9L5+A8
 VJssvtjAa3a1Kl/FdCI/Jt5oozIcB7t0u/7pPS4A92HX/B+eT5mhRS3w6XcY1z7Nw+rTSr
 wpZxvjg1GmTspDAYREaTAMs4d7M7Xpg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-D03j6IfmOYaOr_HwS_cwGA-1; Thu, 03 Mar 2022 02:12:41 -0500
X-MC-Unique: D03j6IfmOYaOr_HwS_cwGA-1
Received: by mail-pg1-f200.google.com with SMTP id
 t18-20020a63dd12000000b00342725203b5so2342617pgg.16
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 23:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u03toGc1Cuj4ki0WWn7NaYZO/CaX2s4sPSYAy/b0ovo=;
 b=DRnRP+ojWTixVhW+T4Y/OfzZRXPxEgNndJVjElXATzhvvKpVXQY0Z+p0+0ISyJ3t9m
 cMo0+DqymsjskyP2d95ymPEK/nwAra6jBHQ2YBjR7MsYEY0wXKwrNdEr08IZ446TE93/
 aEBaoifooEC1hEuDsRG2IYhYX+nXE7Va1Ou50ZwEA/2r7KSQ3845a1JuiccFBNu7j12O
 li07z/SJud9slEi/bJ8+lp8GyQXKd9NW+4x3lCkUsJkDzaRo3VUA/70Inq6cIpF9LufA
 GKL0LAej9/CUvXgu+/4yiKXU+QpQxDiO3AIJiBZdhGzg+MBOkelgvXdiKwPpqt6Z558r
 yfbw==
X-Gm-Message-State: AOAM530bVBXG7/bDWuGkpHRb0UV4Kf7w8p3MqODVQq0EET8YUtFjI+OY
 tqiqRwSfD9PKdYNXRlPZAxvePo9Ds28tr07/vRmk4OUszmREOK5F3UZnNTpDi0hVLUTd17Rn6VM
 WcBFqvHGAY9XdgyU=
X-Received: by 2002:a63:2786:0:b0:365:8a2d:327b with SMTP id
 n128-20020a632786000000b003658a2d327bmr29058608pgn.16.1646291559837; 
 Wed, 02 Mar 2022 23:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziV9kMjCvcRqx/tjtWnUEYDiNfGNwbTON8Q2L9Iu6io3kzCC6iC+C77IS2KOg7m8meMTkD/Q==
X-Received: by 2002:a63:2786:0:b0:365:8a2d:327b with SMTP id
 n128-20020a632786000000b003658a2d327bmr29058572pgn.16.1646291559514; 
 Wed, 02 Mar 2022 23:12:39 -0800 (PST)
Received: from [10.72.13.250] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm1413250pfc.111.2022.03.02.23.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:12:38 -0800 (PST)
Message-ID: <1da7c2b8-ba6e-e9aa-4d55-b1345bd65ba4@redhat.com>
Date: Thu, 3 Mar 2022 15:12:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 02/14] vhost: Add Shadow VirtQueue kick forwarding
 capabilities
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-3-eperezma@redhat.com>
 <40c5bb81-b33a-9a4a-8ce0-20289b13b907@redhat.com>
 <CAJaqyWezcrc=iPLe=Y7+g9oBYfUY9pK8OM4=ZUeRgXqr9ZUWkg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWezcrc=iPLe=Y7+g9oBYfUY9pK8OM4=ZUeRgXqr9ZUWkg@mail.gmail.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
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


在 2022/3/2 上午2:49, Eugenio Perez Martin 写道:
> On Mon, Feb 28, 2022 at 3:57 AM Jason Wang<jasowang@redhat.com>  wrote:
>> 在 2022/2/27 下午9:40, Eugenio Pérez 写道:
>>> At this mode no buffer forwarding will be performed in SVQ mode: Qemu
>>> will just forward the guest's kicks to the device.
>>>
>>> Host memory notifiers regions are left out for simplicity, and they will
>>> not be addressed in this series.
>>>
>>> Signed-off-by: Eugenio Pérez<eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |  14 +++
>>>    include/hw/virtio/vhost-vdpa.h     |   4 +
>>>    hw/virtio/vhost-shadow-virtqueue.c |  52 +++++++++++
>>>    hw/virtio/vhost-vdpa.c             | 145 ++++++++++++++++++++++++++++-
>>>    4 files changed, 213 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index f1519e3c7b..1cbc87d5d8 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -18,8 +18,22 @@ typedef struct VhostShadowVirtqueue {
>>>        EventNotifier hdev_kick;
>>>        /* Shadow call notifier, sent to vhost */
>>>        EventNotifier hdev_call;
>>> +
>>> +    /*
>>> +     * Borrowed virtqueue's guest to host notifier. To borrow it in this event
>>> +     * notifier allows to recover the VhostShadowVirtqueue from the event loop
>>> +     * easily. If we use the VirtQueue's one, we don't have an easy way to
>>> +     * retrieve VhostShadowVirtqueue.
>>> +     *
>>> +     * So shadow virtqueue must not clean it, or we would lose VirtQueue one.
>>> +     */
>>> +    EventNotifier svq_kick;
>>>    } VhostShadowVirtqueue;
>>>
>>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>>> +
>>> +void vhost_svq_stop(VhostShadowVirtqueue *svq);
>>> +
>>>    VhostShadowVirtqueue *vhost_svq_new(void);
>>>
>>>    void vhost_svq_free(gpointer vq);
>>> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>>> index 3ce79a646d..009a9f3b6b 100644
>>> --- a/include/hw/virtio/vhost-vdpa.h
>>> +++ b/include/hw/virtio/vhost-vdpa.h
>>> @@ -12,6 +12,8 @@
>>>    #ifndef HW_VIRTIO_VHOST_VDPA_H
>>>    #define HW_VIRTIO_VHOST_VDPA_H
>>>
>>> +#include <gmodule.h>
>>> +
>>>    #include "hw/virtio/virtio.h"
>>>    #include "standard-headers/linux/vhost_types.h"
>>>
>>> @@ -27,6 +29,8 @@ typedef struct vhost_vdpa {
>>>        bool iotlb_batch_begin_sent;
>>>        MemoryListener listener;
>>>        struct vhost_vdpa_iova_range iova_range;
>>> +    bool shadow_vqs_enabled;
>>> +    GPtrArray *shadow_vqs;
>>>        struct vhost_dev *dev;
>>>        VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>>>    } VhostVDPA;
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 019cf1950f..a5d0659f86 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -11,6 +11,56 @@
>>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>
>>>    #include "qemu/error-report.h"
>>> +#include "qemu/main-loop.h"
>>> +#include "linux-headers/linux/vhost.h"
>>> +
>>> +/** Forward guest notifications */
>>> +static void vhost_handle_guest_kick(EventNotifier *n)
>>> +{
>>> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>>> +                                             svq_kick);
>>> +    event_notifier_test_and_clear(n);
>>> +    event_notifier_set(&svq->hdev_kick);
>>> +}
>>> +
>>> +/**
>>> + * Set a new file descriptor for the guest to kick the SVQ and notify for avail
>>> + *
>>> + * @svq          The svq
>>> + * @svq_kick_fd  The svq kick fd
>>> + *
>>> + * Note that the SVQ will never close the old file descriptor.
>>> + */
>>> +void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>>> +{
>>> +    EventNotifier *svq_kick = &svq->svq_kick;
>>> +    bool poll_stop = VHOST_FILE_UNBIND != event_notifier_get_fd(svq_kick);
>> I wonder if this is robust. E.g is there any chance that may end up with
>> both poll_stop and poll_start are false?
>>
> I cannot make that happen in qemu, but the function supports that case
> well: It will do nothing. It's more or less the same code as used in
> the vhost kernel, and is the expected behaviour if you send two
> VHOST_FILE_UNBIND one right after another to me.


I would think it's just stop twice.


>
>> If not, can we simple detect poll_stop as below and treat !poll_start
>> and poll_stop?
>>
> I'm not sure what does it add. Is there an unexpected consequence with
> the current do-nothing behavior I've missed?


I'm not sure, but it feels odd if poll_start is not the reverse value of 
poll_stop.

Thanks



