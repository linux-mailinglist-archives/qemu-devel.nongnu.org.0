Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550473BA307
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 18:02:28 +0200 (CEST)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLcZ-00068q-90
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 12:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZa-0003Ds-PY; Fri, 02 Jul 2021 11:59:27 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZZ-0004J8-10; Fri, 02 Jul 2021 11:59:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id l1so6951069wme.4;
 Fri, 02 Jul 2021 08:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEFMkPrEpfTYMfcx+GauUTLFahHxPHQ6xFUWavBNufI=;
 b=c8eKygzMbnVXK4KgfTLLkqXgztOogIDHqCfCPFkG3pDX1rOD5WPWRh7VipIBv/G6EY
 /1Cjk0XzxhkhO5X/oLmX1EnujkUNj/xMhgMO3ckpiYqZ+ph+pBHJ1GcuAd6A5mfA/PdG
 f1ei1ULqPlQivqKF6PP8bsXXIXFc/H05KM+kXyQr3JR3TjKxALwTqWZI52NxKBt9c573
 Xo//qwlfU+a8sFzQfCtq1534wMkSryIAJ/5Lg2BL4o3ZFdOLFOAubYWXuqYvN9sv6DHV
 F7adR9y1PtHe2ENF5lVJgoNPFcRvWfwSV+JBXBjmZbT/Hs1ZaDnlNhtwoCTJg4O50yA7
 qNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eEFMkPrEpfTYMfcx+GauUTLFahHxPHQ6xFUWavBNufI=;
 b=miNVwR2aBzO6aoDMgfMb0gHvzplym3GcbLkOfV0L691V/zDHbp8zeA50hNyrcq/S3B
 CChYmjoWVUX6Y+g85xKmhtLPtIbamqIomvO2nw/RzaHuOtJUfq4PSko9BRa76bERBF1z
 xr2TdSxYUFGOJkYpzFrVzkXPKItg3VC92j+tRDynDClBSUUzFM+ml9aRuNn9WILA1D/u
 zkw9F3L5eovgMz+wtkhggTIpbW+qNrXKGOH0CIXgZmgDkcZfW+/qmA6MMJ18/ntPw+Nn
 9WX+edCGf6zNIJbfP2kIE2oNQYVHtNXclgvdI/x52KUnP1xiMGa81w0bHU/qbmuXjAfs
 8Xfw==
X-Gm-Message-State: AOAM533UmWqQATPZHz+S9DkOdKuzTcVzTI4O6K4gV04kfBulU3aB9zpK
 HRikqZkiR07/cofgIEEHsoV5eI/knUI9iw==
X-Google-Smtp-Source: ABdhPJzeNHwAr4shu1i8Ebqt7VAIg+pp3ZAdcAR/oO1aLXUBQrk7YLSItOLrYAJWwO5bHPztqkLkqg==
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr456000wmi.187.1625241558746; 
 Fri, 02 Jul 2021 08:59:18 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id f2sm3703287wrq.69.2021.07.02.08.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:59:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/sd: Check for valid address range in SEND_WRITE_PROT
 (CMD30)
Date: Fri,  2 Jul 2021 17:59:00 +0200
Message-Id: <20210702155900.148665-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702155900.148665-1-f4bug@amsat.org>
References: <20210702155900.148665-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Michael Olbrich <m.olbrich@pengutronix.de>
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
index cfbf7ef79bc..fb33fe12200 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1794,7 +1794,8 @@ F: include/hw/sd/sd*
 F: hw/sd/core.c
 F: hw/sd/sd*
 F: hw/sd/ssi-sd.c
-F: tests/qtest/sd*
+F: tests/qtest/fuzz-sdcard-test.c
+F: tests/qtest/sdhci-test.c
 
 USB
 M: Gerd Hoffmann <kraxel@redhat.com>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index b03e8541700..1bb75ee7324 100644
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


