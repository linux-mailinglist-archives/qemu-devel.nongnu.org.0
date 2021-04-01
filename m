Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F13510A6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:12:09 +0200 (CEST)
Received: from localhost ([::1]:56682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsQy-0003Ry-E6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPe-0001yX-Sb
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:10:46 -0400
Received: from mga18.intel.com ([134.134.136.126]:52001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lRsPc-0005lr-FL
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:10:46 -0400
IronPort-SDR: QbkvxWN/s4gHNna5evFxj+szBU0U49/H3/RjwZO+kWKP8e648vDjG8gCF/w36Da2odwuvZ4n9P
 v/WSta+QznqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="179714483"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="179714483"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 01:10:31 -0700
IronPort-SDR: pzyqmt9TzSfaCT6BU2j4OEqJ5/TGkB0aai3bP2Y12ObG5981IgyAdEu9XIPfxTRpbceGrvx+va
 knCeXXO1iW4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439119069"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2021 01:10:29 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v5 00/10] Fixed some bugs and optimized some codes for COLO
Date: Thu,  1 Apr 2021 15:47:19 +0800
Message-Id: <1617263249-54501-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
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
Cc: "Rao,Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rao,Lei <lei.rao@intel.com>

Changes since v4:
        --Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD in colo_bitmap_clear_dirty.
        --Modify some minor issues about variable definition.
        --Add some performance test data in the commit message.

Changes since v3:
        --Remove cpu_throttle_stop from mig_throttle_counter_reset.

Changes since v2:
        --Add a function named packet_new_nocopy.
        --Continue to optimize the function of colo_flush_ram_cache.

Changes since v1:
        --Reset the state of the auto-converge counters at every checkpoint instead of directly disabling.
        --Treat the filter_send function returning zero as a normal case.

The series of patches include:
        Fixed some bugs of qemu crash.
        Optimized some code to reduce the time of checkpoint.
        Remove some unnecessary code to improve COLO.

Rao, Lei (10):
  Remove some duplicate trace code.
  Fix the qemu crash when guest shutdown during checkpoint
  Optimize the function of filter_send
  Remove migrate_set_block_enabled in checkpoint
  Add a function named packet_new_nocopy for COLO.
  Add the function of colo_compare_cleanup
  Reset the auto-converge counter at every checkpoint.
  Reduce the PVM stop time during Checkpoint
  Add the function of colo_bitmap_clear_dirty
  Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()

 migration/colo.c      | 10 +++----
 migration/migration.c |  4 +++
 migration/ram.c       | 83 +++++++++++++++++++++++++++++++++++++++++++++++++--
 migration/ram.h       |  1 +
 net/colo-compare.c    | 25 +++++++---------
 net/colo-compare.h    |  1 +
 net/colo.c            | 23 ++++++++++++++
 net/colo.h            |  1 +
 net/filter-mirror.c   |  8 ++---
 net/filter-rewriter.c |  3 +-
 net/net.c             |  4 +++
 softmmu/runstate.c    |  1 +
 12 files changed, 135 insertions(+), 29 deletions(-)

-- 
1.8.3.1


