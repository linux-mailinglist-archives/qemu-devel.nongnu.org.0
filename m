Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763082AF574
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:50:42 +0100 (CET)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsOP-00044Z-9X
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcsMg-00039t-93; Wed, 11 Nov 2020 10:48:54 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kcsMc-0005tr-R2; Wed, 11 Nov 2020 10:48:53 -0500
Received: by mail-wr1-x443.google.com with SMTP id j7so2996653wrp.3;
 Wed, 11 Nov 2020 07:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G3i7VJGyQrRd7HUezZpIMEgCbrufnwkrKRIW8AV5zM0=;
 b=lD/uIQttCVED6KhhfMBIpaqblJyIHyDQ9VlWn13HUYoY6auLmkAY1aAyK6ym5fVpVw
 H98bGhCOmA5ILH6/t6wgfCR6Gw6I6wxfdLdYab8bru6gJdLMA3w2Biud+MfOvtitSQKB
 p+tbeS+B4eObNKxgz8pyvf+/4UfcQTIbIPBYQUxLQmuvzO3RZkJZRwDFDjb1upMXlICv
 m3mvgFZrw8C8zArrCP4e8nAvTwAHdGwDWsOx7qJjklzHStugldoEBK63bRCylTiIm/vb
 pYrcm7ictU67krkfFeYMVs/2ksxsSx2EklAiIvSwVzSXVtnN1pY1XYtwTQHNjO8X3kZc
 817g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G3i7VJGyQrRd7HUezZpIMEgCbrufnwkrKRIW8AV5zM0=;
 b=eh9LAtNUUbReLs8Rx4KT8EJ7oUUw3D/k0hMdslwMYgtNFxByJUcXrQf5DYb5TTc/28
 tZ8sDqA/rBkD/g958ADti9+WyDAiNrjzr+3cS1TEeJYxsou9MWoUfhyPi5CLtcUgf3PL
 Upn8uy/wgg6kpg6ZgqDqXNes2fcM6+AGD6XsaZMsQvIofIU9YBGXHZmxVjwaJ4zrOA39
 1UXxYUUMase5xXaoMDukaAiA+Kgh7L+VmpJxZd0oJjeH73/FMz3PlgDEGKPtllIbtLGd
 VyYMQiA6jZx5f9WWQZ6J5NzgeV9Je2woYBwHx/Q8Aq5LBG0XzWEYEN7XP8AtZi7C9d+2
 vQgQ==
X-Gm-Message-State: AOAM531NdNoVdKk0xpEc/B3Hpuo287HRp3xjs0ciPt8rRIaue59xCx5f
 2+mY1+1PZOSGaXa2xvptnFc=
X-Google-Smtp-Source: ABdhPJw+f4GIqwCbLRbqm6Woc1vTwn07M8zdrKXI65L4oIXWokg+2nql8o7eiAMlYYTqVCsfqyyo7g==
X-Received: by 2002:adf:dc4c:: with SMTP id m12mr31177434wrj.177.1605109728720; 
 Wed, 11 Nov 2020 07:48:48 -0800 (PST)
Received: from localhost (85.9.90.146.dyn.plus.net. [146.90.9.85])
 by smtp.gmail.com with ESMTPSA id w1sm2838515wro.44.2020.11.11.07.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 07:48:47 -0800 (PST)
Date: Wed, 11 Nov 2020 15:48:46 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 v2 2/4] meson: Only build vhost-user when system
 or tools is enabled
Message-ID: <20201111154846.GA1398376@stefanha-x1.localdomain>
References: <20201111120912.3245574-1-philmd@redhat.com>
 <20201111120912.3245574-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20201111120912.3245574-3-philmd@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 01:09:10PM +0100, Philippe Mathieu-Daud=E9 wrote:
> It does not make sense to select vhost-user features
> without system-mode or tools. Return an error when
> this configuration is selected. Example:
>=20
>   $ ../configure --disable-tools --disable-system --enable-vhost-user-blk=
-server
>=20
>   ../meson.build:755:4: ERROR: Problem encountered: vhost-user does not m=
ake sense without system or tools support enabled
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meson.build b/meson.build
> index 4b789f18c17..4fc58eb2c3d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -751,6 +751,10 @@
> =20
>  has_statx =3D cc.links(statx_test)
> =20
> +if 'CONFIG_VHOST_USER' in config_host and not (have_system or have_tools)
> +    error('vhost-user does not make sense without system or tools suppor=
t enabled')
> +endif

Now the following fails on Linux hosts:

  $ ./configure --disable-tools --disable-system
  ../meson.build:755:4: ERROR: Problem encountered: vhost-user does not mak=
e sense without system or tools support enabled

Previously it would succeed and make would build qemu-user binaries,
documentation, trace-events-all, etc so this looks like a regression.

In addition, adding this error is inconsistent with all the other
=2E/configure options which do not check whether the build target that
uses them has been disabled. We'd need to implement the same check for
every option to make ./configure consistent. For example, if SPICE is
enabled but --disable-system is given then there should be an error
saying it enabling SPICE does not make sense, etc.

Stefan

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+sB94ACgkQnKSrs4Gr
c8giqAgAu4JYdfBSv1WK9XBD9uR8chA38b7EyyamKOwxLmjZ3wUNmQm9oGjWnk8Y
k5C8AQoJy5kWEO4NlpDrbVhvkhkIpwD6CYlkdIXbTc0RtmGY86dhv02QDTc5Wri5
HrnW6+387pm6yESwcomUifiJmk1IPkVHoNIjsANDJTULNTgcM7l179QbD+/Tjttd
ANbTcXfiowTsaUS3DAtG0LZGCdxp3LEuE86Nby2WoYL4EVmq7k2igzhxSj4ZZFuE
T+nRvm75sY5R1+LGXdMboPBPiCaXcMiqe9RWLIvDbB1iHmgdUAbI/3FvZ5UcLawR
REQ1XyLV4XjxYwpA+ofdxJpE3U+/tw==
=0bpm
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

