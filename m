Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB44AE48DC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 12:50:01 +0200 (CEST)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNxAO-0000Ti-NP
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 06:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iNx2h-0005Of-12
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iNx2f-00024h-Nj
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:42:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28766
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iNx2f-00023j-Cq
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 06:42:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572000120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Tv0oDsYqQM7UGWklVCIXB4bksBGimUuWYVJLzzivkTQ=;
 b=WGNZRh9VCcmzMLiHic9YRjEclZKZ1kLQ/Q7Bv37sNp900aKJtLBPQ8bLxbdphxJTn1KUUg
 Vf/fEyHEfUXihxeaK6RYVbC9GJiNxTto3Us6OYZ29Nh8rkyco9eDGqca8P5/CSCZjUgXpW
 LCSQv65SZ7Uy/fcw1mVCrvuzKFrEt9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-NrklIRQ-MJqtbfSG-lDGBw-1; Fri, 25 Oct 2019 06:41:56 -0400
X-MC-Unique: NrklIRQ-MJqtbfSG-lDGBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECD0C1005509;
 Fri, 25 Oct 2019 10:41:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-205.ams2.redhat.com
 [10.36.117.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3767B5D70E;
 Fri, 25 Oct 2019 10:41:50 +0000 (UTC)
Subject: Re: [RFC 2/3] block/file-posix: Detect XFS with CONFIG_FALLOCATE
To: Kevin Wolf <kwolf@redhat.com>
References: <20191025095849.25283-1-mreitz@redhat.com>
 <20191025095849.25283-3-mreitz@redhat.com>
 <20191025101920.GB7275@localhost.localdomain>
 <f71d7cab-a1cf-c93c-0697-4b5f77105314@redhat.com>
 <20191025103554.GC7275@localhost.localdomain>
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
Message-ID: <b2ee82c2-d30c-6953-ba9e-995435fb8ea7@redhat.com>
Date: Fri, 25 Oct 2019 12:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025103554.GC7275@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ehumn547lcmkSFyVhLLZlbQpFJ2RHiWsr"
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ehumn547lcmkSFyVhLLZlbQpFJ2RHiWsr
Content-Type: multipart/mixed; boundary="oKZFdnWMxtZTb6rc9mc7n45cJEr7wQTZ1"

--oKZFdnWMxtZTb6rc9mc7n45cJEr7wQTZ1
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 25.10.19 12:35, Kevin Wolf wrote:
> Am 25.10.2019 um 12:22 hat Max Reitz geschrieben:
>> On 25.10.19 12:19, Kevin Wolf wrote:
>>> Am 25.10.2019 um 11:58 hat Max Reitz geschrieben:
>>>> We will need this for the next patch.
>>>>
>>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>>> ---
>>>>  block/file-posix.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>>> index 695fcf740d..5cd54c8bff 100644
>>>> --- a/block/file-posix.c
>>>> +++ b/block/file-posix.c
>>>> @@ -149,7 +149,7 @@ typedef struct BDRVRawState {
>>>>      int perm_change_flags;
>>>>      BDRVReopenState *reopen_state;
>>>> =20
>>>> -#ifdef CONFIG_XFS
>>>> +#if defined(CONFIG_XFS) || defined(CONFIG_FALLOCATE)
>>>>      bool is_xfs:1;
>>>>  #endif
>>>>      bool has_discard:1;
>>>> @@ -667,7 +667,7 @@ static int raw_open_common(BlockDriverState *bs, Q=
Dict *options,
>>>>      }
>>>>  #endif
>>>> =20
>>>> -#ifdef CONFIG_XFS
>>>> +#if defined(CONFIG_XFS) || defined(CONFIG_FALLOCATE)
>>>>      if (platform_test_xfs_fd(s->fd)) {
>>>
>>> platform_test_xfs_fd() is defined in a header file from xfsprogs. I
>>> don't think you can call that without CONFIG_XFS, it would break the
>>> build.
>>
>> Aw.
>>
>> OK.  Should we then just assume is_xfs to be true (for the next patch)
>> with !defined(CONFIG_XFS) && defined(CONFIG_FALLOCATE)?
>=20
> It's a small inline function that basically just calls statfs() and then
> checks f_type.

Yes, this is where my error came from.  I asked cscope, which happily
referred me to the inline implementation and so I didn=92t bother looking
at the filename and just assumed it=92d be some code that belongs to qemu.

> I think we can have a small function to implement this in the file-posix
> code. Don't copy it from the header because of licensing (LGPL, while
> file-posix is MIT); refer to the statfs() manpage instead and write it
> yourself.

OK.

Max


--oKZFdnWMxtZTb6rc9mc7n45cJEr7wQTZ1--

--ehumn547lcmkSFyVhLLZlbQpFJ2RHiWsr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2y0WwACgkQ9AfbAGHV
z0AHjwf/VGODzTn7tHfxK25F7b4nZfHrkQf1ym6Frzl4Nwc9G4+1T8xCOduFvHIY
W38WMwC8L8xy3WDTfMFqUq2axRGrST8XIBwpU4xEHwkUl5cxMFswrMvwQPWXUvVK
5nfKIZLuvOBLDtM438w5aEL2TN4/X7zsyEQATME5F6ownPErGgJU3TAalkkLWPgO
SqbRJGUZhWAWo8euqxPqiBZztcOB6Y0noU+AD5Uk5fajSj2vNatl4Pn0RxYpGtdn
zB0gJP3+bXuiwci7BZrhRcvQbjDO1CsxFgUirO1ZvXSdtqh0whPG0m5H/5y9quWD
aHl8BEU9SMI3KSMJgICXkAYfkXbDKQ==
=+pLd
-----END PGP SIGNATURE-----

--ehumn547lcmkSFyVhLLZlbQpFJ2RHiWsr--


