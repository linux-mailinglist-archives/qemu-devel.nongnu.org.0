Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B742EB108
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:09:16 +0100 (CET)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwppb-0000f8-Vt
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpau-0008Mi-Be
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:04 -0500
Received: from mga11.intel.com ([192.55.52.93]:21248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.widawsky@intel.com>)
 id 1kwpar-00012W-Se
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:54:04 -0500
IronPort-SDR: 4nAzFEI8Z+h/7LGCmBHMdx6MDNbAA4fxchP+0R8mrpeO6nLJphVluHW1HPVliQD1zjL7zkL39P
 7hyXNdlX+xcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="173629520"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="173629520"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:55 -0800
IronPort-SDR: iBCShpwGYthAfIEIII/1Q1900akwzVcsovnkGsnfJS9IFPkaU8W7LBClfZMKL14NgC0pYhHwoT
 sevytPuP3wmQ==
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="346337970"
Received: from tgeddam-mobl.amr.corp.intel.com (HELO bwidawsk-mobl5.local)
 ([10.252.140.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 08:53:53 -0800
From: Ben Widawsky <ben.widawsky@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 09/32] hw/cxl/device: Add cheap EVENTS implementation
 (8.2.9.1)
Date: Tue,  5 Jan 2021 08:53:00 -0800
Message-Id: <20210105165323.783725-10-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105165323.783725-1-ben.widawsky@intel.com>
References: <20210105165323.783725-1-ben.widawsky@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ben.widawsky@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Thomas Huth <thuth@redhat.com>, Ben Widawsky <ben.widawsky@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>,
 Chris Browy <cbrowy@avery-design.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Prashant V Agarwal <agpr123@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the previously implemented stubbed helpers, it is now possible to
easily add the missing, required commands to the implementation.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 hw/cxl/cxl-mailbox-utils.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 0e94f5a95f..890e486ea1 100644
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


