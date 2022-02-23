Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409644C0EFF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:19:06 +0100 (CET)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnnc-000582-5U
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:19:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnch-0001UC-Js
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnce-00022t-PP
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:47 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 7D48821EC0;
 Wed, 23 Feb 2022 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zxn5NdwFOT4UPyXGAHs+RBbnTzq323hI5ry9yIbKUDI=;
 b=RmXUjX6Vlv7TqKVDF6kpFtjlTzJnwmS6kFLFMSLLP0g3k1vZLzzznJYwBEm6rPs1xsg+Br
 3XAe3ir26+8yd6bTkWjSfsu2cIVSQ1tH4dVYelFnpXykk5CSdS5W1wDhis5rnpdgHWoE3a
 0YngfEZ/7O48Yf+sc/+bMiTEzqu0mx4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 08/14] none-machine: add 'ram-addr' property
Date: Wed, 23 Feb 2022 10:07:00 +0100
Message-Id: <20220223090706.4888-9-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the property to configure a the base address of the ram.
The default value remains zero.

This commit is needed to use the 'none' machine as a base, and
subsequently to dynamically populate it using qapi commands. Having
a non null 'ram' is really hard to workaround because of the actual
constraints on the generic loader: it prevents loading binaries
bigger than ram_size (with a null ram, we cannot load anything).
For now we need to be able to use the existing ram creation
feature of the none machine with a configurable base address.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/null-machine.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 7eb258af07..5fd1cc0218 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -16,9 +16,11 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "hw/core/cpu.h"
+#include "qapi/visitor.h"
 
 struct NoneMachineState {
     MachineState parent;
+    uint64_t ram_addr;
 };
 
 #define TYPE_NONE_MACHINE MACHINE_TYPE_NAME("none")
@@ -26,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, NONE_MACHINE)
 
 static void machine_none_init(MachineState *mch)
 {
+    NoneMachineState *nms = NONE_MACHINE(mch);
     CPUState *cpu = NULL;
 
     /* Initialize CPU (if user asked for it) */
@@ -37,9 +40,13 @@ static void machine_none_init(MachineState *mch)
         }
     }
 
-    /* RAM at address zero */
+    /* RAM at configured address (default: 0) */
     if (mch->ram) {
-        memory_region_add_subregion(get_system_memory(), 0, mch->ram);
+        memory_region_add_subregion(get_system_memory(), nms->ram_addr,
+                                    mch->ram);
+    } else if (nms->ram_addr) {
+        error_report("'ram-addr' has been specified but the size is zero");
+        exit(1);
     }
 
     if (mch->kernel_filename) {
@@ -49,6 +56,22 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
+static void machine_none_get_ram_addr(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    NoneMachineState *nms = NONE_MACHINE(obj);
+
+    visit_type_uint64(v, name, &nms->ram_addr, errp);
+}
+
+static void machine_none_set_ram_addr(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    NoneMachineState *nms = NONE_MACHINE(obj);
+
+    visit_type_uint64(v, name, &nms->ram_addr, errp);
+}
+
 static void machine_none_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -63,6 +86,13 @@ static void machine_none_class_init(ObjectClass *oc, void *data)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_sdcard = 1;
+
+    object_class_property_add(oc, "ram-addr", "int",
+        machine_none_get_ram_addr,
+        machine_none_set_ram_addr,
+        NULL, NULL);
+    object_class_property_set_description(oc, "ram-addr",
+        "Base address of the RAM (default is 0)");
 }
 
 static const TypeInfo none_machine_info = {
-- 
2.35.1


