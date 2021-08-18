Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C583F0C70
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:09:27 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRsM-000796-L9
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9s-0007Kr-A1
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:28 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9q-0002lD-Bi
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:28 -0400
Received: by mail-pf1-x435.google.com with SMTP id m26so3187487pff.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g45KC8rqTaQGX+JOi8qLzncGbZlY9CheJqFzbE3cYcU=;
 b=U1cjbmVmawSNnZ34nGau94spF59W4xOvkECKaYSltZTYqQ4TkcNLJpkz9Tne7JhQET
 L1hgeOiTcL4p/LxAH+GurQeL9wMXAjSh1+ywJUWniLTfmtkHhgiYQ35XFm/3SlAZ309N
 xCf3jejkqv3C3y9IdwkXtL16NzhoBNVgqPLJjyW+N+TC88ClOgyLXMCmLwmjiqFHo6eM
 avrhyG6YTquIa9Qb5DDO5Bt9Rc+2gHa9CBgWC83m/CEWB6XeIDXB1VnPZWB4MRAHuVKm
 iOTvjh9DpoOiW4hk76oMso4wNBPMlYdd849z9FQZgJTOAtkFS21pbl2pkzx+UVwH87yg
 +Otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g45KC8rqTaQGX+JOi8qLzncGbZlY9CheJqFzbE3cYcU=;
 b=i+n81Z6jWlclWSMAD+j0eu6Uzntxx4gIRlAj3S+VuJ4bH1h+fHJHxD7SwMISn1mPXq
 mo5gismLrSyQjEkEgOFvYJ4GM6cS/0CM1FuJ6Wlx2ar2Gsvt2+vUkNxRjvNOEcVTunhn
 PWjuY9YlhzJJ4fxi8FbuBvqgT8yrgquubb2iQpBEbuS5xBI5QnoixTqj0wgqk0k3P/ph
 +oqwj/No8tkaQH1KunlCPjC70lmPJx7axWZC139A1w5YN7Ya279RKEeHVjSEkRAXiJfi
 Dje2B/jo4+Az9yildBFCJME1oQowFAxaV0WGn6107bXmgbofvxgtBWEbFv3QbJ1vxbH3
 Dxhw==
X-Gm-Message-State: AOAM530mBlOYwD+rXnDmrGD/FcNorScudH/SRERhtTy29ZQR1CqNS+78
 LR9zpv3T1qFWrgBKWjuiYIQA15WChpqHaA==
X-Google-Smtp-Source: ABdhPJy6sz7rqRJauSAfBPdCoxaSadkiRaqGz4hhdNQN5QfY69m23ZXICGCEb24cP8wUAlOIR6EnrQ==
X-Received: by 2002:a05:6a00:a94:b029:384:1dc6:7012 with SMTP id
 b20-20020a056a000a94b02903841dc67012mr10864721pfl.53.1629314604954; 
 Wed, 18 Aug 2021 12:23:24 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 50/66] hw/core/cpu: Move cpu properties to cpu-sysemu.c
Date: Wed, 18 Aug 2021 09:19:04 -1000
Message-Id: <20210818191920.390759-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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


