Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF4A65FC4A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 08:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhYQ-0006SQ-Va; Fri, 06 Jan 2023 02:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FbrK=5D=kaod.org=clg@ozlabs.org>)
 id 1pDhXz-0006PD-Kj; Fri, 06 Jan 2023 02:54:13 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=FbrK=5D=kaod.org=clg@ozlabs.org>)
 id 1pDhXx-00068j-Of; Fri, 06 Jan 2023 02:53:51 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NpFvq4HlKz4xyt;
 Fri,  6 Jan 2023 18:53:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NpFvm27G6z4xwq;
 Fri,  6 Jan 2023 18:53:40 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, frankja@linux.ibm.com,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 1/4] s390x/pv: Implement a CGS check helper
Date: Fri,  6 Jan 2023 08:53:27 +0100
Message-Id: <20230106075330.3662549-2-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106075330.3662549-1-clg@kaod.org>
References: <20230106075330.3662549-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=FbrK=5D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Cédric Le Goater <clg@redhat.com>

When a protected VM is started with the maximum number of CPUs (248),
the service call providing information on the CPUs requires more
buffer space than allocated and QEMU disgracefully aborts :

    LOADPARM=[........]
    Using virtio-blk.
    Using SCSI scheme.
    ...................................................................................
    qemu-system-s390x: KVM_S390_MEM_OP failed: Argument list too long

When protected virtualization is initialized, compute the maximum
number of vCPUs supported by the machine and return useful information
to the user before the machine starts in case of error.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/s390x/pv.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8dfe92d8df..8a1c71436b 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -20,6 +20,7 @@
 #include "exec/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
 #include "hw/s390x/pv.h"
+#include "hw/s390x/sclp.h"
 #include "target/s390x/kvm/kvm_s390x.h"
 
 static bool info_valid;
@@ -249,6 +250,41 @@ struct S390PVGuestClass {
     ConfidentialGuestSupportClass parent_class;
 };
 
+/*
+ * If protected virtualization is enabled, the amount of data that the
+ * Read SCP Info Service Call can use is limited to one page. The
+ * available space also depends on the Extended-Length SCCB (ELS)
+ * feature which can take more buffer space to store feature
+ * information. This impacts the maximum number of CPUs supported in
+ * the machine.
+ */
+static uint32_t s390_pv_get_max_cpus(void)
+{
+    int offset_cpu = s390_has_feat(S390_FEAT_EXTENDED_LENGTH_SCCB) ?
+        offsetof(ReadInfo, entries) : SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET;
+
+    return (TARGET_PAGE_SIZE - offset_cpu) / sizeof(CPUEntry);
+}
+
+static bool s390_pv_check_cpus(Error **errp)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    uint32_t pv_max_cpus = s390_pv_get_max_cpus();
+
+    if (ms->smp.max_cpus > pv_max_cpus) {
+        error_setg(errp, "Protected VMs support a maximum of %d CPUs",
+                   pv_max_cpus);
+        return false;
+    }
+
+    return true;
+}
+
+static bool s390_pv_guest_check(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    return s390_pv_check_cpus(errp);
+}
+
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
     if (!object_dynamic_cast(OBJECT(cgs), TYPE_S390_PV_GUEST)) {
@@ -261,6 +297,10 @@ int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
         return -1;
     }
 
+    if (!s390_pv_guest_check(cgs, errp)) {
+        return -1;
+    }
+
     cgs->ready = true;
 
     return 0;
-- 
2.38.1


