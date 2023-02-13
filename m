Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD36941A8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVN2-0003i1-8a; Mon, 13 Feb 2023 04:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVN0-0003bT-HS
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:34 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMt-0002cM-Fs
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281407; x=1707817407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ws81cKhwe62SjXBEKPyRmLjzxrZ4g5Wn8Z243v82XX0=;
 b=VT9TLDLiItlefnsvj3S1V7HnXfkBigvV9WU14VyUEu3etutRdkupPKGL
 evxnXN32Ysd7aFI8CMfxf+mvHtAiXrS2mDBrKB9wgFEtcTFClIFZqlo+1
 DOzeuR68PdyfVb+jifs/YUPmBJ1/loUJwF0y89/7lmUdnSxWo2u9Ccz0O
 k2YL+5QGlxZ1eKEAcmZOBSTbaQJF2Rx85PYseIEtJytA7rSZ+6tUfdwvJ
 Vy49NUilOzprGCovI5PxmA8TXVSW775UuBshHg1M4eOx+OA4BWBMLBbDs
 M0uR41cgGk2rcGZfhY1LSP96nC7Uh/W5Z/6Bl2VgDIVzBuyA6KAtg34sV A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486402"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486402"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759817"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759817"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:21 -0800
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
Subject: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
Date: Mon, 13 Feb 2023 17:49:49 +0800
Message-Id: <20230213095035.158240-7-zhao1.liu@linux.intel.com>
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

For smp systems, the parts in one topology level are the same. But now
there are more and more systems with hybrid architectures. Different
parts of the same topology level may have differences. For example,
Intel's Alder Lake series CPU has two types of cores, so the CPU
topology is no longer symmetrical.

The hybrid topology is compatible with the smp topology type, that is,
different parts on the same level of the hybrid topology can set to be
the same, but the hybrid topology will introduce more complexity (need
to allocate more memory, organized with array or linked-list), so the
original smp topology support is retained while introducing the hybrid
topology, and the hybrid topology is only built when the hybrid is
explicitly required.

Therefore, we introduce the definition support of hybrid cpu topology
here. At the same time, in order to unify with the original smp, we
introduce a new cpu topology structure that can support smp topology
or hybrid topology. This structure will replace the CpuTopology type (in
include/hw/boards.h) used by MachineState.smp.

As for now, we only support two hybrid topology levels: core and
cluster.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 MAINTAINERS                   |   1 +
 include/hw/cpu/cpu-topology.h | 117 ++++++++++++++++++++++++++++++++++
 qapi/machine.json             |  12 ++++
 3 files changed, 130 insertions(+)
 create mode 100644 include/hw/cpu/cpu-topology.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 58794885ced3..918a9418d98e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1742,6 +1742,7 @@ F: qapi/machine-target.json
 F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
+F: include/hw/cpu/cpu-topology.h
 F: include/sysemu/numa.h
 F: tests/unit/test-smp-parse.c
 T: git https://gitlab.com/ehabkost/qemu.git machine-next
diff --git a/include/hw/cpu/cpu-topology.h b/include/hw/cpu/cpu-topology.h
new file mode 100644
index 000000000000..8268ea3a8569
--- /dev/null
+++ b/include/hw/cpu/cpu-topology.h
@@ -0,0 +1,117 @@
+/*
+ * CPU topology defination for Machine core
+ *
+ * Copyright (c) 2023 Intel Corporation
+ * Author: Zhao Liu <zhao1.liu@intel.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef CPU_TOPOLOGY_H
+#define CPU_TOPOLOGY_H
+
+#include "qemu/queue.h"
+
+/**
+ * SmpCpuTopology - smp cpu topology defination.
+ *
+ * For smp system, the parts in one topology level are the same.
+ *
+ * @sockets: the number of sockets on the machine
+ * @dies: the number of dies in one socket
+ * @clusters: the number of clusters in one die
+ * @cores: the number of cores in one cluster
+ * @threads: the number of threads in one core
+ */
+typedef struct SmpCpuTopology {
+    unsigned int sockets;
+    unsigned int dies;
+    unsigned int clusters;
+    unsigned int cores;
+    unsigned int threads;
+} SmpCpuTopology;
+
+/**
+ * HybridCore - hybrid core topology defination:
+ * @threads: the number of threads in one core.
+ */
+typedef struct HybridCore {
+    unsigned int threads;
+} HybridCore;
+
+/**
+ * HybridCluster - hybrid cluster topology defination:
+ * @cores: the number of cores in current cluster.
+ * @core_list: the array includes all the cores that belong to current
+ *             cluster.
+ */
+typedef struct HybridCluster {
+    unsigned int cores;
+    HybridCore *core_list;
+} HybridCluster;
+
+/**
+ * HybridCpuTopology - hybrid cpu topology defination.
+ *
+ * At present we only support two heterogeneous topology levels: core
+ * and cluster. For heterogeneous levels, we need additional structs
+ * to define their custom internal topology. So here we defines
+ * symmetric topology levels, and use a list to point to heterogeneous
+ * levels.
+ *
+ * @sockets: the number of sockets on the machine. All sockets are the
+ *           same.
+ * @dies: the number of dies in one socket. All dies are the same.
+ * @clusters: the number of clusters in one die. Cluster may be
+ *            different. This field indicates the length of
+ *            cluster_list.
+ * @cluster_list: the array includes all the clusters in one die.
+ */
+typedef struct HybridCpuTopology {
+    unsigned int sockets;
+    unsigned int dies;
+    unsigned int clusters;
+    HybridCluster *cluster_list;
+} HybridCpuTopology;
+
+/**
+ * GeneralCpuTopology - General cpu topology defination.
+ *
+ * It supports one of two topologies: smp topology or hybrid topology.
+ *
+ * @cpus: the number of present logical processors on the machine
+ * @max_cpus: the maximum number of logical processors on the machine
+ * @topo_type: the topology type of the machine and this decides which
+ *             member of the union to visit: smp or hybrid.
+ * @smp: the smp cpu topology informantion. Only valid when topo_type is
+ *       CPU_TOPO_TYPE_SMP.
+ * @hybrid: the hybrid cpu topology informantion. Only valid when
+ *          topo_type is CPU_TOPO_TYPE_HYBRID.
+ */
+typedef struct GeneralCpuTopology {
+    unsigned int cpus;
+    unsigned int max_cpus;
+    CpuTopoType topo_type;
+    union {
+        SmpCpuTopology smp;
+        HybridCpuTopology hybrid;
+    };
+} GeneralCpuTopology; /*
+                       * TODO: This name is temporary, just to distinguish it
+                       * from the CpuTopology in boards.h. When CpuTopology in
+                       * boards.h is merged here, it will be uniformly named as
+                       * CpuTopology.
+                       */
+
+#endif /* CPU_TOPOLOGY_H */
diff --git a/qapi/machine.json b/qapi/machine.json
index b9228a5e4616..bd7303f34497 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -36,6 +36,18 @@
              'sh4eb', 'sparc', 'sparc64', 'tricore',
              'x86_64', 'xtensa', 'xtensaeb' ] }
 
+##
+# @CpuTopoType:
+#
+# An enumeration of cpu topology type
+# TODO: Expose topology type in query-cpus-fast
+#
+# Since: 8.0
+##
+{ 'enum': 'CpuTopoType',
+  'prefix': 'CPU_TOPO_TYPE',
+  'data': [ 'smp', 'hybrid' ] }
+
 ##
 # @CpuS390State:
 #
-- 
2.34.1


