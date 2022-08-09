Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E146A58D57A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:38:12 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKke-0001Ua-0d
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLKfb-0004MS-MI
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:32:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:40281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLKfZ-0008Rp-Ru
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660033977; x=1691569977;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Bm94HDPFmab4XwRs/CBTsKRHc3txfnQ79Gg/KPuJe4=;
 b=EQ++C3xiulzk0qIYT4MZZwYnTumVnHDHQnCYcXJK1JXxb7JTlbwpjT35
 CfnZgX5aoc/UVwWU9SltPtzU/iI44hqh0ABZVU506RXptX6Y1vpx69Xp5
 Xqh9BWuoqBb1IqHcur7Tl+6OVF8+Ogf51YMaci7EcASn+OlrPi+oEhYl0
 F2e2p24AVvRorZYiW+mwVQm/qUpjkz2dTgOVJHVTXiHLI1NSyn+ZnX3d+
 OykElZx+LwdbuHVxQugrkZxTI+ENZ13WZlGQhhW9wrOOHsnS3/Jy5FGo2
 k3HeC4FKXgnENexIc52b4iweK3QtW8AkSzuhze2GM5LzypoUt2KJNCNsJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="270561001"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="270561001"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="633251138"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga008.jf.intel.com with ESMTP; 09 Aug 2022 01:32:52 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v4 0/2] This patch updates AVX512 support for xbzrle
Date: Tue,  9 Aug 2022 16:32:47 +0800
Message-Id: <20220809083249.1646952-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=ling1.xu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


This patch updates code of AVX512 support for xbzrle_encode_buffer
fucntion to accelerate xbzrle encoding speed.

The runtime check code is kept in meson.build and meson_options.txt
without modifying.

The updated AVX512 algorithm is provided in ram.c, xbzrle.c and
xbzrle.h.

The test code is updated in test-xbzrle.c.
 

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com> 
Co-authored-by: Jun Jin <jun.i.jin@intel.com>

ling xu (2):
  Update AVX512 support for xbzrle_encode_buffer function
  Update test code of AVX512 support for xbzrle_encode

 meson.build              |  16 ++
 meson_options.txt        |   2 +
 migration/ram.c          |  42 +++-
 migration/xbzrle.c       | 181 ++++++++++++++++
 migration/xbzrle.h       |   4 +
 tests/unit/test-xbzrle.c | 458 ++++++++++++++++++++++++++++++++++++++-
 6 files changed, 699 insertions(+), 4 deletions(-)

-- 
2.25.1


