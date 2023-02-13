Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5193694197
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVMm-0003Tp-4h; Mon, 13 Feb 2023 04:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMj-0003TH-Mu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:17 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMe-0002YE-MQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281392; x=1707817392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8kkJWY4G1XWoH363of9NnicYQ9neuibkxPMg03d5LqQ=;
 b=CgQir2InGjk8embtn40mLvUBaZR8G7tVPQG2RwY/dSr/TQZJdUPNuHfM
 YQXLLlLoDWvEjo7D7O0ImBPStlZvTYq6Psu6OMg+CSWVkzBAPh8LiewX0
 nc+5NulIEfqgFnh/A02NznJGb8k7BMDD7wlSRPj5TrG1VfANn7YKcS/+n
 W3mIZmY0jXuaDVIzAvj2e3ENC+4rWLF9CIdM0q4/yl8PnXU94ene80Lcz
 ToKYa5ZOeXr+ybHV1zbvshpmKbnx/GfBgsSst7ngCq7h/OXf5/D8c5jgM
 EKS8arkVzX1KjnYyyVthZu4mDiAAkV8RuEdyvGZIGoz3S3WYmyHihYOcM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486318"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486318"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759794"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759794"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:06 -0800
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
Subject: [RFC 02/52] hw/smbios: Fix thread count in type4
Date: Mon, 13 Feb 2023 17:49:45 +0800
Message-Id: <20230213095035.158240-3-zhao1.liu@linux.intel.com>
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

From SMBIOS 3.0 specification, thread count field means:

Thread Count is the total number of threads detected by the BIOS for
this processor socket. It is a processor-wide count, not a
thread-per-core count. [1]

So here we should use threads per socket other than threads per core.

[1] SMBIOS 3.0.0, section 7.5.8, Processor Information - Thread Count

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Fixes: c97294e (SMBIOS: Build aggregate smbios tables and entry point)
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/smbios/smbios.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 993e8d899b9a..5e6d4584edbb 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -713,6 +713,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
 {
     char sock_str[128];
     size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
+    unsigned cpus_per_socket = ms->smp.max_cpus / ms->smp.sockets;
 
     if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
         tbl_len = SMBIOS_TYPE_4_LEN_V30;
@@ -752,8 +753,8 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
 
     t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
 
-    t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
-    t->thread_count2 = cpu_to_le16(ms->smp.threads);
+    t->thread_count = (cpus_per_socket > 255) ? 0xFF : cpus_per_socket;
+    t->thread_count2 = cpu_to_le16(cpus_per_socket);
 
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
-- 
2.34.1


