Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0CA270B9A
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 09:56:51 +0200 (CEST)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJXjm-0004oM-CT
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 03:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kJTXj-00029m-4B
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 23:28:07 -0400
Received: from mga12.intel.com ([192.55.52.136]:53074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kJTXh-0007c9-Iy
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 23:28:06 -0400
IronPort-SDR: 0XfkRL3jEJAPbAXHJyyDtiRJyNQRoHZtV+4rdJ9vuRo6FKIIDYPO3YNdmhnVEESxIO8tp49fGl
 AFW6FvKPFGAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="139574085"
X-IronPort-AV: E=Sophos;i="5.77,277,1596524400"; d="scan'208";a="139574085"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 20:27:55 -0700
IronPort-SDR: 54+t+PZBgIolAo3TVIAfoOhJUofYvDEqel+ypy+wbw5EWDKHjpwXDdut905pOPkWl5bGSvIz58
 imp0jIXDh9BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,277,1596524400"; d="scan'208";a="303579309"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga003.jf.intel.com with ESMTP; 18 Sep 2020 20:27:52 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com
Subject: [PATCH 0/3] Optimized some code for COLO
Date: Fri, 18 Sep 2020 23:10:20 -0400
Message-Id: <1600485023-263643-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 23:27:59
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Sep 2020 03:55:10 -0400
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

Optimized some code for COLO and fixed a qemu crash when guest
shutdown in COLO mode.

leirao (3):
  Optimize seq_sorter function for colo-compare
  Reduce the time of checkpoint for COLO
  Fix the qemu crash when guest shutdown in COLO mode

 migration/ram.c    | 12 ++++++++++++
 net/colo-compare.c |  6 +-----
 softmmu/vl.c       |  1 +
 3 files changed, 14 insertions(+), 5 deletions(-)

--
1.8.3.1


