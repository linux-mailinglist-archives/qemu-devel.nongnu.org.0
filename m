Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF03B732E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:27:26 +0200 (CEST)
Received: from localhost ([::1]:53074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDlt-0004kT-9W
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1lyDjQ-0002x5-0L
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:24:52 -0400
Received: from mout.gmx.net ([212.227.15.15]:41953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <denniswoelfing@gmx.de>)
 id 1lyDjN-0002wV-Mt
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624973085;
 bh=jf/fnRubEY8AHqepPvhUUFcsci2Zuw6SRetbWg3+2Js=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WVRmZAsILSjEzPBEr85u5wQivKi2uxc1WdYtTQ7vwHrijb+B1PjgvXDdCjFuMbrBw
 dAlSxov5leMCAXMBB4mSf+/Iq6xk3ueaGGdExEHCzIuJXZ4vCMVLMJ9QifmAVN30zg
 u+kEEcJY+fiInBWbgzK5hpQ9oa1s7g+2tsUrIKfs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([88.130.62.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MRTN9-1ld5q408sX-00NV7w; Tue, 29 Jun 2021 15:24:45 +0200
From: =?UTF-8?q?Dennis=20W=C3=B6lfing?= <denniswoelfing@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Fix relative mouse with multiple monitors
Date: Tue, 29 Jun 2021 15:24:10 +0200
Message-Id: <20210629132410.286813-1-denniswoelfing@gmx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XwzDDChQ/VFiFyKMJDX45gJkotxxG+LES467Zr/lIK9cZzwdZjy
 j7EAbdJBB1wvQBg12RGC0UNJ8jK0GC44Hdtr/frWXDHu6rwpfNsRlNr62ahMT6eNg4+Jkjr
 6XCAssJGlgfqwvIfGZawb6/YGT1cE4IbTJDZIFLVXceBvMImBQhoj29nc5jdJMv0X0Hfo6O
 6Q3I/YC9mulO369pTHwpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VQYnSAhMA4k=:YkuAj0gtD1sScJ7y+ojmB+
 i4Vxawy+TWUpRo3J8fwdaA+Y46j+n89JhsspWO7vk095p/NycGh9WMocopAzMlC1XCw1vLJen
 HUZY7TQORGSg8KQdCxE/lFzr6AsbwAxUTcT/nS5gxVX10+U3nORqDz3Dm8rqJ6xuRa3lVExx2
 9cpx2HAO93DEtGJxV3EfTYFjcj+eFOw+tlR9Jr3tjGmqrhE8al3EyRIJ4L8pho6/2zecZOWmf
 NiIVMNAszyGvTc/c57LXfU2bmH8maExwrcgbHANg9vM5A11GxXnpVz4H1tC0ybMlAIDLWDWsT
 qddyuWZTyxvMVhnPvvgoLqieOWzgKpostem5PVdKDHC6Kzd9RN+eP0Ehqv1T3JsvrMCmG5C4/
 Zr4evCdkwTbYiEIpeohViPTP0vfpiy8PcI+4e2qpgFi+V94Yrl5i/0xeAHGcAK7RPt4Tpx9KQ
 H4mYpNJ5oIg9vXlqkQCiTxGaLib91kQwZir+YwgfSPmRZA4I2iNkpj60s2OnQpHMvFEc//aOe
 xF5ropGnZ6reoQx/l25iLgOdPB9xCKGTjMLypEqU05HSBuZSEPuY0nCwRIp/O44vQUCoKiVcX
 t3HsceVt7YaYYjrkBflLSiraTZqXQfWyQAUJzD8imMbgO0hpIaFfX0Qk0LZn/XM62qwq8oYt3
 shfVEeCdc3ehY69NtilgHgR7TvX0iJDYVwHu7I3b6OQ4Hjzw+sP9C6LJPsCpP/iAUqTWYLTjK
 v7AGNPYQyxV9XdF7Y7vEU7DQfZgCyZ+jxITPMLQfNka8J7PbcD8agW40cexgFzZHWDJnowFQ0
 bgenO3zM15z8iDz+wdjsjw9PueO21kUiuLL6RMbBjh/qS7FhVpDp4OieRv130gRcAmAfBr8Kg
 DDUEozEIU+Vlp8sGhTTd26c3W+RtQOPJweXBVzzmAQGQ8tm9LzJlOZNiPreIsRdCL0ouMcfZJ
 6+6ABKtXgNT3I+RDeLDM0zdomDrjqNoEBfG4VaCDC5difVBff081zaX67n0ZSrEkOenocSt9t
 CIQeTrTBEYfjsjSvH4tjcBkkXz3u1oYQ1gs1xs5AG+xTi1/R/Zm9ZhORF5hIbuSavkoMX6vyR
 LbHABXjNf2JxtmInNrE7XW5WUWQZWnNE3qp1d5M5vx57iyS/WYUn9ENMQ==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=denniswoelfing@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 ui/gtk.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..5258532b19 100644
=2D-- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -865,33 +865,30 @@ static gboolean gd_motion_event(GtkWidget *widget, G=
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
+         * one of the monitor edges, and if so move it back by
          * 200 pixels. This is important because the pointer
          * in the server doesn't correspond 1-for-1, and so
          * may still be only half way across the screen. Without
          * this warp, the server pointer would thus appear to hit
          * an invisible wall */
-        if (x =3D=3D 0) {
-            x +=3D 200;
+        if (x <=3D geometry.x) {
+            x =3D geometry.x + 200;
         }
-        if (y =3D=3D 0) {
-            y +=3D 200;
+        if (y <=3D geometry.y) {
+            y =3D geometry.y + 200;
         }
-        if (x =3D=3D (screen_width - 1)) {
-            x -=3D 200;
+        if (x - geometry.x >=3D (geometry.width - 1)) {
+            x =3D geometry.x + (geometry.width - 1) - 200;
         }
-        if (y =3D=3D (screen_height - 1)) {
-            y -=3D 200;
+        if (y - geometry.y >=3D (geometry.height - 1)) {
+            y =3D geometry.y + (geometry.height - 1) - 200;
         }

         if (x !=3D (int)motion->x_root || y !=3D (int)motion->y_root) {
=2D-
2.32.0


