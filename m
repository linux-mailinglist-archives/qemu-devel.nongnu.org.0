Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39D22D3950
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 04:51:25 +0100 (CET)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmqVf-0006we-8T
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 22:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmqUN-0006Lv-5D
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 22:50:04 -0500
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:46203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1kmqUG-0006Hv-8O
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 22:50:02 -0500
Received: by mail-ua1-x944.google.com with SMTP id w7so68127uap.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 19:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NzP18S2DbDNPAd5b+4Hnezj8El4LINYHxqiqFRP2JDg=;
 b=MHJJsecf9E+WkZ4zuzf6JhTeX4S8gYm1d8KrYaGwE5Tt8ybnT4TKks16rmV409pJiL
 sR7e59V3IiBggj3q9e3G6rBB4EcpLz6uZWyKK6q+xwRJxdm4eG2NvGZKjN9JPrJFaF9l
 XE/jotwTe9m9wEtM2Gbb3zny8P1396SiK7QQmT52eKD/it10FbNsMws7WvG5KucIZQRo
 q/kboRBCkf18TWK/MTtTQqlzmhfQQtjlXKYytcEpxplKKTqZhKarKoPk3Tu7RCgtJXjt
 EErvq1eZkfaZLFzu+PxAGtfAogECDeMN8QlLNdwOc+25tZrfw56J3PKDNyTLj5XMat5n
 BR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NzP18S2DbDNPAd5b+4Hnezj8El4LINYHxqiqFRP2JDg=;
 b=LGj/WSrBKIUeuREud8LSjVx79/KAXdfCGxjVk+I9ISaiTWf4pQNe4tWKSzgGdZlMK0
 xtLl8PSQzC0PaTtBw8VWpQm2gBl5/txAM/gqkYTxX/QvsWQz2CiM6bNm38mCW1Vr76C1
 bR27PCN4zOpXRFgI0rTyzNiXNY2VYu3PCCVBZu4y/MvI2ySwi5wgf4wrX5t5LG3z1bTv
 EsFfJaPCPw8Vuv+hmD1mQ981fkKhTH69x3qYUXjfctNrHMl76y0XxN70b9GCbS4l1y4c
 deYGwqEJGvNZMEmnJ1hbth5CIJSZ+67rNugJ399Il+No3XgCdb3JyTnjXvM72UsuhHnP
 cm4g==
X-Gm-Message-State: AOAM530jW7TrD5DJXvea8N/PISTf4NhK+RxBQ34/vTnEYlt0vMV8/S5i
 dpPbRQizlPOCkSdnxpSzE4fhXPWrt6bEewrdE9+bvQ==
X-Google-Smtp-Source: ABdhPJzC06/wEBKCCmbUsUUNQwUJ84BaGqgDxLKbmAhb/B4Xb7vP5/r0HMec/E8UdWs0J2KiC3z9s9MgWh7CgC3kUuk=
X-Received: by 2002:ab0:55da:: with SMTP id w26mr228702uaa.31.1607485794953;
 Tue, 08 Dec 2020 19:49:54 -0800 (PST)
MIME-Version: 1.0
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <20201208134519.GJ3136942@redhat.com>
In-Reply-To: <20201208134519.GJ3136942@redhat.com>
From: Li Feng <fengli@smartx.com>
Date: Wed, 9 Dec 2020 11:49:43 +0800
Message-ID: <CAHckoCwyWLxE3M+ThBAjjbGQbd1V=AtO=P41VzaxgcyDM6CHJA@mail.gmail.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::944;
 envelope-from=fengli@smartx.com; helo=mail-ua1-x944.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Feng Li <lifeng1519@gmail.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Kyle Zhang <kyle@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=889:45=E5=86=99=E9=81=93=
=EF=BC=9A
>
> On Tue, Dec 08, 2020 at 08:59:37PM +0800, Li Feng wrote:
> > This patch addresses this issue:
> > When accessing a volume on an NFS filesystem without supporting the fil=
e lock,
> > tools, like qemu-img, will complain "Failed to lock byte 100".
> >
> > In the original code, the qemu_has_ofd_lock will test the lock on the
> > "/dev/null" pseudo-file. Actually, the file.locking is per-drive proper=
ty,
> > which depends on the underlay filesystem.
>
> IIUC, the problem you're describing is one of whether the filesystem
> supports fcntl locking at all, which is indeed a per-FS check.
>
> The QEMU code being changed though is just about detecting whether
> the host OS supports OFD to not, which is supposed to be a kernel
> level feature applied  universally to all FS types.
>
> >
> > In this patch, make the 'qemu_has_ofd_lock' with a filename be more gen=
eric
> > and reasonable.
> >
> > Signed-off-by: Li Feng <fengli@smartx.com>
> > ---
> >  block/file-posix.c         | 32 +++++++++++++++-------------
> >  include/qemu/osdep.h       |  2 +-
> >  tests/test-image-locking.c |  2 +-
> >  util/osdep.c               | 43 ++++++++++++++++++++++++--------------
> >  4 files changed, 47 insertions(+), 32 deletions(-)
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
> > index 66d01b9160..e7e502edd1 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -42,6 +42,7 @@ extern int madvise(char *, size_t, int);
> >  static bool fips_enabled =3D false;
> >
> >  static const char *hw_version =3D QEMU_HW_VERSION;
> > +static const char *null_device =3D "/dev/null";
> >
> >  int socket_set_cork(int fd, int v)
> >  {
> > @@ -187,11 +188,10 @@ static int qemu_parse_fdset(const char *param)
> >      return qemu_parse_fd(param);
> >  }
> >
> > -static void qemu_probe_lock_ops(void)
> > +static void qemu_probe_lock_ops_fd(int fd)
> >  {
> >      if (fcntl_op_setlk =3D=3D -1) {
> >  #ifdef F_OFD_SETLK
> > -        int fd;
> >          int ret;
> >          struct flock fl =3D {
> >              .l_whence =3D SEEK_SET,
> > @@ -200,17 +200,7 @@ static void qemu_probe_lock_ops(void)
> >              .l_type   =3D F_WRLCK,
> >          };
> >
> > -        fd =3D open("/dev/null", O_RDWR);
> > -        if (fd < 0) {
> > -            fprintf(stderr,
> > -                    "Failed to open /dev/null for OFD lock probing: %s=
\n",
> > -                    strerror(errno));
> > -            fcntl_op_setlk =3D F_SETLK;
> > -            fcntl_op_getlk =3D F_GETLK;
> > -            return;
> > -        }
> >          ret =3D fcntl(fd, F_OFD_GETLK, &fl);
> > -        close(fd);
> >          if (!ret) {
> >              fcntl_op_setlk =3D F_OFD_SETLK;
> >              fcntl_op_getlk =3D F_OFD_GETLK;
> > @@ -225,9 +215,30 @@ static void qemu_probe_lock_ops(void)
> >      }
> >  }
> >
> > -bool qemu_has_ofd_lock(void)
> > +static void qemu_probe_lock_ops(const char *filename)
> > +{
> > +    int fd;
> > +    if (filename) {
> > +        fd =3D open(filename, O_RDWR);
> > +    } else {
> > +        fd =3D open(null_device, O_RDONLY);
> > +    }
> > +    if (fd < 0) {
> > +        fprintf(stderr,
> > +                "Failed to open %s for OFD lock probing: %s\n",
> > +                filename ? filename : null_device,
> > +                strerror(errno));
> > +        fcntl_op_setlk =3D F_SETLK;
> > +        fcntl_op_getlk =3D F_GETLK;
> > +        return;
> > +    }
> > +    qemu_probe_lock_ops_fd(fd);
> > +    close(fd);
> > +}
> > +
>
> This method now does a test whose results will vary based on the
> filename passed in, but it is updating a global variable to say
> whether to use OFD locks.  This is looks badly broken when using
> files across different filesystems.
Daniel, thanks for your reply.
I understand your concern, however, this global variable actually maybe
not suitable if files are across different filesystems.

>
> IMHO the raw_co_create method just needs to use a dedicated method
> to check whether fcntl locks are supposed, and all this broken
> refactoring of the OFD check should be removed.
>
OK, I will just keep the fixed part in v2.

> > +bool qemu_has_ofd_lock(const char *filename)
> >  {
> > -    qemu_probe_lock_ops();
> > +    qemu_probe_lock_ops(filename);
> >  #ifdef F_OFD_SETLK
> >      return fcntl_op_setlk =3D=3D F_OFD_SETLK;
> >  #else
> > @@ -244,7 +255,7 @@ static int qemu_lock_fcntl(int fd, int64_t start, i=
nt64_t len, int fl_type)
> >          .l_len    =3D len,
> >          .l_type   =3D fl_type,
> >      };
> > -    qemu_probe_lock_ops();
> > +    qemu_probe_lock_ops_fd(fd);
> >      do {
> >          ret =3D fcntl(fd, fcntl_op_setlk, &fl);
> >      } while (ret =3D=3D -1 && errno =3D=3D EINTR);
> > @@ -270,7 +281,7 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_=
t len, bool exclusive)
> >          .l_len    =3D len,
> >          .l_type   =3D exclusive ? F_WRLCK : F_RDLCK,
> >      };
> > -    qemu_probe_lock_ops();
> > +    qemu_probe_lock_ops_fd(fd);
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

