Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83F246B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 17:50:08 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7hOh-0006Hl-T0
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 11:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k7gS7-0000A8-2D
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:49:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45683
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k7gS5-0007a9-Ap
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597675772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=++R9jk/knd+I4XwM67l3d/NnFJxabr9zfjaro2z5vi8=;
 b=gWm98fqaFdjese/xepi8wMephPbXeyB3aOpR6XYmNWPCnkfaoypgTHKlTjkZQKW8irVe5o
 TvQzt89xWvDBBoGcrRRp+yOZlx4KHpUFF6Qu/cnPrEXFT3MQvj4VjGCMwCmh7bbkL7MTc/
 8ce0omUCnxdnYewxbrLb3XKzvj4JZbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-gXY78hErMC-Rkmb4ud0AZQ-1; Mon, 17 Aug 2020 10:49:30 -0400
X-MC-Unique: gXY78hErMC-Rkmb4ud0AZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A66185E52D;
 Mon, 17 Aug 2020 14:49:29 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-146.ams2.redhat.com
 [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2244454596;
 Mon, 17 Aug 2020 14:49:27 +0000 (UTC)
Subject: Re: [RFC PATCH 13/22] block/export: Move refcount from NBDExport to
 BlockExport
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200813162935.210070-1-kwolf@redhat.com>
 <20200813162935.210070-14-kwolf@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <5ddfd71a-fcb5-cfdc-1adb-5715188b8e44@redhat.com>
Date: Mon, 17 Aug 2020 16:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813162935.210070-14-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="f4RCuWaB0ZuOmCYxxZA1eDv7gzDTV1H4o"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:13:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f4RCuWaB0ZuOmCYxxZA1eDv7gzDTV1H4o
Content-Type: multipart/mixed; boundary="zI1m8zvY6C2QjiagS2ls2Aix4Ew6qnrRJ"

--zI1m8zvY6C2QjiagS2ls2Aix4Ew6qnrRJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.08.20 18:29, Kevin Wolf wrote:
> Having a refcount makes sense for all types of block exports. It is also
> a prerequisite for keeping a list of all exports at the BlockExport
> level.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/export.h | 10 ++++++
>  include/block/nbd.h    |  2 --
>  block/export/export.c  | 14 ++++++++
>  blockdev-nbd.c         |  2 +-
>  nbd/server.c           | 72 +++++++++++++++++++-----------------------
>  5 files changed, 58 insertions(+), 42 deletions(-)

[...]

> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index 8dd127af52..a8b7b785e7 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -232,7 +232,7 @@ BlockExport *nbd_export_create(BlockExportOptions *ex=
p_args, Error **errp)
>      /* The list of named exports has a strong reference to this export n=
ow and
>       * our only way of accessing it is through nbd_export_find(), so we =
can drop
>       * the strong reference that is @exp. */
> -    nbd_export_put(exp);
> +    blk_exp_unref((BlockExport*) exp);

:/

Less so because of the asterisk, but more so because of =E2=80=9Canother
instance of a cast because we can=E2=80=99t access a BlockExport=E2=80=99s =
fields.

>   out:
>      aio_context_release(aio_context);
> diff --git a/nbd/server.c b/nbd/server.c
> index 4c594e6558..2bf30bb731 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c

[...]

> @@ -1537,7 +1536,8 @@ NBDExport *nbd_export_new(BlockDriverState *bs,
> =20
>      exp =3D g_new0(NBDExport, 1);
>      exp->common =3D (BlockExport) {
> -        .drv =3D &blk_exp_nbd,
> +        .drv        =3D &blk_exp_nbd,
> +        .refcount   =3D 1,
>      };

This makes me wish...  Ah, for patch 16, I see. :)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--zI1m8zvY6C2QjiagS2ls2Aix4Ew6qnrRJ--

--f4RCuWaB0ZuOmCYxxZA1eDv7gzDTV1H4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl86mPYACgkQ9AfbAGHV
z0BJdQgArMhQ97iyCKLT65PlIigfyeUan/HD7TdQBSBMLYAtsCE4SArl6npUcC3D
h7EPHEAKxINq+NKwFKdsfnrqSEWIJd5CUg9cxEUTCcgk0EJaC+Qlo1y3/KJyn8K5
wZQA0lWpjECdMA6tBvv+gOkWHKHpTgMiPw6IubYKNaETbQ+PypWsz82WIj8HScmj
97NmA+OlPZbN009DZxJyHg81lKXBme+ds1nUtY6WMxAzTTjzN6g8DSU/wg2YcxRp
gai2/vry82X3OBEkj4iDUBsEPUDu81hk+ZWvYPfbvZKY16qnnSn5UNuyqb6gUcgo
UDHfOJqSeCo3f4EOKj+8KEkVkqMC8A==
=/jyl
-----END PGP SIGNATURE-----

--f4RCuWaB0ZuOmCYxxZA1eDv7gzDTV1H4o--


