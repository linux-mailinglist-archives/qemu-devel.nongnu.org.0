Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0133308828
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:17:18 +0100 (CET)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rm9-0001XC-UB
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWB-0004h9-NB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW0-00070g-8E
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c12so8392018wrc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BoKvlH3Fhi46hE67ztwWlR+zE+on7dVPNfaSS14thSg=;
 b=jKo/VjhhwdVzbZFRDLvM1njjYiXin0HD7F5x1r+oH62a2Qe3b0G117Ya41IZMEuIvf
 h52/1ZdkRPVSBRf7vatSWoSh+20DhtNoihndVqM23hcBMviPXVgZEnaBxM4CCaMxZ7QA
 2c5wMfouUvgNPFTgm6qQFzVgehye0rvgeFmKQmsfUxTGXBompoy0Sxh6svy0FdXjpKSQ
 C6VS7oO3H4ohoVe3zJoY29kugHqNe17251iEKoZtzspL5MaguQldfnzq8fmd3ZSdzjJu
 xlw89KqZFsZU5yq7pTKIm6YO+J6jBX6fyMeGel5UmVPzZ3ut8lNDTEiM0f/K22HeXWwP
 nn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BoKvlH3Fhi46hE67ztwWlR+zE+on7dVPNfaSS14thSg=;
 b=Y3d5MFlsz64fRzr6Y1qJ5TfoeDqx+FE+mk9JFPGx6XWB/412zKCyqXcDVG8iNpmzkB
 HlHiuqGJNaAzurPeLYWWEIu8URwW+upfTnMgYh3L4ZCO8xhesS7tkEw7z9N4ZUdMgoil
 3Yq5cOl97PKd+oLjIp/apsxyk3j4F3SYDi2gh19aBcqajEWMxm61ZVmx/1D8j0t4bBKY
 cKee7vs9DswHBEbgIONKq6mJ8O3A6QKeRlPeRKt+al9jQXYIYBaGWjQSRiq7IvaVibfY
 UvAOcdXfEBnjVVJfjQeNZPWY5ZatNqCUWmbUQ5hFmbEIqdxUFOuV0RwnhaRwbPqOO7ef
 r3vg==
X-Gm-Message-State: AOAM531CODE25NpXM6tFIPx10+mZmjLU8Sve9klkY97eO8208OwCn0ZW
 762BcgtkKTBHB7VGknQayFiTnWJRXixmng==
X-Google-Smtp-Source: ABdhPJyTz9cgYboCJXvedwUGkWWnkVo90eduvkZHrInIZYvVj/m09yq+396Q+BEOJgU0LQcx7aYI+Q==
X-Received: by 2002:a5d:58dc:: with SMTP id o28mr3875488wrf.414.1611918034248; 
 Fri, 29 Jan 2021 03:00:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/46] tests/qtest: add a test case for pvpanic-pci
Date: Fri, 29 Jan 2021 10:59:47 +0000
Message-Id: <20210129110012.8660-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Add a test case for pvpanic-pci device. The scenario is the same as pvpanic
ISA device, but is using the PCI bus.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/pvpanic-pci-test.c | 94 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 tests/qtest/pvpanic-pci-test.c

diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
new file mode 100644
index 00000000000..24b33c64a0b
--- /dev/null
+++ b/tests/qtest/pvpanic-pci-test.c
@@ -0,0 +1,94 @@
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
+static void test_panic_nopause(void)
+{
+    uint8_t val;
+    QDict *response, *data;
+    QTestState *qts;
+    QPCIBus *pcibus;
+    QPCIDevice *dev;
+    QPCIBar bar;
+
+    qts = qtest_init("-device pvpanic-pci,addr=04.0 -action panic=none");
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
+    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "run");
+    qobject_unref(response);
+
+    qtest_quit(qts);
+}
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
+    qts = qtest_init("-device pvpanic-pci,addr=04.0 -action panic=pause");
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
+    qtest_add_func("/pvpanic-pci/panic-nopause", test_panic_nopause);
+
+    ret = g_test_run();
+
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0e85343b96b..7ccdf023111 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -34,6 +34,7 @@ qtests_i386 = \
    config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_WDT_IB700') ? ['wdt_ib700-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_PVPANIC_ISA') ? ['pvpanic-test'] : []) +              \
+  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
   (config_all_devices.has_key('CONFIG_HDA') ? ['intel-hda-test'] : []) +                    \
   (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
-- 
2.20.1


