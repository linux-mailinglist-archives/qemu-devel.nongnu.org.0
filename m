Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19304E2CD8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:51:52 +0100 (CET)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKJy-00029k-N8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:51:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzt-0005IH-8V
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:07 -0400
Received: from [2a00:1450:4864:20::62f] (port=34587
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzr-0004xg-1p
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:31:04 -0400
Received: by mail-ej1-x62f.google.com with SMTP id o10so11847965ejd.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJ4SOL73gMJvu81Wu3v8plZDwv28BscaYBchhYSZgQU=;
 b=tczvxcE5mAJDvyzDYAlohPPyrN+ogchCQwqRxeZvq6EH0Jxrpguw10CcSldqVX4s3u
 b69oPyCaYahqOPtjmbZne95CzDuWeSrp9x5blBgThYgkF466gRkWMIWHXsALc/XfoBS4
 m+1xlYmzb6k7GlpgEy9JZHhlEb7NZluQApSi21DpBLpcI4DeVeo1qeY901f8BbYV6+y7
 LuV1x9JHnfo8+0QPqAoJRMEfmdPen1oJExOvyn2oW2vlvvK6MGGrLAZlscuilgeOiZg0
 BjygH8hREcxCZ5tidm6ReqancJvVZ2WizbJ4Ka4uUiHAZyFFXIoyJyqNxztas8G/CwKt
 Sk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJ4SOL73gMJvu81Wu3v8plZDwv28BscaYBchhYSZgQU=;
 b=qishyFp94yXGXYb2WjG1DcbpnpGlLPBtkEemYCdmksgHXqNirv63U0RCX7DS62coO0
 Uuw4hnJoHaXXTzYo7IXmjqGUvPuzIdAWb+8hl6DdoY/DR+NSOHREqze0FHpyvy6Glh3N
 SiKlnQejFpFAW6W0ozGycO7gDZxUZM55MujajK0k1brZpY3Yp1JMCtgsrjZDG3uqLhmk
 0wcRZRZlvNPVVQFUGq16nHQl0/ctD7e51DWeH4YotSmLr2GdLUnJFy1QNQM7w8xRZrUc
 BMbgrLXWHhVz+KVJ3eoAuF5Qv5oGKAiReywcWGvrkO8GSod1CSQF8qtvBnkA2T2fSetJ
 G0yw==
X-Gm-Message-State: AOAM5313bNUFRPG1fqwhsevTF4cXYgeYRpN793Qsk6u+weSry9CGC5Hf
 9c729BFkMnM8dR5MtzbiNvRlbA==
X-Google-Smtp-Source: ABdhPJyQy1dlYFcO31VxRB4qWsRhrAHbIyXQ39BiswsbkIAb8WbJ3eCT2vwN+IaOgT5WurooC2H0iA==
X-Received: by 2002:a17:907:8d17:b0:6df:c072:2f66 with SMTP id
 tc23-20020a1709078d1700b006dfc0722f66mr13770679ejc.444.1647876660764; 
 Mon, 21 Mar 2022 08:31:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056402424100b00416c6cbfa4csm7898468edb.54.2022.03.21.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 773101FFC1;
 Mon, 21 Mar 2022 15:30:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/13] docs/devel: start documenting writing VirtIO devices
Date: Mon, 21 Mar 2022 15:30:33 +0000
Message-Id: <20220321153037.3622127-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com,
 marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

---
v2
  - move more description to the leader text
  - try not to confuse backend and frontend terms
  - more explicit description of objects
  - try and tease apart vhost_dev_init vs QOM-ifed vhost-user-backend
---
 docs/devel/index-internals.rst |   1 +
 docs/devel/virtio-backends.rst | 214 +++++++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 docs/devel/virtio-backends.rst

diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index bb118b8eaf..5d9f95dd93 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -19,3 +19,4 @@ Details about QEMU's various subsystems including how to add features to them.
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
2.30.2


