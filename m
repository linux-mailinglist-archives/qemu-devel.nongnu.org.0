Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EA52F2754
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:48:51 +0100 (CET)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBbu-0004hK-Sc
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzBYf-0002K1-Sm; Mon, 11 Jan 2021 23:45:32 -0500
Received: from ozlabs.org ([203.11.71.1]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kzBYb-0007zi-SJ; Mon, 11 Jan 2021 23:45:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DFJ0S0D1Kz9t13; Tue, 12 Jan 2021 15:45:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610426712;
 bh=DVHvwIFYF5zIwyyGLWDcCato2JVKksJgBlh9j+VQqL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GkSx3q+x7ejEagF85/HccWu4gAhO/6BUJ0XyFctMXE9snjZBb3jNW0UsB4tiiM/aH
 sGoe+jrnD/L58SMN0Fe5QC6IxuEUKjjdIQjLwhMJezwVp14foZYCdSsjQUkULNayeD
 c4oNK1DFAUgoTSosy4x03oiui6RwbdzsHcR4zJok=
From: David Gibson <david@gibson.dropbear.id.au>
To: pasic@linux.ibm.com, brijesh.singh@amd.com, pair@us.ibm.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 08/13] confidential guest support: Move SEV initialization
 into arch specific code
Date: Tue, 12 Jan 2021 15:45:03 +1100
Message-Id: <20210112044508.427338-9-david@gibson.dropbear.id.au>
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

While we've abstracted some (potential) differences between mechanisms for
securing guest memory, the initialization is still specific to SEV.  Given
that, move it into x86's kvm_arch_init() code, rather than the generic
kvm_init() code.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 accel/kvm/kvm-all.c   | 14 --------------
 accel/kvm/sev-stub.c  |  4 ++--
 target/i386/kvm/kvm.c | 12 ++++++++++++
 target/i386/sev.c     |  7 ++++++-
 4 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c5b0750fd0..adf27c1864 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2177,20 +2177,6 @@ static int kvm_init(MachineState *ms)
 
     kvm_state = s;
 
-    /*
-     * if memory encryption object is specified then initialize the memory
-     * encryption context.
-     */
-    if (ms->cgs) {
-        Error *local_err = NULL;
-        /* FIXME handle mechanisms other than SEV */
-        ret = sev_kvm_init(ms->cgs, &local_err);
-        if (ret < 0) {
-            error_report_err(local_err);
-            goto err;
-        }
-    }
-
     ret = kvm_arch_init(ms, s);
     if (ret < 0) {
         goto err;
diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
index 512e205f7f..9587d1b2a3 100644
--- a/accel/kvm/sev-stub.c
+++ b/accel/kvm/sev-stub.c
@@ -17,6 +17,6 @@
 
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
-    /* SEV can't be selected if it's not compiled */
-    g_assert_not_reached();
+    /* If we get here, cgs must be some non-SEV thing */
+    return 0;
 }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 6dc1ee052d..e8b9dc48a2 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -42,6 +42,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
+#include "sysemu/sev.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
@@ -2135,6 +2136,17 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     uint64_t shadow_mem;
     int ret;
     struct utsname utsname;
+    Error *local_err = NULL;
+
+    /*
+     * if memory encryption object is specified then initialize the
+     * memory encryption context (no-op otherwise)
+     */
+    ret = sev_kvm_init(ms->cgs, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
 
     if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
         error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 3d94635397..aa79cacabe 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -664,13 +664,18 @@ sev_vm_state_change(void *opaque, int running, RunState state)
 
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
-    SevGuestState *sev = SEV_GUEST(cgs);
+    SevGuestState *sev
+        = (SevGuestState *)object_dynamic_cast(OBJECT(cgs), TYPE_SEV_GUEST);
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
2.29.2


