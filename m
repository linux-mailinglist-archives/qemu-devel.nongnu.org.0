Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366EB6941B7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVMm-0003UF-UW; Mon, 13 Feb 2023 04:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMl-0003Tu-Sd
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:19 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMh-0002Wd-8m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281395; x=1707817395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/E7k/NTHks3kjh661e475eJSmR+9SbGlLKePVDzqsFE=;
 b=VV3IxpXBLRNDTlPLF1N6OFNtgYCihzCj6P7m6ih7hl7nmhN7TYCmeAUs
 ypK1jyiw5JPAY7BGe/uemxHkGjFathTB6zZ4RpPsTl2Qls9ECmcHCUV8D
 tCKc8FjSvjzKC/Fe/sUE6lg+gXts967TUSgUbDJDjfE1Qa+TXVaIuSo05
 +OKBPqwC3uUu8ja5Q7dv3aToseHdDm4WnBwysmt3/IpL02gVKQwPxJsQ7
 ywkFC/kNUTjcj2/zVTBLXj87V55KQdKTXtHrUJiAn28kr3VLAfDlh5XTY
 YxWL97qWnm1SANYVoHAlXWgQL4Sq78qtvxsj2NXgKNW+Fukm8jNPHY+zw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486333"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486333"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759800"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759800"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:10 -0800
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
 Zhao Liu <zhao1.liu@intel.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [RFC 03/52] hw/smbios: Fix core count in type4
Date: Mon, 13 Feb 2023 17:49:46 +0800
Message-Id: <20230213095035.158240-4-zhao1.liu@linux.intel.com>
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

From SMBIOS 3.0 specification, core count field means:

Core Count is the number of cores detected by the BIOS for this
processor socket. [1]

Before 003f230 (machine: Tweak the order of topology members in struct
CpuTopology), MachineState.smp.cores means "the number of cores in one
package", and it's correct to use smp.cores for core count.

But 003f230 changes the smp.cores' meaning to "the number of cores in
one die" and doesn't change the original smp.cores' use in smbios as
well, which makes core count in type4 go wrong.

Fix this issue with the correct "cores per socket" caculation.

[1] SMBIOS 3.0.0, section 7.5.6, Processor Information - Core Count

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Fixes: 003f230 (machine: Tweak the order of topology members in struct CpuTopology)
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/smbios/smbios.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 5e6d4584edbb..cd4aa331cb3e 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -714,6 +714,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     char sock_str[128];
     size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
     unsigned cpus_per_socket = ms->smp.max_cpus / ms->smp.sockets;
+    unsigned cores_per_socket = cpus_per_socket / ms->smp.threads;
 
     if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
         tbl_len = SMBIOS_TYPE_4_LEN_V30;
@@ -748,10 +749,10 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
     SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
 
-    t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
+    t->core_count = (cores_per_socket > 255) ? 0xFF : cores_per_socket;
     t->core_enabled = t->core_count;
 
-    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
+    t->core_count2 = t->core_enabled2 = cpu_to_le16(cores_per_socket);
 
     t->thread_count = (cpus_per_socket > 255) ? 0xFF : cpus_per_socket;
     t->thread_count2 = cpu_to_le16(cpus_per_socket);
-- 
2.34.1


