Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF744CF355
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:12:11 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8TS-00061Y-IE
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:12:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nR8Rx-000483-TK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:10:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nR8Ru-0002Ua-8G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646640633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QpV30/bf7B0nS8FxxwdguyGe8Qn2gJzzLd6v92Ugt60=;
 b=Aus/IwK5vmtMfzaqpDIMy+H40ob3CtDb6AesoE8eiUEvv0VqBMOka457l1UrvTuYLxhdqz
 xTJYrZo8ls1Q9wiehcGReq/dFZPFfVI/aQpFDASGLwjaA+HvdAF6XKR2vAoFJ+vznjnr7H
 Bw/cgDgzDf6Fdt5qc+LdgcRS1qyVG1U=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-0JtKMa5RMiOAU-LXsQPgrg-1; Mon, 07 Mar 2022 03:10:30 -0500
X-MC-Unique: 0JtKMa5RMiOAU-LXsQPgrg-1
Received: by mail-qk1-f198.google.com with SMTP id
 f17-20020a05620a069100b0060dfbbb52cfso10932233qkh.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QpV30/bf7B0nS8FxxwdguyGe8Qn2gJzzLd6v92Ugt60=;
 b=0EEGnoRLqDFt/2hEb2pt5a29ZQ30GQStL1oebjriN3CEX6VO9hGIblqLU64Gr8a6bS
 +TRwyXOecqC09YahTOBi/T+qbGfKbapLbrW/UWi3LetDIB+n8mD0qniI34FZ5lmrSgBc
 96hOYUSCJQJIENjwDeC1akJLtaAFym3bm7izhA7HA1QUJWXDxljzf/EimJRto0E0hHno
 /e69feDzSQOQHCkPMM7h6xDG6160m+aNA5EnEO19p9Iv+wXnWKJs6OAVxGEgEre4Mwtb
 msByDSKxxaAlfd5SOqPyCnk55L1Ofdp1dJgHJKKVsfm0e68i31iIBCCvroF8DWdLZ1US
 tYuQ==
X-Gm-Message-State: AOAM533bMnabdPmJZspHz0JygHgxOAxXvUPhi9oOVPCIAq0LtkAOSuLZ
 yyiomFG9sWFPF+wEDw7BbektCgCQ/LQ0KB9e6KMWdTfj3OYfgOw6nP7bCwb26OmSp3uzsiMl5/v
 AkiDML5rYGOU4iBs=
X-Received: by 2002:ac8:57d0:0:b0:2de:3de3:340e with SMTP id
 w16-20020ac857d0000000b002de3de3340emr8656378qta.621.1646640629962; 
 Mon, 07 Mar 2022 00:10:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl53oQbFJ6/j6mDaL8GINB/zHvz+ZGSf1Juym/czU5FgxZsDFtmJ/WvFBk7+tmSQ6bjH+oBA==
X-Received: by 2002:ac8:57d0:0:b0:2de:3de3:340e with SMTP id
 w16-20020ac857d0000000b002de3de3340emr8656370qta.621.1646640629698; 
 Mon, 07 Mar 2022 00:10:29 -0800 (PST)
Received: from sgarzare-redhat
 (host-212-171-187-184.pool212171.interbusiness.it. [212.171.187.184])
 by smtp.gmail.com with ESMTPSA id
 v13-20020ac8578d000000b002de94b94741sm8458699qta.22.2022.03.07.00.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 00:10:29 -0800 (PST)
Date: Mon, 7 Mar 2022 09:10:20 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the
 instance_init/class_init interface
Message-ID: <20220307081020.xzfuyquqrxvca2dw@sgarzare-redhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-5-longpeng2@huawei.com>
 <20220119112344.5tj3ccnoeotc5abb@steredhat>
 <ad7c799715714ec990ea82c8fbef4963@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ad7c799715714ec990ea82c8fbef4963@huawei.com>
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

Hi Longpeng,

On Sat, Mar 05, 2022 at 06:06:42AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>Hi Stefano,
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Wednesday, January 19, 2022 7:24 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> qemu-devel@nongnu.org
>> Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the instance_init/class_init
>> interface
>>
>> On Mon, Jan 17, 2022 at 08:43:25PM +0800, Longpeng(Mike) via wrote:
>> >From: Longpeng <longpeng2@huawei.com>
>> >
>> >Implements the .instance_init and the .class_init interface.
>> >
>> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >---
>> > hw/virtio/vdpa-dev-pci.c     | 52 ++++++++++++++++++++++-
>> > hw/virtio/vdpa-dev.c         | 81 +++++++++++++++++++++++++++++++++++-
>> > include/hw/virtio/vdpa-dev.h |  5 +++
>> > 3 files changed, 134 insertions(+), 4 deletions(-)
>> >
>> >diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
>> >index a5a7b528a9..257538dbdd 100644
>> >--- a/hw/virtio/vdpa-dev-pci.c
>> >+++ b/hw/virtio/vdpa-dev-pci.c
>> >@@ -25,12 +25,60 @@ struct VhostVdpaDevicePCI {
>> >
>> > static void vhost_vdpa_device_pci_instance_init(Object *obj)
>> > {
>> >-    return;
>> >+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(obj);
>> >+
>> >+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>> >+                                TYPE_VHOST_VDPA_DEVICE);
>> >+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
>> >+                              "bootindex");
>> >+}
>> >+
>> >+static Property vhost_vdpa_device_pci_properties[] = {
>> >+    DEFINE_PROP_END_OF_LIST(),
>> >+};
>> >+
>> >+static void
>> >+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>> >+{
>> >+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
>> >+    DeviceState *vdev = DEVICE(&dev->vdev);
>> >+    uint32_t vdev_id;
>> >+    uint32_t num_queues;
>> >+    int fd;
>> >+
>> >+    fd = qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);
>>
>> We should use `vdpa_dev_fd` if the user set it, and I think we should
>> also check that `vdpa_dev` is not null.
>>
>
>The user can set both 'vdpa_dev_fd' and 'vdpa_dev' now, but how
>to make sure the 'vdpa_dev_fd' is really a FD of the 'vdpa_dev' ?
>Maybe we should remove 'vdpa_dev_fd' from 
>'vhost_vdpa_device_properties',
>so the user can only set 'vdpa_dev'.

This is the same problem that would happen if the user passed a path any 
file or device (e.g. /dev/null). I believe that on the first operation 
on it (e.g. an ioctl) we would get an error and exit.

I think we should allow to specify an fd (as we already do for other 
vhost devices), because it's a common use case when qemu is launched 
from higher layers (e.g. libvirt).

>
>> >+    if (*errp) {
>> >+        return;
>> >+    }
>> >+
>> >+    vdev_id = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_DEVICE_ID, errp);
>> >+    if (*errp) {
>> >+        qemu_close(fd);
>> >+        return;
>> >+    }
>> >+
>> >+    num_queues = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_VQS_NUM,
>> errp);
>>                                                   ^
>> The build fails here, I think this should be VHOST_VDPA_GET_VQS_COUNT
>>
>
>Yes, I sent a wrong version, I'll send v3 later.

Thanks,
Stefano


