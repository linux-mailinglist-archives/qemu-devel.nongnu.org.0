Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFEE547F7F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 08:28:00 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0dYN-0008In-3m
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 02:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dOG-0000P2-Q3
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:32802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o0dOE-0005Vn-Q9
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 02:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655101050; x=1686637050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nr+MVTE7DGnhDyn8aP7rASCoalYk1aow0qsTuuKteKY=;
 b=id5EVLT6sr+KE1NrxuCiE1wvHrJw8ThGmsKtNQG2n4CIlcQWHet8RAH/
 9Bc78YA+UT7eq2VoZcFN39NKdLTD01v1kYe20q/rAus4ZzGbEKyWfrohs
 bUTi17comZBNliExEdtvcmNnB5nP3tDwn9j1nL4zgapt5OeNN2eKqz7ot
 8G/5eqw4n0OiFappDKTeZil2bgReVBA+R+s1XgqtoePeP8fAKx/Bw/18c
 YJlaVxB1CcwI0C0L5m7W6upYkT68q93T/5JzBxi2rmn2oQu3uUK3HMrcE
 EyC5BNZ26GtXAkObP2aLtMsWlQ2vv9VWyP/AtXTROTLVNG0H6/DTj/QNR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279229926"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="279229926"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="910205046"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 23:17:19 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 pbonzini@redhat.com, yu.c.zhang@intel.com, chuanxiao.dong@intel.com,
 tina.zhang@intel.com
Subject: [PATCH 3/3] virtio-iommu: Add an assert check in translate routine
Date: Mon, 13 Jun 2022 14:10:10 +0800
Message-Id: <20220613061010.2674054-4-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
References: <20220613061010.2674054-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=zhenzhong.duan@intel.com; helo=mga03.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

With address space switch supported, dma access translation only
happen after endpoint is attached to a non-bypass domain.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 73d5bde9d122..7c122ab95780 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -865,6 +865,10 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     qemu_rec_mutex_lock(&s->mutex);
 
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+
+    if (bypass_allowed)
+        assert(ep && ep->domain && !ep->domain->bypass);
+
     if (!ep) {
         if (!bypass_allowed) {
             error_report_once("%s sid=%d is not known!!", __func__, sid);
-- 
2.25.1


