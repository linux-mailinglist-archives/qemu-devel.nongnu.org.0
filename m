Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB64439D6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:35:46 +0100 (CET)
Received: from localhost ([::1]:51224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Jh-0004qy-BF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mi2lX-0005yv-2x
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:00:27 -0400
Received: from mga05.intel.com ([192.55.52.43]:37802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mi2lU-0004gB-Ks
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 19:00:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="317590704"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="317590704"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 16:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="577405049"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2021 16:00:16 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] ui/gtk-egl: guest fb texture needs to be regenerated when
 reinitializing egl
Date: Tue,  2 Nov 2021 15:36:31 -0700
Message-Id: <20211102223632.20466-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102223632.20466-1-dongwon.kim@intel.com>
References: <20211102133750.2s5elsswxtkfbn5y@sirius.home.kraxel.org>
 <20211102223632.20466-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.30.2


