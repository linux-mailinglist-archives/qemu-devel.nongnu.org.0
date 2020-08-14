Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682B2447D1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:16:46 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6WlR-0007g9-Co
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9c-0006h4-Of
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42560 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1k6W9a-000642-Rx
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:37:40 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A8CF3FB1BB408885D010;
 Fri, 14 Aug 2020 17:37:35 +0800 (CST)
Received: from opensource.huawei.com (10.175.100.152) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 14 Aug 2020 17:37:24 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 06/12] ui/gtk-gl-area: Plug memleak in
 gd_gl_area_create_context()
Date: Fri, 14 Aug 2020 12:02:35 -0400
Message-ID: <20200814160241.7915-7-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200814160241.7915-1-pannengyuan@huawei.com>
References: <20200814160241.7915-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.152]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:21:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_06_12=1.947,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, Gerd
 Hoffmann <kraxel@redhat.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Receiving error in local variable err, and forgot to free it.
Considering that there is no place to deal with it. Clean up.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-gl-area.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 85f9d14c51..c740a7eb14 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -142,15 +142,14 @@ QEMUGLContext gd_gl_area_create_context(DisplayChangeListener *dcl,
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
     GdkWindow *window;
     GdkGLContext *ctx;
-    GError *err = NULL;
 
     gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     window = gtk_widget_get_window(vc->gfx.drawing_area);
-    ctx = gdk_window_create_gl_context(window, &err);
+    ctx = gdk_window_create_gl_context(window, NULL);
     gdk_gl_context_set_required_version(ctx,
                                         params->major_ver,
                                         params->minor_ver);
-    gdk_gl_context_realize(ctx, &err);
+    gdk_gl_context_realize(ctx, NULL);
     return ctx;
 }
 
-- 
2.18.2


