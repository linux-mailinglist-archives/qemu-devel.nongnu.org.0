Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748E30C42F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:44:57 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xrM-0001Ht-2G
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xVh-0003R8-J6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:22:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l6xVX-0002z5-KU
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612279340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ong1GkdT0BdhwEoV9qdLEHGI9i35eWRtkFgpntdqfWY=;
 b=JZ+kS6s4JFEyqM5PSUJBRujpCWyfYsvON0t0mVJj5GlvBYHerKSXDmnAoXUt0x6OOhI0Xr
 eG41VxhxZ1a3hgHhVknUaqF9I0you4tzpx5D5yxyRrpnOgCcS5ajCswCHAg0RLSQKNsNa+
 bOD+2CLoRTsihf+hjcVnDmTS+xfXqEE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-JlGH-5TMPyCiQOrrw8-fog-1; Tue, 02 Feb 2021 10:12:36 -0500
X-MC-Unique: JlGH-5TMPyCiQOrrw8-fog-1
Received: by mail-wm1-f72.google.com with SMTP id k64so1582112wmb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ong1GkdT0BdhwEoV9qdLEHGI9i35eWRtkFgpntdqfWY=;
 b=skL85gdOAUfOG+rWm/L4rRvxrhYxT7g31HW5j3AeVel7ml5K76zBR+AnoMuNkNE1s7
 u4mZiq1Vco2E3nnKDvWBZK18gC7jQ0OiVPceot6inoaFOkFeNpE31sSyCuPxA0AwZMhq
 sGRIYzQa1VxQXEdI3wG0Jdlv9VXhs88TXRMuhlLn7n2OY0lU6tjbA1CPlIqsl9SsLgBG
 +ZDUdQkDJTzZlF5OGy+lYmKuly6BuExb072p8d1N5px4fvYb7ihtLD1k/puk+7d7EECi
 +ffW6X56ehf+Z7r7vJQjePvs4APJFDzmeKKS+kvHnzPyiqyFKF0wf6BWTvpi6pumvLGE
 O/AQ==
X-Gm-Message-State: AOAM533Ioaeo7sZv2yBLdvOydKaeXhsrflkypmfB+z2/MLzPuNe1Os5T
 1WhNYoJeA9CIdwN9RfpJgy7ps8bnmlbdxPF2VAsFxuoGp9fbAm4sJiuWsJn+9ciYcgU7XkITFQv
 2zkxULf+5RZEuu4FqCD1N5N1dzIqH7GuZbtuKo1jUvFSjD3tvX2J1c8IcbzVX
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr23535474wrv.303.1612278755009; 
 Tue, 02 Feb 2021 07:12:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8AKGWC7xzpj9rvUgIL+UN81Wd1PmtjQINJsRirrY48qq/XIPVr0iMFUqlJpIj1DazhyuKXg==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr23535450wrv.303.1612278754736; 
 Tue, 02 Feb 2021 07:12:34 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id n10sm2665113wro.39.2021.02.02.07.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:12:34 -0800 (PST)
Date: Tue, 2 Feb 2021 10:12:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] virtio: Add corresponding memory_listener_unregister to
 unrealize
Message-ID: <20210202151116.1573669-4-mst@redhat.com>
References: <20210202151116.1573669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202151116.1573669-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Address space is destroyed without proper removal of its listeners with
current code. They are expected to be removed in
virtio_device_instance_finalize [1], but qemu calls it through
object_deinit, after address_space_destroy call through
device_set_realized [2].

Move it to virtio_device_unrealize, called before device_set_realized
[3] and making it symmetric with memory_listener_register in
virtio_device_realize.

v2: Delete no-op call of virtio_device_instance_finalize.
    Add backtraces.

[1]

 #0  virtio_device_instance_finalize (obj=0x555557de5120)
     at /home/qemu/include/hw/virtio/virtio.h:71
 #1  0x0000555555b703c9 in object_deinit (type=0x555556639860,
      obj=<optimized out>) at ../qom/object.c:671
 #2  object_finalize (data=0x555557de5120) at ../qom/object.c:685
 #3  object_unref (objptr=0x555557de5120) at ../qom/object.c:1184
 #4  0x0000555555b4de9d in bus_free_bus_child (kid=0x555557df0660)
     at ../hw/core/qdev.c:55
 #5  0x0000555555c65003 in call_rcu_thread (opaque=opaque@entry=0x0)
     at ../util/rcu.c:281

Queued by:

 #0  bus_remove_child (bus=0x555557de5098,
     child=child@entry=0x555557de5120) at ../hw/core/qdev.c:60
 #1  0x0000555555b4ee31 in device_unparent (obj=<optimized out>)
     at ../hw/core/qdev.c:984
 #2  0x0000555555b70465 in object_finalize_child_property (
     obj=<optimized out>, name=<optimized out>, opaque=0x555557de5120)
     at ../qom/object.c:1725
 #3  0x0000555555b6fa17 in object_property_del_child (
     child=0x555557de5120, obj=0x555557ddcf90) at ../qom/object.c:645
 #4  object_unparent (obj=0x555557de5120) at ../qom/object.c:664
 #5  0x0000555555b4c071 in bus_unparent (obj=<optimized out>)
     at ../hw/core/bus.c:147
 #6  0x0000555555b70465 in object_finalize_child_property (
     obj=<optimized out>, name=<optimized out>, opaque=0x555557de5098)
     at ../qom/object.c:1725
 #7  0x0000555555b6fa17 in object_property_del_child (
     child=0x555557de5098, obj=0x555557ddcf90) at ../qom/object.c:645
 #8  object_unparent (obj=0x555557de5098) at ../qom/object.c:664
 #9  0x0000555555b4ee19 in device_unparent (obj=<optimized out>)
     at ../hw/core/qdev.c:981
 #10 0x0000555555b70465 in object_finalize_child_property (
     obj=<optimized out>, name=<optimized out>, opaque=0x555557ddcf90)
     at ../qom/object.c:1725
 #11 0x0000555555b6fa17 in object_property_del_child (
     child=0x555557ddcf90, obj=0x55555685da10) at ../qom/object.c:645
 #12 object_unparent (obj=0x555557ddcf90) at ../qom/object.c:664
 #13 0x00005555558dc331 in pci_for_each_device_under_bus (
     opaque=<optimized out>, fn=<optimized out>, bus=<optimized out>)
     at ../hw/pci/pci.c:1654

[2]

Optimizer omits pci_qdev_unrealize, called by device_set_realized, and
do_pci_unregister_device, called by pci_qdev_unrealize and caller of
address_space_destroy.

 #0  address_space_destroy (as=0x555557ddd1b8)
     at ../softmmu/memory.c:2840
 #1  0x0000555555b4fc53 in device_set_realized (obj=0x555557ddcf90,
      value=<optimized out>, errp=0x7fffeea8f1e0)
     at ../hw/core/qdev.c:850
 #2  0x0000555555b6eaa6 in property_set_bool (obj=0x555557ddcf90,
      v=<optimized out>, name=<optimized out>, opaque=0x555556650ba0,
     errp=0x7fffeea8f1e0) at ../qom/object.c:2255
 #3  0x0000555555b70e07 in object_property_set (
      obj=obj@entry=0x555557ddcf90,
      name=name@entry=0x555555db99df "realized",
      v=v@entry=0x7fffe46b7500,
      errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1400
 #4  0x0000555555b73c5f in object_property_set_qobject (
      obj=obj@entry=0x555557ddcf90,
      name=name@entry=0x555555db99df "realized",
      value=value@entry=0x7fffe44f6180,
      errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/qom-qobject.c:28
 #5  0x0000555555b71044 in object_property_set_bool (
      obj=0x555557ddcf90, name=0x555555db99df "realized",
      value=<optimized out>, errp=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1470
 #6  0x0000555555921cb7 in pcie_unplug_device (bus=<optimized out>,
      dev=0x555557ddcf90,
      opaque=<optimized out>) at /home/qemu/include/hw/qdev-core.h:17
 #7  0x00005555558dc331 in pci_for_each_device_under_bus (
      opaque=<optimized out>, fn=<optimized out>,
      bus=<optimized out>) at ../hw/pci/pci.c:1654

[3]

 #0  virtio_device_unrealize (dev=0x555557de5120)
     at ../hw/virtio/virtio.c:3680
 #1  0x0000555555b4fc63 in device_set_realized (obj=0x555557de5120,
     value=<optimized out>, errp=0x7fffee28df90)
     at ../hw/core/qdev.c:850
 #2  0x0000555555b6eab6 in property_set_bool (obj=0x555557de5120,
     v=<optimized out>, name=<optimized out>, opaque=0x555556650ba0,
     errp=0x7fffee28df90) at ../qom/object.c:2255
 #3  0x0000555555b70e17 in object_property_set (
     obj=obj@entry=0x555557de5120,
     name=name@entry=0x555555db99ff "realized",
     v=v@entry=0x7ffdd8035040,
     errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1400
 #4  0x0000555555b73c6f in object_property_set_qobject (
     obj=obj@entry=0x555557de5120,
     name=name@entry=0x555555db99ff "realized",
     value=value@entry=0x7ffdd8035020,
     errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/qom-qobject.c:28
 #5  0x0000555555b71054 in object_property_set_bool (
     obj=0x555557de5120, name=name@entry=0x555555db99ff "realized",
     value=value@entry=false, errp=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1470
 #6  0x0000555555b4edc5 in qdev_unrealize (dev=<optimized out>)
     at ../hw/core/qdev.c:403
 #7  0x0000555555b4c2a9 in bus_set_realized (obj=<optimized out>,
     value=<optimized out>, errp=<optimized out>)
     at ../hw/core/bus.c:204
 #8  0x0000555555b6eab6 in property_set_bool (obj=0x555557de5098,
     v=<optimized out>, name=<optimized out>, opaque=0x555557df04c0,
     errp=0x7fffee28e0a0) at ../qom/object.c:2255
 #9  0x0000555555b70e17 in object_property_set (
     obj=obj@entry=0x555557de5098,
     name=name@entry=0x555555db99ff "realized",
     v=v@entry=0x7ffdd8034f50,
     errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1400
 #10 0x0000555555b73c6f in object_property_set_qobject (
     obj=obj@entry=0x555557de5098,
     name=name@entry=0x555555db99ff "realized",
     value=value@entry=0x7ffdd8020630,
     errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/qom-qobject.c:28
 #11 0x0000555555b71054 in object_property_set_bool (
     obj=obj@entry=0x555557de5098,
     name=name@entry=0x555555db99ff "realized",
     value=value@entry=false, errp=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1470
 #12 0x0000555555b4c725 in qbus_unrealize (
     bus=bus@entry=0x555557de5098) at ../hw/core/bus.c:178
 #13 0x0000555555b4fc00 in device_set_realized (obj=0x555557ddcf90,
     value=<optimized out>, errp=0x7fffee28e1e0)
     at ../hw/core/qdev.c:844
 #14 0x0000555555b6eab6 in property_set_bool (obj=0x555557ddcf90,
     v=<optimized out>, name=<optimized out>, opaque=0x555556650ba0,
     errp=0x7fffee28e1e0) at ../qom/object.c:2255
 #15 0x0000555555b70e17 in object_property_set (
     obj=obj@entry=0x555557ddcf90,
     name=name@entry=0x555555db99ff "realized",
     v=v@entry=0x7ffdd8020560,
     errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1400
 #16 0x0000555555b73c6f in object_property_set_qobject (
     obj=obj@entry=0x555557ddcf90,
     name=name@entry=0x555555db99ff "realized",
     value=value@entry=0x7ffdd8020540,
     errp=errp@entry=0x5555565bbf38 <error_abort>)
     at ../qom/qom-qobject.c:28
 #17 0x0000555555b71054 in object_property_set_bool (
     obj=0x555557ddcf90, name=0x555555db99ff "realized",
     value=<optimized out>, errp=0x5555565bbf38 <error_abort>)
     at ../qom/object.c:1470
 #18 0x0000555555921cb7 in pcie_unplug_device (bus=<optimized out>,
     dev=0x555557ddcf90, opaque=<optimized out>)
     at /home/qemu/include/hw/qdev-core.h:17
 #19 0x00005555558dc331 in pci_for_each_device_under_bus (
     opaque=<optimized out>, fn=<optimized out>, bus=<optimized out>)
     at ../hw/pci/pci.c:1654

Fixes: c611c76417f ("virtio: add MemoryListener to cache ring translations")
Buglink: https://bugs.launchpad.net/qemu/+bug/1912846
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20210125192505.390554-1-eperezma@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index b308026596..1fd1917ca0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3680,6 +3680,7 @@ static void virtio_device_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(dev);
 
+    memory_listener_unregister(&vdev->listener);
     virtio_bus_device_unplugged(vdev);
 
     if (vdc->unrealize != NULL) {
@@ -3710,7 +3711,6 @@ static void virtio_device_instance_finalize(Object *obj)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(obj);
 
-    memory_listener_unregister(&vdev->listener);
     virtio_device_free_virtqueues(vdev);
 
     g_free(vdev->config);
-- 
MST


