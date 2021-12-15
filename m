Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90729476348
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:28:35 +0100 (CET)
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxat8-0006ig-CV
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:28:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq2-0003s2-Mm
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:22 -0500
Received: from [2a00:1450:4864:20::436] (port=40729
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq0-0004Cm-Ae
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id t9so40236338wrx.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmUl3GHvDt5jkoLgxo7KE1syR+hCWNdVZ7f+9mI+wv8=;
 b=oy6DWqG3Sd4CAtOx81p9YE3qX1DSPETkaZIBVVhFMPCAkDeUKIIzV/N/B6t70FT8BO
 gFJQOJYanI7efSsXCyRF0chah1vReBx0kQ0GPhWrtTS65J/4PSit5ha0dDTnKuaZLoAo
 yD+OwCr5pBKKIwTqDLS4ggMkWr5lxrsk5b1MRYth6r0El7T6Bg3HhmKy6DP+hn+kzyJB
 DjTBBp0ID6hKTJW1Hy8qe7UQtYt4uEps1xs3riJ8lNJtXNl+rlLIYrxNGtUALm+NIPi6
 Vwu8YaqoIjzmvGbs5aNUSTCyZQEUA6nPeEtT+XN4hcvcfbvP4z/IWHiCdFNKc+zZCwYU
 M3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xmUl3GHvDt5jkoLgxo7KE1syR+hCWNdVZ7f+9mI+wv8=;
 b=C7oh2qrtgbSofWyPvl/KLXFU8uzZ7ncX74QNfobcg+FGl6IJTTvAb6ceikWvAlCAY2
 5YYRXFoozbjMBGeU6McXyVMWqHISWTkVjPKg1Hfo0Krs1DObZOrTWMKUGdMKe797lIhi
 AP/sn1oST2FThbIGN89lB5q3489H0LMtC5UZYtF/1kg5ecJ0nLlonKTvnFkq679nvT6I
 w5AVijShFBvwmXvzOWxShcemeD2mOac7ePf1nWDuma3FfWccO/vUekWoFtRuVxiz6MBR
 VodCYRAHlxHiOywok5ehebx0ZbsPlN/W1lBSj60qrN7uymv5d5xwb5lLqQzQ4ksrpEIz
 SJ2w==
X-Gm-Message-State: AOAM530LWUggaBK0HHCkJnNvCEOy9pZ1THXdqYx/NNUG4N/uSFWGljvw
 eAhaeVRid5mv7PTPGA33IH2QJvMOujk=
X-Google-Smtp-Source: ABdhPJxmpDA7MvWivE92p24Wxfm0DDctN5JZK24Q39vB4nRVwt+sZPffbFuJWG8zL5A+j2hHwwOY5A==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr6031383wrd.346.1639599918265; 
 Wed, 15 Dec 2021 12:25:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] tests/qtest: Add fuzz-lsi53c895a-test
Date: Wed, 15 Dec 2021 21:25:04 +0100
Message-Id: <20211215202515.91586-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Without the previous commit, this test triggers:

  $ make check-qtest-x86_64
  [...]
  Running test qtest-x86_64/fuzz-lsi53c895a-test
  qemu-system-x86_64: hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed.
  ERROR qtest-x86_64/fuzz-lsi53c895a-test - too few tests run (expected 1, got 0)

Suggested-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20211123111732.83137-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS                        |  1 +
 tests/qtest/fuzz-lsi53c895a-test.c | 52 ++++++++++++++++++++++++++++++
 tests/qtest/meson.build            |  1 +
 3 files changed, 54 insertions(+)
 create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 006a2293ba..4d2143ff23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1825,6 +1825,7 @@ F: hw/scsi/*
 F: tests/qtest/virtio-scsi-test.c
 F: tests/qtest/fuzz-virtio-scsi-test.c
 F: tests/qtest/am53c974-test.c
+F: tests/qtest/fuzz-lsi53c895a-test.c
 T: git https://github.com/bonzini/qemu.git scsi-next
 
 SSI
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
new file mode 100644
index 0000000000..ba5d468970
--- /dev/null
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QTest fuzzer-generated testcase for LSI53C895A device
+ *
+ * Copyright (c) Red Hat
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+
+/*
+ * This used to trigger the assert in lsi_do_dma()
+ * https://bugs.launchpad.net/qemu/+bug/697510
+ * https://bugs.launchpad.net/qemu/+bug/1905521
+ * https://bugs.launchpad.net/qemu/+bug/1908515
+ */
+static void test_lsi_do_dma_empty_queue(void)
+{
+    QTestState *s;
+
+    s = qtest_init("-M q35 -nographic -monitor none -serial none "
+                   "-drive if=none,id=drive0,"
+                            "file=null-co://,file.read-zeroes=on,format=raw "
+                   "-device lsi53c895a,id=scsi0 "
+                   "-device scsi-hd,drive=drive0,"
+                            "bus=scsi0.0,channel=0,scsi-id=0,lun=0");
+    qtest_outl(s, 0xcf8, 0x80001814);
+    qtest_outl(s, 0xcfc, 0xe1068000);
+    qtest_outl(s, 0xcf8, 0x80001818);
+    qtest_outl(s, 0xcf8, 0x80001804);
+    qtest_outw(s, 0xcfc, 0x7);
+    qtest_outl(s, 0xcf8, 0x80002010);
+
+    qtest_writeb(s, 0xe106802e, 0xff); /* Fill DSP bits 16-23 */
+    qtest_writeb(s, 0xe106802f, 0xff); /* Fill DSP bits 24-31: trigger SCRIPT */
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
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
+                       test_lsi_do_dma_empty_queue);
+    }
+
+    return g_test_run();
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9d8458062..d2ce20d304 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -19,6 +19,7 @@ slow_qtests = {
 
 qtests_generic = \
   (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
+  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) + \
   (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
   (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
   (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
-- 
2.33.1



