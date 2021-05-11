Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DB379FCD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 08:39:21 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgM36-0003J8-D9
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 02:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrx-0005oc-QF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:46441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lgLrm-0004it-PK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:27:49 -0400
IronPort-SDR: lYxvChQYcECGl0Q5rnNjWH5e7HBJ8UE4+ZgS496yyXKrRD6n9hB8Lf6EpxAUK7vRMMjq5gN+UV
 LMeM7kt0Vw7g==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260631494"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="260631494"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:27:34 -0700
IronPort-SDR: +eJw0vaoBjFcCPIiAadOkxJvUG1kbNv9OLQNWUSwIH2Ous7tLU2uNTdMICSMiJsS2FjzbfXgFl
 glEKsQIkMFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="391281054"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga003.jf.intel.com with ESMTP; 10 May 2021 23:27:27 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/32] qom: Add memory-backend-epc ObjectOptions support
Date: Tue, 11 May 2021 14:20:22 +0800
Message-Id: <20210511062051.41948-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210511062051.41948-1-yang.zhong@intel.com>
References: <20210511062051.41948-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=yang.zhong@intel.com;
 helo=mga06.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, kai.huang@intel.com,
 seanjc@google.com
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
index cd0e76d564..3b1822c07f 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -632,6 +632,23 @@
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
@@ -767,6 +784,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
+    'memory-backend-epc',
     'pef-guest',
     'pr-manager-helper',
     'rng-builtin',
@@ -824,6 +842,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'memory-backend-epc':         'MemoryBackendEpcProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-- 
2.29.2.334.gfaefdd61ec


