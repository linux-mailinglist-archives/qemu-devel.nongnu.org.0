Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64A4EE6FE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 06:03:04 +0200 (CEST)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na8V5-0004iz-85
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 00:03:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RQ-0001yY-0D
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:51135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1na8RN-0002rm-KC
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 23:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648785553; x=1680321553;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gdkz2qHlFWrmKoM33TQDU4tNiew38h9Ieru8iV9N7Qw=;
 b=MonqhwCwWD3ONNhKXjiecE9f/dLWcVz7TCPbp3mMxlkkoAZplGyW+un/
 0IsCUEWSYfGl9b7N3jbcD8eaIRhE0vSpniW0WfLP7DXnuJGW5vLNeBseF
 tM1jZthsZNj5edwADr++MS24g2w79/C9RvtvFQeJMCQbwSoy9qJd2Z+db
 iP/Re8Oq34rzaVf+TeBywNK11OLbrowz+sdvHRV/9TqE49omIPL3EGfBh
 cHzNx/XMr9RHMTAzBFOLKdYUFa9hJ/gqnKmvNq/BiducSN3C7/7xGvuUr
 eYseAK9ZKDIr8m4wE90sqk58A+yu0cOhGoXxuew/0MADyiS44dJYRHw2U w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="242182885"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="242182885"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="567105787"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 20:59:07 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V2 0/4] COLO net and runstate bugfix/optimization
Date: Fri,  1 Apr 2022 11:46:58 +0800
Message-Id: <20220401034702.687057-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

 - V2:
    - Add more comments in patch 2/4 commit log.

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


