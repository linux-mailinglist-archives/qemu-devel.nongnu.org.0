Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6018039F105
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:34:44 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXC7-0006l1-0B
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8W-0003vK-O3
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:31:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:25331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8P-0000Dh-E4
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:31:00 -0400
IronPort-SDR: wslG2XT47xsVf+pJNZyEP2ib/ZNrqoFwfsKV4qQuCQ5tmQahsjAgyYXsRv1DsfzsA9HZENBK0Y
 tzakdVIw0mrg==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="184485394"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="184485394"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:44 -0700
IronPort-SDR: jb9ugDyoX9c52Vq+XLWABnrseESUN9IXresqbIz8iCqDJ2Z/mA96DzLY85TA9V/ohuAiYVsxDT
 lTud7PZSv2eQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="481862909"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:42 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 2/7] Fix the qemu crash when guest shutdown during checkpoint
Date: Tue,  8 Jun 2021 16:23:26 +0800
Message-Id: <20210608082331.1949117-3-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608082331.1949117-1-chen.zhang@intel.com>
References: <20210608082331.1949117-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 "Rao, Lei" <lei.rao@intel.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

This patch fixes the following:
    qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown'
    Aborted (core dumped)

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 softmmu/runstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c6a2..15640572c0 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -126,6 +126,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
 
     { RUN_STATE_COLO, RUN_STATE_RUNNING },
+    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
 
     { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
     { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },
-- 
2.25.1


