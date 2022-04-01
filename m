Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3214EE701
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 06:03:11 +0200 (CEST)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8V8-0004wk-1E
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 00:03:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RR-0001yi-Vq
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:18 -0400
Received: from mga18.intel.com ([134.134.136.126]:51138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RN-0002s0-N5
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648785553; x=1680321553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLdF6NpOTfWp3qwGIAirD8aN2gGJUzJV8ptPQOvJvkI=;
 b=acqzN79DvkANOTYQZUVKidxQLr5ii9YqkhO7FpXP2GBaf9QBv79GgKc2
 2aX6VY/AMAjR4ppPFCTlKCjjDVIbAWQJGBjOYUtA0kTIeqIMlSGvBkxOE
 1rzQB6+/jbWkIxKweCYTkfkca6ZzBrupi+ZEIZ8gRtQ7aFRlQR8h8rnLr
 JK++3m573UUC2Vz6YKKrfBoeVl6cA3+ubwYFtYytEuR1/w1m476rDORTJ
 AakJ2IdpWVMaHbqdhuQyHkVmUx6UkiN0RBflO+LbCE64dD9E4++7OxiSn
 6L1oJOTgYeR1TAEFKFcS7y3B3AB1xMQmYIHYOUo6XsW8J/U30zxUmkXkU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="242182895"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="242182895"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="567105814"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:09 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
Date: Fri,  1 Apr 2022 11:46:59 +0800
Message-Id: <20220401034702.687057-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401034702.687057-1-chen.zhang@intel.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the checkpoint occurs when the guest finishes restarting
but has not started running, the runstate_set() may reject
the transition from COLO to PRELAUNCH with the crash log:

{"timestamp": {"seconds": 1593484591, "microseconds": 26605},\
"event": "RESET", "data": {"guest": true, "reason": "guest-reset"}}
qemu-system-x86_64: invalid runstate transition: 'colo' -> 'prelaunch'

Long-term testing says that it's pretty safe.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 softmmu/runstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index e0d869b21a..c021c56338 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -127,6 +127,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
 
     { RUN_STATE_COLO, RUN_STATE_RUNNING },
+    { RUN_STATE_COLO, RUN_STATE_PRELAUNCH },
     { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
 
     { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
-- 
2.25.1


