Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A1341378
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:33:02 +0100 (CET)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5sj-00022S-9q
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5qb-0000VI-RE
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:30:49 -0400
Received: from mga01.intel.com ([192.55.52.88]:35067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5qZ-0002pZ-Vl
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:30:49 -0400
IronPort-SDR: Lchf+fJiuKPOvRrgWFqnIQi723Jb7zyU3ja5wCZV1TwclWAO40BkDfwJhylS4ag/6yQSKmxBdx
 NX/E7Np1he5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="209835198"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="209835198"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:30:42 -0700
IronPort-SDR: 9f52LagskpvqXNMy6Nxa0FbUZNxhYn4ffoXjQqdOS56u/32p+Pa5mb4OSznvZtXQl22oWJBeqF
 wVIEV/Z0a6DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606448818"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 20:30:40 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v3 00/10] Fixed some bugs and optimized some codes for COLO
Date: Fri, 19 Mar 2021 11:07:38 +0800
Message-Id: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.88; envelope-from=lei.rao@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rao, Lei <lei.rao@intel.com>

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
 migration/ram.c       | 76 +++++++++++++++++++++++++++++++++++++++++++++++++--
 migration/ram.h       |  1 +
 net/colo-compare.c    | 25 ++++++++---------
 net/colo-compare.h    |  1 +
 net/colo.c            | 23 ++++++++++++++++
 net/colo.h            |  1 +
 net/filter-mirror.c   |  8 +++---
 net/filter-rewriter.c |  3 +-
 net/net.c             |  4 +++
 softmmu/runstate.c    |  1 +
 12 files changed, 128 insertions(+), 29 deletions(-)

-- 
1.8.3.1


