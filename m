Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91D57FEBD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:04:08 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFwog-0007zo-Pd
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oFwjE-000402-Ro
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oFwjB-0001fy-2n
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 07:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658750303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gh1CF9/skxxtps1WwbLkaNJbKti0bR9znmqXATo6rcQ=;
 b=LgYgJZzZrctg1tE4HAY1PkI6H3tOjolPgQjL64z/I1S9bm0QKIYl+VsoGu3ZLpQx3zfk8D
 Ji+UVlY6GneLzPy179oRKEzyb4PYYqv9vMAQ3hH4caGM0FYSjnGLgEMCIFg5zZuimbRUKK
 XSBcTXiIS38Y1SU5vl9E3YJkkHHcdMU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-Z7e9RGT7MxKUAawP3wpCiA-1; Mon, 25 Jul 2022 07:58:20 -0400
X-MC-Unique: Z7e9RGT7MxKUAawP3wpCiA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBF4F3801F4B;
 Mon, 25 Jul 2022 11:58:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0053A492C3B;
 Mon, 25 Jul 2022 11:58:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, mark.cave-ayland@ilande.co.uk,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] ui/console: fix qemu_console_resize() regression
Date: Mon, 25 Jul 2022 15:58:15 +0400
Message-Id: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The display may be corrupted when changing screen colour depth in
qemu-system-ppc/MacOS since 7.0.

Do not short-cut qemu_console_resize() if the surface is backed by vga
vram. When the scanout isn't set, or it is already allocated, or opengl,
and the size is fitting, we still avoid the reallocation & replace path.

Fixes: commit cb8962c1 ("ui: do not create a surface when resizing a GL scanout")

Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index e139f7115e1f..765892f84f1c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2575,11 +2575,13 @@ static void vc_chr_open(Chardev *chr,
 
 void qemu_console_resize(QemuConsole *s, int width, int height)
 {
-    DisplaySurface *surface;
+    DisplaySurface *surface = qemu_console_surface(s);
 
     assert(s->console_type == GRAPHIC_CONSOLE);
 
-    if (qemu_console_get_width(s, -1) == width &&
+    if ((s->scanout.kind != SCANOUT_SURFACE ||
+         (surface && surface->flags & QEMU_ALLOCATED_FLAG)) &&
+        qemu_console_get_width(s, -1) == width &&
         qemu_console_get_height(s, -1) == height) {
         return;
     }
-- 
2.37.0.rc0


