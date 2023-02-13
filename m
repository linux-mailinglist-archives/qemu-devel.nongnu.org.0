Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C726941E9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQC-0002lu-Pa; Mon, 13 Feb 2023 04:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPs-00027L-K3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:34 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPk-0002o2-SG
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281584; x=1707817584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QeD+vK4so9MELduw52hWTL0ikN2+DglvZKSq12m5+oI=;
 b=ItKY1GzAbVcbwWI7g92DyDdhCAVSEiza9SpAh4Yd4CxMmj1Sc57IaxJz
 iiQfSPYs8a0Z8ifI6xPwIZcwfIHQCSIA9hI4+hsmanzEjPgRxtPpsZWIo
 E29+2RKBS6tmIykvTRt0vn7dNB/54d9LB68etqRqMzDa3IqzhAoPlkBaE
 PSYMP4zJNpGTXLRCNsYXH5RbEgvA6tamZsLH+K+YboJ2Olacb7KFGeFZ/
 4Dx/AaVPCorGcQcUFN72Yx2MzyXkWB82o/02XlYCvesF4CckMn++9afHI
 r3KrJ5oYeLut3vgjalX7dzyXKELLwzTAod+YrX22O2Vj9nGzpl/VoN2dM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487127"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487127"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760642"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760642"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:38 -0800
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
Subject: [RFC 40/52] qapi: Introduce hybrid options
Date: Mon, 13 Feb 2023 17:50:23 +0800
Message-Id: <20230213095035.158240-41-zhao1.liu@linux.intel.com>
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

For hybrid cpu topology configuration, the original "-smp" lack of
flexibility to expand, and unables to customize different cores.

So we introduce "-hybrid" command:
-hybrid socket,sockets=n
-hybrid die,dies=n
-hybrid cluster,clusters=n
-hybrid core,cores=n,type=core_type[,threads=threads]
        [,clusterid=cluster]

Here, we first define the corresponding qapi options for these 4
topology levels: core, cluster, die and socket.

We doesn't need a thread level since thread doesn't have different
type.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 qapi/machine.json | 90 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/qapi/machine.json b/qapi/machine.json
index bd7303f34497..931c6dea9819 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1694,3 +1694,93 @@
 { 'command': 'dumpdtb',
   'data': { 'filename': 'str' },
   'if': 'CONFIG_FDT' }
+
+##
+# @HybridOptionsType:
+#
+# @socket: socket level configuration
+#
+# @die: die level configuration
+#
+# @cluster: cluster level configuration
+#
+# @core: core level configuration
+#
+# Since: 8.0
+##
+{ 'enum': 'HybridOptionsType',
+     'data': [ 'socket', 'die', 'cluster', 'core' ] }
+
+##
+# @HybridOptions:
+#
+# A discriminated record of hybrid options. (for OptsVisitor)
+#
+# Since: 8.0
+##
+{ 'union': 'HybridOptions',
+     'base': { 'type': 'HybridOptionsType' },
+     'discriminator': 'type',
+     'data': {
+       'socket': 'HybridSocketOptions',
+       'die': 'HybridDieOptions',
+       'cluster': 'HybridClusterOptions',
+       'core': 'HybridCoreOptions' }}
+
+##
+# @HybridCoreOptions:
+#
+# Configure core level topology for hybrid cpu topology.
+#
+# @cores: number of current type cores in one die.
+#
+# @coretype: type of current core.
+#
+# @threads: number of threads that current core has.
+#
+# @clusterid: cluster index in one die that current core will be
+#             inserted to.
+#
+# Since: 8.0
+##
+{ 'struct': 'HybridCoreOptions', 'data': {
+     '*cores': 'uint32',
+     '*coretype': 'str',
+     '*threads': 'uint32',
+     '*clusterid': ['uint32']} }
+
+##
+# @HybridClusterOptions:
+#
+# Configure cluster level topology for hybrid cpu topology.
+#
+# @clusters: number of clusters in one socket.
+#
+# Since: 8.0
+##
+{ 'struct': 'HybridClusterOptions', 'data': {
+            '*clusters': 'uint32' } }
+
+##
+# @HybridDieOptions:
+#
+# Configure die level topology for hybrid cpu topology.
+#
+# @dies: number of dies in one socket.
+#
+# Since: 8.0
+##
+{ 'struct': 'HybridDieOptions', 'data': {
+            '*dies': 'uint32' } }
+
+##
+# @HybridSocketOptions:
+#
+# Configure socket level topology for hybrid cpu topology.
+#
+# @sockets: number of sockets in the whole system.
+#
+# Since: 8.0
+##
+{ 'struct': 'HybridSocketOptions', 'data': {
+            '*sockets': 'uint32' } }
-- 
2.34.1


