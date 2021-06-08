Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADE39F109
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:35:12 +0200 (CEST)
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXCZ-0007oM-43
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8Q-0003sI-JT
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:30:59 -0400
Received: from mga07.intel.com ([134.134.136.100]:62324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8O-000084-77
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:30:54 -0400
IronPort-SDR: WSaqhRpaiGE6XFACRPHlyzqwJHNAF9VXp/OoPKLlyaqqIdDWCQlZcrv2o5gJt0VCDOvpK57yLO
 Wqna9PsfAJQw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268653419"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268653419"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:39 -0700
IronPort-SDR: n80AieZseYkQNbJcbsTPKTlX4fXvue8GwJLX0E/Et+EjJJnx2BL40bC17e0a4AsR2QPeCkyLxR
 7HiXDlX61Yyg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="481862883"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:38 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 0/7] COLO proxy patch
Date: Tue,  8 Jun 2021 16:23:24 +0800
Message-Id: <20210608082331.1949117-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=chen.zhang@intel.com; helo=mga07.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,
Please help me merge the COLO proxy patch to net branch.

Thanks
Chen

Rao, Lei (7):
  Remove some duplicate trace code.
  Fix the qemu crash when guest shutdown during checkpoint
  Optimize the function of filter_send
  Remove migrate_set_block_enabled in checkpoint
  Add a function named packet_new_nocopy for COLO.
  Add the function of colo_compare_cleanup
  Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()

 migration/colo.c      |  6 ------
 migration/migration.c |  4 ++++
 net/colo-compare.c    | 25 +++++++++++--------------
 net/colo-compare.h    |  1 +
 net/colo.c            | 25 +++++++++++++++++--------
 net/colo.h            |  1 +
 net/filter-mirror.c   |  8 ++++----
 net/filter-rewriter.c |  3 +--
 net/net.c             |  4 ++++
 softmmu/runstate.c    |  1 +
 10 files changed, 44 insertions(+), 34 deletions(-)

-- 
2.25.1


