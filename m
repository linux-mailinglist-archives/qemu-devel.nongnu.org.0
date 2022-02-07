Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF694ACAFE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 22:12:20 +0100 (CET)
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHBJ5-0007GE-4p
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 16:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHBEl-0006A1-CY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:07:51 -0500
Received: from [2a00:1450:4864:20::133] (port=44608
 helo=mail-lf1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nHBEj-0008TV-0B
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:07:51 -0500
Received: by mail-lf1-x133.google.com with SMTP id i17so3331483lfg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 13:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+CMEtKVt72Y6n+lqpnU1ipxaExKtkMTw+srltOntcJs=;
 b=e3t89TUbkgX3qNp3Rx1SA4MVGM6oE/c73V7igGDyD+OKeGJ4ya2Wehu887/BgVnh/e
 2C93QYaQwht2jhPJAeQw5DXEFeEXhrWcn8PH2C41EjuYTSaK48elSsMBZ6v70w4h0YwG
 7B4BFZ/Qyo1LkyR49A0t6P1SethegChaR3Ug2KHEQngIyI4z3z2ZbDTfdD6HwDxbV015
 HnxVnHZnkUeSYbzH8iuPEiTgbeQVdtSJdADU3xCJ4GOg6VZvDDSStJOExkE/vE9n7yy5
 G/Zi7aqB9Cjuak6u36P3lFf+XCLarg5B5u54dIqzGuVA7iAUxq6Jjxti1pSn4swcs0NX
 oHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CMEtKVt72Y6n+lqpnU1ipxaExKtkMTw+srltOntcJs=;
 b=mCc7Yhccy+AfcWI6UZELFvYgFvhAXYN9pMYE5U0CoWUquye+VryTHHM6oNM/5lBP3D
 vDf7HGASL2VvadQtDVS0VwlLav3u+GirtWLk4TvSlGSdQMBwd2SVVyK1GIYJhHH2nkvX
 N/DHaZQ5H4M4gZktgShl7WxDjELrUQopzjJW6zDdVekIMFIGLSfSyelAVfUZdsC8BYf3
 yn17MD+w7KUCIoSIaIqx00EXnZ5ZdujcSM9K+18QoCr5OLMN7xue47iPAePBvPyBBNtU
 U24d9HlZ6KJHL18Zp92rYdOkLabcewL0SFT8P1Pz1JzldUmJUlfDqPq+XmbhaZ+M7dj2
 7ifQ==
X-Gm-Message-State: AOAM530n9x9wIdXLDd3JZC6Lmcu2fQMlYEj85ne8S1ilR3Lu7MX+Dc+K
 eXA3xc9IrrIYj12A3ez1xukziN4Y5nu5768UzFU=
X-Google-Smtp-Source: ABdhPJzco0sLUNPmz/5ZNrmRIhxt5hggniIRG+aj+3HX2PpnnvweyP2X9t0bl32x+KZ44/J5slvl/iF4oqykzsg0pnI=
X-Received: by 2002:a05:6512:3123:: with SMTP id
 p3mr948487lfd.298.1644268065731; 
 Mon, 07 Feb 2022 13:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220207114912.1efe2a27@bahia>
 <YgD7FZs9d1srvYG8@work-vm> <5204641.elYuxvqpol@silver>
In-Reply-To: <5204641.elYuxvqpol@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Feb 2022 16:07:34 -0500
Message-ID: <CAB26zV23fCzmtQd+heort4rXkqU0SD-dSBVwzabxE-64edWFmg@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000f9378805d773fd3b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::133
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=wwcohen@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
 hi@alyssa.is, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Michael Roitzsch <reactorcontrol@icloud.com>,
 Vivek <vgoyal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f9378805d773fd3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 7, 2022 at 9:21 AM Christian Schoenebeck <qemu_oss@crudebyte.co=
m>
wrote:

> On Montag, 7. Februar 2022 11:57:25 CET Dr. David Alan Gilbert wrote:
> > * Greg Kurz (groug@kaod.org) wrote:
> > > On Mon, 7 Feb 2022 11:30:18 +0100
> > >
> > > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> > > > On 7/2/22 09:47, Greg Kurz wrote:
> > > > > On Sun, 6 Feb 2022 20:10:23 -0500
> > > > >
> > > > > Will Cohen <wwcohen@gmail.com> wrote:
> > > > >> This patch set currently places it in 9p-util only because 9p is
> the
> > > > >> only
> > > > >> place where this issue seems to have come up so far and we were
> wary
> > > > >> of
> > > > >> editing files too far afield, but I have no attachment to its
> > > > >> specific
> > > > >> location!
> > > > >
> > > > > Inline comments are preferred on qemu-devel. Please don't top pos=
t
> !
> > > > > This complicates the review a lot.
> > > > >
> > > > > This is indeed a good candidate for osdep. This being said, unles=
s
> > > > > there's
> > > > > some other user in the QEMU code base, it is acceptable to leave =
it
> > > > > under
> > > > > 9pfs.
> > > >
> > > > virtiofsd could eventually use it.
> > >
> > > Indeed but virtiofsd is for linux hosts only AFAICT and I'm not aware
> of
> > > any work to support any other host OS.
> > >
> > > Cc'ing virtio-fs people for inputs on this topic.
> >
> > Indeeed, there's a lot of Linux specific code in the virtiofsd - I know
> > people are interested in other platforms, but I'm not sure that's the
> > right starting point.
> >
> > Dave
>
> Agreeing with Greg here: i.e. I would have placed this into osdep, but I
> would
> not insist on it either.
>
> Best regards,
> Christian Schoenebeck
>
>
This makes sense. A revised version of this patch, moving qemu_mknodat from
9p-util to osdep and os-posix, is attached below. I'd appreciate any
feedback from those looped in here, so that the context isn't lost before
resubmitting as a v5 patch, especially since this is starting to touch
files outside of 9p.

From c9713c87163da7c96b5357d0d85ac318ae3d3051 Mon Sep 17 00:00:00 2001
From: Keno Fischer <keno@juliacomputing.com>
Date: Sat, 16 Jun 2018 20:56:55 -0400
Subject: [PATCH] 9p: darwin: Implement compatibility for mknodat

Darwin does not support mknodat. However, to avoid race conditions
with later setting the permissions, we must avoid using mknod on
the full path instead. We could try to fchdir, but that would cause
problems if multiple threads try to call mknodat at the same time.
However, luckily there is a solution: Darwin includes a function
that sets the cwd for the current thread only.
This should suffice to use mknod safely.

This function (pthread_fchdir_np) is protected by a check in
meson in a patch later in tihs series.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style
             - Replace clang references with gcc
             - Note radar filed with Apple for missing syscall
             - Replace direct syscall with pthread_fchdir_np and
               adjust patch notes accordingly
             - Move qemu_mknodat from 9p-util to osdep and os-posix]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c   |  4 ++--
 include/qemu/osdep.h | 10 ++++++++++
 os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index a0d08e5216..d42ce6d8b8 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
*dir_path,

     if (fs_ctx->export_flags & V9FS_SM_MAPPED ||
         fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
-        err =3D mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
+        err =3D qemu_mknodat(dirfd, name, fs_ctx->fmode | S_IFREG, 0);
         if (err =3D=3D -1) {
             goto out;
         }
@@ -697,7 +697,7 @@ static int local_mknod(FsContext *fs_ctx, V9fsPath
*dir_path,
         }
     } else if (fs_ctx->export_flags & V9FS_SM_PASSTHROUGH ||
                fs_ctx->export_flags & V9FS_SM_NONE) {
-        err =3D mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
+        err =3D qemu_mknodat(dirfd, name, credp->fc_mode, credp->fc_rdev);
         if (err =3D=3D -1) {
             goto out;
         }
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index d1660d67fa..f3a8367ece 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -810,3 +810,13 @@ static inline int
platform_does_not_support_system(const char *command)
 #endif

 #endif
+
+/*
+ * As long as mknodat is not available on macOS, this workaround
+ * using pthread_fchdir_np is needed. qemu_mknodat is defined in
+ * os-posix.c
+ */
+#ifdef CONFIG_DARWIN
+int pthread_fchdir_np(int fd);
+#endif
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..95c1607065 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -24,6 +24,7 @@
  */

 #include "qemu/osdep.h"
+#include <os/availability.h>
 #include <sys/wait.h>
 #include <pwd.h>
 #include <grp.h>
@@ -332,3 +333,36 @@ int os_mlock(void)
     return -ENOSYS;
 #endif
 }
+
+/*
+ * As long as mknodat is not available on macOS, this workaround
+ * using pthread_fchdir_np is needed.
+ *
+ * Radar filed with Apple for implementing mknodat:
+ * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
+ */
+#ifdef CONFIG_DARWIN
+
+int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
+
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    int preserved_errno, err;
+    if (pthread_fchdir_np(dirfd) < 0) {
+        return -1;
+    }
+    err =3D mknod(filename, mode, dev);
+    preserved_errno =3D errno;
+    /* Stop using the thread-local cwd */
+    pthread_fchdir_np(-1);
+    if (err < 0) {
+        errno =3D preserved_errno;
+    }
+    return err;
+}
+#else
+int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
+{
+    return mknodat(dirfd, filename, mode, dev);
+}
+#endif
--=20
2.34.1

--000000000000f9378805d773fd3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Feb 7, 2022 at 9:21 AM Christian =
Schoenebeck &lt;<a href=3D"mailto:qemu_oss@crudebyte.com">qemu_oss@crudebyt=
e.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Montag, 7. Februar 2022 11:57:25 CET Dr=
. David Alan Gilbert wrote:<br>
&gt; * Greg Kurz (<a href=3D"mailto:groug@kaod.org" target=3D"_blank">groug=
@kaod.org</a>) wrote:<br>
&gt; &gt; On Mon, 7 Feb 2022 11:30:18 +0100<br>
&gt; &gt; <br>
&gt; &gt; Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org=
" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br>
&gt; &gt; &gt; On 7/2/22 09:47, Greg Kurz wrote:<br>
&gt; &gt; &gt; &gt; On Sun, 6 Feb 2022 20:10:23 -0500<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; This patch set currently places it in 9p-util only =
because 9p is the<br>
&gt; &gt; &gt; &gt;&gt; only<br>
&gt; &gt; &gt; &gt;&gt; place where this issue seems to have come up so far=
 and we were wary<br>
&gt; &gt; &gt; &gt;&gt; of<br>
&gt; &gt; &gt; &gt;&gt; editing files too far afield, but I have no attachm=
ent to its<br>
&gt; &gt; &gt; &gt;&gt; specific<br>
&gt; &gt; &gt; &gt;&gt; location!<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Inline comments are preferred on qemu-devel. Please don=
&#39;t top post !<br>
&gt; &gt; &gt; &gt; This complicates the review a lot.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This is indeed a good candidate for osdep. This being s=
aid, unless<br>
&gt; &gt; &gt; &gt; there&#39;s<br>
&gt; &gt; &gt; &gt; some other user in the QEMU code base, it is acceptable=
 to leave it<br>
&gt; &gt; &gt; &gt; under<br>
&gt; &gt; &gt; &gt; 9pfs.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; virtiofsd could eventually use it.<br>
&gt; &gt; <br>
&gt; &gt; Indeed but virtiofsd is for linux hosts only AFAICT and I&#39;m n=
ot aware of<br>
&gt; &gt; any work to support any other host OS.<br>
&gt; &gt; <br>
&gt; &gt; Cc&#39;ing virtio-fs people for inputs on this topic.<br>
&gt; <br>
&gt; Indeeed, there&#39;s a lot of Linux specific code in the virtiofsd - I=
 know<br>
&gt; people are interested in other platforms, but I&#39;m not sure that&#3=
9;s the<br>
&gt; right starting point.<br>
&gt; <br>
&gt; Dave<br>
<br>
Agreeing with Greg here: i.e. I would have placed this into osdep, but I wo=
uld <br>
not insist on it either.<br>
<br>
Best regards,<br>
Christian Schoenebeck<br>
<br></blockquote><div><br></div><div>This makes sense. A revised version of=
 this patch, moving qemu_mknodat from 9p-util to osdep and os-posix, is att=
ached below. I&#39;d appreciate any feedback from those looped in here, so =
that the context isn&#39;t lost before resubmitting as a v5 patch, especial=
ly since this is starting to touch files outside of 9p.<br></div><div><br><=
/div><div>From c9713c87163da7c96b5357d0d85ac318ae3d3051 Mon Sep 17 00:00:00=
 2001<br>From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com">=
keno@juliacomputing.com</a>&gt;<br>Date: Sat, 16 Jun 2018 20:56:55 -0400<br=
>Subject: [PATCH] 9p: darwin: Implement compatibility for mknodat<br><br>Da=
rwin does not support mknodat. However, to avoid race conditions<br>with la=
ter setting the permissions, we must avoid using mknod on<br>the full path =
instead. We could try to fchdir, but that would cause<br>problems if multip=
le threads try to call mknodat at the same time.<br>However, luckily there =
is a solution: Darwin includes a function<br>that sets the cwd for the curr=
ent thread only.<br>This should suffice to use mknod safely.<br><br>This fu=
nction (pthread_fchdir_np) is protected by a check in<br>meson in a patch l=
ater in tihs series.<br><br>Signed-off-by: Keno Fischer &lt;<a href=3D"mail=
to:keno@juliacomputing.com">keno@juliacomputing.com</a>&gt;<br>Signed-off-b=
y: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@icloud.com">reacto=
rcontrol@icloud.com</a>&gt;<br>[Will Cohen: - Adjust coding style<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Replace clang references with g=
cc<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Note radar filed wi=
th Apple for missing syscall<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0- Replace direct syscall with pthread_fchdir_np and<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adjust patch notes accordingly<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Move qemu_mknodat from 9p=
-util to osdep and os-posix]<br>Signed-off-by: Will Cohen &lt;<a href=3D"ma=
ilto:wwcohen@gmail.com">wwcohen@gmail.com</a>&gt;<br>---<br>=C2=A0hw/9pfs/9=
p-local.c =C2=A0 | =C2=A04 ++--<br>=C2=A0include/qemu/osdep.h | 10 ++++++++=
++<br>=C2=A0os-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 ++++++++++++=
++++++++++++++++++++++<br>=C2=A03 files changed, 46 insertions(+), 2 deleti=
ons(-)<br><br>diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c<br>index=
 a0d08e5216..d42ce6d8b8 100644<br>--- a/hw/9pfs/9p-local.c<br>+++ b/hw/9pfs=
/9p-local.c<br>@@ -682,7 +682,7 @@ static int local_mknod(FsContext *fs_ctx=
, V9fsPath *dir_path,<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (fs_ctx-&gt;expor=
t_flags &amp; V9FS_SM_MAPPED ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fs_ctx=
-&gt;export_flags &amp; V9FS_SM_MAPPED_FILE) {<br>- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0err =3D mknodat(dirfd, name, fs_ctx-&gt;fmode | S_IFREG, 0);<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0err =3D qemu_mknodat(dirfd, name, fs_ctx-&gt;fmode =
| S_IFREG, 0);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err =3D=3D -1) {<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0}<br>@@ -697,7 +697,7 @@ static int local_mknod(FsCont=
ext *fs_ctx, V9fsPath *dir_path,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=
=C2=A0 =C2=A0 =C2=A0} else if (fs_ctx-&gt;export_flags &amp; V9FS_SM_PASSTH=
ROUGH ||<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fs_ctx-=
&gt;export_flags &amp; V9FS_SM_NONE) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0err =
=3D mknodat(dirfd, name, credp-&gt;fc_mode, credp-&gt;fc_rdev);<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0err =3D qemu_mknodat(dirfd, name, credp-&gt;fc_mode, c=
redp-&gt;fc_rdev);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err =3D=3D -1) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>diff --git a/include/qemu/osdep.h b/include=
/qemu/osdep.h<br>index d1660d67fa..f3a8367ece 100644<br>--- a/include/qemu/=
osdep.h<br>+++ b/include/qemu/osdep.h<br>@@ -810,3 +810,13 @@ static inline=
 int platform_does_not_support_system(const char *command)<br>=C2=A0#endif<=
br>=C2=A0<br>=C2=A0#endif<br>+<br>+/*<br>+ * As long as mknodat is not avai=
lable on macOS, this workaround<br>+ * using pthread_fchdir_np is needed. q=
emu_mknodat is defined in<br>+ * os-posix.c<br>+ */<br>+#ifdef CONFIG_DARWI=
N<br>+int pthread_fchdir_np(int fd);<br>+#endif<br>+int qemu_mknodat(int di=
rfd, const char *filename, mode_t mode, dev_t dev);<br>diff --git a/os-posi=
x.c b/os-posix.c<br>index ae6c9f2a5e..95c1607065 100644<br>--- a/os-posix.c=
<br>+++ b/os-posix.c<br>@@ -24,6 +24,7 @@<br>=C2=A0 */<br>=C2=A0<br>=C2=A0#=
include &quot;qemu/osdep.h&quot;<br>+#include &lt;os/availability.h&gt;<br>=
=C2=A0#include &lt;sys/wait.h&gt;<br>=C2=A0#include &lt;pwd.h&gt;<br>=C2=A0=
#include &lt;grp.h&gt;<br>@@ -332,3 +333,36 @@ int os_mlock(void)<br>=C2=A0=
 =C2=A0 =C2=A0return -ENOSYS;<br>=C2=A0#endif<br>=C2=A0}<br>+<br>+/*<br>+ *=
 As long as mknodat is not available on macOS, this workaround<br>+ * using=
 pthread_fchdir_np is needed.<br>+ *<br>+ * Radar filed with Apple for impl=
ementing mknodat:<br>+ * rdar://FB9862426 (<a href=3D"https://openradar.app=
spot.com/FB9862426">https://openradar.appspot.com/FB9862426</a>)<br>+ */<br=
>+#ifdef CONFIG_DARWIN<br>+<br>+int pthread_fchdir_np(int fd) API_AVAILABLE=
(macosx(10.12));<br>+<br>+int qemu_mknodat(int dirfd, const char *filename,=
 mode_t mode, dev_t dev)<br>+{<br>+ =C2=A0 =C2=A0int preserved_errno, err;<=
br>+ =C2=A0 =C2=A0if (pthread_fchdir_np(dirfd) &lt; 0) {<br>+ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -1;<br>+ =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0err =3D mkno=
d(filename, mode, dev);<br>+ =C2=A0 =C2=A0preserved_errno =3D errno;<br>+ =
=C2=A0 =C2=A0/* Stop using the thread-local cwd */<br>+ =C2=A0 =C2=A0pthrea=
d_fchdir_np(-1);<br>+ =C2=A0 =C2=A0if (err &lt; 0) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0errno =3D preserved_errno;<br>+ =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0=
return err;<br>+}<br>+#else<br>+int qemu_mknodat(int dirfd, const char *fil=
ename, mode_t mode, dev_t dev)<br>+{<br>+ =C2=A0 =C2=A0return mknodat(dirfd=
, filename, mode, dev);<br>+}<br>+#endif<br>-- <br>2.34.1 <br></div></div><=
/div>

--000000000000f9378805d773fd3b--

