Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639EB3998AA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:41:02 +0200 (CEST)
Received: from localhost ([::1]:39806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeE9-00062O-9M
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loeD5-0005Dl-0b
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loeD2-0001gT-Iu
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622691591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+f0EqceIPMcCE81nyX/6vRLB2yNbJsosjw0iow1ykg=;
 b=Tnt6wm8G5yhZ+BFiMJUv7Qu1LuAAEKM2EMIbCwjIgqVoEogTL9geoaI9lIyBYc9vZpR7o/
 TyZ8ioP7QKWKT+3cT03At5lE90/y//HP42WftIoorMfB4xFDqZmVJwQw25c586AmN11GUv
 eq5rISjvigCYLOW37AZV1eaHVH61A34=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-Iftvy9U4OQaXymRGwvArIw-1; Wed, 02 Jun 2021 23:39:49 -0400
X-MC-Unique: Iftvy9U4OQaXymRGwvArIw-1
Received: by mail-pj1-f72.google.com with SMTP id
 15-20020a17090a0f0fb029016ad0f32fd0so2118004pjy.6
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 20:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=g+f0EqceIPMcCE81nyX/6vRLB2yNbJsosjw0iow1ykg=;
 b=HINwoP1WvoaFIsAP9o2yrg8e2OxlBpe6TbqkjW+crZw7Bo7XwSs2ZlRZSFdLNapmoW
 gdKItZYhfm6fNk+wjUckeeNTG45d2A4g67DKppdHjsPHmGxo7bSGh3k2Ef+Gbtfwwhwp
 YSF44mAyjRHR6Yx4Ja9AYQ9OVnFhyd2k8JUOTXjdXjZAwC2e7kmNBESDSMUy0bREORVJ
 9KCwsnfzagEE0h6Da0yhOmtcFTaXffll3N8zcjhqc3mFVFsie4u+xnDmNpur6Ek928bT
 icKUggvYHd0BC4C8u386iDMOt+L6+AB1keXLHcfyZ2g5BYbJmnJnQStYFn0ZnJJ3+BMY
 bgbQ==
X-Gm-Message-State: AOAM533hRFCzqfuDyT+en99bX1jbkxS1cutEHqY+pnxfHGzbRBs/fq3C
 HhveFuVMUGZTP3jnQsHniGUe5GuTJywlSXdWLdOC4q4L7M1iL1BgGot9IU0+D2MYTMUFn2gNTLO
 bAS4h1Me+NAla7is=
X-Received: by 2002:a17:90a:bc8f:: with SMTP id
 x15mr8894589pjr.119.1622691588805; 
 Wed, 02 Jun 2021 20:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmyLU35I8pSCDrAAyyxEVDjVzxelKIYOR1EC7Y8kByaiY/eRN53VJQToZhn1sQG25poWKNXw==
X-Received: by 2002:a17:90a:bc8f:: with SMTP id
 x15mr8894573pjr.119.1622691588556; 
 Wed, 02 Jun 2021 20:39:48 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o17sm1086838pgj.25.2021.06.02.20.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 20:39:47 -0700 (PDT)
Subject: Re: [RFC v3 25/29] vhost: Add custom IOTLB translations to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-26-eperezma@redhat.com>
 <ae560866-4598-3157-a0cb-e0e79b4dca42@redhat.com>
 <CAJaqyWc7OWeQnXHihY=mYp=N+rRJLcbFUsJA-OszD6tyr6v-FQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <316a88dc-2d78-e36b-50d7-d0243bceb898@redhat.com>
Date: Thu, 3 Jun 2021 11:39:42 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAJaqyWc7OWeQnXHihY=mYp=N+rRJLcbFUsJA-OszD6tyr6v-FQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Harpreet Singh Anand <hanand@xilinx.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/3 上午1:51, Eugenio Perez Martin 写道:
> On Wed, Jun 2, 2021 at 11:52 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/5/20 上午12:28, Eugenio Pérez 写道:
>>> Use translations added in IOVAReverseMaps in SVQ if the vhost device
>>> does not support the mapping of the full qemu's virtual address space.
>>> In other cases, Shadow Virtqueue still uses the qemu's virtual address
>>> of the buffer pointed by the descriptor, which has been translated
>>> already by qemu's VirtQueue machinery.
>>
>> I'd say let stick to a single kind of translation (iova allocator) that
>> works for all the cases first and add optimizations on top.
>>
> Ok, I will start from here for the next revision.
>
>>> Now every element needs to store the previous address also, so VirtQueue
>>> can consume the elements properly. This adds a little overhead per VQ
>>> element, having to allocate more memory to stash them. As a possible
>>> optimization, this allocation could be avoided if the descriptor is not
>>> a chain but a single one, but this is left undone.
>>>
>>> Checking also for vhost_set_iotlb_callback to send used ring remapping.
>>> This is only needed for kernel, and would print an error in case of
>>> vhost devices with its own mapping (vdpa).
>>>
>>> This could change for other callback, like checking for
>>> vhost_force_iommu, enable_custom_iommu, or another. Another option could
>>> be to, at least, extract the check of "is map(used, writable) needed?"
>>> in another function. But at the moment just copy the check used in
>>> vhost_dev_start here.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.c | 134 ++++++++++++++++++++++++++---
>>>    hw/virtio/vhost.c                  |  29 +++++--
>>>    2 files changed, 145 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 934d3bb27b..a92da979d1 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -10,12 +10,19 @@
>>>    #include "hw/virtio/vhost-shadow-virtqueue.h"
>>>    #include "hw/virtio/vhost.h"
>>>    #include "hw/virtio/virtio-access.h"
>>> +#include "hw/virtio/vhost-iova-tree.h"
>>>
>>>    #include "standard-headers/linux/vhost_types.h"
>>>
>>>    #include "qemu/error-report.h"
>>>    #include "qemu/main-loop.h"
>>>
>>> +typedef struct SVQElement {
>>> +    VirtQueueElement elem;
>>> +    void **in_sg_stash;
>>> +    void **out_sg_stash;
>>
>> Any reason for the trick like this?
>>
>> Can we simply use iovec and iov_copy() here?
>>
> At the moment the device writes the buffer directly to the guest's
> memory, and SVQ only translates the descriptor. In this scenario,
> there would be no need for iov_copy, isn't it?


It depends on which kinds of translation you used.

If I read the code correctly, stash is used for storing HVAs after the 
HVA->IOVA translation.

This looks exactly the work of iov (and do we guarantee the there will 
be a 1:1 translation?)

And if the mapping is 1:1 you can simply use iov_copy().

But this wont' be a option if we will always use iova allocator.


>
> The reason for stash and unstash them was to allow the 1:1 mapping
> with qemu memory and IOMMU and iova allocator to work with less
> changes, In particular, the reason for unstash is that virtqueue_fill,
> expects qemu pointers to set the guest memory page as dirty in
> virtqueue_unmap_sg->dma_memory_unmap.
>
> Now I think that just storing the iova address from the allocator in a
> separated field and using a wrapper to get the IOVA addresses in SVQ
> would be a better idea, so I would change to this if everyone agrees.


I agree.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>


