Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844626941B4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:45:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNr-0006gE-8w; Mon, 13 Feb 2023 04:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNp-0006b1-38
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:25 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNk-0002n2-H7
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281460; x=1707817460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ECi88NB/mwC8hYSVzTfpq/qX59dECqd3qGItUGfH3+s=;
 b=XBthXtS0Jt3ZktO5vevOBIpm4wp3CrHNo5NLzWAT4ppv64qMN9+f8ba8
 Re6BgQvenYLzjardzqBJv1x75U5811zuEYRr9MzJLj6gR6VTsvCqZqT/6
 UfH7VKHbnILrr6Lh+x7u71juDjIHO62B5Cx+bvCpvkxtcVjJoYeiJSWPp
 sLqd5I35ZrZvurPfaoR6j/7Zn0N9x7MZsrnMKlzEGmqhV5hmZbMV9T2LH
 urOcb6583+KVOi/pVSqlkfUBFBv8Abz/sPpwkJDLL99+729P2PI+OCVR6
 QjUGOQ6NxOV6D4f0m+9RDrSWwDNc1WJEmktSLImA22wxSV+QIfUUB5K3I Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486585"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486585"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759925"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759925"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:04 -0800
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
Subject: [RFC 17/52] softmmu/cpus: Use generic topology helper in vcpus
 initialization
Date: Mon, 13 Feb 2023 17:50:00 +0800
Message-Id: <20230213095035.158240-18-zhao1.liu@linux.intel.com>
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

As for the generic vcpu initialization, qemu_init_vcpu() should respect
the different topologies: smp or hybrid.

Use generic topology helpers to get topology information.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 softmmu/cpus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 9996e6a3b295..7892da9c82b5 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -630,8 +630,8 @@ void qemu_init_vcpu(CPUState *cpu)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
-    cpu->nr_cores = ms->smp.dies * ms->smp.clusters * ms->smp.cores;
-    cpu->nr_threads =  ms->smp.threads;
+    cpu->nr_cores = machine_topo_get_cores_per_socket(ms);
+    cpu->nr_threads = machine_topo_get_threads_by_idx(ms, cpu->cpu_index);
     cpu->stopped = true;
     cpu->random_seed = qemu_guest_random_seed_thread_part1();
 
-- 
2.34.1


