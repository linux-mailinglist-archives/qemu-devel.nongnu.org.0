Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0B115421
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 16:24:28 +0100 (CET)
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idFT0-00008T-Lj
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 10:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yang.zhong@intel.com>) id 1idEh1-0004PI-UR
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:34:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yang.zhong@intel.com>) id 1idEh0-0003Tu-O7
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:34:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:17868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yang.zhong@intel.com>)
 id 1idEh0-0003FH-DS
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:34:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Dec 2019 23:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,283,1571727600"; d="scan'208";a="223913919"
Received: from he.bj.intel.com ([10.238.157.85])
 by orsmga002.jf.intel.com with ESMTP; 05 Dec 2019 23:07:40 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: pbonzini@redhat.com
Subject: [PATCH] target/i386: disable VMX features if nested=0
Date: Fri,  6 Dec 2019 15:11:11 +0800
Message-Id: <20191206071111.12128-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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
Cc: yang.zhong@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If kvm does not support VMX feature by nested=0, the kvm_vmx_basic
can't get the right value from MSR_IA32_VMX_BASIC register, which
make qemu coredump when qemu do KVM_SET_MSRS.

The coredump info:
error: failed to set MSR 0x480 to 0x0
kvm_put_msrs: Assertion `ret == cpu->kvm_msr_buf->nmsrs' failed.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index bf1655645b..e8841dcdb9 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -2572,6 +2572,14 @@ static void kvm_msr_entry_add_vmx(X86CPU *cpu, FeatureWordArray f)
     uint64_t kvm_vmx_basic =
         kvm_arch_get_supported_msr_feature(kvm_state,
                                            MSR_IA32_VMX_BASIC);
+    if (!kvm_vmx_basic) {
+        /* If the kernel does't support VMX feature(nested=0 in kvm)
+         * and kvm_vmx_basic will be 0. This will set 0 value to
+         * MSR_IA32_VMX_BASIC MSR.
+         */
+        return;
+    }
+
     uint64_t kvm_vmx_misc =
         kvm_arch_get_supported_msr_feature(kvm_state,
                                            MSR_IA32_VMX_MISC);
-- 
2.17.1


