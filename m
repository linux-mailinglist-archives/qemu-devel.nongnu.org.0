Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E63C22EE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 13:35:37 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1onA-0002nO-6j
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 07:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oU2-0000dU-4F
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:37173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1oTz-0005A9-H6
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 07:15:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="270800838"
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="270800838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 04:15:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,226,1620716400"; d="scan'208";a="428730284"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga002.jf.intel.com with ESMTP; 09 Jul 2021 04:14:59 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/33] sgx-epc: Avoid bios reset during sgx epc
 initialization
Date: Fri,  9 Jul 2021 19:09:46 +0800
Message-Id: <20210709110955.73256-25-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210709110955.73256-1-yang.zhong@intel.com>
References: <20210709110955.73256-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since bios do the reset when qemu boot up, and sgx epc will be
reset by the registered reset callback function. Like this, the
sgx epc will do two times initialization. This patch will check
protected mode from cr0 register, and will bypass reset operation
from bios. The reset callback will only accept reset operation
from guest.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/i386/sgx-epc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/i386/sgx-epc.c b/hw/i386/sgx-epc.c
index 99a7fb8ba1..a1784d4c8f 100644
--- a/hw/i386/sgx-epc.c
+++ b/hw/i386/sgx-epc.c
@@ -19,6 +19,7 @@
 #include "target/i386/cpu.h"
 #include "exec/address-spaces.h"
 #include "sysemu/reset.h"
+#include "sysemu/hw_accel.h"
 
 uint32_t epc_num;
 
@@ -97,6 +98,21 @@ static void sgx_epc_initialization(DeviceState *dev)
     sgx_epc->size += memory_device_get_region_size(md, &errp);
 }
 
+static bool check_reset_from_guest(void)
+{
+    CPUState *cs = first_cpu;
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    cpu_synchronize_state(cs);
+
+    if (env->cr[0] & CR0_PE_MASK) {
+        return true;
+    }
+
+    return false;
+}
+
 static void sgx_epc_reset(void *opaque)
 {
     DeviceState *dev = opaque;
@@ -104,6 +120,9 @@ static void sgx_epc_reset(void *opaque)
     Error *errp = NULL;
     int fd;
 
+    if (!check_reset_from_guest())
+        return;
+
     if (!epc->hostmem) {
         error_setg(&errp, "'" SGX_EPC_MEMDEV_PROP "' property is not set");
         return;
-- 
2.29.2.334.gfaefdd61ec


