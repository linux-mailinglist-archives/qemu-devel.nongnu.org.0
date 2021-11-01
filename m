Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17794414F6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:07:17 +0100 (CET)
Received: from localhost ([::1]:41602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSLc-0005zV-U4
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJu-0003Bn-7R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:51199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJl-0004GX-MP
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="230918965"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="230918965"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 01:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488541481"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 01:05:08 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v2 0/7] Fixed some bugs and optimized some codes for COLO 
Date: Mon,  1 Nov 2021 15:56:58 +0800
Message-Id: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.65; envelope-from=lei.rao@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Changes since v1:
        --Move the s->rp_state.from_dst_file = NULL behind qemu_close().

The series of patches include:
        Fixed some bugs of qemu crash and segment fault.
        Optimized the function of fill_connection_key.
        Remove some unnecessary code to improve COLO.

Rao, Lei (7):
  Some minor optimizations for COLO
  Fixed qemu crash when guest power off in COLO mode
  Fixed SVM hang when do failover before PVM crash
  colo: fixed 'Segmentation fault' when the simplex mode PVM poweroff
  Removed the qemu_fclose() in colo_process_incoming_thread
  Changed the last-mode to none of first start COLO
  Optimized the function of fill_connection_key.

 migration/colo.c      | 16 +++++-----------
 migration/migration.c |  6 +++++-
 net/colo-compare.c    |  4 ++--
 net/colo.c            | 31 ++++++++++++-------------------
 net/colo.h            |  6 +++---
 net/filter-rewriter.c | 10 +---------
 6 files changed, 28 insertions(+), 45 deletions(-)

-- 
2.30.2


