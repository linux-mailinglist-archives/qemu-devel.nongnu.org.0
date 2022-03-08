Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB09C4D1281
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:43:08 +0100 (CET)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVQx-0004yb-SI
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:43:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nRVPb-0003SO-Ua
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:41:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1nRVPY-0002Af-P0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646728899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CyDwKbLL18SNKBpobpVCGieYbLNPvQSyLpkb+iVp8OY=;
 b=gAMc47d3FRGc2WMtjy/3JUi7ZJTwLuWrp7/B0usTcyDeqiwDryJExqJWPjVobnYSm+GeL8
 DqPluTFCy90N2HIXQeNSkzY888CNg8x7imToaVoUKdrU2Wa+/ijFSyybwJIwuna98syDpy
 jCFjiO/u5JV70B5MldFmoOm2+jmEAsI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-b3CZfzizPBe7jNVStUJ6tg-1; Tue, 08 Mar 2022 03:41:38 -0500
X-MC-Unique: b3CZfzizPBe7jNVStUJ6tg-1
Received: by mail-qk1-f199.google.com with SMTP id
 v16-20020a376110000000b0067b2749e0fbso4734984qkb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 00:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CyDwKbLL18SNKBpobpVCGieYbLNPvQSyLpkb+iVp8OY=;
 b=CkriD4IX67NB4XidHhD+FSHLV53sIP+UkBWs/cOEaEyvqwB0FckzivBKjXEkx2TLLs
 FB5Oy2P/hng0Twahh/gmCpCYuov2ra3i+Og7I8ZDqoGmLtSVYJAtEoSBSEMP0VFftU63
 UpmxlrGxWt5AO6Fa2mo1+pJ8r7xowNV8ys/o5cadLERkmGIm6AdRinpa7cmItRdD7TLB
 tg1lVcuqDtm7yNdVTpwWl1Q/Dplp5P6mY+v+1/Axgi1jijlF+HJKaCpMRZc07ZSxtktE
 RIBXmCQeuTupv2Vv4ZHStFqR5qWOIiYwZFj78WFPs2Y0yVrZjQBuBYlGzwGEnFnO9E29
 j3Xg==
X-Gm-Message-State: AOAM533q3qB3Ej8ASfGxH9jt4jPloQV66iYA5syYAVvOa48AyZyxulrF
 uf62+C+QNMvjugXY0NILRvw3eNJjTGPN4TewigrQ/LQ87v51FsppL99iqS4xNj/RCZjFdy/dm43
 fUGPLWH1r1xzrY5I=
X-Received: by 2002:ad4:5347:0:b0:42c:4711:5eb5 with SMTP id
 v7-20020ad45347000000b0042c47115eb5mr11203183qvs.101.1646728896891; 
 Tue, 08 Mar 2022 00:41:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx65KHoVioaqDJut+5t9Py1QH18u5GWr9d3FTGTCSrcoRodeRuD2lpXNtNQO25zLYWGZSO/eg==
X-Received: by 2002:ad4:5347:0:b0:42c:4711:5eb5 with SMTP id
 v7-20020ad45347000000b0042c47115eb5mr11203168qvs.101.1646728896604; 
 Tue, 08 Mar 2022 00:41:36 -0800 (PST)
Received: from sgarzare-redhat (host-212-171-187-184.retail.telecomitalia.it.
 [212.171.187.184]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05620a01e900b00508a7bf4897sm7049666qkn.130.2022.03.08.00.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:41:35 -0800 (PST)
Date: Tue, 8 Mar 2022 09:41:29 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
Message-ID: <20220308084129.jsutymus52nzvft4@sgarzare-redhat>
References: <20220117124331.1642-1-longpeng2@huawei.com>
 <20220117124331.1642-6-longpeng2@huawei.com>
 <20220119113042.a4dmwe4tnfsabnmn@steredhat>
 <c671639270f6459d8c2f389dfd1cc04a@huawei.com>
 <20220307082341.qr3jwzygqxo7kx3o@sgarzare-redhat>
 <5d8e8b6c4c794be9867be45463251d39@huawei.com>
 <20220307121426.ecuy4doxuz7g6d2o@sgarzare-redhat>
 <c102cbc9856a42c888a64767c3265325@huawei.com>
MIME-Version: 1.0
In-Reply-To: <c102cbc9856a42c888a64767c3265325@huawei.com>
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

On Tue, Mar 08, 2022 at 03:19:55AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>> -----Original Message-----
>> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> Sent: Monday, March 7, 2022 8:14 PM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> qemu-devel@nongnu.org
>> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>>
>> On Mon, Mar 07, 2022 at 11:13:02AM +0000, Longpeng (Mike, Cloud Infrastructure
>> Service Product Dept.) wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> Sent: Monday, March 7, 2022 4:24 PM
>> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> <longpeng2@huawei.com>
>> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> qemu-devel@nongnu.org
>> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>> >>
>> >> On Sat, Mar 05, 2022 at 07:07:54AM +0000, Longpeng (Mike, Cloud Infrastructure
>> >> Service Product Dept.) wrote:
>> >> >
>> >> >
>> >> >> -----Original Message-----
>> >> >> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
>> >> >> Sent: Wednesday, January 19, 2022 7:31 PM
>> >> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> >> >> <longpeng2@huawei.com>
>> >> >> Cc: stefanha@redhat.com; mst@redhat.com; cohuck@redhat.com;
>> >> >> pbonzini@redhat.com; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
>> >> >> <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>;
>> >> >> qemu-devel@nongnu.org
>> >> >> Subject: Re: [PATCH v2 05/10] vdpa-dev: implement the realize interface
>> >> >>
>> >> >> On Mon, Jan 17, 2022 at 08:43:26PM +0800, Longpeng(Mike) via wrote:
>> >> >> >From: Longpeng <longpeng2@huawei.com>
>> >> >> >
>> >> >> >Implements the .realize interface.
>> >> >> >
>> >> >> >Signed-off-by: Longpeng <longpeng2@huawei.com>
>> >> >> >---
>> >> >> > hw/virtio/vdpa-dev.c         | 101 +++++++++++++++++++++++++++++++++++
>> >> >> > include/hw/virtio/vdpa-dev.h |   8 +++
>> >> >> > 2 files changed, 109 insertions(+)
>> >> >> >
>> >> >> >diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> >> >> >index b103768f33..bd28cf7a15 100644
>> >> >> >--- a/hw/virtio/vdpa-dev.c
>> >> >> >+++ b/hw/virtio/vdpa-dev.c
>> >> >> >@@ -27,9 +27,109 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned
>> long
>> >> >> int cmd, Error **errp)
>> >> >> >     return val;
>> >> >> > }
>> >> >> >
>> >> >> >+static void
>> >> >> >+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue
>> *vq)
>> >> >> >+{
>> >> >> >+    /* Nothing to do */
>> >> >> >+}
>> >> >> >+
>> >> >> > static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>> >> >> > {
>> >> >> >+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>> >> >> >+    VhostVdpaDevice *s = VHOST_VDPA_DEVICE(vdev);
>> >> >> >+    uint32_t vdev_id, max_queue_size;
>> >> >> >+    struct vhost_virtqueue *vqs;
>> >> >> >+    int i, ret;
>> >> >> >+
>> >> >> >+    if (s->vdpa_dev_fd == -1) {
>> >> >> >+        s->vdpa_dev_fd = qemu_open(s->vdpa_dev, O_RDWR, errp);
>> >> >>
>> >> >> So, here we are re-opening the `vdpa_dev` again (without checking if it
>> >> >> is NULL).
>> >> >>
>> >> >> And we re-do the same ioctls already done in
>> >> >> vhost_vdpa_device_pci_realize(), so I think we should do them in a
>> >> >> single place, and that place should be here.
>> >> >>
>> >> >> So, what about doing all the ioctls here, setting appropriate fields in
>> >> >> VhostVdpaDevice, then using that fields in
>> >> >> vhost_vdpa_device_pci_realize() after qdev_realize() to set
>> >> >> `class_code`, `trans_devid`, and `nvectors`?
>> >> >>
>> >> >
>> >> >vhost_vdpa_device_pci_realize()
>> >> >  qdev_realize()
>> >> >    virtio_device_realize()
>> >> >      vhost_vdpa_device_realize()
>> >> >      virtio_bus_device_plugged()
>> >> >        virtio_pci_device_plugged()
>> >> >
>> >> >These three fields would be used in virtio_pci_device_plugged(), so it's
>> too
>> >> >late to set them after qdev_realize().  And they belong to VirtIOPCIProxy,
>> so
>> >> >we cannot set them in vhost_vdpa_device_realize() which is 
>> >> >transport layer
>> >> >independent.
>> >>
>> >> Maybe I expressed myself wrong, I was saying to open the file and make
>> >> ioctls in vhost_vdpa_device_realize(). Save the values we use on both
>> >> sides in VhostVdpaDevice (e.g. num_queues, queue_size) and use these
>> >> saved values in virtio_pci_device_plugged() without re-opening the file
>> >> again.
>> >>
>> >
>> >This means we need to access VhostVdpaDevice in virtio_pci_device_plugged()?
>>
>> Yep, or implement some functions to get those values.
>>
>
>I prefer not to modify the VIRTIO or the VIRTIO_PCI core too much.

Yeah, I was not thinking of modifying virtio or virtio_pci core either.

>How about the following proposal?
>
>struct VhostVdpaDevice {
>    ...
>    void (*post_init)(VhostVdpaDevice *vdpa_dev);
>    ...
>}
>
>vhost_vdpa_device_pci_post_init(VhostVdpaDevice *vdpa_dev)
>{
>    ...
>    vpci_dev->class_code = virtio_pci_get_class_id(vdpa_dev->vdev_id);
>    vpci_dev->trans_devid = 
>    virtio_pci_get_trans_devid(vdpa_dev->vdev_id);
>    vpci_dev->nvectors = vdpa_dev->num_queues + 1;
>    ...
>}
>
>vhost_vdpa_device_pci_realize():
>    post_init = vhost_vdpa_device_pci_post_init;
>
>vhost_vdpa_device_realize()
>{
>    ...
>    Open the file.
>    Set vdpa_dev->vdev_id, vdpa_dev->vdev_id, vdpa_dev->num_queues
>    ...
>    if (vdpa_dev->post_init) {
>        vdpa_dev->post_init(vdpa_dev);
>    }
>    ...
>}

I was honestly thinking of something simpler: call qdev_realize() to 
realize the VhostVdpaDevice object and then query VhostVdpaDevice for 
the id and number of queues.

Something like this (untested):

diff --git a/include/hw/virtio/vdpa-dev.h b/include/hw/virtio/vdpa-dev.h
index e0482035cf..9d5f90eacc 100644
--- a/include/hw/virtio/vdpa-dev.h
+++ b/include/hw/virtio/vdpa-dev.h
@@ -25,5 +25,7 @@ struct VhostVdpaDevice {
  };

  uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp);
+uint32_t vhost_vdpa_device_get_vdev_id(VhostVdpaDevice *s);
+uint32_t vhost_vdpa_device_get_num_queues(VhostVdpaDevice *s);

  #endif
diff --git a/hw/virtio/vdpa-dev-pci.c b/hw/virtio/vdpa-dev-pci.c
index 257538dbdd..5eace2f79e 100644
--- a/hw/virtio/vdpa-dev-pci.c
+++ b/hw/virtio/vdpa-dev-pci.c
@@ -43,32 +43,16 @@ vhost_vdpa_device_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
      VhostVdpaDevicePCI *dev = VHOST_VDPA_DEVICE_PCI(vpci_dev);
      DeviceState *vdev = DEVICE(&dev->vdev);
      uint32_t vdev_id;
-    uint32_t num_queues;
-    int fd;

-    fd = qemu_open(dev->vdev.vdpa_dev, O_RDWR, errp);
-    if (*errp) {
+    if (!qdev_realize(vdev, BUS(&vpci_dev->bus), errp)) {
          return;
      }

-    vdev_id = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_DEVICE_ID, errp);
-    if (*errp) {
-        qemu_close(fd);
-        return;
-    }
-
-    num_queues = vhost_vdpa_device_get_u32(fd, VHOST_VDPA_GET_VQS_NUM, errp);
-    if (*errp) {
-        qemu_close(fd);
-        return;
-    }
-
-    dev->vdev.vdpa_dev_fd = fd;
+    vdev_id = vhost_vdpa_device_get_vdev_id(&dev->vdev);
      vpci_dev->class_code = virtio_pci_get_class_id(vdev_id);
      vpci_dev->trans_devid = virtio_pci_get_trans_devid(vdev_id);
      /* one for config interrupt, one per vq */
-    vpci_dev->nvectors = num_queues + 1;
-    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+    vpci_dev->nvectors = vhost_vdpa_device_get_num_queues(&dev->vdev) + 1;
  }

  static void vhost_vdpa_device_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
index 65511243f9..3bf3040e26 100644
--- a/hw/virtio/vdpa-dev.c
+++ b/hw/virtio/vdpa-dev.c
@@ -27,6 +27,14 @@ uint32_t vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
      return val;
  }

+uint32_t vhost_vdpa_device_get_vdev_id(VhostVdpaDevice *s) {
+    return s->vdev_id;
+}
+
+uint32_t vhost_vdpa_device_get_num_queues(VhostVdpaDevice *s) {
+    return s->num_queues;
+}
+
  static void
  vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
  {

Cheers,
Stefano


