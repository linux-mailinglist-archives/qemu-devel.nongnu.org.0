Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121344B0A3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:48:05 +0100 (CET)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTLw-0004v3-Kw
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkTKz-0003Yd-5M
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:47:05 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:53175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkTKx-0002gQ-0Z
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:47:04 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MqrwN-1mOctx1S5J-00msPW; Tue, 09
 Nov 2021 16:47:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] macfb: fix a memory leak (CID 1465231)
Date: Tue,  9 Nov 2021 16:46:58 +0100
Message-Id: <20211109154658.1058842-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109154658.1058842-1-laurent@vivier.eu>
References: <20211109154658.1058842-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x9FbuDEO9NqszAaoSeC/Z+gr7lExRmdhlbmhMcj/FqdX/fsoX5j
 44vXFwZxq+SCrRso6BX4JybXprK/BUwNYyJvj17v+OLua7SF81MOJJn7L07T0hOWEh7DndY
 cYC5drTpJfO9mO9F8F+SMwcAQ7yGjABNhXcxb57EAJHTHYC+L36rQXQyefleGKXBI4XlLEY
 9caCDb9W/N7OkCx7e8jMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MBtYRSbBil4=:3iP1UdtPkzHhnlryIMy302
 NKk0UF7q23wFBb8lH/gPr9c05vk6bNlBoC6fYiWdjUS/9jGWrQYnxf6tEtyTWxFryanLm/QQI
 pImjCrlzvZzdM5CYdzAMUAVXyf5IDJZPzWLd74/HAmxi5VU8pV5kBBsJMRsUK7LhkMom9Y7lq
 JU7ebE7DFcY84tAudbMQ+oYtqgj137quavvGctY20finxkGeanxqm3PBpMRgDNsStYAj1g8A/
 XGhGW/D5QGAprRy5KjT1PUQUkz9IgRozfxyslCpfz99/tcK1Y5yHbmdw+Ds8h3VbpJwdyO+en
 TbrmhrUXnz7RqAguBeZXd+tesi9WrodTadSAZ8Yw+F20hvPkrmIy9NCzDJ/Vw2URft5DmrPNo
 MbGH18fori6UAuLZp+6UwJK6e78Vy9IsfhlbCpe2FFdkwC3s8D+Bl/b1zo7QTqJrJwOJLt2DZ
 EMUo8/Zv59fuGm2IkoqKL0zIz30Z9XCb9B5JSdfNR4sRLp/d9mibl9Et40QNCfJPYZrR4bJ59
 ui3+qPBGfd4fZxWd0lhlzBOxw/EYB2s9sS29I7vcYPGkffRXvMSxq9AtthkEW+snMNFm8ysVL
 HJhrxjadEoDdfGV2NkA8atqIFdFm1FI5fgebk2L5lKFyumf5JRtxPGznXm1QgkzEckRGVH89R
 40cbtQyQbza8FqhBk/UXnhBP9S1wXwSQatxAUuKFRKtY2fYfRnhdABepk/btrelnOFco=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.cave-ayland@ilande.co.uk,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rewrite the function using g_string_append_printf() rather than
g_strdup_printf()/g_strconcat().

Fixes: df8abbbadf74 ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
Cc: mark.cave-ayland@ilande.co.uk
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20211105165254.3544369-1-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 4b352eb89c3f..277d3e663331 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -440,21 +440,18 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
 
 static gchar *macfb_mode_list(void)
 {
-    gchar *list = NULL;
-    gchar *mode;
+    GString *list = g_string_new("");
     MacFbMode *macfb_mode;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
         macfb_mode = &macfb_mode_table[i];
 
-        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
+        g_string_append_printf(list, "    %dx%dx%d\n", macfb_mode->width,
                                macfb_mode->height, macfb_mode->depth);
-        list = g_strconcat(mode, list, NULL);
-        g_free(mode);
     }
 
-    return list;
+    return g_string_free(list, FALSE);
 }
 
 
@@ -643,7 +640,7 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
         gchar *list;
         error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
                    s->width, s->height, s->depth);
-        list =  macfb_mode_list();
+        list = macfb_mode_list();
         error_append_hint(errp, "Available modes:\n%s", list);
         g_free(list);
 
-- 
2.31.1


