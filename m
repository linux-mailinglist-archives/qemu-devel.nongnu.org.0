Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE693428BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 13:27:28 +0200 (CEST)
Received: from localhost ([::1]:55168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZtSp-0000Hj-SB
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 07:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNJ-0001Tw-PN
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:28240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1mZtNE-0008Kp-Ij
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 07:21:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="225624856"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="225624856"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 04:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="490432173"
Received: from icx-2s.bj.intel.com ([10.240.193.41])
 by orsmga008.jf.intel.com with ESMTP; 11 Oct 2021 04:21:32 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] numa: Add SGXEPCSection list for multiple sections
Date: Mon, 11 Oct 2021 19:15:51 +0800
Message-Id: <20211011111554.12403-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20211011111554.12403-1-yang.zhong@intel.com>
References: <20211011111554.12403-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
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
Cc: yang.zhong@intel.com, pbonzini@redhat.com, eblake@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SGXEPCSection list added into SGXInfo to show the multiple
SGX EPC sections detailed info, not the total size like before.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 qapi/misc-target.json | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 594fbd1577..89a5a4250a 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -334,6 +334,21 @@
   'returns': 'SevAttestationReport',
   'if': 'TARGET_I386' }
 
+##
+# @SGXEPCSection:
+#
+# Information about intel SGX EPC section info
+#
+# @index: the SGX epc section index
+#
+# @size: the size of epc section
+#
+# Since: 6.2
+##
+{ 'struct': 'SGXEPCSection',
+  'data': { 'index': 'uint64',
+            'size': 'uint64'}}
+
 ##
 # @SGXInfo:
 #
@@ -347,7 +362,7 @@
 #
 # @flc: true if FLC is supported
 #
-# @section-size: The EPC section size for guest
+# @sections: The EPC sections info for guest
 #
 # Since: 6.2
 ##
@@ -356,7 +371,7 @@
             'sgx1': 'bool',
             'sgx2': 'bool',
             'flc': 'bool',
-            'section-size': 'uint64'},
+            'sections': ['SGXEPCSection']},
    'if': 'TARGET_I386' }
 
 ##

