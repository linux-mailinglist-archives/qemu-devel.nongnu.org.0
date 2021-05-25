Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F702390A62
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 22:15:40 +0200 (CEST)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldSl-0004my-9x
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 16:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lldQy-00045X-7P; Tue, 25 May 2021 16:13:48 -0400
Received: from mout.gmx.net ([212.227.17.21]:53621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lldQw-0006u1-9s; Tue, 25 May 2021 16:13:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1621973619;
 bh=X0olC0WIpdXqsDDFYUYxQTKfLLoGDFlIOCie2+d7qzY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=ZTV90boq2FyBjRBwiF6v/Y6xp2n9fZDAjRZaXzEv1CyGPNebPHy2/ipaqE4h99lRU
 /gfQ6060aifmaC1IHCHjjYE73oxiDKP9tRVqymMxEpltCXKw8+JZ0YBvmywKAUBjCw
 12srJBdivvRl6f7bnaifOSDkSFwpJv7TH342SkbQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.159.17]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1l8jxp2LQY-00n7nW; Tue, 25
 May 2021 22:13:39 +0200
Date: Tue, 25 May 2021 22:12:45 +0200
From: Helge Deller <deller@gmx.de>
To: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Subject: [PATCH v2] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read() and artist_vram_write()
Message-ID: <YK1aPb8keur9W7h2@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kacsbEpZQOtrpvEN38OhG3pgvuer9y6jNg2NYxlPRirx7RQ8XjA
 tN0Rlxphze1U2vZookTmzKbnhH9N5vFngfkk4+48CJbDGyKmCTAzpmK8UNE4Mk+L6BJ9AaM
 S59+olXV5Sq1Eua8AUX3A+dsZ5Z+gNZGsoZcsAB4T46bw19tj7rVViqPn3EPGXF6nEBLmNu
 /U1oe+/qc06Q1b6/Y934A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:clu+oriFaD0=:XsS+fgK7PtxhaxHMyZF7SU
 ts3jKORWRHV4RzQdxxXSVBHM8cktX+mXd5nd8DvcjU7Me+Sm9wsTffT223tubdOkRvW4JTWN5
 hXXMDt/vyMWjgQuR1CoysN+cEUVeXagEpMusvYxtu8Y2BJIIPfTJChnoQAtfjoArOCALYzMao
 Rj9i6IL+ZlRnl4RYfNcXeEIW4dmfWzv8TFGPWq97MWGpTEGGKYHpEZSLvo3xcfL6EhL/7xFlL
 m7MF6alAtVYw61Aa6lFwVJ3pfkwTpAwPJ/5eNmGp2nyH2/eOXnAHKy4jLj7cckeSPDIA6LRlc
 7qz57lOS7ArtbLQrNZXWZRc9LH2b2gBxAgGrXU3UuHTMy1Ew0RsvGuWbzG0uwn664x9QA6KCF
 e+SMnYvvUC2WIOCCbp/xuWlxQALSfAghupVnTMgk370J8z1jMweGTwfq1/cAKXbWBP1ONnPH+
 lbU+K2mbWVzO4dzcmQWlijjleea/4m+CezChvv8LZVkyNhSw+G71mVdlaUAhyaimbz3Wp/zE/
 4x0S1dVI3OUecO+N8CVwBE7QdF3EnUoub7w2DDJQHEKcAOsnVAxt6EF/5ecirCkOX1qWUU5lR
 JpClThoIm0p/Ebm8T/wSO4RA/k/t4XGcL4QafZda39ppaRFcZQdlm7JRMaPB2/lDjCdosSB4D
 JO76cMlm1Kxtvo3mYgzaAg03xmGLNwlzBmOsq7R+px329ZPlHd+vveKHjF5JmsauUmOLwuQ1v
 D+1P7Al1pzvDPSk1xGD+eClshKUTWyYG19gI0i9quOZec2CEpOuJ1LHWAWiswL/SgqzonELri
 EDUUu2pyDi/cy8pjfzinvnPc88Bz8++a+OgFKNMhAOc4HjqiObBqQVNtXONBtPKTXRl1TAEW0
 xS3OCrLHq6WBi8pvqrA1mVbPWJo39dR9KsQA9nhNQpQEogqCQJO8mfj7jAwSKMq8a//MUK558
 vrg4Y+bygbW1+Du/0HNhHpIh95SVp3JFVTaTIaEKGhBQ336YFnh5hSBAWbPtfnaS66+46efYY
 GOHVCAqrWop7bKTec3oaYvDKkcc6u8Sl7TXVXG4BWjwuxd7a3I7gnxUb0PNjsbJY9VsN2U2Qe
 HLY0CW4O4IVFrt1RE7FBXh4hN+otUl+/I8tgHnITvZ78ZDKbjv6JQxKAbJvqivBT/1OQgCegI
 Yjm9cf1VHrh049r9kRhNOCLvuS8BxeDBkexRTabRrm+PdhjqP2gY/nLPIgzjdpyuAqWXI=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
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
Cc: Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CDE desktop on HP-UX 10 shows wrongly rendered pixels when the local s=
creen
menu is closed. This bug was introduced by commit c7050f3f167b
("hw/display/artist: Refactor x/y coordination extraction") which converte=
d the
coordinate extraction in artist_vram_read() and artist_vram_write() to use=
 the
ADDR_TO_X and ADDR_TO_Y macros, but forgot to right-shift the address by 2=
 as
it was done before.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extract=
ion")
Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Sven Schnelle <svens@stackframe.org>

=2D--
v2: Fix artist_vram_write() too, noticed by Philippe Mathieu-Daud=E9

diff --git a/hw/display/artist.c b/hw/display/artist.c
index ed0e637f25..8758c77bbf 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1171,8 +1171,8 @@ static void artist_vram_write(void *opaque, hwaddr a=
ddr, uint64_t val,
     }

     buf =3D vram_write_buffer(s);
-    posy =3D ADDR_TO_Y(addr);
-    posx =3D ADDR_TO_X(addr);
+    posy =3D ADDR_TO_Y(addr >> 2);
+    posx =3D ADDR_TO_X(addr >> 2);

     if (!buf->size) {
         return;
@@ -1233,8 +1233,8 @@ static uint64_t artist_vram_read(void *opaque, hwadd=
r addr, unsigned size)
         return 0;
     }

-    posy =3D ADDR_TO_Y(addr);
-    posx =3D ADDR_TO_X(addr);
+    posy =3D ADDR_TO_Y(addr >> 2);
+    posx =3D ADDR_TO_X(addr >> 2);

     if (posy > buf->height || posx > buf->width) {
         return 0;

