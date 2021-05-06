Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465E374CF8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:43:08 +0200 (CEST)
Received: from localhost ([::1]:48040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT2h-00047j-3b
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0t-0002es-NX
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0s-0007bf-1H
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:15 -0400
IronPort-SDR: FIKyKMEbJQ6FY21/bgKVPp3ImoT2ScTtOlU13kmhdr1vgXzkUpO81Agm2F++QJWPj/Zq9i/SKq
 Jx5SuBxo9KSw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579138"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:08 -0700
IronPort-SDR: uPhji8wrqNaeZG3Mx15aTG3QoZ6b2xJWQMAzi0YXCWaHM9Oyfz1pgbKWFbHplu9hTt+6w9flb1
 uo/VoboerKoA==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220354"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:05 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 03/10] Introduce new interface
 KVMState::set_mr_debug_ops and its wrapper
Date: Thu,  6 May 2021 09:40:30 +0800
Message-Id: <20210506014037.11982-4-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506014037.11982-1-yuan.yao@linux.intel.com>
References: <20210506014037.11982-1-yuan.yao@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yuan.yao@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuan Yao <yuan.yao@intel.com>

This interface is designed to setup the MemoryRegion::debug_ops.

Also introduced 2 wrapper functions for installing/calling the
KVMState::set_mr_debug_ops from different targets easily.

Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b6d5c9fd7d..1482561bd7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -129,6 +129,8 @@ struct KVMState
         KVMMemoryListener *ml;
         AddressSpace *as;
     } *as;
+
+    set_memory_region_debug_ops set_mr_debug_ops;
 };
 
 KVMState *kvm_state;
@@ -3157,6 +3159,21 @@ static void kvm_set_kernel_irqchip(Object *obj, Visitor *v,
     }
 }
 
+void kvm_setup_memory_region_debug_ops(struct KVMState *s,
+                                       set_memory_region_debug_ops new_ops)
+{
+    if (s)
+        s->set_mr_debug_ops = new_ops;
+}
+
+void kvm_set_memory_region_debug_ops(void *handle, MemoryRegion *mr)
+{
+    if (!kvm_state || !kvm_state->set_mr_debug_ops)
+        return;
+
+    kvm_state->set_mr_debug_ops(handle, mr);
+}
+
 bool kvm_kernel_irqchip_allowed(void)
 {
     return kvm_state->kernel_irqchip_allowed;
diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 0f17acfac0..f1c57ad8d7 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -148,4 +148,15 @@ bool kvm_arm_supports_user_irq(void)
 {
     return false;
 }
+
+void kvm_setup_memory_region_debug_ops(struct KVMState *s,
+                                       set_memory_region_debug_ops new_ops)
+{
+
+}
+
+void kvm_set_memory_region_debug_ops(void *handle, MemoryRegion *mr)
+{
+
+}
 #endif
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..64685cad57 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,9 @@ bool kvm_cpu_check_are_resettable(void);
 
 bool kvm_arch_cpu_check_are_resettable(void);
 
+typedef void (*set_memory_region_debug_ops)(void *handle, MemoryRegion *mr);
+void kvm_setup_memory_region_debug_ops(struct KVMState *s, set_memory_region_debug_ops new_ops);
+
+void kvm_set_memory_region_debug_ops(void *handle, MemoryRegion *mr);
+
 #endif
-- 
2.20.1


