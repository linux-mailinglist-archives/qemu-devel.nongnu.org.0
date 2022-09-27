Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C945EBD89
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:37:57 +0200 (CEST)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od66E-0002rs-Vo
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oU-0005QD-2K
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oO-0000JA-J2
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKhagRLCEtkmOiTdXQ0adfpQ5bj5UXG4kN9vlU05MwI=;
 b=LW+CdkNZHetMRFhQjNJDTckIjKR3RO7QQufF0xjoji/b1cubIWNhF+7p70Xc5zbxDDKeM3
 bgKACfeRHBuXd3NGTG6E3O//OmzZzaBMDhEZn5SY9Iw7Q9kVOzo77tvYcb0MAmq3/qplgl
 sjKnnQ0z8rPREtkUrzIaz4nndMBKz60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-gDKPxj-bMRuwVYe5VOGbpg-1; Tue, 27 Sep 2022 04:19:24 -0400
X-MC-Unique: gDKPxj-bMRuwVYe5VOGbpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB71185A794;
 Tue, 27 Sep 2022 08:19:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3E739D6A;
 Tue, 27 Sep 2022 08:19:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6DFB31800980; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 10/24] ui/console: fix three double frees in png_save()
Date: Tue, 27 Sep 2022 10:18:58 +0200
Message-Id: <20220927081912.180983-11-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
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


