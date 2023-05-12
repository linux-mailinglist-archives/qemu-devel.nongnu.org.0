Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B255700983
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 15:52:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxTBe-00038L-Kz; Fri, 12 May 2023 09:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBb-000369-8q
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:55 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pxTBZ-0006SQ-JZ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:51:55 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac88d9edf3so96260151fa.0
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683899511; x=1686491511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUbUhFUIT7zvA0dV/gO0XR4/4OQmYfc2bPvzMXOSlZs=;
 b=u/L/umvslmhgC2EsS2jT93ybtE+BfTS4w/I0Oni+VFgzPVDctFfFzCffDkpUORPlm+
 Oh4ocTCB3U3Ia2FPB9DunFwXWNGtvxpKUCBgoM1wtZfDHHM/3zSAwmsGVEjTS5EIqu+a
 3YZXga5fbJklERu+4Kd9V+8PgvE1NXmX2Ksp/IJ1TBdMMJiCddglQ0dmHZhPKoGmUL4h
 3daqJNBeb7FdWQ9wlsN9TQvcHv2ulN/qxpMNsN7stiWvYhVs2zYNB26FEQK7c7jyHxQj
 NHc+9h5cLZVuRDYDCw0ErFV+8VOvl2NPTdvCYmduYahBvt+P8Bq6b2n2MaYwTE8Qn7zu
 iTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683899511; x=1686491511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VUbUhFUIT7zvA0dV/gO0XR4/4OQmYfc2bPvzMXOSlZs=;
 b=bKEAE1ILebHx8bBZZtm8iYflkd0MY5I4hZjf0g1IjdkYyYJ41X8gzN2ukvBzgDbnCD
 7NIT+mbh4mJbfpkee4eFlTyxXk/k4Rv+d2rVC+kkrG1blyjnmgPIqRRzxq+hdrQygIKo
 OyLh/z5CDyeT86w6xfTu7JKhtl/X646ZMgeFvdh1cZhaJkrWgtgPvCPPwfVylkrVip46
 1RLcxRi0WsGZ49ei5h/YZ5I2zvcLVvlsPhEJJcxtmPJm6MXs8UcLnFiOA0m9kSroquDB
 zuxynzF8lekt1e/rMk1OCZFoJkBAW+zHs4cnc+LIGc8NE0IqhxCYvy7Dw7+GCUoHsFRY
 5GCA==
X-Gm-Message-State: AC+VfDwYlpIVCGCV4rrtEO8eRqrgTv8yidCR92uY+Dlvdt026yCkAOSd
 qcSbhqYtgPHn2KR6WXqlx6Es9g==
X-Google-Smtp-Source: ACHHUZ4ojP4VxrmyhKC3Gy0SldrXsjd2T0YeE+jn5+UDDooJkzlUyiHXvPz8F1bl8+iQeAU/Nh4EVg==
X-Received: by 2002:a2e:7004:0:b0:2ac:e6d4:2c02 with SMTP id
 l4-20020a2e7004000000b002ace6d42c02mr4549076ljc.27.1683899511718; 
 Fri, 12 May 2023 06:51:51 -0700 (PDT)
Received: from vp-pc.. (109-252-115-147.nat.spd-mgts.ru. [109.252.115.147])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a2e90c7000000b002ad994b0b51sm1744283ljg.16.2023.05.12.06.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:51:51 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [PATCH v3 1/3] virtio-pci: add handling of PCI ATS and Device-TLB
 enable/disable
Date: Fri, 12 May 2023 16:51:20 +0300
Message-Id: <20230512135122.70403-2-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230512135122.70403-1-viktor@daynix.com>
References: <20230512135122.70403-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::229;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

According to PCIe Address Translation Services specification 5.1.3.,
ATS Control Register has Enable bit to enable/disable ATS. Guest may
enable/disable PCI ATS and, accordingly, Device-TLB for the VirtIO PCI
device. So, raise/lower a flag and call a trigger function to pass this
event to a device implementation.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/virtio/virtio-pci.c     | 36 ++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 38 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 02fb84a8fa..edbc0daa18 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -716,6 +716,38 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr addr,
     }
 }
 
+static void virtio_pci_ats_ctrl_trigger(PCIDevice *pci_dev, bool enable)
+{
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    vdev->device_iotlb_enabled = enable;
+
+    if (k->toggle_device_iotlb) {
+        k->toggle_device_iotlb(vdev);
+    }
+}
+
+static void pcie_ats_config_write(PCIDevice *dev, uint32_t address,
+                                  uint32_t val, int len)
+{
+    uint32_t off;
+    uint16_t ats_cap = dev->exp.ats_cap;
+
+    if (!ats_cap || address < ats_cap) {
+        return;
+    }
+    off = address - ats_cap;
+    if (off >= PCI_EXT_CAP_ATS_SIZEOF) {
+        return;
+    }
+
+    if (range_covers_byte(off, len, PCI_ATS_CTRL + 1)) {
+        virtio_pci_ats_ctrl_trigger(dev, !!(val & PCI_ATS_CTRL_ENABLE));
+    }
+}
+
 static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
                                 uint32_t val, int len)
 {
@@ -729,6 +761,10 @@ static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
         pcie_cap_flr_write_config(pci_dev, address, val, len);
     }
 
+    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
+        pcie_ats_config_write(pci_dev, address, val, len);
+    }
+
     if (range_covers_byte(address, len, PCI_COMMAND)) {
         if (!(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
             virtio_set_disabled(vdev, true);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f6b38f7e9c..af86ed7249 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -155,6 +155,7 @@ struct VirtIODevice
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
     EventNotifier config_notifier;
+    bool device_iotlb_enabled;
 };
 
 struct VirtioDeviceClass {
@@ -212,6 +213,7 @@ struct VirtioDeviceClass {
     const VMStateDescription *vmsd;
     bool (*primary_unplug_pending)(void *opaque);
     struct vhost_dev *(*get_vhost)(VirtIODevice *vdev);
+    void (*toggle_device_iotlb)(VirtIODevice *vdev);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
-- 
2.35.1


