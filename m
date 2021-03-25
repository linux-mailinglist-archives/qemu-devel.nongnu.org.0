Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB8C348710
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 03:50:48 +0100 (CET)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPG59-0002Og-84
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 22:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2a-0000uz-UR
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:40249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lPG2U-0001XR-9d
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 22:48:08 -0400
IronPort-SDR: jvl4X++Rhy1yJzsuAfuIczPCbVYxrDw6FQNiv7whvhIDl2F8pyFZLfdis1FvDzjz0z6rm2JIvo
 2+4gIBQFpJZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="254823092"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="254823092"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 19:47:55 -0700
IronPort-SDR: iyk23MZrgw5luum/FW+bu2fj1t4/bmoZFoMDswZVnc5Pf8OL50gOEWKqK7v4nX8SgmlW3eji53
 3PTSEVYGhL1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374881334"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 19:47:50 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v4 00/10] Fixed some bugs and optimized some codes for COLO
Date: Thu, 25 Mar 2021 10:24:41 +0800
Message-Id: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
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

From: Rao, Lei <lei.rao@intel.com>

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
  Add the function of colo_bitmap_clear_diry.
  Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()

 migration/colo.c      | 10 +++----
 migration/migration.c |  4 +++
 migration/ram.c       | 75 ++++++++++++++++++++++++++++++++++++++++++++++++---
 migration/ram.h       |  1 +
 net/colo-compare.c    | 25 ++++++++---------
 net/colo-compare.h    |  1 +
 net/colo.c            | 23 ++++++++++++++++
 net/colo.h            |  1 +
 net/filter-mirror.c   |  8 +++---
 net/filter-rewriter.c |  3 +--
 net/net.c             |  4 +++
 softmmu/runstate.c    |  1 +
 12 files changed, 127 insertions(+), 29 deletions(-)

-- 
1.8.3.1


