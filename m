Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977BDFCAB2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 17:23:47 +0100 (CET)
Received: from localhost ([::1]:59450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVHuM-0007Yc-De
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 11:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iVHtX-00073u-G0
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:22:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iVHtV-00068T-FH
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:22:54 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iVHtV-00067i-0V
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573748572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CxvPVD4ecKDmaSD+HIyK/+qSPSTHAvJZTUrHHaityNI=;
 b=SFT3DwXsECi2GWJtzBIwQ3t5Vq8htzlmRK9jzxN8bbyjiXzDTE/GiFtYo0tkbn+J9fduH9
 XoxDy6NwfyiN9TzUwSSCcaBBbsPijfbkXAsO1dQFk0Z7XNmN8a0xy/fCV4qA4lw3igj/VX
 5tepOPVf7fq/LzNqsmFJeipF2GimKKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-rT5vIw9EO9KP6e65P0CRzg-1; Thu, 14 Nov 2019 11:22:48 -0500
X-MC-Unique: rT5vIw9EO9KP6e65P0CRzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29F00104ED2B;
 Thu, 14 Nov 2019 16:22:47 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-160.ams2.redhat.com
 [10.36.117.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 519495D6AE;
 Thu, 14 Nov 2019 16:22:44 +0000 (UTC)
Subject: Re: [RFC PATCH v2 16/26] qcow2: Add subcluster support to
 discard_in_l2_slice()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1572125022.git.berto@igalia.com>
 <8a87fb9b6e73f06dfc1a8aa9f3c0b4c01f2c9fbd.1572125022.git.berto@igalia.com>
 <814afb3a-c534-f7f9-2366-65c77756cce6@redhat.com>
 <w51sgmqeals.fsf@maestria.local.igalia.com>
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
Message-ID: <876ac3f6-13f4-54bf-3afd-e176528fa7d6@redhat.com>
Date: Thu, 14 Nov 2019 17:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <w51sgmqeals.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ahLrnTy0HzgUKd3q498LwK7CgEdw5aeat"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ahLrnTy0HzgUKd3q498LwK7CgEdw5aeat
Content-Type: multipart/mixed; boundary="NinrSZBmx9xxYXTq2D4aQDkzaGYN5oFfl"

--NinrSZBmx9xxYXTq2D4aQDkzaGYN5oFfl
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 14.11.19 16:33, Alberto Garcia wrote:
> On Mon 04 Nov 2019 04:07:35 PM CET, Max Reitz wrote:
>>>          /* First remove L2 entries */
>>>          qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
>>> -        if (!full_discard && s->qcow_version >=3D 3) {
>>> +        if (has_subclusters(s)) {
>>> +            set_l2_entry(s, l2_slice, l2_index + i, 0);
>>> +            set_l2_bitmap(s, l2_slice, l2_index + i,
>>> +                          full_discard ? 0 : QCOW_L2_BITMAP_ALL_ZEROES=
);
>>
>> But only for !full_discard, right?
>=20
> Hence the conditional operator in my patch, maybe you didn't see it?

Oops, yep, I was just hung up on the if conditional.

Max


--NinrSZBmx9xxYXTq2D4aQDkzaGYN5oFfl--

--ahLrnTy0HzgUKd3q498LwK7CgEdw5aeat
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl3Nf1IACgkQ9AfbAGHV
z0BWGwf9HU+6hvypH1gTIZpvAueeEstLNMcNAQkA5tV4tZyBsgWynfTNJtkqN9wv
25p9NEfp43GLzyY/owUDFTi3sIHvK9T9t6EE9UBYZhG7SrlZ9CajMEo8QVf0j4+w
G7/cMFMWrzldYEa+laQDjJ2s7dnoxv4iiij20I3a7YKH9z0HT4iTtVTtWqOcugom
yOLCoUt5jZFFkGrQV5y606ZY33afcKzA7ULN3OPIQ0Ykc8nsnNmh72ebG6ovIQXG
RgUCEvSpPenzB00uUAxmFV5n2h8ZeVZFvO/lr1NSoyhlidUymwlGy34pdzH5Ydrn
KjYBe3yYd/BGaO6cGa+LYpqVNaI0/w==
=g3Wy
-----END PGP SIGNATURE-----

--ahLrnTy0HzgUKd3q498LwK7CgEdw5aeat--


