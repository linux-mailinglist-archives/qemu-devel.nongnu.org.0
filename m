Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45332F4222
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:57:43 +0100 (CET)
Received: from localhost ([::1]:50630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzWLu-00018p-Vz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWHm-0005fI-Td
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:26 -0500
Received: from mga09.intel.com ([134.134.136.24]:58686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWHk-0003vO-6V
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:26 -0500
IronPort-SDR: 3DIil1h01lfywwv4f8Fx/TsKwxkJ2bwmItBonriwWZQjQl+WLaD2+aUDRFRkCmURMRsP/ADEip
 8hjq+kaXanBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178289664"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="178289664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:53:15 -0800
IronPort-SDR: Dr7ieftt6X6NQvxHmh8Vak4d225cxDkrN9pIW4RjkpUjlSsqO7GzKlPTbtiJXWDTh4forxtxdt
 ic3miHPb1hJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="464750270"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 18:53:13 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 00/10] Fixed some bugs and optimized some codes for COLO
Date: Wed, 13 Jan 2021 10:46:25 +0800
Message-Id: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.24; envelope-from=lei.rao@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leirao <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The series of patches include:
	Fixed some bugs of qemu crash.
	Optimized some code to reduce the time of checkpoint.
	Remove some unnecessary code to improve COLO.

Rao, Lei (10):
  Remove some duplicate trace code.
  Fix the qemu crash when guest shutdown during checkpoint
  Optimize the function of filter_send
  Remove migrate_set_block_enabled in checkpoint
  Optimize the function of packet_new
  Add the function of colo_compare_cleanup
  Disable auto-coverge before entering COLO mode.
  Reduce the PVM stop time during Checkpoint
  Add the function of colo_bitmap_clear_diry
  Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()

 migration/colo.c      |  6 -----
 migration/migration.c | 20 +++++++++++++++-
 migration/ram.c       | 65 ++++++++++++++++++++++++++++++++++++++++++++++++---
 net/colo-compare.c    | 32 ++++++++++++-------------
 net/colo-compare.h    |  1 +
 net/colo.c            |  4 ++--
 net/colo.h            |  2 +-
 net/filter-mirror.c   |  8 +++----
 net/filter-rewriter.c |  1 -
 net/net.c             |  4 ++++
 softmmu/runstate.c    |  1 +
 11 files changed, 110 insertions(+), 34 deletions(-)

-- 
1.8.3.1


