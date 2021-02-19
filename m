Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2525532012D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:08:30 +0100 (CET)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDwr-00059E-6C
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpW-0003Xk-1A
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpT-0005ew-Of
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zk2DiMd8W+yzUdKnzi0fyYFv+METDCNspMTRwQ4oyG0=;
 b=cCjTbtH9CQPeyZZVqryG01ax1MmjkP1IrpCgaNEhXzBx+7qTePwgQaqaKry1tx+HgjyvKf
 I9VoM40FJM5/Ytd1TQ3dFgM7iI+Pe7cZhZStxajbdNwBPtVqPrmODRuEZP80qbVwPvq25K
 E9RkXN2GaCwmR/mQRtrapuM4j2IqVJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-tmz7IY9oNb2l_z-8iMvY-w-1; Fri, 19 Feb 2021 17:00:48 -0500
X-MC-Unique: tmz7IY9oNb2l_z-8iMvY-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6B4C1005501;
 Fri, 19 Feb 2021 22:00:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61E46100239F;
 Fri, 19 Feb 2021 22:00:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3B8E91800867; Fri, 19 Feb 2021 23:00:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] ui/console: Remove dpy_gl_ctx_get_current
Date: Fri, 19 Feb 2021 23:00:36 +0100
Message-Id: <20210219220036.100654-9-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

It is not used, and it is unlikely that a new use case will emerge
anytime soon because the scope of OpenGL contexts are limited due to
the nature of the frontend, VirGL, processing simple commands from the
guest.

Remove the function and ease implementing a new OpenGL backend a little.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210219094702.90789-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h | 1 -
 ui/gtk-gl-area.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 3c1cd98db8b1..5ae0ad60a600 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -147,7 +147,6 @@ void gd_gl_area_scanout_disable(DisplayChangeListener *dcl);
 void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
                               uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 void gtk_gl_area_init(void);
-QEMUGLContext gd_gl_area_get_current_context(DisplayChangeListener *dcl);
 int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx);
 
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index e7ca73c7b1b3..4e8ee88b9b39 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -239,11 +239,6 @@ void gtk_gl_area_init(void)
     display_opengl = 1;
 }
 
-QEMUGLContext gd_gl_area_get_current_context(DisplayChangeListener *dcl)
-{
-    return gdk_gl_context_get_current();
-}
-
 int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx)
 {
-- 
2.29.2


