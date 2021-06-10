Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A408B3A3790
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 01:02:59 +0200 (CEST)
Received: from localhost ([::1]:52130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrThS-0001gB-OE
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 19:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg3-0007TF-Ph
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:52951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lrTg1-0006zL-Vn
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 19:01:31 -0400
IronPort-SDR: N3VQpNG2HHUExoav32NDiJ6+FE8d3TrBFeQtxO2C5JSXMUD5Q3H7QX1rmSauFO3Z1uUQOjL2zj
 EuEmOjTB7Ijg==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="185796182"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="185796182"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
IronPort-SDR: q40khA96DdrHYPVSl1tvyKLzW+lpTPt9SNJ5p8bf46H3yfbCLj5eOA0jG/Gk8NnEPxKOdy9ab3
 M/k6MbcHb3Qw==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="419888357"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:01:08 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] ui: Add a helper to wait on a dmabuf sync object
Date: Thu, 10 Jun 2021 15:48:32 -0700
Message-Id: <20210610224837.670192-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610224837.670192-1-vivek.kasireddy@intel.com>
References: <20210610224837.670192-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
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
index 49978fdae3..a89f739f10 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -242,6 +242,9 @@ typedef struct DisplayChangeListenerOps {
     /* optional */
     void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,
                                   QemuDmaBuf *dmabuf);
+    /* optional */
+    void (*dpy_gl_wait_dmabuf)(DisplayChangeListener *dcl,
+                               QemuDmaBuf *dmabuf);
     /* required if GL */
     void (*dpy_gl_update)(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
@@ -314,6 +317,8 @@ void dpy_gl_cursor_position(QemuConsole *con,
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


