Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE625EE930
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 00:10:55 +0200 (CEST)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odfGV-0002kZ-Pn
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 18:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1odfEo-0001Et-It
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:09:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:57765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1odfEl-0006VB-8H
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664402943; x=1695938943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WWcHPVaVKXkgmO3RUWTbVYim8cuwlGWvVQO76JbWYG8=;
 b=hYN34g868ft5Yf7fya+ekOP5Mll4xMKgMyx1zhRqPDpHk6Q+Eo2/ygsY
 n8fYRbcSQaYElA09I4p/ojmibBhzITJXkenP08UnM0wYfKbwLW9sz+lfS
 2+EBWR2eKA5YzFuIF1FqYh2VmmUFICTE5mB8sqWNF5jqd2TSar4a7NRc0
 hngUxIiBoKJwGatJgOHOdeEzcVByNQD5iYK3PhPWu1lCtGEgX/eiC0weR
 PdAhA4x2w5uebidkC/IwD0qsqr20MCCPZb7hWOyfmUbGmV5NwOJXORCfp
 EC5c5LL336KE9eRja0aKY/eNmXk+v4h7w90heOY3Lf47eAbSa6usoKRXe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="388008609"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="388008609"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 15:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="624316255"
X-IronPort-AV: E=Sophos;i="5.93,353,1654585200"; d="scan'208";a="624316255"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 28 Sep 2022 15:08:36 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ui/gtk-egl: egl context needs to be unbound in the end of
 gd_egl_switch
Date: Wed, 28 Sep 2022 14:58:05 -0700
Message-Id: <20220928215805.4661-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A thread often fails to bind an egl context to itself after guest VM is
rebooted because the context is still owned by another thread. It is not
very clear what condition makes this happen but this can be prevented
by unbinding the context from the thread in the end of gd_egl_switch.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk-egl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index b5bffbab25..35f917ceb1 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -195,6 +195,9 @@ void gd_egl_switch(DisplayChangeListener *dcl,
     if (resized) {
         gd_update_windowsize(vc);
     }
+
+    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
+                   EGL_NO_CONTEXT);
 }
 
 QEMUGLContext gd_egl_create_context(DisplayGLCtx *dgc,
-- 
2.20.1


