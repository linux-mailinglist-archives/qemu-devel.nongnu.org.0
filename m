Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51CA3CD3F5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:34:34 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5RXd-0001Ua-Mm
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQY-0003le-5n
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:14 -0400
Received: from mga09.intel.com ([134.134.136.24]:16159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m5RQW-0005ni-0I
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:27:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="211035180"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="211035180"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 04:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="656813513"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 04:27:07 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/33] qom: Add memory-backend-epc ObjectOptions support
Date: Mon, 19 Jul 2021 19:21:06 +0800
Message-Id: <20210719112136.57018-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210719112136.57018-1-yang.zhong@intel.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=yang.zhong@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yang.zhong@intel.com, seanjc@google.com, kai.huang@intel.com,
 jarkko@kernel.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the new 'memory-backend-epc' user creatable QOM object in
the ObjectOptions to support SGX since v6.1, or the sgx backend
object cannot bootup.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Added the new MemoryBackendEpcProperties and related documents,
     and updated the blurb(Eric Blake).
---
 qapi/qom.json | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index 652be317b8..aba77aa97b 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -642,6 +642,23 @@
             '*hugetlbsize': 'size',
             '*seal': 'bool' } }
 
+##
+# @MemoryBackendEpcProperties:
+#
+# Properties for memory-backend-epc objects.
+#
+# The @share boolean option is true by default with epc
+#
+# The @merge boolean option is false by default with epc
+#
+# The @dump boolean option is false by default with epc
+#
+# Since: 6.1
+##
+{ 'struct': 'MemoryBackendEpcProperties',
+  'base': 'MemoryBackendProperties',
+  'data': {} }
+
 ##
 # @PrManagerHelperProperties:
 #
@@ -792,6 +809,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
+    'memory-backend-epc',
     'pef-guest',
     'pr-manager-helper',
     'qtest',
@@ -850,6 +868,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'memory-backend-epc':         'MemoryBackendEpcProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'qtest':                      'QtestProperties',
       'rng-builtin':                'RngProperties',

