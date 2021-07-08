Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23193BF351
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:09:31 +0200 (CEST)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IXi-0003Py-QH
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKm-0001wX-Tw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:57606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKk-0007L7-JB
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="189101723"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="189101723"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423770092"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:58 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 32/44] tdx: add kvm_tdx_enabled() accessor for later use
Date: Wed,  7 Jul 2021 17:55:02 -0700
Message-Id: <26d88e7618038c1fed501352a04144745abd12ae.1625704981.git.isaku.yamahata@intel.com>
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

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 include/sysemu/tdx.h  | 1 +
 target/i386/kvm/kvm.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
index 70eb01348f..f3eced10f9 100644
--- a/include/sysemu/tdx.h
+++ b/include/sysemu/tdx.h
@@ -6,6 +6,7 @@
 #include "hw/i386/pc.h"
 
 bool kvm_has_tdx(KVMState *s);
+bool kvm_tdx_enabled(void);
 int tdx_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 #endif
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index af6b5f350e..76c3ea9fac 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -152,6 +152,11 @@ int kvm_set_vm_type(MachineState *ms, int kvm_type)
     return -ENOTSUP;
 }
 
+bool kvm_tdx_enabled(void)
+{
+    return vm_type == KVM_X86_TDX_VM;
+}
+
 int kvm_has_pit_state2(void)
 {
     return has_pit_state2;
-- 
2.25.1


