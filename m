Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698FC524367
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 05:28:29 +0200 (CEST)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nozV6-0008VN-4n
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 23:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozM9-0002pH-DE
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:19:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:56096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nozM7-0002s1-KM
 for qemu-devel@nongnu.org; Wed, 11 May 2022 23:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652325551; x=1683861551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9l3R6Y7ShNVLtRbyZK/8UZ/kBCc9sedF2FufXnx43E4=;
 b=f1VpNKGmeng7oSZELkYpmh+6wImuT9L9p4fYf6KfOlfbMm6kfjWfQI6q
 S4owt+P40winrOZqCQQ3xtd0E18ITm4SiYprESOpFGba0J7lfjz2rQzMf
 iQHquHl0Zj/KRZGynIf4kJp3XCA3D4sMSLhp75rU3z7Hp8iyKGS4QkKDc
 JJNY4/uSh6eHErhmGeVAr2LzkBOfaCvD7DyVQhRWqLYcuJr7UqqVqiZhz
 MtD+Vno0NZ59j+AfJOySw8vKM6sr+IJrFMt6eODAOPGDUhfGExOlnWSLP
 dtJJIFuz8PXemqyO0w8W5sKx2OoTyFhA1GcTApSLL20FOp33Vt8oEadiS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="249770407"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="249770407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 20:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; d="scan'208";a="594455708"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2022 20:19:02 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
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
Subject: [RFC PATCH v4 12/36] i386/tdx: Wire CPU features up with attributes
 of TD guest
Date: Thu, 12 May 2022 11:17:39 +0800
Message-Id: <20220512031803.3315890-13-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512031803.3315890-1-xiaoyao.li@intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

For QEMU VMs, PKS is configured via CPUID_7_0_ECX_PKS and PMU is
configured by x86cpu->enable_pmu. Reuse the existing configuration
interface for TDX VMs.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/tdx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 3472b59c2dbb..e9c6e6fb396c 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -31,6 +31,9 @@
                                      (1ULL << KVM_FEATURE_PV_SCHED_YIELD) | \
                                      (1ULL << KVM_FEATURE_MSI_EXT_DEST_ID))
 
+#define TDX_TD_ATTRIBUTES_PKS               BIT_ULL(30)
+#define TDX_TD_ATTRIBUTES_PERFMON           BIT_ULL(63)
+
 static TdxGuest *tdx_guest;
 
 /* It's valid after kvm_confidential_guest_init()->kvm_tdx_init() */
@@ -166,6 +169,15 @@ void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
     }
 }
 
+static void setup_td_guest_attributes(X86CPU *x86cpu)
+{
+    CPUX86State *env = &x86cpu->env;
+
+    tdx_guest->attributes |= (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKS) ?
+                             TDX_TD_ATTRIBUTES_PKS : 0;
+    tdx_guest->attributes |= x86cpu->enable_pmu ? TDX_TD_ATTRIBUTES_PERFMON : 0;
+}
+
 int tdx_pre_create_vcpu(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -179,6 +191,8 @@ int tdx_pre_create_vcpu(CPUState *cpu)
         goto out;
     }
 
+    setup_td_guest_attributes(x86cpu);
+
     memset(&init_vm, 0, sizeof(init_vm));
     init_vm.cpuid.nent = kvm_x86_arch_cpuid(env, init_vm.entries, 0);
 
-- 
2.27.0


