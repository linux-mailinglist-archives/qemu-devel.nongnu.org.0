Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B466D1A9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXq5-0007h2-EL; Mon, 16 Jan 2023 17:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpK-0007Os-Ni
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:39 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpF-00070j-2Z
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4vdh1vkWnMmQfcKysM4+Bltuxfkki2MQxlTXmuTxb6E=; b=KGeLAQfZoO/ZgfuvkRvoylevLt
 kddIQ97Z+9ICCeMc5jpqJ3tQ5RBUj+YvRp7enm1yy5eiQc/QPIYYH01Y+I/CHspNRJ1vW/nN+1up6
 zzc3XYrboW8MTr9bbHrn4UHLqPzoQVJLWNaKg1Rfn4ertNapgzVvp4yZiThjvordGdGN/6MIEVv9t
 KYOuzt029JUr0NB3nS6Sojy7BEy5Q0zVuJnnbTNDRLX+0KnhMwua4Yi9MDD0Fs+bdSxFoYB59ou0F
 Fxd6iozbtQO/Ame16LaL1GLoROgaSPzO1BWBi9OG3JO/NOlbprt/uCP5T9Kz/HE3SrSdLrZPG7DIg
 Nu3N7Tgg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXoy-005juc-1a; Mon, 16 Jan 2023 22:19:16 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXp7-004iXr-2k; Mon, 16 Jan 2023 22:19:25 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [RFC PATCH v7bis 10/19] hw/xen: Build PV backend drivers for
 XENFV_MACHINE
Date: Mon, 16 Jan 2023 22:19:10 +0000
Message-Id: <20230116221919.1124201-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116221919.1124201-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116221919.1124201-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

Now that we have the redirectable Xen backend operations we can build the
PV backends even without the Xen libraries.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/9pfs/meson.build            | 2 +-
 hw/block/dataplane/meson.build | 2 +-
 hw/block/meson.build           | 2 +-
 hw/char/meson.build            | 2 +-
 hw/display/meson.build         | 2 +-
 hw/usb/meson.build             | 2 +-
 hw/xen/meson.build             | 5 ++++-
 7 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..ac5f37f229 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -15,7 +15,7 @@ fs_ss.add(files(
 ))
 fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
-fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
+fs_ss.add(when: 'CONFIG_XENFV_MACHINE', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
 specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
index 12c6a264f1..ca7b62fdc6 100644
--- a/hw/block/dataplane/meson.build
+++ b/hw/block/dataplane/meson.build
@@ -1,2 +1,2 @@
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
+specific_ss.add(when: 'CONFIG_XENFV_MACHINE', if_true: files('xen-block.c'))
diff --git a/hw/block/meson.build b/hw/block/meson.build
index b434d5654c..c51539970b 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
+softmmu_ss.add(when: 'CONFIG_XENFV_MACHINE', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 7b594f51b8..d6ef21bfe1 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -18,7 +18,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
 softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
+softmmu_ss.add(when: 'CONFIG_XENFV_MACHINE', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
 
 softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
diff --git a/hw/display/meson.build b/hw/display/meson.build
index f860c2c562..76852ab2de 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_PL110', if_true: files('pl110.c'))
 softmmu_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
 softmmu_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
 softmmu_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xenfb.c'))
+softmmu_ss.add(when: 'CONFIG_XENFV_MACHINE', if_true: files('xenfb.c'))
 
 softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 793df42e21..440df35028 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -84,6 +84,6 @@ if libusb.found()
   hw_usb_modules += {'host': usbhost_ss}
 endif
 
-softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
+softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XENFV_MACHINE', libusb], if_true: files('xen-usb.c'))
 
 modules += { 'hw-usb': hw_usb_modules }
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index f195bbd25c..0d1eddbca6 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -1,10 +1,13 @@
-softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+softmmu_ss.add(when: ['CONFIG_XENFV_MACHINE'], if_true: files(
   'xen-backend.c',
   'xen-bus-helper.c',
   'xen-bus.c',
   'xen-legacy-backend.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+))
+
+softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
   'xen-operations.c',
 ))
 
-- 
2.39.0


