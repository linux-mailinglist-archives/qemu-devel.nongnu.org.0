Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D634AC18D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:45:48 +0100 (CET)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5Gz-0001mk-QF
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH4oB-0001pU-Bb
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:16:01 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:35117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH4o7-0004MC-OY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=PkKnHUd6uvR2ezL1T1NOdjKnYEQch/YMvdRyIhhJa7Y=; b=ZotOgxyidH+NzkDSY8lJZQOoeR
 YgGK5oCeniP+9kDbX0ycSQpKwsrAKqrQlDTxp2JMUloHTXwfNjOeEvTwLbEvAnewP7PXhfA4eRuPo
 cXWX/SdkFZhmEHYrfks3UmZdn1zSqLJHcqHZi3uFDWUAGTSiyYk6Y663cxj89K/UFj0QQITqX1HU+
 DMxU5U507RkcZilcktPTQMpbvaPf1iRZ6o4PVDewqQN1cCmVX3aKOHkw7LHD4a4Bf/TRg9ghpTRUI
 kjPuT9sYp9AGYNU9tRxhKTNrThpwrOKHCARG7fjXUxGA4TpxD4ZIP5SB/J40XIVlixBTXTY9PYGWi
 hrgQDbBCzh2yPAcpQPUS2lAnQsQLhR9x+vq80y4foI47wf0k8D4uiLuBM35+RoeEpDREPNpnMIjgI
 AmXncREPy0bV8W0F4vGXgjuPf0iqWfTUwh3KsOAwjq2hH7nQSYem9JToNGkvuFiLjzZ3rlyISd6pJ
 F+nZ0qdjhHIBHNVJthCQloEWcznX3SY1NWtexYByr0CKzwIIKUEyQ46T6ltw5OO/T6ObKSFRqtTCt
 zzIS2Y0/VJe8v9nETvPNtbdppqO4sQXrH81E3SqRWzr3WSa8qKzS+A8R4NvadfbGxp/kxVPLPNe3V
 z2E5WTGUYhtx8Pambc/GQ+8080sKMFXVTJCNPpb5Y=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Mon, 07 Feb 2022 15:15:46 +0100
Message-ID: <39149990.XXmQAQaIKb@silver>
In-Reply-To: <CAB26zV2sx-9PGhk5Rbz-q+sQJ8yxqOOO32J_k5vb7_sPNgFBnQ@mail.gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <9265b724-d9c3-7c06-20ac-177feb63fee9@amsat.org>
 <CAB26zV2sx-9PGhk5Rbz-q+sQJ8yxqOOO32J_k5vb7_sPNgFBnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 7. Februar 2022 02:05:32 CET Will Cohen wrote:
> On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> wrote:
> > On 6/2/22 21:07, Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > >=20
> > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > [Michael Roitzsch: - Rebase for NixOS]
> > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > [Will Cohen: - Rebase to master]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > >=20
> > >   fsdev/meson.build |  1 +
> > >   meson.build       | 14 ++++++++++----
> > >   2 files changed, 11 insertions(+), 4 deletions(-)
> > >=20
> > > -have_virtfs_proxy_helper =3D have_virtfs and have_tools
> > > +have_virtfs_proxy_helper =3D targetos =3D=3D 'linux' and have_virtfs=
 and
> >=20
> > have_tools
> >=20
> > Why do you restrict the proxy-helper to Linux?
>
> Only because porting the proxy-helper to macOS is outside the scope of th=
is
> particular patch. While some initial concepts around it have been
> considered by some of the contributors to this patch, those implementatio=
ns
> weren't tested enough and the security implications weren't considered in
> full. We assume that this could be an additional implementation later on,
> if the functionality is considered important down the road.

In general that's fine with me. I would have probably made that
"targetos !=3D 'darwin'" instead of "targetos =3D=3D 'linux'", but I leave =
that up=20
to you.

On the long term we will probably deprecate the 9p 'proxy' fs driver anyway=
=2E=20
While it had some good ideas, being realistic though: nobody has worked on =
the=20
9p proxy driver/backend for many years and it is not in good shape.

I can imagine that due to the ground being laid by these series, that we wi=
ll=20
also open 9p for BSD, but that should be done a bit later and hence does no=
t=20
belong into these series.

But once again: it would not have hurt to make your intentions clear either=
 in=20
the commit log or by in-source comment. :)

Best regards,
Christian Schoenebeck



