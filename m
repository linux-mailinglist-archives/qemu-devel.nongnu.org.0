Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF157E2E19
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 12:05:11 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNZzS-0005Aw-Jr
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 06:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iNZWE-0000Jc-Cv
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:34:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iNZWD-0006fe-Bg
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:34:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41669
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iNZWD-0006fM-7w
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571909696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fN++HKZkEjtccXMqHoG5fWGcXaWRQsQqLeFin5ZPU4c=;
 b=dwGp0C/SI/3n/uovV+cxCoGfHGxRYW9aO+btILqeK0djeFCiqT9QCwN6hRynBdnFiE0UKJ
 sBcNwokLW9gNsn2gOOGmECypLzX+jT3wT97/ahQ0U6oSU572Gy8vaf5Q09KWC6xjqpEIbf
 J5Twg95n+ML5kIB3qHNSBJcAxxLfS+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-tZMRaaf9PUO36JPDvKIO1g-1; Thu, 24 Oct 2019 05:34:52 -0400
X-MC-Unique: tZMRaaf9PUO36JPDvKIO1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA1A6800D49;
 Thu, 24 Oct 2019 09:34:50 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-205.ams2.redhat.com
 [10.36.117.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90E4260C63;
 Thu, 24 Oct 2019 09:34:46 +0000 (UTC)
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
Message-ID: <4fd89d2a-94aa-6f2d-ed7d-7633356e5163@redhat.com>
Date: Thu, 24 Oct 2019 11:34:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <cb6db9c4-0dbc-9d9a-4ec5-b436c48178a8@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CG75UP5UlHQsjyDr9Q3Fp7F3FEqKNcUc7"
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 Denis Lunev <den@virtuozzo.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CG75UP5UlHQsjyDr9Q3Fp7F3FEqKNcUc7
Content-Type: multipart/mixed; boundary="DUnVuJO6Bf4azgj1oOMogLz3Lgq5Qi11N"

--DUnVuJO6Bf4azgj1oOMogLz3Lgq5Qi11N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.10.19 15:53, Andrey Shinkevich wrote:

[...]

> If the support of COW for compressed writes is found feasible, will it=20
> make a sense to implement? Then this series will follow.

Hm, what exactly do you mean by support of COW for compressed writes?

> A comment for the option would warn a user that guest writing will work=
=20
> slower for if compress selected.

I=E2=80=99m not sure whether that=E2=80=99s necessary.  As a user, I would =
assume that
enabling compression will always make something slower.

Max


--DUnVuJO6Bf4azgj1oOMogLz3Lgq5Qi11N--

--CG75UP5UlHQsjyDr9Q3Fp7F3FEqKNcUc7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2xcDUACgkQ9AfbAGHV
z0C8qAgAmOvAwvFv3kDP1RW+6veXsJUo4L4QVuHndoGc5yGALT9feW3DQpXD5nxQ
vmuvfQk6a2K0wN02tCsFLeuMZhggBVFDEPt/9PishwOt+J3dVAs+GWbb1POfuIQM
aTdLSQKL26obEkITh6cQxPUm3yubscmPXrAtZMqlA5/c32vvSOHt+CQ11AbWSaGY
ro9v4bE3azZGFl1aDtm33uVyb0fL2L725QyMOXxeVfbhFavIE+MsC48wtza8ZyU9
OB7rcyWlxF+nminHXEVtV6CTZvy2VQN+PzqFPI/yTvWiHeJKjblKfjPRHtls41FU
UXk0YcKjYq25hjL7BhUumuFV5Go8fA==
=ue9H
-----END PGP SIGNATURE-----

--CG75UP5UlHQsjyDr9Q3Fp7F3FEqKNcUc7--


