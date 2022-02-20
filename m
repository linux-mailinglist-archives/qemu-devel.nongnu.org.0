Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445EB4BD20B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 22:37:05 +0100 (CET)
Received: from localhost ([::1]:36748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLtt9-0002XV-SV
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 16:37:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLts6-0001l5-5k
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 16:35:58 -0500
Received: from [2a00:1450:4864:20::132] (port=43724
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLts1-0001Du-9J
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 16:35:55 -0500
Received: by mail-lf1-x132.google.com with SMTP id g39so15121507lfv.10
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 13:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T2wCI7bhmHkNeIx5oSexKgX+/j7l1+yLM3T2iWS/8qs=;
 b=QU/wSB/itGScvHsDrqdQch/ogvIsWTesYszi3C9VMgWqYxhezNTAeOXPp2rMQEbs8f
 63GHZ0CVoVKVsd42pBZ4RShIKlgQ6hjRXTxXUI0U/ys63O3ry6PC93sd5SsvjVEeyQ/P
 xm8nZpHgprykhR0jlR5e6Q++JxMwpZbAKbG5uQHiEdOFAz/jooTKYayEnKWoN8O6YtSl
 IfTr293H1fHhgAY3oDTyPW+9RhV5SGPZ0eIsNDqtMguMMaJ1h7ihiKKyKPEcxy/SniN8
 v8eOrzBr/3oFO8TimIMX3uMtzsyUMfrHCrXElJaw+5VNuZU9wSqhqvMrniaeIX5foj3t
 bteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T2wCI7bhmHkNeIx5oSexKgX+/j7l1+yLM3T2iWS/8qs=;
 b=cD5LrxH+2X2mvOa68CHgUYRJ2Ms38DTBzOJnlabtIxC8JSOehcicMInUxf2aQ/n/aL
 0wxH73kLsR5jSBSgIRwWIivN7HCM4B+rqQZdadmENv5E+uZ4BQtrbGBkT5HRMyBXO48C
 ALMwGrKyLe7gVs9b8ojVNyTaHXRsxsO7xXkadEEk9AcaG/CMLSd7gMjrKF0PkWUOtBQv
 RlyUAtg3jUVFJobGB6FI08QN5OfVKBPN0HvCKXw14TsyoJEvoXCBGGJKXHL6F6hrT/z1
 pzpgQ7awhKLdJZxG7ujkkuWUlZ+y1H70JKXaNsR7Y2bh75CjQOocxqKE/YOFPkniSsOk
 TKgg==
X-Gm-Message-State: AOAM533KabD9Oasd7COJ5QYAPb8leGOlgOgk6igtYud6M33xr4FGMWmq
 1A7L4ZgajiU7zSz2Hd1ssWDHNuuu5SQwN5ms8H8=
X-Google-Smtp-Source: ABdhPJzwIM1jQrHwU+PZa0wENSHMRSwoKOgGZGG3LYhoAh/dwxGoHMHBjqXcE65MPeOmX4GKWTgBw6iTnbh8zpFgTMQ=
X-Received: by 2002:a05:6512:3f05:b0:443:bf88:aeba with SMTP id
 y5-20020a0565123f0500b00443bf88aebamr8281900lfa.561.1645392949545; Sun, 20
 Feb 2022 13:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20220220165056.72289-1-wwcohen@gmail.com>
 <20220220165056.72289-5-wwcohen@gmail.com>
 <2201050.uL7EZxoxRi@silver>
In-Reply-To: <2201050.uL7EZxoxRi@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Sun, 20 Feb 2022 16:35:38 -0500
Message-ID: <CAB26zV0KhzQSrfDRJYUKr988zDJ3w+15j+983W-xVG4m3eJdHA@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] 9p: darwin: Handle struct dirent differences
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000460dd005d879e62e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Fabian Franz <fabianfranz.oss@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000460dd005d879e62e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies =E2=80=94 I tested on Mac but should have done Linux too. Will re=
vise.

On Sun, Feb 20, 2022 at 4:28 PM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Sonntag, 20. Februar 2022 17:50:49 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > On darwin d_seekoff exists, but is optional and does not seem to
> > be commonly used by file systems. Use `telldir` instead to obtain
> > the seek offset and inject it into d_seekoff, and create a
> > qemu_dirent_off helper to call it appropriately when appropriate.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Adjust to pass testing
> >              - Ensure that d_seekoff is filled using telldir
> >                on darwin, and create qemu_dirent_off helper
> >                to decide which to access]
> > [Fabian Franz: - Add telldir error handling for darwin]
> > Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
> > [Will Cohen: - Ensure that telldir error handling uses
> >                signed int
> >              - Cleanup of telldir error handling
> >              - Remove superfluous error handling for
> >                qemu_dirent_off
> >              - Adjust formatting
> >              - Use qemu_dirent_off in codir.c]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
>
> This patch does not compile on Linux ...
>
> >  hw/9pfs/9p-local.c |  9 +++++++++
> >  hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
> >  hw/9pfs/9p-synth.c |  4 ++++
> >  hw/9pfs/9p-util.h  | 16 ++++++++++++++++
> >  hw/9pfs/9p.c       |  7 +++++--
> >  hw/9pfs/codir.c    |  4 +++-
> >  6 files changed, 52 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index 1a5e3eed73..f3272f0b43 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -562,6 +562,15 @@ again:
> >      if (!entry) {
> >          return NULL;
> >      }
> > +#ifdef CONFIG_DARWIN
> > +    int off;
> > +    off =3D telldir(fs->dir.stream);
> > +    /* If telldir fails, fail the entire readdir call */
> > +    if (off < 0) {
> > +        return NULL;
> > +    }
> > +    entry->d_seekoff =3D off;
> > +#endif
> >
> >      if (ctx->export_flags & V9FS_SM_MAPPED) {
> >          entry->d_type =3D DT_UNKNOWN;
> > diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> > index b1664080d8..8b4b5cf7dc 100644
> > --- a/hw/9pfs/9p-proxy.c
> > +++ b/hw/9pfs/9p-proxy.c
> > @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,
> > V9fsFidOpenState *fs)
> >
> >  static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState
> *fs)
> >  {
> > -    return readdir(fs->dir.stream);
> > +    struct dirent *entry;
> > +    entry =3D readdir(fs->dir.stream);
> > +#ifdef CONFIG_DARWIN
> > +    if (!entry) {
> > +        return NULL;
> > +    }
> > +    int td;
> > +    td =3D telldir(fs->dir.stream);
> > +    /* If telldir fails, fail the entire readdir call */
> > +    if (td < 0) {
> > +        return NULL;
> > +    }
> > +    entry->d_seekoff =3D td;
> > +#endif
> > +    return entry;
> >  }
> >
> >  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t
> off)
> > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > index bf9b0c5ddd..b3080e415b 100644
> > --- a/hw/9pfs/9p-synth.c
> > +++ b/hw/9pfs/9p-synth.c
> > @@ -234,7 +234,11 @@ static void synth_direntry(V9fsSynthNode *node,
> >               offsetof(struct dirent, d_name) + sz);
> >      memcpy(entry->d_name, node->name, sz);
> >      entry->d_ino =3D node->attr->inode;
> > +#ifdef CONFIG_DARWIN
> > +    entry->d_seekoff =3D off + 1;
> > +#else
> >      entry->d_off =3D off + 1;
> > +#endif
> >  }
> >
> >  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 546f46dc7d..d41f37f085 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -79,3 +79,19 @@ ssize_t fremovexattrat_nofollow(int dirfd, const cha=
r
> > *filename, const char *name);
> >
> >  #endif
>
> ... ^- this is the end of file #endif, so qemu_dirent_off() should be
> above
> that #endif, and ...
>
> > +
> > +
> > +/**
> > + * Darwin has d_seekoff, which appears to function similarly to d_off.
> > + * However, it does not appear to be supported on all file systems,
> > + * so ensure it is manually injected earlier and call here when
> > + * needed.
> > + */
> > +inline off_t qemu_dirent_off(struct dirent *dent)
>
> ... this function declaration misses the 'static' keyword, which is
> mandatory
> to prevent a linker error.
>
> Best regards,
> Christian Schoenebeck
>
> > +{
> > +#ifdef CONFIG_DARWIN
> > +    return dent->d_seekoff;
> > +#else
> > +    return dent->d_off;
> > +#endif
> > +}
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 1563d7b7c6..caf3b240fe 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -27,6 +27,7 @@
> >  #include "virtio-9p.h"
> >  #include "fsdev/qemu-fsdev.h"
> >  #include "9p-xattr.h"
> > +#include "9p-util.h"
> >  #include "coth.h"
> >  #include "trace.h"
> >  #include "migration/blocker.h"
> > @@ -2281,7 +2282,7 @@ static int coroutine_fn
> > v9fs_do_readdir_with_stat(V9fsPDU *pdu, count +=3D len;
> >          v9fs_stat_free(&v9stat);
> >          v9fs_path_free(&path);
> > -        saved_dir_pos =3D dent->d_off;
> > +        saved_dir_pos =3D qemu_dirent_off(dent);
> >      }
> >
> >      v9fs_readdir_unlock(&fidp->fs.dir);
> > @@ -2420,6 +2421,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu,
> > V9fsFidState *fidp, V9fsString name;
> >      int len, err =3D 0;
> >      int32_t count =3D 0;
> > +    off_t off;
> >      struct dirent *dent;
> >      struct stat *st;
> >      struct V9fsDirEnt *entries =3D NULL;
> > @@ -2480,12 +2482,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> > *pdu, V9fsFidState *fidp, qid.version =3D 0;
> >          }
> >
> > +        off =3D qemu_dirent_off(dent);
> >          v9fs_string_init(&name);
> >          v9fs_string_sprintf(&name, "%s", dent->d_name);
> >
> >          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing c=
ount) */
> >          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> > -                          &qid, dent->d_off,
> > +                          &qid, off,
> >                            dent->d_type, &name);
> >
> >          v9fs_string_free(&name);
> > diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> > index c0873bde16..f96d8ac4e6 100644
> > --- a/hw/9pfs/codir.c
> > +++ b/hw/9pfs/codir.c
> > @@ -22,6 +22,8 @@
> >  #include "qemu/coroutine.h"
> >  #include "qemu/main-loop.h"
> >  #include "coth.h"
> > +#include "9p-xattr.h"
> > +#include "9p-util.h"
> >
> >  /*
> >   * Intended to be called from bottom-half (e.g. background I/O thread)
> > @@ -166,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidSta=
te
> > *fidp, }
> >
> >          size +=3D len;
> > -        saved_dir_pos =3D dent->d_off;
> > +        saved_dir_pos =3D qemu_dirent_off(dent);
> >      }
> >
> >      /* restore (last) saved position */
>
>
>

--000000000000460dd005d879e62e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Apologies =E2=80=94 I tested on Mac but should have done =
Linux too. Will revise.</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Feb 20, 2022 at 4:28 PM Christian Sch=
oenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)">On Sonntag, 20. Februar 2022 17=
:50:49 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; On darwin d_seekoff exists, but is optional and does not seem to<br>
&gt; be commonly used by file systems. Use `telldir` instead to obtain<br>
&gt; the seek offset and inject it into d_seekoff, and create a<br>
&gt; qemu_dirent_off helper to call it appropriately when appropriate.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Adjust to pass testing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Ensure that d_seekof=
f is filled using telldir<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on darwin, and =
create qemu_dirent_off helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to decide which=
 to access]<br>
&gt; [Fabian Franz: - Add telldir error handling for darwin]<br>
&gt; Signed-off-by: Fabian Franz &lt;<a href=3D"mailto:fabianfranz.oss@gmai=
l.com" target=3D"_blank">fabianfranz.oss@gmail.com</a>&gt;<br>
&gt; [Will Cohen: - Ensure that telldir error handling uses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 signed int<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Cleanup of telldir e=
rror handling<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Remove superfluous e=
rror handling for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_dirent_off=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Adjust formatting<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Use qemu_dirent_off =
in codir.c]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
This patch does not compile on Linux ...<br>
<br>
&gt;=C2=A0 hw/9pfs/9p-local.c |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 hw/9pfs/9p-proxy.c | 16 +++++++++++++++-<br>
&gt;=C2=A0 hw/9pfs/9p-synth.c |=C2=A0 4 ++++<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 | 16 ++++++++++++++++<br>
&gt;=C2=A0 hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++--<br>
&gt;=C2=A0 hw/9pfs/codir.c=C2=A0 =C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 6 files changed, 52 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index 1a5e3eed73..f3272f0b43 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -562,6 +562,15 @@ again:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!entry) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 int off;<br>
&gt; +=C2=A0 =C2=A0 off =3D telldir(fs-&gt;dir.stream);<br>
&gt; +=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br=
>
&gt; +=C2=A0 =C2=A0 if (off &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D off;<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ctx-&gt;export_flags &amp; V9FS_SM_MAPPED) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;d_type =3D DT_UNKNOWN;<br>
&gt; diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c<br>
&gt; index b1664080d8..8b4b5cf7dc 100644<br>
&gt; --- a/hw/9pfs/9p-proxy.c<br>
&gt; +++ b/hw/9pfs/9p-proxy.c<br>
&gt; @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,<br>
&gt; V9fsFidOpenState *fs)<br>
&gt; <br>
&gt;=C2=A0 static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenS=
tate *fs)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 return readdir(fs-&gt;dir.stream);<br>
&gt; +=C2=A0 =C2=A0 struct dirent *entry;<br>
&gt; +=C2=A0 =C2=A0 entry =3D readdir(fs-&gt;dir.stream);<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 if (!entry) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 int td;<br>
&gt; +=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);<br>
&gt; +=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br=
>
&gt; +=C2=A0 =C2=A0 if (td &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 return entry;<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, =
off_t off)<br>
&gt; diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
&gt; index bf9b0c5ddd..b3080e415b 100644<br>
&gt; --- a/hw/9pfs/9p-synth.c<br>
&gt; +++ b/hw/9pfs/9p-synth.c<br>
&gt; @@ -234,7 +234,11 @@ static void synth_direntry(V9fsSynthNode *node,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offsetof(struct =
dirent, d_name) + sz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memcpy(entry-&gt;d_name, node-&gt;name, sz);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 entry-&gt;d_ino =3D node-&gt;attr-&gt;inode;<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D off + 1;<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 entry-&gt;d_off =3D off + 1;<br>
&gt; +#endif<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,<br>
&gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; index 546f46dc7d..d41f37f085 100644<br>
&gt; --- a/hw/9pfs/9p-util.h<br>
&gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; @@ -79,3 +79,19 @@ ssize_t fremovexattrat_nofollow(int dirfd, const ch=
ar<br>
&gt; *filename, const char *name);<br>
&gt; <br>
&gt;=C2=A0 #endif<br>
<br>
... ^- this is the end of file #endif, so qemu_dirent_off() should be above=
 <br>
that #endif, and ...<br>
<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * Darwin has d_seekoff, which appears to function similarly to d_off=
.<br>
&gt; + * However, it does not appear to be supported on all file systems,<b=
r>
&gt; + * so ensure it is manually injected earlier and call here when<br>
&gt; + * needed.<br>
&gt; + */<br>
&gt; +inline off_t qemu_dirent_off(struct dirent *dent)<br>
<br>
... this function declaration misses the &#39;static&#39; keyword, which is=
 mandatory <br>
to prevent a linker error.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br>
&gt; +{<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 return dent-&gt;d_seekoff;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 return dent-&gt;d_off;<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index 1563d7b7c6..caf3b240fe 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -27,6 +27,7 @@<br>
&gt;=C2=A0 #include &quot;virtio-9p.h&quot;<br>
&gt;=C2=A0 #include &quot;fsdev/qemu-fsdev.h&quot;<br>
&gt;=C2=A0 #include &quot;9p-xattr.h&quot;<br>
&gt; +#include &quot;9p-util.h&quot;<br>
&gt;=C2=A0 #include &quot;coth.h&quot;<br>
&gt;=C2=A0 #include &quot;trace.h&quot;<br>
&gt;=C2=A0 #include &quot;migration/blocker.h&quot;<br>
&gt; @@ -2281,7 +2282,7 @@ static int coroutine_fn<br>
&gt; v9fs_do_readdir_with_stat(V9fsPDU *pdu, count +=3D len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_stat_free(&amp;v9stat);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_path_free(&amp;path);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D qemu_dirent_off(dent);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9fs_readdir_unlock(&amp;fidp-&gt;fs.dir);<br>
&gt; @@ -2420,6 +2421,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU =
*pdu,<br>
&gt; V9fsFidState *fidp, V9fsString name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int len, err =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int32_t count =3D 0;<br>
&gt; +=C2=A0 =C2=A0 off_t off;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct dirent *dent;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct stat *st;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct V9fsDirEnt *entries =3D NULL;<br>
&gt; @@ -2480,12 +2482,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPD=
U<br>
&gt; *pdu, V9fsFidState *fidp, qid.version =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D qemu_dirent_off(dent);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_string_init(&amp;name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_string_sprintf(&amp;name, &quot=
;%s&quot;, dent-&gt;d_name);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 11 =3D 7 + 4 (7 =3D start offset,=
 4 =3D space for storing count) */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D pdu_marshal(pdu, 11 + count,=
 &quot;Qqbs&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;qid, dent-&gt;d_off,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &amp;qid, off,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dent-&gt;d_type, &amp;name);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v9fs_string_free(&amp;name);<br>
&gt; diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c<br>
&gt; index c0873bde16..f96d8ac4e6 100644<br>
&gt; --- a/hw/9pfs/codir.c<br>
&gt; +++ b/hw/9pfs/codir.c<br>
&gt; @@ -22,6 +22,8 @@<br>
&gt;=C2=A0 #include &quot;qemu/coroutine.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/main-loop.h&quot;<br>
&gt;=C2=A0 #include &quot;coth.h&quot;<br>
&gt; +#include &quot;9p-xattr.h&quot;<br>
&gt; +#include &quot;9p-util.h&quot;<br>
&gt; <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Intended to be called from bottom-half (e.g. background =
I/O thread)<br>
&gt; @@ -166,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidSt=
ate<br>
&gt; *fidp, }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size +=3D len;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D qemu_dirent_off(dent);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* restore (last) saved position */<br>
<br>
<br>
</blockquote></div></div>

--000000000000460dd005d879e62e--

