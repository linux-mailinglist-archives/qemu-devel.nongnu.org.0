Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2793B525C4A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:23:49 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPeN-0002bM-Ve
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npOsb-0001vs-55
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npOsZ-0001FW-5K
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:34:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsbPNpIFk1TgfkuNZjV4k7cic29q62G8/EowK0Oc0d4=;
 b=RenPFPPVqhKwocqbMMIb3qNY4ncudi0xTvRQafiRvGJ27sTIw+5ovhUfkkf0jkCcr0tWNQ
 mk10Rd3oYGaITziVO4McxXos8eGHOg6POImee6nxNfl37+VrLP0MlNwjIBOyiaURVoe9d0
 vUqoL671axcg5JeH4KEgbuVGpryt7DA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-2gP1QRexOZuXOdjNAFSCVg-1; Fri, 13 May 2022 02:34:19 -0400
X-MC-Unique: 2gP1QRexOZuXOdjNAFSCVg-1
Received: by mail-qt1-f200.google.com with SMTP id
 o16-20020ac87c50000000b002f3b8cd6a7fso5613690qtv.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tsbPNpIFk1TgfkuNZjV4k7cic29q62G8/EowK0Oc0d4=;
 b=OqGzrwaIvjMzCw0KsaXWCLzkER09wIlMBybn817RwH5vvbUaek7UClB4wG3eQJkIf4
 lfLhC9expDwr8YB1S7FfQp0L5hE59oV03abnrmJ/Xs4Hrq9NkGWU/M3g19y4bbphyKjp
 xGduloBznKvimbG3IvtXz1zMfZmhrHUVCFW6BINJaty3E9MQsQoT3+SQomR8h4nZTcBI
 nOfLm1YYsv3DMw0czJVDNPBUqxdQewArm2Fib4y1zO+EHmklLTy9u9eGv7prqLDzzMhg
 JqzVjRkDzahHtV4yjc6rP5WGUnFSPtxnlmsIe7LwxQIm3Axy7UgL4F1j4jWPaQeUnjyJ
 D21w==
X-Gm-Message-State: AOAM5338ZLd6Y3xuQh1PckXfcE1eyAS3VR2PfjcvnW+yEvxUHgSH4GZQ
 TZKg9KAJaINMrUW6VReYX7iNCihcmmVgWimug6w1K+Q0eYPjcj3uQt0X+j0XjX0iR88RGT/FFXv
 WdW9kcBd3FQTcbQg=
X-Received: by 2002:a05:622a:100b:b0:2f3:c5db:cb86 with SMTP id
 d11-20020a05622a100b00b002f3c5dbcb86mr3224749qte.178.1652423658634; 
 Thu, 12 May 2022 23:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEAqN945muPXmSYwGU0fQw6vjvUAwfmnG5U203JXVLQyaSmFFS8/Ce8Cw29zv+i/a0oA1fTA==
X-Received: by 2002:a05:622a:100b:b0:2f3:c5db:cb86 with SMTP id
 d11-20020a05622a100b00b002f3c5dbcb86mr3224729qte.178.1652423658387; 
 Thu, 12 May 2022 23:34:18 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 c15-20020ac86e8f000000b002f39b99f678sm992062qtv.18.2022.05.12.23.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 23:34:17 -0700 (PDT)
Date: Fri, 13 May 2022 08:34:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowang@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 3/4] vdpa: add vdpa-dev support
Message-ID: <20220513063406.plr2boexvzpgzdul@sgarzare-redhat>
References: <20220512062103.1875-1-longpeng2@huawei.com>
 <20220512062103.1875-4-longpeng2@huawei.com>
 <20220512143601.dujcnth2rbrxgsbx@sgarzare-redhat>
 <a040df92-00f6-4e02-5a83-04b8c6ed5cef@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a040df92-00f6-4e02-5a83-04b8c6ed5cef@huawei.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 13, 2022 at 10:17:41AM +0800, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
>
>
>在 2022/5/12 22:36, Stefano Garzarella 写道:
>>On Thu, May 12, 2022 at 02:21:02PM +0800, Longpeng(Mike) wrote:
>>>From: Longpeng <longpeng2@huawei.com>
>>>
>>>Supports vdpa-dev, we can use the deivce directly:
>>>
>>>-M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
>>>vhost-vdpa-device,vhostdev=/dev/vhost-vdpa-x
>>>
>>>Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>---
>>>hw/virtio/Kconfig            |   5 +
>>>hw/virtio/meson.build        |   1 +
>>>hw/virtio/vdpa-dev.c         | 377 +++++++++++++++++++++++++++++++++++
>>>include/hw/virtio/vdpa-dev.h |  43 ++++
>>>4 files changed, 426 insertions(+)
>>>create mode 100644 hw/virtio/vdpa-dev.c
>>>create mode 100644 include/hw/virtio/vdpa-dev.h
>>>
>>>diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
>>>index c144d42f9b..724eb58a32 100644
>>>--- a/hw/virtio/Kconfig
>>>+++ b/hw/virtio/Kconfig
>>>@@ -68,3 +68,8 @@ config VHOST_USER_RNG
>>>    bool
>>>    default y
>>>    depends on VIRTIO && VHOST_USER
>>>+
>>>+config VHOST_VDPA_DEV
>>>+    bool
>>>+    default y
>>>+    depends on VIRTIO && VHOST_VDPA && LINUX
>>>diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
>>>index 67dc77e00f..8f6f86db71 100644
>>>--- a/hw/virtio/meson.build
>>>+++ b/hw/virtio/meson.build
>>>@@ -29,6 +29,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', 
>>>if_true: files('vhost-user-i2c.c'))
>>>virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 
>>>'CONFIG_VHOST_USER_I2C'], if_true: files('vhost-user-i2c-pci.c'))
>>>virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: 
>>>files('vhost-user-rng.c'))
>>>virtio_ss.add(when: ['CONFIG_VHOST_USER_RNG', 
>>>'CONFIG_VIRTIO_PCI'], if_true: files('vhost-user-rng-pci.c'))
>>>+virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: 
>>>files('vdpa-dev.c'))
>>>
>>>virtio_pci_ss = ss.source_set()
>>>virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: 
>>>files('vhost-vsock-pci.c'))
>>>diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>>>new file mode 100644
>>>index 0000000000..56597c881a
>>>--- /dev/null
>>>+++ b/hw/virtio/vdpa-dev.c
>>>@@ -0,0 +1,377 @@
>>>+/*
>>>+ * Vhost Vdpa Device
>>>+ *
>>>+ * Copyright (c) Huawei Technologies Co., Ltd. 2022. All Rights 
>>>Reserved.
>>>+ *
>>>+ * Authors:
>>>+ *   Longpeng <longpeng2@huawei.com>
>>>+ *
>>>+ * Largely based on the "vhost-user-blk-pci.c" and 
>>>"vhost-user-blk.c" implemented by:
>>>+ *   Changpeng Liu <changpeng.liu@intel.com>
>>>+ *
>>>+ * This work is licensed under the terms of the GNU LGPL, version 
>>>2 or later.
>>>+ * See the COPYING.LIB file in the top-level directory.
>>>+ */
>>>+#include "qemu/osdep.h"
>>>+#include <sys/ioctl.h>
>>>+#include <linux/vhost.h>
>>>+#include "qapi/error.h"
>>>+#include "qemu/error-report.h"
>>>+#include "qemu/cutils.h"
>>>+#include "hw/qdev-core.h"
>>>+#include "hw/qdev-properties.h"
>>>+#include "hw/qdev-properties-system.h"
>>>+#include "hw/virtio/vhost.h"
>>>+#include "hw/virtio/virtio.h"
>>>+#include "hw/virtio/virtio-bus.h"
>>>+#include "hw/virtio/virtio-access.h"
>>>+#include "hw/virtio/vdpa-dev.h"
>>>+#include "sysemu/sysemu.h"
>>>+#include "sysemu/runstate.h"
>>>+
>>>+static void
>>>+vhost_vdpa_device_dummy_handle_output(VirtIODevice *vdev, VirtQueue *vq)
>>>+{
>>>+    /* Nothing to do */
>>>+}
>>>+
>>>+static uint32_t
>>>+vhost_vdpa_device_get_u32(int fd, unsigned long int cmd, Error **errp)
>>>+{
>>>+    uint32_t val = (uint32_t)-1;
>>>+
>>>+    if (ioctl(fd, cmd, &val) < 0) {
>>>+        error_setg(errp, "vhost-vdpa-device: cmd 0x%lx failed: %s",
>>>+                   cmd, strerror(errno));
>>>+    }
>>>+
>>>+    return val;
>>>+}
>>>+
>>>+static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>>>+{
>>>+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>>>+    VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
>>>+    uint16_t max_queue_size;
>>>+    struct vhost_virtqueue *vqs;
>>>+    int i, ret;
>>>+
>>>+    if (!v->vhostdev) {
>>>+        error_setg(errp, "vhost-vdpa-device: vhostdev are missing");
>>>+        return;
>>>+    }
>>>+
>>>+    v->vhostfd = qemu_open(v->vhostdev, O_RDWR, errp);
>>>+    if (*errp) {
>>>+        return;
>>>+    }
>>>+    v->vdpa.device_fd = v->vhostfd;
>>>+
>>>+    v->vdev_id = vhost_vdpa_device_get_u32(v->vhostfd,
>>>+                                           
>>>VHOST_VDPA_GET_DEVICE_ID, errp);
>>>+    if (*errp) {
>>>+        goto out;
>>>+    }
>>>+
>>>+    max_queue_size = vhost_vdpa_device_get_u32(v->vhostfd,
>>>+                                               
>>>VHOST_VDPA_GET_VRING_NUM, errp);
>>>+    if (*errp) {
>>>+        goto out;
>>>+    }
>>>+
>>>+    if (v->queue_size > max_queue_size) {
>>>+        error_setg(errp, "vhost-vdpa-device: invalid queue_size: 
>>>%u (max:%u)",
>>>+                   v->queue_size, max_queue_size);
>>>+        goto out;
>>>+    } else if (!v->queue_size) {
>>>+        v->queue_size = max_queue_size;
>>>+    }
>>>+
>>>+    v->num_queues = vhost_vdpa_device_get_u32(v->vhostfd,
>>>+                                              
>>>VHOST_VDPA_GET_VQS_COUNT, errp);
>>>+    if (*errp) {
>>>+        goto out;
>>>+    }
>>>+
>>>+    if (!v->num_queues || v->num_queues > VIRTIO_QUEUE_MAX) {
>>>+        error_setg(errp, "invalid number of virtqueues: %u (max:%u)",
>>>+                   v->num_queues, VIRTIO_QUEUE_MAX);
>>>+        goto out;
>>>+    }
>>>+
>>>+    v->dev.nvqs = v->num_queues;
>>>+    vqs = g_new0(struct vhost_virtqueue, v->dev.nvqs);
>>>+    v->dev.vqs = vqs;
>>>+    v->dev.vq_index = 0;
>>>+    v->dev.vq_index_end = v->dev.nvqs;
>>>+    v->dev.backend_features = 0;
>>>+    v->started = false;
>>>+
>>>+    ret = vhost_dev_init(&v->dev, &v->vdpa, 
>>>VHOST_BACKEND_TYPE_VDPA, 0, NULL);
>>>+    if (ret < 0) {
>>>+        error_setg(errp, "vhost-vdpa-device: vhost initialization 
>>>failed: %s",
>>>+                   strerror(-ret));
>>>+        goto free_vqs;
>>>+    }
>>>+
>>>+    v->config_size = vhost_vdpa_device_get_u32(v->vhostfd,
>>>+                                               
>>>VHOST_VDPA_GET_CONFIG_SIZE, errp);
>>>+    if (*errp) {
>>>+        goto vhost_cleanup;
>>>+    }
>>>+
>>>+    if (v->post_init && v->post_init(v, errp) < 0) {
>>>+        goto free_virtio;
>>
>>This goto seems wrong.
>>
>>Either we use the `vhost_cleanup` label or we move this block just 
>>before return as it seems to me was in v3.
>>
>
>Good catch. We should use 'vhost_cleanup' label here.

Yep, so in that case we can remove the `free_virtio` label and the 
related block.

>
>>Out of curiosity, is there a reason for this change from v3 or was a 
>>simple mistake as a consequence of patch reorganization?
>>
>
>We should invoke .post_init() before calling virtio_init() which would 
>use the fields of VirtIOPCIProxy.

Okay, so maybe a comment there would be helpful.

Thanks,
Stefano


