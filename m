Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2105FC8D6E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 17:54:49 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFgxk-00016G-5T
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 11:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iFgw8-0000J8-Gn
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iFgw7-0005fA-Ec
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:53:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iFgw4-0005Yp-MU; Wed, 02 Oct 2019 11:53:04 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26ECC1DBC;
 Wed,  2 Oct 2019 15:53:03 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E856012C;
 Wed,  2 Oct 2019 15:52:58 +0000 (UTC)
Subject: Re: [PATCH 3/4] block/mirror: support unaligned write in active mirror
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190912151338.21225-1-vsementsov@virtuozzo.com>
 <20190912151338.21225-4-vsementsov@virtuozzo.com>
 <7dec596f-0175-951e-ba3f-2eb8b2a3d8ed@redhat.com>
 <9a857f23-73b0-44c1-dde2-ac68d45dcf93@virtuozzo.com>
 <62e03b60-b9cb-9e59-f876-df40bba96ca0@virtuozzo.com>
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
Message-ID: <3dc81329-443a-288c-0ea1-4190dfc33f5e@redhat.com>
Date: Wed, 2 Oct 2019 17:52:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <62e03b60-b9cb-9e59-f876-df40bba96ca0@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ssld2rgKjuWe8EJ5WLTAvzm6tbwAi3VkM"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 02 Oct 2019 15:53:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Denis Lunev <den@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ssld2rgKjuWe8EJ5WLTAvzm6tbwAi3VkM
Content-Type: multipart/mixed; boundary="QKhBpNNrYVG5xqy1k1an2Apw5cdJXa8nZ"

--QKhBpNNrYVG5xqy1k1an2Apw5cdJXa8nZ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02.10.19 17:06, Vladimir Sementsov-Ogievskiy wrote:
> 02.10.2019 18:03, Vladimir Sementsov-Ogievskiy wrote:
>> 02.10.2019 17:57, Max Reitz wrote:
>>> On 12.09.19 17:13, Vladimir Sementsov-Ogievskiy wrote:
>>>> Prior 9adc1cb49af8d do_sync_target_write had a bug: it reset aligned=
-up
>>>> region in the dirty bitmap, which means that we may not copy some by=
tes
>>>> and assume them copied, which actually leads to producing corrupted
>>>> target.
>>>>
>>>> So 9adc1cb49af8d forced dirty bitmap granularity to be
>>>> request_alignment for mirror-top filter, so we are not working with
>>>> unaligned requests. However forcing large alignment obviously decrea=
ses
>>>> performance of unaligned requests.
>>>>
>>>> This commit provides another solution for the problem: if unaligned
>>>> padding is already dirty, we can safely ignore it, as
>>>> 1. It's dirty, it will be copied by mirror_iteration anyway
>>>> 2. It's dirty, so skipping it now we don't increase dirtiness of the=

>>>> =C2=A0=C2=A0=C2=A0 bitmap and therefore don't damage "synchronicity"=
 of the
>>>> =C2=A0=C2=A0=C2=A0 write-blocking mirror.
>>>
>>> But that=E2=80=99s not what active mirror is for.=C2=A0 The point of =
active mirror is
>>> that it must converge because every guest write will contribute towar=
ds
>>> that goal.
>>>
>>> If you skip active mirroring for unaligned guest writes, they will no=
t
>>> contribute towards converging, but in fact lead to the opposite.
>>>
>>
>> The will not contribute only if region is already dirty. Actually, aft=
er
>> first iteration of mirroring (copying the whole disk), all following w=
rites
>> will contribute, so the whole process must converge. It is a bit simil=
ar with
>> running one mirror loop in normal mode, and then enable write-blocking=
=2E
>>
>=20
>=20
> In other words, we don't need "all guest writes contribute" to converge=
,
> "all guest writes don't create new dirty bits" is enough, as we have pa=
rallel
> mirror iteration which contiguously handles dirty bits.

Hm, in a sense.  But it does mean that guest writes will not contribute
to convergence.

And that=E2=80=99s against the current definition of write-blocking, whic=
h does
state that =E2=80=9Cwhen data is written to the source, write it (synchro=
nously)
to the target as well=E2=80=9D.

Max


--QKhBpNNrYVG5xqy1k1an2Apw5cdJXa8nZ--

--Ssld2rgKjuWe8EJ5WLTAvzm6tbwAi3VkM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2Ux9kACgkQ9AfbAGHV
z0Alagf/Zt4lkXpa2CKU8rhM8yvoHphW6Qhc97/umwEH/xTJzsZleOoSr19n6G3R
AMa6i5RnrksOzOJw3oxRnpJ2Nc4any2LP9G5nKxAhrK7ImC+Q/WVIw+6y8nvUH51
Hp6vENt38olCNEBewDCE4QPuu39KjYJGvgYtiUp/ctq87RQTBFPr6N3Ru9d6hUsm
oGjpi7mpGGiV+QjaMr4zNdNjrWX4ZefEuAvajwJjE9/Wm0zSMhhNln70eu+jZtKj
siTxjAiBZCVyub0toHR51IMMuSZFw3W+eAyr00tKi5O8U649ysSPn5/Q553zusXX
ZHz/6OBVf5Op50uFyDzvPqy1YQb3Hg==
=/dnT
-----END PGP SIGNATURE-----

--Ssld2rgKjuWe8EJ5WLTAvzm6tbwAi3VkM--

