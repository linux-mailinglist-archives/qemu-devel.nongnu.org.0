Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D416D6AE8F2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaxF-0003FC-W7; Tue, 07 Mar 2023 12:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZax2-0002Hj-Qu
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:14 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZax1-0007TB-11
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LCuGhkStdX7AYXdKG03Aj3hRWhx9QALsH27R8ZBBwAE=; b=irHWC2CWbld2HraL4VmIX2sxRv
 cqhSmZeKW2DkoE0UqImkOuoTgiB77r2xxiSd3JDjK2DAgC3ArDj8uYrZCQDg4tSLnRfy8pvuxQCKR
 Do7ZAwUI5p1xYv/q0Gdu6pmzmtvU53xb6FosxYqhsIhJ0yha9cWd9X27pcphl5FH7+Q2/VRpuc315
 vLVECVz1ZxAVh6g+sQqP0l8mxSf2rP3vxP66WNKc/QtAGW/pSO2C/jGENGiBqJ009PFaJQfOrQ65m
 Z3+CJLm9FcvOBg5RTlBlQdYgDFG0tENidC74skQZpNrs0L2/kXUdqUk8CAhmXGlp4wRHz0RKYjgzg
 ErU7Nqjw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZawk-00H605-1E; Tue, 07 Mar 2023 17:17:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZawk-009chc-0p; Tue, 07 Mar 2023 17:17:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/27] hw/xen: Build PV backend drivers for CONFIG_XEN_BUS
Date: Tue,  7 Mar 2023 17:17:40 +0000
Message-Id: <20230307171750.2293175-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307171750.2293175-1-dwmw2@infradead.org>
References: <20230307171750.2293175-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+98a25f4d4d04c9e21499+7135+infradead.org+dwmw2@desiato.srs.infradead.org;
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
Reviewed-by: Paul Durrant <paul@xen.org>
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
index 12443b6ad5..fd37b7a02d 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -15,7 +15,7 @@ fs_ss.add(files(
 ))
 fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
 fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
-fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
+fs_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
 specific_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-9p-device.c'))
diff --git a/hw/block/dataplane/meson.build b/hw/block/dataplane/meson.build
index 12c6a264f1..78d7ac1a11 100644
--- a/hw/block/dataplane/meson.build
+++ b/hw/block/dataplane/meson.build
@@ -1,2 +1,2 @@
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
+specific_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
diff --git a/hw/block/meson.build b/hw/block/meson.build
index b434d5654c..cc2a75cc50 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
+softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 7b594f51b8..e02c60dd54 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -18,7 +18,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
 softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
+softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
 
 softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
diff --git a/hw/display/meson.build b/hw/display/meson.build
index f470179122..4191694380 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(when: 'CONFIG_PL110', if_true: files('pl110.c'))
 softmmu_ss.add(when: 'CONFIG_SII9022', if_true: files('sii9022.c'))
 softmmu_ss.add(when: 'CONFIG_SSD0303', if_true: files('ssd0303.c'))
 softmmu_ss.add(when: 'CONFIG_SSD0323', if_true: files('ssd0323.c'))
-softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xenfb.c'))
+softmmu_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xenfb.c'))
 
 softmmu_ss.add(when: 'CONFIG_VGA_PCI', if_true: files('vga-pci.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_ISA', if_true: files('vga-isa.c'))
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index bdf34cbd3e..599dc24f0d 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -84,6 +84,6 @@ if libusb.found()
   hw_usb_modules += {'host': usbhost_ss}
 endif
 
-softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN', libusb], if_true: files('xen-usb.c'))
+softmmu_ss.add(when: ['CONFIG_USB', 'CONFIG_XEN_BUS', libusb], if_true: files('xen-usb.c'))
 
 modules += { 'hw-usb': hw_usb_modules }
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index f195bbd25c..19c6aabc7c 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -1,10 +1,13 @@
-softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: files(
+softmmu_ss.add(when: ['CONFIG_XEN_BUS'], if_true: files(
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


