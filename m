Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29B478E80
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:53:02 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEbV-0001ud-Rj
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myER3-0002Sg-EP
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:42:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myER1-0001iw-VZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVIEwc4U/GyNxdlw3OLMiafyh68EowCHnLZunJbM8js=;
 b=UAaZyJ5S61t7X7datofCUr0E7OYBntF8xLr/Cj85pNskDUiiSBi/y15HEeaoytjIqlbABC
 C9eY5Lh4xokw0vhiMA/AZGs08HCLmkm5Mpmpqg3VxCHXU9+in4BNC4xK/S3ZChBDz/rEdc
 TfJoRkIfHkxsEPLQuH9svKUfAq22r64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-AZBl5F21N6G-GG1SGY_Ujg-1; Fri, 17 Dec 2021 09:42:10 -0500
X-MC-Unique: AZBl5F21N6G-GG1SGY_Ujg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECA448015CD;
 Fri, 17 Dec 2021 14:42:08 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4C9D78DD2;
 Fri, 17 Dec 2021 14:41:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 13/36] ui: add a gl-unblock warning timer
Date: Fri, 17 Dec 2021 18:37:33 +0400
Message-Id: <20211217143756.1831099-14-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Similar to the one that exists for Spice, so we can investigate if
something is locked.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index 39f7b66baf54..fcc4fe6a0aa0 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -80,6 +80,7 @@ struct QemuConsole {
     int dcls;
     DisplayChangeListener *gl;
     int gl_block;
+    QEMUTimer *gl_unblock_timer;
     int window_id;
 
     /* Graphic console state.  */
@@ -233,8 +234,14 @@ void graphic_hw_update(QemuConsole *con)
     }
 }
 
+static void graphic_hw_gl_unblock_timer(void *opaque)
+{
+    warn_report("console: no gl-unblock within one second");
+}
+
 void graphic_hw_gl_block(QemuConsole *con, bool block)
 {
+    uint64_t timeout;
     assert(con != NULL);
 
     if (block) {
@@ -250,6 +257,14 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
         return;
     }
     con->hw_ops->gl_block(con->hw, block);
+
+    if (block) {
+        timeout = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+        timeout += 1000; /* one sec */
+        timer_mod(con->gl_unblock_timer, timeout);
+    } else {
+        timer_del(con->gl_unblock_timer);
+    }
 }
 
 void graphic_hw_gl_flushed(QemuConsole *con)
@@ -1966,6 +1981,8 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
 
     surface = qemu_create_placeholder_surface(width, height, noinit);
     dpy_gfx_replace_surface(s, surface);
+    s->gl_unblock_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
+                                       graphic_hw_gl_unblock_timer, s);
     return s;
 }
 
-- 
2.34.1.8.g35151cf07204


