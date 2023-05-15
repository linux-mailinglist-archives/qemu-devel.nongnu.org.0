Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49FE702E97
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:43:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsR-0007ff-Rj; Mon, 15 May 2023 09:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqw-0004Ym-Ef
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqt-00012b-41
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcGOPgvDpC4yHjaBKQybaAT3zpZnR7tkj4ipkbPf6Oo=;
 b=c7JGxs03xSrvxrzkzU9cbXPjD2QqVB+2Vd6lxzqxZzhrs5Y2SXFif2HO5B01yik9zeaFcV
 Jz5b3PA5LUxYsxlJXY72faKWd7XVMGjAPxeabJl5ztCjihPQWSTEltGV5BmDSc8SC87vP4
 ReDQ5r9939hphS9b+1t+2Savoagtkx4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-HjwjJ3paNFmVu7oLtzm98Q-1; Mon, 15 May 2023 09:02:54 -0400
X-MC-Unique: HjwjJ3paNFmVu7oLtzm98Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABA723C21BA8;
 Mon, 15 May 2023 13:02:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C82EF40C6EC4;
 Mon, 15 May 2023 13:02:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>
Subject: [PULL 10/21] s390x/pv: Fix spurious warning with asynchronous teardown
Date: Mon, 15 May 2023 15:02:22 +0200
Message-Id: <20230515130233.418183-11-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Claudio Imbrenda <imbrenda@linux.ibm.com>

Kernel commit 292a7d6fca33 ("KVM: s390: pv: fix asynchronous teardown
for small VMs") causes the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl to fail
if the VM is not larger than 2GiB. QEMU would attempt it and fail,
print an error message, and then proceed with a normal teardown.

Avoid attempting to use asynchronous teardown altogether when the VM is
not larger than 2 GiB. This will avoid triggering the error message and
also avoid pointless overhead; normal teardown is fast enough for small
VMs.

Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Fixes: c3a073c610 ("s390x/pv: Add support for asynchronous teardown for reboot")
Link: https://lore.kernel.org/all/20230421085036.52511-2-imbrenda@linux.ibm.com/
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Message-Id: <20230510105531.30623-2-imbrenda@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
[thuth: Fix inline function parameter in pv.h]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/pv.h      |  6 +++---
 hw/s390x/pv.c              | 10 ++++++++--
 hw/s390x/s390-virtio-ccw.c |  2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 966306a9db..7b935e2246 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -14,10 +14,10 @@
 
 #include "qapi/error.h"
 #include "sysemu/kvm.h"
+#include "hw/s390x/s390-virtio-ccw.h"
 
 #ifdef CONFIG_KVM
 #include "cpu.h"
-#include "hw/s390x/s390-virtio-ccw.h"
 
 static inline bool s390_is_pv(void)
 {
@@ -41,7 +41,7 @@ static inline bool s390_is_pv(void)
 int s390_pv_query_info(void);
 int s390_pv_vm_enable(void);
 void s390_pv_vm_disable(void);
-bool s390_pv_vm_try_disable_async(void);
+bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms);
 int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
 int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak);
 void s390_pv_prep_reset(void);
@@ -61,7 +61,7 @@ static inline bool s390_is_pv(void) { return false; }
 static inline int s390_pv_query_info(void) { return 0; }
 static inline int s390_pv_vm_enable(void) { return 0; }
 static inline void s390_pv_vm_disable(void) {}
-static inline bool s390_pv_vm_try_disable_async(void) { return false; }
+static inline bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms) { return false; }
 static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t length) { return 0; }
 static inline int s390_pv_unpack(uint64_t addr, uint64_t size, uint64_t tweak) { return 0; }
 static inline void s390_pv_prep_reset(void) {}
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 49ea38236c..b63f3784c6 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -13,6 +13,7 @@
 
 #include <linux/kvm.h>
 
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
@@ -115,7 +116,7 @@ static void *s390_pv_do_unprot_async_fn(void *p)
      return NULL;
 }
 
-bool s390_pv_vm_try_disable_async(void)
+bool s390_pv_vm_try_disable_async(S390CcwMachineState *ms)
 {
     /*
      * t is only needed to create the thread; once qemu_thread_create
@@ -123,7 +124,12 @@ bool s390_pv_vm_try_disable_async(void)
      */
     QemuThread t;
 
-    if (!kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
+    /*
+     * If the feature is not present or if the VM is not larger than 2 GiB,
+     * KVM_PV_ASYNC_CLEANUP_PREPARE fill fail; no point in attempting it.
+     */
+    if ((MACHINE(ms)->maxram_size <= 2 * GiB) ||
+        !kvm_check_extension(kvm_state, KVM_CAP_S390_PROTECTED_ASYNC_DISABLE)) {
         return false;
     }
     if (s390_pv_cmd(KVM_PV_ASYNC_CLEANUP_PREPARE, NULL) != 0) {
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e6f2c62625..2516b89b32 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -330,7 +330,7 @@ static inline void s390_do_cpu_ipl(CPUState *cs, run_on_cpu_data arg)
 
 static void s390_machine_unprotect(S390CcwMachineState *ms)
 {
-    if (!s390_pv_vm_try_disable_async()) {
+    if (!s390_pv_vm_try_disable_async(ms)) {
         s390_pv_vm_disable();
     }
     ms->pv = false;
-- 
2.31.1


