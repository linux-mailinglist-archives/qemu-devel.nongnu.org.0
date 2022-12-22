Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FB9653B3E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 05:26:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8D8t-0007qG-Ca; Wed, 21 Dec 2022 23:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8h-0007nz-U6
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:04 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1p8D8e-00015r-Sn
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 23:25:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671683100; x=1703219100;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XGNtHbyVzjRM6zP+BrVd5/RaxuH73xazAUYM0GbkcYU=;
 b=fVnauWvwwAOyOtcsyq1ViqTGjc5XYcondcr9DnhZ/vpFCyjSoSPbqVa1
 yxRqmkcBFbTu9qVXjBTcxWmLJzcYUPQvVBbkE+b59m/jI/H44i+BgcRpN
 q174QC/dhTY2G4lwBAC9IdpWFUIhQwFs3CLb0Vo5LdAFL3ATjd7Xe3pBP
 595XTVizi+n8prDgD0/3JY+vMf1YVI/u8IFOEUQkikktMxIgyhc1v0zwV
 t0aohPNjUjjTguaKm9pB6ak6boMllDHwx7shCCdP4sGu7/LG3cyhl/cAT
 +EeDvsYCpmzrrc4pltPmchU4/q6VVeDdKcexW0G0a4WIJv0T8tUzkia6a Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321957591"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="321957591"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="601733192"
X-IronPort-AV: E=Sophos;i="5.96,264,1665471600"; d="scan'208";a="601733192"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost)
 ([10.212.20.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 20:24:56 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 21 Dec 2022 20:24:32 -0800
Subject: [PATCH v2 2/8] qemu/uuid: Add UUID static initializer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221221-ira-cxl-events-2022-11-17-v2-2-2ce2ecc06219@intel.com>
References: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
In-Reply-To: <20221221-ira-cxl-events-2022-11-17-v2-0-2ce2ecc06219@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>
X-Mailer: b4 0.11.0-dev-141d4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671683093; l=1574;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=XGNtHbyVzjRM6zP+BrVd5/RaxuH73xazAUYM0GbkcYU=;
 b=7sLIDzTSr2nn7ij9GENb4v+W0NXmQNOuFcR+/0BAMgslxVcrBtgGkWzFtn3bks+zpTJeF1qtHpFC
 93hb7iYICYn7BTztkIdTd0kEGQ11LwsclTMVy2FXJzTOceov8utU
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ira.weiny@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

UUID's are defined as network byte order fields.  No static initializer
was available for UUID's in their standard big endian format.

Define a big endian initializer for UUIDs.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/qemu/uuid.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/qemu/uuid.h b/include/qemu/uuid.h
index 9925febfa54d..dc40ee1fc998 100644
--- a/include/qemu/uuid.h
+++ b/include/qemu/uuid.h
@@ -61,6 +61,18 @@ typedef struct {
     (clock_seq_hi_and_reserved), (clock_seq_low), (node0), (node1), (node2),\
     (node3), (node4), (node5) }
 
+/* Normal (network byte order) UUID */
+#define UUID(time_low, time_mid, time_hi_and_version,                    \
+  clock_seq_hi_and_reserved, clock_seq_low, node0, node1, node2,         \
+  node3, node4, node5)                                                   \
+  { ((time_low) >> 24) & 0xff, ((time_low) >> 16) & 0xff,                \
+    ((time_low) >> 8) & 0xff, (time_low) & 0xff,                         \
+    ((time_mid) >> 8) & 0xff, (time_mid) & 0xff,                         \
+    ((time_hi_and_version) >> 8) & 0xff, (time_hi_and_version) & 0xff,   \
+    (clock_seq_hi_and_reserved), (clock_seq_low),                        \
+    (node0), (node1), (node2), (node3), (node4), (node5)                 \
+  }
+
 #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
                  "%02hhx%02hhx-%02hhx%02hhx-" \
                  "%02hhx%02hhx-" \

-- 
2.38.1

