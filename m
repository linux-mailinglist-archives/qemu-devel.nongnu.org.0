Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBB69419D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVMk-0003TS-Hn; Mon, 13 Feb 2023 04:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMh-0003T8-VQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:15 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMb-0002Xa-IN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281389; x=1707817389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BJywBH3QvqKhRwNA5HBzv3Qhe9LhP2532oVSyQqMTMw=;
 b=iPC/yTRP36e323h+HWWxoda3eYA6sSplVnmeHNvJIc4I8UmqrUSp8Yzc
 mWHfg9yzhy9AhLsJFU844ADuVb+GLBSZnpvH7XfeObk1HSwlddz6B+5Ah
 i1fCX0B9eN03JwWvilsoASh4fuHPp3u8fCR8rawdCMLyObibpN5pwyDL6
 OPTMWd0hrdGn/m6poG7I1jyO59RBO3ERaoSatTtkTlEOYxMYsQQOepxDu
 6inbTrD+CW70zf1JZlnPxkpFsE6Rfi14GY1yWPrmJlJyvCWzTcvzZBxu/
 GpMhnO/IKXjYO1vdFG/2m4xdeaJsO8tfggoD3C0lV23bPxGLiR4c3sJKG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486300"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486300"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759789"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759789"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:02 -0800
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
Subject: [RFC 01/52] hw/smbios: Fix smbios_smp_sockets caculation
Date: Mon, 13 Feb 2023 17:49:44 +0800
Message-Id: <20230213095035.158240-2-zhao1.liu@linux.intel.com>
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

Here're 2 mistakes:
1. 003f230 (machine: Tweak the order of topology members in struct
   CpuTopology) changes the meaning of smp.cores but doesn't fix
   original smp.cores uses. And because of the introduction of cluster,
   now smp.cores means the number of cores in one cluster. So smp.cores
   * smp.threads just means the cpus in a cluster not in a socket.
2. smp.cpus means the number of initial online cpus, not the total
   number of cpus. For such topology calculation, smp.max_cpus
   should be considered.

Since the number of sockets has already been recorded in smp structure,
use smp.sockets directly.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Fixes: 003f230 (machine: Tweak the order of topology members in struct CpuTopology)
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/smbios/smbios.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 4869566cf5df..993e8d899b9a 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1086,8 +1086,7 @@ void smbios_get_tables(MachineState *ms,
         smbios_build_type_2_table();
         smbios_build_type_3_table();
 
-        smbios_smp_sockets = DIV_ROUND_UP(ms->smp.cpus,
-                                          ms->smp.cores * ms->smp.threads);
+        smbios_smp_sockets = ms->smp.sockets;
         assert(smbios_smp_sockets >= 1);
 
         for (i = 0; i < smbios_smp_sockets; i++) {
-- 
2.34.1


