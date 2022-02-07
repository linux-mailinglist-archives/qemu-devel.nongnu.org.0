Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E254AC78B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:32:14 +0100 (CET)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7s5-00029c-7w
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH7SY-0003BA-GL
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:05:50 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:46611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH7SV-0002fw-B5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=L9ZqE4JBDz5ni0ekgWU4GIyhMW59kqUMCTbaYWs2aU4=; b=qnrYcbjmiufkCR/UGNLBkgVD3E
 RAyy5vcgz9p/6LSjInShKvrhdwd6I8LKXV9OiswKou5EY97ZoKF/zjkEowTJHPLF4rgMKVjD+qc7x
 wfpK+UYKr/iIcQOh5eTzYsS8Eg4pTDoZR9Ma5fz6cnBWFL1UQZMmsmMnC4eO/iDp8ioFLZU0SxEqk
 vA8Tql+4FQKYriJWwE5kMF3d7KDvDn9gKpUkp43m8bjO6INMCxNt9aQQYjeHp0xIjUkysGep4O53d
 MDcYfHr1mQECmnZ2loLYtk2/8mOICEdVT7wVMxYqimHGBFWA0vE5Fr9jehJsEXPapIC4C1kPR5hhl
 XuCwTwHtGU+bGdhw6RJt3/daeO+Rf3Uoi7R0+ucf+ENLn8Q3jskpbaFwFcMKWK4vDbUeoYmgSJtym
 1ohkvQj6H+RnxYQd3kKLLSiGSXk/9B13iwbkrjoQilUnC/A/PQLJhft4KndQsdinwRRImoyly9Whx
 HYfyCjLjQzXjdnBMkBJXC8+rHex9p1WR+Emz/vURxAZiTpZiwu5VZAq6kQHrQQysqNzfqEvADHKRy
 w6D2978WKBb49o+ULvX8AmW0qEm0dJ+48T4gpOZo42Teixmr3IV5g7gxytUKNgIyaItay9FwlqNlp
 gyZtdFA7c+n519TY+DGOcj3zzguYzbAqa3UpJF+5U=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Fabian Franz <fabianfranz.oss@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Subject: Re: [PATCH v4 04/11] 9p: darwin: Handle struct dirent differences
Date: Mon, 07 Feb 2022 18:05:42 +0100
Message-ID: <2016355.WMyYeBACgR@silver>
In-Reply-To: <CAB26zV2dt+n8uF2r21VegNy2q2mudUb0QjArQ0dAoyo8+kXAZA@mail.gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <CAP+dFMJPB5RrYd3DjsX1YXeuw-grL+iW6yV5jmE_yiTRU-c5Rg@mail.gmail.com>
 <CAB26zV2dt+n8uF2r21VegNy2q2mudUb0QjArQ0dAoyo8+kXAZA@mail.gmail.com>
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

On Montag, 7. Februar 2022 14:52:58 CET Will Cohen wrote:
> On Mon, Feb 7, 2022 at 4:53 AM Fabian Franz <fabianfranz.oss@gmail.com>
>=20
> wrote:
> > Comments inline:
> >=20
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> >=20
> >> index 1a5e3eed73..7137a28109 100644
> >> --- a/hw/9pfs/9p-local.c
> >> +++ b/hw/9pfs/9p-local.c
> >> @@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ct=
x,
> >> V9fsFidOpenState *fs)
> >>=20
> >>  again:
> >>      entry =3D readdir(fs->dir.stream);
> >>=20
> >> +#ifdef CONFIG_DARWIN
> >> +    int td;
> >> +    td =3D telldir(fs->dir.stream);
> >=20
> > Maybe call this =E2=80=9Eoff=E2=80=9C?
>=20
> Yes, off is better. Will adjust for v5.
>=20
> >> +    /* If telldir fails, fail the entire readdir call */
> >> +    if (td < 0) {
> >> +        return NULL;
> >> +    }
> >> +    entry->d_seekoff =3D td;
> >> +#endif
> >>=20
> >>      if (!entry) {
> >>     =20
> >>          return NULL;
> >>     =20
> >>      }
> >=20
> > This needs to be before the #ifdef!
>=20
> Good catch, will adjust for v5. I moved it around twice and forgot to put
> it in the right place.
>=20
> >> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> >> index b1664080d8..8b4b5cf7dc 100644
> >> --- a/hw/9pfs/9p-proxy.c
> >> +++ b/hw/9pfs/9p-proxy.c
> >> @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,
> >> V9fsFidOpenState *fs)
> >>=20
> >>  static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState
> >>  *fs)
> >>  {
> >>=20
> >> -    return readdir(fs->dir.stream);
> >> +    struct dirent *entry;
> >> +    entry =3D readdir(fs->dir.stream);
> >> +#ifdef CONFIG_DARWIN
> >> +    if (!entry) {
> >> +        return NULL;
> >> +    }
> >> +    int td;
> >> +    td =3D telldir(fs->dir.stream);
> >> +    /* If telldir fails, fail the entire readdir call */
> >> +    if (td < 0) {
> >> +        return NULL;
> >> +    }
> >> +    entry->d_seekoff =3D td;
> >> +#endif
> >> +    return entry;
> >>=20
> >>  }
> >> =20
> >>  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t
> >>=20
> >> off)
> >> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> >> index 4a4a776d06..e264a03eef 100644
> >> --- a/hw/9pfs/9p-synth.c
> >> +++ b/hw/9pfs/9p-synth.c
> >> @@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,
> >>=20
> >>  {
> >> =20
> >>      strcpy(entry->d_name, node->name);
> >>      entry->d_ino =3D node->attr->inode;
> >>=20
> >> +#ifdef CONFIG_DARWIN
> >> +    entry->d_seekoff =3D off + 1;
> >> +#else
> >>=20
> >>      entry->d_off =3D off + 1;
> >>=20
> >> +#endif

See below ...

> >>=20
> >>  }
> >> =20
> >>  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> >>=20
> >> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> >> index 546f46dc7d..accbec9987 100644
> >> --- a/hw/9pfs/9p-util.h
> >> +++ b/hw/9pfs/9p-util.h
> >> @@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const ch=
ar
> >> *filename,
> >>=20
> >>                                  const char *name);
> >> =20
> >>  #endif
> >>=20
> >> +
> >> +
> >> +/**
> >> + * Darwin has d_seekoff, which appears to function similarly to d_off.
> >> + * However, it does not appear to be supported on all file systems,
> >> + * so ensure it is manually injected earlier and call here when
> >> + * needed.
> >> + */
> >> +
> >> +inline off_t qemu_dirent_off(struct dirent *dent)
> >> +{
> >> +#ifdef CONFIG_DARWIN
> >> +    return dent->d_seekoff;
> >> +#else
> >> +    return dent->d_off;
> >> +#endif
> >> +}
> >=20
> > Are we sure we want a helper for two times the same ifdef? Deferring to
> > maintainers here however.
>=20
> Either way works for me too -- my current inclination is to leave it this
> way (as originally suggested by the maintainers), if for no other reason
> than that it allows the one comment to be referenced in the case of both
> uses.

As requested by me in this v4, this will be 3 times in v5. So I assume that=
=20
qualifies the dedicated helper function. :)

As an alternative you could make the helper function a macro instead, then =
you=20
could use it in 9p-synth.c as well, which would make it 4 times. But I don'=
t=20
mind about that one.

Best regards,
Christian Schoenebeck

> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> >=20
> >> index 1563d7b7c6..cf694da354 100644
> >> --- a/hw/9pfs/9p.c
> >> +++ b/hw/9pfs/9p.c
> >> @@ -27,6 +27,7 @@
> >>=20
> >>  #include "virtio-9p.h"
> >>  #include "fsdev/qemu-fsdev.h"
> >>  #include "9p-xattr.h"
> >>=20
> >> +#include "9p-util.h"
> >>=20
> >>  #include "coth.h"
> >>  #include "trace.h"
> >>  #include "migration/blocker.h"
> >>=20
> >> @@ -2281,7 +2282,11 @@ static int coroutine_fn
> >> v9fs_do_readdir_with_stat(V9fsPDU *pdu,
> >>=20
> >>          count +=3D len;
> >>          v9fs_stat_free(&v9stat);
> >>          v9fs_path_free(&path);
> >>=20
> >> -        saved_dir_pos =3D dent->d_off;
> >> +        saved_dir_pos =3D qemu_dirent_off(dent);
> >> +        if (saved_dir_pos < 0) {
> >> +            err =3D saved_dir_pos;
> >> +            break;
> >> +        }
> >=20
> > Do we still need this error-handling? I had removed it in my interdiff
> > patch.
>=20
> That's correct, it in fact can be removed. d_seekoff yields a __uint64_t (
> https://developer.apple.com/documentation/kernel/direntry/1415494-d_seeko=
ff?
> language=3Dobjc). Will adjust for v5.
>=20
> >>      }
> >>     =20
> >>      v9fs_readdir_unlock(&fidp->fs.dir);
> >>=20
> >> @@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> >> *pdu, V9fsFidState *fidp,
> >>=20
> >>      V9fsString name;
> >>      int len, err =3D 0;
> >>      int32_t count =3D 0;
> >>=20
> >> +    off_t off;
> >>=20
> >>      struct dirent *dent;
> >>      struct stat *st;
> >>      struct V9fsDirEnt *entries =3D NULL;
> >>=20
> >> @@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> >> *pdu, V9fsFidState *fidp,
> >>=20
> >>              qid.version =3D 0;
> >>         =20
> >>          }
> >>=20
> >> +        off =3D qemu_dirent_off(dent);
> >> +        if (off < 0) {
> >> +            err =3D off;
> >> +            break;
> >> +        }
> >=20
> > Same here - if this can never fail, why add the error handling?
>=20
> See above.
>=20
> >>          v9fs_string_init(&name);
> >>          v9fs_string_sprintf(&name, "%s", dent->d_name);
> >>         =20
> >>          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing =
count) */
> >>          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> >>=20
> >> -                          &qid, dent->d_off,
> >> +                          &qid, off,
> >>=20
> >>                            dent->d_type, &name);
> >>         =20
> >>          v9fs_string_free(&name);
> >>=20
> >> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> >> index 032cce04c4..fac6759a64 100644
> >> --- a/hw/9pfs/codir.c
> >> +++ b/hw/9pfs/codir.c
> >> @@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu,
> >> V9fsFidState *fidp,
> >>=20
> >>          }
> >>         =20
> >>          size +=3D len;
> >>=20
> >> +        /* This conditional statement is identical in
> >> +         * function to qemu_dirent_off, described in 9p-util.h,
> >> +         * since that header cannot be included here. */
> >> +#ifdef CONFIG_DARWIN
> >> +        saved_dir_pos =3D dent->d_seekoff;
> >> +#else
> >>=20
> >>          saved_dir_pos =3D dent->d_off;
> >>=20
> >> +#endif
> >>=20
> >>      }
> >>     =20
> >>      /* restore (last) saved position */
> >>=20
> >> --
> >> 2.32.0 (Apple Git-132)



