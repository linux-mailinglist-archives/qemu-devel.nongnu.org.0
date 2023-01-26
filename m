Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD9B67C459
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:38:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKuxF-0003vi-OF; Thu, 26 Jan 2023 00:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pKuxD-0003vX-Qi
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:37:43 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1pKuxC-00067B-AZ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674711462; x=1706247462;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TmttUS7xwD55ClAuoEUKjKv5YzYGUkVO9chKYEHMpSM=;
 b=TjjNwCj/ERBVx6DSui6x6sWJE+Vs5zjamqEGBe/Pb4noC74tNPRY6HbY
 DprvSP/QyX+TAvRb4QlEtodLn2GJK1C1ixVxqEDFZG9vwlCXS+g8u8mOA
 RxTnvgdQkl92Ra1EYvgMxgpEmXqmg9xGMwjXnepvrVMkRpSWu+fogvvvf
 aLgr3AuSwYY2JHg02c60K7+zk792FTkdnCRT3qNLCC+QPz/5VVAbno1QI
 MXA19lkK+rpDLtRFjsDfSo4eoYZ+Oz3HIsgTZ7jPcwjTey6pd538PFsL7
 Lm66ut1nlSCyEK7x6wmURwqhMmsDcyBniMl6rqvs2O0SJRnnGB0k92YRX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="310328974"
X-IronPort-AV: E=Sophos;i="5.97,247,1669104000"; d="scan'208";a="310328974"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 21:37:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786704012"
X-IronPort-AV: E=Sophos;i="5.97,247,1669104000"; d="scan'208";a="786704012"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.115.122])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 21:37:31 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 25 Jan 2023 21:37:28 -0800
Subject: [PATCH 2/2] hw/cxl: Remove check for g_new0() failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-ira-cxl-events-fixups-2023-01-11-v1-2-1931378515f5@intel.com>
References: <20230125-ira-cxl-events-fixups-2023-01-11-v1-0-1931378515f5@intel.com>
In-Reply-To: <20230125-ira-cxl-events-fixups-2023-01-11-v1-0-1931378515f5@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
X-Mailer: b4 0.12-dev-cc11a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674711449; l=923;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=TmttUS7xwD55ClAuoEUKjKv5YzYGUkVO9chKYEHMpSM=;
 b=SjGQo8fu61yc0Hc9DTQNnWEmFHvaMA+6yZUN5MNbr+XC/5Y4Y9tYlIYgSAF92Whod51le4rB/Lcu
 QWYpyEVjCThrmtlIlECwrqzdZobehQV/tJuhyHNkq75KK8DlcxkY
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.126; envelope-from=ira.weiny@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

g_new0() will terminate the application if it fails.  Remove the check.

Fixes: fb64c5661d5f ("hw/cxl/events: Wire up get/clear event mailbox commands")
Reported-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 hw/cxl/cxl-events.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/cxl/cxl-events.c b/hw/cxl/cxl-events.c
index 2536aafc55fb..4cbc838e8ff4 100644
--- a/hw/cxl/cxl-events.c
+++ b/hw/cxl/cxl-events.c
@@ -124,13 +124,7 @@ bool cxl_event_insert(CXLDeviceState *cxlds,
     }
 
     entry = g_new0(CXLEvent, 1);
-    if (!entry) {
-        error_report("Failed to allocate memory for event log entry");
-        return false;
-    }
-
     memcpy(&entry->data, event, sizeof(*event));
-
     entry->data.hdr.handle = cpu_to_le16(log->next_handle);
     log->next_handle++;
     /* 0 handle is never valid */

-- 
2.39.1

