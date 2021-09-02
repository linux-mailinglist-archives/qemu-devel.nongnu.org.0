Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E220D3FEF30
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 16:10:14 +0200 (CEST)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnPx-0007TV-EP
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 10:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mLmS5-0002vQ-UZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:08:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <weijunji@bytedance.com>)
 id 1mLmS4-0001Ce-9c
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:08:21 -0400
Received: by mail-pj1-x1029.google.com with SMTP id fz10so1341314pjb.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+G9kPhwsuho0YbQ3uM8CI129eTwrDx36Qp4gKZ7PCA=;
 b=XEzu6SxGtCjCDZ5ZILrNAjU5WcoIoZgBfHSLRPy7EoHcdr0ee+eGu5jLuqpbKtZMiq
 hd+qdiyXzgT4SDSEZtQUh0pSH/pOwcbsQWNMfYXjd/z2p9Neb2GQ17PmO13ApLxqd7JB
 u+8dsnbasdGBBXubbiU7CpPrOWwbTUAOWhvytAshDGMnsi8yYWU136hG03559H+D15C4
 FmbA1FqBB8FZCNrnWjCSWme8rSnMjaOh7Dp8Mu2OlS5+TAPLQySWvUOHBpRMJXdKxbUN
 szaVr9hfpYqhzDy5pHOh3ZORkUFtPPzOYxx0H1Z86AY1e1TVFhUuTw9U8GgaSqA8L/6J
 GOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+G9kPhwsuho0YbQ3uM8CI129eTwrDx36Qp4gKZ7PCA=;
 b=m1pq2qkrXnooNW9mDPLRbRdNbjIVxZW45f1CX5FL7Y9OxSzLOtP/rIuLVRxckVYFaW
 UQAsMk+BWcxGTCefHkgstxOs20UcQJTCa9JLQI0V5nAr+kVYxeKqFY+u0mQypTrZ7OOm
 O9+w1MMY3p/TzLjySIgR127z1+LOVGhVZlUNyaj7S4K3NhlUaAl7pbp5ZEnPxH6oqjZK
 g0P1N7P19S/rsS81s9yTUAUfxf9XHP/UfjZE1Brx/JEXv5vCuBXvwvU9KW1fQCZw5YtA
 +BMsfhCaQYngnpVBtTw9ayF0VYuO9Ys0wfXgfRbkP1fa/IbmAVgaoFABj73ZW+vohJMN
 HsSQ==
X-Gm-Message-State: AOAM530MuVfTnOg7g7W4MhleQBZLBtqhWvUyNc5+GbBmGUkH9IfDeRO8
 4aXOlXqr9m3nFqkLaZ9CG5A+eg==
X-Google-Smtp-Source: ABdhPJyCxnuTLqOl7CCROnnXqyJ/zDL9uG3QdE9kp2zXMQh6j8vqadez6ThslEN21V0vilvkCkk6VQ==
X-Received: by 2002:a17:90a:8005:: with SMTP id
 b5mr3875331pjn.190.1630588098890; 
 Thu, 02 Sep 2021 06:08:18 -0700 (PDT)
Received: from C02FR1DUMD6V.bytedance.net ([139.177.225.225])
 by smtp.gmail.com with ESMTPSA id d6sm2307415pfa.135.2021.09.02.06.08.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:08:18 -0700 (PDT)
From: Junji Wei <weijunji@bytedance.com>
To: dledford@redhat.com, jgg@ziepe.ca, mst@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com, cohuck@redhat.com,
 hare@suse.de
Subject: [RFC 4/5] virtio-net: Move some virtio-net-pci decl to
 include/hw/virtio
Date: Thu,  2 Sep 2021 21:06:24 +0800
Message-Id: <20210902130625.25277-5-weijunji@bytedance.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210902130625.25277-1-weijunji@bytedance.com>
References: <20210902130625.25277-1-weijunji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=weijunji@bytedance.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Sep 2021 10:08:37 -0400
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
Cc: linux-rdma@vger.kernel.org, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 chaiwen.cc@bytedance.com, weijunji@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuval Shaia <yuval.shaia.ml@gmail.com>

This patch is from Yuval Shaia's [RFC 1/3]

Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 hw/virtio/virtio-net-pci.c         | 18 ++----------------
 include/hw/virtio/virtio-net-pci.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/virtio/virtio-net-pci.h

diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index 292d13d278..6cea7e0441 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -18,26 +18,12 @@
 #include "qemu/osdep.h"
 
 #include "hw/qdev-properties.h"
-#include "hw/virtio/virtio-net.h"
+#include "hw/virtio/virtio-net-pci.h"
 #include "virtio-pci.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qom/object.h"
 
-typedef struct VirtIONetPCI VirtIONetPCI;
-
-/*
- * virtio-net-pci: This extends VirtioPCIProxy.
- */
-#define TYPE_VIRTIO_NET_PCI "virtio-net-pci-base"
-DECLARE_INSTANCE_CHECKER(VirtIONetPCI, VIRTIO_NET_PCI,
-                         TYPE_VIRTIO_NET_PCI)
-
-struct VirtIONetPCI {
-    VirtIOPCIProxy parent_obj;
-    VirtIONet vdev;
-};
-
 static Property virtio_net_properties[] = {
     DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
@@ -84,7 +70,7 @@ static void virtio_net_pci_instance_init(Object *obj)
 
 static const VirtioPCIDeviceTypeInfo virtio_net_pci_info = {
     .base_name             = TYPE_VIRTIO_NET_PCI,
-    .generic_name          = "virtio-net-pci",
+    .generic_name          = TYPE_VIRTIO_NET_PCI_GENERIC,
     .transitional_name     = "virtio-net-pci-transitional",
     .non_transitional_name = "virtio-net-pci-non-transitional",
     .instance_size = sizeof(VirtIONetPCI),
diff --git a/include/hw/virtio/virtio-net-pci.h b/include/hw/virtio/virtio-net-pci.h
new file mode 100644
index 0000000000..c1915cd54f
--- /dev/null
+++ b/include/hw/virtio/virtio-net-pci.h
@@ -0,0 +1,35 @@
+/*
+ * PCI Virtio Network Device
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_VIRTIO_NET_PCI_H
+#define QEMU_VIRTIO_NET_PCI_H
+
+#include "hw/virtio/virtio-net.h"
+#include "hw/virtio/virtio-pci.h"
+
+typedef struct VirtIONetPCI VirtIONetPCI;
+
+/*
+ * virtio-net-pci: This extends VirtioPCIProxy.
+ */
+#define TYPE_VIRTIO_NET_PCI_GENERIC "virtio-net-pci"
+#define TYPE_VIRTIO_NET_PCI "virtio-net-pci-base"
+#define VIRTIO_NET_PCI(obj) \
+        OBJECT_CHECK(VirtIONetPCI, (obj), TYPE_VIRTIO_NET_PCI)
+
+struct VirtIONetPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIONet vdev;
+};
+
+#endif
-- 
2.11.0


