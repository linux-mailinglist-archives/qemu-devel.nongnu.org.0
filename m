Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AB30B660
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 05:21:08 +0100 (CET)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6nBb-0006Qx-5b
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 23:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4R-0005zO-Dj; Mon, 01 Feb 2021 23:13:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:46623 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l6n4P-0004yq-Eg; Mon, 01 Feb 2021 23:13:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DVBHz39fwz9tkx; Tue,  2 Feb 2021 15:13:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612239199;
 bh=EC9nTg+Uv3v+VvRKFWEjtF2Rk7pUODae9A3gtMZRc6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=isurvp9Wqau9433wIFzYsTRwZtbwsrI/T8WfCTTV7juwUTbyw+YM3VrWT7kv6WBkG
 7XspQYrSVJ2YnyAJsd65nx8PGfDUnQ+/o5qa7U2aq/x+R2Bri2Ypy68Eqf69EQ07yD
 R3kCDXWlmIsCagH/GsvJqGOg2ZSMkhBcPSS0Ftlc=
From: David Gibson <david@gibson.dropbear.id.au>
To: dgilbert@redhat.com, pair@us.ibm.com, qemu-devel@nongnu.org,
 brijesh.singh@amd.com, pasic@linux.ibm.com
Subject: [PATCH v8 08/13] confidential guest support: Move SEV initialization
 into arch specific code
Date: Tue,  2 Feb 2021 15:13:10 +1100
Message-Id: <20210202041315.196530-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202041315.196530-1-david@gibson.dropbear.id.au>
References: <20210202041315.196530-1-david@gibson.dropbear.id.au>
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

While we've abstracted some (potential) differences between mechanisms for
securing guest memory, the initialization is still specific to SEV.  Given
that, move it into x86's kvm_arch_init() code, rather than the generic
kvm_init() code.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 accel/kvm/kvm-all.c   | 14 --------------
 accel/kvm/sev-stub.c  |  4 ++--
 target/i386/kvm/kvm.c | 20 ++++++++++++++++++++
 target/i386/sev.c     |  7 ++++++-
 4 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 3d820d0c7d..7150acdbcc 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2180,20 +2180,6 @@ static int kvm_init(MachineState *ms)
 
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
index 6dc1ee052d..4788139128 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -42,6 +42,7 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
+#include "sysemu/sev.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
@@ -2135,6 +2136,25 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     uint64_t shadow_mem;
     int ret;
     struct utsname utsname;
+    Error *local_err = NULL;
+
+    /*
+     * Initialize SEV context, if required
+     *
+     * If no memory encryption is requested (ms->cgs == NULL) this is
+     * a no-op.
+     *
+     * It's also a no-op if a non-SEV confidential guest support
+     * mechanism is selected.  SEV is the only mechanism available to
+     * select on x86 at present, so this doesn't arise, but if new
+     * mechanisms are supported in future (e.g. TDX), they'll need
+     * their own initialization either here or elsewhere.
+     */
+    ret = sev_kvm_init(ms->cgs, &local_err);
+    if (ret < 0) {
+        error_report_err(local_err);
+        return ret;
+    }
 
     if (!kvm_check_extension(s, KVM_CAP_IRQ_ROUTING)) {
         error_report("kvm: KVM_CAP_IRQ_ROUTING not supported by KVM");
diff --git a/target/i386/sev.c b/target/i386/sev.c
index f9e9b5d8ae..11c9a3cc21 100644
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


