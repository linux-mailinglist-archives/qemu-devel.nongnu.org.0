Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72D694216
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQE-0002tF-Q4; Mon, 13 Feb 2023 04:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQ0-0002Sw-U7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:41 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPu-0002kj-VI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281595; x=1707817595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EW4ozs9YEtn6LvrPAI8KlianOH7ba6a4pj9oEIwqWR8=;
 b=mcKrdCrxzPkfDTZxlPynHWowd8ZsIhAp1IlHar+GvBAwWKDp9x92F+HF
 1qUONWKELOMvGmOomXVOE14bOrQJRWER7oNTXrNNs4OFNkY2jq+MpZP18
 PT3bD/8WSsuTTGr8cEVFEjrZ35W/nro4oFEE7XTpQF6w4jlsk2OoKylkV
 6ffPJBBbYdmS0xcX0FEanbYbGGHk4b3PGL/9C42l7JKSZMABhSQlrW8Yk
 KaFfTDD+KAnwTj/jD1mKhIRnLTPn4Jh0n6FE/wmuE/e4HkTejfjLMZeLk
 E9f8tKOAuUYPr/YspTzCEIvlJFya5WPcL2uLTZKeDpg+XnuaV5Mlwg128 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487157"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487157"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760651"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760651"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:45 -0800
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
Subject: [RFC 42/52] hw/machine: Add hybrid_supported in generic topo
 properties
Date: Mon, 13 Feb 2023 17:50:25 +0800
Message-Id: <20230213095035.158240-43-zhao1.liu@linux.intel.com>
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

Since hybrid cpu topology configuration can benefit not only x86, but
also other architectures/platforms that have supported (in real
machines) or will support hybrid CPU topology, "-hybrid" can be generic.

So add the generic topology property to configure if support hybrid
cpu topology for architectures/platforms in SmpCompatProps.

Also rename SmpCompatProps to TopoCompatProps to make this structure
more generic for both smp topology and hybrid topology.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/hw/boards.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 34ec035b5c9f..17be3485e823 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -127,19 +127,26 @@ typedef struct {
 } CPUArchIdList;
 
 /**
- * SMPCompatProps:
- * @prefer_sockets - whether sockets are preferred over cores in smp parsing
+ * TopoCompatProps:
+ * @hybrid_support - whether hybrid cpu topology are supported by machine.
+ *                   Note that hybrid cpu topology requires to specify the
+ *                   topology of each core so that there will no longer be
+ *                   a default core topology, thus prefer_sockets won't work
+ *                   when hybrid_support is enabled.
+ * @prefer_sockets - whether sockets are preferred over cores in smp parsing.
+ *                   Not work when hybrid_support is enabled.
  * @dies_supported - whether dies are supported by the machine
  * @clusters_supported - whether clusters are supported by the machine
  * @has_clusters - whether clusters are explicitly specified in the user
  *                 provided SMP configuration
  */
 typedef struct {
+    bool hybrid_supported;
     bool prefer_sockets;
     bool dies_supported;
     bool clusters_supported;
     bool has_clusters;
-} SMPCompatProps;
+} TopoCompatProps;
 
 /**
  * MachineClass:
@@ -281,7 +288,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
-    SMPCompatProps smp_props;
+    TopoCompatProps smp_props;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
-- 
2.34.1


