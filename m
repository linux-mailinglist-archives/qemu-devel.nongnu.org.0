Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52493DE59C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:41:01 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmEf-0006ry-0D
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAltA-0005tx-0r
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:48 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt8-0005Jg-3L
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:47 -0400
Received: by mail-pl1-x632.google.com with SMTP id z3so20833615plg.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g45KC8rqTaQGX+JOi8qLzncGbZlY9CheJqFzbE3cYcU=;
 b=Xnb5sgj6EtZrNOBayZQqfKDoxlmpw57if8jPizIVnZUY4GlMb/72SoQDt6Kve4mdyG
 RYmB0uo/XbJNCV63mCS2Pq4JHDpLhbI6S/Ol6b8CK96dYj0tjGqb85d/Ud78TKZdsdRm
 sr7ZQLtlEmqltwgr1rlk5hUTv0Fm4KuJ5MRxM2wDhJHov2tvYbD+ksB7POpGeuWwuHpv
 JHeLKIPRzz9xY/sctsgv2pmEdeNuSBBx2pYG9PrJLQPl01BEqo24mY6uLWnExtqFCv3h
 7Zp4Vtiqr4A5fCpdeZPswVmgdyUo3aobuIBoVy34c823yU0OEpQQ7obb4XhAX35IWpF6
 qeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g45KC8rqTaQGX+JOi8qLzncGbZlY9CheJqFzbE3cYcU=;
 b=FYE23HHUO5O45oyo0PFrYGRiXnR+z/jXyNV92NsBXMjCHILZGHmlm+82KJTYxT6pQb
 4Kj5e1Ul9ng227X7+M9sxEZUlslA82VZAN5slRx6o2hp11sXvIsPIcAOO3TWeTA5qykX
 GgPdp+xMO8Fg8IzfQ0rHgHPz93vF7JSO/xu5OZBbdZ/S/W9TIsJuI2QcSORhzHGMkzOK
 8kpmBpbYNZkODCYQGAlLHR/c9LoClwRSMFboQLlXxK3GbmOG/4lQ2zKJy4BlxOPEPFs3
 81eH7gJQ7U/mC5zBH5gISb0O9ruBHmlDawxFV61yFuUhDYXMsTH6gSN6Q0Nfp2S+VzsT
 XSoA==
X-Gm-Message-State: AOAM532Lfqm/LeRV5Gkvy853WMzTB/WOMVEIc75ay7fiZy1nlZ1VGIkJ
 3vaZNZAshIlK+7CTp1VuOFFqTMZdOlqEUA==
X-Google-Smtp-Source: ABdhPJxdIFNeU0NeIFzD7TeFwmVdjmbDwMmZlCUWXwVI063UzcAaIFFJ3qIppyJrUk9GFvSRgs0aHA==
X-Received: by 2002:a17:90a:8b95:: with SMTP id
 z21mr2290651pjn.131.1627964324664; 
 Mon, 02 Aug 2021 21:18:44 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 49/55] hw/core/cpu: Move cpu properties to cpu-sysemu.c
Date: Mon,  2 Aug 2021 18:14:37 -1000
Message-Id: <20210803041443.55452-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

The comment in cpu-common.c is absolutely correct, we can't
rely on the ifdef in a file built once.  This was only "working"
because we used ifndef.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.h | 17 +++++++++++++++++
 hw/core/cpu-common.c | 18 ++----------------
 hw/core/cpu-sysemu.c | 24 ++++++++++++++++++++++++
 hw/core/cpu-user.c   | 22 ++++++++++++++++++++++
 hw/core/meson.build  |  4 ++++
 5 files changed, 69 insertions(+), 16 deletions(-)
 create mode 100644 hw/core/cpu-common.h
 create mode 100644 hw/core/cpu-user.c

diff --git a/hw/core/cpu-common.h b/hw/core/cpu-common.h
new file mode 100644
index 0000000000..9049f74e67
--- /dev/null
+++ b/hw/core/cpu-common.h
@@ -0,0 +1,17 @@
+/*
+ * QEMU CPU model
+ *
+ * Copyright (c) 2014 SUSE LINUX Products GmbH
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CORE_CPU_COMMON_H
+#define HW_CORE_CPU_COMMON_H
+
+void cpu_class_init_props(DeviceClass *dc);
+
+#endif
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index e2f5a64604..6406ea79f0 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
+#include "cpu-common.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
@@ -257,21 +258,6 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
-static Property cpu_common_props[] = {
-#ifndef CONFIG_USER_ONLY
-    /* Create a memory property for softmmu CPU object,
-     * so users can wire up its memory. (This can't go in hw/core/cpu.c
-     * because that file is compiled only once for both user-mode
-     * and system builds.) The default if no link is set up is to use
-     * the system address space.
-     */
-    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-#endif
-    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cpu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -286,7 +272,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
     dc->reset = cpu_common_reset;
-    device_class_set_props(dc, cpu_common_props);
+    cpu_class_init_props(dc);
     /*
      * Reason: CPUs still need special care by board code: wiring up
      * IRQs, adding reset handlers, halting non-first CPUs, ...
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f8929..5a62960f3c 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -20,8 +20,11 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/memory.h"
 #include "hw/core/cpu.h"
 #include "hw/core/sysemu-cpu-ops.h"
+#include "hw/qdev-properties.h"
+#include "cpu-common.h"
 
 bool cpu_paging_enabled(const CPUState *cpu)
 {
@@ -143,3 +146,24 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     }
     return res;
 }
+
+/*
+ * This can't go in hw/core/cpu-common.c because that file is compiled only
+ * once for both user-mode and system builds.
+ */
+static Property cpu_sysemu_props[] = {
+    /*
+     * Create a memory property for softmmu CPU object, so users can wire
+     * up its memory. The default if no link is set up is to use the
+     * system address space.
+     */
+    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+    DEFINE_PROP_BOOL("start-powered-off", CPUState, start_powered_off, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+void cpu_class_init_props(DeviceClass *dc)
+{
+    device_class_set_props(dc, cpu_sysemu_props);
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
new file mode 100644
index 0000000000..62037e8669
--- /dev/null
+++ b/hw/core/cpu-user.c
@@ -0,0 +1,22 @@
+/*
+ * QEMU CPU model (user-only emulation specific)
+ *
+ * Copyright (c) 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/core/cpu.h"
+#include "cpu-common.h"
+
+/*
+ * This can't go in hw/core/cpu-common.c because that file is compiled only
+ * once for both user-mode and system builds.
+ */
+void cpu_class_init_props(DeviceClass *dc)
+{
+}
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 18f44fb7c2..4b3de4e247 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -43,3 +43,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
   'numa.c',
 ))
+
+specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files(
+  'cpu-user.c'
+))
-- 
2.25.1


