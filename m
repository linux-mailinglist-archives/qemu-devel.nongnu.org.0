Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506B53F8AEB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:21:36 +0200 (CEST)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHCB-0001qo-Cr
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mJH7a-0002j5-Nz; Thu, 26 Aug 2021 11:16:50 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:22686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mJH7X-0002HT-FO; Thu, 26 Aug 2021 11:16:49 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17QFDZ6k022016;
 Thu, 26 Aug 2021 23:13:35 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Thu, 26 Aug 2021 23:13:36 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>, <alistair23@gmail.com>, 
 <wangjunqiang@iscas.ac.cn>, <bin.meng@windriver.com>
Subject: [RFC PATCH 1/2] Adding Kconfig options for custom CSR support and
 Andes CPU model
Date: Thu, 26 Aug 2021 23:13:31 +0800
Message-ID: <20210826151332.32753-2-ruinland@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20210826151332.32753-1-ruinland@andestech.com>
References: <20210826151332.32753-1-ruinland@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17QFDZ6k022016
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
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
Cc: Ruinland ChuanTzu Tsai <ruinland@andestech.com>, dylan@andestech.com,
 imruinland.cs00@g2.nctu.edu.tw, alankao@andestech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>

Introduce Kconfig to target/riscv/Kconfig.
RISCV_CUSTOM_CSR will be toggled if ANDES_CORE is selected.

We need to modify meson.build for handling linux-user in a reasonable way.
Otherwise, all Kconfig options goes into *-config-devices.h which won't be
accessible for linux-user mode.
---
 Kconfig              |  1 +
 meson.build          | 26 ++++++++++++++++++++++++++
 target/riscv/Kconfig |  6 ++++++
 3 files changed, 33 insertions(+)
 create mode 100644 target/riscv/Kconfig

diff --git a/Kconfig b/Kconfig
index bf694c4..d2cc9c7 100644
--- a/Kconfig
+++ b/Kconfig
@@ -2,3 +2,4 @@ source Kconfig.host
 source backends/Kconfig
 source accel/Kconfig
 source hw/Kconfig
+source ./target/riscv/Kconfig
diff --git a/meson.build b/meson.build
index 736810e..8a8413d 100644
--- a/meson.build
+++ b/meson.build
@@ -1315,7 +1315,33 @@ foreach target : target_dirs
     endif
   endforeach
 
+
   config_target_data = configuration_data()
+
+  #Parse RISC-V custom definitions in advance. FIXME: rewrite core detection
+  if config_target['TARGET_BASE_ARCH'] == 'riscv'
+    config_riscv_custom_mak = 'riscv-custom-' + target + '-config-target.mak'
+    config_riscv_custom_mak = configure_file(
+      input: ['default-configs/targets/rv_custom' / target + '.mak', 'Kconfig'],
+      output: config_riscv_custom_mak,
+      depfile: config_riscv_custom_mak + '.d',
+      capture: true,
+      command: [minikconf,
+                get_option('default_devices') ? '--defconfig' : '--allnoconfig',
+                config_riscv_custom_mak, '@DEPFILE@', '@INPUT@',
+                host_kconfig, accel_kconfig])
+
+    rvcustom_parse = keyval.load(config_riscv_custom_mak)
+    foreach k, v : rvcustom_parse
+      if k == 'CONFIG_RISCV_CUSTOM_CSR'
+        config_target_data.set(k, 1)
+      endif
+      if k == 'CONFIG_ANDES_CORE'
+        config_target_data.set(k, 1)
+      endif
+    endforeach
+  endif
+
   foreach k, v: config_target
     if not k.startswith('TARGET_') and not k.startswith('CONFIG_')
       # do nothing
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
new file mode 100644
index 0000000..a0b09aa
--- /dev/null
+++ b/target/riscv/Kconfig
@@ -0,0 +1,6 @@
+config RISCV_CUSTOM_CSR
+    bool
+config ANDES_CORE
+    bool
+    select RISCV_CUSTOM_CSR
+    default n
-- 
2.32.0


