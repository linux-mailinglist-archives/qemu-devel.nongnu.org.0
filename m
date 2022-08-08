Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48E58C468
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 09:52:36 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKxYm-0008SX-TI
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 03:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oKxVS-0004K9-Tt
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:48:58 -0400
Received: from mga11.intel.com ([192.55.52.93]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oKxVO-0007gG-Om
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 03:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659944934; x=1691480934;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ixj+8ci74yfPIDw+O9BD8NmImkJ4uRJ8To9nzQ2fVHc=;
 b=k7Lai78TzE0w2nH1wP328K5OAQ7PSviz7wLG582rvXGwQKfTGNyXmf9B
 kPtEbl4xk+FyHgzclmhOeKprjJkugv1S65ZVAFzRcBC0OW4Njd3qeaJmf
 qiOPxTUzdxeTk/hviemBUN+TN9mKbvtLP7HlMGQgq3WZaeOn8zZpTQ9Ca
 D2xumo3b/icidQDoyJPFKcZw3YtIxQDHcq26oq4cUojKvhp1eFKD+acrH
 x5+joENqA4sRJa7pGd2nMKAapgzD16zoGOgknRnmY1A0FiNC0xwctaHbR
 DPvhRF/NyprDrGD2rqwvcujQ3LUkdAMPNurp9imMrXBFAZCUmm+f31Nas w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="288093873"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="288093873"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 00:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; d="scan'208";a="600993100"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2022 00:48:40 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com,
	ling xu <ling1.xu@intel.com>
Subject: [PATCH v3 0/2] This patch updates runtime check of AVX512
Date: Mon,  8 Aug 2022 15:48:35 +0800
Message-Id: <20220808074837.1484760-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=ling1.xu@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch updates runtime check of AVX512 and update avx512 support for
xbzrle_encode_buffer function to accelerate xbzrle encoding speed.

The runtime check is updated in meson.build and meson_options.txt.

The updated AVX512 algorithm is provided in ram.c, xbzrle.c and
xbzrle.h.

The test code is provided in test-xbzrle.c.

Previous discussion is refered below:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg903520.html

ling xu (2):
  Update AVX512 support for xbzrle_encode_buffer function
  Test code for AVX512 support for xbzrle_encode_buffer

 meson.build              |  16 ++
 meson_options.txt        |   2 +
 migration/ram.c          |  41 ++++++
 migration/xbzrle.c       | 181 +++++++++++++++++++++++
 migration/xbzrle.h       |   4 +
 tests/unit/test-xbzrle.c | 307 ++++++++++++++++++++++++++++++++++++---
 6 files changed, 534 insertions(+), 17 deletions(-)

-- 
2.25.1


