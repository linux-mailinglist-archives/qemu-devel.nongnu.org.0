Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E6E4A9C27
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:42:22 +0100 (CET)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0j6-000165-Fl
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:42:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nG0aQ-0006qA-Tx; Fri, 04 Feb 2022 10:33:23 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nG0aO-0004zh-6O; Fri, 04 Feb 2022 10:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ocNeoNP9HxkIfK1BFJyxZpPZSTBGxTw03GlWfmFlDrY=; b=BbzDtERjCgqRtNSSZrm5f3feNq
 GxFksKmWhVOxArfFRloN6N+DK1rK+guDWqKxNwqCJdapi+ax/8fn7cUx+Lu0kzHjEoQdye1DqKW24
 n/n15X9ygtzxfRCPTc5NS1xpZnOZBVnqSM5Zgvi9oDJIvJc76cFICA+D92UmavBn1X3BgFRZjVw4S
 GvV7AjYEqV3zlpaGTKtKTqLR2VcKZjsvIX+CQDScOskhYXKbsXNNc6yDMFU+RAZsl0cIh6Sk0Fp6x
 XkdJA9lETT8K2FZxVKWmkHQOzA8OqkW93YFeWWzx1tzx7mmghlIayYoZK73fOopi11CGQ2oEVdiFU
 leDUL+7o9XptxkRK5DSUd0mRBlmTgPKnj6fXbTnNNTUcBF5L/OqOhXvZzYZlqc3aS+Ry6Iszhj7SW
 dvz1Qy/ZXTH6PHYtCBAtjjxuzedL5gks9NBCuIerB/I4MtdFAIjeAhGN8FdpR08KbBV6oT1eQt9sj
 7jeRZjrm6okQgO3upijmVlJifkt7YtdwjbeUbN+iG2aGGb6ETh9uzpohPVg0NXAUHR0XpbMLkWV8d
 Co5BIPXftzSr7cInlnQ4JeE2oa7jBcDFgSEOkbO1J2FHeika0U+wCm3TDV2mZN82l6j0C574rSPXP
 EEKRlflctYsgR85jU3WQW30COf6ffJmv/jlGG9rfk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org, ldv@altlinux.org
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 04 Feb 2022 16:33:13 +0100
Message-ID: <2106305.L43djaopl2@silver>
In-Reply-To: <20220204161606.162d2c05@bahia>
References: <20220204050609.15510-1-vt@altlinux.org>
 <28345882.VnrBaU8NEn@silver> <20220204161606.162d2c05@bahia>
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

On Freitag, 4. Februar 2022 16:16:06 CET Greg Kurz wrote:
> On Fri, 04 Feb 2022 15:12:18 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Freitag, 4. Februar 2022 14:55:45 CET Philippe Mathieu-Daud=E9 via w=
rote:
> > > On 4/2/22 06:06, Vitaly Chikunov wrote:
> > > > `struct dirent' returned from readdir(3) could be shorter (or longe=
r)
> > > > than `sizeof(struct dirent)', thus memcpy of sizeof length will
> > > > overread
> > > >=20
> > > > into unallocated page causing SIGSEGV. Example stack trace:
> > > >   #0  0x00005555559ebeed v9fs_co_readdir_many
> > > >   (/usr/bin/qemu-system-x86_64
> > > >   + 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir
> > > >   (/usr/bin/qemu-system-x86_64 + 0x4982e9) #2  0x0000555555eb7983
> > > >   coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983) #3
> > > >   0x00007ffff73e0be0 n/a (n/a + 0x0)
> > > >=20
> > > > While fixing, provide a helper for any future `struct dirent' cloni=
ng.
> > > >=20
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > > > Cc: qemu-stable@nongnu.org
> > > > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > > > ---
> > > > Tested on x86-64 Linux again.
> > > >=20
> > > > Changes from v2:
> > > > - Make it work with a simulated dirent where d_reclen is 0, which w=
as
> > > >=20
> > > >    caused abort in readdir qos-test, by using fallback at runtime.
> > > >  =20
> > > >   hw/9pfs/codir.c      |  3 +--
> > > >   include/qemu/osdep.h | 13 +++++++++++++
> > > >   util/osdep.c         | 18 ++++++++++++++++++
> > > >   3 files changed, 32 insertions(+), 2 deletions(-)
> > > >=20
> > > > +struct dirent *
> > > > +qemu_dirent_dup(struct dirent *dent)
> > > > +{
> > > > +    size_t sz =3D 0;
> > > > +#if defined _DIRENT_HAVE_D_RECLEN
> > > > +    /* Avoid use of strlen() if there's d_reclen. */
> > > > +    sz =3D dent->d_reclen;
> > > > +#endif
> > > > +    if (sz =3D=3D 0) {
> > >=20
> > > If _DIRENT_HAVE_D_RECLEN is defined, this case is unlikely...
> > >=20
> > > > +        /* Fallback to the most portable way. */
> > > > +        sz =3D offsetof(struct dirent, d_name) +
> > > > +                      strlen(dent->d_name) + 1;
> > > > +    }
> > > > +    struct dirent *dst =3D g_malloc(sz);
> > > > +    return memcpy(dst, dent, sz);
> > > > +}
> > >=20
> > > What about this?
> > >=20
> > > struct dirent *
> > > qemu_dirent_dup(struct dirent *dent)
> > > {
> > >=20
> > >      size_t sz;
> > >=20
> > > #if defined _DIRENT_HAVE_D_RECLEN
> > >=20
> > >      /* Avoid use of strlen() if there's d_reclen. */
> > >      sz =3D dent->d_reclen;
> > >=20
> > > #else
> > >=20
> > >      /* Fallback to the most portable way. */
> > >      sz =3D offsetof(struct dirent, d_name) +
> > >     =20
> > >                    strlen(dent->d_name) + 1;
> > >=20
> > > #endif
> > >=20
> > >      return g_memdup(dent, sz);
> > >=20
> > > }
> >=20
> > That was the intentional change v2 -> v3 Philippe. Previous v2 crashed =
the
> > 9p 'synth' tests:
> >=20
> > https://lore.kernel.org/qemu-devel/2627488.0S70g7mNYN@silver/T/#ma09bed=
de5
> > 9a91e6435443e151f7e49fef8616e4c
> >=20
> > You might argue that the 9p 'synth' driver should instead populate
> > d_reclen
> > instead, but this v3 is a simpler solution and guarantees to always wor=
k.
> > So I'd prefer to go with Vitaly's v3 for now, especially as this patch
> > would go to the stable branches as well.
>=20
> This really is a band-aid. Anyone reading this will react as Philippe,
> and this is common code, not just 9pfs. With correctly populated dirents,
> the helper could be as simple as:
>=20
> struct dirent *
> qemu_dirent_dup(struct dirent *dent)
> {
>     size_t sz =3D offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(dent)=
 + 1;
>=20
>     return g_memdup(dent, sz);
> }

Which requires _D_EXACT_NAMLEN being defined, whereas Vitaly's solution=20
ensures to work on all systems.

> If this is a cycles problem, I can help reviewing the fixes on
> the synth driver, or alternatively you can keep this code
> somewhere under 9pfs but please don't put that in common utils.

Who cares, sends a patch, and makes sure that it works at least as reliably=
 as=20
the currently suggested solution (tested with guest and test cases).

Thanks!

Best regards,
Christian Schoenebeck



