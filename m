Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06438F456
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 22:26:18 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llH9V-0004fZ-BQ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 16:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1llH7n-0003mP-Vx; Mon, 24 May 2021 16:24:32 -0400
Received: from mout.gmx.net ([212.227.17.21]:58523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1llH7m-0002gW-5x; Mon, 24 May 2021 16:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1621887855;
 bh=ybB/jK3BAitA9YZKDHQ3eipIY7xVQZrgcRLdG2b4tAg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=EEPO702qltdm4QRVK8rhfZlqj6eHMvNn9DwX6PAXE4JUX0tiQ5GM2PDJYj+Qqqqe/
 wRqu6/QC/3AAk08Fb4WmlJU5VngsFs5InUhCYi8QseS+AuUaFtrT7dRhG/o59At9WB
 4pplCda3EhkEU8BS3a7kYn7O94m/aiWjrfbOhmcw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.143.138]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1HZi-1ljc9t0hkw-002rXD; Mon, 24
 May 2021 22:24:15 +0200
Date: Mon, 24 May 2021 22:23:20 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/artist: Fix bug in coordinate extraction in
 artist_vram_read()
Message-ID: <YKwLOP/IAGG1u7em@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i8UdfH+aOC1sacxOY/buPS4wY5YwB94pcyCuDmG1DP2b7VKMOBS
 lULrHjQBtzf8DeXSQjaX+QojJdm1R3Izf2iTUM6CQrbi45t0CkO+RWZYRZj5/pucsVtAsho
 45hGkt4nvFNZq1iRuCHq3x3sKKLMs8beERbaIEvNcrgyIira9N3f5QpqtRANC0rxxY6Wkgk
 3FmKCJbWpxP4xmDzMuwug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:apXmfdWBS7s=:tEu/EzJiSolGj9lmv5wsTq
 F6M7jDav6qjhWCdsNfqDdbXhC8UE2ndUc0mq5fMUEsREhA5/Pyy01S3E1wtgvatxc8bkEpRS7
 MtfwGUpQJ8yz7akmimTAWgxBgnK1ps+1F/WLakua7KICwCEHPvQ+C0jEwO/NPEMioA5u8phtE
 uskcWKpvTxTrcc/mHfh4jp1hm4S+/g2Akov9PAMkpOwwvQlOzdhuObXw9uVxPXLgNy/tQpNog
 GutkklGrhnYPCjCnzg6W/ghxfXpcLxtC/LyHgKTi2MDw9o7aC36zvI0iNslB1Kc7czNmOXkaY
 mEBbyHqaoe5VkPN73yazFBQjH+veB0plk15PNnF1oL13pHNUPQzuDDR6MKouWVE+YbeK4OYgz
 85BVPTuQHtZ7k4MtE9vQsvvqe98aoBdgROqgqe+QV52+yU8IjTeJBLYCxEjTRB5gYq8nWlCsb
 CvehKF9uaO15rpvvI3p6DlRexlhIDH/VOpBuz+9ChP/fR38mXTOq5rDgg+2kwiDoAX7CZn097
 EvokSVFC2MdnC7npXbYqrNplb/zXVkNhe7Msup8mRMuhHpidzEFDx9ch7cbWKDyzeW5buo+z3
 TGfBXKeBIZAQFoD0WR9CMmHA0nMGC5tLppAJ3L6rc9/my6omiqHn6K3rcZZbaFxhfA+0KFt3h
 AyLtwxnvx6T7AoiWzvhdG6IniMRqT2Ig7VPc5qGj8UDx492jquZdRIWPHWuBXDUFlXztccmGM
 vsM6QwrKfneIgwgROz9XdloRqMSbGopt3nqIf4spST/exyryp8AWqlig4jBzZ37wSNtHNykpq
 gxM1VwMvVh+IllQcEB56CX29owTY9PTmPvTBzle6Mc/kH68zJybgRysuTw0NpePW+e3vWW2Nd
 rbc90nzYSJ5VWomM2BBsMdXoPdISQpnmSwf8J+1BYA5MTWtLkVUb2KLpIOHGo0UeiAbj+bjUi
 yrxNsK0LPIT/4Sf+BZ5J4QDoOnquUutSjsX52KMHkkVd9n+IKj1tp/iszucwcIR8Rq26kdDZQ
 DxfAMgA2OunIr009+J0DCwlDwFjkERSiss+2Malg191NedkfDe/6Li+FHXHrr3IpefLKIGL5c
 4LVIUYBTKYQ95icemcdZoDnskJs1G8K9Li7zZQUOy4Nr54x3rwYMFxEMSdTG4WMk0l5lVmvW/
 qHVQYemNcWlo6zvtoqkQhPA1pS7nZRshPN6lBaeqirb14IGGznOKbJfOvqOgn2Roxikn4=
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
coordinate extraction in artist_vram_read() to use the ADDR_TO_X and ADDR_=
TO_Y
macros, but forgot to right-shift the address by 2 as it was done before.

Signed-off-by: Helge Deller <deller@gmx.de>
Fixes: c7050f3f167b ("hw/display/artist: Refactor x/y coordination extract=
ion")
Cc: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Sven Schnelle <svens@stackframe.org>
Cc: qemu-stable@nongnu.org

diff --git a/hw/display/artist.c b/hw/display/artist.c
index ed0e637f25..34efd3a565 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
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

