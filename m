Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BD6941DA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:48:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQV-0003Je-0c; Mon, 13 Feb 2023 04:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQQ-00038i-Q8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:06 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQL-0002n2-Qu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281621; x=1707817621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nATIvyObSqS7z2gThE9LIe4eFSlwW3dlvnMdQdlNaW8=;
 b=VLz7FIPzzDeUtjMdGY0ix4GMPxRtefrmBE4rpZBPZJj4lngoLm8sezcM
 gFYYa7AMrZekfpO8Dcvq7XVdIpDJKFLSn8FvkeC8DzpNdAT43E+P4P2BB
 S4/ClB+KhTs1MUDqLZe3sVhe+kbteFXl2ixGxAc7kckx983c70y3AGTK6
 APfCguIarqhMND3LWbZTyMCgb0qgKhxFP6AiOM9Y0UJvWr8UXXDnDZK4O
 5Estls4VP1h5Dt4CXyf1ElVW+PmScEoxKyqW7kGl9g+rVQ9wuwGQu3Zd3
 ltQVL1l9J44JowVt1qb4MdUWAFsN/SMV4nlO2s9P0scR9GeHAcdBrHlbD Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487253"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760682"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760682"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:04 -0800
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
Subject: [RFC 47/52] hw/machine: Use opts_visitor to parse hybrid topo
Date: Mon, 13 Feb 2023 17:50:30 +0800
Message-Id: <20230213095035.158240-48-zhao1.liu@linux.intel.com>
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

Because of the "-hybrid" format, it cannot be defined as the machine
property to use input_visitor to parse as what "-smp" did.

So here we use opts_visitor to parse hybrid topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 36 +++++++++++++++++++++++++++++++++---
 include/hw/boards.h    |  4 +---
 2 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index ebd2c40396a2..9e37de04ce75 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "qapi/error.h"
+#include "qapi/opts-visitor.h"
+#include "qapi/qapi-visit-machine.h"
 
 unsigned int machine_topo_get_sockets(const MachineState *ms)
 {
@@ -571,9 +573,9 @@ static void parse_hybrid_core(MachineState *ms,
     }
 }
 
-void set_hybrid_options(MachineState *ms,
-                        const HybridOptions *config,
-                        Error **errp)
+static void set_hybrid_options(MachineState *ms,
+                               const HybridOptions *config,
+                               Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
@@ -601,6 +603,34 @@ void set_hybrid_options(MachineState *ms,
     }
 }
 
+static int parse_hybrid(void *opaque, QemuOpts *opts, Error **errp)
+{
+    g_autoptr(HybridOptions) config = NULL;
+    MachineState *ms = MACHINE(opaque);
+    Error *err = NULL;
+    Visitor *v = opts_visitor_new(opts);
+
+    visit_type_HybridOptions(v, NULL, &config, errp);
+    visit_free(v);
+    if (!config) {
+        return -1;
+    }
+
+    set_hybrid_options(ms, config, &err);
+
+    if (err) {
+        error_propagate(errp, err);
+        return -1;
+    }
+
+    return 0;
+}
+
+void parse_hybrid_opts(MachineState *ms)
+{
+    qemu_opts_foreach(qemu_find_opts("hybrid"), parse_hybrid, ms, &error_fatal);
+}
+
 void machine_free_hybrid_topology(MachineState *ms)
 {
     HybridCluster *cluster;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 0f865c21e2a8..0395990139bc 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -37,9 +37,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
 void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
 int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype);
-void set_hybrid_options(MachineState *ms,
-                        const HybridOptions *config,
-                        Error **errp);
+void parse_hybrid_opts(MachineState *ms);
 void machine_free_hybrid_topology(MachineState *ms);
 void machine_validate_hybrid_topology(MachineState *ms, Error **errp);
 void machine_consolidate_hybrid_topology(MachineState *ms);
-- 
2.34.1


