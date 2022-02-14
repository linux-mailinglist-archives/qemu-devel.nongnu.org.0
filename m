Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2EB4B5AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 21:18:35 +0100 (CET)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhns-0005yN-Vl
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 15:18:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJhjq-0000u4-76
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:14:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nJhjo-0003nH-3G
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 15:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644869659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3/fLVN0f8FmK2BpekjUIonMnz89spwYrYp7oriaLhQ=;
 b=LVrO/0UfbGe/bTgmbx9oj0g5B4HArYJJ/noFZyshJJRngVeFBef8dHfXosJoW9Cx1U+poq
 FbtVZhNzbdisE1cyzcT7L5D9WWIK5LAmtsBRFrBXLFWiaqpujXeSFqbdKDdIVH+9N2bZII
 zNu0orEkyeK6+h9+3iQ5gyD1h0xJde8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-lhyKJ7vzMLiBHqzFwYeU3Q-1; Mon, 14 Feb 2022 15:14:15 -0500
X-MC-Unique: lhyKJ7vzMLiBHqzFwYeU3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32121858E16;
 Mon, 14 Feb 2022 20:14:14 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9A4945C93;
 Mon, 14 Feb 2022 20:14:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] ui: do not create a surface when resizing a GL scanout
Date: Tue, 15 Feb 2022 00:13:37 +0400
Message-Id: <20220214201337.1814787-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220214201337.1814787-1-marcandre.lureau@redhat.com>
References: <20220214201337.1814787-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qemu_console_resize() will create a blank surface and replace the
current scanout with it if called while the current scanout is
GL (texture or dmabuf).

This is not only very costly, but also can produce glitches on the
display/listener side.

Instead, compare the current console size with the fitting console
functions, which also works when the scanout is GL.

Note: there might be still an unnecessary surface creation on calling
qemu_console_resize() when the size is actually changing, but display
backends currently rely on DisplaySurface details during
dpy_gfx_switch() to handle various resize aspects. We would need more
refactoring to handle resize without DisplaySurface, this is left for a
future improvement.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 79a01afd1ea7..365a2c14b809 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2400,13 +2400,12 @@ static void vc_chr_open(Chardev *chr,
 
 void qemu_console_resize(QemuConsole *s, int width, int height)
 {
-    DisplaySurface *surface = qemu_console_surface(s);
+    DisplaySurface *surface;
 
     assert(s->console_type == GRAPHIC_CONSOLE);
 
-    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
-        pixman_image_get_width(surface->image) == width &&
-        pixman_image_get_height(surface->image) == height) {
+    if (qemu_console_get_width(s, -1) == width &&
+        qemu_console_get_height(s, -1) == height) {
         return;
     }
 
-- 
2.34.1.428.gdcc0cd074f0c


