Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912945A253A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:59:56 +0200 (CEST)
Received: from localhost ([::1]:46960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRW83-0000v6-25
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oRW5h-0004MK-NZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:57:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:31245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oRW5e-0006YJ-63
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661507846; x=1693043846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kk1Frq0uCwFZxu2TxXpTjMkCUHv3Wia0Yd290FcyGis=;
 b=nYFV02n3DJZGpUNORRp9M1zK67jvvROJtrhmQiiKULvyb/8BDjNyfp5y
 nfSqbULH1yJnsOdGcb3QEsxx/gHqMzASsI+q2FWCwLtotnXh+cCdTty/A
 WOpp/BVSuJEqJLyJDYMAC9odbsZuoDI2/RutIYI53whzWTEZIAjlx9IHM
 oE0g9kIKdpcISFA5oZ2uPQttvXPGZccNbclQWcav53dG0OgiW3hsDYiMW
 Wuk7PKQ0AVtCEe/wI/7kq210rzmG1YNcFhQ8ygfV3u49MC0VPy+ZvC0l/
 QhCYdLvhj+uQ0u4M+W7wkIYygoIsj3QXI7Wb7t5X1Lg/59+eGXQmvsAdU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="295250421"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="295250421"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 02:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; d="scan'208";a="639999907"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga008.jf.intel.com with ESMTP; 26 Aug 2022 02:57:21 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v6 0/2] This patch updates AVX512 support for xbzrle
Date: Fri, 26 Aug 2022 17:57:17 +0800
Message-Id: <20220826095719.2887535-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=ling1.xu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch updates code of avx512 support for xbzrle_encode_buffer
function. We modified code of algorithm and check of avx512. Besides, we provide benchmark in xbzrle-bench.c for performance comparison.

Signed-off-by: ling xu <ling1.xu@intel.com>
Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
Co-authored-by: Jun Jin <jun.i.jin@intel.com>

ling xu (2):
  Update AVX512 support for xbzrle_encode_buffer
  Unit test code and benchmark code

 meson.build                |  16 ++
 meson_options.txt          |   2 +
 migration/ram.c            |  34 ++-
 migration/xbzrle.c         | 124 ++++++++++
 migration/xbzrle.h         |   4 +
 tests/bench/meson.build    |   4 +
 tests/bench/xbzrle-bench.c | 465 +++++++++++++++++++++++++++++++++++++
 tests/unit/test-xbzrle.c   |  39 +++-
 8 files changed, 680 insertions(+), 8 deletions(-)
 create mode 100644 tests/bench/xbzrle-bench.c

-- 
2.25.1


