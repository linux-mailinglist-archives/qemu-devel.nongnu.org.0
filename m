Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5611680A2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 15:46:20 +0100 (CET)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j59ZL-00036N-CC
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 09:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j59YO-00023T-ML
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 09:45:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j59YN-0006DH-PD
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 09:45:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j59YN-0006Bb-J9
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 09:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582296319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eB0hH/pk/7axQVFbkGuiNj36rL0Lx1k0MCV1+R4pnJ0=;
 b=CJq+tkIjIn7D3xHojPur8mwVDmR5Gkczkflw5lfzJx0uZ+p4XQ/0ywruPA0VYdL1qF9eJI
 2kQE5bwlmXNnGy+eQqneRZM4R6+JW+WwN11znp+Z+ZrgqwMNOrjPmiSGgAXwF/ln+IELqI
 Ktkqh2MYEYBnM5wS2fPV510xDP47wIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-WyuqonWzNgSLdDNYDAO3Ew-1; Fri, 21 Feb 2020 09:45:14 -0500
X-MC-Unique: WyuqonWzNgSLdDNYDAO3Ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8684913F5;
 Fri, 21 Feb 2020 14:45:13 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E14C5C1D4;
 Fri, 21 Feb 2020 14:45:10 +0000 (UTC)
Subject: Re: [RFC PATCH v3 17/27] qcow2: Add subcluster support to
 discard_in_l2_slice()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <69a823b113145f6b2187ed6cfd4291e55c92c5f6.1577014346.git.berto@igalia.com>
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
Message-ID: <60311972-0d58-998c-56f6-56e2322804b1@redhat.com>
Date: Fri, 21 Feb 2020 15:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <69a823b113145f6b2187ed6cfd4291e55c92c5f6.1577014346.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mMCcLzKRX3sBFNydXhEVBZwSbSVx1Gk4s"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mMCcLzKRX3sBFNydXhEVBZwSbSVx1Gk4s
Content-Type: multipart/mixed; boundary="ShRQeuYpDUVqncKWGEYIF6fTcI13YXHuf"

--ShRQeuYpDUVqncKWGEYIF6fTcI13YXHuf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.12.19 12:36, Alberto Garcia wrote:
> Setting the QCOW_OFLAG_ZERO bit of the L2 entry is forbidden if an
> image has subclusters. Instead, the individual 'all zeroes' bits must
> be used.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2-cluster.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--ShRQeuYpDUVqncKWGEYIF6fTcI13YXHuf--

--mMCcLzKRX3sBFNydXhEVBZwSbSVx1Gk4s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5P7PUACgkQ9AfbAGHV
z0B5IQgAnqu5GVNg3CFGqlVUnA4jjKxb4com5tZ5UqyQaM+zGCGDR5x+E3sdp07a
VacpSn8TWN64cVmtH4cuDQ6IX6fXfbfkimeRAZ3WPaJPPdMyVlhDUIqVPMyYFLlN
tG4Um0SixJ0AWVc6WnNMaxHB+UEGoPugGbHMqwcWw0ov5SWxtPeSA6OAJGv8jmnj
4jYSJ/opmBP8gVUHQj8JxIhc1C/k+R6MoI6Tf+a5U9ubPw5oNZxQlrZ43LO3MJa9
QZG8P24KmEOjiGzHpKkEe9CYXZ7GBoaidamgwwWKsuK/iSyKIaLy7BuGknJq2gou
GyqJGKXygBgSB7WTbatHrQbMDPKr8A==
=vEat
-----END PGP SIGNATURE-----

--mMCcLzKRX3sBFNydXhEVBZwSbSVx1Gk4s--


