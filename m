Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFE62C2A3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKMF-0007X7-Ad; Wed, 16 Nov 2022 10:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1ovKM5-0007RM-PK
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:29:38 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1ovKM2-0004YR-UB
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668612574; x=1700148574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CHrJT6JOAUa4EJCcy1i8EfDYB5/Ji24Lq33ZF47ce8E=;
 b=KxTo/CweN86ESiuBFZTppjXl9FkPhdawsc7VOB6ILT6AnRcnJ5otvc3e
 idjjICdaAjLzvoOkbgH/Tm12Dig1Qd9uqkEf/FBiSK3Y3Yyqgt/IxCx/S
 EDchsLymAPQfPn25OP4jxXquYQJMevF4tbfkE7zIS8S3RrgH6YnwwyKRL
 jq96si5FzrJYTeGFrv1px235yCViADatgpSowiKfkf/6pcHTMzG1wh5Jy
 r0fXKPlD/aR7b0xcBnWAjDjucrZafzvP86+/0v83J59pUc5U/V46igikT
 EnwyEf/M+HmX6wunyvsTtSoL5FJZLedeXzxArkuZYaN1Q2/ZUtyvw/QvT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="300099479"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="300099479"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 07:29:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="702911286"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="702911286"
Received: from xuling-b360m-d3h.sh.intel.com ([10.239.82.110])
 by fmsmga008.fm.intel.com with ESMTP; 16 Nov 2022 07:29:28 -0800
From: ling xu <ling1.xu@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, ling xu <ling1.xu@intel.com>,
 Zhou Zhao <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>
Subject: [PATCH v7 0/2] Update AVX512 support for xbzrle and CI failure
Date: Wed, 16 Nov 2022 23:29:21 +0800
Message-Id: <20221116152923.1087185-1-ling1.xu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=ling1.xu@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch updates code of avx512 support for xbzrle_encode_buffer function. 
We mainly modified code in xbzrle-bench.c for addressing CI failure.

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
 tests/bench/xbzrle-bench.c | 469 +++++++++++++++++++++++++++++++++++++
 tests/unit/test-xbzrle.c   |  39 ++-
 8 files changed, 684 insertions(+), 8 deletions(-)
 create mode 100644 tests/bench/xbzrle-bench.c

-- 
2.25.1


