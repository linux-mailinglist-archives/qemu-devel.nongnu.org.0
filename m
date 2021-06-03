Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C3D39987A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:14:56 +0200 (CEST)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lodot-0004g5-TV
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lodo9-0003zt-4w
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:14:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lodo7-0005A0-9U
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622690046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EdxrEtb0sFDVJQB6XAX1IEbvLZt1yFIQv0NEiyIEt2A=;
 b=L0yMw8GHoWZ/L0YEtZ60cw7Tj9uNJSJGoFPUv/oqa5v/OZr1TWNcesxHw6Qgmw8vvtQIs+
 Tkw815AacG6twbuAbYrTtgIh65TcSZLLzphEtFkjMO24AvMnoyKTUTqD2aycuH1BKHocpg
 K/YryCxYXmH+HmO6RenTysO3qJsQNRI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-T29UP0ULNWuC5_0eQSe36A-1; Wed, 02 Jun 2021 23:14:04 -0400
X-MC-Unique: T29UP0ULNWuC5_0eQSe36A-1
Received: by mail-pl1-f198.google.com with SMTP id
 n14-20020a170902e54eb029010d602977ecso840721plf.7
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 20:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EdxrEtb0sFDVJQB6XAX1IEbvLZt1yFIQv0NEiyIEt2A=;
 b=EzbHfzLOweKSLhzubzekSMQ8r9YWlnfb4SlYTcqdhk4prvENtAC1kPX/K1bznRn+CL
 Rk+GSQZHz9llsLsXMyjRAvoMxs4A/wJ3SV0EqMfyx591NFxkANhnOOwIgxc1VfAUyH3q
 NYmVtiyeDb2wtWM2lkiGHlvH4RVxgyQNWMBoh9G5j39815oAZwuBqemZ3H9hcfJb9E/D
 cLjLu1c7kbRjwjeJxvTgxJyLlzjG1B8nk+lFPt5R4+qcGzUOC7A217j9+WJgAWZ+zUK/
 ptCEJwXYW55gm0EA3DS02YpVg3KUddkLxV94y49UbK1+LhkllToQXSOtymmrTSYeNK49
 8scg==
X-Gm-Message-State: AOAM533DGcVORs3VCanlGNSXN+6hIt4Ktu6KwMJFiVXMLem+8az/cquX
 7Tk3Ro2846+erdz2PBg0HJkVXK0BCkigva5IVSMW35WCfRWKyZqBa21IJHdLASdHN+crn/jAWYW
 B5LscxoGwd1e3YkE=
X-Received: by 2002:a17:90a:3c83:: with SMTP id
 g3mr3413980pjc.123.1622690043475; 
 Wed, 02 Jun 2021 20:14:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSnP7Gue7BFOqyvRj3lFOXLF4HGINngfq0sXShIpRyjFb/Y3dp8DjJaHnp1TJwjNQBll87DA==
X-Received: by 2002:a17:90a:3c83:: with SMTP id
 g3mr3413950pjc.123.1622690043246; 
 Wed, 02 Jun 2021 20:14:03 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id j4sm693066pjv.7.2021.06.02.20.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 20:14:02 -0700 (PDT)
Subject: Re: [RFC v3 13/29] vhost: Add vhost_get_iova_range operation
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-14-eperezma@redhat.com>
 <e0114c64-2620-7a72-6445-3035ceb748ac@redhat.com>
 <CAJaqyWeL-0KjsBcXs1tYdvn9xLAK-x0Sb+RFuzPgngXxYtF9uw@mail.gmail.com>
 <b9dd6708-015e-d451-b368-f9376c00f6ad@redhat.com>
 <CAJaqyWf+=-nwOsS=zZEhmiTA_TotVMQibUgE0grCMZgXVDNpxg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <90cd3551-f05b-0270-b5ed-890f578c01b9@redhat.com>
Date: Thu, 3 Jun 2021 11:13:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf+=-nwOsS=zZEhmiTA_TotVMQibUgE0grCMZgXVDNpxg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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


在 2021/6/1 下午3:17, Eugenio Perez Martin 写道:
> On Thu, May 27, 2021 at 6:51 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/5/27 上午1:49, Eugenio Perez Martin 写道:
>>> On Wed, May 26, 2021 at 3:14 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2021/5/20 上午12:28, Eugenio Pérez 写道:
>>>>> For simplicity, If a device does not support this operation it means
>>>>> that it can handle full (uint64_t)-1 iova address.
>>>> Note that, we probably need a separated patch for this.
>>>>
>>> Actually the comment is not in the right commit, the next one is the
>>> one that uses it. Is that what you mean?
>>
>> No, it's about the following suggestions.
>>
>>
>>>> And we need to this during vhost-vdpa initialization. If GPA is out of
>>>> the range, we need to fail the start of vhost-vdpa.
>>
>> Note that this is for non-IOMMU case. For the case of vIOMMU we probably
>> need to validate it against address width or other similar attributes.
>>
> Right.
>
> What should qemu do if the memory of the guest gets expanded outside
> of the range? I think there is not a clear way to fail the memory
> addition, isn't it?


I'm not sure, but I guess there should be a way to fail the memory hot-add.

(otherwise we can introduce the error reporting for them)

Thanks


>
>> Thanks
>>
>>
>>> Right, that is still to-do.
>>>
>>> Maybe a series with just these two commits and failing the start if
>>> GPA is not in the range, as you say, would help to split the amount of
>>> changes.
>>>
>>> I will send it if no more comments arise about it.
>>>
>>> Thanks!
>>>
>>>> THanks
>>>>
>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>     include/hw/virtio/vhost-backend.h |  5 +++++
>>>>>     hw/virtio/vhost-vdpa.c            | 18 ++++++++++++++++++
>>>>>     hw/virtio/trace-events            |  1 +
>>>>>     3 files changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
>>>>> index 94d3323905..bcb112c166 100644
>>>>> --- a/include/hw/virtio/vhost-backend.h
>>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>>> @@ -36,6 +36,7 @@ struct vhost_vring_addr;
>>>>>     struct vhost_scsi_target;
>>>>>     struct vhost_iotlb_msg;
>>>>>     struct vhost_virtqueue;
>>>>> +struct vhost_vdpa_iova_range;
>>>>>
>>>>>     typedef int (*vhost_backend_init)(struct vhost_dev *dev, void *opaque);
>>>>>     typedef int (*vhost_backend_cleanup)(struct vhost_dev *dev);
>>>>> @@ -127,6 +128,9 @@ typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>>>>>
>>>>>     typedef int (*vhost_vring_pause_op)(struct vhost_dev *dev);
>>>>>
>>>>> +typedef int (*vhost_get_iova_range)(struct vhost_dev *dev,
>>>>> +                                    hwaddr *first, hwaddr *last);
>>>>> +
>>>>>     typedef struct VhostOps {
>>>>>         VhostBackendType backend_type;
>>>>>         vhost_backend_init vhost_backend_init;
>>>>> @@ -173,6 +177,7 @@ typedef struct VhostOps {
>>>>>         vhost_get_device_id_op vhost_get_device_id;
>>>>>         vhost_vring_pause_op vhost_vring_pause;
>>>>>         vhost_force_iommu_op vhost_force_iommu;
>>>>> +    vhost_get_iova_range vhost_get_iova_range;
>>>>>     } VhostOps;
>>>>>
>>>>>     extern const VhostOps user_ops;
>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>> index 01d2101d09..74fe92935e 100644
>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>> @@ -579,6 +579,23 @@ static bool  vhost_vdpa_force_iommu(struct vhost_dev *dev)
>>>>>         return true;
>>>>>     }
>>>>>
>>>>> +static int vhost_vdpa_get_iova_range(struct vhost_dev *dev,
>>>>> +                                     hwaddr *first, hwaddr *last)
>>>>> +{
>>>>> +    int ret;
>>>>> +    struct vhost_vdpa_iova_range range;
>>>>> +
>>>>> +    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_IOVA_RANGE, &range);
>>>>> +    if (ret != 0) {
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    *first = range.first;
>>>>> +    *last = range.last;
>>>>> +    trace_vhost_vdpa_get_iova_range(dev, *first, *last);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>     const VhostOps vdpa_ops = {
>>>>>             .backend_type = VHOST_BACKEND_TYPE_VDPA,
>>>>>             .vhost_backend_init = vhost_vdpa_init,
>>>>> @@ -611,4 +628,5 @@ const VhostOps vdpa_ops = {
>>>>>             .vhost_get_device_id = vhost_vdpa_get_device_id,
>>>>>             .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
>>>>>             .vhost_force_iommu = vhost_vdpa_force_iommu,
>>>>> +        .vhost_get_iova_range = vhost_vdpa_get_iova_range,
>>>>>     };
>>>>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>>>>> index c62727f879..5debe3a681 100644
>>>>> --- a/hw/virtio/trace-events
>>>>> +++ b/hw/virtio/trace-events
>>>>> @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
>>>>>     vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
>>>>>     vhost_vdpa_set_owner(void *dev) "dev: %p"
>>>>>     vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
>>>>> +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
>>>>>
>>>>>     # virtio.c
>>>>>     virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"


