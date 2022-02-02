Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D864A78AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:26:51 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLHF-0000Hm-PA
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1nFK6e-0006sc-Te; Wed, 02 Feb 2022 13:11:50 -0500
Received: from mout.gmx.net ([212.227.17.21]:38697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1nFK6b-0007CL-Ux; Wed, 02 Feb 2022 13:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643825502;
 bh=MIIiyQepJPQNxy7Y4i69XROYn8tWU8Z5FcYyk0egEm4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=U3pzfTgLwJnuj7xP99NzxldYpP7eC6O8RAJOV3J/YNLAiErVaXD0LM5iebKnsC9ek
 d23mWKN7lBbfvqNs9yX48glCX7GcAhh/kflwwcBAdwCC6o174iKGVyTeneV3dhLOAf
 3Zn7H6D9H9oQ/+xySRb7Xw0d4/8rQ6yPKaQ7Bq/s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bfq-1m9WMq2TRG-017z0Z; Wed, 02
 Feb 2022 19:11:42 +0100
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 6/6] hw/display/artist: Fix draw_line() artefacts
Date: Wed,  2 Feb 2022 19:11:39 +0100
Message-Id: <20220202181139.124485-7-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202181139.124485-1-deller@gmx.de>
References: <20220202181139.124485-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+0YMqEdubNeUTwnR3SuoWbRnYisU4idS56yN74wh46eQ1OcLSGI
 UXxvwfD+eNWz/OsVBkiqDrSyAFECn2xPYNJypZrzRFuJsqj2vwSGAkNOlW6yHwrDJP0vFLq
 NMNflewf3ZU9Gq7LRgeOs9Y7ID/AxLrM5MjdrKfNkh0r61aVUk6a/fT5tykKIC7W7BB5dUF
 0L2qncbv234K5HYsFKr/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5vPjtJqxrNQ=:rnfGOAbMUCdBy3WALVKMWx
 eYP8ySZyfu4wUIzyJf/Dzd5LePvAlziM0n8xJ4YONDmHgzl/Ki8M3Luv3MrZPpuI9EZvZKHIG
 oWWDj+NwZ13KmEQ53DfSNtRO+l7diHB2JdJSGIdHUdD2OQFrq1mX9BIWAq++vXKvG03PfcFMv
 NTwSC/x7Iwr0QGmfd23czqbW3+lCPiicKEkWpkVOk8nCchYTNPUEm2qB3bPq8hZR5uVjXLiTL
 Jh/U9FM41bW5QwDdmn45XrJAC1fVAmF/R/b50542ZWSaM1ZJZ0wZJDT7RG2+iYToUdjPVG5v7
 +gePhIVBVKIc27pdqs8nkOEGxWjrak1q5/f+4WaQ+frmlDGYYAL176AymoVthTOyg0viVItoU
 t4WcwmJBfcMYUO6rgj0qWsoAY2GHFxJn8Ui33cQF2i87FjjXre7G87i3qSDfS6tfZX54zDV/L
 JnhT7RotRz4iOfQaaI5tZ+WM4PY+JEZPrGs/xRAL/Nc432QsWug8gkS9I3Q5q9zSsyyPLyze8
 D675bNN449aekqHtywwMNalT6qQ1NbdndUjP8kZm84Kzri6EQSxIIbfO/M/UaQa57y1kTbbqx
 JwLVJneBiQWTsR3uNfZtdeK/lYXys8XruhOV1tlBtGBLNL6/d8AYaA6Ow3CsYKSesrLSm+juR
 0uDVzeYMYh9WzTLz1f7jvy7EDOMFwMjpyoSnzAzQQhrBARGiKMNmp9MNIGqKc0EQ2CgJOV+U6
 /WhEox5ORHORF0z68Jr6QQ4nSNHr9NYNJAv48boirgg3RK6WGO0lnYanmBmdeHYCLqDZVHDe1
 GddLKYXmT970ubup4rc8fEdJnJC+klwXK4rKobkmD/Tl/lhsRYYKn71G/RJhlVrAO+FMBflZ5
 hQwds8NcHXe3f7yxczZmUWSf44UzDtZB7VXrYUCgivLPQt1BpmpwFwOQSelHyRLynvDIZpzId
 DSdECeYNSsZCR/4FhOUwZ3EK/EayLQPCZ7RHeK4QmL1i3m4bKZsr0ks6//WRcJb8rxzep+1Rj
 drRE65+X9FOmvckHO/5v4cexA8EOjT15plQSelZztL1dI1VDqqNweociniJJnFiBNJ+PbiddK
 JftfMjR39eRX64=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 qemu-stable@nongnu.org
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


