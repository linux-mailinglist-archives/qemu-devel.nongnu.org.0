Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C41B6941FD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:52:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQk-0003pX-7N; Mon, 13 Feb 2023 04:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQe-0003hL-Cw
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:20 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQX-0002o2-98
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281633; x=1707817633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uz2pnz7erb27I1fl0RWPcSALQT5lp4I5qlGbKbPX82Q=;
 b=STpqu/GXKP3cHJkoC8Fx5My/azzZxu+640p3uMBLnrARLCQIdS/by5Uh
 nb2+yc2cNnEXaBmfrvPWNMhDOgjhLARCQRB21xDTJuwwEg0CipgeU/e7Y
 iqdcirqwFTxlZEPHIUJYhNtfbYQPBW4Y9tQkabJBMYfaZ2qHf9zHNVQqO
 CKlS9JJ28oiUnK1nfOIhbiZrOGKjsCgNexSqKuq2sqxINfJZoQ3mUiRiy
 6SQ15Z6u9Dk2b3iFswq5DjiYS+SqVlc6CZU5KZOLwDvvLqcMELd0HnHaB
 wg5R/GCIvmf+FfxTdRdbyZij9y7fgBDkiX0q5LBuJvASH3W+Z8H2lPTPc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487287"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487287"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:46:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760690"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760690"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:46:12 -0800
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
Subject: [RFC 49/52] i386/pc: Support hybrid cpu topology
Date: Mon, 13 Feb 2023 17:50:32 +0800
Message-Id: <20230213095035.158240-50-zhao1.liu@linux.intel.com>
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

Allow i386/pc to set hybrid cpu topology with "-hybrid" commands.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/pc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9a7ee0affd87..5cd45921205c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1928,6 +1928,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
+    mc->topo_props.hybrid_supported = true;
     mc->topo_props.dies_supported = true;
     mc->topo_props.clusters_supported = true;
     mc->default_ram_id = "pc.ram";
-- 
2.34.1


