Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA9BE879D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 12:58:27 +0100 (CET)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPQ8o-0005Yb-KT
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 07:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iPQ65-0002tP-1T
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iPQ63-0005P3-GI
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:55:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28793
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iPQ63-0005O3-Ae
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572350133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=41sSEJon7ldTdapk1bRd0+AlYNZQU2B0XwfKM9luTwE=;
 b=PcMg+I7iGoyVM9buxctMs4bShffdIu6VHBVtbaawkxTEjGbAPQkI7U14Lj8oBlmmdLb/lk
 lBnZe0jp06LXnaTN7A5U5vxDHxQltolLz8i29XLV+e++S5FmFSKf3FVqACiy2iqhtHAvjY
 GgsAU0COdFFxGSwRXRSJxV1vjTHc4Ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-RbJD8j1-NQ2eNre5guPJMg-1; Tue, 29 Oct 2019 07:55:31 -0400
X-MC-Unique: RbJD8j1-NQ2eNre5guPJMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A9E1800D55;
 Tue, 29 Oct 2019 11:55:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-124.ams2.redhat.com
 [10.36.116.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4810560BF1;
 Tue, 29 Oct 2019 11:55:24 +0000 (UTC)
Subject: Re: [RFC 0/3] block/file-posix: Work around XFS bug
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20191025095849.25283-1-mreitz@redhat.com>
 <20191027123555.GN4472@stefanha-x1.localdomain>
 <20191028110408.GB3579@localhost.localdomain>
 <44565375-b051-e782-4988-c3e0b1745e37@virtuozzo.com>
 <9780d020-e573-866f-dce4-d99d73f1f5e8@redhat.com>
 <98a5da91-d018-13e1-cf5c-168d7348117b@virtuozzo.com>
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
Message-ID: <b93e2b5c-b245-e8eb-bd9e-cbde46290544@redhat.com>
Date: Tue, 29 Oct 2019 12:55:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <98a5da91-d018-13e1-cf5c-168d7348117b@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wm9jSvAwppve42Vap73ioP099imDNtR1q"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wm9jSvAwppve42Vap73ioP099imDNtR1q
Content-Type: multipart/mixed; boundary="hmIPzFrhguELz5dAB5IrxFA5LNJKEKzlz"

--hmIPzFrhguELz5dAB5IrxFA5LNJKEKzlz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29.10.19 12:48, Vladimir Sementsov-Ogievskiy wrote:
> 29.10.2019 11:50, Max Reitz wrote:
>> On 28.10.19 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>> 28.10.2019 14:04, Kevin Wolf wrote:
>>>> Am 27.10.2019 um 13:35 hat Stefan Hajnoczi geschrieben:
>>>>> On Fri, Oct 25, 2019 at 11:58:46AM +0200, Max Reitz wrote:
>>
>> [...]
>>
>>>>>> (3) Drop handle_alloc_space(), i.e. revert c8bb23cbdbe32f.
>>>>>>       To my knowledge I=E2=80=99m the only one who has provided any =
benchmarks for
>>>>>>       this commit, and even then I was a bit skeptical because it pe=
rforms
>>>>>>       well in some cases and bad in others.  I concluded that it=E2=
=80=99s
>>>>>>       probably worth it because the =E2=80=9Csome cases=E2=80=9D are=
 more likely to occur.
>>>>>>
>>>>>>       Now we have this problem of corruption here (granted due to a =
bug in
>>>>>>       the XFS driver), and another report of massively degraded
>>>>>>       performance on ppc64
>>>>>>       (https://bugzilla.redhat.com/show_bug.cgi?id=3D1745823 =E2=80=
=93 sorry, a
>>>>>>       private BZ; I hate that :-/  The report is about 40 % worse
>>>>>>       performance for an in-guest fio write benchmark.)
>>>>>>
>>>>>>       So I have to ask the question about what the justification for
>>>>>>       keeping c8bb23cbdbe32f is.  How much does performance increase=
 with
>>>>>>       it actually?  (On non-(ppc64+XFS) machines, obviously)
>>>>>>
>>>>>>       Advantages:
>>>>>>       + Trivial
>>>>>>       + No layering violations
>>>>>>       + We wouldn=E2=80=99t need to keep track of whether the kernel=
 bug has been
>>>>>>         fixed or not
>>>>>>       + Fixes the ppc64+XFS performance problem
>>>>>>
>>>>>>       Disadvantages:
>>>>>>       - Reverts cluster allocation performance to pre-c8bb23cbdbe32f
>>>>>>         levels, whatever that means
>>>>>
>>>>> My favorite because it is clean and simple, but Vladimir has a valid
>>>>> use-case for requiring this performance optimization so reverting isn=
't
>>>>> an option.
>>>>
>>>> Vladimir also said that qcow2 subclusters would probably also solve hi=
s
>>>> problem, so maybe reverting and applying the subcluster patches instea=
d
>>>> is a possible solution, too?
>>>
>>> I'm not sure about ssd case, it may need write-zero optimization anyway=
.
>>
>> What exactly do you need?  Do you actually need to write zeroes (e.g.
>> because you=E2=80=99re storing images on block devices) or would it be
>> sufficient to just drop the COW areas when bdrv_has_zero_init() and
>> bdrv_has_zero_init_truncate() are true?
>=20
> Hmm, what do you mean? We need to zero COW areas. So, original way is to
> write real zeroes, optimized way is fallocate.. What do you mean by drop?
> Mark sublusters as zeroes by metadata?

Why do you need to zero COW areas?  For normal files, any data will read
as zero if you didn=E2=80=99t write anything there.

> But still we'll have COW areas in subcluster, and we'll need to directly =
zero
> them.. And fallocate will most probably be faster on ssd ext4 case..
>=20
>>
>> I=E2=80=99m asking because Dave Chinner said
>> (https://bugzilla.redhat.com/show_bug.cgi?id=3D1765547#c7) that
>> fallocate() is always slow at least with aio=3Dnative because it needs t=
o
>> wait for all concurrent AIO writes to finish, and so it causes the AIO
>> pipeline to stall.
>>
>> (He suggested using XFS extent size hints to get the same effect as
>> write-zeroes for free, basically, but I don=E2=80=99t know whether that=
=E2=80=99s really
>> useful to us; as unallocated areas on XFS read back as zero anyway.)
>>
>>>> We already have some cases where the existing handle_alloc_space()
>>>> causes performance to actually become worse, and serialising requests =
as
>>>> a workaround isn't going to make performance any better. So even on
>>>> these grounds, keeping commit c8bb23cbdbe32f is questionable.
>>>>
>>>
>>> Can keeping handle_alloc_space under some config option be an option?
>>
>> Hm.  A config option is weird if you=E2=80=99re the only one who=E2=80=
=99s going to
>> enable it.  But other than that I don=E2=80=99t have anything against it=
.
>>
>=20
> It's just a bit easier for us to maintain config option, than out-of-tree=
 patch.
> On the other hand, it's not a real problem to maintain this one patch in =
separate.
> It may return again to the tree, when XFS bug fixed.

We=E2=80=99ll still have the problem that fallocate() must stall aio=3Dnati=
ve
requests.

Max


--hmIPzFrhguELz5dAB5IrxFA5LNJKEKzlz--

--wm9jSvAwppve42Vap73ioP099imDNtR1q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl24KKoACgkQ9AfbAGHV
z0AjVAgAtgCz1izMjIe+aXu0LYvESyNsQn3Gmm/U32tqsT+IwbFrjzUxaqBrx2RZ
7BxHZAWPxWK+ppLc0eXrOLk3XSkmX6URXUGXsaXBrZEocDtbuRwq0HdPk6LVyJXy
ardi3vK+gR52GRg5Vd7A8HzENkt1VxPqby5EInHJuk+GXxM19L18jmdNTYf0qhQf
chY1xIuF6TMadkhSm/6wZrajNzblzXh4raEZXHyol3cvNw6E79LEfLjgQpJYcxBH
dqazEI/D7lhuQ5AUCPGRmlhX1XihiGorXBazz4NYMk/KururMg0nq6EzRTYnhYOV
6hwrGx33THXzlXJs7GuIBFRJnVJ6oQ==
=aawm
-----END PGP SIGNATURE-----

--wm9jSvAwppve42Vap73ioP099imDNtR1q--


