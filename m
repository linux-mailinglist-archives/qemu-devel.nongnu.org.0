Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291866EA482
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:18:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppl1F-0007qf-Cz; Fri, 21 Apr 2023 03:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ppl0q-0007om-Nj
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:16:59 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <weijiang.yang@intel.com>)
 id 1ppl0o-0004Zs-Vv
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682061414; x=1713597414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mVOyobHqS70/bnDemHJljxCFKnPUn+13x7a8gc3MjyM=;
 b=CTWCDExv1jiFPNr8amJ4tKJVRxmMoZiPPhqnQFLds6VZnq1SIewp0BBp
 KyAMt/0mG/KXcOCzgzWgfQR/P2mAIDxnvoLFTgszDQZiJ95TOGc3uG91X
 AI5keGAxElbmkjDuRcVcv9hDrOBH3vCGFKigjtucYQou0Lsuulx5DpJY8
 ywiHpEzXuWZzFxj8efca17HnuHQruFkVD2STLBpQtD1dsqUP+C4h7dASI
 M4yxq7rRPAmeHphxLFELyAsX7+xUB6RDAUOqAaXPYDYhNaMLbGwgae+HO
 QC0hvlC7ewdNGrYveayNH3hEqwdSJH55lAuIIgIjl2CKp6NEmuL0uX+oL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326260528"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="326260528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="938385322"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938385322"
Received: from embargo.jf.intel.com ([10.165.9.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 00:16:39 -0700
From: Yang Weijiang <weijiang.yang@intel.com>
To: pbonzini@redhat.com, mtosatti@redhat.com, seanjc@google.com,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	weijiang.yang@intel.com
Subject: [PATCH 0/4] Enable VMM userspace support for CET virtualization
Date: Fri, 21 Apr 2023 00:12:23 -0400
Message-Id: <20230421041227.90915-1-weijiang.yang@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=weijiang.yang@intel.com; helo=mga17.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These are VMM userspace enabling patches for CET virtualization.
Currently CET user mode SHSTK/IBT and kernel mode IBT are supported.
supervisor SHSTK are not supported now, so related MSRs support
are not included in this series.

Yang Weijiang (4):
  target/i386: Enable XSAVES support for user mode CET states
  target/i386: Add CET MSRs access interfaces
  target/i386: Enable CET states migration
  target/i386: Advertise CET flags in feature words

 target/i386/cpu.c     | 47 ++++++++++++++++++-------
 target/i386/cpu.h     | 23 ++++++++++++
 target/i386/kvm/kvm.c | 44 +++++++++++++++++++++++
 target/i386/machine.c | 81 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+), 12 deletions(-)

base-commit: c283ff89d11ff123efc9af49128ef58511f73012
-- 
2.27.0


