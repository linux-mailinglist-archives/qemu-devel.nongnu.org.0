Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27D2B3BAE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 04:09:56 +0100 (CET)
Received: from localhost ([::1]:59044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keUtv-0008E7-Ax
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 22:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keUtD-0007fC-4x; Sun, 15 Nov 2020 22:09:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keUtA-0005FA-Dm; Sun, 15 Nov 2020 22:09:10 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZDYC56ftzkXft;
 Mon, 16 Nov 2020 11:08:31 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 11:08:42 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH] ads7846: moves from the hw/display folder to the hw/input
 folder.
Date: Sun, 15 Nov 2020 20:35:03 +0800
Message-ID: <20201115123503.1110665-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:16:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, quintela@redhat.com, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ads7846 is a touch-screen controller that is an input device rather
than a display device, so move it to the hw/input folder.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 hw/arm/Kconfig                  | 2 +-
 hw/display/Kconfig              | 3 ---
 hw/display/meson.build          | 1 -
 hw/input/Kconfig                | 3 +++
 hw/{display => input}/ads7846.c | 0
 hw/input/meson.build            | 1 +
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename hw/{display => input}/ads7846.c (100%)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index fdf4464b94..75a771bc2d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -155,7 +155,7 @@ config TOSA
 
 config SPITZ
     bool
-    select ADS7846 # display
+    select ADS7846 # touch-screen controller
     select MAX111X # A/D converter
     select WM8750  # audio codec
     select MAX7310 # GPIO expander
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 15d59e10dc..ca46b5830e 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -9,9 +9,6 @@ config EDID
 config FW_CFG_DMA
     bool
 
-config ADS7846
-    bool
-
 config VGA_CIRRUS
     bool
     default y if PCI_DEVICES
diff --git a/hw/display/meson.build b/hw/display/meson.build
index dad3bd2b41..9d79e3951d 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -6,7 +6,6 @@ softmmu_ss.add(when: 'CONFIG_EDID', if_true: files('edid-generate.c', 'edid-regi
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb.c'))
 softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb-standalone.c'))
 
-softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
 softmmu_ss.add(when: 'CONFIG_VGA_CIRRUS', if_true: files('cirrus_vga.c'))
 softmmu_ss.add(when: ['CONFIG_VGA_CIRRUS', 'CONFIG_VGA_ISA'], if_true: files('cirrus_vga_isa.c'))
 softmmu_ss.add(when: 'CONFIG_G364FB', if_true: files('g364fb.c'))
diff --git a/hw/input/Kconfig b/hw/input/Kconfig
index 64f14daabf..55865bb386 100644
--- a/hw/input/Kconfig
+++ b/hw/input/Kconfig
@@ -1,6 +1,9 @@
 config ADB
     bool
 
+config ADS7846
+    bool
+
 config LM832X
     bool
     depends on I2C
diff --git a/hw/display/ads7846.c b/hw/input/ads7846.c
similarity index 100%
rename from hw/display/ads7846.c
rename to hw/input/ads7846.c
diff --git a/hw/input/meson.build b/hw/input/meson.build
index e7285b15ae..0042c3f0dc 100644
--- a/hw/input/meson.build
+++ b/hw/input/meson.build
@@ -1,5 +1,6 @@
 softmmu_ss.add(files('hid.c'))
 softmmu_ss.add(when: 'CONFIG_ADB', if_true: files('adb.c', 'adb-mouse.c', 'adb-kbd.c'))
+softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
 softmmu_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
 softmmu_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
 softmmu_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
-- 
2.23.0


