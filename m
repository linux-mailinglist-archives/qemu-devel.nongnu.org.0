Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1036941D4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:47:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVPx-0001OW-15; Mon, 13 Feb 2023 04:46:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPE-00012C-SY
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:55 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVP8-0002kj-Jt
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281546; x=1707817546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wJmtxpZpLXGOL/cEIvq2h8zvoaqtYEvniIV8AjNAjCg=;
 b=KX/afVNZX1zAho9ZH9G1Izz0EAx/xZzCVTpKaEoU2eV22SZrWA+gxRQs
 ty373Fm2pykP67XzaTLNf+C4S4F/DtFn4eRE4M1bqBBSjCgxPqYgJIRCQ
 ZsM3LZCRMLH/EELHdsWUhFLzL66ly+3+W0mcGf4Q+w7fgA4XzY2mSDnA8
 sq/qCZRSsJnanhEofaZz4oupvIfrfOrMhswoV438FgWnhTvP+RNk/oArg
 ypjjGPmNU87M8EDu0nQqFAeLbTJnhcGSeh9x7AxGkuq/wuTszIdWEOpsG
 WlLijTSSshcYrMwwqralPixOdq/cDVUxxD4D0/EvuOoq+zQHlu1ogI4X/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486922"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486922"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760608"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760608"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:11 -0800
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
Subject: [RFC 33/52] i386: Rename init_topo_info() to init_apic_topo_info()
Date: Mon, 13 Feb 2023 17:50:16 +0800
Message-Id: <20230213095035.158240-34-zhao1.liu@linux.intel.com>
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

Rename init_topo_info() to init_apic_topo_info() to adapt
X86ApicidTopoInfo.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c         | 12 ++++++------
 include/hw/i386/x86.h |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index f20b0c3a5f12..a13c931df062 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -65,8 +65,8 @@
 /* Physical Address of PVH entry point read from kernel ELF NOTE */
 static size_t pvh_start_addr;
 
-inline void init_topo_info(X86ApicidTopoInfo *topo_info,
-                           const X86MachineState *x86ms)
+inline void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
+                                  const X86MachineState *x86ms)
 {
     MachineState *ms = MACHINE(x86ms);
 
@@ -89,7 +89,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 {
     X86ApicidTopoInfo topo_info;
 
-    init_topo_info(&topo_info, x86ms);
+    init_apicid_topo_info(&topo_info, x86ms);
 
     return x86_apicid_from_cpu_idx(&topo_info, cpu_index);
 }
@@ -301,7 +301,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         }
     }
 
-    init_topo_info(&topo_info, x86ms);
+    init_apicid_topo_info(&topo_info, x86ms);
 
     /*
      * If APIC ID is not set,
@@ -483,7 +483,7 @@ int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
    X86MachineState *x86ms = X86_MACHINE(ms);
    X86ApicidTopoInfo topo_info;
 
-   init_topo_info(&topo_info, x86ms);
+   init_apicid_topo_info(&topo_info, x86ms);
 
    assert(idx < ms->possible_cpus->len);
    x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
@@ -511,7 +511,7 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
                                   sizeof(CPUArchId) * max_cpus);
     ms->possible_cpus->len = max_cpus;
 
-    init_topo_info(&topo_info, x86ms);
+    init_apicid_topo_info(&topo_info, x86ms);
 
     for (i = 0; i < ms->possible_cpus->len; i++) {
         X86CPUTopoIDs topo_ids;
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index ac6f1e4a74af..d84f7717900c 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -98,7 +98,8 @@ struct X86MachineState {
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
-void init_topo_info(X86ApicidTopoInfo *topo_info, const X86MachineState *x86ms);
+void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
+                           const X86MachineState *x86ms);
 
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);
-- 
2.34.1


