Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07174A518E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:38:09 +0100 (CET)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEeNE-0007E6-5A
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:38:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeL3-0004RN-6Q
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:53 -0500
Received: from mout.gmx.net ([212.227.15.19]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeKm-0000w9-ER
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643664932;
 bh=MIIiyQepJPQNxy7Y4i69XROYn8tWU8Z5FcYyk0egEm4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=i4OVB5LHFpavWQXiItg+tFGNnpKtFmkiiSash5rlEAPZhsQ0cXSdqF+p5rasNtUHt
 nBSTZ95F/b0NbVEQLl9GCUZD3nq2RLeTXXmOIv+ERMZUuMSqH+VGMFJMhLW3bteR5f
 P4qq8s+Hd9u8d3k9QYxzjWXw29401OWiTIPsDzw4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.183.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1mkckh2lmd-00Vi4i; Mon, 31
 Jan 2022 22:35:32 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/6] hw/display/artist: Fix draw_line() artefacts
Date: Mon, 31 Jan 2022 22:35:29 +0100
Message-Id: <20220131213529.17404-7-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131213529.17404-1-deller@gmx.de>
References: <20220131213529.17404-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ytZg8OnDrfRxWNLOASYBdompMidptMUY5LYjuTlLuWF7BNsOhOe
 /1H2lI+a41j1rIcfjqVO2A0QT5n8NdnICN9Lbw7stnfpHKYt33zeMUW5OA5iPD7KstTdhZU
 aBzQeS5+00gw48pdldDTiU2panNr7F1u5TXXour7lhZi+eHcBRUGN1E55MJ0ulZTaNGcmx2
 BUJWL/TbAi6OCrNE8tLag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dKTC8/UA4X8=:AjysAOItOVJA9hNw+VKmLh
 HRXIN/vXPU6XcLNgpZeWBPUd2Ar3Ys60Yed6obcuLX3BQYP7ayp7apl3mlVZnn346HsrDZx3D
 qvh072rd48DgshQwpehPu+0miJg8GH515PpUSw55dcuTTwLuSj5ZJp95YcCZBV1vm33OqPWGZ
 st1lomm0sSPT42jOfv0hlj1VYFiJAmPbO/HtprIyFg7Lz4hUiiXOWgluadcYsuvCyZ0VOyzxH
 9WOTNddoQ6lfDW9xOYmokCWkCSb6Lv6RaxwD3AI8s0Uzdoq8w6isB9o52wRD046fMGl1Rc3uH
 yu5irUyecGMJL/vcn71KAwaVrwgRl9KK52ZjFp8vNDLZGacxAKEHOjasU+/oZ2C27W4Awhudh
 FzlJ6tlQvedpJYX2VSzN/r4iAn75MG4zQiWvUUTse7/EK7fgEzVzQLakLiSXZIs2rQro9qIrN
 aXuUVAZDFHGoog+gnFf1QS69ysx5s7AmsvrsJcpKwfraHD6jrugaXefEEVfF0uaw6PUqGf35m
 ftD/MeJj2w5wFJE0ndine66ZZ/AwrzeqgeeBTjikk/OFRbEedDy6UeUDmhzozOTlRTPbTgSiA
 TGOdZBEwPFu5ODtWEqqsUPOFR3Yld3NAw9bC16Rb4mHNLU9VWO4IjYjtlSTODyY3NuegA4wA6
 Ski1RDThSuTBkcG9YUAVYF+JA1bEM0RTgs0/oiG6DBYD/hKw2Mq5bzb4om/ZJX7VwkTceqfmC
 dDCpvn1KxmRUe0fOAU7RWbuexPbZCYkUlqIOwERfLPq/a6sc+SpGWmgLiAl3VQ+IpXKcIOkqz
 qcAUsvxvfGt56tYEzXV+HYKBYfgJ0RjxGqIFnJD1cJE5b98gJHP+ecrY5h3JLnw+xTUJRKzZn
 hjWjUAcVeDcErLK56YO+kjyiqJOXB/3zuT5oWdizwJZf1Xhx7XmZgJ5Gyu3+be24sx8pHa1HH
 jOmVGJ76yLYOfKnhKGquQm4mz5J0Rl3xvuKtT4o3WOIaDw9JJ6vDouAiPwyC2e9ztkW6KxpeF
 00WjE8+2m+siae7nROCiq+2xyC/Xk057sC1Ys3fDzhUJM4P5lD6WztgK/OPwcxuRGnKFiCtTi
 T5yTIw8AkBU4Pg=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sven Schnelle <svens@stackframe.org>

The draw_line() function left artefacts on the screen because it was using=
 the
x/y variables which were incremented in the loop before. Fix it by using t=
he
unmodified x1/x2 variables instead.

Signed-off-by: Sven Schnelle <svens@stackframe.org>
Signed-off-by: Helge Deller <deller@gmx.de>
Cc: qemu-stable@nongnu.org
Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 8a9fa482d0..1d877998b9 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -553,10 +553,11 @@ static void draw_line(ARTISTState *s,
         }
         x++;
     } while (x <=3D x2 && (max_pix =3D=3D -1 || --max_pix > 0));
+
     if (c1)
-        artist_invalidate_lines(buf, x, dy+1);
+        artist_invalidate_lines(buf, x1, x2 - x1);
     else
-        artist_invalidate_lines(buf, y, dx+1);
+        artist_invalidate_lines(buf, y1 > y2 ? y2 : y1, x2 - x1);
 }

 static void draw_line_pattern_start(ARTISTState *s)
=2D-
2.34.1


