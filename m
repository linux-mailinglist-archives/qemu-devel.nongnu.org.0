Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1B6941A9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNJ-00048G-P6; Mon, 13 Feb 2023 04:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVND-0003uz-6s
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:48 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVN7-0002cM-5N
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281421; x=1707817421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JL9RDMAGfXlkn3TxhWlBENp4siXFvnya68ifaAVkhsY=;
 b=KG9bRQf384hZ39tobD3wvaQZDzF+vB0W+J2d7w4bYjYzsyuzdatJBRvx
 W+xMAmUb33DnzV8fAlMd1ohCAJfeRLYZBr77z/sM4s07YtQE35LtUbeFF
 I88G+4RWjFSmzBIvGDlO8AkUy7wgZGUBMSLDo56iW+kQK1IA3NWv3GRSw
 TcX78hjqmUtLM0zEDD/J/dR9thRjCFcUjxyGcQkqaffytpRfixTvlP5xt
 WJXxpgLwYwXRuU98ibPQvLmv60VY0EOBi68GEXZ0zNuN5dZMUfl1l9zqJ
 sElxq9kgLwyO3RGZdJn//wpDaCSA5gLU6BJWfRu4OLXE0Yj6/Vs5elH0X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486470"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486470"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759842"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759842"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:37 -0800
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
Subject: [RFC 10/52] machine: Replace MachineState.topo.smp access with
 topology helpers
Date: Mon, 13 Feb 2023 17:49:53 +0800
Message-Id: <20230213095035.158240-11-zhao1.liu@linux.intel.com>
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

In cpu_hierarchy_to_string(), the access to MachineState.topo.smp can
be replaced by topology helpers.

But because machine_parse_smp_config() is used to adjust
MachineState.topo.smp, there's no need to replace with helpers.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index e0ec07b53d42..cdbe65ffd9fd 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -185,18 +185,20 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     GString *s = g_string_new(NULL);
 
-    g_string_append_printf(s, "sockets (%u)", ms->topo.smp.sockets);
+    g_string_append_printf(s, "sockets (%u)", machine_topo_get_sockets(ms));
 
     if (mc->smp_props.dies_supported) {
-        g_string_append_printf(s, " * dies (%u)", ms->topo.smp.dies);
+        g_string_append_printf(s, " * dies (%u)", machine_topo_get_dies(ms));
     }
 
     if (mc->smp_props.clusters_supported) {
-        g_string_append_printf(s, " * clusters (%u)", ms->topo.smp.clusters);
+        g_string_append_printf(s, " * clusters (%u)",
+                               machine_topo_get_clusters(ms));
     }
 
-    g_string_append_printf(s, " * cores (%u)", ms->topo.smp.cores);
-    g_string_append_printf(s, " * threads (%u)", ms->topo.smp.threads);
+    g_string_append_printf(s, " * cores (%u)", machine_topo_get_smp_cores(ms));
+    g_string_append_printf(s, " * threads (%u)",
+                           machine_topo_get_smp_threads(ms));
 
     return g_string_free(s, false);
 }
-- 
2.34.1


