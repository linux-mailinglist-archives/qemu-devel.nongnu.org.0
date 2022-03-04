Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105F4CD765
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:12:06 +0100 (CET)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9bB-0003U6-Js
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:12:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rX-0005Tz-GE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8rV-0003QQ-OF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2h1ELJiTAe2kno7BGPFP7lqi+SRruAWDb3ZkkVobtY=;
 b=g3KlrK6DqGiNQK0LzMxvEK9UW+6ipgR6LC091uKlXi/smNUYAkVPwzL94njTkUglzOyM2t
 9v60obIug7zukxmEZTdeBAwswye8VTYpaWIQXYT03mnysmJV0JfHR8yFldKTpaxDKMGz8X
 fGIK/extIqxMoI7W9HYMYDAYYC6qJL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-74EwTDLBPHK7sxxd7ltDOQ-1; Fri, 04 Mar 2022 09:24:43 -0500
X-MC-Unique: 74EwTDLBPHK7sxxd7ltDOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472701854E21;
 Fri,  4 Mar 2022 14:24:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF842866ED;
 Fri,  4 Mar 2022 14:24:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F81D18009BD; Fri,  4 Mar 2022 15:21:25 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/35] ui: do not create a surface when resizing a GL scanout
Date: Fri,  4 Mar 2022 15:21:18 +0100
Message-Id: <20220304142123.956171-31-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
References: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Message-Id: <20220214201337.1814787-4-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
2.35.1


