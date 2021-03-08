Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC98330B6A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:40:51 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDJi-0000NI-2w
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJDIh-0008Ms-Ml
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:39:47 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJDIf-0001o3-Fk
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=LkfHOBdwL3BjT0wvdOCEUermoIl7DcxmQyreb4srMR4=; b=NX29sp0sf3cg9PLfYUmIKLLFB+
 a+Hz8DGtzja9ZLd4tE0R6NTnNCt/eGDSc1vbiPHpON1sMqXkBoyxLbYRMGmlCIXab9jzSdXi0pwTc
 0vZ5Qn4liQ6Tt7SUjec6vMo5qmLxN/HxVgGartjWKWIWm4Hk0gEtJJ+mXSsfCJSyhfIHr3c3D87oJ
 9jFdV6J67DnxrRS30Rd1SAqsX2wlQwjO0SrTW0VQfPYK8qDWizJFcaomSAJ/ID7gT3rrB7Ww7JpgQ
 TEv1hQZwSu+1ZXOuQD2ZY0hNKcUFqbyGnHprIsyv2INHjzUjwSFW8zJIOt/X9nW5VayYt7dHd3haY
 kwwH3nz41Q5Opm5FZlHWWydYNTfa8JRvuXBWoEO9dclcukyYaswkkvuMjIUcKMpnzVGYtCu0TiEZE
 3sWgnBmHRs/PKp9xxSAmX7vShAMh5QQfO8EZ9habaposMMYLPShq1JyV0Tb/ojrBXmNlD26Vb5WlT
 Z9yBpWpiCwngVxpWk93a8IItj0xnPNji/u9tVq92zgq8zOYqlBg0fU2JAfSId4Uly4uICTbQtvswG
 Z0wauZc3YF+hUBY8xnXhlc0quXg5fPwjrLDh2t2zkzDyej6CDS4VINZXNJ7ESsgEziUY8viEzjrbd
 sw5pOkEn9guI9ntgT2a36JUoEO3CQeDV5hfRkuVa4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
Date: Mon, 08 Mar 2021 11:39:35 +0100
Message-ID: <2891210.4AG6acVJ2Y@silver>
In-Reply-To: <CAMVc7JVh9zzPs6zxjNFuxZSZzqzYu13H=9NBH6__X+h-eQivfg@mail.gmail.com>
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <CAMVc7JVh9zzPs6zxjNFuxZSZzqzYu13H=9NBH6__X+h-eQivfg@mail.gmail.com>
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

On Montag, 8. M=C3=A4rz 2021 04:45:24 CET Akihiko Odaki wrote:
> 2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 4:57 Christian Schoenebeck <=
qemu_oss@crudebyte.com>:
> > DisplaySurface pointer passed to gd_switch() can be NULL, so check this
> > before trying to dereference it.
> >=20
> > Fixes: c821a58ee7 ("ui/console: Pass placeholder surface to display")
> > Reported-by: Coverity (CID 1448421)
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> >=20
> >  ui/gtk.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/ui/gtk.c b/ui/gtk.c
> > index 3edaf041de..a27b27d004 100644
> > --- a/ui/gtk.c
> > +++ b/ui/gtk.c
> > @@ -567,7 +567,7 @@ static void gd_switch(DisplayChangeListener *dcl,
> >=20
> >      }
> >      vc->gfx.ds =3D surface;
> >=20
> > -    if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
> > +    if (surface && surface->format =3D=3D PIXMAN_x8r8g8b8) {
> >=20
> >          /*
> >         =20
> >           * PIXMAN_x8r8g8b8 =3D=3D CAIRO_FORMAT_RGB24
> >           *
> >=20
> > @@ -580,7 +580,7 @@ static void gd_switch(DisplayChangeListener *dcl,
> >=20
> >               surface_width(surface),
> >               surface_height(surface),
> >               surface_stride(surface));
> >=20
> > -    } else {
> > +    } else if (surface) {
> >=20
> >          /* Must convert surface, use pixman to do it. */
> >          vc->gfx.convert =3D pixman_image_create_bits(PIXMAN_x8r8g8b8,
> >         =20
> >                                                     surface_width(surfa=
ce)
> >                                                     ,
> >=20
> > --
> > 2.20.1
>=20
> When will the DisplaySurface pointer passed to gd_switch() be NULL?
> Also, it affects other displays so it should be fixed in ui/console.c,
> or fix all relevant displays.

This was just about silencing the mentioned automated Coverity defects repo=
rt.
If you have a better solution, then just ignore this patch.

Best regards,
Christian Schoenebeck



