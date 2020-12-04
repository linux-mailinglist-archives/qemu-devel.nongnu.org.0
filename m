Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3177D2CE7B0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:46:22 +0100 (CET)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl3vA-0005rS-8r
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:46:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tN-0003rj-MI; Fri, 04 Dec 2020 00:44:30 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35793 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tJ-0008To-8c; Fri, 04 Dec 2020 00:44:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8g0J6bz9sVH; Fri,  4 Dec 2020 16:44:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060659;
 bh=JCKtB0CAUo5qRhgGPlJh6hWPpcLzzkSJ/S2kZoA7KMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UK+tvDTtyfxmDLRI1BAo0CZOnx4vxpzL2ZSR9EavNEYV8rsCiD4Ahf6FzorpORjPR
 5iq+XMnBiZjBVkSaBKRqvbQdUmMhG9Le7wBJAyBPVRvKIDDi+T4IlayTd/RhuvWBbH
 vB7aVZL1gPhz5FhRTPgdufirAHWHgPqjTZAQXP64=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 02/13] securable guest memory: Introduce new securable
 guest memory base class
Date: Fri,  4 Dec 2020 16:44:04 +1100
Message-Id: <20201204054415.579042-3-david@gibson.dropbear.id.au>
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

Several architectures have mechanisms which are designed to protect guest
memory from interference or eavesdropping by a compromised hypervisor.  AMD
SEV does this with in-chip memory encryption and Intel's MKTME can do
similar things.  POWER's Protected Execution Framework (PEF) accomplishes a
similar goal using an ultravisor and new memory protection features,
instead of encryption.

To (partially) unify handling for these, this introduces a new
SecurableGuestMemoryState QOM base class.  "Securable" is kind of vague,
but "secure memory" or "secure guest" seems to be a common theme in the
lexicon around these schemes, so it's the best name I've managed to find
so far.  It's "securable" rather than "secure", because in at least some of
the cases it requires the guest to take specific actions in order to
protect itself from hypervisor eavesdropping.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 backends/meson.build                  |  1 +
 backends/securable-guest-memory.c     | 30 +++++++++++++++++
 include/exec/securable-guest-memory.h | 46 +++++++++++++++++++++++++++
 include/qemu/typedefs.h               |  1 +
 target/i386/sev.c                     |  3 +-
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 backends/securable-guest-memory.c
 create mode 100644 include/exec/securable-guest-memory.h

diff --git a/backends/meson.build b/backends/meson.build
index 484456ece7..781594af86 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -6,6 +6,7 @@ softmmu_ss.add([files(
   'rng-builtin.c',
   'rng-egd.c',
   'rng.c',
+  'securable-guest-memory.c',
 ), numa])
 
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
diff --git a/backends/securable-guest-memory.c b/backends/securable-guest-memory.c
new file mode 100644
index 0000000000..5bf380fd84
--- /dev/null
+++ b/backends/securable-guest-memory.c
@@ -0,0 +1,30 @@
+/*
+ * QEMU Securable Guest Memory interface
+ *
+ * Copyright: David Gibson, Red Hat Inc. 2020
+ *
+ * Authors:
+ *  David Gibson <david@gibson.dropbear.id.au>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "exec/securable-guest-memory.h"
+
+static const TypeInfo securable_guest_memory_info = {
+    .parent = TYPE_OBJECT,
+    .name = TYPE_SECURABLE_GUEST_MEMORY,
+    .class_size = sizeof(SecurableGuestMemoryClass),
+    .instance_size = sizeof(SecurableGuestMemory),
+};
+
+static void securable_guest_memory_register_types(void)
+{
+    type_register_static(&securable_guest_memory_info);
+}
+
+type_init(securable_guest_memory_register_types)
diff --git a/include/exec/securable-guest-memory.h b/include/exec/securable-guest-memory.h
new file mode 100644
index 0000000000..0d5ecfb681
--- /dev/null
+++ b/include/exec/securable-guest-memory.h
@@ -0,0 +1,46 @@
+/*
+ * QEMU Securable Guest Memory interface
+ *   This interface describes the common pieces between various
+ *   schemes for protecting guest memory against a compromised
+ *   hypervisor.  This includes memory encryption (AMD's SEV and
+ *   Intel's MKTME) or special protection modes (PEF on POWER, or PV
+ *   on s390x).
+ *
+ * Copyright: David Gibson, Red Hat Inc. 2020
+ *
+ * Authors:
+ *  David Gibson <david@gibson.dropbear.id.au>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef QEMU_SECURABLE_GUEST_MEMORY_H
+#define QEMU_SECURABLE_GUEST_MEMORY_H
+
+#ifndef CONFIG_USER_ONLY
+
+#include "qom/object.h"
+
+#define TYPE_SECURABLE_GUEST_MEMORY "securable-guest-memory"
+#define SECURABLE_GUEST_MEMORY(obj)                                    \
+    OBJECT_CHECK(SecurableGuestMemory, (obj),                          \
+                 TYPE_SECURABLE_GUEST_MEMORY)
+#define SECURABLE_GUEST_MEMORY_CLASS(klass)                            \
+    OBJECT_CLASS_CHECK(SecurableGuestMemoryClass, (klass),             \
+                       TYPE_SECURABLE_GUEST_MEMORY)
+#define SECURABLE_GUEST_MEMORY_GET_CLASS(obj)                          \
+    OBJECT_GET_CLASS(SecurableGuestMemoryClass, (obj),                 \
+                     TYPE_SECURABLE_GUEST_MEMORY)
+
+struct SecurableGuestMemory {
+    Object parent;
+};
+
+typedef struct SecurableGuestMemoryClass {
+    ObjectClass parent;
+} SecurableGuestMemoryClass;
+
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* QEMU_SECURABLE_GUEST_MEMORY_H */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 6281eae3b5..79d53746f1 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -116,6 +116,7 @@ typedef struct QString QString;
 typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
 typedef struct SavedIOTLB SavedIOTLB;
+typedef struct SecurableGuestMemory SecurableGuestMemory;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
 typedef struct VirtIODevice VirtIODevice;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 93c4d60b82..53f00a24cf 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -29,6 +29,7 @@
 #include "trace.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
+#include "exec/securable-guest-memory.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -320,7 +321,7 @@ sev_guest_instance_init(Object *obj)
 
 /* sev guest info */
 static const TypeInfo sev_guest_info = {
-    .parent = TYPE_OBJECT,
+    .parent = TYPE_SECURABLE_GUEST_MEMORY,
     .name = TYPE_SEV_GUEST,
     .instance_size = sizeof(SevGuestState),
     .instance_finalize = sev_guest_finalize,
-- 
2.28.0


