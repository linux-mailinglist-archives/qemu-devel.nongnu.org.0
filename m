Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C0F52BFC3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:27:43 +0200 (CEST)
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMWU-0008UO-NJ
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNH-0003jw-Ip
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:13 -0400
Received: from mout.gmx.net ([212.227.17.21]:60909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNF-0004MY-SD
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890680;
 bh=bC8k4CmHvr7MWuEgzVuQnCwm1AP7Chq+SHlVnjE75DI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XM5lxhUeWdykLjI76OaEOMRfbWnBcqNe1UzgzS8ul1qO4vVI9DjUCpIRXZHtzh3U8
 FIxeulcYfzoD5FkM6Y0vPpOddWHQ9bV8rkGHf2ZQ0nqVQHPTZHv8NYb1qaWT6FvjvE
 uGY1ctvSfF95MY2fxJLoGjq06MNsqhTfluOpkDfg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My32F-1nfiR53GqV-00zaVM; Wed, 18
 May 2022 18:18:00 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 4/7] artist: Fix vertical X11 cursor position in HP-UX
Date: Wed, 18 May 2022 18:17:55 +0200
Message-Id: <20220518161758.49036-5-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
References: <20220518161758.49036-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ty2/BfTmt8boQxIQcMDV65fo0Kn1+GxiCGap860M+97c+Qihfrh
 Q4P51f3YLgST1pfMx1UiW0sF5Hbf6n6NLxrPLNg7qNiRvDRJudwyMo1zRDFB01kCB2wIJeR
 kbzFAw5bm4Aj3sOzjqn/v8iVRbakc4NxWyzjXKj6Qbr+za7JjSDKaYMEhqz+LNOS3EYE7tW
 9uBG+zI7YydsgMv7xdJzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DdCifBFmI+A=:HczbZ3AENUEV37NqWAVJ3k
 irM+pUa4TLYUNgyYKfxSf05b5SFnqe6GzwAGj85GgG+6BVTuh0woq42B5sfKwyE+qAXUfnVvF
 YBlSfDr6Oz+R1cwftgyhSAs1hlni0/b9RcSWOQrtQdHmVhkVASKR6lMeS2+FSfMZAhqG7++Ej
 XI5xd6lBBeDXdt4ojfZ4srDPsT5MMHHPZ6/s0YQEazckG529hHCPNBcZy0W0J7PTDDEX+B4i7
 qV+E/qJibZFqjRGkP5u4lmQNP/58MMReR+OyeNhJaLbQ5ZuTgTjyLXzAr4GpJ7Ahky6Jg6Q1T
 l7bue66BS8kuuEyLDx27x/WYuX4WF0NZGrzsg0WZVGwYYQNKVaLsbyXv1gq7v547LPEhoFVCx
 3dLVc3/H2fNEK1QNhebeaSxuqb8vavTlgJLGHQnq1ORkmYWSofOcUpPklcUGeRE2kqv/d9wTL
 nfr5KmdkCJT/Y3YeZ5okI9g15j4m/V96P/xleQujmBiHPCEnvOjuOjfo+BJmFlGdN+XzPRG70
 q4Man8Xg346pKi9mA2YdM8pGDC2a37RfIS2j/SSE9oignBayzN0XXFdDOJzlmxjdm0Dqlskpb
 6TTYtGdFKzzNW1ozCFpnnCCrAG6K7lisOkigPOIyHCPxUqv7xnv54JgosBslmJ1Ka9sUN3u0k
 +vb6ya3MZ3ad+FUwmf2bSug8eyTssEZ6NS0uEqymDV4gQR7MD1qTJCyhC4Gbj0tlm15xrq0V/
 5qk8flFboAyJmnz/YT35/VtBlPuZEXTbXgfSVTgBo036epMTnZ4quVj+c3CR07qEJbRwAALb9
 4ZPiqK2fhSuHET1g3RKTBU5K88RnYGRhqltjuok1yVX2DquM1IEglNl9umVTcwtQblKUQPnqn
 pPS870yoIMnmihHoCfQRD/YB/VOvE6OnOVpWNcocAIgtUe9jKMYcrPXb96doKtzJahZNprsRE
 L5gjXV9ACsxngWEpBbMK8wrIv9BiGz9HJAvDfNi2+s+L6tgR19Q6w/+l67WhHwecNq4Ytd2U5
 6dEJMKYZ6LLb6xPZLMhaq1jwR9lu9Pb7cud1ZcaknLh0atPKC6uxqp0mxiSmwTAChkCNi5Jk6
 4fwuJ02OBFUSgZdK7+vntT8SNIYCVuv+B2Lw3N/vMOWPyIKqE6QkVm3mA==
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


