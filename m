Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E63142D23
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:20:33 +0100 (CET)
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXup-0006AD-K4
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1itXt5-0005Gy-4n
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:18:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1itXt3-0005QO-O7
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:18:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48382
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1itXt3-0005Pz-K1
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579529921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=s9WKvoWPX+XJN54oi12/XNJKljgq83NwW0TVoSXxdho=;
 b=WLS3tT9yFub2neQrRMrJbtCeCtxT8pZFwr67p/CRHBdSFttXHv1egIG6mnXAEzqcyiTsTw
 kyJ17ZsvnIhc510N82lFobr5wVwN6fp+XnD1Ez1Gd4LMyEXrDX46Oi2xZUHgk8sFobz6eg
 YfguCqY8qx2J0WytMhjaE5axrEqoq2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-xv40hnrmN0iLQSIUuxgdzQ-1; Mon, 20 Jan 2020 09:18:37 -0500
X-MC-Unique: xv40hnrmN0iLQSIUuxgdzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F891854336;
 Mon, 20 Jan 2020 14:18:36 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-225.ams2.redhat.com
 [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABD6D10842A9;
 Mon, 20 Jan 2020 14:18:29 +0000 (UTC)
Subject: Re: [PATCH v3 10/10] block/qcow2-bitmap: use
 bdrv_dirty_bitmap_next_dirty
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20191219100348.24827-1-vsementsov@virtuozzo.com>
 <20191219100348.24827-11-vsementsov@virtuozzo.com>
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
Message-ID: <fcdd14da-b273-a71c-c6f8-f7c8ac3e2bd5@redhat.com>
Date: Mon, 20 Jan 2020 15:18:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191219100348.24827-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WPgl9D0z0Ka3HZ56YbaBXWhdHyFrb7Cj1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WPgl9D0z0Ka3HZ56YbaBXWhdHyFrb7Cj1
Content-Type: multipart/mixed; boundary="u95PWm5xTXDkJrb9gaJXh8Zzv5MZocd5W"

--u95PWm5xTXDkJrb9gaJXh8Zzv5MZocd5W
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19.12.19 11:03, Vladimir Sementsov-Ogievskiy wrote:
> store_bitmap_data() loop does bdrv_set_dirty_iter() on each iteration,
> which means that we actually don't need iterator itself and we can use
> simpler bitmap API.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/qcow2-bitmap.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index c6c8ebbe89..015f5d18d2 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c

[...]

> @@ -1360,19 +1361,17 @@ static uint64_t *store_bitmap_data(BlockDriverSta=
te *bs,

(One line more context:)

>          if (end >=3D bm_size)=20
>              break;
>          }

Can we drop this now?

If so, and with that done:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> =20
> -        bdrv_set_dirty_iter(dbi, end);
> +        offset =3D end;
>      }


--u95PWm5xTXDkJrb9gaJXh8Zzv5MZocd5W--

--WPgl9D0z0Ka3HZ56YbaBXWhdHyFrb7Cj1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4ltrQACgkQ9AfbAGHV
z0CnNAf+N4OAZxX1gJXOj1kMAKwuYgp6zXNj2trPSD9yhVHKa8zRgC2/dGid8VQ4
2H/d9DOXy4Ec2STgX3V6zIdJKaXo23HvqU5L/hgbtW+nPSWGmQKX8FGjLl/kY3fb
sdYOyH0ykgas5eip5W4iNBrhLmW6yOPBHr7UvJZ2nCC0petgXk+S9Xw7vUbDGEOT
qOI0ktRatECrhSHtGHaMGwfGId1nxAiIj8EzrH31VJX42FyO8/W4KQdEomp8cf/G
JddpVk8CJV8iMu0NwAob5R+bTkVDevVZi2Ifng3cJOm02jK2LcaUG+uzmNKJIT2w
/+1XKAOB6WX0wQtq2nzOJOU5p1Hsng==
=HouG
-----END PGP SIGNATURE-----

--WPgl9D0z0Ka3HZ56YbaBXWhdHyFrb7Cj1--


