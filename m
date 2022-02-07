Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863F14AC4EB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:11:25 +0100 (CET)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6bs-0006yo-87
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:11:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH6VX-0003s8-E6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:04:52 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:55113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH6VT-00078V-2l
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ss+JnL0iWFjA6awPQDdCL1EOm+QNHPgZ7V+ZgoGdgf8=; b=IHabjuqG6wwg9bc2MoFacoJLrO
 9gdh0OkqLZCxu1Qa1gRfS+fT82a1Q4OgJ3K+vxNVkONpU52oS2AWjxA2KPqdn6lteEISIDpgcv6SQ
 +Uy89iSlny0lf7JnlSWypDkXzyqZkt2qvXMW7vRDcWzC1x+XOVJ3GcZpbvj3+yGVnmq025KcPAnP3
 sEujV7iNd/Dka3OjqEDJhq2CxlwjV3bix08y/qxzhykBg93JrQb4XyLbWvwZt9/ejlXwDoi55qFIu
 xEEM7EDRWK+x82m97kISxQJKQQAKNaDAPI5PvPefZLT0vXXju7Fk0qMyZv40AWviZZANMFqUe/H1u
 bNDiEO2ipMlV4FjuEQg/SVTj/iYgS1FhODzOqPrPHejBJojvVkedxPt9ad9NE3mkPP6ItDfkIEtZn
 b5Vbt6dBKHLlwKiNpUfHQYlmNLq1BFJdrvIHGnN9Q6NklhnZyY7GWKro1oICPJ5Lh/3+kEctAqGvc
 JyFJCcjZ6NpcQ3FZ/zbSNKc5sja7uRKfqW7puS+XC6PpwPdUCzFa16zUcQpyfoEUk05p2tBlLAgk+
 vvrYHOIAJ1M4f04oaw1/jjDiAF5UhK3ozXon4HJ43NS/zowjVR8UGExdBLlGKYk4vYj+GUu2hY6OF
 0NRanwZ49XjORZBBfT9t/FUv+FNjSVg6Fz6XkEYFE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, Will Cohen <wwcohen@gmail.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Mon, 07 Feb 2022 17:04:41 +0100
Message-ID: <1645588.LEmmck51Vc@silver>
In-Reply-To: <20220207153930.33b3ca1a@bahia>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <39149990.XXmQAQaIKb@silver> <20220207153930.33b3ca1a@bahia>
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

On Montag, 7. Februar 2022 15:39:30 CET Greg Kurz wrote:
> On Mon, 07 Feb 2022 15:15:46 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 7. Februar 2022 02:05:32 CET Will Cohen wrote:
> > > On Sun, Feb 6, 2022 at 4:22 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.=
org>
> > >=20
> > > wrote:
> > > > On 6/2/22 21:07, Will Cohen wrote:
> > > > > From: Keno Fischer <keno@juliacomputing.com>
> > > > >=20
> > > > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > > > [Michael Roitzsch: - Rebase for NixOS]
> > > > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > > > [Will Cohen: - Rebase to master]
> > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > > > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > > > ---
> > > > >=20
> > > > >   fsdev/meson.build |  1 +
> > > > >   meson.build       | 14 ++++++++++----
> > > > >   2 files changed, 11 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > -have_virtfs_proxy_helper =3D have_virtfs and have_tools
> > > > > +have_virtfs_proxy_helper =3D targetos =3D=3D 'linux' and have_vi=
rtfs and
> > > >=20
> > > > have_tools
> > > >=20
> > > > Why do you restrict the proxy-helper to Linux?
> > >=20
> > > Only because porting the proxy-helper to macOS is outside the scope of
> > > this
> > > particular patch. While some initial concepts around it have been
> > > considered by some of the contributors to this patch, those
> > > implementations
> > > weren't tested enough and the security implications weren't considered
> > > in
> > > full. We assume that this could be an additional implementation later
> > > on,
> > > if the functionality is considered important down the road.
> >=20
> > In general that's fine with me. I would have probably made that
> > "targetos !=3D 'darwin'" instead of "targetos =3D=3D 'linux'", but I le=
ave that
> > up to you.
> >=20
> > On the long term we will probably deprecate the 9p 'proxy' fs driver
> > anyway. While it had some good ideas, being realistic though: nobody has
> > worked on the 9p proxy driver/backend for many years and it is not in
> > good shape.
> It definitely isn't indeed. Also it is super slow by design
> since the round trip of a 9p request involves QEMU on both entry
> and exit:
>=20
>    [guest] --> [QEMU]--> [virtfs-proxy-helper]-->[QEMU]-->[guest]
>=20
> A more modern and efficient approach would be to have a vhost-user-9p
> implementation : requests would be directly handled by the external
> process, without QEMU hops. But this a fair amount of work.

That's already a bit offtopic, but how would you imagine that to work? You=
=20
mean a system dependent solution that e.g. plugs in into KVM or something?

> > I can imagine that due to the ground being laid by these series, that we
> > will also open 9p for BSD, but that should be done a bit later and hence
> > does not belong into these series.
> >=20
> > But once again: it would not have hurt to make your intentions clear
> > either in the commit log or by in-source comment. :)
> >=20
> > Best regards,
> > Christian Schoenebeck



