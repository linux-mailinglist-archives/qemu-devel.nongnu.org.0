Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B08B142D82
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:27:47 +0100 (CET)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itY1p-0007lA-Sn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40036)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1itXuz-0007ks-5h
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1itXuu-0006Z6-O8
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21037
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1itXuu-0006YQ-JR
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579530036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H6WdSW3GfBU+GCc0Kt/USqKMA61L/9mmybFgSJiDyIY=;
 b=aqVQ2j4wsYk/LcsntGh+vaJyvR7dSzSuWUg3871hpkwDge0VrsssCrQ7FW9lvYVCPBMUbl
 kgoR/m2eVK7dUU9UlGkC1wgvhgf4xVAVL9WcHeUBnJUoN+GrYRseFCfj03f9d1zQZUaS7c
 /W5JgnaW0Ye47YdO67RYkBiWU33fR4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-SxxUAJM8NlW_mNmr-9xulg-1; Mon, 20 Jan 2020 09:20:29 -0500
X-MC-Unique: SxxUAJM8NlW_mNmr-9xulg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD59107ACC7;
 Mon, 20 Jan 2020 14:20:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-225.ams2.redhat.com
 [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24CE47DB5D;
 Mon, 20 Jan 2020 14:20:23 +0000 (UTC)
Subject: Re: [PATCH v3 00/10] Further bitmaps improvements
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20191219100348.24827-1-vsementsov@virtuozzo.com>
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
Message-ID: <063f89d7-2517-f2e2-d8a8-8ff1b417b679@redhat.com>
Date: Mon, 20 Jan 2020 15:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191219100348.24827-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dR7EVnk67XFj15rIGhVINdjaKHMLU1Vxo"
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
--dR7EVnk67XFj15rIGhVINdjaKHMLU1Vxo
Content-Type: multipart/mixed; boundary="OrR5SGejcBzSNk3xuW190eoY6TVMm0YpH"

--OrR5SGejcBzSNk3xuW190eoY6TVMm0YpH
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19.12.19 11:03, Vladimir Sementsov-Ogievskiy wrote:
> Hi!
>=20
> The main feature here is improvement of _next_dirty_area API, which I'm
> going to use then for backup / block-copy.

Looks good to me overall, with a few minor changes.  I=92d rather leave
patches 8 and 9 to Eric, though.  (Even though I=92m not exactly the
maintainer for the rest of the patches either...)

Max


--OrR5SGejcBzSNk3xuW190eoY6TVMm0YpH--

--dR7EVnk67XFj15rIGhVINdjaKHMLU1Vxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4ltyYACgkQ9AfbAGHV
z0DAdAf7BQGT95coB+QzPhfRQcNSOF3a7UIZ7Hyc7pDvPV4+YuPpiMobp6HHbsh/
EPhH7nzAW8PuGUnmTYTSOBOlCWuvHzziXjU86Ryb9DV0kbRYnmywU6ZT+7W0AOYt
5pOULNrpSG/R5bRjRg8B3RIcrNOLmXlkzdKKCBhFxbVx0pKbpL+RxSSwr3N7gjBO
qQ4YMJ0s803JYmxCe2BdHByl4nwm0L056S5yZ33lWLTeYPMyn6v1oAg+BVIhrWG7
MUMoEp17mY5+9n56E1XgX4DyXpDxJ4/jDIFyTkv3zNgSYCk7KsdA9Y31fRR/NB1Z
y/Xoq9qQ+r4pT0ZPaYMrALmkOIGfPw==
=3h5I
-----END PGP SIGNATURE-----

--dR7EVnk67XFj15rIGhVINdjaKHMLU1Vxo--


