Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F97A694219
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNP-0004R4-Ii; Mon, 13 Feb 2023 04:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNN-0004Q7-Ro
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:57 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNM-0002i2-CH
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281436; x=1707817436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVeL9lXSm+9rImx8FaSdczi3Rn44hbMbKwjHVwkwjYI=;
 b=gp3Zig8+h2pl1cYDtQeqtPmcoXP0NTgbmH2hBQ19JepqYwwyXzJfZllB
 +oNrnikRrgNJOoVS8hWFAl8LRut8ITt2NswLwGQuBRE6tNIU/Xi5Augux
 RLVB/8jYtzg+UK7X9YW/NGKKpyUXvCXygx1vSTwu4nDaWU3AUrxRWGxVH
 txd6JA5mp+l5LHZOCSXs24Ndzn0l3M4ShBKIdGPxgnQl6fY1UItCvP+QE
 Aq/KvQ4nLXrAEnh6n/Z89hXoeNdKdku7LoN9jHSZz/xTwEmKzfoX6A0Jt
 hsYvzfBp9D7eyRaVhtZVzTRa2ST0mKM2zMzL1p6GcNxnZojd4KTQss99A Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486539"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486539"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759862"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759862"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:51 -0800
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
Subject: [RFC 14/52] hw/smbios: Use generic topology name and helper
Date: Mon, 13 Feb 2023 17:49:57 +0800
Message-Id: <20230213095035.158240-15-zhao1.liu@linux.intel.com>
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

As the generic code, smbios should respect the different topologies: smp
or hybrid.

So rename smbios_smp_sockets to smbios_topo_sockets to decouple with smp
topology.

And use generic topology helpers to get topology information.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/smbios/smbios.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index cd4aa331cb3e..2ce1f2b1d94e 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -70,7 +70,8 @@ static SmbiosEntryPoint ep;
 static int smbios_type4_count = 0;
 static bool smbios_immutable;
 static bool smbios_have_defaults;
-static uint32_t smbios_cpuid_version, smbios_cpuid_features, smbios_smp_sockets;
+static uint32_t smbios_cpuid_version, smbios_cpuid_features;
+static uint32_t smbios_topo_sockets;
 
 static DECLARE_BITMAP(have_binfile_bitmap, SMBIOS_MAX_TYPE+1);
 static DECLARE_BITMAP(have_fields_bitmap, SMBIOS_MAX_TYPE+1);
@@ -461,7 +462,7 @@ opts_init(smbios_register_config);
 static void smbios_validate_table(MachineState *ms)
 {
     uint32_t expect_t4_count = smbios_legacy ?
-                                        ms->smp.cpus : smbios_smp_sockets;
+                               machine_topo_get_cpus(ms) : smbios_topo_sockets;
 
     if (smbios_type4_count && smbios_type4_count != expect_t4_count) {
         error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
@@ -713,8 +714,8 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
 {
     char sock_str[128];
     size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
-    unsigned cpus_per_socket = ms->smp.max_cpus / ms->smp.sockets;
-    unsigned cores_per_socket = cpus_per_socket / ms->smp.threads;
+    unsigned cpus_per_socket = machine_topo_get_threads_per_socket(ms);
+    unsigned cores_per_socket = machine_topo_get_cores_per_socket(ms);
 
     if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
         tbl_len = SMBIOS_TYPE_4_LEN_V30;
@@ -1088,10 +1089,10 @@ void smbios_get_tables(MachineState *ms,
         smbios_build_type_2_table();
         smbios_build_type_3_table();
 
-        smbios_smp_sockets = ms->smp.sockets;
-        assert(smbios_smp_sockets >= 1);
+        smbios_topo_sockets = machine_topo_get_sockets(ms);
+        assert(smbios_topo_sockets >= 1);
 
-        for (i = 0; i < smbios_smp_sockets; i++) {
+        for (i = 0; i < smbios_topo_sockets; i++) {
             smbios_build_type_4_table(ms, i);
         }
 
-- 
2.34.1


