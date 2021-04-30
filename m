Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C9536F5CB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:42:02 +0200 (CEST)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMqf-0008Vb-L5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMf7-00068v-9T
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:30:05 -0400
Received: from mga11.intel.com ([192.55.52.93]:63439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lcMf2-00016y-Sj
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:30:04 -0400
IronPort-SDR: ltNFjvY+wUNBijdB/tmUMWz5bzyHzeovJcWixFAMbfraSsuEhwV2nNYPFRw+Y+6muw0D/mRdst
 7Yjf7ArPSAKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="194023181"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="194023181"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 23:28:57 -0700
IronPort-SDR: Ahywyiytrqhpe2bwY+Obg3fmVbP6dZlMnZ1QVvDl7zvmFlOYsKE613PpTATqsPej6slxJ4sqP2
 0mMDQk3R34nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="387258624"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2021 23:28:55 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH 25/32] qmp: Add query-sgx command
Date: Fri, 30 Apr 2021 14:24:48 +0800
Message-Id: <20210430062455.8117-26-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210430062455.8117-1-yang.zhong@intel.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yang.zhong@intel.com;
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This QMP query command can be used by some userspaces to retrieve
the SGX information when SGX is enabled on Intel platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 monitor/qmp-cmds.c         |  6 ++++++
 qapi/misc.json             | 42 ++++++++++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 3 files changed, 49 insertions(+)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index f7d64a6457..d63d59149f 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -351,3 +351,9 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
         abort();
     }
 }
+
+SGXInfo *qmp_query_sgx(Error **errp)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
+    return NULL;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index 156f98203e..112a2f71cf 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -519,3 +519,45 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @SGXInfo:
+#
+# Information about intel Safe Guard eXtension (SGX) support
+#
+# @sgx: true if SGX is support
+#
+# @sgx1: true if SGX1 is support
+#
+# @sgx2: true if SGX2 is support
+#
+# @flc: true if FLC is support
+#
+# @section-size: The EPC section size for guest
+#
+# Since: 5.1
+##
+{ 'struct': 'SGXInfo',
+  'data': { 'sgx': 'bool',
+            'sgx1': 'bool',
+            'sgx2': 'bool',
+            'flc': 'bool',
+            'section-size': 'uint64'}}
+
+##
+# @query-sgx:
+#
+# Returns information about SGX
+#
+# Returns: @SGXInfo
+#
+# Since: 5.1
+#
+# Example:
+#
+# -> { "execute": "query-sgx" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx', 'returns': 'SGXInfo' }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d033..b75f3364f3 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -100,6 +100,7 @@ static bool query_is_ignored(const char *cmd)
         /* Success depends on Host or Hypervisor SEV support */
         "query-sev",
         "query-sev-capabilities",
+        "query-sgx",
         NULL
     };
     int i;
-- 
2.29.2.334.gfaefdd61ec


