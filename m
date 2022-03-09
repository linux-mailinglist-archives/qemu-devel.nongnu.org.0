Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F24D2AFA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:54:33 +0100 (CET)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRs5Y-0004Me-EF
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:54:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2Q-0001gq-5F
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:27159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs2N-0000YT-JR
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646815875; x=1678351875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6rUQY0CsuOco7wKmgNlLKzHi1C12R/y5vnOxVJiAwMM=;
 b=D0VzxPSd2PQESntTvTL0IpgpFufC0pCr7OPGynGCp4ppr2x3VjAIamYW
 WJxilJ/tlLe5c5ZnhasKx9lsjqkTb8m0mpLAWAWkvAKmNtSI59DUWJjm8
 HXOooJosTTekuV+SqpKf4sWQB8hNiZrt/VjT+qvYbskxLl+Q7X4UDGVu3
 K+eCKND7zAlEAiT8t3oZHhbOpsJ5glx+4KEdzkQU50yVyAAo86ddIsp1k
 fILyOtptk/T4eVpN5L80TYFIVlNhi0DsLq0NJPh7dfzMxaYdQ650baX0i
 Tuqdbw2+887iJi/xWLtMgepEmByG2ONQLMsjN6cbk/muBB9tdgCOGCGQb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="235532259"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="235532259"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554030823"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:51:09 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH 0/4] COLO net and runstate bugfix/optimization
Date: Wed,  9 Mar 2022 16:38:54 +0800
Message-Id: <20220309083858.58117-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix some COLO related issues in internal stress testing.

Zhang Chen (4):
  softmmu/runstate.c: add RunStateTransition support form COLO to
    PRELAUNCH
  net/colo: Fix a "double free" crash to clear the conn_list
  net/colo.c: No need to track conn_list for filter-rewriter
  net/colo.c: fix segmentation fault when packet is not parsed correctly

 net/colo-compare.c    |  2 +-
 net/colo.c            | 11 +++++++++--
 net/filter-rewriter.c |  2 +-
 net/trace-events      |  1 +
 softmmu/runstate.c    |  1 +
 5 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.25.1


