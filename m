Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146C64AC167
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:41:09 +0100 (CET)
Received: from localhost ([::1]:40902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5CV-0004eu-FU
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fabianfranz.oss@gmail.com>)
 id 1nH0iY-000125-CI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:53:54 -0500
Received: from [2a00:1450:4864:20::630] (port=38848
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fabianfranz.oss@gmail.com>)
 id 1nH0iV-00027g-8g
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:53:53 -0500
Received: by mail-ej1-x630.google.com with SMTP id k25so39993503ejp.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rY2WgiLHzEGTmDGobZzTbVJ2rds49SNAZkMlG0m4osI=;
 b=Qxhl9VUJ8h6rXxX0jd8bDHc5XQVI0MhMk7xyd4tkhCRnNsw9fQUyZPhGvnrsuJglcE
 ExiyLwzkezRGG4jmKp+IxTg/aX8KT8KBDRcYYV4E/7GdthEDArH4JKc6jk15Fhy6oBpa
 9aYdK1lRwX6YE0e9jrYnMGPcvBmbd78Ek77ZG2+IzmcNxPl4iN9WTyJT7rNh1kBYGDYR
 beq8C+YnONiD1BGPGNxdtB8TmNgrdQroik29MlwVmtzyZ+8GP/hRz7ZZQCTGmDWQIjxp
 +8wi4zqOBXBD/sYmQb3y3leBvJXO4Tx+YOFu/8/rFembtmIHr8+fgVxKSzilJMZSCh86
 5u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rY2WgiLHzEGTmDGobZzTbVJ2rds49SNAZkMlG0m4osI=;
 b=Wsq9oly0K1OeoDTJrnMy+jML/KOIzFCFAtqBR22cBfycSY64yUqmZR9zTKvDqom+Pq
 RPRvbC0SJR5w5nqsL6toUoXpzfgRxniZijkF8uCNropSYf+0LsdQN/qH+2SdxyM7/7u3
 xdYGCiL8aESFV/G5NbUNjgxjXc750Go53FueAKRlAlBmNfJg2cd7K7wOzOkXTZqtVnxc
 J2Y1hkKrkhoLsN9vlTLTMMRz9D0NKj8VgDe/ydrvduLvefDvDm5ZYXO+wnsrO0C7mtJL
 6lj1SixjXa35vlPsNzs9ERiTgw7hGLo22kqPkZ83LXF0KDCLKOczABhFG0WtJSqLEU8t
 ekqA==
X-Gm-Message-State: AOAM5325QGSNdx5N1H9j7wr2JQxkeMGk32+QahKT6MI5C6ylqyTp68cE
 diMxa9SGx/mRlAu6lIDY/G3QJM42YMs/xwk1nQ8=
X-Google-Smtp-Source: ABdhPJxWphPsCCdRJy8h1z4KxkzkwCxjqG7px8IYHa96XWIrPTu/n8ruiqRJUYG8fD5i1X6KHSOC95k06QR5p1YePxw=
X-Received: by 2002:a17:907:1b05:: with SMTP id
 mp5mr9232913ejc.527.1644227628101; 
 Mon, 07 Feb 2022 01:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-5-wwcohen@gmail.com>
In-Reply-To: <20220206200719.74464-5-wwcohen@gmail.com>
From: Fabian Franz <fabianfranz.oss@gmail.com>
Date: Mon, 7 Feb 2022 10:53:37 +0100
Message-ID: <CAP+dFMJPB5RrYd3DjsX1YXeuw-grL+iW6yV5jmE_yiTRU-c5Rg@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] 9p: darwin: Handle struct dirent differences
To: Will Cohen <wwcohen@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b3f4fd05d76a930b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=fabianfranz.oss@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:22:53 -0500
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3f4fd05d76a930b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Comments inline:

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index 1a5e3eed73..7137a28109 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx,
> V9fsFidOpenState *fs)
>
>  again:
>      entry =3D readdir(fs->dir.stream);
> +#ifdef CONFIG_DARWIN
> +    int td;
> +    td =3D telldir(fs->dir.stream);


Maybe call this =E2=80=9Eoff=E2=80=9C?

>
> +    /* If telldir fails, fail the entire readdir call */
> +    if (td < 0) {
> +        return NULL;
> +    }
> +    entry->d_seekoff =3D td;
> +#endif
>      if (!entry) {
>          return NULL;
>      }


This needs to be before the #ifdef!


> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index b1664080d8..8b4b5cf7dc 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx,
> V9fsFidOpenState *fs)
>
>  static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState *fs=
)
>  {
> -    return readdir(fs->dir.stream);
> +    struct dirent *entry;
> +    entry =3D readdir(fs->dir.stream);
> +#ifdef CONFIG_DARWIN
> +    if (!entry) {
> +        return NULL;
> +    }
> +    int td;
> +    td =3D telldir(fs->dir.stream);
> +    /* If telldir fails, fail the entire readdir call */
> +    if (td < 0) {
> +        return NULL;
> +    }
> +    entry->d_seekoff =3D td;
> +#endif
> +    return entry;
>  }
>
>  static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t of=
f)
> diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
> index 4a4a776d06..e264a03eef 100644
> --- a/hw/9pfs/9p-synth.c
> +++ b/hw/9pfs/9p-synth.c
> @@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,
>  {
>      strcpy(entry->d_name, node->name);
>      entry->d_ino =3D node->attr->inode;
> +#ifdef CONFIG_DARWIN
> +    entry->d_seekoff =3D off + 1;
> +#else
>      entry->d_off =3D off + 1;
> +#endif
>  }
>
>  static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 546f46dc7d..accbec9987 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char
> *filename,
>                                  const char *name);
>
>  #endif
> +
> +
> +/**
> + * Darwin has d_seekoff, which appears to function similarly to d_off.
> + * However, it does not appear to be supported on all file systems,
> + * so ensure it is manually injected earlier and call here when
> + * needed.
> + */
> +
> +inline off_t qemu_dirent_off(struct dirent *dent)
> +{
> +#ifdef CONFIG_DARWIN
> +    return dent->d_seekoff;
> +#else
> +    return dent->d_off;
> +#endif
> +}


Are we sure we want a helper for two times the same ifdef? Deferring to
maintainers here however.

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 1563d7b7c6..cf694da354 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -27,6 +27,7 @@
>  #include "virtio-9p.h"
>  #include "fsdev/qemu-fsdev.h"
>  #include "9p-xattr.h"
> +#include "9p-util.h"
>  #include "coth.h"
>  #include "trace.h"
>  #include "migration/blocker.h"
> @@ -2281,7 +2282,11 @@ static int coroutine_fn
> v9fs_do_readdir_with_stat(V9fsPDU *pdu,
>          count +=3D len;
>          v9fs_stat_free(&v9stat);
>          v9fs_path_free(&path);
> -        saved_dir_pos =3D dent->d_off;
> +        saved_dir_pos =3D qemu_dirent_off(dent);
> +        if (saved_dir_pos < 0) {
> +            err =3D saved_dir_pos;
> +            break;
> +        }


Do we still need this error-handling? I had removed it in my interdiff
patch.

>
>      }
>
>      v9fs_readdir_unlock(&fidp->fs.dir);
> @@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp,
>      V9fsString name;
>      int len, err =3D 0;
>      int32_t count =3D 0;
> +    off_t off;
>      struct dirent *dent;
>      struct stat *st;
>      struct V9fsDirEnt *entries =3D NULL;
> @@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU
> *pdu, V9fsFidState *fidp,
>              qid.version =3D 0;
>          }
>
> +        off =3D qemu_dirent_off(dent);
> +        if (off < 0) {
> +            err =3D off;
> +            break;
> +        }


Same here - if this can never fail, why add the error handling?


>          v9fs_string_init(&name);
>          v9fs_string_sprintf(&name, "%s", dent->d_name);
>
>          /* 11 =3D 7 + 4 (7 =3D start offset, 4 =3D space for storing cou=
nt) */
>          len =3D pdu_marshal(pdu, 11 + count, "Qqbs",
> -                          &qid, dent->d_off,
> +                          &qid, off,
>                            dent->d_type, &name);
>
>          v9fs_string_free(&name);
> diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
> index 032cce04c4..fac6759a64 100644
> --- a/hw/9pfs/codir.c
> +++ b/hw/9pfs/codir.c
> @@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidStat=
e
> *fidp,
>          }
>
>          size +=3D len;
> +        /* This conditional statement is identical in
> +         * function to qemu_dirent_off, described in 9p-util.h,
> +         * since that header cannot be included here. */
> +#ifdef CONFIG_DARWIN
> +        saved_dir_pos =3D dent->d_seekoff;
> +#else
>          saved_dir_pos =3D dent->d_off;
> +#endif
>      }
>
>      /* restore (last) saved position */
> --
> 2.32.0 (Apple Git-132)
>
>

--000000000000b3f4fd05d76a930b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Comments inline:</div><div><br><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex" dir=3D"auto">
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>
index 1a5e3eed73..7137a28109 100644<br>
--- a/hw/9pfs/9p-local.c<br>
+++ b/hw/9pfs/9p-local.c<br>
@@ -559,6 +559,15 @@ static struct dirent *local_readdir(FsContext *ctx, V9=
fsFidOpenState *fs)<br>
<br>
=C2=A0again:<br>
=C2=A0 =C2=A0 =C2=A0entry =3D readdir(fs-&gt;dir.stream);<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 int td;<br>
+=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);</blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Maybe call this =E2=80=9Eoff=E2=80=9C?</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
+=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br>
+=C2=A0 =C2=A0 if (td &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0if (!entry) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">This needs to be before the #ifdef!</div><div dir=3D"auto"><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex" dir=3D"auto"><br>
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c<br>
index b1664080d8..8b4b5cf7dc 100644<br>
--- a/hw/9pfs/9p-proxy.c<br>
+++ b/hw/9pfs/9p-proxy.c<br>
@@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx, V9fsFidOpen=
State *fs)<br>
<br>
=C2=A0static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState =
*fs)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return readdir(fs-&gt;dir.stream);<br>
+=C2=A0 =C2=A0 struct dirent *entry;<br>
+=C2=A0 =C2=A0 entry =3D readdir(fs-&gt;dir.stream);<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 if (!entry) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 int td;<br>
+=C2=A0 =C2=A0 td =3D telldir(fs-&gt;dir.stream);<br>
+=C2=A0 =C2=A0 /* If telldir fails, fail the entire readdir call */<br>
+=C2=A0 =C2=A0 if (td &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D td;<br>
+#endif<br>
+=C2=A0 =C2=A0 return entry;<br>
=C2=A0}<br>
<br>
=C2=A0static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t=
 off)<br>
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c<br>
index 4a4a776d06..e264a03eef 100644<br>
--- a/hw/9pfs/9p-synth.c<br>
+++ b/hw/9pfs/9p-synth.c<br>
@@ -222,7 +222,11 @@ static void synth_direntry(V9fsSynthNode *node,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0strcpy(entry-&gt;d_name, node-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;d_ino =3D node-&gt;attr-&gt;inode;<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 entry-&gt;d_seekoff =3D off + 1;<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0entry-&gt;d_off =3D off + 1;<br>
+#endif<br>
=C2=A0}<br>
<br>
=C2=A0static struct dirent *synth_get_dentry(V9fsSynthNode *dir,<br>
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h<br>
index 546f46dc7d..accbec9987 100644<br>
--- a/hw/9pfs/9p-util.h<br>
+++ b/hw/9pfs/9p-util.h<br>
@@ -79,3 +79,20 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *f=
ilename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name);<br>
<br>
=C2=A0#endif<br>
+<br>
+<br>
+/**<br>
+ * Darwin has d_seekoff, which appears to function similarly to d_off.<br>
+ * However, it does not appear to be supported on all file systems,<br>
+ * so ensure it is manually injected earlier and call here when<br>
+ * needed.<br>
+ */<br>
+<br>
+inline off_t qemu_dirent_off(struct dirent *dent)<br>
+{<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 return dent-&gt;d_seekoff;<br>
+#else<br>
+=C2=A0 =C2=A0 return dent-&gt;d_off;<br>
+#endif<br>
+}</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Are we sure we=
 want a helper for two times the same ifdef? Deferring to maintainers here =
however.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto">
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c<br>
index 1563d7b7c6..cf694da354 100644<br>
--- a/hw/9pfs/9p.c<br>
+++ b/hw/9pfs/9p.c<br>
@@ -27,6 +27,7 @@<br>
=C2=A0#include &quot;virtio-9p.h&quot;<br>
=C2=A0#include &quot;fsdev/qemu-fsdev.h&quot;<br>
=C2=A0#include &quot;9p-xattr.h&quot;<br>
+#include &quot;9p-util.h&quot;<br>
=C2=A0#include &quot;coth.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;migration/blocker.h&quot;<br>
@@ -2281,7 +2282,11 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9=
fsPDU *pdu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count +=3D len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_stat_free(&amp;v9stat);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_path_free(&amp;path);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D qemu_dirent_off(dent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (saved_dir_pos &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D saved_dir_pos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Do we still need this error-handling? I had removed it in my =
interdiff patch.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0v9fs_readdir_unlock(&amp;fidp-&gt;fs.dir);<br>
@@ -2420,6 +2425,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu,=
 V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0V9fsString name;<br>
=C2=A0 =C2=A0 =C2=A0int len, err =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0int32_t count =3D 0;<br>
+=C2=A0 =C2=A0 off_t off;<br>
=C2=A0 =C2=A0 =C2=A0struct dirent *dent;<br>
=C2=A0 =C2=A0 =C2=A0struct stat *st;<br>
=C2=A0 =C2=A0 =C2=A0struct V9fsDirEnt *entries =3D NULL;<br>
@@ -2480,12 +2486,17 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pd=
u, V9fsFidState *fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qid.version =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 off =3D qemu_dirent_off(dent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (off &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err =3D off;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Same here - if this can never fail, why add the error handlin=
g?</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_string_init(&amp;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_string_sprintf(&amp;name, &quot;%s&q=
uot;, dent-&gt;d_name);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 11 =3D 7 + 4 (7 =3D start offset, 4 =
=3D space for storing count) */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D pdu_marshal(pdu, 11 + count, &quo=
t;Qqbs&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;qid, dent-&gt;d_off,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;qid, off,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dent-&gt;d_type, &amp;name);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v9fs_string_free(&amp;name);<br>
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c<br>
index 032cce04c4..fac6759a64 100644<br>
--- a/hw/9pfs/codir.c<br>
+++ b/hw/9pfs/codir.c<br>
@@ -167,7 +167,14 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState =
*fidp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This conditional statement is identical in<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* function to qemu_dirent_off, described=
 in 9p-util.h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* since that header cannot be included h=
ere. */<br>
+#ifdef CONFIG_DARWIN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_dir_pos =3D dent-&gt;d_seekoff;<br>
+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_dir_pos =3D dent-&gt;d_off;<br>
+#endif<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* restore (last) saved position */<br>
-- <br>
2.32.0 (Apple Git-132)<br>
<br>
</blockquote></div></div>

--000000000000b3f4fd05d76a930b--

