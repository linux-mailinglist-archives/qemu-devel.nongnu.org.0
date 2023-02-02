Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FB687956
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNW8G-0006j9-I7; Thu, 02 Feb 2023 04:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW8A-0006gV-Mp
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:46 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW88-0006Of-Tk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675331024; x=1706867024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LgRAACpjHVh/wf1L8ixrV6orEmqM8YnGOdot9oBTw/0=;
 b=m8AQc6Sx6DaNDJT146Mw31oMYVt2ufrOiE1SMgn41CbMFKLjjyy2uG1P
 rZdgLVl7ouFV9ah6tfHofjeOP0K/z1955I6Z4mUiuXK4E8dtNgk11W0kQ
 ODm6W6Usij7fkP7Fz1nU1G8YrwnqFDmRBQy90A8AmmAOSxJ55f65QxfWl
 hLvjP07reSZ3MAo6hucgQ26TsMolb3E72ziK9UMTRbqARl+ESQ7wpG1zm
 QZWjj7Y6bkxphQsKI/Q+NQWKveawK2W4e5RUjkuRBN5V7GFjc+zSOeLHv
 f0hE+4DDvvSJtkpl3w+O8TuBuppD7aVD/aCGVDo+/k6TtVSq6jBbZ3ukD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316402109"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="316402109"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807909474"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="807909474"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 01:42:30 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>
Subject: [PATCH 13/18] hw/i386/pc: Support smp.clusters for x86 PC machine
Date: Thu,  2 Feb 2023 17:49:24 +0800
Message-Id: <20230202094929.343799-14-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202094929.343799-1-zhao1.liu@linux.intel.com>
References: <20230202094929.343799-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhuocheng Ding <zhuocheng.ding@intel.com>

As module-level topology support is added to X86CPU, now we can enable
the support for the cluster parameter on PC machines. With this support,
we can define a 5-level x86 CPU topology with "-smp":

-smp cpus=*,maxcpus=*,sockets=*,dies=*,clusters=*,cores=*,threads=*.

Additionally, add the 5-level topology example in description of "-smp".

Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/pc.c    |  1 +
 qemu-options.hx | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969aa..c329df56ebd2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1929,6 +1929,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
+    mc->smp_props.clusters_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/qemu-options.hx b/qemu-options.hx
index d59d19704bc5..3700e1aa97ea 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -312,14 +312,14 @@ SRST
         -smp 8,sockets=2,cores=2,threads=2,maxcpus=8
 
     The following sub-option defines a CPU topology hierarchy (2 sockets
-    totally on the machine, 2 dies per socket, 2 cores per die, 2 threads
-    per core) for PC machines which support sockets/dies/cores/threads.
-    Some members of the option can be omitted but their values will be
-    automatically computed:
+    totally on the machine, 2 dies per socket, 2 clusters per die, 2 cores per
+    cluster, 2 threads per core) for PC machines which support sockets/dies
+    /clusters/cores/threads. Some members of the option can be omitted but
+    their values will be automatically computed:
 
     ::
 
-        -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
+        -smp 32,sockets=2,dies=2,clusters=2,cores=2,threads=2,maxcpus=32
 
     The following sub-option defines a CPU topology hierarchy (2 sockets
     totally on the machine, 2 clusters per socket, 2 cores per cluster,
-- 
2.34.1


