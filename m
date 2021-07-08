Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1293BF622
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 09:18:10 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1OIT-0004qO-5B
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 03:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1OH1-0003EZ-T3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:16:39 -0400
Received: from mga14.intel.com ([192.55.52.115]:25572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1OGz-0005Zk-Bz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 03:16:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209275139"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="209275139"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 00:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="492013188"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by orsmga001.jf.intel.com with ESMTP; 08 Jul 2021 00:16:19 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] remote/memory: Replace share parameter with ram_flags
Date: Thu,  8 Jul 2021 15:12:16 +0800
Message-Id: <20210708071216.87862-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=yang.zhong@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, pbonzini@redhat.com, philmd@redhat.com,
 peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The commit(d5015b80) missed the ram_flags to memory_region_init_ram_from_fd()
in the hw/remote/memory.c.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/remote/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 472ed2a272..6e21ab1a45 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
         subregion = g_new(MemoryRegion, 1);
         memory_region_init_ram_from_fd(subregion, NULL,
                                        name, sysmem_info->sizes[region],
-                                       true, msg->fds[region],
+                                       RAM_SHARED, msg->fds[region],
                                        sysmem_info->offsets[region],
                                        errp);
 
-- 
2.29.2.334.gfaefdd61ec


