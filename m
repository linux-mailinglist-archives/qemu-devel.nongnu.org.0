Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A0A4A9AFD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:31:12 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFzcF-0007Du-83
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:31:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFzKL-0002Ah-EJ; Fri, 04 Feb 2022 09:12:41 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:56267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nFzKI-0006tn-18; Fri, 04 Feb 2022 09:12:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=u9LbUiOjdfzQByA3R529eZgnU1er4fpcZxCkWi4w4vE=; b=SH//RN193WHui/2gzG6pbLGG1w
 dfpMI+vTPPwMVTC9tyRpLfZfILNhRrT7xxisMTgNQnVqirpNyPb3YsvG9fpnbGuC565LNCsPMOqHL
 xXtkIZr8EVxr0l0UkYP6esIj7RijKzdohh/QmiRokHxRoxKV6us4RyeJgO0BDEFX4EYi5U/c+SMjq
 dt+XzSR3PnL+4euv7VRCOq4uVFFg8vXuwfDSnVYkT7GWx1bn7JEN5BtUiBEhKh9AxgOQWHxx+2dsT
 0KRrE9fpoLfRcjciRSVBIbpgwWy2lUc+kXANXj+HlyuuRwdryxIDrBwK7mliAm1vc9PlBjMpX2ItT
 XVtEHoA3s3aVVk6BuZo0XbHu86wN/VVdN1eX8ukNZp1v3jy6wWE2VDpBn4oOyju9haKbpbYEHCX3X
 cXS44hqdrjFBYC/lyiOj4/4Ki1OhCtIFisRpvGCAThk9mJNJZV13WNNBhS3e65DsgweVhnMwfQRFb
 n58Z7Jd7xQB/8EAEohaZE9UqTSCw95ITmVMziwHqRzQL7eBVJHDGqeDLGwRwl4KEHrPb4+QGBHj2/
 xIOd9nW5XyNYAfr83jZiW56280a5GQf48LZNXlKAjb66YSqwVuIU/AJYYfevKr8Blj6WPnkKPwhuh
 WCiRgZyAQym+1We2qyo7pE9yBxN/WiDMQwElrI4CY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, ldv@altlinux.org
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Fri, 04 Feb 2022 15:12:18 +0100
Message-ID: <28345882.VnrBaU8NEn@silver>
In-Reply-To: <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
References: <20220204050609.15510-1-vt@altlinux.org>
 <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
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

On Freitag, 4. Februar 2022 14:55:45 CET Philippe Mathieu-Daud=E9 via wrote:
> On 4/2/22 06:06, Vitaly Chikunov wrote:
> > `struct dirent' returned from readdir(3) could be shorter (or longer)
> > than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> >=20
> > into unallocated page causing SIGSEGV. Example stack trace:
> >   #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86=
_64
> >   + 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir
> >   (/usr/bin/qemu-system-x86_64 + 0x4982e9) #2  0x0000555555eb7983
> >   coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983) #3=20
> >   0x00007ffff73e0be0 n/a (n/a + 0x0)
> >=20
> > While fixing, provide a helper for any future `struct dirent' cloning.
> >=20
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> > Cc: qemu-stable@nongnu.org
> > Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> > ---
> > Tested on x86-64 Linux again.
> >=20
> > Changes from v2:
> > - Make it work with a simulated dirent where d_reclen is 0, which was
> >=20
> >    caused abort in readdir qos-test, by using fallback at runtime.
> >  =20
> >   hw/9pfs/codir.c      |  3 +--
> >   include/qemu/osdep.h | 13 +++++++++++++
> >   util/osdep.c         | 18 ++++++++++++++++++
> >   3 files changed, 32 insertions(+), 2 deletions(-)
> >=20
> > +struct dirent *
> > +qemu_dirent_dup(struct dirent *dent)
> > +{
> > +    size_t sz =3D 0;
> > +#if defined _DIRENT_HAVE_D_RECLEN
> > +    /* Avoid use of strlen() if there's d_reclen. */
> > +    sz =3D dent->d_reclen;
> > +#endif
> > +    if (sz =3D=3D 0) {
>=20
> If _DIRENT_HAVE_D_RECLEN is defined, this case is unlikely...
>=20
> > +        /* Fallback to the most portable way. */
> > +        sz =3D offsetof(struct dirent, d_name) +
> > +                      strlen(dent->d_name) + 1;
> > +    }
> > +    struct dirent *dst =3D g_malloc(sz);
> > +    return memcpy(dst, dent, sz);
> > +}
>=20
> What about this?
>=20
> struct dirent *
> qemu_dirent_dup(struct dirent *dent)
> {
>      size_t sz;
>=20
> #if defined _DIRENT_HAVE_D_RECLEN
>      /* Avoid use of strlen() if there's d_reclen. */
>      sz =3D dent->d_reclen;
> #else
>      /* Fallback to the most portable way. */
>      sz =3D offsetof(struct dirent, d_name) +
>                    strlen(dent->d_name) + 1;
> #endif
>=20
>      return g_memdup(dent, sz);
> }

That was the intentional change v2 -> v3 Philippe. Previous v2 crashed the
9p 'synth' tests:

https://lore.kernel.org/qemu-devel/2627488.0S70g7mNYN@silver/T/#ma09bedde59=
a91e6435443e151f7e49fef8616e4c

You might argue that the 9p 'synth' driver should instead populate d_reclen
instead, but this v3 is a simpler solution and guarantees to always work. So
I'd prefer to go with Vitaly's v3 for now, especially as this patch would go
to the stable branches as well.

Best regards,
Christian Schoenebeck



