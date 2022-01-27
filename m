Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0FC49EDC5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:51:45 +0100 (CET)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCgB-0001vP-FL
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDCcX-0000J3-6V
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:47:57 -0500
Received: from [2a00:1450:4864:20::12e] (port=45929
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDCcV-0004Ki-AM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:47:56 -0500
Received: by mail-lf1-x12e.google.com with SMTP id o12so7876336lfg.12
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 13:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jJkTshhSrktEP8KZRZBVtv3+1WjltK+bosf++qfU+Fw=;
 b=Fp9ofthR1FCxYcku9uvkgRk+53h7XGjVoCehV8VUcw8oKvxO05UAsJ9HrpvNgBX8C7
 mrOXLt1SGl7rz7XNLFhdZptjzdc26TmRYmZG1u1KknQ0R/XXJ3agkGYshs1pYwKGsrcR
 i+w02+FkG6BIjKVgMnZxVN+m+zoFU4AEvWc51ZGk8YCBNpwThW9C0YCza1fTHObZe31k
 EYwmvbnJA1An/QJaQXQBYK+WM0YnFhWyw5e4hkBnziyOMQglGq0+LofjmN77fyOm6o7j
 LIVeb9hxqz1X/VEAjOhKFkla3Ei1Cn0m3OMp26Xjq0UAET5RNEkjq8k8ToVysWXjF7lT
 MU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jJkTshhSrktEP8KZRZBVtv3+1WjltK+bosf++qfU+Fw=;
 b=TrVg6w5eZ1AR4/autfy5cyc9zqtTw7MTVVgL53cXRxP67eu+FVo1UgJ4osj7cnlgyF
 U3am5nUDVkRbqcjv8RGYqKb9pNH5Yy2lADf6sutx+qGBK/wQoHF5+GUqsKi2Noxt3rAS
 9XdrouN7PFHQPLbD9JctN3/6RtC3jQ/Ct/kThok50Fqjsja0yzg2Db2e6NtiG4zaH/ti
 9Yw3FYSuDhOyarH/gBIS3voeyjBUtKgL+nJyymmoVNXbS9sy+OFRYLLb68MMjXcl7c2O
 3MnNHEAqYsK6mIdPyK/ZwuoVnjJrL3Y4HdJ62l9cpjxIb090Eso++mEPx9zj8BBYDjoi
 CH6w==
X-Gm-Message-State: AOAM530EoQ5Y82J2MR6aKs5NIes+Y8MBQHFFNJ3PQknTBQDhVgAGXqYe
 Sdnhus82H2LjjxBYoQppfSypeuNOwvhSnxJnh+E=
X-Google-Smtp-Source: ABdhPJyelzKX/Yu6Q+fXD2mNO96zG4LATaA/ht5gqZnjG8I+fKDrBCnqz7LwYz7UnfBrw7r13XUU4CpcqO18BzOYBAs=
X-Received: by 2002:a05:6512:3085:: with SMTP id
 z5mr4292736lfd.439.1643320072606; 
 Thu, 27 Jan 2022 13:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <20211122004913.20052-9-wwcohen@gmail.com>
 <2301973.IoarFkLyKX@silver>
In-Reply-To: <2301973.IoarFkLyKX@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Thu, 27 Jan 2022 16:47:40 -0500
Message-ID: <CAB26zV1WW1D4+3Kq_fZ4y1o61HZXYAaugcRgJji0f4+jRdcLnQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] 9p: darwin: Compatibility for f/l*xattr
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000002e17aa05d6974541"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x12e.google.com
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

--0000000000002e17aa05d6974541
Content-Type: text/plain; charset="UTF-8"

It's quite possible I'm misreading the man page when double-checking this,
but I believe the l-prefixed functions are for the link itself and
fgetxattr works on the file it refers to. This is why XATTR_NOFOLLOW
doesn't appear on fgetxattr, and I believe this also means that these
definitions line up the macOS behavior with Linux.

On Wed, Nov 24, 2021 at 11:20 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Montag, 22. November 2021 01:49:10 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > On darwin `fgetxattr` takes two extra optional arguments,
> > and the l* variants are not defined (in favor of an extra
> > flag to the regular variants.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c | 12 ++++++++----
> >  hw/9pfs/9p-util.h  | 17 +++++++++++++++++
> >  2 files changed, 25 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index 1a5e3eed73..2bfff79b12 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -781,16 +781,20 @@ static int local_fstat(FsContext *fs_ctx, int
> > fid_type, mode_t tmp_mode;
> >          dev_t tmp_dev;
> >
> > -        if (fgetxattr(fd, "user.virtfs.uid", &tmp_uid, sizeof(uid_t)) >
> 0)
> > { +        if (qemu_fgetxattr(fd, "user.virtfs.uid",
> > +                           &tmp_uid, sizeof(uid_t)) > 0) {
> >              stbuf->st_uid = le32_to_cpu(tmp_uid);
> >          }
> > -        if (fgetxattr(fd, "user.virtfs.gid", &tmp_gid, sizeof(gid_t)) >
> 0)
> > { +        if (qemu_fgetxattr(fd, "user.virtfs.gid",
> > +                           &tmp_gid, sizeof(gid_t)) > 0) {
> >              stbuf->st_gid = le32_to_cpu(tmp_gid);
> >          }
> > -        if (fgetxattr(fd, "user.virtfs.mode", &tmp_mode,
> sizeof(mode_t)) >
> > 0) { +        if (qemu_fgetxattr(fd, "user.virtfs.mode",
> > +                           &tmp_mode, sizeof(mode_t)) > 0) {
> >              stbuf->st_mode = le32_to_cpu(tmp_mode);
> >          }
> > -        if (fgetxattr(fd, "user.virtfs.rdev", &tmp_dev, sizeof(dev_t))
> > 0)
> > { +        if (qemu_fgetxattr(fd, "user.virtfs.rdev",
> > +                           &tmp_dev, sizeof(dev_t)) > 0) {
> >              stbuf->st_rdev = le64_to_cpu(tmp_dev);
> >          }
> >      } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
> > diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> > index 627baebaba..38ef8b289d 100644
> > --- a/hw/9pfs/9p-util.h
> > +++ b/hw/9pfs/9p-util.h
> > @@ -19,6 +19,23 @@
> >  #define O_PATH_9P_UTIL 0
> >  #endif
> >
> > +#ifdef CONFIG_DARWIN
> > +#define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
>
> Why does this not have XATTR_NOFOLLOW and the others do? -^
>
> > +#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> > +#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
> > +#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
> > +static inline int qemu_lsetxattr(const char *path, const char *name,
> > +                                 const void *value, size_t size, int
> flags)
> > { +    return setxattr(path, name, value, size, 0, flags |
> XATTR_NOFOLLOW);
> > +}
> > +#else
> > +#define qemu_fgetxattr fgetxattr
> > +#define qemu_lgetxattr lgetxattr
> > +#define qemu_llistxattr llistxattr
> > +#define qemu_lremovexattr lremovexattr
> > +#define qemu_lsetxattr lsetxattr
> > +#endif
> > +
> >  static inline void close_preserve_errno(int fd)
> >  {
> >      int serrno = errno;
>
> Hmm, so we would have two different behaviours for Linux vs. macOS here.
>
> If there is a symbolic link on host, Linux currently applies the permission
> map as xattrs to the destination of the symlink, whereas macOS would map
> the
> permissions as xattrs to the symbolic link itself.
>
> Who is right?
>
>
>

--0000000000002e17aa05d6974541
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s quite possible I&#39;m misreading the man pa=
ge when double-checking this, but I believe the l-prefixed functions are fo=
r the link itself and fgetxattr works on the file it refers to. This is why=
 XATTR_NOFOLLOW doesn&#39;t appear on fgetxattr, and I believe this also me=
ans that these definitions line up the macOS behavior with Linux. </div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Nov 24, 2021 at 11:20 AM Christian Schoenebeck &lt;<a href=3D"mailto:q=
emu_oss@crudebyte.com" target=3D"_blank">qemu_oss@crudebyte.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Montag, 2=
2. November 2021 01:49:10 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; On darwin `fgetxattr` takes two extra optional arguments,<br>
&gt; and the l* variants are not defined (in favor of an extra<br>
&gt; flag to the regular variants.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/9pfs/9p-local.c | 12 ++++++++----<br>
&gt;=C2=A0 hw/9pfs/9p-util.h=C2=A0 | 17 +++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 25 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
&gt; index 1a5e3eed73..2bfff79b12 100644<br>
&gt; --- a/hw/9pfs/9p-local.c<br>
&gt; +++ b/hw/9pfs/9p-local.c<br>
&gt; @@ -781,16 +781,20 @@ static int local_fstat(FsContext *fs_ctx, int<br=
>
&gt; fid_type, mode_t tmp_mode;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_t tmp_dev;<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fgetxattr(fd, &quot;user.virtfs.uid&q=
uot;, &amp;tmp_uid, sizeof(uid_t)) &gt; 0)<br>
&gt; { +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_fgetxattr(fd, &quot;user.virtf=
s.uid&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tmp_uid, sizeof(uid_t)) &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stbuf-&gt;st_uid =3D l=
e32_to_cpu(tmp_uid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fgetxattr(fd, &quot;user.virtfs.gid&q=
uot;, &amp;tmp_gid, sizeof(gid_t)) &gt; 0)<br>
&gt; { +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_fgetxattr(fd, &quot;user.virtf=
s.gid&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tmp_gid, sizeof(gid_t)) &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stbuf-&gt;st_gid =3D l=
e32_to_cpu(tmp_gid);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fgetxattr(fd, &quot;user.virtfs.mode&=
quot;, &amp;tmp_mode, sizeof(mode_t)) &gt;<br>
&gt; 0) { +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_fgetxattr(fd, &quot;user.vi=
rtfs.mode&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tmp_mode, sizeof(mode_t)) &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stbuf-&gt;st_mode =3D =
le32_to_cpu(tmp_mode);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fgetxattr(fd, &quot;user.virtfs.rdev&=
quot;, &amp;tmp_dev, sizeof(dev_t)) &gt; 0)<br>
&gt; { +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_fgetxattr(fd, &quot;user.virtf=
s.rdev&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tmp_dev, sizeof(dev_t)) &gt; 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stbuf-&gt;st_rdev =3D =
le64_to_cpu(tmp_dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (fs_ctx-&gt;export_flags &amp; V9FS_SM_M=
APPED_FILE) {<br>
&gt; diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
&gt; index 627baebaba..38ef8b289d 100644<br>
&gt; --- a/hw/9pfs/9p-util.h<br>
&gt; +++ b/hw/9pfs/9p-util.h<br>
&gt; @@ -19,6 +19,23 @@<br>
&gt;=C2=A0 #define O_PATH_9P_UTIL 0<br>
&gt;=C2=A0 #endif<br>
&gt; <br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +#define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)<br>
<br>
Why does this not have XATTR_NOFOLLOW and the others do? -^<br>
<br>
&gt; +#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)<=
br>
&gt; +#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)<b=
r>
&gt; +#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLO=
W)<br>
&gt; +static inline int qemu_lsetxattr(const char *path, const char *name,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *value, size_t =
size, int flags)<br>
&gt; { +=C2=A0 =C2=A0 return setxattr(path, name, value, size, 0, flags | X=
ATTR_NOFOLLOW);<br>
&gt; +}<br>
&gt; +#else<br>
&gt; +#define qemu_fgetxattr fgetxattr<br>
&gt; +#define qemu_lgetxattr lgetxattr<br>
&gt; +#define qemu_llistxattr llistxattr<br>
&gt; +#define qemu_lremovexattr lremovexattr<br>
&gt; +#define qemu_lsetxattr lsetxattr<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 static inline void close_preserve_errno(int fd)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int serrno =3D errno;<br>
<br>
Hmm, so we would have two different behaviours for Linux vs. macOS here.<br=
>
<br>
If there is a symbolic link on host, Linux currently applies the permission=
<br>
map as xattrs to the destination of the symlink, whereas macOS would map th=
e<br>
permissions as xattrs to the symbolic link itself.<br>
<br>
Who is right?<br>
<br>
<br>
</blockquote></div>

--0000000000002e17aa05d6974541--

