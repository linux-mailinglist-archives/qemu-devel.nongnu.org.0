Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399743AA931
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:55:33 +0200 (CEST)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiBo-0005F6-0N
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAT-0003Mw-3H
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:12066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAQ-0000Pu-Kv
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:08 -0400
IronPort-SDR: KG5qJbKYitbd9GMKGWBEeLCrSyT58g1bvVG+KMNajdG2+aTlHQ4OzxuvW5OeeIo5oSv6BE7jLg
 rSqn/V+Q/g9w==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414069"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414069"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:53:55 -0700
IronPort-SDR: MlBGwHwZqt+Yi+64vPdM+F+Kuq1Ac2Mu/Yp2g8stZEGGp1k3TYGbWL8A29GWua35n6xSxl4fOi
 J55ivE4EQi0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485121903"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:53:52 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 0/7] Fixed some bugs and optimized some codes for COLO
Date: Thu, 17 Jun 2021 10:47:08 +0800
Message-Id: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.20; envelope-from=lei.rao@intel.com;
 helo=mga02.intel.com
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
Cc: like.xu.linux@gmail.com, "Rao, Lei" <lei.rao@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rao, Lei <lei.rao@intel.com>

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

 migration/colo.c      | 20 +++++++-------------
 migration/migration.c |  6 +++++-
 net/colo-compare.c    |  4 ++--
 net/colo.c            | 31 ++++++++++++-------------------
 net/colo.h            |  6 +++---
 net/filter-rewriter.c | 10 +---------
 6 files changed, 30 insertions(+), 47 deletions(-)

-- 
1.8.3.1


