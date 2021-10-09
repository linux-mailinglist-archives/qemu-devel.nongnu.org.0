Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE721427DA4
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:26:32 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJrT-0003FH-5x
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdk-0002pb-96
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJdi-0000GI-LZ
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nk8jiC2IOuCDwDwRzB4dGaKF6jr+LGDIgyEX6S1LbYg=;
 b=eumiKl8YGfog/HWV77J2SDb0uM+yc3Idpkc97AKKN/oIci9XdNM+v8lLsCDeaoKKycZ3ko
 zkhjojMGQYd3jBqbCUfTN65Ebs+DMGmhWhPS23+AaMInjPnBLsQ7k7c5+N8KoybzjDEOsH
 LhSqBR2WhYGwQYyjo5stxKE0sc9Zu48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Gfu_NzP6N6WQZXqY0K-zfg-1; Sat, 09 Oct 2021 17:12:16 -0400
X-MC-Unique: Gfu_NzP6N6WQZXqY0K-zfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F63A10A8E00
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:12:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C30AE60622;
 Sat,  9 Oct 2021 21:12:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/37] ui: add a gl-unblock warning timer
Date: Sun, 10 Oct 2021 01:08:15 +0400
Message-Id: <20211009210838.2219430-15-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Similar to the one that exists for Spice, so we can investigate if
something is locked.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/console.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index 8d641b9530..c62a33b1ec 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -129,6 +129,7 @@ struct QemuConsole {
     int dcls;
     DisplayChangeListener *gl;
     int gl_block;
+    QEMUTimer *gl_unblock_timer;
     int window_id;
 
     /* Graphic console state.  */
@@ -284,8 +285,14 @@ void graphic_hw_update(QemuConsole *con)
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
@@ -301,6 +308,14 @@ void graphic_hw_gl_block(QemuConsole *con, bool block)
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
@@ -2024,6 +2039,8 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
 
     surface = qemu_create_placeholder_surface(width, height, noinit);
     dpy_gfx_replace_surface(s, surface);
+    s->gl_unblock_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
+                                       graphic_hw_gl_unblock_timer, s);
     return s;
 }
 
-- 
2.33.0.721.g106298f7f9


