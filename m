Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AC3C3F84
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:26:09 +0200 (CEST)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gxk-0001rP-4t
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjX-0007rG-0g
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gjV-0007Q4-6l
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:11:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id m2so11088717wrq.2
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eVIWfCIVMhcOo2kg3MCYw+w81wXdLPbXIbeUcYrRjBI=;
 b=Y5FEBEx4LC/PaqkzZln8A6nTI0WC9RsJCt2Z8WnWHl24K2pH5ddckwIUDmtpaWQY+L
 LvIVisV9Hve7aL65+E8g6GNvRnhdi2ZbYZBaMde5gBzPG72mZ7/HTS7xao9eCL7aC7u7
 ZwPvHAN5ivipGR10hWmvskKYwEYg/QtrzQY3VLTNcqZDiWilDCnm9IFcbxNSJgDg9KC9
 iJzuPDOdq7x1Od6dxYduqHRf+xn2V3oo3wHsfsZQGqUGMJuJQfyqiWXquPnYrhLJyY8F
 MzTT+W23yhPvlxiNs4hc0xPDy4HeOeGki66OQob5HxwKi/ZEqjADNC81oP2LYhjaIhcv
 Cnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eVIWfCIVMhcOo2kg3MCYw+w81wXdLPbXIbeUcYrRjBI=;
 b=t1b3heNPHMffcgS5hnXxPt24N+UXgh7J+G/v5FJoDlk/lBsymGgv/ks+m3XvSyQY2h
 WQcw0esMDEeOruw91X8jPbvBXzPu9teHD71zk4w+HnoF+/ICH8uQYuuenrny6nxLfWax
 GNfEVSluHmCSop6SEbtflHCtb7vUsfGuTi95kpYHw8cctEeL0pO5QswEPVsIb5oL0z9m
 9yEBZNypggWQ9nn8IgY+JqxNsQ3q+TxklV2eAsHNnqGk4X226uUixhDTUYoewtjtGi/C
 BWVyeAT7uCz7g5CoV6VLvp1Dwoj0A/o4FUcmuAc8311t9ZIGsKDzqnJzTsO+hUV/11Aa
 xqfw==
X-Gm-Message-State: AOAM53227l98nOISk/yNk4OCQj46GEVop3IV37GDdRJDu3HzO4/JUzz9
 5M0pVyj8xIw2mRinR+tNRjX+GV1088Cuw5mP
X-Google-Smtp-Source: ABdhPJyDoe7hn4Zax/teBSPzhLF7mIju+2DW9zVfmCCB+HaSowPWqyktC+HNY/B/+ZRVsSPfFkTAeA==
X-Received: by 2002:a5d:64ac:: with SMTP id m12mr14857980wrp.89.1626037883688; 
 Sun, 11 Jul 2021 14:11:23 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id x1sm19319556wmc.0.2021.07.11.14.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:11:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] hw/sd/sdcard: Check for valid address range in
 SEND_WRITE_PROT (CMD30)
Date: Sun, 11 Jul 2021 23:10:56 +0200
Message-Id: <20210711211057.2714586-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711211057.2714586-1-f4bug@amsat.org>
References: <20210711211057.2714586-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OSS-Fuzz found sending illegal addresses when querying the write
protection bits triggers an assertion:

  qemu-fuzz-i386: hw/sd/sd.c:824: uint32_t sd_wpbits(SDState *, uint64_t): Assertion `wpnum < sd->wpgrps_size' failed.
  ==11578== ERROR: libFuzzer: deadly signal
  #8 0x7ffff628e091 in __assert_fail
  #9 0x5555588f1a3c in sd_wpbits hw/sd/sd.c:824:9
  #10 0x5555588dd271 in sd_normal_command hw/sd/sd.c:1383:38
  #11 0x5555588d777c in sd_do_command hw/sd/sd.c
  #12 0x555558cb25a0 in sdbus_do_command hw/sd/core.c:100:16
  #13 0x555558e02a9a in sdhci_send_command hw/sd/sdhci.c:337:12
  #14 0x555558dffa46 in sdhci_write hw/sd/sdhci.c:1187:9
  #15 0x5555598b9d76 in memory_region_write_accessor softmmu/memory.c:489:5

Similarly to commit 8573378e62d ("hw/sd: fix out-of-bounds check
for multi block reads"), check the address range before sending
the status of the write protection bits.

Include the qtest reproducer provided by Alexander Bulekov:

  $ make check-qtest-i386
  ...
  Running test qtest-i386/fuzz-sdcard-test
  qemu-system-i386: ../hw/sd/sd.c:824: sd_wpbits: Assertion `wpnum < sd->wpgrps_size' failed.

Reported-by: OSS-Fuzz (Issue 29225)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/450
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210702155900.148665-4-f4bug@amsat.org>
---
 hw/sd/sd.c                     |  5 +++
 tests/qtest/fuzz-sdcard-test.c | 66 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                    |  3 +-
 tests/qtest/meson.build        |  1 +
 4 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/fuzz-sdcard-test.c

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 9c8dd11bad1..c753ae24ba9 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1379,6 +1379,11 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
         switch (sd->state) {
         case sd_transfer_state:
+            if (!address_in_range(sd, "SEND_WRITE_PROT",
+                                  req.arg, sd->blk_len)) {
+                return sd_r1;
+            }
+
             sd->state = sd_sendingdata_state;
             *(uint32_t *) sd->data = sd_wpbits(sd, req.arg);
             sd->data_start = addr;
diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
new file mode 100644
index 00000000000..96602eac7e5
--- /dev/null
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -0,0 +1,66 @@
+/*
+ * QTest fuzzer-generated testcase for sdcard device
+ *
+ * Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+
+/*
+ * https://gitlab.com/qemu-project/qemu/-/issues/450
+ * Used to trigger:
+ *  Assertion `wpnum < sd->wpgrps_size' failed.
+ */
+static void oss_fuzz_29225(void)
+{
+    QTestState *s;
+
+    s = qtest_init(" -display none -m 512m -nodefaults -nographic"
+                   " -device sdhci-pci,sd-spec-version=3"
+                   " -device sd-card,drive=d0"
+                   " -drive if=none,index=0,file=null-co://,format=raw,id=d0");
+
+    qtest_outl(s, 0xcf8, 0x80001010);
+    qtest_outl(s, 0xcfc, 0xd0690);
+    qtest_outl(s, 0xcf8, 0x80001003);
+    qtest_outl(s, 0xcf8, 0x80001013);
+    qtest_outl(s, 0xcfc, 0xffffffff);
+    qtest_outl(s, 0xcf8, 0x80001003);
+    qtest_outl(s, 0xcfc, 0x3effe00);
+
+    qtest_bufwrite(s, 0xff0d062c, "\xff", 0x1);
+    qtest_bufwrite(s, 0xff0d060f, "\xb7", 0x1);
+    qtest_bufwrite(s, 0xff0d060a, "\xc9", 0x1);
+    qtest_bufwrite(s, 0xff0d060f, "\x29", 0x1);
+    qtest_bufwrite(s, 0xff0d060f, "\xc2", 0x1);
+    qtest_bufwrite(s, 0xff0d0628, "\xf7", 0x1);
+    qtest_bufwrite(s, 0x0, "\xe3", 0x1);
+    qtest_bufwrite(s, 0x7, "\x13", 0x1);
+    qtest_bufwrite(s, 0x8, "\xe3", 0x1);
+    qtest_bufwrite(s, 0xf, "\xe3", 0x1);
+    qtest_bufwrite(s, 0xff0d060f, "\x03", 0x1);
+    qtest_bufwrite(s, 0xff0d0605, "\x01", 0x1);
+    qtest_bufwrite(s, 0xff0d060b, "\xff", 0x1);
+    qtest_bufwrite(s, 0xff0d060c, "\xff", 0x1);
+    qtest_bufwrite(s, 0xff0d060e, "\xff", 0x1);
+    qtest_bufwrite(s, 0xff0d060f, "\x06", 0x1);
+    qtest_bufwrite(s, 0xff0d060f, "\x9e", 0x1);
+
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    const char *arch = qtest_get_arch();
+
+    g_test_init(&argc, &argv, NULL);
+
+   if (strcmp(arch, "i386") == 0) {
+        qtest_add_func("fuzz/sdcard/oss_fuzz_29225", oss_fuzz_29225);
+   }
+
+   return g_test_run();
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 40d095dbbde..0e4e3761ebc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1824,7 +1824,8 @@ F: include/hw/sd/sd*
 F: hw/sd/core.c
 F: hw/sd/sd*
 F: hw/sd/ssi-sd.c
-F: tests/qtest/sd*
+F: tests/qtest/fuzz-sdcard-test.c
+F: tests/qtest/sdhci-test.c
 
 USB
 M: Gerd Hoffmann <kraxel@redhat.com>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ee7347b7275..e22a0792c58 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -21,6 +21,7 @@
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
   [
   'cdrom-test',
   'device-introspect-test',
-- 
2.31.1


