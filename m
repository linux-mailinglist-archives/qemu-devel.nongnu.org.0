Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE794D2B10
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:57:50 +0100 (CET)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRs8j-0006nA-O5
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:57:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2Q-0001gr-3H
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:27163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2O-0000Ya-13
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646815876; x=1678351876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YLdF6NpOTfWp3qwGIAirD8aN2gGJUzJV8ptPQOvJvkI=;
 b=jIWY2ZUKUhmiXKoiXytBhSlhgZrt2eRxkg1LUvO9sLvMwqJzKx+pwZ5+
 XpQVM1vbD/LgzXxSEXyrAkUsU/C+loCJEneFBuLD/L2LIJvOf7/ln6qGf
 WD2x2aAh4YkEt60KwA4VKAUZ+gQpkA+TjgOxANQDZC50SLkLoL1yA/YGc
 ArmmvZcgq46/tBQCXRHNcavmzYu4hgIJ/Gdy75/+uymeB+MXUDmlnU+y1
 MStFU1+ley3kaWpvFFsEtrhjSORJ8HbT4gGOJnMLgTIGgOxEWFcEExxT8
 Dy9AGUf4qedp+bN4WulvqcONK6M42UcR28ebcNkKygYKdH/y81fSHV4re A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235532265"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="235532265"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554030828"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:11 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 1/4] softmmu/runstate.c: add RunStateTransition support form
 COLO to PRELAUNCH
Date: Wed,  9 Mar 2022 16:38:55 +0800
Message-Id: <20220309083858.58117-2-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309083858.58117-1-chen.zhang@intel.com>
References: <20220309083858.58117-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


