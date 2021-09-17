Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFE40EE53
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 02:22:06 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR1dl-00019Q-Ab
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 20:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1Xc-0003bf-7I
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:56721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1XZ-0002rA-KB
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="222744004"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="222744004"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 17:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="434688363"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 17:15:27 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] ui/gtk-egl: guest fb texture needs to be regenerated when
 reinitializing egl
Date: Thu, 16 Sep 2021 17:13:20 -0700
Message-Id: <20210917001320.6515-5-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917001320.6515-1-dongwon.kim@intel.com>
References: <20210917001320.6515-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If guest fb is backed by dmabuf (blob-resource), the texture bound to the
old context needs to be recreated in case the egl is re-initialized (e.g.
new window for vc is created in case of detaching/reattaching of the tab)

v2: call egl_dmabuf_release_texutre instead of putting 0 to dmabuf->texture
    (Vivek Kasireddy)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk-egl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 7c9629d6cc..8c55ed18fb 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -142,6 +142,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
             surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
             surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
         }
+        if (vc->gfx.guest_fb.dmabuf) {
+            egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
+            gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
+        }
     }
 
     graphic_hw_update(dcl->con);
-- 
2.17.1


