Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91766082DF
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 02:33:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om0CM-000463-21; Fri, 21 Oct 2022 18:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1olxmV-0003Gy-LN
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 15:34:11 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1olxmT-00063x-Nl
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 15:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666380849; x=1697916849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UidzKKWcIsWvtxtE2MHDAvmKyxwTXvtrcTkX8nOkDz0=;
 b=kfnRLBgYNH59pBTucw5adnDBl2eNtLujRIdqym0wbBd95JVTm0+K0nu5
 IKkj/2X8ncUdIGcmL8gvcAjqazWlXW4nVtNNR42YliScHovS2+tePYAzH
 d4b2fTsUX/4nV74ukrjTvpThSeseZf2diJFsWYAD0uPnhTOXNAHtmTKbs
 wje8K0VexEwTvE+MkgL5AKAppg3hyggWO2Z1L78GO6DZnjIiqnxcneTVK
 Wx6hEPAJ7QbXYcCSnXKwfnlvaijxM//QBBA7jJzHFXSdrHYE1mWELehWa
 nZOvwCXiXGb3/08yg5bOolP2CQpwsEzPpF4IY2oc5+BCFn6ha3YMW5BU/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="287488930"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="287488930"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 12:34:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="959764501"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="959764501"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2022 12:34:02 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH] ui/gtk: prevent ui lock up when dpy_gl_update called again
 before current draw event occurs
Date: Fri, 21 Oct 2022 12:23:15 -0700
Message-Id: <20221021192315.9110-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dongwon.kim@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

A warning, "qemu: warning: console: no gl-unblock within" followed by
guest scanout lockup can happen if dpy_gl_update is called in a row
and the second call is made before gd_draw_event scheduled by the first
call is taking place. This is because draw call returns without decrementing
gl_block ref count if the dmabuf was already submitted as shown below.

(gd_gl_area_draw/gd_egl_draw)

        if (dmabuf) {
            if (!dmabuf->draw_submitted) {
                return;
            } else {
                dmabuf->draw_submitted = false;
            }
        }

So it should not schedule any redundant draw event in case draw_submitted is
already set in gd_egl_fluch/gd_gl_area_scanout_flush.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk-egl.c     | 2 +-
 ui/gtk-gl-area.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 35f917ceb1..e84431790c 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -341,7 +341,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GtkWidget *area = vc->gfx.drawing_area;
 
-    if (vc->gfx.guest_fb.dmabuf) {
+    if (vc->gfx.guest_fb.dmabuf && !vc->gfx.guest_fb.dmabuf->draw_submitted) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
         gtk_widget_queue_draw_area(area, x, y, w, h);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 682638a197..7696df1f6b 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -278,7 +278,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    if (vc->gfx.guest_fb.dmabuf) {
+    if (vc->gfx.guest_fb.dmabuf && !vc->gfx.guest_fb.dmabuf->draw_submitted) {
         graphic_hw_gl_block(vc->gfx.dcl.con, true);
         vc->gfx.guest_fb.dmabuf->draw_submitted = true;
     }
-- 
2.30.2


