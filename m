Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9630B649
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 05:16:08 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6n6l-00080N-Ab
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 23:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4O-0005qU-5u; Mon, 01 Feb 2021 23:13:40 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:33139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4J-0004oH-EO; Mon, 01 Feb 2021 23:13:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DVBHy2H5Pz9tkT; Tue,  2 Feb 2021 15:13:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612239198;
 bh=wapW+hFPonrY5NcNhJL2s94tGKTRKw27BwqVT6c2VhM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kxrndv7WCmuM7u8JHMgB7B+Agc7901eUVObmDzzSI88LwsaT6hImoIICXv3cUnsPb
 5UTZ1927wgxoDi+DRpBEDCHFsQAcwygcYD7bsTG0YxgN2yyej5M7j4Wz5d4oRH9BkH
 X2QKaT9Ia/7X6+ZPJBlNpd9w5rPhrAfx1CJUURck=
From: David Gibson <david@gibson.dropbear.id.au>
To: dgilbert@redhat.com, pair@us.ibm.com, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PATCH v8 02/13] confidential guest support: Introduce new
 confidential guest support class
Date: Tue,  2 Feb 2021 15:13:04 +1100
Message-Id: <20210202041315.196530-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202041315.196530-1-david@gibson.dropbear.id.au>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
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
Cc: thuth@redhat.com, Cornelia Huck <cohuck@redhat.com>, berrange@redhat.com,
 mst@redhat.com, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 jun.nakajima@intel.com, mtosatti@redhat.com, richard.henderson@linaro.org,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, pragyansri.pathi@intel.com, qemu-s390x@nongnu.org,
 frankja@linux.ibm.com, qemu-ppc@nongnu.org, andi.kleen@intel.com,
 pbonzini@redhat.com, borntraeger@de.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several architectures have mechanisms which are designed to protect
guest memory from interference or eavesdropping by a compromised
hypervisor.  AMD SEV does this with in-chip memory encryption and
Intel's TDX can do similar things.  POWER's Protected Execution
Framework (PEF) accomplishes a similar goal using an ultravisor and
new memory protection features, instead of encryption.

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
 backends/confidential-guest-support.c     | 33 ++++++++++++++++++++
 backends/meson.build                      |  1 +
 include/exec/confidential-guest-support.h | 38 +++++++++++++++++++++++
 include/qemu/typedefs.h                   |  1 +
 target/i386/sev.c                         |  5 +--
 5 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 backends/confidential-guest-support.c
 create mode 100644 include/exec/confidential-guest-support.h

diff --git a/backends/confidential-guest-support.c b/backends/confidential-guest-support.c
new file mode 100644
index 0000000000..052fde8db0
--- /dev/null
+++ b/backends/confidential-guest-support.c
@@ -0,0 +1,33 @@
+/*
+ * QEMU Confidential Guest support
+ *
+ * Copyright Red Hat.
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
+OBJECT_DEFINE_ABSTRACT_TYPE(ConfidentialGuestSupport,
+                            confidential_guest_support,
+                            CONFIDENTIAL_GUEST_SUPPORT,
+                            OBJECT)
+
+static void confidential_guest_support_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static void confidential_guest_support_init(Object *obj)
+{
+}
+
+static void confidential_guest_support_finalize(Object *obj)
+{
+}
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
index 0000000000..3db6380e63
--- /dev/null
+++ b/include/exec/confidential-guest-support.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU Confidential Guest support
+ *   This interface describes the common pieces between various
+ *   schemes for protecting guest memory or other state against a
+ *   compromised hypervisor.  This includes memory encryption (AMD's
+ *   SEV and Intel's MKTME) or special protection modes (PEF on POWER,
+ *   or PV on s390x).
+ *
+ * Copyright Red Hat.
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
+OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
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
index 68deb74ef6..dc39b05c30 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -37,6 +37,7 @@ typedef struct Chardev Chardev;
 typedef struct Clock Clock;
 typedef struct CompatProperty CompatProperty;
 typedef struct CoMutex CoMutex;
+typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
 typedef struct CPUState CPUState;
 typedef struct DeviceListener DeviceListener;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 1546606811..b738dc45b6 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -31,6 +31,7 @@
 #include "qom/object.h"
 #include "exec/address-spaces.h"
 #include "monitor/monitor.h"
+#include "exec/confidential-guest-support.h"
 
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
@@ -47,7 +48,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
  *         -machine ...,memory-encryption=sev0
  */
 struct SevGuestState {
-    Object parent_obj;
+    ConfidentialGuestSupport parent_obj;
 
     /* configuration parameters */
     char *sev_device;
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


