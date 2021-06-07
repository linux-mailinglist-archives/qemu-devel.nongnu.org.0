Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF839EA41
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 01:41:51 +0200 (CEST)
Received: from localhost ([::1]:41806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqOsP-0006Zu-Q8
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 19:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOow-0001XQ-Ax
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:2273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lqOou-00071e-Ng
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 19:38:14 -0400
IronPort-SDR: k5hr56ETa+gR8+eX6ZVWDrCXvhyWB4ybf8Mj1uygPO1LOfZBxBtSWlSKvZ5S9OP5jNnS7avxpR
 jym53MZ5q2cQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="265889547"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="265889547"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:03 -0700
IronPort-SDR: vygApjwvA54kYmwTmSrRazW+jOYLy7XWVl67oWe119s0txEpYwcwMPc8QVAAdceDr7cN+moaZf
 yTXbpVtOGQUg==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="551403349"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 16:38:02 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/5] ui: Add a helper to wait on a dmabuf sync object
Date: Mon,  7 Jun 2021 16:25:27 -0700
Message-Id: <20210607232530.454435-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607232530.454435-1-vivek.kasireddy@intel.com>
References: <20210607232530.454435-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be called by virtio-gpu in the subsequent patches.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/console.h |  5 +++++
 ui/console.c         | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index b30b63976a..c3dca61c31 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -240,6 +240,9 @@ typedef struct DisplayChangeListenerOps {
     /* optional */
     void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,
                                   QemuDmaBuf *dmabuf);
+    /* optional */
+    void (*dpy_gl_wait_dmabuf)(DisplayChangeListener *dcl,
+                               QemuDmaBuf *dmabuf);
     /* required if GL */
     void (*dpy_gl_update)(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
@@ -312,6 +315,8 @@ void dpy_gl_cursor_position(QemuConsole *con,
                             uint32_t pos_x, uint32_t pos_y);
 void dpy_gl_release_dmabuf(QemuConsole *con,
                            QemuDmaBuf *dmabuf);
+void dpy_gl_wait_dmabuf(QemuConsole *con,
+                        QemuDmaBuf *dmabuf);
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b..b0abfd2246 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1917,6 +1917,16 @@ void dpy_gl_release_dmabuf(QemuConsole *con,
     }
 }
 
+void dpy_gl_wait_dmabuf(QemuConsole *con,
+                        QemuDmaBuf *dmabuf)
+{
+    assert(con->gl);
+
+    if (con->gl->ops->dpy_gl_wait_dmabuf) {
+        con->gl->ops->dpy_gl_wait_dmabuf(con->gl, dmabuf);
+    }
+}
+
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
-- 
2.30.2


