Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87094CF337
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:08:47 +0100 (CET)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8QA-0007fo-SH
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:08:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR87y-00017F-Ml
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nR87x-0007WI-6B
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCLbPYQvVDge1/PLwWzLscG+GyCK1zrOBFOmFKi19QU=;
 b=FiJmWURCmh7oEBbJfRGOTPvFQ7jUEAVOKvIutOq79RQB+NAqWf1xRRqc4ELxNPFTZukVGI
 skJTp47I1H4xjueh6ycfRrFGGUa3sOdMxqTdImdQ5lTrQbljVDSVADGRF9i/qPfrfPvK0X
 DSwZV/BbWcTVs/zgWrQrNWE1ieDrtGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-MBgh6PuiM8acqRu6LECmzQ-1; Mon, 07 Mar 2022 02:49:53 -0500
X-MC-Unique: MBgh6PuiM8acqRu6LECmzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 993321800D50;
 Mon,  7 Mar 2022 07:49:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 611BA827A3;
 Mon,  7 Mar 2022 07:49:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/12] ui/console: call gfx_switch() even if the current
 scanout is GL
Date: Mon,  7 Mar 2022 11:46:32 +0400
Message-Id: <20220307074632.238049-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220307074632.238049-1-marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, akihiko.odaki@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

egl-headless depends on the backing surface to be set before texture are
set and updated. Display it (update=true) iff the current scanout kind
is SURFACE.

Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 5bfecea4549e..16a0b0909ba2 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1112,6 +1112,10 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
         return;
     }
 
+    dpy_gfx_create_texture(con, con->surface);
+    displaychangelistener_gfx_switch(dcl, con->surface,
+                                     con->scanout.kind == SCANOUT_SURFACE);
+
     if (con->scanout.kind == SCANOUT_DMABUF &&
         displaychangelistener_has_dmabuf(dcl)) {
         dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
@@ -1126,9 +1130,6 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
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


