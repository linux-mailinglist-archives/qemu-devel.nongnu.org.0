Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA71330F2B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:31:48 +0100 (CET)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFz9-0005Ks-MI
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJFDo-0006Ve-Sr
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:42:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJFDm-0006IS-T5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 07:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8viDl3lhYCs36VVutx2j225iB6EY3cUEsTqRTzP8azI=; b=Tj5F2luoc+R5XIcilo8F8Fgqpc
 qMN8dSmasQ/OOKy8hBNu3a/6bB87s4B0ivrM4rcsjquT9RufQmTB27SwqvXlr2bCVrHn2yvqczYab
 /pPKCIyJB3kHxKa20ufq4137+WzEB57hDdl8w511wRPeRmEleP3uR+6xXNF0cdk2OX4JSDvwk7xh7
 hvu7EDmhj7z8zHW9s2Wg61rcxBTPKNY3wrH8qWYD6g+Pincy9Dwn0m26LnhzdXe7/+L9B7VO/0BXk
 EQtqnqcW8+ivFtClWAug4QXD47fc94In9QWhsFDXmaw2sGKSpEbrGlLJxRbutpT22mbLDNRF38MWU
 qtuyGdUwHC063ZmxaUGnYbaLXxFPNrO2ISQK+QGq79WNlusqpiZmAxAXkJ5D9HEe6SlEYpQLdroCi
 +FMouALLmU1LD+rCVA/BCHkfjDFh+jWCvtREp2K/ShrDs8VhB2YLlenucOV1pTUU+L9mS+LvmAA6c
 y8e0Y6Gt6qgbnyZr3cr2momzcRrhn/2p9kJaCo4C1FNrJS+2MApDlD3+LkCAflNiYnt+qskBPaH26
 0MjwyN+sl/86ezZUGlr4UL8poCfeAQF4TXAiU8Vl6OR0J8hQVeQr2jVs1soX2Oz2Co/EmQWghmnaT
 EGU0irNDlC8CAakjfLSffS+qFjWz81iKWcR+juPDI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
Date: Mon, 08 Mar 2021 13:42:47 +0100
Message-ID: <134602378.QJW5UkElOJ@silver>
In-Reply-To: <CAMVc7JXb=eK2FgEx0SV7N-DL65EaMPKHM9rZnHCfu5KTPin48g@mail.gmail.com>
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com> <2891210.4AG6acVJ2Y@silver>
 <CAMVc7JXb=eK2FgEx0SV7N-DL65EaMPKHM9rZnHCfu5KTPin48g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 8. M=C3=A4rz 2021 12:31:33 CET Akihiko Odaki wrote:
> 2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 19:39 Christian Schoenebeck =
<qemu_oss@crudebyte.com>:
> > This was just about silencing the mentioned automated Coverity defects
> > report. If you have a better solution, then just ignore this patch.
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
> I do not have an access to Coverity defects report. I'd appreciate the
> details if you provide one. I suspect I made a mistake somewhere else
> ui/gtk.c in c821a58ee7 ("ui/console: Pass placeholder surface to
> display").

Unfortunately Coverity's defects reports are not very verbose. In this case:

*** CID 1448421:    (FORWARD_NULL)
/qemu/ui/gtk.c: 570 in gd_switch()
564             surface_width(vc->gfx.ds) =3D=3D surface_width(surface) &&
565             surface_height(vc->gfx.ds) =3D=3D surface_height(surface)) {
566             resized =3D false;
567         }
568         vc->gfx.ds =3D surface;
569    =20
>>> CID 1448421:    (FORWARD_NULL)
>>> Dereferencing null pointer "surface".
570         if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
571             /*
572              * PIXMAN_x8r8g8b8 =3D=3D CAIRO_FORMAT_RGB24
573              *
574              * No need to convert, use surface directly.  Should be the
575              * common case as this is qemu_default_pixelformat(32) too.

So no detailed path is outlined that may lead to the detected situation (i.=
e.=20
no call stack or conditions like you would get e.g. with clang's static=20
analyzer).

There are false positives sometimes, but they should be silenced in some wa=
y.

So as you assume "surface" pointer should never be NULL, why did you remove=
=20
the return statement in gd_switch() with c821a58ee7 then? Redundancy?

diff --git a/ui/gtk.c b/ui/gtk.c
index c32ee34edc..3edaf041de 100644
=2D-- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -567,10 +567,6 @@ static void gd_switch(DisplayChangeListener *dcl,
     }
     vc->gfx.ds =3D surface;
=20
=2D    if (!surface) {
=2D        return;
=2D    }
=2D
     if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
         /*
          * PIXMAN_x8r8g8b8 =3D=3D CAIRO_FORMAT_RGB24

I was reading your change as you wanted to reach the end of the function in=
=20
case of surface =3D=3D NULL.

Best regards,
Christian Schoenebeck



