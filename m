Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A62CE7D2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:51:26 +0100 (CET)
Received: from localhost ([::1]:52340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl405-0005bS-9k
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tW-0004B6-Df; Fri, 04 Dec 2020 00:44:38 -0500
Received: from ozlabs.org ([203.11.71.1]:47971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kl3tU-000062-KJ; Fri, 04 Dec 2020 00:44:38 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CnM8h3nJ0z9sVw; Fri,  4 Dec 2020 16:44:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607060660;
 bh=pnJf0W657ZqIQCAsU+SbMXMq/ij/zS+RJqdmVHy+dx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UKkxc8iV11JrVmF6RVkWAi412yYd8//9vWGcbEhH6VeDetkjlJIxok/U4bUqGlqTV
 GHcdr5a2Mw0HrE0iN5YtpCspvp/t43OqHQoOMh8fgEiRUu2CJlB1mFe0PEaAzuONkT
 4WwL1hKy7zWBcwkc/m2dv6QUtcQoNgVEeTzNztEE=
From: David Gibson <david@gibson.dropbear.id.au>
To: pair@us.ibm.com, pbonzini@redhat.com, frankja@linux.ibm.com,
 brijesh.singh@amd.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [for-6.0 v5 09/13] securable guest memory: Move SEV initialization
 into arch specific code
Date: Fri,  4 Dec 2020 16:44:11 +1100
Message-Id: <20201204054415.579042-10-david@gibson.dropbear.id.au>
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

While we've abstracted some (potential) differences between mechanisms for
securing guest memory, the initialization is still specific to SEV.  Given
that, move it into x86's kvm_arch_init() code, rather than the generic
kvm_init() code.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 accel/kvm/kvm-all.c | 14 --------------
 target/i386/kvm.c   | 12 ++++++++++++
 target/i386/sev.c   |  7 ++++++-
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 724e9294d0..1b676da6c2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2178,20 +2178,6 @@ static int kvm_init(MachineState *ms)
 
     kvm_state = s;
 
-    /*
-     * if memory encryption object is specified then initialize the memory
-     * encryption context.
-     */
-    if (ms->sgm) {
-        Error *local_err = NULL;
-        /* FIXME handle mechanisms other than SEV */
-        ret = sev_kvm_init(ms->sgm, &local_err);
-        if (ret < 0) {
-            error_report_err(local_err);
-            goto err;
-        }
-    }
-
     ret = kvm_arch_init(ms, s);
     if (ret < 0) {
         goto err;
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index a2934dda02..8e3617f3cd 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -42,6 +42,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
+#include "sysemu/sev.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
@@ -2110,6 +2111,17 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     uint64_t shadow_mem;
     int ret;
     struct utsname utsname;
+    Error *local_err = NULL;
+
+    /*
+     * if memory encryption object is specified then initialize the
+     * memory encryption context (no-op otherwise)
+     */
+    ret = sev_kvm_init(ms->sgm, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
 
     if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
         error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 022ce5fc3a..8c19f4aea6 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -628,13 +628,18 @@ sev_vm_state_change(void *opaque, int running, RunState state)
 
 int sev_kvm_init(SecurableGuestMemory *sgm, Error **errp)
 {
-    SevGuestState *sev = SEV_GUEST(sgm);
+    SevGuestState *sev
+        = (SevGuestState *)object_dynamic_cast(OBJECT(sgm), TYPE_SEV_GUEST);
     char *devname;
     int ret, fw_error;
     uint32_t ebx;
     uint32_t host_cbitpos;
     struct sev_user_data_status status = {};
 
+    if (!sev) {
+        return 0;
+    }
+
     ret = ram_block_discard_disable(true);
     if (ret) {
         error_report("%s: cannot disable RAM discard", __func__);
-- 
2.28.0


