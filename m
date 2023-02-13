Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78C6941FC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVPQ-0001Hp-VM; Mon, 13 Feb 2023 04:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPK-0001FM-K2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:59 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPE-0002n2-Fg
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281552; x=1707817552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rb4nLkPd92MUqqvFqFsZKp29ST6hY03+nET8aUQ+i6E=;
 b=eVvqB4Q/LinkYQ0A1srIfWfoaRKmeGLACof/074HkBwDV3UaRrJihx2b
 ayoSbnC8D0SvnbXN0W/KYkZb9kUUUY6lD/jyXjVLj/kPBXjzQrqVbyFFR
 rbCclbWJ3N5vafREE1jQpuw24FoWvXyE8iEtIOL5E4kwxxum43UK5ubNV
 bi834zX/bkJvXrh471jAoIo1GOGO5E3BDlRp7yUNJOu8vIjsFQN6THKDU
 hyre/fovpGCDbctWjGrdKVzMDAIKGlAcI0oMFSSbNb/uzfSde2FNDDHd3
 kKXZ3XEi8iAjfulrGpQE1HnOzOIB4NJXbDv9CSmWa3uFPGyOaOAD8GRXh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486983"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486983"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760615"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760615"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:19 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 35/52] i386: Support APIC ID topology for hybrid CPU topology
Date: Mon, 13 Feb 2023 17:50:18 +0800
Message-Id: <20230213095035.158240-36-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

X86ApicidTopoInfo is used to caculate offsets of topology levels for
APIC ID.

For hybrid CPU topology, X86ApicidTopoInfo should get the maximum
possible number of corresponding topology structures in each topology
level (currently, only for core and thread level).

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 9ee0fcb9a460..1c071f8120cb 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -70,10 +70,37 @@ inline void init_apicid_topo_info(X86ApicidTopoInfo *apicid_topo,
 {
     MachineState *ms = MACHINE(x86ms);
 
+    /*
+     * At present, the packages and dies in the hybrid CPU topology are the
+     * same, so the numbers of dies in one package and the numbers of modules
+     * in the dies are also the same.
+     */
     apicid_topo->max_dies = machine_topo_get_dies(ms);
     apicid_topo->max_modules = machine_topo_get_clusters(ms);
-    apicid_topo->max_cores = machine_topo_get_smp_cores(ms);
-    apicid_topo->max_threads = machine_topo_get_smp_threads(ms);
+
+    if (machine_topo_is_smp(ms)) {
+        apicid_topo->max_cores = machine_topo_get_smp_cores(ms);
+        apicid_topo->max_threads = machine_topo_get_smp_threads(ms);
+    } else {
+        int max_cores = 0;
+        int max_threads = 0;
+        int nr_clusters = machine_topo_get_clusters(ms);
+        int nr_cores, nr_threads;
+
+        for (int i = 0; i < nr_clusters; i++) {
+            nr_cores = machine_topo_get_cores(ms, i);
+            max_cores = max_cores > nr_cores ? max_cores : nr_cores;
+
+            for (int j = 0; j < nr_cores; j++) {
+                nr_threads = machine_topo_get_threads(ms, i, j);
+                max_threads = max_threads > nr_threads ?
+                              max_threads : nr_threads;
+            }
+        }
+
+        apicid_topo->max_cores = max_cores;
+        apicid_topo->max_threads = max_threads;
+    }
 }
 
 /*
-- 
2.34.1


