Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE963D743
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NWt-0004mM-JT; Wed, 30 Nov 2022 08:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWo-0004km-P1
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:34 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWk-0003bu-Kr
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id y16so7442117wrm.2
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjwwaNh2aYs+3FpXFQtWY38JR8kt7/RLknMm10DQ6GY=;
 b=hmox/PGrHmsdiB3XtiKBqkjDJAcsylQAexqdzjEKJ7hHcfhtC2wiQXVDND6/D6AF6R
 PkGFQJwtSyMik+dCpYisHgrIdqpQ/TETwn7hgTmwUVIYXxRZu5SUOQM9RM/o1z5GTs2V
 ruv2ZLFTRuVlJ2RvHFNqwwam3vWc2rb10XoWfEVNXEXKSjwWVOptvOzyq2TWmy7psS5x
 OQw36Yj6g8vKaA9X9Zgp5qvV5O48yhHUgZw4hvUH+3CtTzjBkrzWe+l/Hpa0V0cNsMZi
 ftpmtkOKX89sfzxsIqI1AbeQSuAO/cBeJo7sCpcnsp+QdEXrkEx9yOlBabIPjPutRQtH
 RBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjwwaNh2aYs+3FpXFQtWY38JR8kt7/RLknMm10DQ6GY=;
 b=UTqDrWeQYLKYYGH3qvTiJh4zJ8+mmK4+N92NHO0SQB9aBJ8MpsSxXI2Nv/jZnjy0k3
 59TnsmiGC2NY1r8BDDY7Z9NKHnv/twSNJIDULLHkI2TNq3RczJy7GYV01ACx40dozq7w
 hxxXAvNa3PIskliTaYM2wXR4SXT9P6cgpqs41/4SY0CbDk/Sli/qG2BDDUQLoqOu57kO
 g8NiDJt5kv36E6POTHI3TwFlf5UeVJwqbsnzG54tnFXcU6doNEkOpJU3OXHeg1bBP4Z6
 /gGg6jYwZtqR5KZSIMYg4zQjhMslXJL1JdaTtWtpia13j6m3UdoW5PcgxSRCrJDyBkrG
 F0uQ==
X-Gm-Message-State: ANoB5pkJjZGrRakmnvkrmpJS1Wrmq8S41X4QfGNxEQNhNJWvoabbuu2F
 0LZ+LwS2+CXt/ibX6B3ricnUJ7sD/WgKVAbS
X-Google-Smtp-Source: AA0mqf53nXuznbDVvQ5QRI4yrfu1Ff7o9cCh+ogHQLEvsy/YDvFdK9E0YxWeNWmY3HVDIHNjPqJgHw==
X-Received: by 2002:a5d:4741:0:b0:242:140d:43be with SMTP id
 o1-20020a5d4741000000b00242140d43bemr10249704wrs.623.1669816374323; 
 Wed, 30 Nov 2022 05:52:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d45c4000000b00242209dd1ffsm1761552wrs.41.2022.11.30.05.52.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:52:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-8.0 2/5] cpu: Move cpu_class_init_props() to common code
Date: Wed, 30 Nov 2022 14:52:38 +0100
Message-Id: <20221130135241.85060-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135241.85060-1-philmd@linaro.org>
References: <20221130135241.85060-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This code is not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu.c         | 53 ---------------------------------------------------
 cpus-common.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/cpu.c b/cpu.c
index 4a7d865427..d4b24ea39a 100644
--- a/cpu.c
+++ b/cpu.c
@@ -21,8 +21,6 @@
 #include "qapi/error.h"
 
 #include "exec/target_page.h"
-#include "hw/qdev-core.h"
-#include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "migration/vmstate.h"
 #ifdef CONFIG_USER_ONLY
@@ -183,57 +181,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     cpu_list_remove(cpu);
 }
 
-/*
- * This can't go in hw/core/cpu.c because that file is compiled only
- * once for both user-mode and system builds.
- */
-static Property cpu_common_props[] = {
-#ifdef CONFIG_USER_ONLY
-    /*
-     * Create a property for the user-only object, so users can
-     * adjust prctl(PR_SET_UNALIGN) from the command-line.
-     * Has no effect if the target does not support the feature.
-     */
-    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
-                     prctl_unalign_sigbus, false),
-#else
-    /*
-     * Create a memory property for softmmu CPU object, so users can
-     * wire up its memory.  The default if no link is set up is to use
-     * the system address space.
-     */
-    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
-                     MemoryRegion *),
-#endif
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static bool cpu_get_start_powered_off(Object *obj, Error **errp)
-{
-    CPUState *cpu = CPU(obj);
-    return cpu->start_powered_off;
-}
-
-static void cpu_set_start_powered_off(Object *obj, bool value, Error **errp)
-{
-    CPUState *cpu = CPU(obj);
-    cpu->start_powered_off = value;
-}
-
-void cpu_class_init_props(DeviceClass *dc)
-{
-    ObjectClass *oc = OBJECT_CLASS(dc);
-
-    device_class_set_props(dc, cpu_common_props);
-    /*
-     * We can't use DEFINE_PROP_BOOL in the Property array for this
-     * property, because we want this to be settable after realize.
-     */
-    object_class_property_add_bool(oc, "start-powered-off",
-                                   cpu_get_start_powered_off,
-                                   cpu_set_start_powered_off);
-}
-
 void cpu_exec_initfn(CPUState *cpu)
 {
     cpu->as = NULL;
diff --git a/cpus-common.c b/cpus-common.c
index 793364dc0e..9151cf4240 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
+#include "exec/memory.h"
+#include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
@@ -360,3 +362,54 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_mutex_unlock(&cpu->work_mutex);
     qemu_cond_broadcast(&qemu_work_cond);
 }
+
+/*
+ * This can't go in hw/core/cpu.c because that file is compiled only
+ * once for both user-mode and system builds.
+ */
+static Property cpu_common_props[] = {
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Create a property for the user-only object, so users can
+     * adjust prctl(PR_SET_UNALIGN) from the command-line.
+     * Has no effect if the target does not support the feature.
+     */
+    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
+                     prctl_unalign_sigbus, false),
+#else
+    /*
+     * Create a memory property for softmmu CPU object, so users can
+     * wire up its memory.  The default if no link is set up is to use
+     * the system address space.
+     */
+    DEFINE_PROP_LINK("memory", CPUState, memory, TYPE_MEMORY_REGION,
+                     MemoryRegion *),
+#endif
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static bool cpu_get_start_powered_off(Object *obj, Error **errp)
+{
+    CPUState *cpu = CPU(obj);
+    return cpu->start_powered_off;
+}
+
+static void cpu_set_start_powered_off(Object *obj, bool value, Error **errp)
+{
+    CPUState *cpu = CPU(obj);
+    cpu->start_powered_off = value;
+}
+
+void cpu_class_init_props(DeviceClass *dc)
+{
+    ObjectClass *oc = OBJECT_CLASS(dc);
+
+    device_class_set_props(dc, cpu_common_props);
+    /*
+     * We can't use DEFINE_PROP_BOOL in the Property array for this
+     * property, because we want this to be settable after realize.
+     */
+    object_class_property_add_bool(oc, "start-powered-off",
+                                   cpu_get_start_powered_off,
+                                   cpu_set_start_powered_off);
+}
-- 
2.38.1


