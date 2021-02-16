Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27F31C593
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:37:42 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqFB-00026k-SX
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpuF-0006pq-EI
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:16:05 -0500
Received: from mga17.intel.com ([192.55.52.151]:25635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpu4-0001ZH-1i
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:16:03 -0500
IronPort-SDR: WIF/DqrUiPHyyjYU6R383XMJg7eudRs1IXSwIp5t+bjcFlEQHeaBBlSQf5D0T+Aa/109W6K7hr
 fR7kD6L+dcjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558776"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558776"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:53 -0800
IronPort-SDR: UeepbfHIqHro3Oe0YEBnszN0k3HD0n+ZeFXdp78DRv7POcOCW9F0i0vdGf28jsnsVE0fbS7xRY
 G+ETri2r/2qw==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705450"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:53 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 21/23] i386/tdx: Use KVM_TDX_INIT_VCPU to pass HOB to TDVF
Date: Mon, 15 Feb 2021 18:13:17 -0800
Message-Id: <5b25b7ef1249b2a229aa74541665c83009a99faf.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify the initial value for RCX/R8 to be the address of the HOB.
Don't propagate the value to Qemu's cache of the registers so as to
avoid implying that the register state is valid, e.g. Qemu doesn't model
TDX-SEAM behavior for initializing other GPRs.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 target/i386/kvm/tdx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 49b4355849..007d33989b 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -268,10 +268,17 @@ out:
 
 void tdx_post_init_vcpu(CPUState *cpu)
 {
-    CPUX86State *env = &X86_CPU(cpu)->env;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
+                                                    TYPE_TDX_GUEST);
+    TdxFirmwareEntry *hob;
+
+    if (!tdx) {
+        return;
+    }
 
-    _tdx_ioctl(cpu, KVM_TDX_INIT_VCPU, 0,
-               (void *)(unsigned long)env->regs[R_ECX]);
+    hob = tdx_get_hob_entry(tdx);
+    _tdx_ioctl(cpu, KVM_TDX_INIT_VCPU, 0, (void *)hob->address);
 }
 
 static bool tdx_guest_get_debug(Object *obj, Error **errp)
-- 
2.17.1


