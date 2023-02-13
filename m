Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369269421C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNP-0004Ul-W7; Mon, 13 Feb 2023 04:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNM-0004Nt-K0
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:56 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNI-0002hK-99
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281432; x=1707817432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fb5Jd3+FlLcShrL7GG+M+7BkM921fep/ZX2beGWD3A8=;
 b=d6LOVPpEM9Ht4ZrRh0ebxTKFeXxugowY0/RMHYqOFN6vFNhL58wr4vOa
 DMl1QPZr7f2Z1yLvfHF5YFvAbjf4dCtMsrVIQbjJZsBupeNl2o53HJcRz
 9WHr9fQ1pZFEqvYuT6a5k5wUNCLX0GMwjcNIxcwM37BCx4LmEAtC21d+m
 ONm77cXVtmZlMdfI2W9MqlDP1oJWB5ThbT/VcffTdxHpwWcPoKDoNFnOR
 tvbHiySOkP7egDMZcT8aKHfmaLQiYytDhlietAf3a2PZq7lzeJRdICIqb
 eUf+IcQZZZUu8gExfAbLFWJTo/JNIeQty5vhl3CoP0VmV3GR8qus6uT0a w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486525"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486525"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759858"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759858"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:47 -0800
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
Subject: [RFC 13/52] cpu/core: Use generic topology helper for "help" to set
 nr_threads
Date: Mon, 13 Feb 2023 17:49:56 +0800
Message-Id: <20230213095035.158240-14-zhao1.liu@linux.intel.com>
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

The commit 0b47ec4 (cpu/core: Fix "help" of CPU core device types) sets
nr_threads with current_machine's smp.threads for "help".

This will break if current_machine has hybrid topology. Though core
device now is only used by PPC, as the general code, hybrid topology
deserves to be handled more gracefully and does not depend on whether
the specific architecture supports hybrid topology.

So use a generic topology helper to get threads info (of CPU 0) from
current_machine. For smp case, this helper returns "threads per core"
as the original smp.threads, and for hybrid case, it returns threads of
the core that CPU 0 is located.

Since that nr_threads is just to make "help" happy and it isn't used
afterwards, give it the threads of CPU 0 can work.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/cpu/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/core.c b/hw/cpu/core.c
index 987607515574..bc5ab4e01038 100644
--- a/hw/cpu/core.c
+++ b/hw/cpu/core.c
@@ -71,10 +71,12 @@ static void cpu_core_instance_init(Object *obj)
     /*
      * Only '-device something-cpu-core,help' can get us there before
      * the machine has been created. We don't care to set nr_threads
-     * in this case since it isn't used afterwards.
+     * in this case since it isn't used afterwards, so we fetch the
+     * threads of the core where the CPU 0 is located, no matter whether
+     * the topology is smp or hybrid.
      */
     if (current_machine) {
-        core->nr_threads = current_machine->smp.threads;
+        core->nr_threads = machine_topo_get_threads_by_idx(current_machine, 0);
     }
 }
 
-- 
2.34.1


