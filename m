Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40933852D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:27:00 +0100 (CET)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaKB-0006WK-6H
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIY-0004oT-0K
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:18 -0500
Received: from mga05.intel.com ([192.55.52.43]:4921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIW-0006dL-7c
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:17 -0500
IronPort-SDR: AAkeyOZP9IRx2GSiulsY/LjGWAjKMqHEm0cWwnzb5M6k9re8gDp3bGrsg5uTB/GknEMhH5xlW3
 f1CfduyTaQuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="273826899"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="273826899"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:13 -0800
IronPort-SDR: FdjtkUkQaq3JoFQ3qhdkpNVTh2hiwO04lQYhncrPuWcD30YjT2UxQ/Oiqa7zjBGSjAA4f4xsS+
 9ohZFSysW+xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481902"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:10 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 02/10] Fix the qemu crash when guest shutdown during
 checkpoint
Date: Fri, 12 Mar 2021 13:02:55 +0800
Message-Id: <1615525383-59071-3-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
References: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
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
---
 softmmu/runstate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 2874417..884f8fa 100644
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


