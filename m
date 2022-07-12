Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C75713EA
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:04:54 +0200 (CEST)
Received: from localhost ([::1]:58578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAt3-0004cD-5R
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAeK-0003pt-4Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAeG-00019T-V1
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:49:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657612176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=584U6W2JPGjlNqY/z1O4McKrmNo82HXAhI0LWuOFcFk=;
 b=N1cRmPssA6cMAua0anAbTopfRx49mJnMTHuj/EhpjMZb1CUqUDI0PqJmAGMRFLxyVBA/3f
 xNmW/MpKC3PPIbuDZpac8P45mnPScDXXMfAUYvRYknWNxhAj9vWWmZX2WLPTn+XQjg9hJB
 qW1BjaUY7k7bt62z3AohSuWw/6nDWkw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-eg8ozMSpOwq1VsT6EcZXVQ-1; Tue, 12 Jul 2022 03:49:34 -0400
X-MC-Unique: eg8ozMSpOwq1VsT6EcZXVQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 r7-20020aa79627000000b00528beaf82c3so1918742pfg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=584U6W2JPGjlNqY/z1O4McKrmNo82HXAhI0LWuOFcFk=;
 b=MWEXjTT9jUGFiVuGBHMjAIJ/bkcX8kt3Z02O1VYa1+mP0RMwC1Zhog/8yBGVZZp1mi
 lFa15vx/+1zeKdyKKBPQr6Ceztuc60r75+YO1pO/+8lQmMNvgi7uuL0TukbfgacSBGGJ
 2mcUdccafcLeQj8MDbQ7iGjiqibSz/OMGQMlURTbTx1Z3TzMYxgj4e5/yFLzL1uhlTyB
 NYfpBHJ1WJTKTXzrvOAQC7xcaUCr7RSDlKX2ny32E63VxrgU6CabpYnuH3T8oFzQQYx4
 6r43HMDm7I8B7oiXJRWsyiVaUKnWs2gF3Phk2aKjb+EE8KwVqFVd9kHWk0XTgrAFNoce
 ovKw==
X-Gm-Message-State: AJIora98jmlUw5qaNAkBXP1gtjaHr34Iga4oJsTDVtvUP/0mDT9drmIX
 pHsebncG5lONIflVUMzWy9x6AE8YXJ4dAuA56Ls6ipezWKpxB4rpAVKu7OjcOCmRKYEoWDk/r8Q
 P/Jwt7D0JiJZjk/Q=
X-Received: by 2002:a05:6a00:ad2:b0:4f1:2734:a3d9 with SMTP id
 c18-20020a056a000ad200b004f12734a3d9mr22708418pfl.61.1657612173076; 
 Tue, 12 Jul 2022 00:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXKTXa2Fj39UZ7yrIHNmjYSZ9BVEUuwGSmFZkE7h9PgbMOrQMpvreGdoOGyUwg0+oHOCoqSA==
X-Received: by 2002:a05:6a00:ad2:b0:4f1:2734:a3d9 with SMTP id
 c18-20020a056a000ad200b004f12734a3d9mr22708385pfl.61.1657612172757; 
 Tue, 12 Jul 2022 00:49:32 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016bd8f66ca0sm6116109pla.162.2022.07.12.00.49.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:49:32 -0700 (PDT)
Message-ID: <cf84c327-1c61-9c7e-c19c-22af0b759b91@redhat.com>
Date: Tue, 12 Jul 2022 15:49:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 09/23] vhost: Add SVQElement
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-10-eperezma@redhat.com>
 <ece7b78f-9920-be6f-cea4-b9069035a6b0@redhat.com>
 <CAJaqyWfpOTmUkdiRN57A3wfnmZojoAaHte-oOtmo3wfQWD1pfA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfpOTmUkdiRN57A3wfnmZojoAaHte-oOtmo3wfQWD1pfA@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/11 17:33, Eugenio Perez Martin 写道:
> On Mon, Jul 11, 2022 at 11:00 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/7/7 02:39, Eugenio Pérez 写道:
>>> This will allow SVQ to add metadata to the different queue elements. To
>>> simplify changes, only store actual element at this patch.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |  8 ++++--
>>>    hw/virtio/vhost-shadow-virtqueue.c | 41 ++++++++++++++++++++----------
>>>    2 files changed, 33 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index 0fbdd69153..e434dc63b0 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -15,6 +15,10 @@
>>>    #include "standard-headers/linux/vhost_types.h"
>>>    #include "hw/virtio/vhost-iova-tree.h"
>>>
>>> +typedef struct SVQElement {
>>> +    VirtQueueElement *elem;
>>> +} SVQElement;
>>> +
>>>    typedef struct VhostShadowVirtqueue VhostShadowVirtqueue;
>>>    typedef int (*ShadowVirtQueueStart)(VhostShadowVirtqueue *svq,
>>>                                        void *opaque);
>>> @@ -55,8 +59,8 @@ typedef struct VhostShadowVirtqueue {
>>>        /* IOVA mapping */
>>>        VhostIOVATree *iova_tree;
>>>
>>> -    /* Map for use the guest's descriptors */
>>> -    VirtQueueElement **ring_id_maps;
>>> +    /* Each element context */
>>> +    SVQElement *ring_id_maps;
>>>
>>>        /* Next VirtQueue element that guest made available */
>>>        VirtQueueElement *next_guest_avail_elem;
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 46d3c1d74f..913bca8769 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -237,7 +237,7 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>>>            return false;
>>>        }
>>>
>>> -    svq->ring_id_maps[qemu_head] = elem;
>>> +    svq->ring_id_maps[qemu_head].elem = elem;
>>>        return true;
>>>    }
>>>
>>> @@ -385,15 +385,25 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
>>>        return i;
>>>    }
>>>
>>> -static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>>> -                                           uint32_t *len)
>>> +static bool vhost_svq_is_empty_elem(SVQElement elem)
>>> +{
>>> +    return elem.elem == NULL;
>>> +}
>>> +
>>> +static SVQElement vhost_svq_empty_elem(void)
>>> +{
>>> +    return (SVQElement){};
>>> +}
>>
>> I wonder what's the benefit of using this instead of passing pointer to
>> SVQElement and using memset().
>>
> It was a more direct translation of the previous workflow but we can
> use memset here for sure.
>
>>> +
>>> +static SVQElement vhost_svq_get_buf(VhostShadowVirtqueue *svq, uint32_t *len)
>>>    {
>>>        const vring_used_t *used = svq->vring.used;
>>>        vring_used_elem_t used_elem;
>>> +    SVQElement svq_elem = vhost_svq_empty_elem();
>>>        uint16_t last_used, last_used_chain, num;
>>>
>>>        if (!vhost_svq_more_used(svq)) {
>>> -        return NULL;
>>> +        return svq_elem;
>>>        }
>>>
>>>        /* Only get used array entries after they have been exposed by dev */
>>> @@ -406,24 +416,25 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>>>        if (unlikely(used_elem.id >= svq->vring.num)) {
>>>            qemu_log_mask(LOG_GUEST_ERROR, "Device %s says index %u is used",
>>>                          svq->vdev->name, used_elem.id);
>>> -        return NULL;
>>> +        return svq_elem;
>>>        }
>>>
>>> -    if (unlikely(!svq->ring_id_maps[used_elem.id])) {
>>> +    svq_elem = svq->ring_id_maps[used_elem.id];
>>> +    svq->ring_id_maps[used_elem.id] = vhost_svq_empty_elem();
>>> +    if (unlikely(vhost_svq_is_empty_elem(svq_elem))) {
>>
>> Any reason we can't simply assign NULL to ring_id_maps[used_elem.id]?
>>
> It simply avoids allocating more memory, so error code paths are
> simplified, etc. In the kernel, vring_desc_state_split, desc_extra and
> similar are not an array of pointers but an array of states, so we
> apply the same here. Returning them by value it's not so common
> though.


Yes, but kernel validate the used id through a pointer to data (token). 
This is the elem we used before this patch.

The code here looks more like a workaround of adding indirection level 
for elem. We'd better try to avoid that.

Thanks


>
> But we can allocate a state per in-flight descriptor for sure.
>
> Thanks!
>
>
>> Thanks
>>
>>
>>>            qemu_log_mask(LOG_GUEST_ERROR,
>>>                "Device %s says index %u is used, but it was not available",
>>>                svq->vdev->name, used_elem.id);
>>> -        return NULL;
>>> +        return svq_elem;
>>>        }
>>>
>>> -    num = svq->ring_id_maps[used_elem.id]->in_num +
>>> -          svq->ring_id_maps[used_elem.id]->out_num;
>>> +    num = svq_elem.elem->in_num + svq_elem.elem->out_num;
>>>        last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
>>>        svq->desc_next[last_used_chain] = svq->free_head;
>>>        svq->free_head = used_elem.id;
>>>
>>>        *len = used_elem.len;
>>> -    return g_steal_pointer(&svq->ring_id_maps[used_elem.id]);
>>> +    return svq_elem;
>>>    }
>>>
>>>    /**
>>> @@ -454,6 +465,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>>>            vhost_svq_disable_notification(svq);
>>>            while (true) {
>>>                uint32_t len;
>>> +            SVQElement svq_elem;
>>>                g_autofree VirtQueueElement *elem = NULL;
>>>
>>>                if (unlikely(i >= svq->vring.num)) {
>>> @@ -464,11 +476,12 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>>>                    return;
>>>                }
>>>
>>> -            elem = vhost_svq_get_buf(svq, &len);
>>> -            if (!elem) {
>>> +            svq_elem = vhost_svq_get_buf(svq, &len);
>>> +            if (vhost_svq_is_empty_elem(svq_elem)) {
>>>                    break;
>>>                }
>>>
>>> +            elem = g_steal_pointer(&svq_elem.elem);
>>>                virtqueue_fill(vq, elem, len, i++);
>>>            }
>>>
>>> @@ -611,7 +624,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
>>>        memset(svq->vring.desc, 0, driver_size);
>>>        svq->vring.used = qemu_memalign(qemu_real_host_page_size(), device_size);
>>>        memset(svq->vring.used, 0, device_size);
>>> -    svq->ring_id_maps = g_new0(VirtQueueElement *, svq->vring.num);
>>> +    svq->ring_id_maps = g_new0(SVQElement, svq->vring.num);
>>>        svq->desc_next = g_new0(uint16_t, svq->vring.num);
>>>        for (unsigned i = 0; i < svq->vring.num - 1; i++) {
>>>            svq->desc_next[i] = cpu_to_le16(i + 1);
>>> @@ -636,7 +649,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>
>>>        for (unsigned i = 0; i < svq->vring.num; ++i) {
>>>            g_autofree VirtQueueElement *elem = NULL;
>>> -        elem = g_steal_pointer(&svq->ring_id_maps[i]);
>>> +        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
>>>            if (elem) {
>>>                virtqueue_detach_element(svq->vq, elem, 0);
>>>            }


