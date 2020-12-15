Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA62DA7F5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:06:27 +0100 (CET)
Received: from localhost ([::1]:37806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp3Te-0001nz-G6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1kp3Sh-0001FW-HR; Tue, 15 Dec 2020 01:05:27 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lifeng1519@gmail.com>)
 id 1kp3Sf-0008LE-Hj; Tue, 15 Dec 2020 01:05:27 -0500
Received: by mail-pg1-x543.google.com with SMTP id f17so14514510pge.6;
 Mon, 14 Dec 2020 22:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XJzQYaegVng89Z7xJ1MFeH0cZr4UKq5izXINuoVYCp0=;
 b=h1GC4RhvegqTc6tYKJERS6n35HQVxhEzYfYdEHmI+pthvDxoFmNGYr1QCAjhhh5vra
 cC6WHFqWkyybKZEILaElWr+u4NYORE/Wvw2872XxBB0h1gEv7gE2YXEbcz0+Wl/FoFCd
 oQdHGsixV4pAJvFFEWwZeHQ4/aKnjndCq6se81rF/MXURwzkLza3aKuWDiqsbFk+YHac
 phEBM/KkF9EhuMDe9nbJinhNuokoI5qEKVPyGTxVqaa+yeRKzuC7/LeW3VcPvSrGo2tR
 1jby4/ma23eoETcyBmzKJHvys5VsMzoz2cPVy4EAz+lMuoNtDikxH1MeXNQmVb2OuKCy
 d5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XJzQYaegVng89Z7xJ1MFeH0cZr4UKq5izXINuoVYCp0=;
 b=P0CF4K1sTNsIEZdx4wKW8L1ymcnHAXGnVAsqW92l4cviTCtsnXPT/Uks26OG7uWJpe
 /abLJewSymLQe0h0QN4JTIVDhZUnwDpkVIKsgS+LTu2KWGgwxyJWQHfkQ7m77OBo72oE
 XqkpzgiPjWuGcJSmEQ5zmzTcGE4EEnW5nKAkHD/SJq5WG+SR0mjtQnZRmrMprWeqNQvV
 eqdW+ggYP7XbFLjtOkP/tQ59vJpfuS4+7aVBNJrANJhj9YBskg3QL7e/pjLQSb4ZBie3
 iTwIXUhfmmV3f41YIH+jw2dmO1XI5YYyrOzxQPEP8PY90eWpRRxVNKK/bPJtJavL5lG9
 CANQ==
X-Gm-Message-State: AOAM530OWkRbX1ZcIibUpMhzXMzJSpIrxgJRP9Iv4j0s8dl529IfqhTM
 pjiI1sxGXilN5C3JRQ8K61tOPish1/7u8+85WeU=
X-Google-Smtp-Source: ABdhPJyxhYyFsq4/oyUDk6E7cs+5YUNwMTEympWfnwPgkCvgI3Kg+G6vlT8BikWKm4+fAqI+DhJeIGygdYWIKflvV9M=
X-Received: by 2002:a62:1c88:0:b029:197:f6e4:bc2b with SMTP id
 c130-20020a621c880000b0290197f6e4bc2bmr26863192pfc.6.1608012323184; Mon, 14
 Dec 2020 22:05:23 -0800 (PST)
MIME-Version: 1.0
References: <1607618299-55092-1-git-send-email-fengli@smartx.com>
 <20201210165459.GO24855@redhat.com>
In-Reply-To: <20201210165459.GO24855@redhat.com>
From: Feng Li <lifeng1519@gmail.com>
Date: Tue, 15 Dec 2020 14:04:56 +0800
Message-ID: <CAEK8JBACbGymmgak+TDiNNjgwfMN4ELvcb-UYgFn-nh33cWK3A@mail.gmail.com>
Subject: Re: [PATCH v3] file-posix: detect the lock using the real file
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=lifeng1519@gmail.com; helo=mail-pg1-x543.google.com
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

Hi, Daniel
Thanks for your reply.
I have just ended my trip, sorry for my late response.
I will send out the v4.

Daniel P. Berrang=C3=A9 <berrange@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:55=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Fri, Dec 11, 2020 at 12:38:19AM +0800, Li Feng wrote:
> > This patch addresses this issue:
> > When accessing a volume on an NFS filesystem without supporting the fil=
e lock,
> > tools, like qemu-img, will complain "Failed to lock byte 100".
> >
> > Add a new function 'qemu_has_file_lock' to detect if the filesystem sup=
ports locks
> > or not.
> > And when the drive is auto mode, use the 'qemu_has_file_lock' to set th=
e toggle.
> >
> > Signed-off-by: Li Feng <fengli@smartx.com>
> > ---
> > v3: don't call the qemu_has_ofd_lock, use a new function instead.
> > v2: remove the refactoring.
> > ---
> >  block/file-posix.c   | 30 +++++++++++++++++-------------
> >  include/qemu/osdep.h |  1 +
> >  util/osdep.c         | 29 +++++++++++++++++++++++++++++
> >  3 files changed, 47 insertions(+), 13 deletions(-)
> >
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 806764f7e3..48f9a32de2 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -606,7 +606,7 @@ static int raw_open_common(BlockDriverState *bs, QD=
ict *options,
> >          s->use_lock =3D false;
> >          break;
> >      case ON_OFF_AUTO_AUTO:
> > -        s->use_lock =3D qemu_has_ofd_lock();
> > +        s->use_lock =3D qemu_has_file_lock(filename);
>
> This is not good - it causes us to always use locks by default, where
> as previously we only used them if OFD was available. It neds to test
> both here, except opening + closing filename to test for fnctl support
> risks releasing any locks QEMU already holds on filename if OFD is not
> supported.
Yes, check the qemu_has_ofd_lock and qemu_has_file_lock both, and
set the use_lock to false when the os supports the OFD lock, but the
filesystem doesn't support.

>
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
> > +    use_lock =3D qemu_has_file_lock(file_opts->filename);
>
> This cause QEMU to open and close filename. If another thread
> already had filename open, and OFD is not support, we've just
> lock the locks we held. We need to use 'fd' which is already
> open.
Acked.

>
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
>
>
> > +bool qemu_has_file_lock(const char *filename)
>
> IMO thisshould just accept a pre-opened 'int fd'
Acked.

>
> > +{
> > +#ifdef F_OFD_SETLK
> > +    int cmd =3D F_OFD_GETLK;
> > +#else
> > +    int cmd =3D F_GETLK;
> > +#endif
> > +        int fd;
> > +        int ret;
> > +        struct flock fl =3D {
> > +            .l_whence =3D SEEK_SET,
> > +            .l_start  =3D 0,
> > +            .l_len    =3D 0,
> > +            .l_type   =3D F_WRLCK,
> > +        };
> > +
> > +        fd =3D open(filename, O_RDWR);
> > +        if (fd < 0) {
> > +            fprintf(stderr,
> > +                    "Failed to open %s for OFD lock probing: %s\n",
> > +                    filename,
> > +                    strerror(errno));
> > +            return false;
> > +        }
> > +        ret =3D fcntl(fd, cmd, &fl);
> > +        close(fd);
> > +        return ret =3D=3D 0;
> > +}
> > +
> >  bool qemu_has_ofd_lock(void)
> >  {
> >      qemu_probe_lock_ops();
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

