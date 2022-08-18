Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778EB59811F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 11:55:47 +0200 (CEST)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOcFe-0000gL-5G
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 05:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oObwh-0007mZ-Vj
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:36:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:6877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oObwe-0003zT-Bx
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 05:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660815368; x=1692351368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g18CGq64Me8Y5sF016ulpRCWcypT0xhMkIi1XRNJDr4=;
 b=hPmYr/ALee8Pj0yCCwkxh9llnNxB5PJv1wJ3KHopzESj6omQ5ivgfEph
 RnqmQN5oLU4CBgyVgEnp8ER/0XuEBpJ30/+t0VvphfaZeXGFXOfFZzraX
 MWPRG4OWF2ZkXxsC3XdGq6Hexqr0imvDH6l7VMS5az8naHouHVqCA394P
 oBZ1q7T+SEthmz3jjDTla3PSylYZBb2F3r71/r+OuHa9qoiE6kQlfEaFH
 otwFUTSznL+Cxh+/lzHP3ct5r07Cm8W7MbyWEjZMerM6CCnLd80mNIyMh
 49zLxLOeevZaLiWN1EWpw2sitcBdca+4oPJ35iMIWnn2Yw1GqhvuoGCvv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="292713276"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292713276"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 02:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584141589"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 02:36:02 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v5 0/2] This patch updates AVX512 support for xbzrle
Date: Thu, 18 Aug 2022 17:35:57 +0800
Message-Id: <20220818093559.2342594-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=ling1.xu@intel.com;
 helo=mga14.intel.com
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

This patch updates code of avx512 support for xbzrle_encode_buffer
function. We modified runtime check of avx512 and simplified algorithm.
Besides, we provide benchmark in xbzrle-bench.c for performance
comparison.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>

ling xu (2):
  Update AVX512 support for xbzrle_encode_buffer
  Test code and benchmark code

 meson.build                |  16 ++
 meson_options.txt          |   2 +
 migration/ram.c            |  35 ++-
 migration/xbzrle.c         | 130 +++++++++++
 migration/xbzrle.h         |   4 +
 tests/bench/meson.build    |   4 +
 tests/bench/xbzrle-bench.c | 468 +++++++++++++++++++++++++++++++++++++
 tests/unit/test-xbzrle.c   |  39 +++-
 8 files changed, 690 insertions(+), 8 deletions(-)
 create mode 100644 tests/bench/xbzrle-bench.c

-- 
2.25.1


