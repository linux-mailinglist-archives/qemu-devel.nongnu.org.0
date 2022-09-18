Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12895BBEF2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 18:24:51 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZx6A-0002er-B6
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 12:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oZx4c-00015x-DO
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:23:14 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:41786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1oZx4a-0002v6-9w
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 12:23:14 -0400
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout03.t-online.de (Postfix) with SMTP id B5397271A;
 Sun, 18 Sep 2022 18:23:08 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd75.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oZx4W-0xnJMv0; Sun, 18 Sep 2022 18:23:08 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 3B10520045B; Sun, 18 Sep 2022 18:23:08 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] ui/console: fix three double frees in png_save()
Date: Sun, 18 Sep 2022 18:23:08 +0200
Message-Id: <20220918162308.25191-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663518188-3C882535-90AEC629/0/0 CLEAN NORMAL
X-TOI-MSGID: 86e703de-ae41-4af7-9f6c-592343f91081
Received-SPF: none client-ip=194.25.134.81;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 ui/console.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 765892f84f..030e75bc71 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -304,8 +304,8 @@ static bool png_save(int fd, pixman_image_t *image, Error **errp)
 {
     int width = pixman_image_get_width(image);
     int height = pixman_image_get_height(image);
-    g_autofree png_struct *png_ptr = NULL;
-    g_autofree png_info *info_ptr = NULL;
+    png_struct *png_ptr;
+    png_info *info_ptr = NULL;
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


