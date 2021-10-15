Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9EC42E82B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:58:15 +0200 (CEST)
Received: from localhost ([::1]:52816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbFIM-0002zN-Am
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbF3K-0001Qz-P5
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mbF3H-0001DQ-Kq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634272958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ev6Z0qzvimi353HfswrUXLN6SxjrSKewjNzr2xVV6DA=;
 b=LnkVOHpfo3HkAfZXEFohAA0YpzOSyyfFJ4gghEomWFUagEpQzn7VrXJKhILx2jZk0NJW7V
 qkqNrm23AScSl4xusqTa0WeusFXLpPDOXYgD7ZuyMY06yOVsgIBNPsa7RUK6eKqdq4lzn0
 vYqJI/x1wJleQmX8hqJ7LZ2pfAnuGyo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-Q3jcp8hmNb2nsCytj-L79Q-1; Fri, 15 Oct 2021 00:42:34 -0400
X-MC-Unique: Q3jcp8hmNb2nsCytj-L79Q-1
Received: by mail-pl1-f197.google.com with SMTP id
 p2-20020a170902bd0200b0013da15f4ab0so2782648pls.7
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ev6Z0qzvimi353HfswrUXLN6SxjrSKewjNzr2xVV6DA=;
 b=GFr/s7pxubKK2ZEd+SkVlt+Odw+eIAO3eNxX41b0HJsbRmVRcEopcTh+i+7vbEwieU
 ISbuhAUzFE1aRNC2p1iaAO62/HG8bQQgQlGEavLzvZv3w73gUqYcmD1mSTYJS2RxHJ8f
 64OESM65O0/2AmeyuYCPcSBYsrA7e1uPZyBMOyF4KfE9rgITfHvLjL9sla7Esnr2Aij4
 HrSfbNWgzVmHuAwOiGBquq0js9qyUX4ViP9aUxeYPZdjNdYBsZSBlW44kme5Z+pjCWPD
 8jOmVub32i/EBghm57c1mnKwiR1H4ozmWAriLMs5FlesQKaBhuxjgZSZyJkEkjKrpW5K
 IArA==
X-Gm-Message-State: AOAM532kPD/KODb3wn/RI/pz4+/d80fTehQHgH1IPQ0/ZNff2iZ4xMFX
 oEIwocRSH4dAfLe/KmNGXIHsaoLgrR7eT9X1mZierNOa/4yjrdE2JaG8EXikDbU3J1zLEdOwobx
 5F+44xWytFQBFi/E=
X-Received: by 2002:a05:6a00:1906:b0:44c:b35d:71a8 with SMTP id
 y6-20020a056a00190600b0044cb35d71a8mr9198183pfi.51.1634272953577; 
 Thu, 14 Oct 2021 21:42:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRWx7Ag3grRRVbolD2IXIQe3qcDijMltS+Q82Xf3UA9zjb+piV5VfjvVtOGrX3EeO3Gorjbg==
X-Received: by 2002:a05:6a00:1906:b0:44c:b35d:71a8 with SMTP id
 y6-20020a056a00190600b0044cb35d71a8mr9198140pfi.51.1634272953172; 
 Thu, 14 Oct 2021 21:42:33 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s52sm3762347pfw.4.2021.10.14.21.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 21:42:32 -0700 (PDT)
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <ab9a7771-5f9b-6413-3e38-bd3dc7373256@redhat.com>
 <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <78843cbf-0096-816b-da74-5406fdcc3783@redhat.com>
Date: Fri, 15 Oct 2021 12:42:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfm734HrwTJK71hUQNYVkyDaR8OiqtGro_AX9i_pXfmBQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/15 上午12:39, Eugenio Perez Martin 写道:
> On Wed, Oct 13, 2021 at 5:47 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/10/1 下午3:05, Eugenio Pérez 写道:
>>> This will make qemu aware of the device used buffers, allowing it to
>>> write the guest memory with its contents if needed.
>>>
>>> Since the use of vhost_virtqueue_start can unmasks and discard call
>>> events, vhost_virtqueue_start should be modified in one of these ways:
>>> * Split in two: One of them uses all logic to start a queue with no
>>>     side effects for the guest, and another one tha actually assumes that
>>>     the guest has just started the device. Vdpa should use just the
>>>     former.
>>> * Actually store and check if the guest notifier is masked, and do it
>>>     conditionally.
>>> * Left as it is, and duplicate all the logic in vhost-vdpa.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.c | 19 +++++++++++++++
>>>    hw/virtio/vhost-vdpa.c             | 38 +++++++++++++++++++++++++++++-
>>>    2 files changed, 56 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 21dc99ab5d..3fe129cf63 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -53,6 +53,22 @@ static void vhost_handle_guest_kick(EventNotifier *n)
>>>        event_notifier_set(&svq->kick_notifier);
>>>    }
>>>
>>> +/* Forward vhost notifications */
>>> +static void vhost_svq_handle_call_no_test(EventNotifier *n)
>>> +{
>>> +    VhostShadowVirtqueue *svq = container_of(n, VhostShadowVirtqueue,
>>> +                                             call_notifier);
>>> +
>>> +    event_notifier_set(&svq->guest_call_notifier);
>>> +}
>>> +
>>> +static void vhost_svq_handle_call(EventNotifier *n)
>>> +{
>>> +    if (likely(event_notifier_test_and_clear(n))) {
>>> +        vhost_svq_handle_call_no_test(n);
>>> +    }
>>> +}
>>> +
>>>    /*
>>>     * Obtain the SVQ call notifier, where vhost device notifies SVQ that there
>>>     * exists pending used buffers.
>>> @@ -180,6 +196,8 @@ VhostShadowVirtqueue *vhost_svq_new(struct vhost_dev *dev, int idx)
>>>        }
>>>
>>>        svq->vq = virtio_get_queue(dev->vdev, vq_idx);
>>> +    event_notifier_set_handler(&svq->call_notifier,
>>> +                               vhost_svq_handle_call);
>>>        return g_steal_pointer(&svq);
>>>
>>>    err_init_call_notifier:
>>> @@ -195,6 +213,7 @@ err_init_kick_notifier:
>>>    void vhost_svq_free(VhostShadowVirtqueue *vq)
>>>    {
>>>        event_notifier_cleanup(&vq->kick_notifier);
>>> +    event_notifier_set_handler(&vq->call_notifier, NULL);
>>>        event_notifier_cleanup(&vq->call_notifier);
>>>        g_free(vq);
>>>    }
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index bc34de2439..6c5f4c98b8 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -712,13 +712,40 @@ static bool vhost_vdpa_svq_start_vq(struct vhost_dev *dev, unsigned idx)
>>>    {
>>>        struct vhost_vdpa *v = dev->opaque;
>>>        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, idx);
>>> -    return vhost_svq_start(dev, idx, svq);
>>> +    EventNotifier *vhost_call_notifier = vhost_svq_get_svq_call_notifier(svq);
>>> +    struct vhost_vring_file vhost_call_file = {
>>> +        .index = idx + dev->vq_index,
>>> +        .fd = event_notifier_get_fd(vhost_call_notifier),
>>> +    };
>>> +    int r;
>>> +    bool b;
>>> +
>>> +    /* Set shadow vq -> guest notifier */
>>> +    assert(v->call_fd[idx]);
>>
>> We need aovid the asser() here. On which case we can hit this?
>>
> I would say that there is no way we can actually hit it, so let's remove it.
>
>>> +    vhost_svq_set_guest_call_notifier(svq, v->call_fd[idx]);
>>> +
>>> +    b = vhost_svq_start(dev, idx, svq);
>>> +    if (unlikely(!b)) {
>>> +        return false;
>>> +    }
>>> +
>>> +    /* Set device -> SVQ notifier */
>>> +    r = vhost_vdpa_set_vring_dev_call(dev, &vhost_call_file);
>>> +    if (unlikely(r)) {
>>> +        error_report("vhost_vdpa_set_vring_call for shadow vq failed");
>>> +        return false;
>>> +    }
>>
>> Similar to kick, do we need to set_vring_call() before vhost_svq_start()?
>>
> It should not matter at this moment because the device should not be
> started at this point and device calls should not run
> vhost_svq_handle_call until BQL is released.


Yes, we stop virtqueue before.


>
> The "logic" of doing it after is to make clear that svq must be fully
> initialized before processing device calls, even in the case that we
> extract SVQ in its own iothread or similar. But this could be done
> before vhost_svq_start for sure.
>
>>> +
>>> +    /* Check for pending calls */
>>> +    event_notifier_set(vhost_call_notifier);
>>
>> Interesting, can this result spurious interrupt?
>>
> This actually "queues" a vhost_svq_handle_call after the BQL release,
> where the device should be fully reset. In that regard, if there are
> no used descriptors there will not be an irq raised to the guest. Does
> that answer the question? Or have I missed something?


Yes, please explain this in the comment.


>
>>> +    return true;
>>>    }
>>>
>>>    static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>>>    {
>>>        struct vhost_dev *hdev = v->dev;
>>>        unsigned n;
>>> +    int r;
>>>
>>>        if (enable == v->shadow_vqs_enabled) {
>>>            return hdev->nvqs;
>>> @@ -752,9 +779,18 @@ static unsigned vhost_vdpa_enable_svq(struct vhost_vdpa *v, bool enable)
>>>        if (!enable) {
>>>            /* Disable all queues or clean up failed start */
>>>            for (n = 0; n < v->shadow_vqs->len; ++n) {
>>> +            struct vhost_vring_file file = {
>>> +                .index = vhost_vdpa_get_vq_index(hdev, n),
>>> +                .fd = v->call_fd[n],
>>> +            };
>>> +
>>> +            r = vhost_vdpa_set_vring_call(hdev, &file);
>>> +            assert(r == 0);
>>> +
>>>                unsigned vq_idx = vhost_vdpa_get_vq_index(hdev, n);
>>>                VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, n);
>>>                vhost_svq_stop(hdev, n, svq);
>>> +            /* TODO: This can unmask or override call fd! */
>>
>> I don't get this comment. Does this mean the current code can't work
>> with mask_notifiers? If yes, this is something we need to fix.
>>
> Yes, but it will be addressed in the next series. I should have
> explained it bette here, sorry :).


Ok.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>>                vhost_virtqueue_start(hdev, hdev->vdev, &hdev->vqs[n], vq_idx);
>>>            }
>>>


