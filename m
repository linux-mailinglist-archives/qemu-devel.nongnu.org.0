Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8245E1713F3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 10:18:24 +0100 (CET)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7FJH-00057P-AR
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 04:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j7FIG-0004Rf-0n
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j7FIE-0003VZ-ND
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:17:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42043
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j7FIE-0003Sf-A1
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582795037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZgMG+w5NDTs49Uptfu6yAfX8Ue3xpcdxjbc8toZyVko=;
 b=VHMMYNiqVVy95qa7w0Za+EVt60ldnuGIgZjL3fyypAYpy04FZkj5SftCLGKNkCeiLD7a0r
 M9L2TjAMMi3a+fQFu14hqPYAON5qww4AKCLKSurvFssSjTPfmJUsLtAHJFV6FOt+btiFxN
 m2dO1aBmlmpoUxTWlXroiZCgWrOpo4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-S_FEsY8RP0G2qZXOcufd3A-1; Thu, 27 Feb 2020 04:17:13 -0500
X-MC-Unique: S_FEsY8RP0G2qZXOcufd3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72CC4477;
 Thu, 27 Feb 2020 09:17:07 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A20169079D;
 Thu, 27 Feb 2020 09:17:04 +0000 (UTC)
Subject: Re: [RFC PATCH v3 19/27] qcow2: Add subcluster support to
 expand_zero_clusters_in_l1()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <d7c9c2d54c7be83eda854db37e54dd7aabb1a1e1.1577014346.git.berto@igalia.com>
 <194970c2-07a5-41f5-bd3c-7153d6f5e1b7@redhat.com>
 <w51k149p8p0.fsf@maestria.local.igalia.com>
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
Message-ID: <8ee61115-b5e1-7861-1550-afa5928ee97b@redhat.com>
Date: Thu, 27 Feb 2020 10:17:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <w51k149p8p0.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ch0qlEUV77r80kqkiZ0HbN87A9yIQJtP5"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ch0qlEUV77r80kqkiZ0HbN87A9yIQJtP5
Content-Type: multipart/mixed; boundary="z7s23lZxEBfpfEL6EJacbdC1luc829paw"

--z7s23lZxEBfpfEL6EJacbdC1luc829paw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26.02.20 18:19, Alberto Garcia wrote:
> On Fri 21 Feb 2020 03:57:27 PM CET, Max Reitz wrote:
>> As noted in v2, this function is only called when downgrading qcow2
>> images to v2.  It kind of made sense to just call set_l2_bitmap() in
>> v2, but now with the if () conditional...  I suppose it may make more
>> sense to assert that the image does not have subclusters at the
>> beginning of the function and be done with it.
>=20
> Hmmm, you're right.
>=20
>> OTOH, well, this does make ensuring that we have subcluster =E2=80=9Csup=
port=E2=80=9D
>> everywhere a bit easier because this way all set_l2_entry() calls are
>> accompanied by an =E2=80=9Cif (subclusters) { set_l2_bitmap() }=E2=80=9D=
 part.
>=20
> Another alternative is to assert that the image does not have subcluster
> but still leave a comment after both set_l2_entry() calls explaining why
> there's no need to touch the bitmap.

Sounds good.

Max


--z7s23lZxEBfpfEL6EJacbdC1luc829paw--

--ch0qlEUV77r80kqkiZ0HbN87A9yIQJtP5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5XiQ4ACgkQ9AfbAGHV
z0A33wgAkm/kJq5HyKtn182JpnrqNImwhKNef81DIDfmjjyPVjGbRPwPga1t3ISm
Ep5Vs/26pLafphxLnHcRX1KunxVNwCFvxBreDMmGjwTV8PhkdlDy19c/NBAGlMhH
UZYMCYJIxrK9KNJGKKJDcBEPGQ3pc6Yk2XcjX1dvkuczF23eTwLnEwPrzHensBhn
+zcQ2e/YedspxYSsz7d9GB9K7fA4zo6z7YgMeExtYkMjJgGH16RlqsMYLHnrETKg
eqPasZys1v5LQ6IJ5QZxVXcnVP2aWRv97eJvpZwbuRN4hV5ZdtsKY8m8HWQYHKfN
mhTUE+H5tx2A30ovIima0ay/w7T9Bg==
=3AH4
-----END PGP SIGNATURE-----

--ch0qlEUV77r80kqkiZ0HbN87A9yIQJtP5--


