Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFBA2D6187
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:19:44 +0100 (CET)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOfN-0006sZ-Tr
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1knOZ2-0003uG-Vl; Thu, 10 Dec 2020 11:13:09 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1knOYz-0000be-J8; Thu, 10 Dec 2020 11:13:08 -0500
Received: by mail-pg1-x544.google.com with SMTP id w4so4602588pgg.13;
 Thu, 10 Dec 2020 08:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gg7v0Ue4OeIX2HMC2+TnBTikZ6W5MLJuiyfBWcK/mto=;
 b=NjzasvPmBZy+jdt2ZtryYjRgErD91uktn25fDGNMuZFhV9Lf56pPYyx1+sBHuXNp3k
 lchUXAboNF8WuvnDnp3eDBGTE6Fu02x1u5fTn6mivryNjDeVQRO1oGiir2RUtnrvuy4R
 2vGOmeXyxZD2pLVb/p7E+0uOaTNEKyPIw2nZUF3oKuL64ggzIi5mgX3LEyRZOaHm3VDs
 LGli7blf8YNapX0c+GFRrloXMSvPaDUmfkS+iCy4oAh4ruAVgmb0ZhN/fqqevyj4ZIhM
 iaKo48CKKc0sKD3WudYt8kpuNarp9zws9Gy5CoXuGGVwWZquNSD2KD9pjLYpIPF2rkD1
 J+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gg7v0Ue4OeIX2HMC2+TnBTikZ6W5MLJuiyfBWcK/mto=;
 b=jD7EIOjAWt+iGwVQVDu5l9++MsVCUWIqXyHlRFXQJRShnZsnCc/9FR/Mi5xnViwIxr
 +CKvMB47aN323UFNlvE7DKVej2msI2yhPyL+fWO6KU6YoZaKhZ58GcYfi0h8eI4bO1+X
 BH2UW6MjtVB8LG/6mCs6M7zfKa4fkm/CVqAoVXrKfLo20zopbN+IG4hMaApuno48C/3i
 y2nfcoUnyg5TOp0+mv8pBa2q3HLovgacpXrEFwoBtf833D4BkmyqORGSBNhf2gxGRMI4
 iZ07XvoKPKfGN/kAW2zMHLnZdD1RwKiBTSPre0XGgqquU+8Zuq9C7mwSMtghjo3Qol21
 SyQA==
X-Gm-Message-State: AOAM530yU1K0M5H+omhbe3QXpSyxkP+0sGgHl58LC2TFP+fuXTW6CQuC
 2wf4laWopFLDhyjGBuHtUdaRgBWAG33LDCCW87k=
X-Google-Smtp-Source: ABdhPJxKRjz9OM5ZZMBnDgtQjhRcyN+xrreOyYBBXtf0b3MwQ9+lGbnIFDTt7xBUKZ/tp5jqWAqNhJySH8ohzFNeHM0=
X-Received: by 2002:a17:90b:16cd:: with SMTP id
 iy13mr8302327pjb.182.1607616783323; 
 Thu, 10 Dec 2020 08:13:03 -0800 (PST)
MIME-Version: 1.0
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <1607489688-37088-1-git-send-email-fengli@smartx.com>
 <20201210155910.GN24855@redhat.com>
In-Reply-To: <20201210155910.GN24855@redhat.com>
From: Feng Li <lifeng1519@gmail.com>
Date: Fri, 11 Dec 2020 00:12:35 +0800
Message-ID: <CAEK8JBCw9-qhjEy_QifxC5a20gj4RS5=uNe6NJ5=TWHGL+n=Dw@mail.gmail.com>
Subject: Re: [PATCH v2] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=lifeng1519@gmail.com; helo=mail-pg1-x544.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, "kyle@smartx.com" <kyle@smartx.com>,
 Li Feng <fengli@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, I see.
I will split the detect lock without changing the global variable to a
separate function.
Don't call the qemu_has_ofd_lock.
Thanks.

Daniel P. Berrang=C3=A9 <berrange@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8811:59=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Wed, Dec 09, 2020 at 12:54:48PM +0800, Li Feng wrote:
> > This patch addresses this issue:
> > When accessing a volume on an NFS filesystem without supporting the fil=
e lock,
> > tools, like qemu-img, will complain "Failed to lock byte 100".
> >
> > In the original code, the qemu_has_ofd_lock will test the lock on the
> > "/dev/null" pseudo-file. Actually, the file.locking is per-drive proper=
ty,
> > which depends on the underlay filesystem.
> >
> > In this patch, make the 'qemu_has_ofd_lock' with a filename be more
> > generic and reasonable.
> >
> > Signed-off-by: Li Feng <fengli@smartx.com>
> > ---
> > v2: remove the refactoring.
> > ---
> >  block/file-posix.c         | 32 ++++++++++++++++++--------------
> >  include/qemu/osdep.h       |  2 +-
> >  tests/test-image-locking.c |  2 +-
> >  util/osdep.c               | 19 ++++++++++++-------
> >  4 files changed, 32 insertions(+), 23 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 806764f7e3..03be1b188c 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -595,7 +595,7 @@ static int raw_open_common(BlockDriverState *bs, QD=
ict *options,
> >      switch (locking) {
> >      case ON_OFF_AUTO_ON:
> >          s->use_lock =3D true;
> > -        if (!qemu_has_ofd_lock()) {
> > +        if (!qemu_has_ofd_lock(filename)) {
> >              warn_report("File lock requested but OFD locking syscall i=
s "
> >                          "unavailable, falling back to POSIX file locks=
");
> >              error_printf("Due to the implementation, locks can be lost=
 "
> > @@ -606,7 +606,7 @@ static int raw_open_common(BlockDriverState *bs, QD=
ict *options,
> >          s->use_lock =3D false;
> >          break;
> >      case ON_OFF_AUTO_AUTO:
> > -        s->use_lock =3D qemu_has_ofd_lock();
> > +        s->use_lock =3D qemu_has_ofd_lock(filename);
> >          break;
> >      default:
> >          abort();
> > @@ -2388,6 +2388,7 @@ raw_co_create(BlockdevCreateOptions *options, Err=
or **errp)
> >      int fd;
> >      uint64_t perm, shared;
> >      int result =3D 0;
> > +    bool use_lock;
> >
> >      /* Validate options and set default values */
> >      assert(options->driver =3D=3D BLOCKDEV_DRIVER_FILE);
> > @@ -2428,19 +2429,22 @@ raw_co_create(BlockdevCreateOptions *options, E=
rror **errp)
> >      perm =3D BLK_PERM_WRITE | BLK_PERM_RESIZE;
> >      shared =3D BLK_PERM_ALL & ~BLK_PERM_RESIZE;
> >
> > -    /* Step one: Take locks */
> > -    result =3D raw_apply_lock_bytes(NULL, fd, perm, ~shared, false, er=
rp);
> > -    if (result < 0) {
> > -        goto out_close;
> > -    }
> > +    use_lock =3D qemu_has_ofd_lock(file_opts->filename);
> > +    if (use_lock) {
> > +        /* Step one: Take locks */
> > +        result =3D raw_apply_lock_bytes(NULL, fd, perm, ~shared, false=
, errp);
> > +        if (result < 0) {
> > +            goto out_close;
> > +        }
> >
> > -    /* Step two: Check that nobody else has taken conflicting locks */
> > -    result =3D raw_check_lock_bytes(fd, perm, shared, errp);
> > -    if (result < 0) {
> > -        error_append_hint(errp,
> > -                          "Is another process using the image [%s]?\n"=
,
> > -                          file_opts->filename);
> > -        goto out_unlock;
> > +        /* Step two: Check that nobody else has taken conflicting lock=
s */
> > +        result =3D raw_check_lock_bytes(fd, perm, shared, errp);
> > +        if (result < 0) {
> > +            error_append_hint(errp,
> > +                              "Is another process using the image [%s]=
?\n",
> > +                              file_opts->filename);
> > +            goto out_unlock;
> > +        }
> >      }
> >
> >      /* Clear the file by truncating it to 0 */
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index f9ec8c84e9..349adad465 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -512,7 +512,7 @@ int qemu_dup(int fd);
> >  int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
> >  int qemu_unlock_fd(int fd, int64_t start, int64_t len);
> >  int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusi=
ve);
> > -bool qemu_has_ofd_lock(void);
> > +bool qemu_has_ofd_lock(const char *filename);
> >  #endif
> >
> >  #if defined(__HAIKU__) && defined(__i386__)
> > diff --git a/tests/test-image-locking.c b/tests/test-image-locking.c
> > index ba057bd66c..3e80246081 100644
> > --- a/tests/test-image-locking.c
> > +++ b/tests/test-image-locking.c
> > @@ -149,7 +149,7 @@ int main(int argc, char **argv)
> >
> >      g_test_init(&argc, &argv, NULL);
> >
> > -    if (qemu_has_ofd_lock()) {
> > +    if (qemu_has_ofd_lock(NULL)) {
> >          g_test_add_func("/image-locking/basic", test_image_locking_bas=
ic);
> >          g_test_add_func("/image-locking/set-perm-abort", test_set_perm=
_abort);
> >      }
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 66d01b9160..20119aa9ae 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -187,7 +187,7 @@ static int qemu_parse_fdset(const char *param)
> >      return qemu_parse_fd(param);
> >  }
> >
> > -static void qemu_probe_lock_ops(void)
> > +static void qemu_probe_lock_ops(const char *filename)
> >  {
> >      if (fcntl_op_setlk =3D=3D -1) {
> >  #ifdef F_OFD_SETLK
> > @@ -200,10 +200,15 @@ static void qemu_probe_lock_ops(void)
> >              .l_type   =3D F_WRLCK,
> >          };
> >
> > -        fd =3D open("/dev/null", O_RDWR);
> > +        if (filename) {
> > +            fd =3D open(filename, O_RDWR);
> > +        } else {
> > +            fd =3D open("/dev/null", O_RDONLY);
> > +        }
> >          if (fd < 0) {
> >              fprintf(stderr,
> > -                    "Failed to open /dev/null for OFD lock probing: %s=
\n",
> > +                    "Failed to open %s for OFD lock probing: %s\n",
> > +                    filename ? filename : "/dev/null",
> >                      strerror(errno));
> >              fcntl_op_setlk =3D F_SETLK;
> >              fcntl_op_getlk =3D F_GETLK;
>
> This is still just as broken as v1, because it is setting
> a global variable fcntl_op_getlk, based on result of an
> operation whose result will vary depending on the filename
> parameter.
>
>
> If you want to test whether a filesystem supports fcntl
> locks in general, don't touch qemu_has_ofd_lock or
> qemu_probe_lock_ops methods at all. Those are just for
> probing regular fcntl vs OFD fcntl locks.
>
>
>
> > @@ -225,9 +230,9 @@ static void qemu_probe_lock_ops(void)
> >      }
> >  }
> >
> > -bool qemu_has_ofd_lock(void)
> > +bool qemu_has_ofd_lock(const char *filename)
> >  {
> > -    qemu_probe_lock_ops();
> > +    qemu_probe_lock_ops(filename);
> >  #ifdef F_OFD_SETLK
> >      return fcntl_op_setlk =3D=3D F_OFD_SETLK;
> >  #else
> > @@ -244,7 +249,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, i=
nt64_t len, int fl_type)
> >          .l_len    =3D len,
> >          .l_type   =3D fl_type,
> >      };
> > -    qemu_probe_lock_ops();
> > +    qemu_probe_lock_ops(NULL);
> >      do {
> >          ret =3D fcntl(fd, fcntl_op_setlk, &fl);
> >      } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> > @@ -270,7 +275,7 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_=
t len, bool exclusive)
> >          .l_len    =3D len,
> >          .l_type   =3D exclusive ? F_WRLCK : F_RDLCK,
> >      };
> > -    qemu_probe_lock_ops();
> > +    qemu_probe_lock_ops(NULL);
> >      ret =3D fcntl(fd, fcntl_op_getlk, &fl);
> >      if (ret =3D=3D -1) {
> >          return -errno;
> > --
> > 2.24.3
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

