Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B11396DE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 17:58:08 +0100 (CET)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir32V-00065x-6E
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 11:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59166)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1ir31J-0005J8-N9
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1ir31I-0000aW-QM
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:56:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39931)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1ir31I-0000YV-HC; Mon, 13 Jan 2020 11:56:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id 20so10471969wmj.4;
 Mon, 13 Jan 2020 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xQt6zAMuvdk7sMLxIUp2969LsipIUwQWGj5Gl+6ZVfw=;
 b=J0LIKFbrcwKV8Vnvd2/vWoP9x74iyFydCwPvvL4sBidKdwwzh+hEyqThLCvWZWSI+e
 9yXgrDg7IhHS2XHnu5yzEGSxzeTuncHeuAhoKitWPWSZo9k7MTSXGPkxsILqTm4kuywC
 9hmr5uPyVGv7AVWsTD1aIGcqUrXNOZ92qy8xclw3ERPlpp6/2t5YTA5PSup20uOK9SVq
 r7KoIufPM96qCrr3wzlSNu0T361Evp7gpUAWOvsWLR9egg8PHZI0uZy0hIWn9yxPMkA3
 iswflkXRC+1WUN1ktcTHdzcKLXI4aEToIyyNe7DbH00S9XNowO0+kS15iCvCIr+Q8q88
 av2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQt6zAMuvdk7sMLxIUp2969LsipIUwQWGj5Gl+6ZVfw=;
 b=jRWBUrmzzPhlmwjYgQ8WCUi+JlZjsbS7pRpiquVgXgKCKrg9WMEGQDIAw/wxQXmGkr
 iQ15RvOTJR59FfyO9nvz92fOz4YNkOaWymWXLEt27+1+QfJEK/PS+t8snJoIMZsGtCUy
 QS58PmCPt/r/403u4cy0xrLrKTZYIQTiVS+SfnB1kEAnhowGPrbREsmseODFwCK2sCLm
 oFvA7VBLXBt3Q0+tIjg7e3WaYB4NZBeN/Zbp5+v0XQ07q8W4bNjvszRMT74yIYTmoKIY
 IQopv1yLiHZ1tXJErZoh6Xo46AH6/BcXmGGWwoKySwXYFo813rFde4VltOOKiW8yp2MV
 PAKw==
X-Gm-Message-State: APjAAAUd6C1aTqo21pV7OmwVIFTb1wUK/JLTUGFU1UAv3Q95GIgLjyXn
 jg2wsBQLTOgzHB2Mxcc1mpM=
X-Google-Smtp-Source: APXvYqxGcdgWVFqa/WsJs5WZO0FwoMpsX7hD16GxCqeojXI1Om9kM7tlG6FnGqn8hckz5O2mlPJr7w==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr21878174wmi.149.1578934611043; 
 Mon, 13 Jan 2020 08:56:51 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id b17sm16000351wrx.15.2020.01.13.08.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 08:56:49 -0800 (PST)
Date: Mon, 13 Jan 2020 16:56:48 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/4] block: Mark 'block_resize' as coroutine
Message-ID: <20200113165648.GD103384@stefanha-x1.localdomain>
References: <20200109183545.27452-1-kwolf@redhat.com>
 <20200109183545.27452-3-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WChQLJJJfbwij+9x"
Content-Disposition: inline
In-Reply-To: <20200109183545.27452-3-kwolf@redhat.com>
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
Cc: marcandre.lureau@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WChQLJJJfbwij+9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 07:35:43PM +0100, Kevin Wolf wrote:
> block_resize is safe to run in a coroutine, so use it as an example for
> the new 'coroutine': true annotation in the QAPI schema.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/block-core.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 7ff5e5edaf..1dbb2a9901 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1341,7 +1341,8 @@
>  { 'command': 'block_resize',
>    'data': { '*device': 'str',
>              '*node-name': 'str',
> -            'size': 'int' } }
> +            'size': 'int' },
> +  'coroutine': true }
> =20
>  ##
>  # @NewImageMode:

coroutine_fn is missing on
blockdev.c:void qmp_block_resize(bool has_device, const char *device,

--WChQLJJJfbwij+9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4coVAACgkQnKSrs4Gr
c8iFCQgAjepGmABXqAnPfai65+/DSXXxqYJctav1yNd/FadfvJdETCUz8VHvqnTf
GtIl6ZJhtNDp7l2Bn+SrWHlgafKcykRZUcdL060aXBHS5U0RlkaFT+N1cQ7kaPBd
O+94zs6jtTPQeWZWh7FHVJJ/UH0JmWArZMuNZnKRtE63vQJndWg2zUmihZeDgKkv
uN1KgZvY+l8t0f4yQulsGe7CR3RDBCvJ02o1RSPg3peCQq5Z0e7gcZHA9mJcMldw
RqH7zy3jkgjAceMFiCIaw0QHCUgiDmrCB/i5rkACjstn9WWz+9/kzbuxC0fX2K+g
n92Ql4F8R8iFj3/T4Way7XSccjrf/A==
=r4rf
-----END PGP SIGNATURE-----

--WChQLJJJfbwij+9x--

