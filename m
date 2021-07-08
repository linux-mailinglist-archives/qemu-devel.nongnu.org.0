Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0674B3BF981
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:59:04 +0200 (CEST)
Received: from localhost ([::1]:46810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SgJ-000661-2c
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1Sdh-0003Nv-1B
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:56:21 -0400
Received: from mga04.intel.com ([192.55.52.120]:3405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1m1Sdc-0002wg-1k
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:56:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="207667274"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="207667274"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 04:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="487530648"
Received: from icx-2s.bj.intel.com ([10.240.192.119])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2021 04:56:01 -0700
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] remote/memory: Replace share parameter with ram_flags
Date: Thu,  8 Jul 2021 19:51:57 +0800
Message-Id: <20210708115157.6907-1-yang.zhong@intel.com>
X-Mailer: git-send-email 2.29.2.334.gfaefdd61ec
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120; envelope-from=yang.zhong@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
qemu_ram_alloc_from_fd()")

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
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


