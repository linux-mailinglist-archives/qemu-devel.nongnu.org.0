Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3032489579
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:41:14 +0100 (CET)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rAw-0007t8-1c
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:41:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n6r8e-0006Ka-5l
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:38:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1n6r8Y-00066i-Ku
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641807525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=klYGqM7e5Tj4wZ6C/EZoAMDk0MfBM1JSbCnea88atRY=;
 b=eJ8Or2j1KxsN0oa0JVe9PZs9+7B2Fr2dJ1Q/YzgWdAaoZI0uXYTRbLeQrN2djTwCF17dxO
 w2fi5XnZ7xR0jx4XXXsQyO1HRWiQF4izwkPAecftN+VgNMirf7hcidE2Q8ZvCnrLIBNZFH
 m+1GqqzWIagxCirAXU9A5GjVjUnz4OM=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-BqTuFRSGPA2Y-50leFbatA-1; Mon, 10 Jan 2022 04:38:44 -0500
X-MC-Unique: BqTuFRSGPA2Y-50leFbatA-1
Received: by mail-oo1-f71.google.com with SMTP id
 g2-20020a4a9242000000b002da7c459222so8134077ooh.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=klYGqM7e5Tj4wZ6C/EZoAMDk0MfBM1JSbCnea88atRY=;
 b=qUn9RmSGYFUBpLHzTsMuh8iFeCLEU9oUbWARIkaPubMpp2d6hiIMruKn3Xv6Jdo/aA
 KBrqkESH5Ckl9io6oQ1gTjH5lDnjrV5o9xpNyS66IdFAK+uwQc6nn85wtAndpEPAribZ
 cW5cka8x6Z3qWs0RXdsHHGwCBZo85/mzSCiVziwL6H3LbKHmRJI5XKgqumdCFH0620bb
 xmczg/6MCkWvyV0qznva5fJHTGHUWYnjO78doFXknfblIdE4J0Jpd6rrN0K4ir4KP8Cg
 5MQwQ6rsgRcK4qFqCIOIkJqWzKolXQX1d/NCZgo/S+NzY6U7wx2LRgVP/t/TxRRr3jdS
 pqFQ==
X-Gm-Message-State: AOAM532fEiE8xt9bDXW41dpWeuwFS4ciUtwkXk7gEz+qIYIUAvjgADET
 uYAHNnxmcU6N43w8Eh10xzZ9wgENHf9Wj9CWWKWzxNYASKXuNMIMKhM4emCKTjg/9g3qOHTkInt
 SWrJ+ftDXjQuFfRA=
X-Received: by 2002:a9d:5d05:: with SMTP id b5mr13791420oti.306.1641807522986; 
 Mon, 10 Jan 2022 01:38:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMOqEkV/+8Fkr89OfsTh8hyE3/nGphGBFDhpM6g1/9NdUXsFT/zteZtHbSbFhjUaiZJqQp4Q==
X-Received: by 2002:a9d:5d05:: with SMTP id b5mr13791395oti.306.1641807522453; 
 Mon, 10 Jan 2022 01:38:42 -0800 (PST)
Received: from steredhat (host-79-51-11-180.retail.telecomitalia.it.
 [79.51.11.180])
 by smtp.gmail.com with ESMTPSA id e6sm1235831oot.6.2022.01.10.01.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 01:38:41 -0800 (PST)
Date: Mon, 10 Jan 2022 10:38:35 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [RFC 06/10] vdpa-dev: implement the unrealize interface
Message-ID: <20220110093835.6kbgxzycvooxrw7x@steredhat>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-7-longpeng2@huawei.com>
 <20220105111612.epxi3w3ebsaye5mm@steredhat>
 <6e6f7fbb7db8498d985da9e50e65c324@huawei.com>
MIME-Version: 1.0
In-Reply-To: <6e6f7fbb7db8498d985da9e50e65c324@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 03:23:07AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Wednesday, January 5, 2022 7:16 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; jasowang@redhat.com;
>> cohuck@redhat.com; pbonzini@redhat.com; Gonglei (Arei)
>> <arei.gonglei@huawei.com>; Yechuan <yechuan@huawei.com>; Huangzhichao
>> <huangzhichao@huawei.com>; qemu-devel@nongnu.org
>> Subject: Re: [RFC 06/10] vdpa-dev: implement the unrealize interface
>>
>> On Wed, Jan 05, 2022 at 08:58:56AM +0800, Longpeng(Mike) wrote:
>> >From: Longpeng <longpeng2@huawei.com>
>> >
>> >Implements the .unrealize interface.
>> >
>> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >---
>> > hw/virtio/vdpa-dev.c | 22 +++++++++++++++++++++-
>> > 1 file changed, 21 insertions(+), 1 deletion(-)
>> >
>> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> >index 2d534d837a..4e4dd3d201 100644
>> >--- a/hw/virtio/vdpa-dev.c
>> >+++ b/hw/virtio/vdpa-dev.c
>> >@@ -133,9 +133,29 @@ out:
>> >     close(fd);
>> > }
>> >
>> >+static void vhost_vdpa_vdev_unrealize(VhostVdpaDevice *s)
>> >+{
>> >+    VirtIODevice *vdev = VIRTIO_DEVICE(s);
>> >+    int i;
>> >+
>> >+    for (i = 0; i < s->num_queues; i++) {
>>                        ^
>> `s->num_queues` seems uninitialized to me, maybe we could just remove
>> the num_queues field from VhostVdpaDevice, and use `s->dev.nvqs` as in
>> vhost_vdpa_device_realize().
>>
>
>Good catch, I'll fix the bug.
>
>But I think we should keep the num_queues field, we need it if we support
>migration in the next step, right?
>
>> >+        virtio_delete_queue(s->virtqs[i]);
>> >+    }
>> >+    g_free(s->virtqs);
>> >+    virtio_cleanup(vdev);
>> >+
>> >+    g_free(s->config);
>> >+}
>> >+
>> > static void vhost_vdpa_device_unrealize(DeviceState *dev)
>> > {
>> >-    return;
>> >+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> >+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> >+
>> >+    virtio_set_status(vdev, 0);
>> >+    vhost_dev_cleanup(&s->dev);
>>
>> If we will use `s->dev.nvqs` in vhost_vdpa_vdev_unrealize(), we should
>> call vhost_dev_cleanup() after it, just before close() as we already do
>> in the error path of vhost_vdpa_device_realize().
>>
>
>I'll try to fix the above bug first if you agree that we should keep the
>num_queues field.

Yep, if it could be useful, we can keep it.

>
>I just realize that I forgot to free s->dev.vqs here...

Oh right, I miss it too.
We should free it also in the error path of vhost_vdpa_device_realize().

Thanks,
Stefano


