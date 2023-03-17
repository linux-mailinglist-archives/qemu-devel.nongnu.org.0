Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449046BE25B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 08:59:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd4z5-0006LO-1e; Fri, 17 Mar 2023 03:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pd4yy-0006LB-JN
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 03:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pd4yv-0000v1-6g
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 03:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679039910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J6Wuq+7GYJTxOVxGkMQVIC+icVoILnwp5Xyh8kcEQUI=;
 b=dYkSqjNF6voneFaGhl2tjn5HC3e+GVk48tv9+h31Qd5lR2V1qXuy13pZxJwwMwagAY45L2
 PfS/W04/UPVFjZFRW9ROuPd8SvS8F+pU4Bd/7iuEn28f6WQt0V2JC6f0gR/pERxHLnuSXC
 xmjA3ponkZyseQhALOvVZlSyuLBZp2w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-MxP8EklwN6CMv82VUD2Z_Q-1; Fri, 17 Mar 2023 03:58:27 -0400
X-MC-Unique: MxP8EklwN6CMv82VUD2Z_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A88611C08975
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:58:27 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B571410F1C;
 Fri, 17 Mar 2023 07:58:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ui/gtk: fix error message regression
Date: Fri, 17 Mar 2023 11:58:23 +0400
Message-Id: <20230317075823.953430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit 6effaa16 ("ui: set cursor position upon listener
registration") a new error message shows up when starting qemu with gtk
backend:
qemu: Gdk: gdk_window_get_root_coords: assertion 'GDK_IS_WINDOW (window)' failed

Like many display listener callbacks, skip code if the widget is not yet
realized.

Fixes: 6effaa16 ("ui: set cursor position upon listener registration")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 57ae32474c..f3105796f8 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -450,7 +450,8 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
     GdkDisplay *dpy;
     gint x_root, y_root;
 
-    if (qemu_input_is_absolute()) {
+    if (qemu_input_is_absolute() ||
+        !gtk_widget_get_realized(vc->gfx.drawing_area)) {
         return;
     }
 
-- 
2.39.2


