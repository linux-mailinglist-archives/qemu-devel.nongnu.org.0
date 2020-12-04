Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622F2CE7D7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:54:47 +0100 (CET)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl43K-0001ma-KC
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tY-0004G2-Bm; Fri, 04 Dec 2020 00:44:40 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:59799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tW-00005X-7M; Fri, 04 Dec 2020 00:44:40 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8g4ZGpz9sVS; Fri,  4 Dec 2020 16:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060659;
 bh=kdYvFLKM63q+FlqswmpyvW9PA1nGgs8gSeZCixeRoWI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eClbQXzs/c6c4HuFl4LzxegJDpJf85x/cwcWPj7nAcbbTTwime4OvFGJdL59mXx54
 HzPQyeK1ID37Co+Q5w5bCkPtImzoohOtJ0eSYvB9wy64nv5h6iREEOuTuqrlF5eU4w
 qf3PSN6hhUcXPo0Eqc8idtr4Yme6Llsrzjm4xKlc=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 05/13] securable guest memory: Rework the
 "memory-encryption" property
Date: Fri,  4 Dec 2020 16:44:07 +1100
Message-Id: <20201204054415.579042-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the "memory-encryption" property is only looked at once we
get to kvm_init().  Although protection of guest memory from the
hypervisor isn't something that could really ever work with TCG, it's
not conceptually tied to the KVM accelerator.

In addition, the way the string property is resolved to an object is
almost identical to how a QOM link property is handled.

So, create a new "securable-guest-memory" link property which sets
this QOM interface link directly in the machine.  For compatibility we
keep the "memory-encryption" property, but now implemented in terms of
the new property.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-all.c | 22 ++++++----------------
 hw/core/machine.c   | 43 +++++++++++++++++++++++++++++++++++++------
 include/hw/boards.h |  2 +-
 3 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9e7cea64d6..92a49b328a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2207,24 +2207,14 @@ static int kvm_init(MachineState *ms)
      * if memory encryption object is specified then initialize the memory
      * encryption context.
      */
-    if (ms->memory_encryption) {
-        Object *obj = object_resolve_path_component(object_get_objects_root(),
-                                                    ms->memory_encryption);
-
-        if (object_dynamic_cast(obj, TYPE_SECURABLE_GUEST_MEMORY)) {
-            SecurableGuestMemory *sgm = SECURABLE_GUEST_MEMORY(obj);
-
-            /* FIXME handle mechanisms other than SEV */
-            ret = sev_kvm_init(sgm);
-            if (ret < 0) {
-                goto err;
-            }
-
-            kvm_state->sgm = sgm;
-        } else {
-            ret = -1;
+    if (ms->sgm) {
+        /* FIXME handle mechanisms other than SEV */
+        ret = sev_kvm_init(ms->sgm);
+        if (ret < 0) {
             goto err;
         }
+
+        kvm_state->sgm = ms->sgm;
     }
 
     ret = kvm_arch_init(ms, s);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index cb0711508d..816ea3ae3e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -27,6 +27,7 @@
 #include "hw/pci/pci.h"
 #include "hw/mem/nvdimm.h"
 #include "migration/vmstate.h"
+#include "exec/securable-guest-memory.h"
 
 GlobalProperty hw_compat_5_1[] = {
     { "vhost-scsi", "num_queues", "1"},
@@ -417,16 +418,37 @@ static char *machine_get_memory_encryption(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
 
-    return g_strdup(ms->memory_encryption);
+    if (ms->sgm) {
+        return g_strdup(object_get_canonical_path_component(OBJECT(ms->sgm)));
+    }
+
+    return NULL;
 }
 
 static void machine_set_memory_encryption(Object *obj, const char *value,
                                         Error **errp)
 {
-    MachineState *ms = MACHINE(obj);
+    Object *sgm =
+        object_resolve_path_component(object_get_objects_root(), value);
+
+    if (!sgm) {
+        error_setg(errp, "No such memory encryption object '%s'", value);
+        return;
+    }
 
-    g_free(ms->memory_encryption);
-    ms->memory_encryption = g_strdup(value);
+    object_property_set_link(obj, "securable-guest-memory", sgm, errp);
+}
+
+static void machine_check_securable_guest_memory(const Object *obj,
+                                                 const char *name,
+                                                 Object *new_target,
+                                                 Error **errp)
+{
+    /*
+     * So far the only constraint is that the target has the
+     * TYPE_SECURABLE_GUEST_MEMORY interface, and that's checked by
+     * the QOM core
+     */
 }
 
 static bool machine_get_nvdimm(Object *obj, Error **errp)
@@ -833,6 +855,15 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "suppress-vmdesc",
         "Set on to disable self-describing migration");
 
+    object_class_property_add_link(oc, "securable-guest-memory",
+                                   TYPE_SECURABLE_GUEST_MEMORY,
+                                   offsetof(MachineState, sgm),
+                                   machine_check_securable_guest_memory,
+                                   OBJ_PROP_LINK_STRONG);
+    object_class_property_set_description(oc, "securable-guest-memory",
+        "Set securable guest memory scheme to use");
+
+    /* For compatibility */
     object_class_property_add_str(oc, "memory-encryption",
         machine_get_memory_encryption, machine_set_memory_encryption);
     object_class_property_set_description(oc, "memory-encryption",
@@ -1123,9 +1154,9 @@ void machine_run_board_init(MachineState *machine)
                     cc->deprecation_note);
     }
 
-    if (machine->memory_encryption) {
+    if (machine->sgm) {
         /*
-         * With memory encryption, the host can't see the real
+         * With securable guest memory, the host can't see the real
          * contents of RAM, so there's no point in it trying to merge
          * areas.
          */
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a49e3a6b44..2ea9790183 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -269,7 +269,7 @@ struct MachineState {
     bool iommu;
     bool suppress_vmdesc;
     bool enable_graphics;
-    char *memory_encryption;
+    SecurableGuestMemory *sgm;
     char *ram_memdev_id;
     /*
      * convenience alias to ram_memdev_id backend memory region
-- 
2.28.0


