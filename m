Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA7A597F0C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:11:25 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZga-0000VU-MX
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSY-00085V-Bt
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSV-0001it-OR
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 02:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660805810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAaTv33dU5A2LoduERLL5IsesXWJoqzG/AZHNOM0uqQ=;
 b=TaypA4DputbNeJswjtzNMva7AY2bXEL26SIs9+MednHxkiqjhN+uBeDacwKj65ae4lz7mI
 1vUdySKH+Y629x7mcn389c4RNT0OW7yKaoj7RElOnxgEBUJQb/IlBQFDU31Q06p3EQVTSA
 29cyC0vnmMVadoHour7WMZCjVNktjwU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-g76p7Vf4MQuCv0Q6x_ax5A-1; Thu, 18 Aug 2022 02:56:47 -0400
X-MC-Unique: g76p7Vf4MQuCv0Q6x_ax5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96C05811E80;
 Thu, 18 Aug 2022 06:56:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A27A440CFD05;
 Thu, 18 Aug 2022 06:56:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-s390x@nongnu.org
Subject: [PULL 3/3] ui/console: fix qemu_console_resize() regression
Date: Thu, 18 Aug 2022 10:56:31 +0400
Message-Id: <20220818065631.324170-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220818065631.324170-1-marcandre.lureau@redhat.com>
References: <20220818065631.324170-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220725115815.2461322-1-marcandre.lureau@redhat.com>
---
 ui/console.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index e139f7115e..765892f84f 100644
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
2.37.1


