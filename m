Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72C46597A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 23:48:52 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msYPC-0002GD-Hx
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 17:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1msYNP-0001Yz-Ae
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 17:46:59 -0500
Received: from [2607:f8b0:4864:20::a31] (port=43864
 helo=mail-vk1-xa31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1msYNL-0007Xp-IJ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 17:46:58 -0500
Received: by mail-vk1-xa31.google.com with SMTP id f7so17214660vkf.10
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 14:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PoTsqTxDNjo+jczshsb6J9BFJX24sG3X5k5to8Gog8o=;
 b=UNbCeHBr27zP2K3igW6A0gx5aHYKSssNygh2hp17O12SG6bHpA43NhH0D50o325J73
 JtTZML+nrtgtCV/Z5D8rWjFqg3i5K4rMqj/GjVmMWpdeqWj6JaU7SRahtMNnZJpFkSTi
 QaU5Es20bWfu+3UmhdPR8Xnro03MdJsDWPVZQY4frbAfNap4TikssLH0ULAFw0Qn+tQ3
 iHHOQJcCWln1rca0Xxq9LJilA5oM6lEd/GQXHsDDUntJyYvlY/1A9iJuG75Bzz7ldgE5
 P/x63GhHG56Cmx/ApSrx5MAFSUlL/StPLi8fLY5TuiRzkquSitcFDtHkjvd2ptNBtAUT
 w61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PoTsqTxDNjo+jczshsb6J9BFJX24sG3X5k5to8Gog8o=;
 b=fFMc8V2eYN8GdzklyhyWBxzI8C3CmK0/8yZ6rCqcuKNK0eaAhTjnhTiQhfzlPqyPBU
 RN8T2soIyfHF2BMJ/Z3I9ybq7FUnUDbz5sE/wygegmmmV1NcI+C6u/JcbcvqK4aEdSpg
 N2SQ5deSzOKThrzjLr5kdiNZL6GNOelhT6PcJc53NsgrvXjRtwCdDe84v9sZnpWD0751
 B64Idm9h7R47q9BbU4kll1ZXNY0ObWlQ2GYntHH3VB8LzwLACrZZkIm3AQg2YK5l5Sxq
 i5L3SvSvEE8Lssc1xb4DjCMvfEZz9sYiBSQiPzb2vpmKXQKAubRr2Iv4p/RisLVo+rvT
 0dLA==
X-Gm-Message-State: AOAM533QpG1cM3vta6fAs9wiNkt+5xOkc6cXJ4Fao8xtOKRJxDkVeHEo
 8DQCQAODdUNfsef8GVTMWJTzVrPtRTIszOGDE0Y=
X-Google-Smtp-Source: ABdhPJw6I4n5+9YTn6CaBo0xNHOp/hGqRAwoxkFdLJ6f14d0aizsiWaZyU7WN/ogLJcv5gnu4YfU0fJ5ABdiUkP1DBk=
X-Received: by 2002:a05:6122:d11:: with SMTP id
 az17mr11779887vkb.22.1638398814159; 
 Wed, 01 Dec 2021 14:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-4-wwcohen@gmail.com>
 <2263838.SjeFQtN84K@silver>
In-Reply-To: <2263838.SjeFQtN84K@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Wed, 1 Dec 2021 17:46:43 -0500
Message-ID: <CAB26zV1Ges+N1kO1Lcy666OPezphy-17Wj2OaL9aKxaT_xx13w@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] 9p: darwin: Handle struct stat(fs) differences
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000005184fd05d21d73eb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wwcohen@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, qemu-devel@nongnu.org,
 hi@alyssa.is, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005184fd05d21d73eb
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 24, 2021 at 9:23 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Montag, 22. November 2021 01:49:05 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p-proxy.c | 17 ++++++++++++++---
> >  hw/9pfs/9p-synth.c |  2 ++
> >  hw/9pfs/9p.c       | 16 ++++++++++++++--
> >  3 files changed, 30 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> > index 09bd9f1464..be1546c1be 100644
> > --- a/hw/9pfs/9p-proxy.c
> > +++ b/hw/9pfs/9p-proxy.c
> > @@ -123,10 +123,15 @@ static void prstatfs_to_statfs(struct statfs *stfs,
> > ProxyStatFS *prstfs) stfs->f_bavail = prstfs->f_bavail;
> >      stfs->f_files = prstfs->f_files;
> >      stfs->f_ffree = prstfs->f_ffree;
> > +#ifdef CONFIG_DARWIN
> > +    stfs->f_fsid.val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
> > +    stfs->f_fsid.val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
> > +#else
> >      stfs->f_fsid.__val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
> >      stfs->f_fsid.__val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
> >      stfs->f_namelen = prstfs->f_namelen;
> >      stfs->f_frsize = prstfs->f_frsize;
> > +#endif
> >  }
>
> Please assign some value to f_namelen. You could either use the BSD
> version
> MAXNAMLEN from dirent.h (which you actually use for 9p.c below) or
> NAME_MAX
> from sys/syslimits.h on macOS.
>

statfs on darwin has no f_namelen or f_frsize present (
https://github.com/apple/darwin-xnu/blob/main/bsd/sys/mount.h#L141), which
is why they're excluded here. Given that this is converting to darwin's
statfs structure, is it okay if these stay omitted?


>
> >  /* Converts proxy_stat structure to VFS stat structure */
> > @@ -143,12 +148,18 @@ static void prstat_to_stat(struct stat *stbuf,
> > ProxyStat *prstat) stbuf->st_size = prstat->st_size;
> >     stbuf->st_blksize = prstat->st_blksize;
> >     stbuf->st_blocks = prstat->st_blocks;
> > -   stbuf->st_atim.tv_sec = prstat->st_atim_sec;
>
> Where did that go to? ^-
>

Unless I'm mistaken, I think this logic should still be present. Pre-patch,
it's ordered so it runs through sec and nsec each for atime, mtime, and
ctime respectively. To handle the darwin logic more cleanly, it's now
broken out so it does _sec first, and then only needs one #ifdef to handle
the two _nsec cases.


>
> > -   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
> > +   stbuf->st_atime = prstat->st_atim_sec;
> >     stbuf->st_mtime = prstat->st_mtim_sec;
> > -   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
> >     stbuf->st_ctime = prstat->st_ctim_sec;
> > +#ifdef CONFIG_DARWIN
> > +   stbuf->st_atimespec.tv_nsec = prstat->st_atim_nsec;
> > +   stbuf->st_mtimespec.tv_nsec = prstat->st_mtim_nsec;
> > +   stbuf->st_ctimespec.tv_nsec = prstat->st_ctim_nsec;
> > +#else
> > +   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
> > +   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
> >     stbuf->st_ctim.tv_nsec = prstat->st_ctim_nsec;
> > +#endif
> >  }
> >
> >  /*
> > diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> > index b38088e066..4a4a776d06 100644
> > --- a/hw/9pfs/9p-synth.c
> > +++ b/hw/9pfs/9p-synth.c
> > @@ -427,7 +427,9 @@ static int synth_statfs(FsContext *s, V9fsPath
> *fs_path,
> > stbuf->f_bsize = 512;
> >      stbuf->f_blocks = 0;
> >      stbuf->f_files = synth_node_count;
> > +#ifndef CONFIG_DARWIN
> >      stbuf->f_namelen = NAME_MAX;
> > +#endif
> >      return 0;
> >  }
>
> As mentioned above.
>
> > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > index 9c63e14b28..f4f0c200c7 100644
> > --- a/hw/9pfs/9p.c
> > +++ b/hw/9pfs/9p.c
> > @@ -1313,11 +1313,17 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu,
> const
> > struct stat *stbuf, v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
> >      v9lstat->st_blocks = stbuf->st_blocks;
> >      v9lstat->st_atime_sec = stbuf->st_atime;
> > -    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> >      v9lstat->st_mtime_sec = stbuf->st_mtime;
> > -    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
> >      v9lstat->st_ctime_sec = stbuf->st_ctime;
> > +#ifdef CONFIG_DARWIN
> > +    v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
> > +    v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
> > +    v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
> > +#else
> > +    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
> > +    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
> >      v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
> > +#endif
> >      /* Currently we only support BASIC fields in stat */
> >      v9lstat->st_result_mask = P9_STATS_BASIC;
> >
> > @@ -3519,9 +3525,15 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU
> > *pdu, struct statfs *stbuf) f_bavail = stbuf->f_bavail / bsize_factor;
> >      f_files  = stbuf->f_files;
> >      f_ffree  = stbuf->f_ffree;
> > +#ifdef CONFIG_DARWIN
> > +    fsid_val = (unsigned int)stbuf->f_fsid.val[0] |
> > +               (unsigned long long)stbuf->f_fsid.val[1] << 32;
> > +    f_namelen = MAXNAMLEN;
> > +#else
> >      fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
> >                 (unsigned long long)stbuf->f_fsid.__val[1] << 32;
> >      f_namelen = stbuf->f_namelen;
> > +#endif
> >
> >      return pdu_marshal(pdu, offset, "ddqqqqqqd",
> >                         f_type, f_bsize, f_blocks, f_bfree,
>
>
>

--0000000000005184fd05d21d73eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 24, 2021 at 9:23 AM Chris=
tian Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com" target=3D"_b=
lank">qemu_oss@crudebyte.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Montag, 22. November 2021 01:49:05 CET Will =
Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p-proxy.c | 17 ++++++++++++++---<br>
&gt;=C2=A0 hw/9pfs/9p-synth.c |=C2=A0 2 ++<br>
&gt;=C2=A0 hw/9pfs/9p.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++++++++++++--<br>
&gt;=C2=A0 3 files changed, 30 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c<br>
&gt; index 09bd9f1464..be1546c1be 100644<br>
&gt; --- a/hw/9pfs/9p-proxy.c<br>
&gt; +++ b/hw/9pfs/9p-proxy.c<br>
&gt; @@ -123,10 +123,15 @@ static void prstatfs_to_statfs(struct statfs *st=
fs,<br>
&gt; ProxyStatFS *prstfs) stfs-&gt;f_bavail =3D prstfs-&gt;f_bavail;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stfs-&gt;f_files =3D prstfs-&gt;f_files;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stfs-&gt;f_ffree =3D prstfs-&gt;f_ffree;<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 stfs-&gt;f_fsid.val[0] =3D prstfs-&gt;f_fsid[0] &amp; 0=
xFFFFFFFFU;<br>
&gt; +=C2=A0 =C2=A0 stfs-&gt;f_fsid.val[1] =3D prstfs-&gt;f_fsid[1] &gt;&gt=
; 32 &amp; 0xFFFFFFFFU;<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stfs-&gt;f_fsid.__val[0] =3D prstfs-&gt;f_fsid[0] =
&amp; 0xFFFFFFFFU;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stfs-&gt;f_fsid.__val[1] =3D prstfs-&gt;f_fsid[1] =
&gt;&gt; 32 &amp; 0xFFFFFFFFU;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stfs-&gt;f_namelen =3D prstfs-&gt;f_namelen;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stfs-&gt;f_frsize =3D prstfs-&gt;f_frsize;<br>
&gt; +#endif<br>
&gt;=C2=A0 }<br>
<br>
Please assign some value to f_namelen. You could either use the BSD version=
 <br>
MAXNAMLEN from dirent.h (which you actually use for 9p.c below) or NAME_MAX=
 <br>
from sys/syslimits.h on macOS.<br></blockquote><div><br></div><div>statfs o=
n darwin has no f_namelen or f_frsize present (<a href=3D"https://github.co=
m/apple/darwin-xnu/blob/main/bsd/sys/mount.h#L141">https://github.com/apple=
/darwin-xnu/blob/main/bsd/sys/mount.h#L141</a>), which is why they&#39;re e=
xcluded here. Given that this is converting to darwin&#39;s statfs structur=
e, is it okay if these stay omitted?<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 /* Converts proxy_stat structure to VFS stat structure */<br>
&gt; @@ -143,12 +148,18 @@ static void prstat_to_stat(struct stat *stbuf,<b=
r>
&gt; ProxyStat *prstat) stbuf-&gt;st_size =3D prstat-&gt;st_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0stbuf-&gt;st_blksize =3D prstat-&gt;st_blksize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0stbuf-&gt;st_blocks =3D prstat-&gt;st_blocks;<br>
&gt; -=C2=A0 =C2=A0stbuf-&gt;st_atim.tv_sec =3D prstat-&gt;st_atim_sec;<br>
<br>
Where did that go to? ^-<br></blockquote><div><br></div><div>Unless I&#39;m=
 mistaken, I think this logic should still be present. Pre-patch, it&#39;s =
ordered so it runs through sec and nsec each for atime, mtime, and ctime re=
spectively. To handle the darwin logic more cleanly, it&#39;s now broken ou=
t so it does _sec first, and then only needs one #ifdef to handle the two _=
nsec cases.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; -=C2=A0 =C2=A0stbuf-&gt;st_atim.tv_nsec =3D prstat-&gt;st_atim_nsec;<b=
r>
&gt; +=C2=A0 =C2=A0stbuf-&gt;st_atime =3D prstat-&gt;st_atim_sec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0stbuf-&gt;st_mtime =3D prstat-&gt;st_mtim_sec;<br>
&gt; -=C2=A0 =C2=A0stbuf-&gt;st_mtim.tv_nsec =3D prstat-&gt;st_mtim_nsec;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0stbuf-&gt;st_ctime =3D prstat-&gt;st_ctim_sec;<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0stbuf-&gt;st_atimespec.tv_nsec =3D prstat-&gt;st_atim_ns=
ec;<br>
&gt; +=C2=A0 =C2=A0stbuf-&gt;st_mtimespec.tv_nsec =3D prstat-&gt;st_mtim_ns=
ec;<br>
&gt; +=C2=A0 =C2=A0stbuf-&gt;st_ctimespec.tv_nsec =3D prstat-&gt;st_ctim_ns=
ec;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0stbuf-&gt;st_atim.tv_nsec =3D prstat-&gt;st_atim_nsec;<b=
r>
&gt; +=C2=A0 =C2=A0stbuf-&gt;st_mtim.tv_nsec =3D prstat-&gt;st_mtim_nsec;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0stbuf-&gt;st_ctim.tv_nsec =3D prstat-&gt;st_ctim_ns=
ec;<br>
&gt; +#endif<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 /*<br>
&gt; diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
&gt; index b38088e066..4a4a776d06 100644<br>
&gt; --- a/hw/9pfs/9p-synth.c<br>
&gt; +++ b/hw/9pfs/9p-synth.c<br>
&gt; @@ -427,7 +427,9 @@ static int synth_statfs(FsContext *s, V9fsPath *fs=
_path,<br>
&gt; stbuf-&gt;f_bsize =3D 512;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stbuf-&gt;f_blocks =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stbuf-&gt;f_files =3D synth_node_count;<br>
&gt; +#ifndef CONFIG_DARWIN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 stbuf-&gt;f_namelen =3D NAME_MAX;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
<br>
As mentioned above.<br>
<br>
&gt; diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
&gt; index 9c63e14b28..f4f0c200c7 100644<br>
&gt; --- a/hw/9pfs/9p.c<br>
&gt; +++ b/hw/9pfs/9p.c<br>
&gt; @@ -1313,11 +1313,17 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, c=
onst<br>
&gt; struct stat *stbuf, v9lstat-&gt;st_blksize =3D stat_to_iounit(pdu, stb=
uf);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9lstat-&gt;st_blocks =3D stbuf-&gt;st_blocks;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9lstat-&gt;st_atime_sec =3D stbuf-&gt;st_atime;<b=
r>
&gt; -=C2=A0 =C2=A0 v9lstat-&gt;st_atime_nsec =3D stbuf-&gt;st_atim.tv_nsec=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9lstat-&gt;st_mtime_sec =3D stbuf-&gt;st_mtime;<b=
r>
&gt; -=C2=A0 =C2=A0 v9lstat-&gt;st_mtime_nsec =3D stbuf-&gt;st_mtim.tv_nsec=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9lstat-&gt;st_ctime_sec =3D stbuf-&gt;st_ctime;<b=
r>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 v9lstat-&gt;st_atime_nsec =3D stbuf-&gt;st_atimespec.tv=
_nsec;<br>
&gt; +=C2=A0 =C2=A0 v9lstat-&gt;st_mtime_nsec =3D stbuf-&gt;st_mtimespec.tv=
_nsec;<br>
&gt; +=C2=A0 =C2=A0 v9lstat-&gt;st_ctime_nsec =3D stbuf-&gt;st_ctimespec.tv=
_nsec;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 v9lstat-&gt;st_atime_nsec =3D stbuf-&gt;st_atim.tv_nsec=
;<br>
&gt; +=C2=A0 =C2=A0 v9lstat-&gt;st_mtime_nsec =3D stbuf-&gt;st_mtim.tv_nsec=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9lstat-&gt;st_ctime_nsec =3D stbuf-&gt;st_ctim.tv=
_nsec;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Currently we only support BASIC fields in stat =
*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 v9lstat-&gt;st_result_mask =3D P9_STATS_BASIC;<br>
&gt; <br>
&gt; @@ -3519,9 +3525,15 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsP=
DU<br>
&gt; *pdu, struct statfs *stbuf) f_bavail =3D stbuf-&gt;f_bavail / bsize_fa=
ctor;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 f_files=C2=A0 =3D stbuf-&gt;f_files;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 f_ffree=C2=A0 =3D stbuf-&gt;f_ffree;<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 fsid_val =3D (unsigned int)stbuf-&gt;f_fsid.val[0] |<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned long=
 long)stbuf-&gt;f_fsid.val[1] &lt;&lt; 32;<br>
&gt; +=C2=A0 =C2=A0 f_namelen =3D MAXNAMLEN;<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fsid_val =3D (unsigned int) stbuf-&gt;f_fsid.__val=
[0] |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned=
 long long)stbuf-&gt;f_fsid.__val[1] &lt;&lt; 32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 f_namelen =3D stbuf-&gt;f_namelen;<br>
&gt; +#endif<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return pdu_marshal(pdu, offset, &quot;ddqqqqqqd&qu=
ot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0f_type, f_bsize, f_blocks, f_bfree,<br>
<br>
<br>
</blockquote></div></div>

--0000000000005184fd05d21d73eb--

