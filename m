Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72F4D9A63
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:30:51 +0100 (CET)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5O6-0005QN-FI
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:30:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nU53U-0006U2-HC
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nU53P-0005v3-Ug
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoA6tJMIW8LIVPDF3JpGU+IYeGHULFuVDGVSk3XtsRA=;
 b=A+3WtIih9toP/v0BLKpFOHkISeipj8PULw1UwD+sqHb11fgDcOW6cGKj7acI1dVn2bQuFH
 KnNOgjMEuTQUtR9kSVLPhh0v36qwIFdeIDueulflADqQbw4+1lygqqizIkCkAbZyN/f/qG
 5IirqV6BJiHw9OSRgAGFyd7yKG+cdMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-1P2WlcnhN4uNJufBz05wVA-1; Tue, 15 Mar 2022 07:09:22 -0400
X-MC-Unique: 1P2WlcnhN4uNJufBz05wVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F92B18E52D8;
 Tue, 15 Mar 2022 11:09:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8094EC53741;
 Tue, 15 Mar 2022 11:09:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/12] ui/console: call gfx_switch() even if the current
 scanout is GL
Date: Tue, 15 Mar 2022 15:07:39 +0400
Message-Id: <20220315110739.2095676-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
References: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

egl-headless depends on the backing surface to be set before texture are
set and updated. Display it (update=true) iff the current scanout kind
is SURFACE.

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 3b5664535625..da434ce1b2f7 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1114,6 +1114,10 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
         return;
     }
 
+    dpy_gfx_create_texture(con, con->surface);
+    displaychangelistener_gfx_switch(dcl, con->surface,
+                                     con->scanout.kind == SCANOUT_SURFACE);
+
     if (con->scanout.kind == SCANOUT_DMABUF &&
         displaychangelistener_has_dmabuf(dcl)) {
         dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
@@ -1128,9 +1132,6 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
                                          con->scanout.texture.y,
                                          con->scanout.texture.width,
                                          con->scanout.texture.height);
-    } else if (con->scanout.kind == SCANOUT_SURFACE) {
-        dpy_gfx_create_texture(con, con->surface);
-        displaychangelistener_gfx_switch(dcl, con->surface, TRUE);
     }
 }
 
-- 
2.35.1.273.ge6ebfd0e8cbb


