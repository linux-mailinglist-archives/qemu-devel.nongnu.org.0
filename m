Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E15B2BD8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 03:52:12 +0200 (CEST)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWTBj-00025m-5a
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 21:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oWTA1-0008EW-RM
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 21:50:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:35246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oWT9y-0007CV-OF
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 21:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662688222; x=1694224222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xPOUvGxgKRY1bcefU/gta7OtaOqwY8TXGvT2VjOu85U=;
 b=AgOdQZzbF5QD+yPSX+9qCDTM/2WKhNa/jL0PIOi3EAIIm7zTbhklcHUD
 IlPsFRn5ctmbaoBmSNhgh5x4owrxCMNQSckM2m9WSo19yKxEznI4h8kZb
 zUtjOFCTXdaLzevSduoljRPC48BBbLbA7u1bljNCigOYTs43VP0MKvwVJ
 TKj2I9IGIH4bsiPZ2YG3RjQ4A1hkj3svUeaotgKpelV4gwjo+hnyY8Tet
 o+g3q76x1ZWRbBT0lx+8w/thyAnhnzvZZ9+cOCN9Q3wHDX42Mr+J1W1il
 EX2sDR3Y1oayGHiVyqq0fVc5kXpO2+UtDvSayc7Q202Ea2H7O/T/Axy1X w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298174537"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="298174537"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 18:50:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="704237924"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2022 18:50:18 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] virtio-gpu: update scanout if there is any area covered by
 the rect
Date: Thu,  8 Sep 2022 18:40:52 -0700
Message-Id: <20220909014052.7297-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=dongwon.kim@intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The scanout is currently updated only if the whole rect is inside the
scanout space. This is not a correct condition because the scanout should
be updated even a small area in the scanout space is covered by the rect.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 hw/display/virtio-gpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 20cc703dcc..5e15c79b94 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -515,9 +515,10 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
         for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
             scanout = &g->parent_obj.scanout[i];
             if (scanout->resource_id == res->resource_id &&
-                rf.r.x >= scanout->x && rf.r.y >= scanout->y &&
-                rf.r.x + rf.r.width <= scanout->x + scanout->width &&
-                rf.r.y + rf.r.height <= scanout->y + scanout->height &&
+                rf.r.x < scanout->x + scanout->width &&
+                rf.r.x + rf.r.width >= scanout->x &&
+                rf.r.y < scanout->y + scanout->height &&
+                rf.r.y + rf.r.height >= scanout->y &&
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
-- 
2.20.1


