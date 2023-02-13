Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE106941AB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVMx-0003V9-7E; Mon, 13 Feb 2023 04:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMu-0003Uk-6q
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:28 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVMm-0002aV-3B
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281400; x=1707817400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aWyQVMR7h15uj2iD8i3nTPQv7HlrNLYz2ZcyoOyV0oA=;
 b=LXY9kI4AxzBq9VT9TB3yS9oG1kBnck1jE5mYqHWCR4oRTpEkyPXsVCj0
 hvMN1jp88YBNETj6x8DAEbTubXH4eJt42Ub8caFGrSLq/LqwsBdu9RR6c
 d/edSsm5nkoHns4BbOSQriPHA+4dOQAvzytbpiezv0oVDl+eB/ENECAJI
 sKDFfNMtLmIt3kBA2vcTdMyYvg2CqZX63qFDgwk3MthfR21Ev3ubPhGzH
 uHZ8IyfgvBw0eaxxU8XS0m0t50T/bAUtJbYJC3wobufLdEJSCs9sEUgH8
 3x6iIxp1+TDJI47AdYQNsDnOSafWbi/6KJLkxiHaAXb0uWFH5FS6mlfC1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486356"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486356"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759806"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759806"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:14 -0800
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
 Zhao Liu <zhao1.liu@intel.com>, Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [RFC 04/52] i386/WHPX: Fix error message when fail to set
 ProcessorCount
Date: Mon, 13 Feb 2023 17:49:47 +0800
Message-Id: <20230213095035.158240-5-zhao1.liu@linux.intel.com>
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

003f230 (machine: Tweak the order of topology members in struct
CpuTopology) changes the meaning of MachineState.smp.cores from "the
number of cores in one package" to "the number of cores in one die"
and doesn't fix other uses of MachineState.smp.cores. And because of
the introduction of cluster, now smp.cores just means "the number of
cores in one cluster". This clearly does not fit the semantics here.

And before this error message, WHvSetPartitionProperty() is called to
set prop.ProcessorCount.

So the error message should show the prop.ProcessorCount other than
"cores per cluster" or "cores per package".

Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/whpx/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index e738d83e8191..fc349f887e47 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2613,8 +2613,8 @@ static int whpx_accel_init(MachineState *ms)
         sizeof(WHV_PARTITION_PROPERTY));
 
     if (FAILED(hr)) {
-        error_report("WHPX: Failed to set partition core count to %d,"
-                     " hr=%08lx", ms->smp.cores, hr);
+        error_report("WHPX: Failed to set partition processor count to %d,"
+                     " hr=%08lx", prop.ProcessorCount, hr);
         ret = -EINVAL;
         goto error;
     }
-- 
2.34.1


