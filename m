Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D194CF0B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 05:39:10 +0100 (CET)
Received: from localhost ([::1]:56798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR59J-0007bn-QZ
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 23:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1nR589-0006sN-SV
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 23:37:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:8316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1nR587-0002ib-CV
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 23:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646627875; x=1678163875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GEPWLTv/7bTPoAhnBTjOhiR8oMOKa5y54hoO/ZFmG24=;
 b=QDr7DxLRDmcaBihl5m6smksNklMKxzIK3kedVNiC7IZGbnmqB/8GW113
 VegT4N3bKxew7nR5A7ZRmV2PrONXU8QWDbkblA/qbtF3GEqonz2ek3ql0
 MgMULdrdSB7Fzf3mk0vKvP43W+biQnt4gDOyT0PCEM9OMCkjm1SfZEgho
 5cUDfljftLvzvgZOC58dq1Vrjisgj6QIgsyDSpthhUxdfsXdiodj6sh5t
 aH0qRnlsCEbqWtKhpIjZe1mjUb/muZcV4UrgvkZtqmoQLZKxY6ic1w3PI
 jjpGbP6QuB1+RIBQ5uqbAawVkIrPhy8rgN19u7qLndiqQzsANJ6CgC2mr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="234251360"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="234251360"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 20:37:50 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="494919983"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 20:37:49 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] ui/gtk-egl: Check for a valid context before making EGL
 calls
Date: Sun,  6 Mar 2022 20:21:08 -0800
Message-Id: <20220307042108.296428-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=vivek.kasireddy@intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since not all listeners (i.e VirtualConsoles) of GL events have
a valid EGL context, make sure that there is a valid context
before making EGL calls.

This fixes the following crash seen while launching the VM with
"-device virtio-gpu-pci,max_outputs=1,blob=true -display gtk,gl=on"

No provider of eglCreateImageKHR found.  Requires one of:
EGL_KHR_image
EGL_KHR_image_base

Fixes: 7cc712e9862ff ("ui: dispatch GL events to all listeners")

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk-egl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e3bd4bc274..31175827d0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -244,6 +244,10 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dcl,
 #ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (!vc->gfx.ectx || !vc->gfx.esurface) {
+        return;
+    }
+
     eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
                    vc->gfx.esurface, vc->gfx.ectx);
 
@@ -269,6 +273,10 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,
 #ifdef CONFIG_GBM
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
+    if (!vc->gfx.ectx || !vc->gfx.esurface) {
+        return;
+    }
+
     if (dmabuf) {
         egl_dmabuf_import_texture(dmabuf);
         if (!dmabuf->texture) {
-- 
2.35.1


