Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC8258A571
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 06:27:10 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJovV-0004fG-Ia
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 00:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oJotk-0001tH-AX
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 00:25:20 -0400
Received: from mga03.intel.com ([134.134.136.65]:49175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oJoth-0000sI-9m
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 00:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659673517; x=1691209517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=taPtIB3uNfB6muH+RJuffCWquiBOmptwINZYz/dV600=;
 b=Jnq9FEqDLjgqtzjBJ174yd2iB0vo/1hpGLmwHti7/U8gW5aGITNDvtbq
 eW8QewLB7Uib/xjDF8ZAigfibmBCkd/CDDwqntYbosT/DqYO5uVfDHsQt
 GGHrfdMvfSKqHdykFrH/0WOxq/oligM6TNLbvB1hDDS/v9vvxCtxLHTJG
 GCR2JN62b45tWFbv5e6Z0QKkJZXmgMfm5n51zrci7pZC14I/zu/bVx9ZP
 Ox3635tFw7aQAFCwLNRSJpnnSZrS0j5CicSVE0Ioj86x8crV5FBfEcdLb
 nxNk0dQVo+eu8LKKQ+nPyEDJ35R+9LXTdZKdprQIAhTovBNmGb+xmsg3R g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="291341041"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="291341041"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 21:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="631871167"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga008.jf.intel.com with ESMTP; 04 Aug 2022 21:25:12 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com,
	ling xu <ling1.xu@intel.com>
Subject: [PATCH v2 0/2] This patch adds runtime check of AVX512
Date: Fri,  5 Aug 2022 12:25:06 +0800
Message-Id: <20220805042508.1196041-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=ling1.xu@intel.com;
 helo=mga03.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds runtime check of AVX512 on running machine and update
avx512 support for xbzrle_encode_buffer function to accelerate xbzrle
encoding speed.

The runtime check is added in meson.build and meson_options.txt.

The updated AVX512 algorithm is provided in ram.c, xbzrle.h and
xbzrle.c.

The test code is provided in test-xbzrle.c.

Previous discussion is refered below:
https://lore.kernel.org/all/YtlshIteVijWePbd@redhat.com/

ling xu (2):
  Update AVX512 support for xbzrle_encode_buffer function
  Test code for AVX512 support for xbzrle_encode_buffer function

 meson.build              | 211 +++++++++++++++++++++++++++
 meson_options.txt        |  28 ++++
 migration/ram.c          |  41 ++++++
 migration/xbzrle.c       | 181 +++++++++++++++++++++++
 migration/xbzrle.h       |   4 +
 tests/unit/test-xbzrle.c | 307 ++++++++++++++++++++++++++++++++++++---
 6 files changed, 755 insertions(+), 17 deletions(-)

-- 
2.25.1


