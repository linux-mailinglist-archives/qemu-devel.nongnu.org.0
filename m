Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8657B4CF37E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:25:09 +0100 (CET)
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8g0-0008PK-5t
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:25:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nR8eq-0007ia-0u
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nR8ek-0004hs-Ha
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:23:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646641429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+8+IT/I37eE+H5Ox1NNX10JqzNe1xtWjb89B3Vpa5A=;
 b=GdKoGeKOnP40E0ln/m8xF2vdoj7yyvYLojW6nA6HXnKasoM+lxWld/HZcv8u58/jPqkoiE
 N4SQqBROxdHHOreTFK1HmfWFyj+zNFF+6hDY7/bShzfsJyjPOF3vt1uWNkkJ+t6S/lntab
 Fc143ZaymnKN6ShejOLD0tPQt0sSpyQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-u-1G66wNOqCOb6fxsyipdw-1; Mon, 07 Mar 2022 03:23:48 -0500
X-MC-Unique: u-1G66wNOqCOb6fxsyipdw-1
Received: by mail-qv1-f72.google.com with SMTP id
 kd18-20020a056214401200b0042de5c14702so12389504qvb.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:23:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c+8+IT/I37eE+H5Ox1NNX10JqzNe1xtWjb89B3Vpa5A=;
 b=JFoYUsZP/h6tzcC9C91nDOn7ZGAYQ39VCTBZgX2zSXRbvwUj3uQ6w8P/hqxMZcOuOj
 hYvXhiLHLiZrWt/SdAvuHzsOdcpPDM5E/ozC7JCjtkNfheK+ZnZveQ/Hy/Okw3taGDS+
 cgmRwM37JTZCfA+dbY8PI6gTDFQZ92gxl5amEkALmdiB+77N5+gav7dSJwFfU8IGZhhg
 +G3uRm0sTdG/tAITBhKK3ElSnNoFhu1TZj1mlAB9/aR4jo9INL8/ksXoyZaPZQQlOTj2
 keDgeLfGH94I4EWGpfWqREuG8dvtMXEynILaN786qxOsxm0mrywjJFQaV3dk2zlQ71Eq
 ZRjQ==
X-Gm-Message-State: AOAM533zzKEo8/KzrmgJseZJbeRRf2esds2eC12qQqqCzNomAsL6pLNx
 hk8qzp7yVmQ7iWZbTlG3MZgZKxK4dvRsMNJLsPQPHEhCKwtukEb+FqfYDctv5vYgDvtoNeMSa6x
 H8oYWOBTrEeB0PqQ=
X-Received: by 2002:ad4:5389:0:b0:42d:a3cf:1b67 with SMTP id
 i9-20020ad45389000000b0042da3cf1b67mr7369233qvv.129.1646641427998; 
 Mon, 07 Mar 2022 00:23:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8JvGRH1XS562+BCZGBhWdw9vg4Hh8LW060QLskJ5i/6T4EYbXAJIprwuU9f0zms4FDnBwyA==
X-Received: by 2002:ad4:5389:0:b0:42d:a3cf:1b67 with SMTP id
 i9-20020ad45389000000b0042da3cf1b67mr7369221qvv.129.1646641427754; 
 Mon, 07 Mar 2022 00:23:47 -0800 (PST)
Received: from sgarzare-redhat
 (host-212-171-187-184.pool212171.interbusiness.it. [212.171.187.184])
 by smtp.gmail.com with ESMTPSA id
 b1-20020ac87fc1000000b002e05fe85d44sm3607565qtk.47.2022.03.07.00.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:23:47 -0800 (PST)
Date: Mon, 7 Mar 2022 09:23:41 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Message-ID: <20220307082341.qr3jwzygqxo7kx3o@sgarzare-redhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
 <20220119113042.a4dmwe4tnfsabnmn@steredhat>
 <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
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

On Sat, Mar 05, 2022 at 07:07:54AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Wednesday, January 19, 2022 7:31 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> qemu-devel@nongnu.org
>> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>>
>> On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
>> >From: Longpeng <longpeng2@huawei.com>
>> >
>> >Implements the .realize interface.
>> >
>> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >---
>> > hw/virtio/vdpa-dev.c         | 101 +++++++++++++++++++++++++++++++++++
>> > include/hw/virtio/vdpa-dev.h |   8 +++
>> > 2 files changed, 109 insertions(+)
>> >
>> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> >index b103768f33..bd28cf7a15 100644
>> >--- a/hw/virtio/vdpa-dev.c
>> >+++ b/hw/virtio/vdpa-dev.c
>> >@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long
>> int cmd, Error **errp)
>> >     return val;
>> > }
>> >
>> >+static void
>> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>> >+{
>> >+    /* Nothing to do */
>> >+}
>> >+
>> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>> > {
>> >+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> >+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> >+    uint32_t vdev_id, max_queue_size;
>> >+    struct vhost_virtqueue *vqs;
>> >+    int i, ret;
>> >+
>> >+    if (s->vdpa_dev_fd == -1) {
>> >+        s->vdpa_dev_fd = qemu_open(s->vdpa_dev, O_RDWR, errp);
>>
>> So, here we are re-opening the `vdpa_dev` again (without checking if it
>> is NULL).
>>
>> And we re-do the same ioctls already done in
>> vhost_vdpa_device_pci_realize(), so I think we should do them in a
>> single place, and that place should be here.
>>
>> So, what about doing all the ioctls here, setting appropriate fields in
>> VhostVdpaDevice, then using that fields in
>> vhost_vdpa_device_pci_realize() after qdev_realize() to set
>> `class_code`, `trans_devid`, and `nvectors`?
>>
>
>vhost_vdpa_device_pci_realize()
>  qdev_realize()
>    virtio_device_realize()
>      vhost_vdpa_device_realize()
>      virtio_bus_device_plugged()
>        virtio_pci_device_plugged()
>
>These three fields would be used in virtio_pci_device_plugged(), so it's too
>late to set them after qdev_realize().  And they belong to VirtIOPCIProxy, so
>we cannot set them in vhost_vdpa_device_realize() which is transport layer
>independent.

Maybe I expressed myself wrong, I was saying to open the file and make 
ioctls in vhost_vdpa_device_realize(). Save the values we use on both 
sides in VhostVdpaDevice (e.g. num_queues, queue_size) and use these 
saved values in virtio_pci_device_plugged() without re-opening the file 
again.

Can't we set `class_code`, `trans_devid`, and `nvectors` after calling 
qdev_realize()?

Thanks,
Stefano


