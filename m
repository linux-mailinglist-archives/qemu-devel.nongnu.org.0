Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65434D16C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:02:42 +0100 (CET)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYY5-0005r8-OM
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nRYRO-0006om-9C
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nRYRJ-0000ml-Jn
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646740540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OmUVCjjGZHHHj4ekrv6P1iPmt6ckAsc+unJsEgg6elU=;
 b=Q2+nDV46WE+ZvXM2seWj8ouDhQ7jooLTfS9TDzxtDTVrT49PszHoCrbtXFr9MX5YPEopcc
 rhVx32BonwqlFlfokj3csdAmQSdp7YF14ma/pOky5FHgsBag+n4wAkGYDPnW1iQ9vKXqaI
 QcJStNwctkY+Jru6B+VT8j2qSZFwFb0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-MO3-b3tLNzmnshjNW7H7TA-1; Tue, 08 Mar 2022 06:55:39 -0500
X-MC-Unique: MO3-b3tLNzmnshjNW7H7TA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z9-20020a7bc7c9000000b00389bd375677so1001141wmk.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OmUVCjjGZHHHj4ekrv6P1iPmt6ckAsc+unJsEgg6elU=;
 b=y2GLdJ3TECfv55h3lyt/Ks8+7E0bEodB4jn0+cOC2Z/DRyGeqd3mp2Ud6jugvdE/+V
 Oi4C9Vsdw1r7SESSx37A3bV3KxJy3geKX4VXs3WykNGcf0upmgqe/5ioOdYY+AfxEvms
 lN1kZC1hC/3afad/pYH7eQywIF3wZ/yjNIEUMJJkcxqo7pkrO+02mqptA9A0BU5/VwOa
 d57YcF81SllCG8LNiBtgGdK8nour56pZYbM7Pdnob7j2fgEol14Ux+0RhESQayVijyMp
 DAdMk4qd6g7hDqmd+PuuHGjGDgOipMP7TeEEbZp53aGOiW9buP9PhKZ07lCTF1ptdW3f
 S1ZA==
X-Gm-Message-State: AOAM532gEVYSDD2yJoHYCN4XZgj1QH+GyrrxAq0AaQNWCqtrEX2+/PI5
 BsoFgUApjbGiKpy/0tzs4rIlTFRpGAMnLR5n9QusE222QAAogTXdOxd4OS4gbeal05l49iPXhcr
 5QCBk/J24fDz0P38=
X-Received: by 2002:a05:600c:4e94:b0:381:84cf:e9b0 with SMTP id
 f20-20020a05600c4e9400b0038184cfe9b0mr3233440wmq.79.1646740538198; 
 Tue, 08 Mar 2022 03:55:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4qMpQJnuSqfHtiq8h2ndrtX6Wf6nMBHQw6EtPJ8X7SVNXLTzS83IYvcpaPW+A2zeA/xnxCQ==
X-Received: by 2002:a05:600c:4e94:b0:381:84cf:e9b0 with SMTP id
 f20-20020a05600c4e9400b0038184cfe9b0mr3233421wmq.79.1646740537908; 
 Tue, 08 Mar 2022 03:55:37 -0800 (PST)
Received: from sgarzare-redhat
 (host-212-171-187-184.pool212171.interbusiness.it. [212.171.187.184])
 by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm2051670wma.2.2022.03.08.03.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:55:37 -0800 (PST)
Date: Tue, 8 Mar 2022 12:55:34 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Message-ID: <20220308115534.xpjw3zkowwgyy7rp@sgarzare-redhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
 <20220119113042.a4dmwe4tnfsabnmn@steredhat>
 <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
 <20220307082341.qr3jwzygqxo7kx3o@sgarzare-redhat>
 <5d8e8b6c4c794be9867be45463251d39@huawei.com>
 <20220307121426.ecuy4doxuz7g6d2o@sgarzare-redhat>
 <c102cbc9856a42c888a64767c3265325@huawei.com>
 <20220308084129.jsutymus52nzvft4@sgarzare-redhat>
 <260b77d32efc4876a5ae7aefbf456841@huawei.com>
MIME-Version: 1.0
In-Reply-To: <260b77d32efc4876a5ae7aefbf456841@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 09:42:25AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Tuesday, March 8, 2022 4:41 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> qemu-devel@nongnu.org
>> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>>
>> On Tue, Mar 08, 2022 at 03:19:55AM +0000, Longpeng (Mike, Cloud Infrastructure
>> Service Product Dept.) wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> Sent: Monday, March 7, 2022 8:14 PM
>> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> <longpeng2@huawei.com>
>> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> qemu-devel@nongnu.org
>> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>> >>
>> >> On Mon, Mar 07, 2022 at 11:13:02AM +0000, Longpeng (Mike, Cloud Infrastructure
>> >> Service Product Dept.) wrote:
>> >> >
>> >> >
>> >> >> -----Original Message-----
>> >> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> >> Sent: Monday, March 7, 2022 4:24 PM
>> >> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> >> <longpeng2@huawei.com>
>> >> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> >> qemu-devel@nongnu.org
>> >> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>> >> >>
>> >> >> On Sat, Mar 05, 2022 at 07:07:54AM +0000, Longpeng (Mike, Cloud
>> Infrastructure
>> >> >> Service Product Dept.) wrote:
>> >> >> >
>> >> >> >
>> >> >> >> -----Original Message-----
>> >> >> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> >> >> Sent: Wednesday, January 19, 2022 7:31 PM
>> >> >> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> >> >> <longpeng2@huawei.com>
>> >> >> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> >> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> >> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> >> >> qemu-devel@nongnu.org
>> >> >> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>> >> >> >>
>> >> >> >> On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
>> >> >> >> >From: Longpeng <longpeng2@huawei.com>
>> >> >> >> >
>> >> >> >> >Implements the .realize interface.
>> >> >> >> >
>> >> >> >> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >> >> >> >---
>> >> >> >> > hw/virtio/vdpa-dev.c         | 101
>> +++++++++++++++++++++++++++++++++++
>> >> >> >> > include/hw/virtio/vdpa-dev.h |   8 +++
>> >> >> >> > 2 files changed, 109 insertions(+)
>> >> >> >> >
>> >> >> >> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> >> >> >> >index b103768f33..bd28cf7a15 100644
>> >> >> >> >--- a/hw/virtio/vdpa-dev.c
>> >> >> >> >+++ b/hw/virtio/vdpa-dev.c
>> >> >> >> >@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned
>> >> long
>> >> >> >> int cmd, Error **errp)
>> >> >> >> >     return val;
>> >> >> >> > }
>> >> >> >> >
>> >> >> >> >+static void
>> >> >> >> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue
>> >> *vq)
>> >> >> >> >+{
>> >> >> >> >+    /* Nothing to do */
>> >> >> >> >+}
>> >> >> >> >+
>> >> >> >> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>> >> >> >> > {
>> >> >> >> >+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> >> >> >> >+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> >> >> >> >+    uint32_t vdev_id, max_queue_size;
>> >> >> >> >+    struct vhost_virtqueue *vqs;
>> >> >> >> >+    int i, ret;
>> >> >> >> >+
>> >> >> >> >+    if (s->vdpa_dev_fd == -1) {
>> >> >> >> >+        s->vdpa_dev_fd = qemu_open(s->vdpa_dev, O_RDWR, errp);
>> >> >> >>
>> >> >> >> So, here we are re-opening the `vdpa_dev` again (without checking if
>> it
>> >> >> >> is NULL).
>> >> >> >>
>> >> >> >> And we re-do the same ioctls already done in
>> >> >> >> vhost_vdpa_device_pci_realize(), so I think we should do them in a
>> >> >> >> single place, and that place should be here.
>> >> >> >>
>> >> >> >> So, what about doing all the ioctls here, setting appropriate fields
>> in
>> >> >> >> VhostVdpaDevice, then using that fields in
>> >> >> >> vhost_vdpa_device_pci_realize() after qdev_realize() to set
>> >> >> >> `class_code`, `trans_devid`, and `nvectors`?
>> >> >> >>
>> >> >> >
>> >> >> >vhost_vdpa_device_pci_realize()
>> >> >> >  qdev_realize()
>> >> >> >    virtio_device_realize()
>> >> >> >      vhost_vdpa_device_realize()
>> >> >> >      virtio_bus_device_plugged()
>> >> >> >        virtio_pci_device_plugged()
>> >> >> >
>> >> >> >These three fields would be used in virtio_pci_device_plugged(), so it's
>> >> too
>> >> >> >late to set them after qdev_realize().  And they belong to VirtIOPCIProxy,
>> >> so
>> >> >> >we cannot set them in vhost_vdpa_device_realize() which is
>> >> >> >transport layer
>> >> >> >independent.
>> >> >>
>> >> >> Maybe I expressed myself wrong, I was saying to open the file and make
>> >> >> ioctls in vhost_vdpa_device_realize(). Save the values we use on both
>> >> >> sides in VhostVdpaDevice (e.g. num_queues, queue_size) and use these
>> >> >> saved values in virtio_pci_device_plugged() without re-opening the file
>> >> >> again.
>> >> >>
>> >> >
>> >> >This means we need to access VhostVdpaDevice in virtio_pci_device_plugged()?
>> >>
>> >> Yep, or implement some functions to get those values.
>> >>
>> >
>> >I prefer not to modify the VIRTIO or the VIRTIO_PCI core too much.
>>
>> Yeah, I was not thinking of modifying virtio or virtio_pci core either.
>>
>> >How about the following proposal?
>> >
>> >struct VhostVdpaDevice {
>> >    ...
>> >    void (*post_init)(VhostVdpaDevice *vdpa_dev);
>> >    ...
>> >}
>> >
>> >vhost_vdpa_device_pci_post_init(VhostVdpaDevice *vdpa_dev)
>> >{
>> >    ...
>> >    vpci_dev->class_code = virtio_pci_get_class_id(vdpa_dev->vdev_id);
>> >    vpci_dev->trans_devid =
>> >    virtio_pci_get_trans_devid(vdpa_dev->vdev_id);
>> >    vpci_dev->nvectors = vdpa_dev->num_queues + 1;
>> >    ...
>> >}
>> >
>> >vhost_vdpa_device_pci_realize():
>> >    post_init = vhost_vdpa_device_pci_post_init;
>> >
>> >vhost_vdpa_device_realize()
>> >{
>> >    ...
>> >    Open the file.
>> >    Set vdpa_dev->vdev_id, vdpa_dev->vdev_id, vdpa_dev->num_queues
>> >    ...
>> >    if (vdpa_dev->post_init) {
>> >        vdpa_dev->post_init(vdpa_dev);
>> >    }
>> >    ...
>> >}
>>
>> I was honestly thinking of something simpler: call qdev_realize() to
>> realize the VhostVdpaDevice object and then query VhostVdpaDevice for
>> the id and number of queues.
>>
>> Something like this (untested):
>>
>> diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
>> index e0482035cf..9d5f90eacc 100644
>> --- a/include/hw/virtio/vdpa-dev.h
>> +++ b/include/hw/virtio/vdpa-dev.h
>> @@ -25,5 +25,7 @@ struct VhostVdpaDevice {
>>   };
>>
>>   uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error
>> **errp);
>> +uint32_t vhost_vdpa_device_get_vdev_id(VhostVdpaDevice *s);
>> +uint32_t vhost_vdpa_device_get_num_queues(VhostVdpaDevice *s);
>>
>>   #endif
>> diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
>> index 257538dbdd..5eace2f79e 100644
>> --- a/hw/virtio/vdpa-dev-pci.c
>> +++ b/hw/virtio/vdpa-dev-pci.c
>> @@ -43,32 +43,16 @@ vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev,
>> Error **errp)
>>       VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
>>       DeviceState *vdev = DEVICE(&dev->vdev);
>>       uint32_t vdev_id;
>> -    uint32_t num_queues;
>> -    int fd;
>>
>> -    fd = qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);
>> -    if (*errp) {
>> +    if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
>>           return;
>>       }
>>
>> -    vdev_id = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_DEVICE_ID, errp);
>> -    if (*errp) {
>> -        qemu_close(fd);
>> -        return;
>> -    }
>> -
>> -    num_queues = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_VQS_NUM, errp);
>> -    if (*errp) {
>> -        qemu_close(fd);
>> -        return;
>> -    }
>> -
>> -    dev->vdev.vdpa_dev_fd = fd;
>> +    vdev_id = vhost_vdpa_device_get_vdev_id(&dev->vdev);
>>       vpci_dev->class_code = virtio_pci_get_class_id(vdev_id);
>>       vpci_dev->trans_devid = virtio_pci_get_trans_devid(vdev_id);
>>       /* one for config interrupt, one per vq */
>> -    vpci_dev->nvectors = num_queues + 1;
>> -    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>> +    vpci_dev->nvectors = vhost_vdpa_device_get_num_queues(&dev->vdev) + 1;
>>   }
>>
>
>It may be too late to set these fields.
>
>In fact, qdev_realize() calls vhost_vdpa_device_realize() first and then
>calls virtio_pci_device_plugged() which would use class_code, trans_devid
>and nvectors, so we need to make sure they're set before invoking
>virtio_pci_device_plugged().

Right, so let's go with your solution unless someone has a better idea.

Thanks,
Stefano


