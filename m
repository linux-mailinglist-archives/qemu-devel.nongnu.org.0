Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60115596F8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:46:36 +0200 (CEST)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ftb-0000ux-GY
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4fry-00004v-NP
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:44:54 -0400
Received: from mga18.intel.com ([134.134.136.126]:29556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4frv-0000aa-O9
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:44:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656063891; x=1687599891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hqh7B9lXJfh9EdU4g7K0uWXCsw8OKzt/txp/WA2Ep2U=;
 b=gWJmlFFbK8uevPibKXTBHLVICQCkpPUeSxvsE7cBgvurf8RA9q65ysL0
 XWFEHCnGgaK9BKgsU24ZlPVkXtFPM50Iv+bupAL1kE5YuUFrAvI46g5YM
 TsQXDoF4MAXg4aMZDd4iTAANgVAnAf6VfK4h+HDDL0eRraxRNGvwnJz8N
 Zdt9KFeEAXKIFz3Yset/0d32ojDjp+XROjDrvhyR5dIfklR04INojmyW2
 ebTnPFbcCYCn3kIPQY2agTx8TwB7E5leW/vn+0mnuvBaZhY2Qy5W3uvIn
 2aIYRuvAwUMAsH7CjGgtDJFvE1Q8xQGuTjccx7mhvAwHHNDNfCamaAQHL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="264005281"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="264005281"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 02:44:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="645199021"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 02:44:47 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: eric.auger@redhat.com,
	mst@redhat.com,
	jean-philippe@linaro.org
Subject: [PATCH] virtio-iommu: Fix migration regression
Date: Fri, 24 Jun 2022 17:37:40 +0800
Message-Id: <20220624093740.3525267-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We also need to switch to the right address space on dest side
after loading the device status. DMA to wrong address space is
destructive.

Fixes: 3facd774962fd ("virtio-iommu: Add bypass mode support to assigned device")
Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 08b227e828f8..281152d338f4 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1322,6 +1322,14 @@ static int iommu_post_load(void *opaque, int version_id)
     VirtIOIOMMU *s = opaque;
 
     g_tree_foreach(s->domains, reconstruct_endpoints, s);
+
+    /*
+     * Memory regions are dynamically turned on/off depending on
+     * 'config.bypass' and attached domain type if there is. After
+     * migration, we need to make sure the memory regions are
+     * still correct.
+     */
+    virtio_iommu_switch_address_space_all(s);
     return 0;
 }
 
-- 
2.25.1


