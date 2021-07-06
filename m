Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B0E3BDFCF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:37:40 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0udH-0006JT-EX
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m0ucF-0005f7-Ka
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:36:35 -0400
Received: from mga14.intel.com ([192.55.52.115]:13555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m0ucC-0005k3-Up
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:36:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209031809"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="209031809"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="449387375"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by orsmga007.jf.intel.com with ESMTP; 06 Jul 2021 16:36:21 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] ui/gtk-egl: guest fb texture needs to be regenerated when
 reinitializing egl
Date: Tue,  6 Jul 2021 16:34:45 -0700
Message-Id: <20210706233445.7094-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703002809.26753-3-dongwon.kim@intel.com>
References: <20210703002809.26753-3-dongwon.kim@intel.com>
Received-SPF: pass client-ip=192.55.52.115; envelope-from=dongwon.kim@intel.com;
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
Cc: Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If guest fb is backed by dmabuf (blob-resource), the texture bound to the
old context needs to be recreated in case the egl is re-initialized (e.g.
new window for vc is created in case of detaching/reattaching of the tab)

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk-egl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 32516b806c..5dd7c7e1f5 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -129,6 +129,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
             surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
             surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
         }
+        if (vc->gfx.guest_fb.dmabuf) {
+            vc->gfx.guest_fb.dmabuf->texture = 0;
+            gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
+        }
     }
 
     graphic_hw_update(dcl->con);
-- 
2.17.1


