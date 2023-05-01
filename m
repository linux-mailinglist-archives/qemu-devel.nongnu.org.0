Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC7F6F2BEB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 04:04:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptIsM-0003rN-7K; Sun, 30 Apr 2023 22:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIsJ-0003qz-Uk
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:48 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1ptIs4-0003Eu-4I
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 22:02:47 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec81773cf7so2428014e87.2
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 19:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682906550; x=1685498550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WiA/euj4PFXBRIwa4M7EpDNxjGMJvdT31Ee4wXwhwlA=;
 b=eUDOJwOvptzIkhSKcOaZe0JfwRYZWJ3+e+2ha2Ykyaulbv0np04oVk9LydGaljfScJ
 l/0lBDQ/Nf1gwRLmsBXF37aBfDKl3bb+E7QOv5vWq4TirhMSUDyiJ9lgWv1kdS82wCDz
 /lj+E2ToSkVW+qsrRefAnPSbG8/IsKufQE6hBBJEYFsJtyeL7XH1iWoNnSdIBonOhTUP
 ve4elyjIBHmRsV/b7BmvJUFlGRVWK7ySNArn8XbFSKXdt4+bRSs3KBOJoX5Zw/aYWxxl
 9H5b6PkX7fAhljqzdjQcdvwLbfnfOdyRrzIUrZgKArh9K9Tw+Aq3l6Ai166onk/A3sQ6
 cesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682906550; x=1685498550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WiA/euj4PFXBRIwa4M7EpDNxjGMJvdT31Ee4wXwhwlA=;
 b=kTgmcc5K+Py+nR9wAKRTMh5a4XxYwy/1veaITgUOGMtJemkndmvyBYajaz+Vmkqa0H
 gEtTc0yOObnq+BzSiYWsJ4n7MKC5+oGEjAkngelemqGBDnu08tnhSfTeUVFoZbuyjFr/
 luEfjrsxSNeJjKG6YZD8QDbW8YEkA+YJ5EaxcSpWIPA1cbmxy2tUkTywLK34tLzd2bdh
 CCMRbIB0+4g5URLwk3w9iaGK3UAkOXp0MJ+oC+SvPnJ1kKtXpFcAD/m1SDm+im25e2eG
 kr6Nu7mPyRgFrWUS/5l9N2oFLVf2cSVZGUPtZhcfIOIPdED9L2ywAfUC89hBYOvW5RKo
 UNyw==
X-Gm-Message-State: AC+VfDzy6sHnG6kip/OrTzpaClo43Q7bMHbiqT9SAmTPyBR5bpE6hhYB
 BDsamsmROzMuDqD7bTLyrRibbISH8YwffSsmSLt55Q==
X-Google-Smtp-Source: ACHHUZ7RrjBVxeiPnTBHmSCCLMfrXxm/8TnBZ0vXSriedUL3e/jPW6RvfN0do8qBW9XDI9H/K5jKMA==
X-Received: by 2002:ac2:599b:0:b0:4f1:1e31:96a9 with SMTP id
 w27-20020ac2599b000000b004f11e3196a9mr341106lfn.51.1682906550658; 
 Sun, 30 Apr 2023 19:02:30 -0700 (PDT)
Received: from vp-pc.. (109-252-127-135.nat.spd-mgts.ru. [109.252.127.135])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac254a7000000b004efe73ee01fsm3783271lfk.306.2023.04.30.19.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 19:02:30 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, peterx@redhat.com,
 marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, viktor@daynix.com, yan@daynix.com,
 yuri.benditovich@daynix.com
Subject: [RFC PATCH v2 2/4] virtio-pci: add handling of ATS and Device-TLB
 enable
Date: Mon,  1 May 2023 05:02:19 +0300
Message-Id: <20230501020221.188376-3-viktor@daynix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230501020221.188376-1-viktor@daynix.com>
References: <20230501020221.188376-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Guest may enable or disable PCI ATS and, accordingly, Device-TLB for
the device. Add a flag and a trigger function to handle Device-TLB
enable/disable in VirtIO devices and hook it to ATS enable/disable for
PCI transport.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/virtio/virtio-pci.c     | 17 +++++++++++++++++
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 247325c193..ccd8c4efa1 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -716,6 +716,18 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr addr,
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
+    if (k->toggle_device_iotlb)
+        k->toggle_device_iotlb(vdev, enable);
+}
+
 static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
                                 uint32_t val, int len)
 {
@@ -729,6 +741,11 @@ static void virtio_write_config(PCIDevice *pci_dev, uint32_t address,
         pcie_cap_flr_write_config(pci_dev, address, val, len);
     }
 
+    if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
+        pcie_ats_config_write(pci_dev, address, val, len,
+                virtio_pci_ats_ctrl_trigger);
+    }
+
     if (range_covers_byte(address, len, PCI_COMMAND)) {
         if (!(pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
             virtio_set_disabled(vdev, true);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index f236e94ca6..83d07bb6b7 100644
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
+    void (*toggle_device_iotlb)(VirtIODevice *vdev, bool enable);
 };
 
 void virtio_instance_init_common(Object *proxy_obj, void *data,
-- 
2.35.1


