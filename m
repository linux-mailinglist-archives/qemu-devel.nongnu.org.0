Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6913A786
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 11:39:59 +0100 (CET)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irJc6-0001XF-J3
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 05:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1irJaI-0008Ka-Jg
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:38:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1irJaH-0004JY-F1
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 05:38:06 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40616)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1irJaE-0004Hh-I8; Tue, 14 Jan 2020 05:38:02 -0500
Received: by mail-wm1-x341.google.com with SMTP id t14so13082036wmi.5;
 Tue, 14 Jan 2020 02:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K7eZGYb1DbP/rF0rjBOdvrpVe5QDLYzORnenpSQjVn4=;
 b=ELXxuPhYsFX6TXgh1fnN9MSn2+d6y2apzB1LC8/KT5XOtoDcy3jHM9EAA4xHMwowV1
 VD7YRcL2txKfJhRpL3cbBt0dbPrFiBhQP2W1ug3fe03FemUS2MBVzodONGS2YXevSRt5
 9y4N3ul+eCkjupQMXclCe85Th9k75XS6QSWRoQyRBsXizbRChdNsssBTIODIwEyXFDNf
 RrwNTNwxGHD0ggLepESFNeFD0R3rDH/Ov07oN3UfFeTDMmjuSbkZUF8czkuyC7Sr2Dhc
 J/ZvhU1qsquXd3+RRkMr17/zBqHzOEhQyKrT13dBrU6vUWJM+TA/njaWbUMFQJkBQ8Zb
 wJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K7eZGYb1DbP/rF0rjBOdvrpVe5QDLYzORnenpSQjVn4=;
 b=BY3cfdutEfr+rY/SPeKzFGYUDL3detK9wXMh9xt5uSKKGcNWzaTH9/EBIFuPYpOmxE
 LXhfnM8YLpOfN4sR2STokk33vyunoj81JJJo5XUGvkgzxpe5VWoX13/0ENdZhlQpmxI8
 1x4cn9uPXfk4ciCH6mk6kg2OoPsE7zt9yY+1H60TnAaUALQlWRxiHVHMuQA2tMlkvLoO
 tfAPJeiYOndcEf6t8MEHpUgHue9dXOvA3L6p9Ev1Xv+nFZx2xBkg8NWtyHdLN8G8zDOJ
 D97bWGEiEgk8BIbnHe6nOYIatAteH1ZQQxcjbgmA22muHLRvGNwQ8zeuJcPwPB+wxK4h
 o5gA==
X-Gm-Message-State: APjAAAXST+f+q5f25WJknklB8wTkD8qQ+c3WPUOth05E5cv84fXpD2gI
 Wce2tHv5OJG5PxEBTH/hg78=
X-Google-Smtp-Source: APXvYqze7B+I1MSKQK4CduG3aMbk/XZdFDfavmapr1CSlL4s5vDlldmEVZP2exHjsA/1se++vETsGw==
X-Received: by 2002:a1c:c919:: with SMTP id f25mr25716970wmb.49.1578998281253; 
 Tue, 14 Jan 2020 02:38:01 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id i16sm18963574wmb.36.2020.01.14.02.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 02:38:00 -0800 (PST)
Date: Tue, 14 Jan 2020 10:37:59 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v3 08/15] block/file-posix.c: extend to use io_uring
Message-ID: <20200114103759.GB118882@stefanha-x1.localdomain>
References: <20191218163228.1613099-1-stefanha@redhat.com>
 <20191218163228.1613099-9-stefanha@redhat.com>
 <20200113114927.zbse5mlua5mq4hct@steredhat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline
In-Reply-To: <20200113114927.zbse5mlua5mq4hct@steredhat>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, qemu-block@nongnu.org,
 oleksandr@redhat.com, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 12:49:27PM +0100, Stefano Garzarella wrote:
> On Wed, Dec 18, 2019 at 04:32:21PM +0000, Stefan Hajnoczi wrote:
> > @@ -503,9 +504,11 @@ static int raw_open_common(BlockDriverState *bs, Q=
Dict *options,
> >          goto fail;
> >      }
> > =20
> > -    aio_default =3D (bdrv_flags & BDRV_O_NATIVE_AIO)
> > -                  ? BLOCKDEV_AIO_OPTIONS_NATIVE
> > -                  : BLOCKDEV_AIO_OPTIONS_THREADS;
> > +    if (bdrv_flags & BDRV_O_NATIVE_AIO) {
> > +        aio_default =3D BLOCKDEV_AIO_OPTIONS_NATIVE;
> > +    } else {
> > +        aio_default =3D BLOCKDEV_AIO_OPTIONS_THREADS;
> > +    }
>=20
> This is only a cosmetic change?
=2E..
> > @@ -578,7 +585,7 @@ static int raw_open_common(BlockDriverState *bs, QD=
ict *options,
> >      s->shared_perm =3D BLK_PERM_ALL;
> > =20
> >  #ifdef CONFIG_LINUX_AIO
> > -     /* Currently Linux does AIO only for files opened with O_DIRECT */
> > +    /* Currently Linux does AIO only for files opened with O_DIRECT */
>=20
> Also this is a not related fix, if you respin maybe we should split in a
> new patch or say something in the commit message.

Thanks, I'll remove whitespace changes and unrelated reformatting from
this patch.

> > @@ -1877,21 +1900,25 @@ static int coroutine_fn raw_co_prw(BlockDriverS=
tate *bs, uint64_t offset,
> >          return -EIO;
> > =20
> >      /*
> > -     * Check if the underlying device requires requests to be aligned,
> > -     * and if the request we are trying to submit is aligned or not.
> > -     * If this is the case tell the low-level driver that it needs
> > -     * to copy the buffer.
> > +     * When using O_DIRECT, the request must be aligned to be able to =
use
> > +     * either libaio or io_uring interface. If not fail back to regula=
r thread
> > +     * pool read/write code which emulates this for us if we
> > +     * set QEMU_AIO_MISALIGNED.
> >       */
> > -    if (s->needs_alignment) {
> > -        if (!bdrv_qiov_is_aligned(bs, qiov)) {
> > -            type |=3D QEMU_AIO_MISALIGNED;
> > +    if (s->needs_alignment && !bdrv_qiov_is_aligned(bs, qiov)) {
> > +        type |=3D QEMU_AIO_MISALIGNED;
> > +#ifdef CONFIG_LINUX_IO_URING
> > +    } else if (s->use_linux_io_uring) {
> > +        LuringState *aio =3D aio_get_linux_io_uring(bdrv_get_aio_conte=
xt(bs));
> > +        assert(qiov->size =3D=3D bytes);
> > +        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
> > +#endif
> >  #ifdef CONFIG_LINUX_AIO
> > -        } else if (s->use_linux_aio) {
> > -            LinuxAioState *aio =3D aio_get_linux_aio(bdrv_get_aio_cont=
ext(bs));
> > -            assert(qiov->size =3D=3D bytes);
> > -            return laio_co_submit(bs, aio, s->fd, offset, qiov, type);
> > +    } else if (s->use_linux_aio) {
>=20
> This code block was executed if "s->needs_alignment" was true, now we don=
't
> check it. Could this be a problem?

=46rom raw_open_common():

  /* Currently Linux does AIO only for files opened with O_DIRECT */
  if (s->use_linux_aio) {
      if (!(s->open_flags & O_DIRECT)) {
          error_setg(errp, "aio=3Dnative was specified, but it requires "
                           "cache.direct=3Don, which was not specified.");
          ret =3D -EINVAL;
          goto fail;

There is no change in behavior since use_linux_aio is only true when
needs_alignment is set.

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4dmgcACgkQnKSrs4Gr
c8gXSggAoUxMKWDgqKOjjZQKHusqCmdqQ8vRQWhrQ1WvPiRCM4nHkNjiPo4atnqy
tpCTIbFYWMCqIZ13aC+vDyARBl9t15VLuz2KjOS1sfxHhjf0jViYwaHsOwg0gkpa
LTBydJKNWzcSVoo2fmn/BKZUtY5c1lqeNYEWR53HMI/+6GzTU9DTahSgCJ9wwalO
JmV7tJPfeb+9FdH8yow118kkW63BeKLvVx6/7x+tHiqAmz44Rtoi5LwDrRPFZNa6
7rSRChKwaf+01/e6pUDi/P/pm37+rGNf0z0sYjahiZ2p7+8zNxaS6u2rmYzmMOhV
sWW34Cm8OCme84bNVmJxMtH1meaAbw==
=PXwY
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--

