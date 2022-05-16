Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A4528830
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:13:40 +0200 (CEST)
Received: from localhost ([::1]:50346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcPj-0003cn-HX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3y-0005xX-9E
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:51:10 -0400
Received: from mout.gmx.net ([212.227.17.20]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008DI-Ui
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712577;
 bh=bC8k4CmHvr7MWuEgzVuQnCwm1AP7Chq+SHlVnjE75DI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RXM67Nt7nLZGQ5BbNbH72GdQ8XQjahF61JiDkzbJKfj1laifUDM5pU9p40egAkTRx
 JgOFbn7iNyIkSwqcpIZZPr/DYiDB7sYQMkJmpZHzBJoyVnkHpQkcFr4UThc4KgJjTy
 vRkFxiE5tF8xJrFxb83i077m3IMxy3UXwyKG2oNE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1nzvRn02fm-00AWo8; Mon, 16
 May 2022 16:49:37 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 4/7] artist: Fix vertical X11 cursor position in HP-UX
Date: Mon, 16 May 2022 16:49:31 +0200
Message-Id: <20220516144934.36273-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516144934.36273-1-deller@gmx.de>
References: <20220516144934.36273-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dMcpvdYYnl6y6eOFfVtmF87w3e5Ls0+NvJwzvU4c+dFglbxH04s
 O5P6C2414Gje55yXQlUdIN32b2nMq7cC/uqCU97Vf0W2Ecpt9SjPOjQKcHyh9CCONpKzvcg
 RxtnabEuhVn3PWUn7NBuaeq+ig1ZioZRIREzUm84etpU6FmnK9SEwaRA7LiM6b35VWNt85v
 reY4TkvSldIL/nlbI2yJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wfJg0RjVH6U=:Qvyw6nlTi1vX656jq1msdG
 tyxX+CKqzV7CYK+Yyxfpvgo6BcruaP8CbmCXO3pmP63e/+Nsij3nzRjJVmr3Pu0ajBjsCsi09
 JTSwX5BUzXF1gC9dcGGMKdDARRYkZ2YEg8NnT10Lu5MdthI6lfyozPtSZoNwM0f2uECMAQ8G4
 IGTAYyyLQGMJCHt5EH0+XJ6cwIHst4SIV4Hw9Oc0A8kh69mZ6ZA298SQpB2aGLpj7a+pbwthb
 IE3Hd+Z8RbuU8N9PDntKf9dALEsPKYpV3WGC27Ts8KiTDJPHX3JeRg4XhCfRMvEFdziIMmVtv
 IAJ9JZa7ve4semciLF48/OsKo+F3NWMrAcO+C95gwJk86+vKe+uKUSsk+UGiZH8sEL5Y+sJ4v
 cQ5SWOxtnR+FTnYJ6jhXMPWxtQ7qAk1OpQWMiuYEifW0/H7usHYlfIxDC8KRekDV7Kywf5ci/
 CiIJIic8CoM3p7KEI6dCNXwCmCvjmFKIEjdTAc0RkwoBKg4e1nMHck2StNmeBuLkLiWYuM19S
 EPfSQQnkknNxdO+u/cvJDjrzeJxB/FeEEClT+KWQl/9I+j51V0wdGcnACdKOqxrUzZ74hJXqa
 MdqH02+NoQsNX1xKdiiiZNn7D89niWAk0G3N2For6sPuDDkIxZ7mdkOto+SiZQejUzh3mTJY3
 oxE5Ab9YC6Z8S7tkazKKWXZpZFeDZn2NFMBvKi7nXRn+zZHUyA/4JVG3uzE43M4VaO59uqH08
 23CuP1e7M2Tq2gkz8sZ5SZX6C1Eo2bgrrwOMfu3if7+CZefnz9pDduelsMYjVROpaherlbS9n
 uHSlsSVm5kN+7tMqYxAjZ/GwlQhTXggK33E8YOcawEaZ6d25pxuiIUrotMb/zzv2w9UR6ljDH
 7GOTi+yqt11BIHLHwlDChZBvYefoT308nBC9G1KOQFoWBgm1zANZZPnFgYpLcgwAdmpNUGiqE
 iUsyjtswUbQhFYAF22AIzEaVl+2s6oO+UZmRRacDleLJE//bPcaIrZcYCBc9pLLDzclzgprbf
 EsitxJxk78sNLAGszHwX8Xr2d+pOYUwqqie/UqrBsNX7qBucZ9/XmGtHBwIZ3TtnCoFhvqK2R
 0MgPnks5Ace3Eo=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


