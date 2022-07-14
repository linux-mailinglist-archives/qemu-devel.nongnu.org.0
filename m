Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6557522F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:48:57 +0200 (CEST)
Received: from localhost ([::1]:38428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC15D-0002lT-7l
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11x-0005Hr-B0; Thu, 14 Jul 2022 11:45:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC11p-0000ZB-2H; Thu, 14 Jul 2022 11:45:29 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjG4hVyz4xj5;
 Fri, 15 Jul 2022 01:45:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjD6RqCz4xdJ;
 Fri, 15 Jul 2022 01:45:20 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/19] aspeed: Add fby35 skeleton
Date: Thu, 14 Jul 2022 17:44:45 +0200
Message-Id: <20220714154456.2565189-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <peter@pjd.dev>

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705191400.41632-6-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/fby35.c     | 39 +++++++++++++++++++++++++++++++++++++++
 MAINTAINERS        |  1 +
 hw/arm/meson.build |  3 ++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fby35.c

diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
new file mode 100644
index 000000000000..03b458584c26
--- /dev/null
+++ b/hw/arm/fby35.c
@@ -0,0 +1,39 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * This code is licensed under the GPL version 2 or later. See the COPYING
+ * file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+
+#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
+OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
+
+struct Fby35State {
+    MachineState parent_obj;
+};
+
+static void fby35_init(MachineState *machine)
+{
+}
+
+static void fby35_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Meta Platforms fby35";
+    mc->init = fby35_init;
+}
+
+static const TypeInfo fby35_types[] = {
+    {
+        .name = MACHINE_TYPE_NAME("fby35"),
+        .parent = TYPE_MACHINE,
+        .class_init = fby35_class_init,
+        .instance_size = sizeof(Fby35State),
+    },
+};
+
+DEFINE_TYPES(fby35_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 450abd025271..fce6161ce506 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1065,6 +1065,7 @@ F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
+F: hw/arm/fby35.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 2d8381339c07..92f9f6e000ea 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
   'aspeed.c',
   'aspeed_ast2600.c',
-  'aspeed_ast10x0.c'))
+  'aspeed_ast10x0.c',
+  'fby35.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
 arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-- 
2.35.3


