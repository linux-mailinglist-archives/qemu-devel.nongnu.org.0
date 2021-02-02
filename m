Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDE30B462
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 02:05:53 +0100 (CET)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6k8f-0004x9-1z
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 20:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k3B-0008Ir-Al
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:13 -0500
Received: from mga18.intel.com ([134.134.136.126]:33363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1l6k39-0001oo-6a
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 20:00:13 -0500
IronPort-SDR: 3dnXW9ms152GRcdciXMyOaskypecV1tu8Cu2VafHtSFtjnu9Vo8M92MQJc+mc8Z2UBuWqUVXPh
 ow8+FDPjDcGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="168457084"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="168457084"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 17:00:00 -0800
IronPort-SDR: mmUmXCN6J2aJPC/ijizScyMOh8a5yeq8Jfhd/bSRJrt5lPYT6Uovz6ZiY4ubdqmo2Xo6wUVAgU
 HCUDzXSmFCYw==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="581764074"
Received: from jambrizm-mobl1.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.133.15])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:59:59 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 07/31] hw/cxl/device: Add cheap EVENTS implementation
 (8.2.9.1)
Date: Mon,  1 Feb 2021 16:59:24 -0800
Message-Id: <20210202005948.241655-8-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202005948.241655-1-ben.widawsky@intel.com>
References: <20210202005948.241655-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=ben.widawsky@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 "John Groves \(jgroves\)" <jgroves@micron.com>,
 Chris Browy <cbrowy@avery-design.com>, Markus Armbruster <armbru@redhat.com>,
 linux-cxl@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the previously implemented stubbed helpers, it is now possible to
easily add the missing, required commands to the implementation.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-mailbox-utils.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 466055b01a..7c939a1851 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -37,6 +37,14 @@
  *  a register interface that already deals with it.
  */
 
+enum {
+    EVENTS      = 0x01,
+        #define GET_RECORDS   0x0
+        #define CLEAR_RECORDS   0x1
+        #define GET_INTERRUPT_POLICY   0x2
+        #define SET_INTERRUPT_POLICY   0x3
+};
+
 /* 8.2.8.4.5.1 Command Return Codes */
 typedef enum {
     CXL_MBOX_SUCCESS = 0x0,
@@ -105,10 +113,23 @@ struct cxl_cmd {
         return CXL_MBOX_SUCCESS;                                          \
     }
 
+define_mailbox_handler_zeroed(EVENTS_GET_RECORDS, 0x20);
+define_mailbox_handler_nop(EVENTS_CLEAR_RECORDS);
+define_mailbox_handler_zeroed(EVENTS_GET_INTERRUPT_POLICY, 4);
+define_mailbox_handler_nop(EVENTS_SET_INTERRUPT_POLICY);
+
+#define IMMEDIATE_CONFIG_CHANGE (1 << 1)
+#define IMMEDIATE_LOG_CHANGE (1 << 4)
+
 #define CXL_CMD(s, c, in, cel_effect) \
     [s][c] = { stringify(s##_##c), cmd_##s##_##c, in, cel_effect }
 
-static struct cxl_cmd cxl_cmd_set[256][256] = {};
+static struct cxl_cmd cxl_cmd_set[256][256] = {
+    CXL_CMD(EVENTS, GET_RECORDS, 1, 0),
+    CXL_CMD(EVENTS, CLEAR_RECORDS, ~0, IMMEDIATE_LOG_CHANGE),
+    CXL_CMD(EVENTS, GET_INTERRUPT_POLICY, 0, 0),
+    CXL_CMD(EVENTS, SET_INTERRUPT_POLICY, 4, IMMEDIATE_CONFIG_CHANGE),
+};
 
 #undef CXL_CMD
 
-- 
2.30.0


