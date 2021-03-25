Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB834872E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:52:32 +0100 (CET)
Received: from localhost ([::1]:59164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPG6p-0005qn-J8
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2b-0000v5-89
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:40258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2Y-0001bh-Hg
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:09 -0400
IronPort-SDR: jmY1iVz3wVHjEIVj1B0XMZZuK+LZlzpEgJq6VVdQgp4p1O+hAPPT+bgfp6THf68ScGBnFDeSZZ
 gp1YuDjDBLsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254823098"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="254823098"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 19:48:03 -0700
IronPort-SDR: AWcXGcy3CcpSHMTWKLYk9+afOzTOUz8U+8fFqzlK+jJGeT4lL7bWO9p0fsST1qmPXe1QsYq/WV
 WeW3vFXLehxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374881370"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 19:48:01 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v4 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Date: Thu, 25 Mar 2021 10:24:43 +0800
Message-Id: <1616639091-28279-3-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

This patch fixes the following:
    qemu-system-x86_64: invalid runstate transition: 'colo' ->'shutdown'
    Aborted (core dumped)

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
---
 softmmu/runstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c..1564057 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -126,6 +126,7 @@ static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
 
     { RUN_STATE_COLO, RUN_STATE_RUNNING },
+    { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
 
     { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
     { RUN_STATE_RUNNING, RUN_STATE_INTERNAL_ERROR },
-- 
1.8.3.1


