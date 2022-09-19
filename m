Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060365BC2CB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 08:27:43 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaAFp-0007G3-Bp
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 02:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oaA8R-0003LX-W8
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:20:08 -0400
Received: from mailout10.t-online.de ([194.25.134.21]:45106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oaA8P-0006tf-8U
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 02:20:03 -0400
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout10.t-online.de (Postfix) with SMTP id 52D4FCDCA;
 Mon, 19 Sep 2022 08:19:58 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oaA8L-1NUYjp0; Mon, 19 Sep 2022 08:19:57 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id D5E3A200613; Mon, 19 Sep 2022 08:19:56 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kshitij Suri <kshitij.suri@nutanix.com>, qemu-devel@nongnu.org
Subject: [PATCH v2] ui/console: fix three double frees in png_save()
Date: Mon, 19 Sep 2022 08:19:56 +0200
Message-Id: <20220919061956.30929-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663568397-8A6BF81F-38F94621/0/0 CLEAN NORMAL
X-TOI-MSGID: dcecec61-4d81-4fd7-b1af-351478b79d4d
Received-SPF: none client-ip=194.25.134.21;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout10.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
v2:
There's no need to inititalize info_ptr with NULL. (Philippe)

 ui/console.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 765892f84f..da179e1832 100644
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
2.35.3


