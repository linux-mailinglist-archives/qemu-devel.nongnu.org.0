Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D8F47BA8E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:14:26 +0100 (CET)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZLt-0004tq-97
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:14:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAR-0004fN-Vv
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZAQ-00024Q-CG
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVIEwc4U/GyNxdlw3OLMiafyh68EowCHnLZunJbM8js=;
 b=XneTgXDw7yYn2E0CW7bRtfz/LAKy2GRQDHmpKQtrh4GD/NGlMQy00MiMy/Lm7lwRQ65tFg
 JxxrNXSwddrjGckKHnVT0OXqgyX3aLlzT7YtzvTWCUOmnL0CKvW8PnwqUQx23pB4of/pkA
 1blIT7diIpIz2QeG5ttbVl64XHV9dmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-IQobmik0NIWdplQnIxvY7g-1; Tue, 21 Dec 2021 02:02:30 -0500
X-MC-Unique: IQobmik0NIWdplQnIxvY7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9982F2F46;
 Tue, 21 Dec 2021 07:02:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3B0C7E8EF;
 Tue, 21 Dec 2021 07:02:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/36] ui: add a gl-unblock warning timer
Date: Tue, 21 Dec 2021 10:58:32 +0400
Message-Id: <20211221065855.142578-14-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
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


