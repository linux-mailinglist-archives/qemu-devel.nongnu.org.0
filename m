Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA6933E6FC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 03:26:54 +0100 (CET)
Received: from localhost ([::1]:45936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMLtc-0003EL-OF
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 22:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMLsJ-0002is-R4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 22:25:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMLsH-0001O4-Fz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 22:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615947928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8GMje+fkgQdNG6jh0ujf3b/8nRhqfEJkA1xHCSteqI=;
 b=UQiYpLtPF+4GFSts+9WKF629LQHEevFneWpwWFQKKIsgkU/Qc4b+Bx2evfGZGOorheSjd4
 QEl1z1t7wEOtaMgGbzqxnBLl2south9NthRhOytk75XRl0eLkBEHwEYMMt1Ytk9CRI48da
 2qzUzRXVoPzQAr2N8mM+tnG5qkH3vmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-V0YpjDyfPSq8T5ypNbMdwQ-1; Tue, 16 Mar 2021 22:25:24 -0400
X-MC-Unique: V0YpjDyfPSq8T5ypNbMdwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 678C61015C8C;
 Wed, 17 Mar 2021 02:25:22 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-188.pek2.redhat.com
 [10.72.12.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E3CA5D9DC;
 Wed, 17 Mar 2021 02:25:12 +0000 (UTC)
Subject: Re: [RFC v2 10/13] vhost: add vhost_kernel_set_vring_enable
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-11-eperezma@redhat.com>
 <98916095-ac78-7deb-5086-ee0adf39dcf5@redhat.com>
 <CAJaqyWcFQQQg1YS14NY3JDfHcjEnhvim3TzxV0FEPyKqhf0nrg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c7206893-729a-0c67-e903-faab9ea98b94@redhat.com>
Date: Wed, 17 Mar 2021 10:25:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcFQQQg1YS14NY3JDfHcjEnhvim3TzxV0FEPyKqhf0nrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, virtualization@lists.linux-foundation.org,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/16 下午6:43, Eugenio Perez Martin 写道:
> On Tue, Mar 16, 2021 at 8:30 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/3/16 上午3:48, Eugenio Pérez 写道:
>>> This method is already present in vhost-user. This commit adapts it to
>>> vhost-net, so SVQ can use.
>>>
>>> vhost_kernel_set_enable stops the device, so qemu can ask for its status
>>> (next available idx the device was going to consume). When SVQ starts it
>>> can resume consuming the guest's driver ring, without notice from the
>>> latter. Not stopping the device before of the swapping could imply that
>>> it process more buffers than reported, what would duplicate the device
>>> action.
>>
>> Note that it might not be the case of vDPA (virtio) or at least virtio
>> needs some extension to achieve something similar like this. One example
>> is virtio-pci which forbids 0 to be wrote to queue_enable.
>>
>> This is another reason to start from vhost-vDPA.
>>
>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-backend.c | 29 +++++++++++++++++++++++++++++
>>>    1 file changed, 29 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
>>> index 31b33bde37..1ac5c574a9 100644
>>> --- a/hw/virtio/vhost-backend.c
>>> +++ b/hw/virtio/vhost-backend.c
>>> @@ -201,6 +201,34 @@ static int vhost_kernel_get_vq_index(struct vhost_dev *dev, int idx)
>>>        return idx - dev->vq_index;
>>>    }
>>>
>>> +static int vhost_kernel_set_vq_enable(struct vhost_dev *dev, unsigned idx,
>>> +                                      bool enable)
>>> +{
>>> +    struct vhost_vring_file file = {
>>> +        .index = idx,
>>> +    };
>>> +
>>> +    if (!enable) {
>>> +        file.fd = -1; /* Pass -1 to unbind from file. */
>>> +    } else {
>>> +        struct vhost_net *vn_dev = container_of(dev, struct vhost_net, dev);
>>> +        file.fd = vn_dev->backend;
>>
>> This can only work with vhost-net devices but not vsock/scsi etc.
>>
> Right. Shadow virtqueue code should also check the return value of the
> vhost_set_vring_enable call.
>
> I'm not sure how to solve it without resorting to some ifelse/switch
> chain, checking for specific net/vsock/... features, or relaying on
> some other qemu class facilities. However, since the main use case is
> vDPA live migration, this commit could be left out and SVQ operation
> would only be valid for vhost-vdpa and vhost-user.


Yes, that's why I think we can start with vhost-vDPA first.

Thanks


>
>> Thanks
>>
>>
>>> +    }
>>> +
>>> +    return vhost_kernel_net_set_backend(dev, &file);
>>> +}
>>> +
>>> +static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int enable)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < dev->nvqs; ++i) {
>>> +        vhost_kernel_set_vq_enable(dev, i, enable);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    #ifdef CONFIG_VHOST_VSOCK
>>>    static int vhost_kernel_vsock_set_guest_cid(struct vhost_dev *dev,
>>>                                                uint64_t guest_cid)
>>> @@ -317,6 +345,7 @@ static const VhostOps kernel_ops = {
>>>            .vhost_set_owner = vhost_kernel_set_owner,
>>>            .vhost_reset_device = vhost_kernel_reset_device,
>>>            .vhost_get_vq_index = vhost_kernel_get_vq_index,
>>> +        .vhost_set_vring_enable = vhost_kernel_set_vring_enable,
>>>    #ifdef CONFIG_VHOST_VSOCK
>>>            .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
>>>            .vhost_vsock_set_running = vhost_kernel_vsock_set_running,


