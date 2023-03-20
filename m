Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AFF6C1340
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFX7-0007i3-H3; Mon, 20 Mar 2023 09:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peFX2-0007hX-Sy
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peFX1-0005Jw-Bk
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679318793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pgGPI/+0JyDkYCw+7zcejWHVsLLFVD8wPcdS0SsY7CA=;
 b=HJz52/Nq28+OGOKAVw+Zr/1zt2eGbHJizeFkIYvEtqM9wA9l5dk2cGdKpKgQZSJyWUo70l
 4/tLAcZnxid70vo2KM32ZHboCLTBcc8rxCE2dsxiYMdTMvJwxE9JSQqO0SPTx7uyDAAYuk
 muW7T0MhinEWr3gVnoqU1PEzp1kwZ34=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-_OmjG6fnPmSpJfspsvc_Rg-1; Mon, 20 Mar 2023 09:26:29 -0400
X-MC-Unique: _OmjG6fnPmSpJfspsvc_Rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E168828C0;
 Mon, 20 Mar 2023 13:26:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F49840C6E67;
 Mon, 20 Mar 2023 13:26:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, shentey@gmail.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] ui/gtk: fix cursor moved to left corner
Date: Mon, 20 Mar 2023 17:26:24 +0400
Message-Id: <20230320132624.1612464-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Do not attempt to move the pointer if the widget is not yet realized.
The mouse cursor is placed to the corner of the screen, on X11 at least,
as x_root and y_root are then miscalculated. (this is not reproducible
on Wayland, because Gtk doesn't implement device warping there)

This also fixes the following warning at start:
qemu: Gdk: gdk_window_get_root_coords: assertion 'GDK_IS_WINDOW (window)' failed

Fixes: 6effaa16ac98 ("ui: set cursor position upon listener
registration")
Reported-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index fd82e9b1ca..e9564f2baa 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -450,7 +450,8 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
     GdkDisplay *dpy;
     gint x_root, y_root;
 
-    if (qemu_input_is_absolute()) {
+    if (!gtk_widget_get_realized(vc->gfx.drawing_area) ||
+        qemu_input_is_absolute()) {
         return;
     }
 
-- 
2.39.2


