Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7F5E9FA1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:28:10 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclLM-0001n1-Ck
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpl-000596-0W
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpi-0003lz-Qt
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKhagRLCEtkmOiTdXQ0adfpQ5bj5UXG4kN9vlU05MwI=;
 b=W+pgK7oqhvQ1LfFdp3PqrENqcljxG2fOLWt4UgQOgemyzkfJN93oYE1sOEl89wofNiqXbk
 1XPrfADk0KxVsHqDWJd4bkUZZ/9fwyq0/5F8kbHCDXs7+Ol80LDVp9QnEAyO9mwoisPV8U
 JchWK0AXQQXfI21kPcT7VMaopEbZbfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-f95HE11gNnqX7jnkK39Kbg-1; Mon, 26 Sep 2022 05:55:22 -0400
X-MC-Unique: f95HE11gNnqX7jnkK39Kbg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 667B229AB3E7;
 Mon, 26 Sep 2022 09:55:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0DF017583;
 Mon, 26 Sep 2022 09:55:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8130D18030B3; Mon, 26 Sep 2022 11:55:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 10/25] ui/console: fix three double frees in png_save()
Date: Mon, 26 Sep 2022 11:54:54 +0200
Message-Id: <20220926095509.3759409-11-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Volker Rümelin <vr_qemu@t-online.de>

The png_destroy_write_struct() function frees all memory used by
libpng. Don't use the glib auto cleanup mechanism to free the
memory allocated by libpng again. For the pixman image, use only the
auto cleanup mechanism and remove the qemu_pixman_image_unref()
function call to prevent another double free.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1210
Fixes: 9a0a119a38 ("Added parameter to take screenshot with screendump as PNG")
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220919061956.30929-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/console.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 243f2f6e64ae..49da6a91df6f 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -304,8 +304,8 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
     int height = pixman_image_get_height(image);
-    g_autofree png_struct *png_ptr = NULL;
-    g_autofree png_info *info_ptr = NULL;
+    png_struct *png_ptr;
+    png_info *info_ptr;
     g_autoptr(pixman_image_t) linebuf =
                             qemu_pixman_linebuf_create(PIXMAN_a8r8g8b8, width);
     uint8_t *buf = (uint8_t *)pixman_image_get_data(linebuf);
@@ -346,7 +346,6 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
         qemu_pixman_linebuf_fill(linebuf, image, width, 0, y);
         png_write_row(png_ptr, buf);
     }
-    qemu_pixman_image_unref(linebuf);
 
     png_write_end(png_ptr, NULL);
 
-- 
2.37.3


