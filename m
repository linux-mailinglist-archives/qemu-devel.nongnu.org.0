Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D72F275C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:51:42 +0100 (CET)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBef-0007oo-R0
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzBYY-0002G9-6v; Mon, 11 Jan 2021 23:45:22 -0500
Received: from ozlabs.org ([203.11.71.1]:55033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzBYU-0007sC-VJ; Mon, 11 Jan 2021 23:45:21 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFJ0R1z8nz9sjB; Tue, 12 Jan 2021 15:45:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610426711;
 bh=gBUeaK98QZtVQEHJbntNBZNi+IibOo0phuHzavixG5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NfFyzhTO0FtNXPj/fWKIyu2EHfZJ9McjaJt/5Z/ku/lzdiBKDqnhs6ywjBpc1wmhI
 FxlajbzW2vHECdF6OLPr1oE0SX+4vpDq9mrJjFEdhneK5AhNAsHw/O6N59xoF31bpg
 irkF7R9qBWZlEkhlQLmxslNbpHd6SW1lwqE1lHr8=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, brijesh.singh@amd.com, pair@us.ibm.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 02/13] confidential guest support: Introduce new
 confidential guest support class
Date: Tue, 12 Jan 2021 15:44:57 +1100
Message-Id: <20210112044508.427338-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112044508.427338-1-david@gibson.dropbear.id.au>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 frankja@linux.ibm.com, kvm@vger.kernel.org, david@redhat.com,
 jun.nakajima@intel.com, mst@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <ehabkost@redhat.com>, mdroth@linux.vnet.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, pragyansri.pathi@intel.com, andi.kleen@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several architectures have mechanisms which are designed to protect guest
memory from interference or eavesdropping by a compromised hypervisor.  AMD
SEV does this with in-chip memory encryption and Intel's MKTME can do
similar things.  POWER's Protected Execution Framework (PEF) accomplishes a
similar goal using an ultravisor and new memory protection features,
instead of encryption.

To (partially) unify handling for these, this introduces a new
ConfidentialGuestSupport QOM base class.  "Confidential" is kind of vague,
but "confidential computing" seems to be the buzzword about these schemes,
and "secure" or "protected" are often used in connection to unrelated
things (such as hypervisor-from-guest or guest-from-guest security).

The "support" in the name is significant because in at least some of the
cases it requires the guest to take specific actions in order to protect
itself from hypervisor eavesdropping.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 backends/confidential-guest-support.c     | 30 +++++++++++++++
 backends/meson.build                      |  1 +
 include/exec/confidential-guest-support.h | 46 +++++++++++++++++++++++
 include/qemu/typedefs.h                   |  1 +
 target/i386/sev.c                         |  3 +-
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 backends/confidential-guest-support.c
 create mode 100644 include/exec/confidential-guest-support.h

diff --git a/backends/confidential-guest-support.c b/backends/confidential-guest-support.c
new file mode 100644
index 0000000000..2c7793c74f
--- /dev/null
+++ b/backends/confidential-guest-support.c
@@ -0,0 +1,30 @@
+/*
+ * QEMU Confidential Guest support
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
+#include "exec/confidential-guest-support.h"
+
+static const TypeInfo confidential_guest_support_info = {
+    .parent = TYPE_OBJECT,
+    .name = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
+    .class_size = sizeof(ConfidentialGuestSupportClass),
+    .instance_size = sizeof(ConfidentialGuestSupport),
+};
+
+static void confidential_guest_support_register_types(void)
+{
+    type_register_static(&confidential_guest_support_info);
+}
+
+type_init(confidential_guest_support_register_types)
diff --git a/backends/meson.build b/backends/meson.build
index 484456ece7..d4221831fc 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -6,6 +6,7 @@ softmmu_ss.add([files(
   'rng-builtin.c',
   'rng-egd.c',
   'rng.c',
+  'confidential-guest-support.c',
 ), numa])
 
 softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
new file mode 100644
index 0000000000..f9cf170802
--- /dev/null
+++ b/include/exec/confidential-guest-support.h
@@ -0,0 +1,46 @@
+/*
+ * QEMU Confidential Guest support
+ *   This interface describes the common pieces between various
+ *   schemes for protecting guest memory or other state against a
+ *   compromised hypervisor.  This includes memory encryption (AMD's
+ *   SEV and Intel's MKTME) or special protection modes (PEF on POWER,
+ *   or PV on s390x).
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
+#ifndef QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
+#define QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
+
+#ifndef CONFIG_USER_ONLY
+
+#include "qom/object.h"
+
+#define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
+#define CONFIDENTIAL_GUEST_SUPPORT(obj)                                    \
+    OBJECT_CHECK(ConfidentialGuestSupport, (obj),                          \
+                 TYPE_CONFIDENTIAL_GUEST_SUPPORT)
+#define CONFIDENTIAL_GUEST_SUPPORT_CLASS(klass)                            \
+    OBJECT_CLASS_CHECK(ConfidentialGuestSupportClass, (klass),             \
+                       TYPE_CONFIDENTIAL_GUEST_SUPPORT)
+#define CONFIDENTIAL_GUEST_SUPPORT_GET_CLASS(obj)                          \
+    OBJECT_GET_CLASS(ConfidentialGuestSupportClass, (obj),                 \
+                     TYPE_CONFIDENTIAL_GUEST_SUPPORT)
+
+struct ConfidentialGuestSupport {
+    Object parent;
+};
+
+typedef struct ConfidentialGuestSupportClass {
+    ObjectClass parent;
+} ConfidentialGuestSupportClass;
+
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* QEMU_CONFIDENTIAL_GUEST_SUPPORT_H */
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 976b529dfb..33685c79ed 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -36,6 +36,7 @@ typedef struct BusState BusState;
 typedef struct Chardev Chardev;
 typedef struct CompatProperty CompatProperty;
 typedef struct CoMutex CoMutex;
+typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
 typedef struct CPUState CPUState;
 typedef struct DeviceListener DeviceListener;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 1546606811..6b49925f51 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -31,6 +31,7 @@
 #include "qom/object.h"
 #include "exec/address-spaces.h"
 #include "monitor/monitor.h"
+#include "exec/confidential-guest-support.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -322,7 +323,7 @@ sev_guest_instance_init(Object *obj)
 
 /* sev guest info */
 static const TypeInfo sev_guest_info = {
-    .parent = TYPE_OBJECT,
+    .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
     .name = TYPE_SEV_GUEST,
     .instance_size = sizeof(SevGuestState),
     .instance_finalize = sev_guest_finalize,
-- 
2.29.2


