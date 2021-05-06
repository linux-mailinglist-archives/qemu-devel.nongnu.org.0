Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B4374D0A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:48:06 +0200 (CEST)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT7V-0001Pb-7g
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0v-0002hD-J0
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:17 -0400
Received: from mga17.intel.com ([192.55.52.151]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0t-0007bf-VW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:17 -0400
IronPort-SDR: FLrnQY2q957Ax0OsYQ6XPB10OxYts+w1umfShzG3rmRP1PyZ6jLp/rn/R+/UFS/svMblWQ72Ho
 FwMvOvHlMugg==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579151"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579151"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:14 -0700
IronPort-SDR: ODijVWIWkzgja8CNKpLWpZYAZg3ObQCFIyQMQIh65kRS1XKW1o23AcwOk8oNfVSLYrsrlRx73v
 2viTFNtg6E2A==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220387"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:11 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 05/10] Set the RAM's MemoryRegion::debug_ops for INTEL
 TD guests
Date: Thu,  6 May 2021 09:40:32 +0800
Message-Id: <20210506014037.11982-6-yuan.yao@linux.intel.com>
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

Now only set the RAM's debug_ops for INTEL TD guests, SEV can also
rely on the common part introduced in previous patch or introduce
new debug_ops implementation if it's necessary.

Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d5a4345f44..772b19c524 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -60,6 +60,7 @@
 #include "sysemu/xen.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
+#include "sysemu/tdx.h"
 #include "kvm/kvm_i386.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/start_info.h"
@@ -992,6 +993,9 @@ void pc_memory_init(PCMachineState *pcms,
 
     /* Init ACPI memory hotplug IO base address */
     pcms->memhp_io_base = ACPI_MEMORY_HOTPLUG_BASE;
+
+    if (tdx_debug_enabled(machine->cgs))
+        kvm_set_memory_region_debug_ops(NULL, *ram_memory);
 }
 
 /*
diff --git a/include/sysemu/tdx.h b/include/sysemu/tdx.h
index 429bb0ff8e..bd0af77c03 100644
--- a/include/sysemu/tdx.h
+++ b/include/sysemu/tdx.h
@@ -16,4 +16,7 @@ void tdx_post_init_vcpu(CPUState *cpu);
 struct TDXCapability;
 struct TDXCapability *tdx_get_capabilities(void);
 
+struct ConfidentialGuestSupport;
+bool tdx_debug_enabled(ConfidentialGuestSupport *cgs);
+
 #endif
diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index c4e5686260..d13d4c8487 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -384,3 +384,18 @@ static void tdx_guest_finalize(Object *obj)
 static void tdx_guest_class_init(ObjectClass *oc, void *data)
 {
 }
+
+bool tdx_debug_enabled(ConfidentialGuestSupport *cgs)
+{
+    TdxGuest *tdx;
+
+    if (!cgs)
+        return false;
+
+    tdx = (TdxGuest *)object_dynamic_cast(OBJECT(cgs),
+                                          TYPE_TDX_GUEST);
+    if (!tdx)
+        return false;
+
+    return tdx->debug;
+}
-- 
2.20.1


