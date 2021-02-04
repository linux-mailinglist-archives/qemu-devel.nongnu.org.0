Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C4030EACA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:17:27 +0100 (CET)
Received: from localhost ([::1]:48386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7V94-0000yv-QX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l7V6l-0008L9-5U
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 22:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l7V6h-0005bm-Vn
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 22:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612408498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3nSOkJ4+1o5Qg644rs4bNZhLAp4rDjJyu++BsMPd2E=;
 b=Og69fVfqXAqDhPwPJd30w+YTfzbk+Vo5z97XAwQctXbLmfQHBH9FKrsSM6/LITbiBGcDIB
 bDsRFX+/KDDi79v3zj9OnRCfjsqw5SUqOF6RajMFldEJVsTTo6fepxoVGozC1SnCa1ma/7
 HfLDzFCch/LsETOnM8VxbCzOybvQoh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-2eaBbwwBM96jJ8AtkWZVOA-1; Wed, 03 Feb 2021 22:14:55 -0500
X-MC-Unique: 2eaBbwwBM96jJ8AtkWZVOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49337107ACE3;
 Thu,  4 Feb 2021 03:14:53 +0000 (UTC)
Received: from [10.72.14.1] (ovpn-14-1.pek2.redhat.com [10.72.14.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C1C25D9C0;
 Thu,  4 Feb 2021 03:14:42 +0000 (UTC)
Subject: Re: [RFC 05/10] vhost: Add vhost_dev_from_virtio
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210129205415.876290-1-eperezma@redhat.com>
 <20210129205415.876290-6-eperezma@redhat.com>
 <acf16fd6-2282-c220-e642-0868ac839b70@redhat.com>
 <CAJaqyWeRK_i3MMZVgXJUwUNfLaq_h80jChZfQ3sRmWAcQnGLkQ@mail.gmail.com>
 <a526b3ac-91d9-28e6-5ffc-2308aab4fbd6@redhat.com>
 <CAJaqyWf-qsr5eLzk4Sum=GYhHoW_+V-9arfbssSjd6G6WnretQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a37502d6-b83f-fd34-7634-1060f4661540@redhat.com>
Date: Thu, 4 Feb 2021 11:14:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWf-qsr5eLzk4Sum=GYhHoW_+V-9arfbssSjd6G6WnretQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Rob Miller <rob.miller@broadcom.com>, Parav Pandit <parav@mellanox.com>,
 Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/2 下午6:17, Eugenio Perez Martin wrote:
> On Tue, Feb 2, 2021 at 4:31 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On 2021/2/1 下午4:28, Eugenio Perez Martin wrote:
>>> On Mon, Feb 1, 2021 at 7:13 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On 2021/1/30 上午4:54, Eugenio Pérez wrote:
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>     include/hw/virtio/vhost.h |  1 +
>>>>>     hw/virtio/vhost.c         | 17 +++++++++++++++++
>>>>>     2 files changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>>>>> index 4a8bc75415..fca076e3f0 100644
>>>>> --- a/include/hw/virtio/vhost.h
>>>>> +++ b/include/hw/virtio/vhost.h
>>>>> @@ -123,6 +123,7 @@ uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
>>>>>     void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
>>>>>                             uint64_t features);
>>>>>     bool vhost_has_free_slot(void);
>>>>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev);
>>>>>
>>>>>     int vhost_net_set_backend(struct vhost_dev *hdev,
>>>>>                               struct vhost_vring_file *file);
>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>>> index 28c7d78172..8683d507f5 100644
>>>>> --- a/hw/virtio/vhost.c
>>>>> +++ b/hw/virtio/vhost.c
>>>>> @@ -61,6 +61,23 @@ bool vhost_has_free_slot(void)
>>>>>         return slots_limit > used_memslots;
>>>>>     }
>>>>>
>>>>> +/*
>>>>> + * Get the vhost device associated to a VirtIO device.
>>>>> + */
>>>>> +struct vhost_dev *vhost_dev_from_virtio(const VirtIODevice *vdev)
>>>>> +{
>>>>> +    struct vhost_dev *hdev;
>>>>> +
>>>>> +    QLIST_FOREACH(hdev, &vhost_devices, entry) {
>>>>> +        if (hdev->vdev == vdev) {
>>>>> +            return hdev;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    assert(hdev);
>>>>> +    return NULL;
>>>>> +}
>>>> I'm not sure this can work in the case of multiqueue. E.g vhost-net
>>>> multiqueue is a N:1 mapping between vhost devics and virtio devices.
>>>>
>>>> Thanks
>>>>
>>> Right. We could add an "vdev vq index" parameter to the function in
>>> this case, but I guess the most reliable way to do this is to add a
>>> vhost_opaque value to VirtQueue, as Stefan proposed in previous RFC.
>>
>> So the question still, it looks like it's easier to hide the shadow
>> virtqueue stuffs at vhost layer instead of expose them to virtio layer:
>>
>> 1) vhost protocol is stable ABI
>> 2) no need to deal with virtio stuffs which is more complex than vhost
>>
>> Or are there any advantages if we do it at virtio layer?
>>
> As far as I can tell, we will need the virtio layer the moment we
> start copying/translating buffers.
>
> In this series, the virtio dependency can be reduced if qemu does not
> check the used ring _F_NO_NOTIFY flag before writing to irqfd. It
> would enable packed queues and IOMMU immediately, and I think the cost
> should not be so high. In the previous RFC this check was deleted
> later anyway, so I think it was a bad idea to include it from the start.


I am not sure I understand here. For vhost, we can still do anything we 
want, e.g accessing guest memory etc. Any blocker that prevent us from 
copying/translating buffers? (Note that qemu will propagate memory 
mappings to vhost).

Thanks


>
>
>
>
>
>> Thanks
>>
>>
>>> I need to take this into account in qmp_x_vhost_enable_shadow_vq too.
>>>
>>>>> +
>>>>>     static void vhost_dev_sync_region(struct vhost_dev *dev,
>>>>>                                       MemoryRegionSection *section,
>>>>>                                       uint64_t mfirst, uint64_t mlast,
>


