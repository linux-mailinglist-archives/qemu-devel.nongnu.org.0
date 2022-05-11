Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1604652413A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 01:54:12 +0200 (CEST)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1now9j-0005KD-4u
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 19:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6t-0002XA-32
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:15 -0400
Received: from mout.gmx.net ([212.227.17.21]:59881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6p-0007Tb-NC
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652313056;
 bh=9YBcCciepqvDlzxZDqgabyo68t3IaKZgBZgloQVHP6k=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=RzSYMBgmrkguq7XMzpUf5igJb6dMidU+xtG9jwCqH8hI+mgE3ORRPWCiYx7KJ00i0
 5SGDQD8HapBcwtjd8OZOEIplS1/nPIesEETrtfIx7MOQhhsm0TeCYyNx918boOA4Sc
 XmB7chwAl3pych1axGrcup7GIpTdZIWQzDKJoPP0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.141.127]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsEx-1o6KT114yt-00suCh; Thu, 12
 May 2022 01:50:56 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 4/6] artist: Fix vertical X11 cursor position in HP-UX
Date: Thu, 12 May 2022 01:50:52 +0200
Message-Id: <20220511235054.185435-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220511235054.185435-1-deller@gmx.de>
References: <20220511235054.185435-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7NfnSVhgQHVR2MRwl1JfJhMxbmNnmuTYspEAjVGZFdzX/XOIpAw
 Eg/eq575MBPM9pLJe256Kp6EQxIsiCKpoAf16hGp6E7wKnUNOLP1pcaroOeKuFkG5Rd7NLK
 dB6C4Lqr2c6VykgLDo7ZqnJJPLv9T3mzsVW+MVCuOOY4JptB1mYV6iA+QML0/QVB02UXuTH
 0lQ2sh0Mjt5lYJFMBMKfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h6v2DduJ1mY=:DkBiSqsM2L5sLiBZDIzl7P
 5vPD5YFC8+bBEkf9dbsq25QqqO183YjbpPkfsnDjI8OCvVNZYU/xSZMIjZbGLxTEpLtlNDd8r
 5Nh7zNferD4tEeKEosZRXcOB7i4C0icHfh2vpnIEm9R8uuFC1vRI0rj0+7CxeA3USUDU9ImrP
 8OAbonihzXuMMquaLAT56866LWi3p20jvVR9a8uLLIy32aVjKeBR5N/PB/5v9TfE6Umau2dgQ
 5URX7GBOU5X1qh0jLLXg/7DBMvffv2upKDW4scWHq6X2tEn+FnQcJns08KJawx12BHoR5ZVqq
 bvO2X1ysiVYfrg3bHQMmLb4Y0FRJeJNApVJz51yQMmGs47Q6x2uD4UtMrdpf1OVZVv5crLAhQ
 AfCRH44UVZKBUvLosMv5fCYDzhNCYETcnbujaLBwcRK9MtAt1pQHqw6KhqdG4+ZFJvyOOBWTt
 eay9iS7vcZSwL/j8He9yqHZAeM4lIUOZjGg4GUoic7GwnzenhwDqxirDOw2nB9YyKSKD6M0Xb
 YpY79xiJ4iPmbhyBRmYV406QTq4KD1luhBjP3Y+znFGONiKo0KFerYkn9FfEEGS2/LrvOErW6
 7oUIlWT0nKJlO/KFAeUEXYrCWjwgVBlYcd13NB2o6WBzHaMocZfpkRDvuhdSYeWxR6LiWIsvP
 i80vq5t4+uf0RWDOgnOSjjfMQAdyD3zpg31VBjbKoBM+ggbOI7z85nQh//Tgm+D9oqNoQW8bj
 WEchLhbgoiUX92yPmDOjWdw0Qy8CoUFFUf0A7AuCgWaiybeWvtveTr3h63awZeA2fQAxVovbD
 RrtMRpa03tkG1YS2ENngz3S2WEcFSJbai21vJikPAXNK6Yv+Pddb+QjgMwyK12ZKu7knfh9XJ
 vLmG99MOosobuLbw0Q0RvqFG4NwaZ9ClejfDtrWDmX6wlQhyR+ZMcI42h8h61ZbGBJ38bKMba
 e4JjxipaohH4yaGd2696awx7w9rvpr1GT77T+HDdYFDKFUGKWL9WPcDGkE6897nUu6IZY+LTD
 AkzfZVqSYss+Fsci+w9iGjIdiNavx5ovMpEkgOEq+VtpTW6k57I0W82PZxFJdk4fZCiygnhWn
 d6JUpL05Cjc3dI=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Drop the hard-coded value of 1146 lines which seems to work with HP-UX
11, but not with HP-UX 10. Instead encode the screen height in byte 0 of
active_lines_low and byte 3 of misc_video as it's expected by the Xorg
X11 graphics driver.

This potentially allows for higher vertical screen resolutions than
1280x1024 with X11.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index c8b261a52e..780cb15026 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -337,10 +337,11 @@ static void artist_get_cursor_pos(ARTISTState *s, in=
t *x, int *y)
     }
     *x =3D (lx - offset) / 2;

-    *y =3D 1146 - artist_get_y(s->cursor_pos);
-
     /* subtract cursor offset from cursor control register */
     *x -=3D (s->cursor_cntrl & 0xf0) >> 4;
+
+    /* height minus nOffscreenScanlines is stored in cursor control regis=
ter */
+    *y =3D s->height - artist_get_y(s->cursor_pos);
     *y -=3D (s->cursor_cntrl & 0x0f);

     if (*x > s->width) {
@@ -1158,14 +1159,17 @@ static uint64_t artist_reg_read(void *opaque, hwad=
dr addr, unsigned size)
     case ACTIVE_LINES_LOW:
         val =3D s->active_lines_low;
         /* activeLinesLo for cursor is in reg20.b.b0 */
-        val |=3D ((s->height - 1) & 0xff);
+        val &=3D ~(0xff << 24);
+        val |=3D (s->height & 0xff) << 24;
         break;

     case MISC_VIDEO:
         /* emulate V-blank */
-        val =3D s->misc_video ^ 0x00040000;
+        s->misc_video ^=3D 0x00040000;
         /* activeLinesHi for cursor is in reg21.b.b2 */
-        val |=3D ((s->height - 1) & 0xff00);
+        val =3D s->misc_video;
+        val &=3D ~0xff00UL;
+        val |=3D (s->height & 0xff00);
         break;

     case MISC_CTRL:
=2D-
2.35.3


