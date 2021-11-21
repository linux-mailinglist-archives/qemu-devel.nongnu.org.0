Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3C458596
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 18:48:06 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moqwe-0005ks-Pi
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 12:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1moqvF-0004rw-0h
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 12:46:37 -0500
Received: from mga03.intel.com ([134.134.136.65]:10627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1moqvC-0004Cd-7s
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 12:46:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234623075"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800"; d="scan'208";a="234623075"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 09:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800"; d="scan'208";a="673814403"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 21 Nov 2021 09:46:30 -0800
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: graphic_hw_gl_flushed after closing dmabuf->fence_fd
Date: Sun, 21 Nov 2021 09:22:37 -0800
Message-Id: <20211121172237.14937-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dmabuf often becomes invalid right after unblocking pipeline
and graphic_hw_gl_flushed in case a new scanout blob is submitted
because the dmabuf associated with the current guest scanout is
freed after swapping.

So both graphic_hw_gl_block and graphic_hw_gl_flushed should be
executed after closing fence_fd for the current dmabuf.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 ui/gtk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 7abe1a69d8..2a3a9db13f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -589,11 +589,11 @@ void gd_hw_gl_flushed(void *vcon)
     VirtualConsole *vc = vcon;
     QemuDmaBuf *dmabuf = vc->gfx.guest_fb.dmabuf;
 
-    graphic_hw_gl_block(vc->gfx.dcl.con, false);
-    graphic_hw_gl_flushed(vc->gfx.dcl.con);
     qemu_set_fd_handler(dmabuf->fence_fd, NULL, NULL, NULL);
     close(dmabuf->fence_fd);
     dmabuf->fence_fd = -1;
+    graphic_hw_gl_block(vc->gfx.dcl.con, false);
+    graphic_hw_gl_flushed(vc->gfx.dcl.con);
 }
 
 /** DisplayState Callbacks (opengl version) **/
-- 
2.30.2


