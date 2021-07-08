Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F5F3BF348
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:06:58 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IVF-0006DC-16
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKk-0001mP-9X
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:06 -0400
Received: from mga12.intel.com ([192.55.52.136]:57600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKg-0007Kk-06
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101721"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101721"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770089"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:57 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 31/44] target/i386/tdx: Allows
 mrconfigid/mrowner/mrownerconfig for TDX_INIT_VM
Date: Wed,  7 Jul 2021 17:55:01 -0700
Message-Id: <9f1e7fd7678900791d2094d2f0def53fe0afc658.1625704981.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=isaku.yamahata@intel.com; helo=mga12.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

When creating VM with TDX_INIT_VM, three sha384 hash values are accepted
for TDX attestation.
So far they were hard coded as 0. Now allow user to specify those values
via property mrconfigid, mrowner and mrownerconfig.
string for those property are hex string of 48 * 2 length.

example
-device tdx-guest, \
  mrconfigid=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef, \
  mrowner=fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210, \
  mrownerconfig=0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 qapi/qom.json         | 11 ++++++++++-
 target/i386/kvm/tdx.c | 17 +++++++++++++++++
 target/i386/kvm/tdx.h |  3 +++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 70c70e3efe..8f8b7828b3 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -767,10 +767,19 @@
 #
 # @debug: enable debug mode (default: off)
 #
+# @mrconfigid: MRCONFIGID SHA384 hex string of 48 * 2 length (default: 0)
+#
+# @mrowner: MROWNER SHA384 hex string of 48 * 2 length (default: 0)
+#
+# @mrownerconfig: MROWNERCONFIG SHA384 hex string of 48 * 2 length (default: 0)
+#
 # Since: 6.0
 ##
 { 'struct': 'TdxGuestProperties',
-  'data': { '*debug': 'bool' } }
+  'data': { '*debug': 'bool',
+            '*mrconfigid': 'str',
+            '*mrowner': 'str',
+            '*mrownerconfig': 'str' } }
 
 ##
 # @ObjectType:
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 47a502051c..6b560c1c0b 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -282,6 +282,17 @@ void tdx_pre_create_vcpu(CPUState *cpu)
     init_vm.attributes |= tdx->debug ? TDX1_TD_ATTRIBUTE_DEBUG : 0;
     init_vm.attributes |= x86cpu->enable_pmu ? TDX1_TD_ATTRIBUTE_PERFMON : 0;
 
+    QEMU_BUILD_BUG_ON(sizeof(init_vm.mrconfigid) != sizeof(tdx->mrconfigid));
+    memcpy(init_vm.mrconfigid, tdx->mrconfigid, sizeof(init_vm.mrconfigid));
+    QEMU_BUILD_BUG_ON(sizeof(init_vm.mrowner) != sizeof(tdx->mrowner));
+    memcpy(init_vm.mrowner, tdx->mrowner, sizeof(init_vm.mrowner));
+    QEMU_BUILD_BUG_ON(sizeof(init_vm.mrownerconfig) !=
+                      sizeof(tdx->mrownerconfig));
+    memcpy(init_vm.mrownerconfig, tdx->mrownerconfig,
+           sizeof(init_vm.mrownerconfig));
+
+    memset(init_vm.reserved, 0, sizeof(init_vm.reserved));
+
     init_vm.cpuid = (__u64)(&cpuid_data);
     tdx_ioctl(KVM_TDX_INIT_VM, 0, &init_vm);
 out:
@@ -336,6 +347,12 @@ static void tdx_guest_init(Object *obj)
     tdx->debug = false;
     object_property_add_bool(obj, "debug", tdx_guest_get_debug,
                              tdx_guest_set_debug);
+    object_property_add_sha384(obj, "mrconfigid", tdx->mrconfigid,
+                               OBJ_PROP_FLAG_READWRITE);
+    object_property_add_sha384(obj, "mrowner", tdx->mrowner,
+                               OBJ_PROP_FLAG_READWRITE);
+    object_property_add_sha384(obj, "mrownerconfig", tdx->mrownerconfig,
+                               OBJ_PROP_FLAG_READWRITE);
 }
 
 static void tdx_guest_finalize(Object *obj)
diff --git a/target/i386/kvm/tdx.h b/target/i386/kvm/tdx.h
index 2fed27b3fb..4132d1be30 100644
--- a/target/i386/kvm/tdx.h
+++ b/target/i386/kvm/tdx.h
@@ -44,6 +44,9 @@ typedef struct TdxGuest {
 
     bool initialized;
     bool debug;
+    uint8_t mrconfigid[48];     /* sha348 digest */
+    uint8_t mrowner[48];        /* sha348 digest */
+    uint8_t mrownerconfig[48];  /* sha348 digest */
 
     TdxFirmware fw;
 } TdxGuest;
-- 
2.25.1


