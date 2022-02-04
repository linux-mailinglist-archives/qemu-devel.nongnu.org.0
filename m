Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2E4A9BF0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:27:55 +0100 (CET)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0V7-0000Eh-OX
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:27:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nG0N9-0006Ud-R1
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:19:41 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:59442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nG0N7-0002au-MX
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:19:39 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-nCU7uuEYO7mdXbqfXt8Aog-1; Fri, 04 Feb 2022 10:19:13 -0500
X-MC-Unique: nCU7uuEYO7mdXbqfXt8Aog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A401112B85;
 Fri,  4 Feb 2022 15:16:09 +0000 (UTC)
Received: from bahia (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFD747DE4B;
 Fri,  4 Feb 2022 15:16:07 +0000 (UTC)
Date: Fri, 4 Feb 2022 16:16:06 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by
 struct dirent overread
Message-ID: <20220204161606.162d2c05@bahia>
In-Reply-To: <28345882.VnrBaU8NEn@silver>
References: <20220204050609.15510-1-vt@altlinux.org>
 <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
 <28345882.VnrBaU8NEn@silver>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org, ldv@altlinux.org,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 04 Feb 2022 15:12:18 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Freitag, 4. Februar 2022 14:55:45 CET Philippe Mathieu-Daud=C3=A9 via =
wrote:
> > On 4/2/22 06:06, Vitaly Chikunov wrote:
> > > `struct dirent' returned from readdir(3) could be shorter (or longer)
> > > than `sizeof(struct dirent)', thus memcpy of sizeof length will overr=
ead
> > >=20
> > > into unallocated page causing SIGSEGV. Example stack trace:
> > >   #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x=
86_64
> > >   + 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir
> > >   (/usr/bin/qemu-system-x86_64 + 0x4982e9) #2  0x0000555555eb7983
> > >   coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983) #3=20
> > >   0x00007ffff73e0be0 n/a (n/a + 0x0)
> > >=20
> > > While fixing, provide a helper for any future `struct dirent' cloning=
.
> > >=20
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > > Cc: qemu-stable@nongnu.org
> > > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > > ---
> > > Tested on x86-64 Linux again.
> > >=20
> > > Changes from v2:
> > > - Make it work with a simulated dirent where d_reclen is 0, which was
> > >=20
> > >    caused abort in readdir qos-test, by using fallback at runtime.
> > >  =20
> > >   hw/9pfs/codir.c      |  3 +--
> > >   include/qemu/osdep.h | 13 +++++++++++++
> > >   util/osdep.c         | 18 ++++++++++++++++++
> > >   3 files changed, 32 insertions(+), 2 deletions(-)
> > >=20
> > > +struct dirent *
> > > +qemu_dirent_dup(struct dirent *dent)
> > > +{
> > > +    size_t sz =3D 0;
> > > +#if defined _DIRENT_HAVE_D_RECLEN
> > > +    /* Avoid use of strlen() if there's d_reclen. */
> > > +    sz =3D dent->d_reclen;
> > > +#endif
> > > +    if (sz =3D=3D 0) {
> >=20
> > If _DIRENT_HAVE_D_RECLEN is defined, this case is unlikely...
> >=20
> > > +        /* Fallback to the most portable way. */
> > > +        sz =3D offsetof(struct dirent, d_name) +
> > > +                      strlen(dent->d_name) + 1;
> > > +    }
> > > +    struct dirent *dst =3D g_malloc(sz);
> > > +    return memcpy(dst, dent, sz);
> > > +}
> >=20
> > What about this?
> >=20
> > struct dirent *
> > qemu_dirent_dup(struct dirent *dent)
> > {
> >      size_t sz;
> >=20
> > #if defined _DIRENT_HAVE_D_RECLEN
> >      /* Avoid use of strlen() if there's d_reclen. */
> >      sz =3D dent->d_reclen;
> > #else
> >      /* Fallback to the most portable way. */
> >      sz =3D offsetof(struct dirent, d_name) +
> >                    strlen(dent->d_name) + 1;
> > #endif
> >=20
> >      return g_memdup(dent, sz);
> > }
>=20
> That was the intentional change v2 -> v3 Philippe. Previous v2 crashed th=
e
> 9p 'synth' tests:
>=20
> https://lore.kernel.org/qemu-devel/2627488.0S70g7mNYN@silver/T/#ma09bedde=
59a91e6435443e151f7e49fef8616e4c
>=20
> You might argue that the 9p 'synth' driver should instead populate d_recl=
en
> instead, but this v3 is a simpler solution and guarantees to always work.=
 So
> I'd prefer to go with Vitaly's v3 for now, especially as this patch would=
 go
> to the stable branches as well.
>=20

This really is a band-aid. Anyone reading this will react as Philippe,
and this is common code, not just 9pfs. With correctly populated dirents,
the helper could be as simple as:

struct dirent *
qemu_dirent_dup(struct dirent *dent)
{
    size_t sz =3D offsetof(struct dirent, d_name) + _D_EXACT_NAMLEN(dent) +=
 1;

    return g_memdup(dent, sz);
}

If this is a cycles problem, I can help reviewing the fixes on
the synth driver, or alternatively you can keep this code
somewhere under 9pfs but please don't put that in common utils.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
>=20
>=20


