Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73539E3821
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 18:38:21 +0200 (CEST)
Received: from localhost ([::1]:47500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNg7u-0007J3-CQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 12:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iNfSS-0001Dz-Kn
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iNfSP-0006Hi-BU
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:55:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iNfSP-0006Gt-7D
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 11:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571932521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ogmp402+Z+IcVX9NnkmQlLHSGtAcJg+U0yJd1c0m+iw=;
 b=bj62jRzoysntCy4GalQ+SZn1+xNSvU2XxAgQ3Naa2kGFbJHP5D87oxo5gxHoV4LQQRNh/e
 +v1AtsQmzyvK3XjQoMwqOEYNDRANx9HYSHP4lgwpv9fbfMl3PUEjAFicfHaGUhHj3edM71
 P9vS0yhZQ1c4XYbmLivz4n3HwB34fBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-Vt5hsn6kPhSf6i_jQrRx8A-1; Thu, 24 Oct 2019 11:55:11 -0400
X-MC-Unique: Vt5hsn6kPhSf6i_jQrRx8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4B0E86A079;
 Thu, 24 Oct 2019 15:12:10 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-205.ams2.redhat.com
 [10.36.117.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10E2010A33E2;
 Thu, 24 Oct 2019 15:12:03 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] block: support compressed write at generic layer
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <1571603828-185910-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1571603828-185910-2-git-send-email-andrey.shinkevich@virtuozzo.com>
 <408ef2ab-1f6c-2c9f-ad50-92269c20fb27@redhat.com>
 <eece4ca2-7c40-cae6-b15f-beed73830fd8@virtuozzo.com>
 <cc3f87c2-3ad5-da4e-4750-27a48bce1ee6@virtuozzo.com>
 <787da788-9aca-2110-a092-b63ef498a9fa@redhat.com>
 <ae5bc00f-e65e-8c33-2620-a9147e48ea78@virtuozzo.com>
 <1088f0ff-d882-083f-705c-95c08bdc486f@redhat.com>
 <cb6db9c4-0dbc-9d9a-4ec5-b436c48178a8@virtuozzo.com>
 <4fd89d2a-94aa-6f2d-ed7d-7633356e5163@redhat.com>
 <539e7d9e-0cb7-fdb7-f376-1648361ec2f3@virtuozzo.com>
 <8828d08f-79aa-f3a6-4387-f1423a8b7d70@redhat.com>
 <26cfb4ed-941a-11b0-c1cf-bf3c7e354487@virtuozzo.com>
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
Message-ID: <f2463f6b-3d61-b64e-2789-e71d7648105c@redhat.com>
Date: Thu, 24 Oct 2019 17:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <26cfb4ed-941a-11b0-c1cf-bf3c7e354487@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JIWV1lqDSdOyWxr1j8zBjZfd906fqz8zL"
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 Denis Lunev <den@virtuozzo.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JIWV1lqDSdOyWxr1j8zBjZfd906fqz8zL
Content-Type: multipart/mixed; boundary="nXwzCthMmdqfmLp2moXhqtdIpJpjKEKXp"

--nXwzCthMmdqfmLp2moXhqtdIpJpjKEKXp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24.10.19 16:07, Andrey Shinkevich wrote:
>=20
>=20
> On 24/10/2019 16:48, Max Reitz wrote:
>> On 24.10.19 14:56, Andrey Shinkevich wrote:
>>>
>>>
>>> On 24/10/2019 12:34, Max Reitz wrote:
>>>> On 22.10.19 15:53, Andrey Shinkevich wrote:
>>>>
>>>> [...]
>>>>
>>>>> If the support of COW for compressed writes is found feasible, will i=
t
>>>>> make a sense to implement? Then this series will follow.
>>>>
>>>> Hm, what exactly do you mean by support of COW for compressed writes?
>>>>
>>>
>>> I spoke in terms of the commit message with the following ID:
>>>
>>> b0b6862e5e1a1394e0ab3d5da94ba8b0da8664e2
>>>
>>> "qcow2: Fail write_compressed when overwriting data"
>>>
>>> "...qcow2_write_compressed() doesn't perform COW as it would have to do=
..."
>>>
>>> So, I suggest that we implement writing compressed data to the allocate=
d
>>> clusters rather than qcow2_alloc_compressed_cluster_offset() returns th=
e
>>> error. Particularly, when it comes to NBD server connection failure for
>>> writhing a compressed cluster, it may not be rewritten after the
>>> connection is restored.
>>> Are there any issues with that implementation idea?
>>
>> Well, the COW in that commit is meant differently, because it refers to
>> the COW that=E2=80=99s required when writing to a cluster shared by an i=
nternal
>> snapshot.
>>
>> OTOH, you could say that all compressed writes to a cluster that is
>> already allocated would need to do COW because we=E2=80=99d always have =
to fully
>> rewrite that cluster in an RMW cycle.
>>
>> I don=E2=80=99t see how letting qcow2_alloc_compressed_cluster_offset() =
use the
>> existing cluster would solve the problem, though.  You=E2=80=99d general=
ly need
>> to allocate a new cluster; or attempt to reuse the existing space in a
>> compressed cluster.
>>
>> Max
>>
>=20
> Yes, new clusters would be allocated for the compressed RMW and the=20
> existing ones would be reused if possible. It seams to be ineffective=20
> but users are supposed to know what they do.
> So, does it worth to check a feasibility of the implementation?

I don=E2=80=99t know, Vladimir said that use case wouldn=E2=80=99t be neede=
d.

I think if the option was there, people would actually use it.  But I
doubt that anyone misses it sufficiently to warrant the effort.

In addition, there=E2=80=99s still VMDK to consider, too.

Max


--nXwzCthMmdqfmLp2moXhqtdIpJpjKEKXp--

--JIWV1lqDSdOyWxr1j8zBjZfd906fqz8zL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2xv0IACgkQ9AfbAGHV
z0DAxwgAxBKm3TKBDPW2H0J4hPoV+A7yDd/Ce7NKEjyNqF9jDphm8YmfnO+y6Il2
fpRzhQUjqUZRfZOaZqAh5zsizspy+6vbezyYlYRBb5ogb4XkCRFJwm8YIFBCShaO
nuugg+hk0v60TVEiUAcpw/budtmzurvM7ovZse5yTsTTwVdv4dw/NFN1nZSsNjfY
yNY3J/Mh+fCPtjSFOIi7/8KGiLiDn2iIFqAKiWnVejTd3Lwr3plWDz7Zw4J9BnxO
Gn5K/PnHIlhpeBYszPiKKP4fuSDXmVTXuW/VVNhZR/z2DRwY0e01NEv01eD1+NPW
5UwlfLyeA7kwHOd2S7pubz4L+k22zg==
=KBnj
-----END PGP SIGNATURE-----

--JIWV1lqDSdOyWxr1j8zBjZfd906fqz8zL--


