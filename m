Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C757957CE51
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:56:56 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXbj-0003vc-KT
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oETTK-0005MA-IB
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:31:58 -0400
Received: from mga17.intel.com ([192.55.52.151]:1766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oETTH-0000x9-Qj
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658399515; x=1689935515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hvQNhh+UVCwVIAajR1WmLdaNYqWUdzazlec0Qdmh6d0=;
 b=B95yYEWzFKfIjHPcMKkPfzUPUOr5naJZrgmE6wR5exKW2gRX0Gw9TaVQ
 cjHE0jZOueH2fYSGA0tG/iCCOB4zCFltMYSypIq/babmIQGqCZqzymsCZ
 8m7hxXP4N2dRjkh9UyaJMtaAQRVIYmdzM9k1eKRTaPB1lnmUKNxsIjEYH
 dn+/istLK9LpTSpgdIcNj0WaCGyyE1z+TfNNhNl+Js+QGO9f8JrapjFoG
 xdoMu95pIqsu9k/4Tl2nA2ZE370EW2vBDlf0WQKxyBqDqbg0B2eLJg7G6
 shRsR2OmEoH2qSYhLhJaZjg4/6MNhbY3A94kqV7egwhrqRVBTfaYc8qEC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="267407915"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="267407915"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 03:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="598415336"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by orsmga002.jf.intel.com with ESMTP; 21 Jul 2022 03:31:51 -0700
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com,
	ling xu <ling1.xu@intel.com>
Subject: [PATCH 0/1] This patch provides AVX512 support for
 xbzrle_encode_buffer function
Date: Thu, 21 Jul 2022 18:31:46 +0800
Message-Id: <20220721103147.96608-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=ling1.xu@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 21 Jul 2022 10:50:32 -0400
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

This patch adds avx512 support for xbzrle_encode_buffer function to accelerate xbzrle encoding speed. 
The specific avx512 implementation is provided in qemu/migration/xbzrle.c. 
We provide AVX512 intrinsic support in qemu/configure file to enable avx512 in complier.
And added unit test called "test_encode_decode_random" is provided in qemu/tests/u nits/test-xbzrle.c.

ling xu (1):
  Add AVX512 support for xbzrle_encode_buffer function

 configure                | 434 ++++++++++++++++++++++++++++++++++++++-
 migration/ram.c          |   6 +
 migration/xbzrle.c       | 177 ++++++++++++++++
 migration/xbzrle.h       |   4 +
 tests/unit/test-xbzrle.c | 307 +++++++++++++++++++++++++--
 5 files changed, 908 insertions(+), 20 deletions(-)

-- 
2.25.1


