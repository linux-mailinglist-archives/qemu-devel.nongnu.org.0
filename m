Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2612E59F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 12:23:48 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imyZv-0003x6-JD
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 06:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1imyZ8-0003UA-C4
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:22:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1imyZ7-0006CW-7j
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:22:58 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:32885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1imyZ5-0006BQ-6l; Thu, 02 Jan 2020 06:22:55 -0500
Received: by mail-wm1-x343.google.com with SMTP id d139so4774305wmd.0;
 Thu, 02 Jan 2020 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mVX9QPG03GTNcZPTxGtontvUV2HYU3ZmRUoACxKJ2pI=;
 b=fIRyC/Pc0YcmdhTad5+9I9wKOFnw9g1xgSQA/izjzDyIUnBdmlOl3ic90r7UITjZMx
 IVUy6sjnR4fgmj+UCgNVv+XfoI3TfA5tKk9CG7q2obga+Dv1IRLawwFwohGiORRQrj5L
 WfS4200uUsP9PgfXLkRp5ODN+A8QMfmKzE8IKln+OKeISS+N4wMNxDVksgSVMNaEV4Vv
 di50oVvH05bddKjSr5mtTiVhY695Ao+y+oAX+Rb8EKsZ/bdoclnmVprp5Wl366BUg0iA
 2uKlanyE+0LigOIKNFG1rl+P6WpJTHz29M2f3smAnKdJANKnPX18BZmVTMP6UwQWfENQ
 u03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mVX9QPG03GTNcZPTxGtontvUV2HYU3ZmRUoACxKJ2pI=;
 b=IFYWkWhBcFq44VU92gRJCsBOFU+g0jtAAZJYMl1CdZzjVw6Y/3YgQy79TwgRfidz/4
 jj8heljfYFcQ47f7JuAgqor37XFYiYBppXJRrsUDBcPDTOSOaORGJb05ZGR+PLoCju5q
 8E3x4Tcs1ZX9h5L7oX5idc5tuxCLDcb0QObSKx3GlsUCCpTyPBRf0Fi+3mpWjRE5ozmX
 cQdnOKLnj65Au2RQnmbterEYuQVkiX6DjacYoZpHcm8+Hz40d8xsN37xGBIHt/Wb4B2k
 QhI7+RHLOP1WErX5ydka2BBydVnxKvLy4oNiTI7fKDT+YyNU0JqI1rLQoGmFwLTaaCFD
 WgzQ==
X-Gm-Message-State: APjAAAXSykhYqXZNKK9heAcmrwEXAlBlZJkmOAwT67liu7rLA+KIJ096
 jChzPH+VcPBkYbgPIq0GJaJb22GisnE=
X-Google-Smtp-Source: APXvYqwomBm0JOu1ZA2yMmePYx/deuqcKyw1mb0hTekTZvyeSbasGYN1gyqaEA3aK2GdH062iKOSeQ==
X-Received: by 2002:a7b:cbc8:: with SMTP id n8mr13940702wmi.35.1577964173567; 
 Thu, 02 Jan 2020 03:22:53 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id i11sm55900494wrs.10.2020.01.02.03.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 03:22:52 -0800 (PST)
Date: Thu, 2 Jan 2020 11:22:51 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 00/18] block: Allow exporting BDSs via FUSE
Message-ID: <20200102112251.GI121208@stefanha-x1.localdomain>
References: <20191219143818.1646168-1-mreitz@redhat.com>
 <20191220100846.GC1635864@stefanha-x1.localdomain>
 <a372e742-182a-ec98-d297-ed8d43e10734@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HkMjoL2LAeBLhbFV"
Content-Disposition: inline
In-Reply-To: <a372e742-182a-ec98-d297-ed8d43e10734@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HkMjoL2LAeBLhbFV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2019 at 11:30:33AM +0100, Max Reitz wrote:
> On 20.12.19 11:08, Stefan Hajnoczi wrote:
> > On Thu, Dec 19, 2019 at 03:38:00PM +0100, Max Reitz wrote:
> > Please send a follow-up patch that adds a qemu(1) -blockdev
> > 'Driver-specific options for "fuse"' documentation section.
>=20
> What exactly do you mean?  This is not a block driver, so it doesn=E2=80=
=99t
> work as part of -blockdev.  Currently, it can only be used through QMP
> (fuse-export-add/fuse-export-remove).

I don't know what I was thinking :).

Stefan

--HkMjoL2LAeBLhbFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4N0osACgkQnKSrs4Gr
c8huFgf/aRR8GvmFf4y0xfcF8oHth1gsIYccMfbfMT3JJskuGBaaN5gZSUR+H5HE
jTsoqo1H01YQpdQ1EL8AdvUMDigKwWe57b1J0UOdxP4/p2QEM7S8BzM5mFLFJL+z
Ga0BrqGacRf7YHR5GAkpZXoqDQvW5KC/y1emtrx+feNOwqFPUm/V6rbnL//Zu7MT
WuPQfc1qRDYpg60hSrXkxctNwAJkcpUR9XWUSgkIFmgn0E3HpeY9UdbieakD1uvU
un0EIKCSGhMl+cEj38RCHdXO1iTO7l6EUIx/UY+SyvbMBdomexHBe+09GbZB/sIN
rG3zQxu4easJNBM5hZ9XzDVsxZrNOQ==
=84zL
-----END PGP SIGNATURE-----

--HkMjoL2LAeBLhbFV--

