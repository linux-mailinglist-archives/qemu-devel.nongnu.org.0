Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5012CE7D0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:51:07 +0100 (CET)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl3zm-0004oP-3l
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tU-00046F-N2; Fri, 04 Dec 2020 00:44:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60561 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tS-000057-Cd; Fri, 04 Dec 2020 00:44:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8g6bfwz9sVp; Fri,  4 Dec 2020 16:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060659;
 bh=Xn1Ehv+oTCo3XiURURCvz/JFFB+ow4VAF1+V7lqlNS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ed9o9wKFPM0s5Mo6zA5fSCi5uRSwLvtpYzjtCgaVHt7BW6ImDSZX0Gbyu3g6gOcIB
 WGrL398jc4G4ePzohkUWw+5INq7Fpjpi/+fFmr/gLzJDZ0+Wk/XWsmAcwvtppSVUAZ
 YLDm6JQVpnGfbC+vdWj85/oznV+REBNtZDCI45VU=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 06/13] securable guest memory: Decouple kvm_memcrypt_*()
 helpers from KVM
Date: Fri,  4 Dec 2020 16:44:08 +1100
Message-Id: <20201204054415.579042-7-david@gibson.dropbear.id.au>
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

The kvm_memcrypt_enabled() and kvm_memcrypt_encrypt_data() helper functions
don't conceptually have any connection to KVM (although it's not possible
in practice to use them without it).

They also rely on looking at the global KVMState.  But the same information
is available from the machine, and the only existing callers have natural
access to the machine state.

Therefore, move and rename them to helpers in securable-guest-memory.h,
taking an explicit machine parameter.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/kvm/kvm-all.c                   | 27 --------------------
 accel/stubs/kvm-stub.c                | 10 --------
 hw/i386/pc_sysfw.c                    |  6 +++--
 include/exec/securable-guest-memory.h | 36 +++++++++++++++++++++++++++
 include/sysemu/kvm.h                  | 17 -------------
 5 files changed, 40 insertions(+), 56 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 92a49b328a..c6bd7b9d02 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -121,9 +121,6 @@ struct KVMState
     KVMMemoryListener memory_listener;
     QLIST_HEAD(, KVMParkedVcpu) kvm_parked_vcpus;
 
-    /* securable guest memory (e.g. by guest memory encryption) */
-    SecurableGuestMemory *sgm;
-
     /* For "info mtree -f" to tell if an MR is registered in KVM */
     int nr_as;
     struct KVMAs {
@@ -222,28 +219,6 @@ int kvm_get_max_memslots(void)
     return s->nr_slots;
 }
 
-bool kvm_memcrypt_enabled(void)
-{
-    if (kvm_state && kvm_state->sgm) {
-        return true;
-    }
-
-    return false;
-}
-
-int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
-{
-    SecurableGuestMemory *sgm = kvm_state->sgm;
-
-    if (sgm) {
-        SecurableGuestMemoryClass *sgmc = SECURABLE_GUEST_MEMORY_GET_CLASS(sgm);
-
-        return sgmc->encrypt_data(sgm, ptr, len);
-    }
-
-    return 1;
-}
-
 /* Called with KVMMemoryListener.slots_lock held */
 static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
 {
@@ -2213,8 +2188,6 @@ static int kvm_init(MachineState *ms)
         if (ret < 0) {
             goto err;
         }
-
-        kvm_state->sgm = ms->sgm;
     }
 
     ret = kvm_arch_init(ms, s);
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 680e099463..0f17acfac0 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -81,16 +81,6 @@ int kvm_on_sigbus(int code, void *addr)
     return 1;
 }
 
-bool kvm_memcrypt_enabled(void)
-{
-    return false;
-}
-
-int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len)
-{
-  return 1;
-}
-
 #ifndef CONFIG_USER_ONLY
 int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 {
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index b6c0822fe3..439ac78970 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -38,6 +38,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
+#include "exec/securable-guest-memory.h"
 
 /*
  * We don't have a theoretically justifiable exact lower bound on the base
@@ -201,10 +202,11 @@ static void pc_system_flash_map(PCMachineState *pcms,
             pc_isa_bios_init(rom_memory, flash_mem, size);
 
             /* Encrypt the pflash boot ROM */
-            if (kvm_memcrypt_enabled()) {
+            if (securable_guest_memory_enabled(MACHINE(pcms))) {
                 flash_ptr = memory_region_get_ram_ptr(flash_mem);
                 flash_size = memory_region_size(flash_mem);
-                ret = kvm_memcrypt_encrypt_data(flash_ptr, flash_size);
+                ret = securable_guest_memory_encrypt(MACHINE(pcms),
+                                                     flash_ptr, flash_size);
                 if (ret) {
                     error_report("failed to encrypt pflash rom");
                     exit(1);
diff --git a/include/exec/securable-guest-memory.h b/include/exec/securable-guest-memory.h
index 4e2ae27040..7325b504ba 100644
--- a/include/exec/securable-guest-memory.h
+++ b/include/exec/securable-guest-memory.h
@@ -21,6 +21,7 @@
 #ifndef CONFIG_USER_ONLY
 
 #include "qom/object.h"
+#include "hw/boards.h"
 
 #define TYPE_SECURABLE_GUEST_MEMORY "securable-guest-memory"
 #define SECURABLE_GUEST_MEMORY(obj)                                    \
@@ -43,6 +44,41 @@ typedef struct SecurableGuestMemoryClass {
     int (*encrypt_data)(SecurableGuestMemory *, uint8_t *, uint64_t);
 } SecurableGuestMemoryClass;
 
+/**
+ * securable_guest_memory_enabled - return whether guest memory is protected
+ *                               from hypervisor access (with memory
+ *                               encryption or otherwise)
+ * Returns: true guest memory is not directly accessible to qemu
+ *          false guest memory is directly accessible to qemu
+ */
+static inline bool securable_guest_memory_enabled(MachineState *machine)
+{
+    return !!machine->sgm;
+}
+
+/**
+ * securable_guest_memory_encrypt: encrypt the memory range to make
+ *                              it guest accessible
+ *
+ * Return: 1 failed to encrypt the range
+ *         0 succesfully encrypted memory region
+ */
+static inline int securable_guest_memory_encrypt(MachineState *machine,
+                                              uint8_t *ptr, uint64_t len)
+{
+    SecurableGuestMemory *sgm = machine->sgm;
+
+    if (sgm) {
+        SecurableGuestMemoryClass *sgmc = SECURABLE_GUEST_MEMORY_GET_CLASS(sgm);
+
+        if (sgmc->encrypt_data) {
+            return sgmc->encrypt_data(sgm, ptr, len);
+        }
+    }
+
+    return 1;
+}
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif /* QEMU_SECURABLE_GUEST_MEMORY_H */
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index bb5d5cf497..0e163c2c9d 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -233,23 +233,6 @@ int kvm_has_intx_set_mask(void);
  */
 bool kvm_arm_supports_user_irq(void);
 
-/**
- * kvm_memcrypt_enabled - return boolean indicating whether memory encryption
- *                        is enabled
- * Returns: 1 memory encryption is enabled
- *          0 memory encryption is disabled
- */
-bool kvm_memcrypt_enabled(void);
-
-/**
- * kvm_memcrypt_encrypt_data: encrypt the memory range
- *
- * Return: 1 failed to encrypt the range
- *         0 succesfully encrypted memory region
- */
-int kvm_memcrypt_encrypt_data(uint8_t *ptr, uint64_t len);
-
-
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
-- 
2.28.0


