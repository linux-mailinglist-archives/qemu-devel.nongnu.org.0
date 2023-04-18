Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956A6E6F50
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 00:22:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poti0-0002sr-Hz; Tue, 18 Apr 2023 18:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pothw-0002sN-6F
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:21:53 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pothu-0004DW-KA
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 18:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681856510; x=1713392510;
 h=subject:from:to:cc:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ShK3/HkYH+Cil2REtvzdbKXsmqx7XX1jYaJUndfcRA=;
 b=VdkbBL/Pl0Tb8fgVuPt66BZBzbJxTwSXETsK43lYwHweP2OaaQkHPgrg
 HdXl161k2L8ZFP2uTgN3MUUwavCiZhp6G1UGjJCyi+eRw686WxUn9jEVK
 rBdwVk5aAn/tbWHA+Vg2GyYOYWxce1/GsGVh67z6Q327tJCwrMaaWgxCz
 j2dS56nFD2WeRzsHL5pxa4F5tn6A9++JDoQB+54obQ7KLiZa99Gak1Ang
 FQFbSiiImcbgXKgGohHBfcnwelGoueunJB/LxY8E2a3M17fGxZ491Hzve
 F0v0t7IW+TE6YFhBLwMiwOUK5x+C2Sdkijo4EUBhS2624oZidS7X1d1nv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="329472104"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="329472104"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="693796514"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="693796514"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO [192.168.1.177])
 ([10.212.29.141])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 15:21:48 -0700
Subject: [RFC PATCH 2/3] genport: Add json support for generic port
From: Dave Jiang <dave.jiang@intel.com>
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, Jonathan.Cameron@huawei.com, ira.weiny@intel.com,
 mst@redhat.com, bwidawsk@kernel.org
Date: Tue, 18 Apr 2023 15:21:49 -0700
Message-ID: <168185650912.899932.17915407771139232861.stgit@djiang5-mobl3>
In-Reply-To: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
References: <168185633821.899932.322047053764766056.stgit@djiang5-mobl3>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dave.jiang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add QOM json update for ACPI generic port object to support HMAT
enumeration.

Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 qapi/machine.json |    3 ++-
 qapi/qom.json     |   12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 068427b8feb8..39cb5bd713f6 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -479,7 +479,8 @@
    '*cpus':   ['uint16'],
    '*mem':    'size',
    '*memdev': 'str',
-   '*initiator': 'uint16' }}
+   '*initiator': 'uint16',
+   '*genport': 'str' }}
 
 ##
 # @NumaDistOptions:
diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad28..8f5faff49114 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -444,6 +444,16 @@
   'base': 'NetfilterProperties',
   'data': { '*vnet_hdr_support': 'bool' } }
 
+##
+# @GenericPortDeviceProperties:
+#
+# Properties for generic port devices.
+#
+# Since: 7.2
+##
+{ 'struct': 'GenericPortDeviceProperties',
+  'data': {} }
+
 ##
 # @InputBarrierProperties:
 #
@@ -886,6 +896,7 @@
     'filter-redirector',
     'filter-replay',
     'filter-rewriter',
+    'genport',
     'input-barrier',
     { 'name': 'input-linux',
       'if': 'CONFIG_LINUX' },
@@ -955,6 +966,7 @@
       'filter-redirector':          'FilterRedirectorProperties',
       'filter-replay':              'NetfilterProperties',
       'filter-rewriter':            'FilterRewriterProperties',
+      'genport':                    'GenericPortDeviceProperties',
       'input-barrier':              'InputBarrierProperties',
       'input-linux':                { 'type': 'InputLinuxProperties',
                                       'if': 'CONFIG_LINUX' },



