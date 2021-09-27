Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A0419BE5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:21:45 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuK0-0006FD-Tc
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2g-000412-VW
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2b-0003bt-CN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpP5Tl9WYK/fILavty5FzAb3Tv6ivEOl60j6QfURE0k=;
 b=hFDbvtTvWOkuLkIUSxItQ0K/m6UkbiBgohEVig8bR9syqoruibdgux5xLfdzc/F2AGN8p7
 fCE2MEEvlCie7PHeEEzOFFJUjPC5oLJG38/lYJJy7M+2pjzmkJRB7inYIE49lPcwwITvze
 7RLKg9Ui95a1wvUqIStmMnhhte6s3/w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-5Z6QnPB8PXKtTPP5otfalg-1; Mon, 27 Sep 2021 13:03:42 -0400
X-MC-Unique: 5Z6QnPB8PXKtTPP5otfalg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j16-20020adfa550000000b0016012acc443so14341373wrb.14
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpP5Tl9WYK/fILavty5FzAb3Tv6ivEOl60j6QfURE0k=;
 b=dxkgXb2MoOVhw6oMUOeBtAtLa1L0yYjWeAhDTHBlsHhHWD2QP61bSHLnwnsb0e/zyQ
 VhoLza9RukramVw2D1HLp+XGE6ILHBwKDlQ62AhU4sZfz2/Esr9upIDTVHv1dANxDMND
 H2EPt11qplpxitY8sMBP7yTa2I5OJ48SJrgnL1KHq51t4Vze1vz142Sy9VXU/ivtJFaw
 W4qhF5oTZLj5UOKAYZnUWq2Bl7c9x8ss1obE//asL9sPvZrxeZi5r+vjmmJSWErVHDEL
 fXLHRYvMAlNY8zoY0UW4uw10y+HQpgwGgEHa92fxnf/F0CwMmO1aDxRS3kUkdXSgEt7i
 wsEQ==
X-Gm-Message-State: AOAM533Lv33erhMCIa19eVzTgzitTzdMEi25JjXntWiodS59m3srrMYF
 6xFPGxwEMDCOQYVNWrZgIWumw1z9+aEkOvSOYyvqYnENkxrESD3ONCkZ3l5Nn6zdimZxL3aVq87
 b56A07PmDQ75yBYmkNlTzpOB6BgwRCCe9AiFQwNMJ5q2oZ3+w71foyLQ+Wdv/51NI
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr131338wmb.158.1632762221031;
 Mon, 27 Sep 2021 10:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0vJxZGZvTxGY47QttacHGTYMYUABrc5tJNBpja/T2/x7ZN6Z1W6NSaXv48Q6ltnF+VkRYFA==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr131303wmb.158.1632762220678;
 Mon, 27 Sep 2021 10:03:40 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id e5sm17224018wrd.1.2021.09.27.10.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] qemu: Split machine_ppc.py acceptance tests
Date: Mon, 27 Sep 2021 19:02:22 +0200
Message-Id: <20210927170227.2014482-17-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Gibson <david@gibson.dropbear.id.au>

machine_ppc.py contains tests for 3 different ppc based machine types.  It
is listed in MAINTAINERS along with the PPC TCG cpu code.  That's not
really accurate though, since it's really more about testing those machines
than the CPUs.

Therefore, split it up into separate files for the separate machine types,
and list those along with their machine types in MAINTAINERS.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210927044808.73391-2-david@gibson.dropbear.id.au>
---
 MAINTAINERS                          |  4 +-
 tests/acceptance/machine_ppc.py      | 69 ----------------------------
 tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
 tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
 tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
 5 files changed, 104 insertions(+), 70 deletions(-)
 delete mode 100644 tests/acceptance/machine_ppc.py
 create mode 100644 tests/acceptance/ppc_mpc8544ds.py
 create mode 100644 tests/acceptance/ppc_pseries.py
 create mode 100644 tests/acceptance/ppc_virtex_ml507.py

diff --git a/MAINTAINERS b/MAINTAINERS
index f98523cfe0f..bf1fc5b21e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -274,7 +274,6 @@ F: target/ppc/
 F: hw/ppc/
 F: include/hw/ppc/
 F: disas/ppc.c
-F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
@@ -1270,6 +1269,7 @@ L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mpc8544ds.c
 F: hw/ppc/mpc8544_guts.c
+F: tests/acceptance/ppc_mpc8544ds.py
 
 New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
@@ -1340,6 +1340,7 @@ F: tests/qtest/spapr*
 F: tests/qtest/libqos/*spapr*
 F: tests/qtest/rtas*
 F: tests/qtest/libqos/rtas*
+F: tests/acceptance/ppc_pseries.py
 
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
@@ -1361,6 +1362,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/virtex_ml507.c
+F: tests/acceptance/ppc_virtex_ml507.py
 
 sam460ex
 M: BALATON Zoltan <balaton@eik.bme.hu>
diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
deleted file mode 100644
index a836e2496f1..00000000000
--- a/tests/acceptance/machine_ppc.py
+++ /dev/null
@@ -1,69 +0,0 @@
-# Test that Linux kernel boots on ppc machines and check the console
-#
-# Copyright (c) 2018, 2020 Red Hat, Inc.
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or
-# later.  See the COPYING file in the top-level directory.
-
-from avocado.utils import archive
-from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
-
-class PpcMachine(Test):
-
-    timeout = 90
-    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
-    panic_message = 'Kernel panic - not syncing'
-
-    def test_ppc64_pseries(self):
-        """
-        :avocado: tags=arch:ppc64
-        :avocado: tags=machine:pseries
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
-                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
-                      '/ppc/ppc64/vmlinuz')
-        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
-        self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        wait_for_console_pattern(self, console_pattern, self.panic_message)
-
-    def test_ppc_mpc8544ds(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:mpc8544ds
-        """
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2020/download/day17.tar.gz')
-        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
-        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        archive.extract(file_path, self.workdir)
-        self.vm.set_console()
-        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
-        self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
-                                 self.panic_message)
-
-    def test_ppc_virtex_ml507(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:virtex-ml507
-        """
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2020/download/hippo.tar.gz')
-        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
-        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        archive.extract(file_path, self.workdir)
-        self.vm.set_console()
-        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
-                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
-                         '-m', '512')
-        self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
-                                 self.panic_message)
diff --git a/tests/acceptance/ppc_mpc8544ds.py b/tests/acceptance/ppc_mpc8544ds.py
new file mode 100644
index 00000000000..ce840600c1c
--- /dev/null
+++ b/tests/acceptance/ppc_mpc8544ds.py
@@ -0,0 +1,32 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class Mpc8544dsMachine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc_mpc8544ds(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:mpc8544ds
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/day17.tar.gz')
+        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
diff --git a/tests/acceptance/ppc_pseries.py b/tests/acceptance/ppc_pseries.py
new file mode 100644
index 00000000000..f14a884ee16
--- /dev/null
+++ b/tests/acceptance/ppc_pseries.py
@@ -0,0 +1,35 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class pseriesMachine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc64_pseries(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:pseries
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
+                      '/ppc/ppc64/vmlinuz')
+        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        wait_for_console_pattern(self, console_pattern, self.panic_message)
diff --git a/tests/acceptance/ppc_virtex_ml507.py b/tests/acceptance/ppc_virtex_ml507.py
new file mode 100644
index 00000000000..27f7bf2d492
--- /dev/null
+++ b/tests/acceptance/ppc_virtex_ml507.py
@@ -0,0 +1,34 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class VirtexMl507Machine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc_virtex_ml507(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:virtex-ml507
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/hippo.tar.gz')
+        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
+                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
+                         '-m', '512')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
-- 
2.31.1


