Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8004C51CB9A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 23:48:04 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmjKN-0002MP-73
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 17:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nmjHJ-0000ZR-Et
 for qemu-devel@nongnu.org; Thu, 05 May 2022 17:44:53 -0400
Received: from mga07.intel.com ([134.134.136.100]:8240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nmjHG-0005lf-W0
 for qemu-devel@nongnu.org; Thu, 05 May 2022 17:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651787090; x=1683323090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vv4NsczvE/67lLb/aL92WyvAokqKaIf+KWPEYQR39E0=;
 b=gxQUZBqTagwna+BtxOxXbB2qBHT4WCHIWlIfkQ2VljDIDknI9oWMuLJz
 hflQ50iDPlQKmQglKLENtaCiQJ3kGxuo/97tV59Obp5egv+OnrrRo3KOx
 sLEmY2hOPMnxBmm9BxdRWL39h4+3KedRtMoYl3Cx0myFGWJ7rNaBh8ExZ
 PwO/zq2EbmucZrDZeOfBROgQI7QT/ZXJyh5gwVObFq/jarfhIFCecji6W
 JA7LJSZNk1D4OqY/ElkNVMQ1E9GWppCKsJ6RiOxFRF26H2X1svrZck8Wz
 2N3NYK3pYDF3z5YN3VP9AQOiOz1FxpX4w9dVGdo83pwytl7bHeRORZ4bu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331249691"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="331249691"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="568786683"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 05 May 2022 14:44:44 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH] virtio-gpu: update done only on the scanout associated with
 rect
Date: Thu,  5 May 2022 14:40:30 -0700
Message-Id: <20220505214030.4261-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=dongwon.kim@intel.com; helo=mga07.intel.com
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

It only needs to update the scanouts containing the rect area
coming with the resource-flush request from the guest.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 529b5246b2..165ecafd7a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -514,6 +514,9 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
         for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
             scanout = &g->parent_obj.scanout[i];
             if (scanout->resource_id == res->resource_id &&
+                rf.r.x >= scanout->x && rf.r.y >= scanout->y &&
+                rf.r.x + rf.r.width <= scanout->x + scanout->width &&
+                rf.r.y + rf.r.height <= scanout->y + scanout->height &&
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
-- 
2.30.2


