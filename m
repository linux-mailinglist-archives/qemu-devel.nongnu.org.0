Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A86529324
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:48:06 +0200 (CEST)
Received: from localhost ([::1]:55600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiZR-0001YP-JA
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjt-0002Ju-7A
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjr-0006nY-6D
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9w3iT2kzWZXwmqWDUx+rSUtwr5cBul7vws3lLdpQ2Y=;
 b=WK2dV2K+NEJIeNOZzAuSQVn/YC2VOHlph8drKay1mo52U4KWci0aMxjBx5Sld94WcH94eL
 oUj2kHXLJxm3BVNm0V0WpEyFl5RpB9u23tMlXnjCFsS++W0zWZ+GN8F62lNLTRv/FDHWrS
 g117OadMp9uCa/C9KIsZ0Gs6/gJucLk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-Yk6fC7aAN86pk5brTk44MQ-1; Mon, 16 May 2022 16:54:45 -0400
X-MC-Unique: Yk6fC7aAN86pk5brTk44MQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 l18-20020aa7d952000000b0042ab7be9adaso1913337eds.21
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=c9w3iT2kzWZXwmqWDUx+rSUtwr5cBul7vws3lLdpQ2Y=;
 b=6f64p12gbn5TgxW99nc3YvhT8LXFgkYwdjblQY+TDIH4og4Q3C4w4BSEKg+grN3srK
 UL4XmT7cyDwaxooPFeX+AgdaEHbhFrYvCys6YnN2QuqGE2E/IPedwgQsg4pN8ggTb8Ki
 LK5B9WkBgSdBtr/Q6STHDp1s1Nu7oSGPq+aLc3plbK8qEq8Y+3vRyiLjOoolasPTsWSm
 DW4ZhX8ti5x7olW1ZQkb4+6xr6zQWEaaMCqP+6CHIYkO86uHtJi748cgFc0GQOPpdYsF
 KGS6TLRfjOnvE8lWj0fw8mbdSzYhlffebaEwQZXsze5nLYkE7OE3DdgGa8R9vQ/XFlj7
 /bhg==
X-Gm-Message-State: AOAM533r1elYzQqgVe8d72ZYLMJ2q1nzaT9Ljt9pFl/7j4eiy8I952+2
 Wlr95YZkmtR3rznVm0QYbO0m+81SvxkPVwJsUub3DsO1L22YZg/Bz3OuaACEbM76Z7wgpmUlldK
 3mx6+u79zwz4vUmJTXCUr8wgEsJGUm5oj7+s9ngmcmnhBUKOKDepr8GLEdT/G
X-Received: by 2002:a17:907:6e18:b0:6fe:324a:65c1 with SMTP id
 sd24-20020a1709076e1800b006fe324a65c1mr6989743ejc.368.1652734483850; 
 Mon, 16 May 2022 13:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyICWh7WysxXJqgdBYfCQ/brdROSmz9ulCI9yNR7jN6iD+q8YUro4aNESXq1IEDxlsKHBu4g==
X-Received: by 2002:a17:907:6e18:b0:6fe:324a:65c1 with SMTP id
 sd24-20020a1709076e1800b006fe324a65c1mr6989719ejc.368.1652734483538; 
 Mon, 16 May 2022 13:54:43 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 t20-20020a056402525400b0042617ba63ccsm5916311edd.86.2022.05.16.13.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:43 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 66/86] docs/devel: start documenting writing VirtIO devices
Message-ID: <20220516204913.542894-67-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

While writing my own VirtIO devices I've gotten confused with how
things are structured and what sort of shared infrastructure there is.
If we can document how everything is supposed to work we can then
maybe start cleaning up inconsistencies in the code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20220309164929.19395-1-alex.bennee@linaro.org>

Message-Id: <20220321153037.3622127-10-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/devel/index-internals.rst |   1 +
 docs/devel/virtio-backends.rst | 214 +++++++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 docs/devel/virtio-backends.rst

diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index a50889c556..e1a93df263 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -18,3 +18,4 @@ Details about QEMU's various subsystems including how to add features to them.
    tracing
    vfio-migration
    writing-monitor-commands
+   virtio-backends
diff --git a/docs/devel/virtio-backends.rst b/docs/devel/virtio-backends.rst
new file mode 100644
index 0000000000..9ff092e7a0
--- /dev/null
+++ b/docs/devel/virtio-backends.rst
@@ -0,0 +1,214 @@
+..
+   Copyright (c) 2022, Linaro Limited
+   Written by Alex Bennée
+
+Writing VirtIO backends for QEMU
+================================
+
+This document attempts to outline the information a developer needs to
+know to write device emulations in QEMU. It is specifically focused on
+implementing VirtIO devices. For VirtIO the frontend is the driver
+running on the guest. The backend is the everything that QEMU needs to
+do to handle the emulation of the VirtIO device. This can be done
+entirely in QEMU, divided between QEMU and the kernel (vhost) or
+handled by a separate process which is configured by QEMU
+(vhost-user).
+
+VirtIO Transports
+-----------------
+
+VirtIO supports a number of different transports. While the details of
+the configuration and operation of the device will generally be the
+same QEMU represents them as different devices depending on the
+transport they use. For example -device virtio-foo represents the foo
+device using mmio and -device virtio-foo-pci is the same class of
+device using the PCI transport.
+
+Using the QEMU Object Model (QOM)
+---------------------------------
+
+Generally all devices in QEMU are super classes of ``TYPE_DEVICE``
+however VirtIO devices should be based on ``TYPE_VIRTIO_DEVICE`` which
+itself is derived from the base class. For example:
+
+.. code:: c
+
+  static const TypeInfo virtio_blk_info = {
+      .name = TYPE_VIRTIO_BLK,
+      .parent = TYPE_VIRTIO_DEVICE,
+      .instance_size = sizeof(VirtIOBlock),
+      .instance_init = virtio_blk_instance_init,
+      .class_init = virtio_blk_class_init,
+  };
+
+The author may decide to have a more expansive class hierarchy to
+support multiple device types. For example the Virtio GPU device:
+
+.. code:: c
+
+  static const TypeInfo virtio_gpu_base_info = {
+      .name = TYPE_VIRTIO_GPU_BASE,
+      .parent = TYPE_VIRTIO_DEVICE,
+      .instance_size = sizeof(VirtIOGPUBase),
+      .class_size = sizeof(VirtIOGPUBaseClass),
+      .class_init = virtio_gpu_base_class_init,
+      .abstract = true
+  };
+
+  static const TypeInfo vhost_user_gpu_info = {
+      .name = TYPE_VHOST_USER_GPU,
+      .parent = TYPE_VIRTIO_GPU_BASE,
+      .instance_size = sizeof(VhostUserGPU),
+      .instance_init = vhost_user_gpu_instance_init,
+      .instance_finalize = vhost_user_gpu_instance_finalize,
+      .class_init = vhost_user_gpu_class_init,
+  };
+
+  static const TypeInfo virtio_gpu_info = {
+      .name = TYPE_VIRTIO_GPU,
+      .parent = TYPE_VIRTIO_GPU_BASE,
+      .instance_size = sizeof(VirtIOGPU),
+      .class_size = sizeof(VirtIOGPUClass),
+      .class_init = virtio_gpu_class_init,
+  };
+
+defines a base class for the VirtIO GPU and then specialises two
+versions, one for the internal implementation and the other for the
+vhost-user version.
+
+VirtIOPCIProxy
+^^^^^^^^^^^^^^
+
+[AJB: the following is supposition and welcomes more informed
+opinions]
+
+Probably due to legacy from the pre-QOM days PCI VirtIO devices don't
+follow the normal hierarchy. Instead the a standalone object is based
+on the VirtIOPCIProxy class and the specific VirtIO instance is
+manually instantiated:
+
+.. code:: c
+
+  /*
+   * virtio-blk-pci: This extends VirtioPCIProxy.
+   */
+  #define TYPE_VIRTIO_BLK_PCI "virtio-blk-pci-base"
+  DECLARE_INSTANCE_CHECKER(VirtIOBlkPCI, VIRTIO_BLK_PCI,
+                           TYPE_VIRTIO_BLK_PCI)
+
+  struct VirtIOBlkPCI {
+      VirtIOPCIProxy parent_obj;
+      VirtIOBlock vdev;
+  };
+
+  static Property virtio_blk_pci_properties[] = {
+      DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+      DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                      VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+      DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                         DEV_NVECTORS_UNSPECIFIED),
+      DEFINE_PROP_END_OF_LIST(),
+  };
+
+  static void virtio_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+  {
+      VirtIOBlkPCI *dev = VIRTIO_BLK_PCI(vpci_dev);
+      DeviceState *vdev = DEVICE(&dev->vdev);
+
+      ...
+
+      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+  }
+
+  static void virtio_blk_pci_class_init(ObjectClass *klass, void *data)
+  {
+      DeviceClass *dc = DEVICE_CLASS(klass);
+      VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+      PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+
+      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+      device_class_set_props(dc, virtio_blk_pci_properties);
+      k->realize = virtio_blk_pci_realize;
+      pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+      pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BLOCK;
+      pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
+      pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
+  }
+
+  static void virtio_blk_pci_instance_init(Object *obj)
+  {
+      VirtIOBlkPCI *dev = VIRTIO_BLK_PCI(obj);
+
+      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                  TYPE_VIRTIO_BLK);
+      object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
+                                "bootindex");
+  }
+
+  static const VirtioPCIDeviceTypeInfo virtio_blk_pci_info = {
+      .base_name              = TYPE_VIRTIO_BLK_PCI,
+      .generic_name           = "virtio-blk-pci",
+      .transitional_name      = "virtio-blk-pci-transitional",
+      .non_transitional_name  = "virtio-blk-pci-non-transitional",
+      .instance_size = sizeof(VirtIOBlkPCI),
+      .instance_init = virtio_blk_pci_instance_init,
+      .class_init    = virtio_blk_pci_class_init,
+  };
+
+Here you can see the instance_init has to manually instantiate the
+underlying ``TYPE_VIRTIO_BLOCK`` object and link an alias for one of
+it's properties to the PCI device.
+
+  
+Back End Implementations
+------------------------
+
+There are a number of places where the implementation of the backend
+can be done:
+
+* in QEMU itself
+* in the host kernel (a.k.a vhost)
+* in a separate process (a.k.a. vhost-user)
+
+vhost_ops vs TYPE_VHOST_USER_BACKEND
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+There are two choices to how to implement vhost code. Most of the code
+which has to work with either vhost or vhost-user uses
+``vhost_dev_init()`` to instantiate the appropriate backend. This
+means including a ``struct vhost_dev`` in the main object structure.
+
+For vhost-user devices you also need to add code to track the
+initialisation of the ``chardev`` device used for the control socket
+between QEMU and the external vhost-user process.
+
+If you only need to implement a vhost-user backed the other option is
+a use a QOM-ified version of vhost-user.
+
+.. code:: c
+
+  static void
+  vhost_user_gpu_instance_init(Object *obj)
+  {
+      VhostUserGPU *g = VHOST_USER_GPU(obj);
+
+      g->vhost = VHOST_USER_BACKEND(object_new(TYPE_VHOST_USER_BACKEND));
+      object_property_add_alias(obj, "chardev",
+                                OBJECT(g->vhost), "chardev");
+  }
+
+  static const TypeInfo vhost_user_gpu_info = {
+      .name = TYPE_VHOST_USER_GPU,
+      .parent = TYPE_VIRTIO_GPU_BASE,
+      .instance_size = sizeof(VhostUserGPU),
+      .instance_init = vhost_user_gpu_instance_init,
+      .instance_finalize = vhost_user_gpu_instance_finalize,
+      .class_init = vhost_user_gpu_class_init,
+  };
+
+Using it this way entails adding a ``struct VhostUserBackend`` to your
+core object structure and manually instantiating the backend. This
+sub-structure tracks both the ``vhost_dev`` and ``CharDev`` types
+needed for the connection. Instead of calling ``vhost_dev_init`` you
+would call ``vhost_user_backend_dev_init`` which does what is needed
+on your behalf.
-- 
MST


