Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6571B44A53F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 04:14:46 +0100 (CET)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkHav-0006gA-1B
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 22:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkHZe-0005U0-7H
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 22:13:26 -0500
Received: from mga12.intel.com ([192.55.52.136]:12436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkHZb-00053W-Ie
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 22:13:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="212400222"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="212400222"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 19:13:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="491490279"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 08 Nov 2021 19:13:15 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 lukasstraub2@web.de, dgilbert@redhat.com
Subject: [PATCH v7 0/2] Optimized some codes and fixed PVM hang when enabling
 auto-converge
Date: Tue,  9 Nov 2021 11:04:53 +0800
Message-Id: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Changes since v1-v6:
    --Reset the state of the auto-converge counters at every checkpoint instead of directly disabling.
    --Remove cpu_throttle_stop from mig_throttle_counter_reset.

The series of patches include:
    Reduced the PVM stop time during checkpoint.
    Fixed the PVM hang when enabling auto-converge feature for COLO.

Rao, Lei (2):
  Reset the auto-converge counter at every checkpoint.
  Reduce the PVM stop time during Checkpoint

 migration/colo.c |  4 ++++
 migration/ram.c  | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++---
 migration/ram.h  |  1 +
 3 files changed, 59 insertions(+), 3 deletions(-)

-- 
1.8.3.1


