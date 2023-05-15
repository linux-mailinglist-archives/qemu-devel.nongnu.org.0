Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B616702E0C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:26:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYCn-0001PD-I2; Mon, 15 May 2023 09:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYCl-0001N8-6p
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYCj-00063R-K7
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684157133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7h8SCOVDOPoz31u20aTZKWCXI0D1XQXizD3uRKY4VII=;
 b=ErwQSyn7Fu2ldVdPfUeJwkbFYEtwSbzTPeWWYSIYyHZ5gwcKXqODHn4CqPTGLV6mXPRRpx
 +mISG2omiH20hGnoTvvFHpJ5e5twWRkzWtBOlPceIfo19PwqyTlRkYqFohwDeiQNO4DcIn
 pKajVYAcldBxu/aHpecAe+hX3oSBuvw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-70H6crisM26__KZJ-XGB6g-1; Mon, 15 May 2023 09:25:31 -0400
X-MC-Unique: 70H6crisM26__KZJ-XGB6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AB813823A08
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 13:25:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079E42166B26;
 Mon, 15 May 2023 13:25:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] gtk: add gl-area support on win32
Date: Mon, 15 May 2023 17:25:27 +0400
Message-Id: <20230515132527.1026064-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Windows, we don't use the low-level GBM/EGL helpers (no dmabuf etc),
we can turn on GL area support for the rest of rendering.

(fwiw, GDK backend may be either WGL or EGL)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index f16e0f8dee..0a39b1935b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2445,6 +2445,12 @@ static void early_gtk_display_init(DisplayOptions *opts)
             gtk_use_gl_area = true;
             gtk_gl_area_init();
         } else
+#endif
+#if defined(GDK_WINDOWING_WIN32)
+        if (GDK_IS_WIN32_DISPLAY(gdk_display_get_default())) {
+            gtk_use_gl_area = true;
+            gtk_gl_area_init();
+        } else
 #endif
         {
 #ifdef CONFIG_X11
-- 
2.40.1


