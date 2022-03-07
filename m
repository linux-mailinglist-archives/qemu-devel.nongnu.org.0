Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8EF4CF483
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 10:17:15 +0100 (CET)
Received: from localhost ([::1]:46950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR9UP-0003vg-ON
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 04:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nR9Qr-0002Tv-VC
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:13:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nR9Qo-0003bx-Mp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 04:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646644409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hLtghKZxM+jNQfWW9rEN3ATOt4AdjEDX0nL7SYFD3h4=;
 b=VOBaD+mHtW8VWPFXBKHoZvEdDGUd1/rGk2QYUhQlWU7RQxZcJtp8Zx0xp+9020CIVwRiZI
 z23W/2O8NWFHN0B2agIl6uL/vxkG1kNZQXhiyYPKA9IKR00ohxqo7j0384G9yn8mh+N1aU
 XU/ChQfLPBqwsbV3ioWER1iKk0SyVfE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-iqxVQc0MO3G3kiRaEVV1Lg-1; Mon, 07 Mar 2022 04:13:28 -0500
X-MC-Unique: iqxVQc0MO3G3kiRaEVV1Lg-1
Received: by mail-qt1-f197.google.com with SMTP id
 r13-20020ac85c8d000000b002e0234f9bb5so12164869qta.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 01:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hLtghKZxM+jNQfWW9rEN3ATOt4AdjEDX0nL7SYFD3h4=;
 b=N9FoVc1StUUMWlJti5YwPttIp5TzMzgdn9vcK/J0qeQcaYtyuXxVL4MWMFf3dSgPM2
 jJAptbkmc72BS0eexQUXWNkLbF/kmlCTUA15g/CI5owkdkS8gAjzVuc8pdxdRBMGhq75
 AJ+uIpxk2I6mHcwiktWakv4/80rDpnnC2ACAVyfIoBxnprbdrEUpz1DTJS4aIGV5yAto
 DSkeTZQkylObx0MLX01r7MIZ6Irrf7qgg7ZaMeSPr8vLO2ebvbLJsP3v3rTjHKN1u2+J
 zVothk3UCSYjeN6QDTuQrfYnjokD2dOzuc4hvHEvtXPSVJu3qDtb8dqeO+WHOK2KXxDQ
 Vpsw==
X-Gm-Message-State: AOAM531M64cRim6NuPwbiMTW9Pgsj25Na3iB17NSwymLFNvs3UtWR4xg
 YT/kigz8shZt3iNdGZJHyJfqw96KoyIhoaFSN7bDW0G7pEA3ltxBZ02SvSuKSIq+UQVEv3jcApV
 zzuc9JFD7XtDEPXU=
X-Received: by 2002:a05:622a:15d3:b0:2de:37dd:d2c9 with SMTP id
 d19-20020a05622a15d300b002de37ddd2c9mr8455269qty.137.1646644407832; 
 Mon, 07 Mar 2022 01:13:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwjbCPqMx2mzOpbRCi4+B+urMcgR6lvvdADdGX7p7zlzsqvt5Dza1Zt++4iHzks8UnWys3jQ==
X-Received: by 2002:a05:622a:15d3:b0:2de:37dd:d2c9 with SMTP id
 d19-20020a05622a15d300b002de37ddd2c9mr8455260qty.137.1646644407617; 
 Mon, 07 Mar 2022 01:13:27 -0800 (PST)
Received: from sgarzare-redhat
 (host-212-171-187-184.pool212171.interbusiness.it. [212.171.187.184])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a05622a1a0400b002de1b1dda9fsm7978213qtb.94.2022.03.07.01.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 01:13:27 -0800 (PST)
Date: Mon, 7 Mar 2022 10:13:21 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the
 instance_init/class_init interface
Message-ID: <20220307091321.3mw2wsinl7xakoos@sgarzare-redhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-5-longpeng2@huawei.com>
 <20220119112344.5tj3ccnoeotc5abb@steredhat>
 <ad7c799715714ec990ea82c8fbef4963@huawei.com>
 <20220307081020.xzfuyquqrxvca2dw@sgarzare-redhat>
 <40c8c74f3bfb4527934c9e082f848593@huawei.com>
MIME-Version: 1.0
In-Reply-To: <40c8c74f3bfb4527934c9e082f848593@huawei.com>
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

On Mon, Mar 07, 2022 at 08:55:35AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Monday, March 7, 2022 4:10 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> qemu-devel@nongnu.org
>> Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the instance_init/class_init
>> interface
>>
>> Hi Longpeng,
>>
>> On Sat, Mar 05, 2022 at 06:06:42AM +0000, Longpeng (Mike, Cloud Infrastructure
>> Service Product Dept.) wrote:
>> >Hi Stefano,
>> >
>> >> -----Original Message-----
>> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> Sent: Wednesday, January 19, 2022 7:24 PM
>> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> <longpeng2@huawei.com>
>> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> qemu-devel@nongnu.org
>> >> Subject: Re: [PATCH v2 04/10] vdpa-dev: implement the
>> instance_init/class_init
>> >> interface
>> >>
>> >> On Mon, Jan 17, 2022 at 08:43:25PM +0800, Longpeng(Mike) via wrote:
>> >> >From: Longpeng <longpeng2@huawei.com>
>> >> >
>> >> >Implements the .instance_init and the .class_init interface.
>> >> >
>> >> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >> >---
>> >> > hw/virtio/vdpa-dev-pci.c     | 52 ++++++++++++++++++++++-
>> >> > hw/virtio/vdpa-dev.c         | 81 +++++++++++++++++++++++++++++++++++-
>> >> > include/hw/virtio/vdpa-dev.h |  5 +++
>> >> > 3 files changed, 134 insertions(+), 4 deletions(-)
>> >> >
>> >> >diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
>> >> >index a5a7b528a9..257538dbdd 100644
>> >> >--- a/hw/virtio/vdpa-dev-pci.c
>> >> >+++ b/hw/virtio/vdpa-dev-pci.c
>> >> >@@ -25,12 +25,60 @@ struct VhostVdpaDevicePCI {
>> >> >
>> >> > static void vhost_vdpa_device_pci_instance_init(Object *obj)
>> >> > {
>> >> >-    return;
>> >> >+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(obj);
>> >> >+
>> >> >+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
>> >> >+                                TYPE_VHOST_VDPA_DEVICE);
>> >> >+    object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
>> >> >+                              "bootindex");
>> >> >+}
>> >> >+
>> >> >+static Property vhost_vdpa_device_pci_properties[] = {
>> >> >+    DEFINE_PROP_END_OF_LIST(),
>> >> >+};
>> >> >+
>> >> >+static void
>> >> >+vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>> >> >+{
>> >> >+    VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
>> >> >+    DeviceState *vdev = DEVICE(&dev->vdev);
>> >> >+    uint32_t vdev_id;
>> >> >+    uint32_t num_queues;
>> >> >+    int fd;
>> >> >+
>> >> >+    fd = qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);
>> >>
>> >> We should use `vdpa_dev_fd` if the user set it, and I think we should
>> >> also check that `vdpa_dev` is not null.
>> >>
>> >
>> >The user can set both 'vdpa_dev_fd' and 'vdpa_dev' now, but how
>> >to make sure the 'vdpa_dev_fd' is really a FD of the 'vdpa_dev' ?
>> >Maybe we should remove 'vdpa_dev_fd' from
>> >'vhost_vdpa_device_properties',
>> >so the user can only set 'vdpa_dev'.
>>
>> This is the same problem that would happen if the user passed a path any
>> file or device (e.g. /dev/null). I believe that on the first operation
>> on it (e.g. an ioctl) we would get an error and exit.
>>
>
>Yes, but how about the 'vdpa_dev_fd' refers to /dev/vhost-vdpa-0 but
>the 'vdpa_dev' refers to /dev/vhost-vdpa-1 ? Should we need to consider
>this case ?

I think we can do as we already do in vhost-scsi and vhost-vsock. If fd 
is set we use that otherwise we use path.

If we want we can also print an error and exit if both are set, since 
IMHO should be set only one of the two.

Thanks,
Stefano


