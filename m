Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927F4DC8C3
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:28:11 +0100 (CET)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUr6o-0006LY-Gc
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:28:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgR-0000TA-2b
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:00:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:25019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nUqgK-0004LN-2m
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647525648; x=1679061648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M4VLp7VWWFfDL79yGUvCpml6hW/Tz/hJK8YH3y2de/o=;
 b=iGOPuttDqRcwK1tZ8bxjPY77GFhQuRG4ikWEL4XGkt3gdFlaFvYr15hn
 fos4WWIjJ0s11x6U+EKQpxPQlX8DNvDWdg3Enyfkyxp09V8Cv62vv/lAA
 MD3j0X+q7GSKmS2Ikpp/G7rLq4U0bQXOIkZICfvlzfGmz7qe209z4UDq3
 cGfwd/zETfTup+/dCt2TNxP1UY9NkmndOUaVVj+aUXO5g4okBj66zmR2y
 3+2I49fAwh5/HhHIvKqQ85izMev1OI8nf6Xi2cVEeiDu0E9F41wOe6HdK
 wfmf9p1k/pma39hN3OnR1e8oMNSXoQKUOn/blFgFA17fxGri9N9FwXJiu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="236816831"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="236816831"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 07:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="541378170"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 07:00:12 -0700
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
Subject: [RFC PATCH v3 13/36] i386/tdx: Wire CPU features up with attributes
 of TD guest
Date: Thu, 17 Mar 2022 21:58:50 +0800
Message-Id: <20220317135913.2166202-14-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220317135913.2166202-1-xiaoyao.li@intel.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
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
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
 Connor Kuehl <ckuehl@redhat.com>, seanjc@google.com, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, erdemaktas@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For QEMU VMs, PKS is configured via CPUID_7_0_ECX_PKS and PMU is
configured by x86cpu->enable_pmu. Reuse the existing configuration
interface for TDX VMs.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/tdx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index 409526765304..de4146025995 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -22,6 +22,8 @@
 #include "tdx.h"
 
 #define TDX_TD_ATTRIBUTES_SEPT_VE_DISABLE   BIT_ULL(28)
+#define TDX_TD_ATTRIBUTES_PKS               BIT_ULL(30)
+#define TDX_TD_ATTRIBUTES_PERFMON           BIT_ULL(63)
 
 static TdxGuest *tdx_guest;
 
@@ -152,6 +154,15 @@ void tdx_get_supported_cpuid(uint32_t function, uint32_t index, int reg,
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
     struct {
@@ -178,6 +189,8 @@ int tdx_pre_create_vcpu(CPUState *cpu)
         goto out;
     }
 
+    setup_td_guest_attributes(x86cpu);
+
     memset(&cpuid_data, 0, sizeof(cpuid_data));
     cpuid_data.cpuid.nent = kvm_x86_arch_cpuid(env, cpuid_data.entries, 0);
 
-- 
2.27.0


