Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B99363F8E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:27:35 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYR7u-0000jd-UT
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3D-0003vN-PI
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:22:44 -0400
Received: from mga17.intel.com ([192.55.52.151]:24099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1lYR3A-00025K-1e
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:22:43 -0400
IronPort-SDR: hWeG++A4ei8M6aieF0JdVtK2hpmOPJUWNSP+Zu3lYpoXFcAT5bwNkIoCskeaSVJji5cickKv3j
 VFR9N8EPUqkg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="175409253"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="175409253"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 03:22:34 -0700
IronPort-SDR: oxLtBSYy1bdC/zoPZLcrwwr+c+vx6xilF3oQLRMJzCCxojlktbl1SgroRl3+hkDWP5DzBW+RH8
 Bnki9Nw39pCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="419947298"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2021 03:22:32 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/32] qom: Add memory-backend-epc ObjectOptions support
Date: Mon, 19 Apr 2021 18:01:27 +0800
Message-Id: <20210419100156.53504-4-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
In-Reply-To: <20210419100156.53504-1-yang.zhong@intel.com>
References: <20210419100156.53504-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yang.zhong@intel.com;
 helo=mga17.intel.com
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
the ObjectOptions to support SGX, or the sgx backend object
cannot bootup.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 qapi/qom.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qapi/qom.json b/qapi/qom.json
index cd0e76d564..fd6fbee597 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -767,6 +767,7 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
+    'memory-backend-epc',
     'pef-guest',
     'pr-manager-helper',
     'rng-builtin',
@@ -824,6 +825,7 @@
       'memory-backend-memfd':       { 'type': 'MemoryBackendMemfdProperties',
                                       'if': 'defined(CONFIG_LINUX)' },
       'memory-backend-ram':         'MemoryBackendProperties',
+      'memory-backend-epc':         'MemoryBackendProperties',
       'pr-manager-helper':          'PrManagerHelperProperties',
       'rng-builtin':                'RngProperties',
       'rng-egd':                    'RngEgdProperties',
-- 
2.29.2.334.gfaefdd61ec


