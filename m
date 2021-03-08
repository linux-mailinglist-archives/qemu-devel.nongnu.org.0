Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA6331070
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:12:09 +0100 (CET)
Received: from localhost ([::1]:44120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGcC-0007YG-2m
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJGU3-00067n-Gj
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:03:44 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lJGU1-0006jD-6J
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=J1YLmd78NoGv1ZRrA/YS++nrdFGOvQx2k2Ytu86mus4=; b=PyZoel48oHMGRTl4jcf5gNOb6/
 vF2PkYWplS3Jx1sYfe7xZKt8AerXhbT0Rifni9v9/fqOVgp8WvoT8Vj79fcMCc7tElZRjvz2R4xBb
 +vG3wmRC3A6pqlQPUotvQcDmw0QnSjdn1faTe5ehSyiM5ifJnem10++Caf31AxDzvehIJMi/5EzmJ
 G/X7OBmtm+IBFRSFP4YtIJpQh4B7gv9Hv5hFWBxYWKDgySMuUtenDhgMeagT2SB8IhLoZkhbqMoqD
 ANgZA4xYJIRr1JEy/idqElkybJ/GPS1QN55HDx6ybZDmMySoiZWaJKsf105Eyvbxidn3CihOi9tlz
 Ms/zqvbEi5YlrdN8nP5wkhAKsDpeY/f6j5MJ1gRiMfWsNZiz4lRXr6xvkMJ7aUoHGWqpKyji85m+m
 csp0FA1jIwAdZX0HxyAZ9MGRrtKqCkHyc+hqcMguu0DoQo/3dmUonNFoaFaGJuVlwuWxPnRuNgP3/
 NoLtNXt4cchyHRbWEOHtOLCG2PE03BS1dI+4PANbyiFXDsZ8PRiuPrvNmNvTaVWmt/DRyKHG/DwTL
 HFFq4UBN4UH42DLDQfmnMPFj6ypPlaLnMx1k+F0/eN+EkzPjB9O8U0M/7BUy6ZoLdqsC4L9AdF+za
 u+YZbUbcujC/dQsYSbz+QGdCUSSoBh7ouDEqAHzAo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
Date: Mon, 08 Mar 2021 15:03:33 +0100
Message-ID: <2083224.5eVbfnxiYP@silver>
In-Reply-To: <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com>
 <134602378.QJW5UkElOJ@silver>
 <CAFEAcA-36A9RAB3eqi6-SHJSUxpzJsgVo75d3DZXcWhGYwLhrw@mail.gmail.com>
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

On Montag, 8. M=C3=A4rz 2021 14:37:44 CET Peter Maydell wrote:
> On Mon, 8 Mar 2021 at 13:32, Christian Schoenebeck
>=20
> <qemu_oss@crudebyte.com> wrote:
> > On Montag, 8. M=C3=A4rz 2021 12:31:33 CET Akihiko Odaki wrote:
> > > 2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 19:39 Christian Schoeneb=
eck <qemu_oss@crudebyte.com>:
> > > > This was just about silencing the mentioned automated Coverity defe=
cts
> > > > report. If you have a better solution, then just ignore this patch.
> > > >=20
> > > > Best regards,
> > > > Christian Schoenebeck
> > >=20
> > > I do not have an access to Coverity defects report. I'd appreciate the
> > > details if you provide one. I suspect I made a mistake somewhere else
> > > ui/gtk.c in c821a58ee7 ("ui/console: Pass placeholder surface to
> > > display").
> >=20
> > Unfortunately Coverity's defects reports are not very verbose.
>=20
> The online defect viewer is a bit better for showing why it thought
> something was an issue. In this case we have at the top of the function:

Ah, good to know. Actually never looked into the online viewer. Thanks Pete=
r!

>     trace_gd_switch(vc->label,
>                     surface ? surface_width(surface)  : 0,
>                     surface ? surface_height(surface) : 0);
>=20
> which tests whether surface is NULL, implying that sometimes it is.
>=20
> Then later we have:
>     if (vc->gfx.ds && surface &&
>=20
> also checking surface for NULL-ness.
>=20
> Finally we have:
>     if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
>=20
> which dereferences surface without checking if it's NULL.
>=20
> So there is definitely a bug here:
> (1) either surface can never be NULL, and all the places where
> the function is testing for NULL-ness are wrong and need to be removed
> (2) or surface can be NULL, and we should check here too
>=20
> Coverity can't tell us which of the two possibilities is right, of course.

BTW, there is __nonnull supported by clang, e.g.:

static void foo(void *__nonnull p) {
	...
}

Maybe as an optionally defined macro (if supported by compiler) this could =
be=20
a useful tool for such intended nonnull designs, as it immediately emits=20
compiler errors.

Best regards,
Christian Schoenebeck



