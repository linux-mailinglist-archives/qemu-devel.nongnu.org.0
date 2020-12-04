Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760372CE7C1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:47:14 +0100 (CET)
Received: from localhost ([::1]:35144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl3w1-0006eh-Cl
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tN-0003rk-OB; Fri, 04 Dec 2020 00:44:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53241 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tJ-0008Tp-8F; Fri, 04 Dec 2020 00:44:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8g1c39z9sVM; Fri,  4 Dec 2020 16:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060659;
 bh=EqOeasdeFKvYiMfFo9qpcp5aqrwe2rucqzfY62bqd/Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OKzPjWmGd2EU3oSM+VSBLLWO+Ut+mIbLWGSdkd9OI9OMvqpcfYTsE72rZK4irMiYS
 pmBnnTYUGdnuinOkPe5JE9ScRaKUFUXrtVNNSI2zNwhsesBwaahn32oL3ByP1mj6sn
 SBMR5/zcFfk7DCJCtvaADFgvoyEnlDmYuR8Gjtqw=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 03/13] securable guest memory: Handle memory encryption
 via interface
Date: Fri,  4 Dec 2020 16:44:05 +1100
Message-Id: <20201204054415.579042-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201204054415.579042-1-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

At the moment AMD SEV sets a special function pointer, plus an opaque
handle in KVMState to let things know how to encrypt guest memory.

Now that we have a QOM interface for handling things related to securable
guest memory, use a QOM method on that interface, rather than a bare
function pointer for this.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-all.c                   |  36 +++++---
 accel/kvm/sev-stub.c                  |   9 +-
 include/exec/securable-guest-memory.h |   2 +
 include/sysemu/sev.h                  |   5 +-
 target/i386/monitor.c                 |   1 -
 target/i386/sev.c                     | 116 ++++++++++----------------
 6 files changed, 77 insertions(+), 92 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index baaa54249d..9e7cea64d6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -47,6 +47,7 @@
 #include "qemu/guest-random.h"
 #include "sysemu/hw_accel.h"
 #include "kvm-cpus.h"
+#include "exec/securable-guest-memory.h"
 
 #include "hw/boards.h"
 
@@ -120,9 +121,8 @@ struct KVMState
     KVMMemoryListener memory_listener;
     QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
 
-    /* memory encryption */
-    void *memcrypt_handle;
-    int (*memcrypt_encrypt_data)(void *handle, uint8_t *ptr, uint64_t len);
+    /* securable guest memory (e.g. by guest memory encryption) */
+    SecurableGuestMemory *sgm;
 
     /* For "info mtree -f" to tell if an MR is registered in KVM */
     int nr_as;
@@ -224,7 +224,7 @@ int kvm_get_max_memslots(void)
 
 bool kvm_memcrypt_enabled(void)
 {
-    if (kvm_state && kvm_state->memcrypt_handle) {
+    if (kvm_state && kvm_state->sgm) {
         return true;
     }
 
@@ -233,10 +233,12 @@ bool kvm_memcrypt_enabled(void)
 
 int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
 {
-    if (kvm_state->memcrypt_handle &&
-        kvm_state->memcrypt_encrypt_data) {
-        return kvm_state->memcrypt_encrypt_data(kvm_state->memcrypt_handle,
-                                              ptr, len);
+    SecurableGuestMemory *sgm = kvm_state->sgm;
+
+    if (sgm) {
+        SecurableGuestMemoryClass *sgmc = SECURABLE_GUEST_MEMORY_GET_CLASS(sgm);
+
+        return sgmc->encrypt_data(sgm, ptr, len);
     }
 
     return 1;
@@ -2206,13 +2208,23 @@ static int kvm_init(MachineState *ms)
      * encryption context.
      */
     if (ms->memory_encryption) {
-        kvm_state->memcrypt_handle = sev_guest_init(ms->memory_encryption);
-        if (!kvm_state->memcrypt_handle) {
+        Object *obj = object_resolve_path_component(object_get_objects_root(),
+                                                    ms->memory_encryption);
+
+        if (object_dynamic_cast(obj, TYPE_SECURABLE_GUEST_MEMORY)) {
+            SecurableGuestMemory *sgm = SECURABLE_GUEST_MEMORY(obj);
+
+            /* FIXME handle mechanisms other than SEV */
+            ret = sev_kvm_init(sgm);
+            if (ret < 0) {
+                goto err;
+            }
+
+            kvm_state->sgm = sgm;
+        } else {
             ret = -1;
             goto err;
         }
-
-        kvm_state->memcrypt_encrypt_data = sev_encrypt_data;
     }
 
     ret = kvm_arch_init(ms, s);
diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
index 4f97452585..3df3c88eeb 100644
--- a/accel/kvm/sev-stub.c
+++ b/accel/kvm/sev-stub.c
@@ -15,12 +15,7 @@
 #include "qemu-common.h"
 #include "sysemu/sev.h"
 
-int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
+int sev_kvm_init(SecurableGuestMemory *sgm)
 {
-    abort();
-}
-
-void *sev_guest_init(const char *id)
-{
-    return NULL;
+    return -1;
 }
diff --git a/include/exec/securable-guest-memory.h b/include/exec/securable-guest-memory.h
index 0d5ecfb681..4e2ae27040 100644
--- a/include/exec/securable-guest-memory.h
+++ b/include/exec/securable-guest-memory.h
@@ -39,6 +39,8 @@ struct SecurableGuestMemory {
 
 typedef struct SecurableGuestMemoryClass {
     ObjectClass parent;
+
+    int (*encrypt_data)(SecurableGuestMemory *, uint8_t *, uint64_t);
 } SecurableGuestMemoryClass;
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 98c1ec8d38..36d038a36f 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -15,7 +15,8 @@
 #define QEMU_SEV_H
 
 #include "sysemu/kvm.h"
+#include "exec/securable-guest-memory.h"
+
+int sev_kvm_init(SecurableGuestMemory *sgm);
 
-void *sev_guest_init(const char *id);
-int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
 #endif
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 9f9e1c42f4..db6aeaf43a 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -29,7 +29,6 @@
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
 #include "qapi/error.h"
 #include "sev_i386.h"
 #include "qapi/qapi-commands-misc-target.h"
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 53f00a24cf..7b8ce590f7 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -281,26 +281,6 @@ sev_guest_set_sev_device(Object *obj, const char *value, Error **errp)
     sev->sev_device = g_strdup(value);
 }
 
-static void
-sev_guest_class_init(ObjectClass *oc, void *data)
-{
-    object_class_property_add_str(oc, "sev-device",
-                                  sev_guest_get_sev_device,
-                                  sev_guest_set_sev_device);
-    object_class_property_set_description(oc, "sev-device",
-            "SEV device to use");
-    object_class_property_add_str(oc, "dh-cert-file",
-                                  sev_guest_get_dh_cert_file,
-                                  sev_guest_set_dh_cert_file);
-    object_class_property_set_description(oc, "dh-cert-file",
-            "guest owners DH certificate (encoded with base64)");
-    object_class_property_add_str(oc, "session-file",
-                                  sev_guest_get_session_file,
-                                  sev_guest_set_session_file);
-    object_class_property_set_description(oc, "session-file",
-            "guest owners session parameters (encoded with base64)");
-}
-
 static void
 sev_guest_instance_init(Object *obj)
 {
@@ -319,40 +299,6 @@ sev_guest_instance_init(Object *obj)
                                    OBJ_PROP_FLAG_READWRITE);
 }
 
-/* sev guest info */
-static const TypeInfo sev_guest_info = {
-    .parent = TYPE_SECURABLE_GUEST_MEMORY,
-    .name = TYPE_SEV_GUEST,
-    .instance_size = sizeof(SevGuestState),
-    .instance_finalize = sev_guest_finalize,
-    .class_init = sev_guest_class_init,
-    .instance_init = sev_guest_instance_init,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_USER_CREATABLE },
-        { }
-    }
-};
-
-static SevGuestState *
-lookup_sev_guest_info(const char *id)
-{
-    Object *obj;
-    SevGuestState *info;
-
-    obj = object_resolve_path_component(object_get_objects_root(), id);
-    if (!obj) {
-        return NULL;
-    }
-
-    info = (SevGuestState *)
-            object_dynamic_cast(obj, TYPE_SEV_GUEST);
-    if (!info) {
-        return NULL;
-    }
-
-    return info;
-}
-
 bool
 sev_enabled(void)
 {
@@ -680,10 +626,9 @@ sev_vm_state_change(void *opaque, int running, RunState state)
     }
 }
 
-void *
-sev_guest_init(const char *id)
+int sev_kvm_init(SecurableGuestMemory *sgm)
 {
-    SevGuestState *sev;
+    SevGuestState *sev = SEV_GUEST(sgm);
     char *devname;
     int ret, fw_error;
     uint32_t ebx;
@@ -693,14 +638,7 @@ sev_guest_init(const char *id)
     ret = ram_block_discard_disable(true);
     if (ret) {
         error_report("%s: cannot disable RAM discard", __func__);
-        return NULL;
-    }
-
-    sev = lookup_sev_guest_info(id);
-    if (!sev) {
-        error_report("%s: '%s' is not a valid '%s' object",
-                     __func__, id, TYPE_SEV_GUEST);
-        goto err;
+        return -1;
     }
 
     sev_guest = sev;
@@ -764,17 +702,17 @@ sev_guest_init(const char *id)
     qemu_add_machine_init_done_notifier(&sev_machine_done_notify);
     qemu_add_vm_change_state_handler(sev_vm_state_change, sev);
 
-    return sev;
+    return 0;
 err:
     sev_guest = NULL;
     ram_block_discard_disable(false);
-    return NULL;
+    return -1;
 }
 
-int
-sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
+static int
+sev_encrypt_data(SecurableGuestMemory *opaque, uint8_t *ptr, uint64_t len)
 {
-    SevGuestState *sev = handle;
+    SevGuestState *sev = SEV_GUEST(opaque);
 
     assert(sev);
 
@@ -786,6 +724,44 @@ sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
     return 0;
 }
 
+static void
+sev_guest_class_init(ObjectClass *oc, void *data)
+{
+    SecurableGuestMemoryClass *sgmc = SECURABLE_GUEST_MEMORY_CLASS(oc);
+
+    object_class_property_add_str(oc, "sev-device",
+                                  sev_guest_get_sev_device,
+                                  sev_guest_set_sev_device);
+    object_class_property_set_description(oc, "sev-device",
+        "SEV device to use");
+    object_class_property_add_str(oc, "dh-cert-file",
+                                  sev_guest_get_dh_cert_file,
+                                  sev_guest_set_dh_cert_file);
+    object_class_property_set_description(oc, "dh-cert-file",
+        "guest owners DH certificate (encoded with base64)");
+    object_class_property_add_str(oc, "session-file",
+                                  sev_guest_get_session_file,
+                                  sev_guest_set_session_file);
+    object_class_property_set_description(oc, "session-file",
+        "guest owners session parameters (encoded with base64)");
+
+    sgmc->encrypt_data = sev_encrypt_data;
+}
+
+/* sev guest info */
+static const TypeInfo sev_guest_info = {
+    .parent = TYPE_SECURABLE_GUEST_MEMORY,
+    .name = TYPE_SEV_GUEST,
+    .instance_size = sizeof(SevGuestState),
+    .instance_finalize = sev_guest_finalize,
+    .class_init = sev_guest_class_init,
+    .instance_init = sev_guest_instance_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
 static void
 sev_register_types(void)
 {
-- 
2.28.0


