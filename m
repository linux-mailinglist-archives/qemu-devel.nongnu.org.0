Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241C26A4387
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvu-00072C-4y; Mon, 27 Feb 2023 08:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1pWdvf-0006ea-PD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:37 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1pWdvd-0005kN-EF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677505953; x=1709041953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w0So7/21r+uPvS6CR2YXCu/bG0nNU2wE+uVIPn7nsUE=;
 b=BvaDmSsLS/u/GQAk5Y2feAKrzscUww9dDCNuUyhsqXyu7PLwm69TjVaV
 ABPuY8Q5NmxYtI2AvMwvXFexzYHErItrW2mqr7V8WYRi++yjnSrokrLHT
 0mgl+fXw7fHhqoJspT0uIHXYZWINCxF6y8QOsVqkwrrtkYmioEbGO4yBa
 5QAcE6mTeIRFL5XdSgzczUc3R/CUhEIMSB+AjKpwd1iMsKXtrV72Vx1fr
 dXmVTNVXTdOCwSi2ep8geCogY0ctHCKPnzc5/OWNwj/clWRanZBMpJgWw
 SJR1taJYbpdbpa5U6IyFWm7Vv5FlFbOzsIRx/hW0nxL7iVZwBZZ8w9QgV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="398633085"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="398633085"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 05:52:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="704044414"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; d="scan'208";a="704044414"
Received: from sqa-gate.sh.intel.com (HELO robert-clx2.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 27 Feb 2023 05:52:22 -0800
From: Robert Hoo <robert.hu@linux.intel.com>
To: pbonzini@redhat.com,
	chao.gao@intel.com,
	binbin.wu@linux.intel.com
Cc: seanjc@google.com, qemu-devel@nongnu.org, yang.zhong@linux.intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Subject: [PATCH] i386: QEMU support LAM (Linear Address Masking)
Date: Mon, 27 Feb 2023 21:52:03 +0800
Message-Id: <20230227135203.418404-1-robert.hu@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=robert.hu@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Define feature word "lam", so that QEMU can support this new feature.

LAM is enumerated by CPUID(7,1).EAX[26], it allows to use upper bits of
linear address for meta data storage. Analogous to ARM MTE, but more
flexible.

More info can be found ISE Chap10
https://cdrdv2.intel.com/v1/dl/getContent/671368

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4d2b8d0444..d6d573ca38 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -876,7 +876,7 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "lam", NULL,
             NULL, NULL, NULL, NULL,
         },
         .cpuid = {
-- 
2.31.1


