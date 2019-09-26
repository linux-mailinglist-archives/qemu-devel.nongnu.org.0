Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD55BF0D5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 13:08:27 +0200 (CEST)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDRdK-0002ZM-5z
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 07:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDRbQ-0000Ww-Pf
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:06:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDRbP-0003bJ-9x
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:06:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDRbK-0003YX-3w; Thu, 26 Sep 2019 07:06:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5ACD0308427D;
 Thu, 26 Sep 2019 11:06:21 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4A885D6A7;
 Thu, 26 Sep 2019 11:06:19 +0000 (UTC)
Subject: Re: [PATCH 07/22] blkverify: Implement .bdrv_recurse_can_replace()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20190920152804.12875-1-mreitz@redhat.com>
 <20190920152804.12875-8-mreitz@redhat.com>
 <02057dd7-ce3a-a5ff-41c3-35a607ea6301@virtuozzo.com>
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
Message-ID: <72e09e15-4d77-a930-e309-f8930f0cb425@redhat.com>
Date: Thu, 26 Sep 2019 13:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <02057dd7-ce3a-a5ff-41c3-35a607ea6301@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FgBhfi71Go01rDHECQa0kjGrUCQ0FwhdN"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 26 Sep 2019 11:06:21 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FgBhfi71Go01rDHECQa0kjGrUCQ0FwhdN
Content-Type: multipart/mixed; boundary="CLbooNOBDEAUdWF6512FdEAikBjAvaFc3"

--CLbooNOBDEAUdWF6512FdEAikBjAvaFc3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 25.09.19 14:56, Vladimir Sementsov-Ogievskiy wrote:
> 20.09.2019 18:27, Max Reitz wrote:
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   block/blkverify.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/block/blkverify.c b/block/blkverify.c
>> index 304b0a1368..0add3ab483 100644
>> --- a/block/blkverify.c
>> +++ b/block/blkverify.c
>> @@ -282,6 +282,20 @@ static bool blkverify_recurse_is_first_non_filter=
(BlockDriverState *bs,
>>       return bdrv_recurse_is_first_non_filter(s->test_file->bs, candid=
ate);
>>   }
>>  =20
>> +static bool blkverify_recurse_can_replace(BlockDriverState *bs,
>> +                                          BlockDriverState *to_replac=
e)
>> +{
>> +    BDRVBlkverifyState *s =3D bs->opaque;
>> +
>> +    /*
>> +     * blkverify quits the whole qemu process if there is a mismatch
>> +     * between bs->file->bs and s->test_file->bs.  Therefore, we know=

>> +     * know that both must match bs and we can recurse down to either=
=2E
>> +     */
>> +    return bdrv_recurse_can_replace(bs->file->bs, to_replace) ||
>> +           bdrv_recurse_can_replace(s->test_file->bs, to_replace);
>=20
> Ok, now I understand, what bdrv_recurse_can_replace actually does:
>=20
> It searches for to_replace in bs-rooted subtree, going only through equ=
al
> children..
>=20
> So, we can replace @to_replace, by something equal to @bs, if @to_repla=
ce is
> in equal-subtree of @bs.
>=20
> I'll try to explain my misleading:
>=20
> bdrv_recurse_can_replace declaration looks like bs and to_replace may b=
e absolutely
> unrelated nodes. So, why bs should decide, can we replace the unrelated=
 to_replace
> node by something..

I thought the comment above bdrv_recurse_can_replace() made that clear:
=E2=80=9CTo be replaceable, @bs and @to_replace may either be guaranteed =
to
always show the same data (because they are only connected through
filters), or some driver may allow replacing one of its children because
it can guarantee that this child's data is not visible at all (for
example, for dissenting quorum children that have no other parents).=E2=80=
=9D

> So, it may be simpler to follow, if it was called bdrv_recurse_filtered=
_subtree, or
> bdrv_recurse_transparent_subtree..
>=20
> Still, now I understand, and don't care. It's better anyway than bdrv_r=
ecurse_is_first_non_filter
>=20
>> +}
>> +
>>   static void blkverify_refresh_filename(BlockDriverState *bs)
>>   {
>>       BDRVBlkverifyState *s =3D bs->opaque;
>> @@ -328,6 +342,7 @@ static BlockDriver bdrv_blkverify =3D {
>>  =20
>>       .is_filter                        =3D true,
>>       .bdrv_recurse_is_first_non_filter =3D blkverify_recurse_is_first=
_non_filter,
>> +    .bdrv_recurse_can_replace         =3D blkverify_recurse_can_repla=
ce,
>=20
> it will be never called, as bdrv_recurse_can_replace handles filters by=
 itself.

(As I=E2=80=99ve just replied to the previous patch, I think
bdrv_recurse_can_replace() is wrong about that.)

Max


--CLbooNOBDEAUdWF6512FdEAikBjAvaFc3--

--FgBhfi71Go01rDHECQa0kjGrUCQ0FwhdN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2Mm6oACgkQ9AfbAGHV
z0C7PAf/QKJ1oWBQKSrUfjaCDGyeyqSCtpSZv3H/rTXnPhn+rUadFJERMPsfgYeW
AYbx434hL9bkITt3/niuf5CoJLEDDcukbcKmZYWQE8K2qyWGldximv+pIg175MAa
61CySqY4SDgiIQiZlTb3gphom2fAhvBKGG4ZyNrVgrqAd3FuMcbnnMJUgTSCETU1
hjtS151CqpqpBMtDetpHgM/RiPYJr2DxSmRBnDcejYHo6D9+JERJ2ZzllHysnoM8
CpHyAFCj+fmJ9agY4Av0FIBc1+BKRUf0utVO627kz4OL2xBXZP/6ei85EVe0pKSA
3F5+jZnSo2a9CVBWTJiI+gPqpEvWoQ==
=VFNP
-----END PGP SIGNATURE-----

--FgBhfi71Go01rDHECQa0kjGrUCQ0FwhdN--

