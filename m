Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A82CE7D6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:53:48 +0100 (CET)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl42N-0000IB-O9
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3u2-0005UF-Vc; Fri, 04 Dec 2020 00:45:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57917 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3u0-00008g-UP; Fri, 04 Dec 2020 00:45:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8j514Dz9sW4; Fri,  4 Dec 2020 16:44:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060661;
 bh=Ss0/gyChKQh9v9b5oqQ2eHsb/Tt4Sz/UV/uYFn9GoUc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I3Swji869vaIndr29WCGkXaX3pv4+TriCUjN91KVHbbEPL/U2S765TyVI5FH5SBX/
 04QN8gecLaouNCanj61BJkfbYVETHLdKxxJqIeDZ7xQwXpDyPf0xXuJEDw9YKYeDVF
 rthyO1kCCUbwI92cirwwZ3wDDMMXRiXZgjNJrjYE=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 13/13] s390: Recognize securable-guest-memory option
Date: Fri,  4 Dec 2020 16:44:15 +1100
Message-Id: <20201204054415.579042-14-david@gibson.dropbear.id.au>
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

At least some s390 cpu models support "Protected Virtualization" (PV),
a mechanism to protect guests from eavesdropping by a compromised
hypervisor.

This is similar in function to other mechanisms like AMD's SEV and
POWER's PEF, which are controlled bythe "securable-guest-memory" machine
option.  s390 is a slightly special case, because we already supported
PV, simply by using a CPU model with the required feature
(S390_FEAT_UNPACK).

To integrate this with the option used by other platforms, we
implement the following compromise:

 - When the securable-guest-memory option is set, s390 will recognize it,
   verify that the CPU can support PV (failing if not) and set virtio
   default options necessary for encrypted or protected guests, as on
   other platforms.  i.e. if securable-guest-memory is set, we will
   either create a guest capable of entering PV mode, or fail outright

 - If securable-guest-memory is not set, guest's might still be able to
   enter PV mode, if the CPU has the right model.  This may be a
   little surprising, but shouldn't actually be harmful.

To start a guest supporting Protected Virtualization using the new
option use the command line arguments:
    -object s390-pv-guest,id=pv0 -machine securable-guest-memory=pv0

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/s390x/pv.c         | 58 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/s390x/pv.h |  1 +
 target/s390x/kvm.c    |  3 +++
 3 files changed, 62 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index ab3a2482aa..9fddc196a3 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -14,8 +14,11 @@
 #include <linux/kvm.h>
 
 #include "cpu.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "qom/object_interfaces.h"
+#include "exec/securable-guest-memory.h"
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/pv.h"
 
@@ -111,3 +114,58 @@ void s390_pv_inject_reset_error(CPUState *cs)
     /* Report that we are unable to enter protected mode */
     env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
 }
+
+#define TYPE_S390_PV_GUEST "s390-pv-guest"
+#define S390_PV_GUEST(obj)                              \
+    OBJECT_CHECK(S390PVGuestState, (obj), TYPE_S390_PV_GUEST)
+
+typedef struct S390PVGuestState S390PVGuestState;
+
+/**
+ * S390PVGuestState:
+ *
+ * The S390PVGuestState object is basically a dummy used to tell the
+ * securable guest memory system to use s390's PV mechanism.
+ *
+ * # $QEMU \
+ *         -object s390-pv-guest,id=pv0 \
+ *         -machine ...,securable-guest-memory=pv0
+ */
+struct S390PVGuestState {
+    Object parent_obj;
+};
+
+int s390_pv_init(SecurableGuestMemory *sgm, Error **errp)
+{
+    if (!object_dynamic_cast(OBJECT(sgm), TYPE_S390_PV_GUEST)) {
+        return 0;
+    }
+
+    if (!s390_has_feat(S390_FEAT_UNPACK)) {
+        error_setg(errp,
+                   "CPU model does not support Protected Virtualization");
+        return -1;
+    }
+
+    sgm->ready = true;
+
+    return 0;
+}
+
+static const TypeInfo s390_pv_guest_info = {
+    .parent = TYPE_SECURABLE_GUEST_MEMORY,
+    .name = TYPE_S390_PV_GUEST,
+    .instance_size = sizeof(S390PVGuestState),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void
+s390_pv_register_types(void)
+{
+    type_register_static(&s390_pv_guest_info);
+}
+
+type_init(s390_pv_register_types);
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index aee758bc2d..4250af699b 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -43,6 +43,7 @@ void s390_pv_prep_reset(void);
 int s390_pv_verify(void);
 void s390_pv_unshare(void);
 void s390_pv_inject_reset_error(CPUState *cs);
+int s390_pv_init(SecurableGuestMemory *sgm, Error **errp);
 #else /* CONFIG_KVM */
 static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_vm_enable(void) { return 0; }
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index b8385e6b95..3383487463 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -387,6 +387,9 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     }
 
     kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
+
+    s390_pv_init(ms->sgm, &error_fatal);
+
     return 0;
 }
 
-- 
2.28.0


