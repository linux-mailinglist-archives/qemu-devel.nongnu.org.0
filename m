Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF82FBB0C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:24:30 +0100 (CET)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1srt-00070x-87
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfQ-00082O-VE
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfN-0001KQ-6K
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so12823870wrz.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ltWysjbhw6W7BnNrLw1y0sIaOF1OJ6S2BxOzq8NiVlk=;
 b=ZPALFKddNglxNcPAqyFel4fbluJzjmqv9D5zroP9ntMgzdDmKzPLWCI7CVftwTFrCz
 e5+JFS2hm/LsE32CCDHhM6ElDp6G8tB70kxfnUgGbqzwp6Rl8UgVj5VivLk3fgy8oFWe
 NgyFDZgqAgCmdUYOBQOlxhVsBN1+brzcs3JC16ZzjXHLRTlJlg6XbGPWRCJ+m4a45r0n
 dvxlFSyjjMCeO+CobPdjTFtwCqFf5rsV1+584vjsyUOx5brXE9REE8zDTqJnYExLV8i5
 rlr8UM/ET26Fop3zZWa+jQ4s48weJtGA2mH3orfEtfbDPVLwhbV7gS65M0qa30j2Wohd
 wJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltWysjbhw6W7BnNrLw1y0sIaOF1OJ6S2BxOzq8NiVlk=;
 b=TCOLKTVkUMCvIurS+geZ+pc1ouW7bPZ6BBAaDcznTs/+bAilF39d3gaTBGk71bK5UK
 d7L1/02dvyydVdjsVKIquLXJj3t37V+tfurfDyMpKA0J8wck4F677jfiCkC3UuBJntU4
 SGM863ZhTGrGFS4C6kzK9ZF6u5sNskK+2YPwHP2TnyT6otjlIyRtBorbe2S7XifxVS9B
 RrVcpi8C4SOC2l/d235LAS1UrZFHEpdCEp8J5mB2ocR02OluTnLIUzW2lVv3g7s9chB8
 T1O6beBLaTWuEwSPvoMo1CQtVS3/Q3bIQhUGizXC6wFfkcu6nquhq73uZlauGFMDkJSQ
 Uc/A==
X-Gm-Message-State: AOAM531UoKv19sL1v7nxpQzN3xPSooKfVq3JNfs/BwqKpkZ7e804tCeX
 uDiQv2ResxG35R4yzgWhVXcNXHUMjtkc0g==
X-Google-Smtp-Source: ABdhPJxkB11hGeqctdxqqlR8OMmgOHFsmqpYdTgJ2rugm/c8obmBGcBVRcS4qYX+bY13OU4HBcF36A==
X-Received: by 2002:a05:6000:124e:: with SMTP id
 j14mr4973267wrx.310.1611069091793; 
 Tue, 19 Jan 2021 07:11:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] tests/qtest: add a test case for pvpanic-pci
Date: Tue, 19 Jan 2021 15:11:01 +0000
Message-Id: <20210119151104.16264-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mihai Carabas <mihai.carabas@oracle.com>

Add a test case for pvpanic-pci device. The scenario is the same as pvpapnic
ISA device, but is using the PCI bus.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/pvpanic-pci-test.c | 62 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 tests/qtest/pvpanic-pci-test.c

diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
new file mode 100644
index 00000000000..79b8065619d
--- /dev/null
+++ b/tests/qtest/pvpanic-pci-test.c
@@ -0,0 +1,62 @@
+/*
+ * QTest testcase for PV Panic PCI device
+ *
+ * Copyright (C) 2020 Oracle
+ *
+ * Authors:
+ *     Mihai Carabas <mihai.carabas@oracle.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqos/libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "libqos/pci.h"
+#include "libqos/pci-pc.h"
+#include "hw/pci/pci_regs.h"
+
+static void test_panic(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+    QPCIBus *pcibus;
+    QPCIDevice *dev;
+    QPCIBar bar;
+
+    qts = qtest_init("-device pvpanic-pci");
+    pcibus = qpci_new_pc(qts, NULL);
+    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
+    qpci_device_enable(dev);
+    bar = qpci_iomap(dev, 0, NULL);
+
+    qpci_memread(dev, bar, 0, &val, sizeof(val));
+    g_assert_cmpuint(val, ==, 3);
+
+    val = 1;
+    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
+
+    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
+    g_assert(qdict_haskey(response, "data"));
+    data = qdict_get_qdict(response, "data");
+    g_assert(qdict_haskey(data, "action"));
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "pause");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+    qtest_add_func("/pvpanic-pci/panic", test_panic);
+
+    ret = g_test_run();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0e85343b96b..12e456ce946 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -20,6 +20,7 @@ endif
 
 qtests_pci = \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
+  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
 
 qtests_i386 = \
-- 
2.20.1


