Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3F1659EE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 10:11:53 +0100 (CET)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4hs8-0001Nu-IR
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 04:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4hrJ-0000cU-2r
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 04:11:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4hrI-000294-2T
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 04:11:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25387
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4hrH-00028q-Un
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 04:11:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582189859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EWpMUXTtg+cfAcdlYqXmRGGNnAtse9lf3m51CRzd5Ww=;
 b=el6WZQLG03sK1Nvo/aoKommTd084izQ6LtmJUiusgkvlUdqSt9SDnPh1fpYCclR1bqwKJ9
 xySUabtZIsVEcyK8w4zDN7myjyZFoZ2l1lV4ALmqmVt9mrDHzjVxT2eo6oAasta/bkkx7m
 +tmIh81yf2AoKKfzX5fUKypjGzWmdHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-tw5uUou-PlmFppKf3ILa-Q-1; Thu, 20 Feb 2020 04:10:55 -0500
X-MC-Unique: tw5uUou-PlmFppKf3ILa-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7180E107ACC4;
 Thu, 20 Feb 2020 09:10:54 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A2619C4F;
 Thu, 20 Feb 2020 09:10:52 +0000 (UTC)
Subject: Re: [PATCH v2 6/7] block/block-copy: reduce intersecting request lock
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20191127180840.11937-1-vsementsov@virtuozzo.com>
 <20191127180840.11937-7-vsementsov@virtuozzo.com>
 <1ae71183-4732-fbe6-62d5-58252f01d2d6@redhat.com>
 <d1f5f953-8dfe-2f27-c00a-9e0d7070a13e@virtuozzo.com>
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
Message-ID: <76ce73f2-fef9-27e6-4552-29e846fa313f@redhat.com>
Date: Thu, 20 Feb 2020 10:10:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d1f5f953-8dfe-2f27-c00a-9e0d7070a13e@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="t7U1zxQuxPWBtRnQpEvtfpd4683k5WZHB"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t7U1zxQuxPWBtRnQpEvtfpd4683k5WZHB
Content-Type: multipart/mixed; boundary="hmQlgePSpul5e8Q43gPgFCEWwoXbOLcd0"

--hmQlgePSpul5e8Q43gPgFCEWwoXbOLcd0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 20.02.20 08:21, Vladimir Sementsov-Ogievskiy wrote:
> 17.02.2020 16:38, Max Reitz wrote:
>> On 27.11.19 19:08, Vladimir Sementsov-Ogievskiy wrote:

[...]

>>> +=A0=A0=A0=A0=A0=A0=A0 if (!block_copy_wait_one(s, start, bytes)) {
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* No dirty bits and nothing to wait=
: the whole request
>>> is done */
>>
>> Wouldn=92t it make more sense to keep block_copy_wait_one() a loop (i.e.=
,
>> keep it as block_copy_wait_inflight_reqs()) that returns whether it
>> waited or not?=A0 Because I suppose if we had to wait for anything, we
>> might as well wait for everything in the range.
>=20
> No, we don't need to wait all. If some dirty bits appeared we may start
> copy them
> immediately, not waiting for others.

OK, especially considering you=92re aiming for block_copy(0, disk_size)
eventually.

Max


--hmQlgePSpul5e8Q43gPgFCEWwoXbOLcd0--

--t7U1zxQuxPWBtRnQpEvtfpd4683k5WZHB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5OTRoACgkQ9AfbAGHV
z0CTHwgAnqzetZhrJMis3HOJIvyMmrb7pm0Yp6dUrnFCuSyFHveOH6Gqnf7IPeuV
Y+YpHJS4ZxOXMiIO0cqocZlsXjgbKgtBdzBoYI+3MyTQXcvqBOojFtylhu7F2iiF
MP3sOD1krQXJ3bDGwPwwFQXmPGiwejmXy9GGO10IZKaeHF89lQsw87SDzr8mYdmN
aGqgzFvUnKw1mQ00u5fY09l1ATFrHB2h1d9aCW+m3MdXcvahN50PY7mbxgsHv489
tfReB7gP92zzg/UFX2DV6j4hy8qOxPRy+FKmkMKqgDsqQWEZ1PIe3IVJJX+UC6LF
2Z/3SfmisH5INgGHB9AO62eW0lwLzg==
=KvSY
-----END PGP SIGNATURE-----

--t7U1zxQuxPWBtRnQpEvtfpd4683k5WZHB--


