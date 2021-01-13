Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21A2F46EA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:54:22 +0100 (CET)
Received: from localhost ([::1]:56514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbv3-0003bC-1v
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1kzbtv-00035b-DN
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:53:11 -0500
Received: from mga12.intel.com ([192.55.52.136]:53910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1kzbtr-00018S-51
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:53:10 -0500
IronPort-SDR: QwdA5+FA1KdXGtndSN5OtU4Cbu5NIgTUR9zFbgek6tJiPIDz55QKPUsv/NNN6ZRQd7OamIV1yH
 Aj1ntDQJHILA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="157354959"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="157354959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 00:52:55 -0800
IronPort-SDR: Dil8UGQTUnmbJbsLCHCXj9VZV3/KuQEzPycjetEhIUr6DZ+m4aApgTG+myHysXkR6lQzYfAYwZ
 hICDGhBOJJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="381765972"
Received: from local-michael-cet-test.sh.intel.com ([10.239.159.172])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2021 00:52:53 -0800
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com,
	seanjc@google.com,
	qemu-devel@nongnu.org
Subject: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if -cpu
 max option is applied
Date: Wed, 13 Jan 2021 17:04:30 +0800
Message-Id: <20210113090430.26394-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.17.2
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=weijiang.yang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Weijiang <weijiang.yang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU option -cpu max(max_features) means "Enables all features supported by
the accelerator in the current host", this looks true for all the features
except guest max physical address width, so add this patch to enable it.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35459a38bb..b5943406f7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
                 warned = true;
             }
 
-            if (cpu->host_phys_bits) {
+            if (cpu->host_phys_bits || cpu->max_features) {
                 /* The user asked for us to use the host physical bits */
                 cpu->phys_bits = host_phys_bits;
                 if (cpu->host_phys_bits_limit &&
-- 
2.17.2


