Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3C24D4759
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:53:44 +0100 (CET)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIIZ-0008Ve-FH
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nSHtx-00042y-Ss
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:28:18 -0500
Received: from mga02.intel.com ([134.134.136.20]:32247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nSHtw-0001Xx-2H
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915296; x=1678451296;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2jQu8Hqcpn0IJCogOTqJ7nLPJ+WLrVDpUM1d1ldsy64=;
 b=CDNJrZa93DMYO/z+g0inHjSJXskyaJu0qATY1x30TjPt9/xT+weDbUb/
 MueKwbnRgu58ywO9k2xYOZAnhN5/BJ3EXXcu2cmKIEP+b6d4Dq+LG7r1x
 080GuKvAOM2A3vOZhn9XY/B/P2c91nKXCzrh6RTp9OzPb6rgJN5RTc34G
 dVl7wVA5+2u8yG2Ykb7sS6Bz0tX11vTU1GFazzaXNqcPj5Wc8X6toGtO4
 LRKEQvU0Z36sGO8agJXIRy0PYkygwG9/4YGYjRW8EXLV0Bqp0++KjVSCa
 52zHkkmGAJewQP8/4gLlRtxRskPajdvpquBMlNw7vdvDbmxbNXkgmG6R6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242682991"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="242682991"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="596647429"
Received: from lxy-dell.sh.intel.com ([10.239.159.55])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2022 04:28:11 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH RESEND v1 0/2] i386: Make PIT and PIC the property of common
 x86 base machine type
Date: Thu, 10 Mar 2022 20:28:09 +0800
Message-Id: <20220310122811.807794-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=xiaoyao.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xiaoyao.li@intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For PIT, it's straightforward to merge microvm::pit and
pc_machine::pit_enabled into x86ms::pit

For PIC, move microvm::pic to x86ms:pic, which gives PC machine the
ability to dis-/en-able PIC and it's the preparation for future TDX
support.

---
Resend:
 - collect Reviewed-by;
 - rebase to 2048c4eba2b4 ("Merge remote-tracking branch 'remotes/philmd/tags/pmbus-20220308' into staging")

Xiaoyao Li (2):
  hw/i386: Make pit a property of common x86 base machine type
  hw/i386: Make pic a property of common x86 base machine type

 hw/i386/microvm.c         | 54 ++-------------------------------------
 hw/i386/pc.c              | 24 +++--------------
 hw/i386/pc_piix.c         |  4 ++-
 hw/i386/pc_q35.c          |  4 ++-
 hw/i386/x86.c             | 50 ++++++++++++++++++++++++++++++++++++
 include/hw/i386/microvm.h |  4 ---
 include/hw/i386/pc.h      |  2 --
 include/hw/i386/x86.h     |  4 +++
 8 files changed, 65 insertions(+), 81 deletions(-)

-- 
2.27.0


