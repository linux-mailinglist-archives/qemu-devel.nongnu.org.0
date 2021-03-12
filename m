Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935B33852B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 06:26:55 +0100 (CET)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKaK5-0006HL-Kh
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 00:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIV-0004kQ-0K
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:15 -0500
Received: from mga03.intel.com ([134.134.136.65]:6468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lKaIR-0006Vc-Gq
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 00:25:14 -0500
IronPort-SDR: +kMhqsXDdoMT158fKyml1R/rXfXDFHql9t42pDxGaY/P6v4aAvLj/syvLyxw7KXyzlwQZas6Fa
 QkyMV5u+Tawg==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="188827043"
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="188827043"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 21:25:03 -0800
IronPort-SDR: av6oq/m14a75AbUNg56RfYHcTSaGsuSfaMD07zNm1nH+PfTLMLgYRVvFTbg+etXByiz/zyiMN6
 9HPvEuN5sR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,242,1610438400"; d="scan'208";a="600481861"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2021 21:25:00 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v2 00/10] Fixed some bugs and optimized some codes for COLO.
Date: Fri, 12 Mar 2021 13:02:53 +0800
Message-Id: <1615525383-59071-1-git-send-email-lei.rao@intel.com>
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
  Optimize the function of packet_new
  Add the function of colo_compare_cleanup
  Reset the auto-converge counter at every checkpoint.
  Reduce the PVM stop time during Checkpoint
  Add the function of colo_bitmap_clear_diry
  Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()

 migration/colo.c      | 10 +++----
 migration/migration.c |  4 +++
 migration/ram.c       | 75 ++++++++++++++++++++++++++++++++++++++++++++++++---
 migration/ram.h       |  1 +
 net/colo-compare.c    | 32 +++++++++++-----------
 net/colo-compare.h    |  1 +
 net/colo.c            |  4 +--
 net/colo.h            |  2 +-
 net/filter-mirror.c   |  8 +++---
 net/filter-rewriter.c |  1 -
 net/net.c             |  4 +++
 softmmu/runstate.c    |  1 +
 12 files changed, 110 insertions(+), 33 deletions(-)

-- 
1.8.3.1


