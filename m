Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC1E6FED14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 09:44:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px0wW-0000Oi-Cr; Thu, 11 May 2023 03:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1px0wV-0000OZ-21
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1px0wT-0005W7-2a
 for qemu-devel@nongnu.org; Thu, 11 May 2023 03:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683790943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Je6TdesZd9lBeTPL+NNfjcLworc+rDnoCvRANzYzZ90=;
 b=FpMwSDuoZMRFpytQZWuYTNWjxKzYcUJhgySgHlNwBBbLFz7k/qbOfhUyj21utDcJqVRe0Y
 0ftD8CkuOfvH2By8W3VOS00fj9/T6OerwKRob3C7BYJ/IYe9csdQ4IbOzJhnYizkemVCl7
 PbBNW/e+VMgi49iqeTGI2WVWvF5xk34=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-xL-P_JBeOBCeQ76PmIjJZg-1; Thu, 11 May 2023 03:42:21 -0400
X-MC-Unique: xL-P_JBeOBCeQ76PmIjJZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B839867941
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 07:42:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7414492C13;
 Thu, 11 May 2023 07:42:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] ui/sdl2: fix surface_gl_update_texture: Assertion 'gls' failed
Date: Thu, 11 May 2023 11:42:17 +0400
Message-Id: <20230511074217.4171842-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Before sdl2_gl_update() is called, sdl2_gl_switch() may decide to
destroy the console window and its associated shaders.

Fixes:
https://gitlab.com/qemu-project/qemu/-/issues/1644

Fixes: commit c84ab0a5 ("ui/console: optionally update after gfx switch")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/sdl2-gl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index b36ba6415a..cc83c98349 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -67,6 +67,10 @@ void sdl2_gl_update(DisplayChangeListener *dcl,
 
     assert(scon->opengl);
 
+    if (!scon->real_window) {
+        return;
+    }
+
     SDL_GL_MakeCurrent(scon->real_window, scon->winctx);
     surface_gl_update_texture(scon->gls, scon->surface, x, y, w, h);
     scon->updates++;
-- 
2.40.1


