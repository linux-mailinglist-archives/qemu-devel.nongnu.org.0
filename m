Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24A64AB2B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 00:09:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4rsN-0007J7-OR; Mon, 12 Dec 2022 18:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rsL-0007Ia-Sv
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:21 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4rsJ-0004OJ-BL
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 18:06:21 -0500
Received: by mail-ej1-x62b.google.com with SMTP id vv4so32222177ejc.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 15:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3KQxbigNwbnJFF/mMfcF9eoBZIT7al/IuHf3vRLTZ0=;
 b=kKokPyOpV2qBsO9BWR5tIVuN8EzG65HxeM1W1RARp5lDUWfwp6sjI2QusU3guuqP5F
 xkLIBwityHWRgnelFlJIdz441Vsv6bae54CQEy7t1zG0qXWg/ImhJNSWjn3H/VeaaPxA
 BCJ8ugJdF2bGTPIVegEABvAI05vlLBRmUdpYAleGhZjV/CJMb9B99MlylV8bgwNKDPZ8
 GQexpeCnNvAPC/9g3LMBiW0/+KY1NFKXc4yttkb34UfSPIE97adD95R4Fh0inW8HfnVT
 DV2x1W7qcyr4CdPHdjABE3j28LvcmUQa4mVlEFcJJStkeDmqTrsF4+7IVukd8hgZW+5v
 uzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3KQxbigNwbnJFF/mMfcF9eoBZIT7al/IuHf3vRLTZ0=;
 b=LMN4D/MjSnkj9J1FdJigwTLx+KKLatkQEf52Tsiws8OxlkzmvS51vgC7vcCYNV1enZ
 icmDCvtSl5/h2DhDJSE7xdcymYjaEtXflWpIvkGoG6lYgLgkbDKGKfbQGKALim9sf62o
 3ei0dmbRuOKq9h/stiIJPY6/J56NCr77TRpo2c3kgIs2fPFggkjqGE7YNXHsUFzqvX6t
 RB5+ft195+pY4GyaICMfMcd3b/oTOzwh91ZKM7qAaNOdHjROSi4LD6MaqR7ivdGWDYi5
 sWch1IqhOJky21ABBjoJRSkc+BWnxVDKh06nOUFp8tTSWi/lBbej92NJNZbs91dZqiSV
 eN/A==
X-Gm-Message-State: ANoB5pn6KF14+OWso+Ts4XqhDoan9/par1hQIvqS5JRikBtUnuDRRjSc
 mLOVYDhGKLdYystupaCzsuTFQXdYIzkY/yqqogM=
X-Google-Smtp-Source: AA0mqf4RngbzXkgnewJRkJ3bSStLLyUTNkirK9OY5L9amU6VYQpoUkpgbK2bxvP6vAtr0Euh9A9q3Q==
X-Received: by 2002:a17:906:f1cb:b0:7c1:2529:b25e with SMTP id
 gx11-20020a170906f1cb00b007c12529b25emr16596600ejb.43.1670886377762; 
 Mon, 12 Dec 2022 15:06:17 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 hb14-20020a170906b88e00b007c10d47e748sm3846903ejb.36.2022.12.12.15.06.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Dec 2022 15:06:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 10/10] hw/virtio: Make most of virtio devices
 target-independent
Date: Tue, 13 Dec 2022 00:05:17 +0100
Message-Id: <20221212230517.28872-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212230517.28872-1-philmd@linaro.org>
References: <20221212230517.28872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Except the following files:
- virtio-config.c
- virtio-qmp.c
- virtio-iommu.c
- virtio-mem.c
- vhost-user-target.c
- vhost-vdpa.c
all other virtio related files are target independent and
can be compiled only once for a system emulation build,
avoiding compiling hundreds of objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Cross-built on ppc64le/s390x but not tested there.
---
 hw/9pfs/meson.build            |  2 +-
 hw/block/dataplane/meson.build |  2 +-
 hw/block/meson.build           |  4 ++--
 hw/char/meson.build            |  2 +-
 hw/net/meson.build             |  2 +-
 hw/virtio/meson.build          | 38 +++++++++++++++++-----------------
 6 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..ef37532dbf 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -18,4 +18,4 @@ fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
index 12c6a264f1..e2f3721ce2 100644
--- a/hw/block/dataplane/meson.build
+++ b/hw/block/dataplane/meson.build
@@ -1,2 +1,2 @@
-specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
 specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
diff --git a/hw/block/meson.build b/hw/block/meson.build
index b434d5654c..8a3ca43a5c 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -17,7 +17,7 @@ softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
-specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
-specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
+softmmu_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
 
 subdir('dataplane')
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 7b594f51b8..afd35649cd 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -18,6 +18,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
 softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
 
@@ -35,7 +36,6 @@ softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmua
 
 specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
-specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
 
 specific_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
diff --git a/hw/net/meson.build b/hw/net/meson.build
index ebac261542..8035aaa560 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -44,7 +44,7 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
 specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
 
 softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c'))
-specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'))
 
 if have_vhost_net
   softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('vhost_net.c'), if_false: files('vhost_net-stub.c'))
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index bf7e35fa8a..23be895c8e 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -1,38 +1,38 @@
 softmmu_virtio_ss = ss.source_set()
-softmmu_virtio_ss.add(files('virtio-bus.c'))
+softmmu_virtio_ss.add(files('virtio.c', 'virtio-bus.c'))
 softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virtio-pci.c'))
 softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'))
 
 specific_virtio_ss = ss.source_set()
-specific_virtio_ss.add(files('virtio.c'))
 specific_virtio_ss.add(files('virtio-config.c', 'virtio-qmp.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
+specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
 
 if have_vhost
-  specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
+  softmmu_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
   if have_vhost_user
-    specific_virtio_ss.add(files('vhost-user.c'))
+    softmmu_virtio_ss.add(files('vhost-user.c'))
     specific_virtio_ss.add(files('vhost-user-target.c'))
   endif
   if have_vhost_vdpa
-    specific_virtio_ss.add(files('vhost-vdpa.c', 'vhost-shadow-virtqueue.c'))
+    specific_virtio_ss.add(files('vhost-vdpa.c'))
+    softmmu_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
   endif
 else
   softmmu_virtio_ss.add(files('vhost-stub.c'))
 endif
 
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
-specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
-specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
-specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c', 'vhost-vsock-common.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c', 'vhost-vsock-common.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_I2C', if_true: files('vhost-user-i2c.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_RNG', if_true: files('vhost-user-rng.c'))
+softmmu_virtio_ss.add(when: 'CONFIG_VHOST_USER_GPIO', if_true: files('vhost-user-gpio.c'))
+softmmu_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_GPIO'], if_true: files('vhost-user-gpio-pci.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
@@ -59,7 +59,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem-pci.c'
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu-pci.c'))
 virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
 
-specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
+softmmu_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
 
 softmmu_ss.add_all(when: 'CONFIG_VIRTIO', if_true: softmmu_virtio_ss)
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
-- 
2.38.1


