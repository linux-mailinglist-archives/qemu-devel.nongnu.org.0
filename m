Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF34DC851
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:04:47 +0100 (CET)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUqkA-0002ne-Gq
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:04:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfH-00082k-09
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:35297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqfE-0003xY-DW
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525580; x=1679061580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3WzDRIiZ1CcZSK5KtHettxe/WpKlhexsbDKHBxUEpiU=;
 b=aqSB5K6AyyHZYXs9sdISM3611KdSUer50caxJwvCKzWooS8fXd0Dws1D
 sIXX1Umyfu3PKYV7QrU1bAoDsmWGJU6/OZZ7E4xbM2EbloW3J8LWHzSQ7
 YvzQC5NzddVN2h+bGjW4spBSPpFsZSNYtqWCsxcdhsgKmlbCgApPMeEHj
 p+0ZjjCQF+/y0HhZ70LXIWVDfVG+WR0kgNClFiSdo9+sJjHcce1y9mWaE
 37GdoN41E+jq2okYEJrCkVj6ZCvMWUwsFELIQY9YcrmKlnxzLOdlVDuwT
 tKKawiCOA1hSNgzgVeb785PPUsAK6Wlmxs/UL4ZWiUXEGfcuoGsikvwAF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237482017"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="237482017"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 06:59:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541377859"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 06:59:31 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [RFC PATCH v3 04/36] target/i386: Introduce
 kvm_confidential_guest_init()
Date: Thu, 17 Mar 2022 21:58:41 +0800
Message-Id: <20220317135913.2166202-5-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=xiaoyao.li@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a separate function kvm_confidential_guest_init() for SEV (and
future TDX).

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/kvm.c | 11 ++++++++++-
 target/i386/sev.c     |  1 -
 target/i386/sev.h     |  2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 89d5eb58cb3e..70454355f3bf 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2356,6 +2356,15 @@ static void register_smram_listener(Notifier *n, void *unused)
                                  &smram_address_space, 1, "kvm-smram");
 }
 
+static int kvm_confidential_guest_init(MachineState *ms, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(ms->cgs), TYPE_SEV_GUEST)) {
+        return sev_kvm_init(ms->cgs, errp);
+    }
+
+    return 0;
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     uint64_t identity_base = 0xfffbc000;
@@ -2376,7 +2385,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
      * mechanisms are supported in future (e.g. TDX), they'll need
      * their own initialization either here or elsewhere.
      */
-    ret = sev_kvm_init(ms->cgs, &local_err);
+    ret = kvm_confidential_guest_init(ms, &local_err);
     if (ret < 0) {
         error_report_err(local_err);
         return ret;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 025ff7a6f845..912f5cdfb91d 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -39,7 +39,6 @@
 #include "hw/i386/pc.h"
 #include "exec/address-spaces.h"
 
-#define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
 
 
diff --git a/target/i386/sev.h b/target/i386/sev.h
index 83e82aa42c41..a9c980dd4b2d 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -20,6 +20,8 @@
 
 #include "exec/confidential-guest-support.h"
 
+#define TYPE_SEV_GUEST "sev-guest"
+
 #define SEV_POLICY_NODBG        0x1
 #define SEV_POLICY_NOKS         0x2
 #define SEV_POLICY_ES           0x4
-- 
2.27.0


