Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE26941A7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNL-0004G5-7Z; Mon, 13 Feb 2023 04:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNH-00041K-QS
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:52 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNB-0002hK-OO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281425; x=1707817425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4M0z9yNsrbhYGo+OfiupESLvaU6qlabl6B0Z2SSQh64=;
 b=hieL/rmi0EYDmziPfxbPziJ+pppWYy6wSfZMDu0pz99RxmJqX2G4P/v1
 vy7jjOsz1vzP4E37g49dEtNEFBEHbL8KcHMAEEMkTVMEyOylZrVJN4NJC
 6ZFI1PrrTv+UzIJwMU5ot3HYqB2W9xvJOhxPFH5Ik63ThJmQEYx0KyuyU
 db/9UepXo8mopitlhwFBnJjT7oNPt5URS5f7YUlGVjEXxbK3kEWFFH5qR
 D6/XvFn6bwbyWITZQyMM76/x/tK6lxtlh30azPocvVk3P3T4Mss7KyLvR
 093buBx1tRGzkE8JEPaXbaoxfKagl756ZsSQtjDe4ZWkwHHQVgvGR+4sA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486484"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486484"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759849"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759849"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:40 -0800
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
Subject: [RFC 11/52] accel/kvm: Add hybrid info when check cpu num
Date: Mon, 13 Feb 2023 17:49:54 +0800
Message-Id: <20230213095035.158240-12-zhao1.liu@linux.intel.com>
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

As the generic code, kvm should respect the different topologies: smp
or hybrid.

So improve the topology related informantion here.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 accel/kvm/kvm-all.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9b2658265561..e62df7b579d0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2361,12 +2361,13 @@ static int kvm_init(MachineState *ms)
     static const char upgrade_note[] =
         "Please upgrade to at least kernel 2.6.29 or recent kvm-kmod\n"
         "(see http://sourceforge.net/projects/kvm).\n";
+    const char *cpu_name = machine_topo_is_smp(ms) ? "SMP" : "Hybrid";
     struct {
         const char *name;
         int num;
     } num_cpus[] = {
-        { "SMP",          ms->smp.cpus },
-        { "hotpluggable", ms->smp.max_cpus },
+        { cpu_name,       machine_topo_get_cpus(ms) },
+        { "hotpluggable", machine_topo_get_max_cpus(ms) },
         { NULL, }
     }, *nc = num_cpus;
     int soft_vcpus_limit, hard_vcpus_limit;
-- 
2.34.1


