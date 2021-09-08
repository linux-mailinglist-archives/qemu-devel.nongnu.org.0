Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD11403616
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:27:12 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNsvH-0005kj-Qm
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstZ-0002qO-A2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:25 -0400
Received: from mga14.intel.com ([192.55.52.115]:13020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mNstS-0003r6-DD
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:25:22 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220102691"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220102691"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 01:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538450857"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2021 01:25:13 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] qmp: Add query-sgx command
Date: Wed,  8 Sep 2021 16:19:31 +0800
Message-Id: <20210908081937.77254-2-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210908081937.77254-1-yang.zhong@intel.com>
References: <20210908081937.77254-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This QMP query command can be used by some userspaces to retrieve
the SGX information when SGX is enabled on Intel platform.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 qapi/misc-target.json      | 43 ++++++++++++++++++++++++++++++++++++++
 target/i386/monitor.c      |  6 ++++++
 tests/qtest/qmp-cmd-test.c |  1 +
 3 files changed, 50 insertions(+)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 3b05ad3dbf..e2a347cc23 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -333,3 +333,46 @@
 { 'command': 'query-sev-attestation-report', 'data': { 'mnonce': 'str' },
   'returns': 'SevAttestationReport',
   'if': 'TARGET_I386' }
+
+##
+# @SGXInfo:
+#
+# Information about intel Safe Guard eXtension (SGX) support
+#
+# @sgx: true if SGX is supported
+#
+# @sgx1: true if SGX1 is supported
+#
+# @sgx2: true if SGX2 is supported
+#
+# @flc: true if FLC is supported
+#
+# @section-size: The EPC section size for guest
+#
+# Since: 6.2
+##
+{ 'struct': 'SGXInfo',
+  'data': { 'sgx': 'bool',
+            'sgx1': 'bool',
+            'sgx2': 'bool',
+            'flc': 'bool',
+            'section-size': 'uint64'},
+   'if': 'TARGET_I386' }
+
+##
+# @query-sgx:
+#
+# Returns information about SGX
+#
+# Returns: @SGXInfo
+#
+# Since: 6.2
+#
+# Example:
+#
+# -> { "execute": "query-sgx" }
+# <- { "return": { "sgx": true, "sgx1" : true, "sgx2" : true,
+#                  "flc": true, "section-size" : 0 } }
+#
+##
+{ 'command': 'query-sgx', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..942274c1c2 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -763,3 +763,9 @@ qmp_query_sev_attestation_report(const char *mnonce, Error **errp)
 {
     return sev_get_attestation_report(mnonce, errp);
 }
+
+SGXInfo *qmp_query_sgx(Error **errp)
+{
+    error_setg(errp, QERR_FEATURE_DISABLED, "query-sgx");
+    return NULL;
+}
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

