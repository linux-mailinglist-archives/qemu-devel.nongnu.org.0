Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030633CD6C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:41:15 +0100 (CET)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2SA-0007vj-8r
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PT-0006Cj-Kt
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PR-0004k0-Uq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slQRAQnwb8e497B+A+MYPijsPTYoxhqlaDg2Qs1YWUI=;
 b=UAgBvJvLjLFDaqF/v0I4bzZIoEvXaMLn3UEHn0btCPZ9c8PDpsUJUX1mCouGetlbYnCKPS
 Jdzt0tLeUrSuIzdjS76atQGLrhMhBZkkHXiLaKC7+gvPCCORECF8TWfsrIJLd1yHp1yyii
 IJQlTlAxLs26IxwiBSuosoi3RcLTSGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-uBlOH5SSP3qISf4zZrJ8XA-1; Tue, 16 Mar 2021 01:38:22 -0400
X-MC-Unique: uBlOH5SSP3qISf4zZrJ8XA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8531C100C618;
 Tue, 16 Mar 2021 05:38:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE4B762A0C;
 Tue, 16 Mar 2021 05:38:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 489EF180063D; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] opengl: Do not convert format with glTexImage2D on
 OpenGL ES
Date: Tue, 16 Mar 2021 06:38:06 +0100
Message-Id: <20210316053813.1719442-5-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

OpenGL ES does not support conversion from the given data format
to the internal format with glTexImage2D.

Use the given data format as the internal format, and ignore
the given alpha channels with GL_TEXTURE_SWIZZLE_A in case the
format contains alpha channels.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210219094803.90860-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console-gl.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/ui/console-gl.c b/ui/console-gl.c
index 0a6478161fed..7c9894a51d99 100644
--- a/ui/console-gl.c
+++ b/ui/console-gl.c
@@ -73,11 +73,20 @@ void surface_gl_create_texture(QemuGLShader *gls,
     glBindTexture(GL_TEXTURE_2D, surface->texture);
     glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT,
                   surface_stride(surface) / surface_bytes_per_pixel(surface));
-    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB,
-                 surface_width(surface),
-                 surface_height(surface),
-                 0, surface->glformat, surface->gltype,
-                 surface_data(surface));
+    if (epoxy_is_desktop_gl()) {
+        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB,
+                     surface_width(surface),
+                     surface_height(surface),
+                     0, surface->glformat, surface->gltype,
+                     surface_data(surface));
+    } else {
+        glTexImage2D(GL_TEXTURE_2D, 0, surface->glformat,
+                     surface_width(surface),
+                     surface_height(surface),
+                     0, surface->glformat, surface->gltype,
+                     surface_data(surface));
+        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_SWIZZLE_A, GL_ONE);
+    }
 
     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
-- 
2.29.2


