Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392ED5878C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:11:23 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oImzp-00058e-0B
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdo-0004kq-LF
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:8273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1oImdm-0005iP-Vj
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659426514; x=1690962514;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V6iMxGM1nBAlYnFHJg6pN49HUYwr2bEgyN6VTOxhwDE=;
 b=l5PJS2fCXMbMPu3+Q45+Ohhg3Y0SuIvuBe0NaTjJRkZ3gpHtMQ51KIO0
 CLLDp/J3ds3l47ux0ztOOK3FuVpnc4inTChE87dPgDFVidrNucU+TC3ZN
 y0YfzNR5hfGGWmO1CYqps0gGdn8YgBeEOMtw/yE6qebD+VnzO6WRoE1nO
 5n7PRF/SyHxFGflgUQyhWOPpUzw7LPQRkRJX2pOWSawnSw/ia41p1YQ9Y
 /EgCACo0O1PdK4ZRKx1SDnPt4Ol8f6khVnhGvXBeSunuu8L5eb+obhw5d
 yPGe2WdmhbtDPnut7aQsZW8L2Jr4eMfviC+VzUg8zlnChkpsfxgVgB+9U A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="286908512"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="286908512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 00:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="630603911"
Received: from lxy-dell.sh.intel.com ([10.239.48.38])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 00:48:30 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
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
Subject: [PATCH v1 09/40] i386/tdx: Update tdx_fixed0/1 bits by
 tdx_caps.cpuid_config[]
Date: Tue,  2 Aug 2022 15:47:19 +0800
Message-Id: <20220802074750.2581308-10-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220802074750.2581308-1-xiaoyao.li@intel.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tdx_cpuid_lookup[].tdx_fixed0/1 is the QEMU maintained data which
reflects TDX restrictions regrading how some CPUID is virtualized by
TDX. It's retrieved from TDX spec. However, TDX may change some fixed
fields to configurable in the future. Update
tdx_cpuid.lookup[].tdx_fixed0/1 fields by removing the bits that
reported from TDX module as configurable. This can adapt with the
updated TDX (module) automatically.

Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 target/i386/kvm/tdx.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
index e3e9a424512e..d12b03fa05c9 100644
--- a/target/i386/kvm/tdx.c
+++ b/target/i386/kvm/tdx.c
@@ -369,6 +369,34 @@ static void get_tdx_capabilities(void)
     tdx_caps = caps;
 }
 
+static void update_tdx_cpuid_lookup_by_tdx_caps(void)
+{
+    KvmTdxCpuidLookup *entry;
+    FeatureWordInfo *fi;
+    uint32_t config;
+    FeatureWord w;
+
+    /*
+     * Patch tdx_fixed0/1 by tdx_caps that what TDX module reports as
+     * configurable is not fixed.
+     */
+    for (w = 0; w < FEATURE_WORDS; w++) {
+        fi = &feature_word_info[w];
+        entry = &tdx_cpuid_lookup[w];
+
+        if (fi->type != CPUID_FEATURE_WORD) {
+            continue;
+        }
+
+        config = tdx_cap_cpuid_config(fi->cpuid.eax,
+                                      fi->cpuid.needs_ecx ? fi->cpuid.ecx : ~0u,
+                                      fi->cpuid.reg);
+
+        entry->tdx_fixed0 &= ~config;
+        entry->tdx_fixed1 &= ~config;
+    }
+}
+
 int tdx_kvm_init(MachineState *ms, Error **errp)
 {
     TdxGuest *tdx = (TdxGuest *)object_dynamic_cast(OBJECT(ms->cgs),
@@ -378,6 +406,8 @@ int tdx_kvm_init(MachineState *ms, Error **errp)
         get_tdx_capabilities();
     }
 
+    update_tdx_cpuid_lookup_by_tdx_caps();
+
     tdx_guest = tdx;
 
     return 0;
-- 
2.27.0


