Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9085FA7D9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 00:51:01 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi1bw-0007TU-A9
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 18:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I7-0005vv-0G
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:24675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ira.weiny@intel.com>)
 id 1oi1I5-0005Dj-8j
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 18:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665441029; x=1696977029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/t8uS0dJ6+AOQCZeLPwusIK7WCU31QkWkBGL5ijeEMc=;
 b=m3kSAEF7FnXop4C+8S+lGEAdqKc4tz7qsWfdQybHQhXgegWGldCDyMtw
 0KBRuM113mgc+Lvda8kbKSUwhmisTOPujgqc6sqY3NDR+M82vUlQIxGmd
 oyeZ9w6xHM0Gh2HAw7otj12QVipKymx8xh5REB5sGHbWys2Y0jgCUAP8M
 9xShtZVF+vsN8GrDbrocj/PfEu9TTDo7n+tu8TMEI5xs7jz+1mI1T86EB
 5BQwi4OBTgoB6P43YdsdSrvbnsTpNIHkgo2ksh2gUZVvBP0WNnGZ89Awv
 ZhSb8HsuEVGjVO353/JiHuxSZ3qlP5EA1951pt2JG0FmEcaEtp3TZ0tkP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="291661240"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="291661240"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="628456977"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="628456977"
Received: from iweiny-mobl.amr.corp.intel.com (HELO localhost) ([10.212.104.4])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 15:30:19 -0700
From: ira.weiny@intel.com
To: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Ira Weiny <ira.weiny@intel.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org
Subject: [RFC PATCH 2/6] qemu/uuid: Add UUID static initializer
Date: Mon, 10 Oct 2022 15:29:40 -0700
Message-Id: <20221010222944.3923556-3-ira.weiny@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221010222944.3923556-1-ira.weiny@intel.com>
References: <20221010222944.3923556-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=ira.weiny@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Oct 2022 18:44:32 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ira Weiny <ira.weiny@intel.com>

UUID's are defined as network byte order fields.  No static initializer
was available for UUID's in their standard big endian format.

Define a big endian initializer for UUIDs.

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
2.37.2


