Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1303D6988
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 00:29:08 +0200 (CEST)
Received: from localhost ([::1]:35976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m895v-0003lE-60
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 18:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m894g-0001jV-Tg
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:27:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:11578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m894b-00077k-T9
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 18:27:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="209216064"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="209216064"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 15:27:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="474148873"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2021 15:27:38 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtio-gpu: call dpy_gl_frame_counter at every guest
 scanout flush
Date: Mon, 26 Jul 2021 15:25:51 -0700
Message-Id: <20210726222551.28795-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210726222551.28795-1-dongwon.kim@intel.com>
References: <20210726222551.28795-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=dongwon.kim@intel.com;
 helo=mga11.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dpy_gl_frame_counter needs to be called for guest scanout frame count
to calculate and display the performance figure - ups, the guest FB
update per seconds.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index e183f4ecda..722869864a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -523,6 +523,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
+                dpy_gl_count_frame(scanout->con, true);
                 return;
             }
         }
@@ -566,6 +567,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                        extents->x1, extents->y1,
                        extents->x2 - extents->x1,
                        extents->y2 - extents->y1);
+        dpy_gl_count_frame(scanout->con, true);
 
         pixman_region_fini(&region);
         pixman_region_fini(&finalregion);
-- 
2.17.1


