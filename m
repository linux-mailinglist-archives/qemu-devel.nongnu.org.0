Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BE6D8D6E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 04:26:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkFKZ-000593-LT; Wed, 05 Apr 2023 22:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkFKX-00058p-7Y
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 22:26:29 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pkFKT-0007ey-Rz
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 22:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680747985; x=1712283985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1/QQ0L/2EYjYx/2sosKQK3Lh7PPxpg5Q8UO+mJouMRM=;
 b=bpLUQU/9lJkeVhXkHADz7XLfS+eOCGNZAmiI9scNncqrNgO8eZ5DZV3V
 m8lEwlzH2UJcMGdYHyNKnW64ExaqLQPcqy4/5XwSNkdRjAayVmz95V5PD
 mkL9dCXCrrLy1h56lxgLcpGCN0b9dlSZGjMz2yQJHGOkhAd5byLLF7NhM
 T3B7C6uTp2834WniTfNoD4HreaofpgMyAEKpVAEydV+S/ZSmb78AcO679
 L+Ez08PS/iaZWIsNAQGR2BieCGOIcpLCVeiwxVHrJejP7dPcGf/1JZxX3
 y5t71H+ghJty6g6UrBtDue+YyvgnCBVj/+Uv8LR7wqQ/4+wkuIq7nHUGs g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="322269651"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="322269651"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 19:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751487613"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="751487613"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 19:26:19 -0700
From: Fei Wu <fei2.wu@intel.com>
To: richard.henderson@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
 erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH 0/2] accel/tcg/plugin: host insn size for plugin
Date: Thu,  6 Apr 2023 10:27:49 +0800
Message-Id: <20230406022751.757980-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136; envelope-from=fei2.wu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The translation ratio of host to guest instruction count is one of the
key performance factor of binary translation. It's better to have this
kind of information exported to plugin for analysis. As the host insn
size is not determined at guest->IR time, its address is recorded for
later dereference, and plugin inline mode is not supported.

Here is an example of the output with modified plugin hotblocks:

    pc, tcount, icount, ecount, host isize
    0xffffffff8041ad6c, 1, 9, 130450345, 456
    0xffffffff800084f0, 1, 9, 88273714, 264
    0xffffffff800084e4, 1, 3, 88264146, 135
    0xffffffff8041abd0, 1, 1, 46032689, 123
    0xffffffff8041ab3c, 1, 1, 46021650, 123
    0xffffffff8045ffe8, 1, 5, 40927215, 328

Fei Wu (2):
  accel/tcg/plugin: export host insn size
  plugins/hotblocks: add host insn size

 accel/tcg/plugin-gen.c       |  1 +
 contrib/plugins/hotblocks.c  | 24 +++++++++++++++---------
 include/qemu/plugin.h        |  2 ++
 include/qemu/qemu-plugin.h   |  8 ++++++++
 plugins/api.c                |  5 +++++
 plugins/qemu-plugins.symbols |  1 +
 6 files changed, 32 insertions(+), 9 deletions(-)

-- 
2.25.1


