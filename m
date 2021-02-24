Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29456323E9D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:45:07 +0100 (CET)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuTS-0001NB-5h
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:45:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEuI6-0002TY-A9
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:33:22 -0500
Received: from mail.ispras.ru ([83.149.199.84]:60546)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEuI3-0004cC-UT
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:33:21 -0500
Received: from [127.0.1.1] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 010A44076251;
 Wed, 24 Feb 2021 13:33:12 +0000 (UTC)
Subject: [PATCH] hw/virtio: enable ioeventfd configuring for mmio
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Wed, 24 Feb 2021 16:33:12 +0300
Message-ID: <161417359262.2250859.14712052392728549075.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, pavel.dovgalyuk@ispras.ru,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds ioeventfd flag for virtio-mmio configuration.
It allows switching ioeventfd on and off.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 hw/virtio/virtio-mmio.c         |   11 ++++++++++-
 include/hw/virtio/virtio-mmio.h |    5 +++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 610661d6a5..551f831562 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -36,7 +36,9 @@
 
 static bool virtio_mmio_ioeventfd_enabled(DeviceState *d)
 {
-    return kvm_eventfds_enabled();
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+
+    return (proxy->flags & VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD) != 0;
 }
 
 static int virtio_mmio_ioeventfd_assign(DeviceState *d,
@@ -690,6 +692,8 @@ static Property virtio_mmio_properties[] = {
     DEFINE_PROP_BOOL("format_transport_address", VirtIOMMIOProxy,
                      format_transport_address, true),
     DEFINE_PROP_BOOL("force-legacy", VirtIOMMIOProxy, legacy, true),
+    DEFINE_PROP_BIT("ioeventfd", VirtIOMMIOProxy, flags,
+                    VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -701,6 +705,11 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
     qbus_create_inplace(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMIO_BUS,
                         d, NULL);
     sysbus_init_irq(sbd, &proxy->irq);
+
+    if (!kvm_eventfds_enabled()) {
+        proxy->flags &= ~VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD;
+    }
+
     if (proxy->legacy) {
         memory_region_init_io(&proxy->iomem, OBJECT(d),
                               &virtio_legacy_mem_ops, proxy,
diff --git a/include/hw/virtio/virtio-mmio.h b/include/hw/virtio/virtio-mmio.h
index d4c4c386ab..090f7730e7 100644
--- a/include/hw/virtio/virtio-mmio.h
+++ b/include/hw/virtio/virtio-mmio.h
@@ -49,12 +49,17 @@ typedef struct VirtIOMMIOQueue {
     uint32_t used[2];
 } VirtIOMMIOQueue;
 
+#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT 1
+#define VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD \
+        (1 << VIRTIO_IOMMIO_FLAG_USE_IOEVENTFD_BIT)
+
 struct VirtIOMMIOProxy {
     /* Generic */
     SysBusDevice parent_obj;
     MemoryRegion iomem;
     qemu_irq irq;
     bool legacy;
+    uint32_t flags;
     /* Guest accessible state needing migration and reset */
     uint32_t host_features_sel;
     uint32_t guest_features_sel;


