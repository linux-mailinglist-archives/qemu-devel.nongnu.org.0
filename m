Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384203446F6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:19:58 +0100 (CET)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLPR-0005vG-5l
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL8u-00058I-5Y
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:02:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:44540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL8j-0005Bw-ET
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:02:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 825D4AF2A;
 Mon, 22 Mar 2021 14:02:18 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v10 20/49] target/arm: move arm_cpu_list to common_cpu
Date: Mon, 22 Mar 2021 15:01:37 +0100
Message-Id: <20210322140206.9513-21-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322140206.9513-1-cfontana@suse.de>
References: <20210322140206.9513-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-common.c | 42 +++++++++++++++++++++++++++++++++++++++++
 target/arm/tcg/helper.c | 41 ----------------------------------------
 2 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index dc7a5049a7..a01280dba8 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/qemu-print.h"
 #include "qom/object.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
@@ -285,3 +286,44 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     }
     return env->cp15.sctlr_el[el];
 }
+
+/* Sort alphabetically by type name, except for "any". */
+static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
+{
+    ObjectClass *class_a = (ObjectClass *)a;
+    ObjectClass *class_b = (ObjectClass *)b;
+    const char *name_a, *name_b;
+
+    name_a = object_class_get_name(class_a);
+    name_b = object_class_get_name(class_b);
+    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
+        return 1;
+    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
+        return -1;
+    } else {
+        return strcmp(name_a, name_b);
+    }
+}
+
+static void arm_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    const char *typename;
+    char *name;
+
+    typename = object_class_get_name(oc);
+    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
+    qemu_printf("  %s\n", name);
+    g_free(name);
+}
+
+void arm_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    list = g_slist_sort(list, arm_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, arm_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index a44b01a712..a93863152a 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -620,47 +620,6 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
 
 }
 
-/* Sort alphabetically by type name, except for "any". */
-static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
-{
-    ObjectClass *class_a = (ObjectClass *)a;
-    ObjectClass *class_b = (ObjectClass *)b;
-    const char *name_a, *name_b;
-
-    name_a = object_class_get_name(class_a);
-    name_b = object_class_get_name(class_b);
-    if (strcmp(name_a, "any-" TYPE_ARM_CPU) == 0) {
-        return 1;
-    } else if (strcmp(name_b, "any-" TYPE_ARM_CPU) == 0) {
-        return -1;
-    } else {
-        return strcmp(name_a, name_b);
-    }
-}
-
-static void arm_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename;
-    char *name;
-
-    typename = object_class_get_name(oc);
-    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-void arm_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    list = g_slist_sort(list, arm_cpu_list_compare);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, arm_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
 /* Sign/zero extend */
 uint32_t HELPER(sxtb16)(uint32_t x)
 {
-- 
2.26.2


