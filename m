Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666CA58788F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:00:23 +0200 (CEST)
Received: from localhost ([::1]:51906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oImpC-0007Er-G8
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdY-00046g-5v
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:8273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdW-0005iP-60
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426498; x=1690962498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HWmkOQ+U91dwMbO8ibq7fYEoh0lSkywusXuLHtXS+IY=;
 b=N8f3AKlIRsD4/PQ17AFy1P741+DvyS5wXOyt9kkQUoW6+8xB7Duv9Abz
 IQRKgqteYO0P6rqgesZppAj+uvEKuj/PQzfw/MwZIS5K9HzzZbCERCyUG
 LMOi2gzCzHtHqWtGaS+B1dmp8Wz3ezRWHYCxiy2upD2thM4Es7eco2e7R
 fZPbWefINYEZi1SB1R3dRHVCBKyxRv7CHSqOHzfdD1upulQuuY48rVZ8K
 lN2oGTn449fGrmyUNgVbO2OtDOtP+AnOPZkvJ4w9c3Xr9A88CrtdurVsv
 FiBC+KmqYGtX73UU4AZauUgUkCTLMvAXlvR+1sQtdXsES1vGrBNOKtLd4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286908453"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286908453"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630603831"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:48:13 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com,
 xiaoyao.li@intel.com
Subject: [PATCH v1 05/40] i386/tdx: Implement tdx_kvm_init() to initialize TDX
 VM context
Date: Tue,  2 Aug 2022 15:47:15 +0800
Message-Id: <20220802074750.2581308-6-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce tdx_kvm_init() and invoke it in kvm_confidential_guest_init()
if it's a TDX VM. More initialization will be added later.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 target/i386/kvm/kvm.c       | 15 ++++++---------
 target/i386/kvm/meson.build |  2 +-
 target/i386/kvm/tdx-stub.c  |  9 +++++++++
 target/i386/kvm/tdx.c       |  7 +++++++
 target/i386/kvm/tdx.h       |  2 ++
 5 files changed, 25 insertions(+), 10 deletions(-)
 create mode 100644 target/i386/kvm/tdx-stub.c

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 1f4a6a4dff28..335f87e6cc59 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -54,6 +54,7 @@
 #include "migration/blocker.h"
 #include "exec/memattrs.h"
 #include "trace.h"
+#include "tdx.h"
 
 #include CONFIG_DEVICES
 
@@ -2452,6 +2453,8 @@ static int kvm_confidential_guest_init(MachineState *ms, Error **errp)
 {
     if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_SEV_GUEST)) {
         return sev_kvm_init(ms->cgs, errp);
+    } else if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_TDX_GUEST)) {
+        return tdx_kvm_init(ms, errp);
     }
 
     return 0;
@@ -2466,16 +2469,10 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     Error *local_err = NULL;
 
     /*
-     * Initialize SEV context, if required
+     * Initialize confidential guest (SEV/TDX) context, if required
      *
-     * If no memory encryption is requested (ms->cgs == NULL) this is
-     * a no-op.
-     *
-     * It's also a no-op if a non-SEV confidential guest support
-     * mechanism is selected.  SEV is the only mechanism available to
-     * select on x86 at present, so this doesn't arise, but if new
-     * mechanisms are supported in future (e.g. TDX), they'll need
-     * their own initialization either here or elsewhere.
+     * It's a no-op if a non-SEV/non-tdx confidential guest support
+     * mechanism is selected, i.e., ms->cgs == NULL
      */
     ret = kvm_confidential_guest_init(ms, &local_err);
     if (ret < 0) {
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index b2d7d41acde2..fd30b93ecec9 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -9,7 +9,7 @@ i386_softmmu_kvm_ss.add(files(
 
 i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
-i386_softmmu_kvm_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'))
+i386_softmmu_kvm_ss.add(when: 'CONFIG_TDX', if_true: files('tdx.c'), if_false: files('tdx-stub.c'))
 
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
diff --git a/target/i386/kvm/tdx-stub.c b/target/i386/kvm/tdx-stub.c
new file mode 100644
index 000000000000..1df24735201e
--- /dev/null
+++ b/target/i386/kvm/tdx-stub.c
@@ -0,0 +1,9 @@
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "tdx.h"
+
+int tdx_kvm_init(MachineState *ms, Error **errp)
+{
+    return -EINVAL;
+}
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index d3792d4a3d56..77e33ae01147 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -12,10 +12,17 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "qom/object_interfaces.h"
 
+#include "hw/i386/x86.h"
 #include "tdx.h"
 
+int tdx_kvm_init(MachineState *ms, Error **errp)
+{
+    return 0;
+}
+
 /* tdx guest */
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(TdxGuest,
                                    tdx_guest,
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 415aeb5af746..c8a23d95258d 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -16,4 +16,6 @@ typedef struct TdxGuest {
     uint64_t attributes;    /* TD attributes */
 } TdxGuest;
 
+int tdx_kvm_init(MachineState *ms, Error **errp);
+
 #endif /* QEMU_I386_TDX_H */
-- 
2.27.0


