Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9504CFE09
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:18:52 +0100 (CET)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCKC-0006bD-1O
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nRCG7-0000d1-3b
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:14:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nRCG3-0007r1-4v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646655274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ToBvWuQJ6XuTRKRZku9k1EtpvsvU8XfjRcBLGoHN9M=;
 b=LTJw9cMoNtXPMhLonBYsvQ5mYhoKVl20rGhcxY87yWyI1sHQDySXIBh30Xip9xqqyk/lDk
 d6Tp8yoev2EAs1M+G6C6ZOlsbqlNd5JV15oR7PdoR1yx9XgZHzIBkmFdT6dAAkwTRexs5Z
 wi9CZqgOU1QhLUojs0LR/1sKuorTQZA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-qA5xXcf8NGmNQKwAYVWoiA-1; Mon, 07 Mar 2022 07:14:33 -0500
X-MC-Unique: qA5xXcf8NGmNQKwAYVWoiA-1
Received: by mail-qv1-f69.google.com with SMTP id
 kj16-20020a056214529000b00435218e0f0dso12352953qvb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ToBvWuQJ6XuTRKRZku9k1EtpvsvU8XfjRcBLGoHN9M=;
 b=dbQk4mGnRAvW0IIh763tonJFHZKrKNqLUDagbNPg2866kzb1zAtHiafwGLQLzmYFIM
 Y9IJvXxxk2bvXXeXIMKiWSn1rzmnxqov476dilNLj0cCrFZKqzRwK/dFhljfnIi6hjUq
 5ErNl3GM6s40OZfRyH49TLk+0qYT9XXrhWP11qIl1q/bQWIGP0rVPp2Vm9fhaUbZDOU0
 EvJNoTnIKZ9qzN9aZQMYQZgz0zudf5soxGNPt0xNSjoY3ZHLe4/xZ7yCajm1OP0gDl9e
 RmUZMjKfKAYoAIbdNXNJNkHczZrLfWaOzX0JUSy8XQN24wSqR/oWK2xFGj8SCR7ghQbJ
 suDA==
X-Gm-Message-State: AOAM531KESX5Y9/JrrNaSVyRjSFQYMM7s8uZ+TvrKFoJ2JJpN/FVgyDE
 QtnMU0lEwpC9xvKl8jma0tk2I+29GxWBqKWDr5aZmqmHOfKLjhyF/gRzBrAUEy10csGcr1Sp8Go
 WR6nBYZVCqxWiKyI=
X-Received: by 2002:a05:6214:21cb:b0:435:8b0f:4aff with SMTP id
 d11-20020a05621421cb00b004358b0f4affmr3940092qvh.76.1646655272742; 
 Mon, 07 Mar 2022 04:14:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwemOBoeZ05uZMkOtlgytO1wHdc3KXJeFOryBlofIChB7LtSyx/UWdb0/eV6c/N55lMMPFezA==
X-Received: by 2002:a05:6214:21cb:b0:435:8b0f:4aff with SMTP id
 d11-20020a05621421cb00b004358b0f4affmr3940068qvh.76.1646655272493; 
 Mon, 07 Mar 2022 04:14:32 -0800 (PST)
Received: from sgarzare-redhat
 (host-212-171-187-184.pool212171.interbusiness.it. [212.171.187.184])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ac85f0c000000b002de8931d4d6sm8675296qta.77.2022.03.07.04.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 04:14:31 -0800 (PST)
Date: Mon, 7 Mar 2022 13:14:26 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Message-ID: <20220307121426.ecuy4doxuz7g6d2o@sgarzare-redhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
 <20220119113042.a4dmwe4tnfsabnmn@steredhat>
 <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
 <20220307082341.qr3jwzygqxo7kx3o@sgarzare-redhat>
 <5d8e8b6c4c794be9867be45463251d39@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5d8e8b6c4c794be9867be45463251d39@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Mon, Mar 07, 2022 at 11:13:02AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Monday, March 7, 2022 4:24 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> qemu-devel@nongnu.org
>> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>>
>> On Sat, Mar 05, 2022 at 07:07:54AM +0000, Longpeng (Mike, Cloud Infrastructure
>> Service Product Dept.) wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> Sent: Wednesday, January 19, 2022 7:31 PM
>> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> <longpeng2@huawei.com>
>> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> qemu-devel@nongnu.org
>> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>> >>
>> >> On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
>> >> >From: Longpeng <longpeng2@huawei.com>
>> >> >
>> >> >Implements the .realize interface.
>> >> >
>> >> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >> >---
>> >> > hw/virtio/vdpa-dev.c         | 101 +++++++++++++++++++++++++++++++++++
>> >> > include/hw/virtio/vdpa-dev.h |   8 +++
>> >> > 2 files changed, 109 insertions(+)
>> >> >
>> >> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> >> >index b103768f33..bd28cf7a15 100644
>> >> >--- a/hw/virtio/vdpa-dev.c
>> >> >+++ b/hw/virtio/vdpa-dev.c
>> >> >@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long
>> >> int cmd, Error **errp)
>> >> >     return val;
>> >> > }
>> >> >
>> >> >+static void
>> >> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>> >> >+{
>> >> >+    /* Nothing to do */
>> >> >+}
>> >> >+
>> >> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>> >> > {
>> >> >+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> >> >+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> >> >+    uint32_t vdev_id, max_queue_size;
>> >> >+    struct vhost_virtqueue *vqs;
>> >> >+    int i, ret;
>> >> >+
>> >> >+    if (s->vdpa_dev_fd == -1) {
>> >> >+        s->vdpa_dev_fd = qemu_open(s->vdpa_dev, O_RDWR, errp);
>> >>
>> >> So, here we are re-opening the `vdpa_dev` again (without checking if it
>> >> is NULL).
>> >>
>> >> And we re-do the same ioctls already done in
>> >> vhost_vdpa_device_pci_realize(), so I think we should do them in a
>> >> single place, and that place should be here.
>> >>
>> >> So, what about doing all the ioctls here, setting appropriate fields in
>> >> VhostVdpaDevice, then using that fields in
>> >> vhost_vdpa_device_pci_realize() after qdev_realize() to set
>> >> `class_code`, `trans_devid`, and `nvectors`?
>> >>
>> >
>> >vhost_vdpa_device_pci_realize()
>> >  qdev_realize()
>> >    virtio_device_realize()
>> >      vhost_vdpa_device_realize()
>> >      virtio_bus_device_plugged()
>> >        virtio_pci_device_plugged()
>> >
>> >These three fields would be used in virtio_pci_device_plugged(), so it's too
>> >late to set them after qdev_realize().  And they belong to VirtIOPCIProxy, so
>> >we cannot set them in vhost_vdpa_device_realize() which is transport layer
>> >independent.
>>
>> Maybe I expressed myself wrong, I was saying to open the file and make
>> ioctls in vhost_vdpa_device_realize(). Save the values we use on both
>> sides in VhostVdpaDevice (e.g. num_queues, queue_size) and use these
>> saved values in virtio_pci_device_plugged() without re-opening the file
>> again.
>>
>
>This means we need to access VhostVdpaDevice in virtio_pci_device_plugged()?

Yep, or implement some functions to get those values.

Stefano


