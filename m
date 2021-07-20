Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB093CFC94
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:44:54 +0200 (CEST)
Received: from localhost ([::1]:43460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qzN-0006yq-JL
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m5qyR-0005nL-7m
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:43:55 -0400
Received: from mout.gmx.net ([212.227.15.18]:56553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1m5qyO-0007LH-L5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1626792228;
 bh=ijwe7u2lIFF6XjkuJrs67iJBp99JkbzudsY3g6s2qqs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=AqJI8SS/QACJn5ebNl5D73Bt5/ZXPb6TmQ/bFXWanOm0HHwo+wKOec5uxiwX95NSD
 QnuoSsSOwG0WVvz+tzz4cZ2aG4Yn1+Ums1q76bgDzk30U+NStAekum4tkcZSPadMKw
 SrAUPnXilESxg+GxyQQn7ZEtvxfZ6CeMrYvPd2cM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([87.123.205.179]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N2E1M-1l6aAn3Wtq-013hiS; Tue, 20 Jul 2021 16:43:47 +0200
From: =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1 v2] ui/gtk: Fix relative mouse with multiple monitors
Date: Tue, 20 Jul 2021 16:39:41 +0200
Message-Id: <20210720143940.291413-1-denniswoelfing@gmx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RY0c2q6cKLETjoNOxk6+A6j+h/gRvsi/Ak1qLifkbLhxguiNsWT
 I0QDfKO4oxD2ArXNm30XRl6IRzawP/DIpqkotVobrxVv8PnHIGunU4hkiWbDrPRTdA2OZ1I
 NyLW78RR2xGElc29buRIp54SneCEP7Nv0WsdHttPKjq0FUNKy3VO41CbPRX5iIb7rgK6FyH
 IC6hD+bitWj0JpAgLs40Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MeFGbR8SNn8=:SQVy1jTC819vpFRtGpGNx6
 f9/Yz8lRGQKlsU6dFhq7R5jrwywoG8+nxmwu6MLkMzdYYK2gYZZMF48S+xWFVFLVYzBgne7Sn
 7V+lkICQidkpHft8DCSM3B7nOU8BMiEbruz3p3xLh+raKhZP+N7DOl21PiB8DJ8ceUXc51mmm
 BZB3hMlzlyBh6m702s+LDxNwTuVufh9JudL9hH8aKSCU1jDyBLw8HA7K8f9Pd0TEE5vo8sXSZ
 4sS3PujStQAi1QG6mBy0+FKCAAmEUSe3SkwdOStgu3+eTDB6LcRFUCZn6h5hiUmnxFEiHkT0S
 ymvIOiDG+Kold0A+Q0CmGHd5Hr2calyqDrpESAHpCfZdaQLG0SXMGaKfpjP66CPbe/Qg8U9wS
 f//3JFw3mm/Su0YAvqguM5ifRPM5KHiSz0KhExphKVC1THgAzWcGM5uz7SVBPrGGcDRff7d8O
 FuDpyYUEQyXcvQCagll/q/0y/yanOUFXLQoZ+k1sV2SN8Wqi8Jzuoul+Sw14YDtAu1acNaOek
 mlW67PSaz9ZWRuGKy1TaCj4NVfZsWqCfwIu0PydO0/jVrFVk/JuALe7iXlEqybLfGz/hMchjt
 mYNfz3YLb4hANfj85LNWjfSlGETEFBMqNGHbQ1B0RgRc/CS0GcM+gtaj8DWd500TUQ6pWrEfv
 ier9eTxIv9rpRCq2iyBJW1ois437vjYElmPopTQdBvCcbxYI1eBeZmIIpxKZWosi0KNmmBjIA
 XEp/jLkxLBBoUU1cIU/4jJe2IUaOi1Nufgma2LNZAaDyi5iz4N0psSeXq4/ZS0lrngLwZlpt7
 F9iLpiAqre7cFLFZAN8Gd2qBM70buoTKrsMyreeKGbKDJ2i1sgvBxDaq2L9NfmBGTdeSSjBoJ
 lCN8apSsRm4ipGbj4OS9t/G7RYnoY++dJrh3bQo91iibFrieLk3OGFkRBMwzitbIHGIXgBn2v
 X2PRYOBDNcHuLy6FkFnBevpJdrvU9zyUxN1CMDM9ur4aLVuGFE32JmDLldQy9MMKMIez1OzzK
 fCGAA1+CffewEGvPheK8WCI2At33AiMAKf1dbCLYRyFyRxvK/6vOs59Bdgq7se9KckcCnW8KX
 JciTUiiHOVW1hZyTBIopJBlKXKJVFX72zN1el1hgtuHvHQBtiQlTo09LA==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To handle relative mouse input the event handler needs to move the mouse
away from the screen edges. Failing to do so results in the mouse
getting stuck at invisible walls. However the current implementation for
this is broken on hosts with multiple monitors.

With multiple monitors the mouse can be located outside of the current
monitor which is not handled by the current code. Also the monitor
itself might be located at coordinates different from (0, 0).

Signed-off-by: Dennis W=C3=B6lfing <denniswoelfing@gmx.de>
=2D--
Changes in v2:
Warp the mouse to the center of the monitor.

 ui/gtk.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 376b4d528d..18542c7633 100644
=2D-- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -865,37 +865,25 @@ static gboolean gd_motion_event(GtkWidget *widget, G=
dkEventMotion *motion,
         GdkWindow *win =3D gtk_widget_get_window(widget);
         GdkMonitor *monitor =3D gdk_display_get_monitor_at_window(dpy, wi=
n);
         GdkRectangle geometry;
-        int screen_width, screen_height;

         int x =3D (int)motion->x_root;
         int y =3D (int)motion->y_root;

         gdk_monitor_get_geometry(monitor, &geometry);
-        screen_width =3D geometry.width;
-        screen_height =3D geometry.height;

         /* In relative mode check to see if client pointer hit
-         * one of the screen edges, and if so move it back by
-         * 200 pixels. This is important because the pointer
+         * one of the monitor edges, and if so move it back to the
+         * center of the monitor. This is important because the pointer
          * in the server doesn't correspond 1-for-1, and so
          * may still be only half way across the screen. Without
          * this warp, the server pointer would thus appear to hit
          * an invisible wall */
-        if (x =3D=3D 0) {
-            x +=3D 200;
-        }
-        if (y =3D=3D 0) {
-            y +=3D 200;
-        }
-        if (x =3D=3D (screen_width - 1)) {
-            x -=3D 200;
-        }
-        if (y =3D=3D (screen_height - 1)) {
-            y -=3D 200;
-        }
-
-        if (x !=3D (int)motion->x_root || y !=3D (int)motion->y_root) {
+        if (x <=3D geometry.x || x - geometry.x >=3D geometry.width - 1 |=
|
+            y <=3D geometry.y || y - geometry.y >=3D geometry.height - 1)=
 {
             GdkDevice *dev =3D gdk_event_get_device((GdkEvent *)motion);
+            x =3D geometry.x + geometry.width / 2;
+            y =3D geometry.y + geometry.height / 2;
+
             gdk_device_warp(dev, screen, x, y);
             s->last_set =3D FALSE;
             return FALSE;
=2D-
2.32.0


