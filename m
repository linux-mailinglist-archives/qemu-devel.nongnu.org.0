Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2764E6FF6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 11:52:56 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP2dr-0006jI-UP
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 06:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41782)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP2bm-0005P0-1b
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP2bk-0001yU-TT
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:50:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28481
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP2bk-0001yM-OC
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572259844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jSzBXlBwiHJ7IN9NaR68LlgrulxCZWqWUnh48pXtx6U=;
 b=J6Gem6RGmmwgcaWMjsGeO2NcG5DKeejwx5dVVdwqMs9oauq1HHTRKf6cfVmvWKO1m7gZKn
 xkP4q7kzhYW5Jx/yx1ebJ4GvPB+CtySwIc6Wj773RQczuxwKQlDs1RH1/eMgjOaI0hcbAi
 6qS43IIONcjbqmgyjc6rP1zQTKdJObc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-b3pez1qaM8CPOn9QaIOREg-1; Mon, 28 Oct 2019 06:50:38 -0400
X-MC-Unique: b3pez1qaM8CPOn9QaIOREg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14EFC80183E;
 Mon, 28 Oct 2019 10:50:37 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-83.ams2.redhat.com
 [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A63445D6A9;
 Mon, 28 Oct 2019 10:50:33 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] mirror: Do not dereference invalid pointers
To: qemu-block@nongnu.org
References: <20191014153931.20699-1-mreitz@redhat.com>
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
Message-ID: <b6a3407f-178f-0e70-29bb-13e17a3128fc@redhat.com>
Date: Mon, 28 Oct 2019 11:50:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014153931.20699-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q7LjPe7oGiWICUb3yfHenhNnTiAtJbZto"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q7LjPe7oGiWICUb3yfHenhNnTiAtJbZto
Content-Type: multipart/mixed; boundary="BL2njPCphUU67rxVfHBaxfsKnOT9uq1Sk"

--BL2njPCphUU67rxVfHBaxfsKnOT9uq1Sk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 14.10.19 17:39, Max Reitz wrote:
> Hi,
>=20
> v2=E2=80=99s cover letter should explain everything:
>=20
> https://lists.nongnu.org/archive/html/qemu-block/2019-09/msg01079.html
>=20
>=20
> v3:
> - Patch 2: Use input visitor as proposed by Vladimir
>=20
> git-backport-diff against v2:
>=20
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream pat=
ch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively
>=20
> 001/4:[----] [--] 'mirror: Do not dereference invalid pointers'
> 002/4:[0041] [FC] 'blkdebug: Allow taking/unsharing permissions'
> 003/4:[----] [--] 'iotests: Add @error to wait_until_completed'
> 004/4:[----] [--] 'iotests: Add test for failing mirror complete'
>=20
>=20
> Max Reitz (4):
>   mirror: Do not dereference invalid pointers
>   blkdebug: Allow taking/unsharing permissions
>   iotests: Add @error to wait_until_completed
>   iotests: Add test for failing mirror complete

I=E2=80=99ve applied patch 1 to my block branch, and I=E2=80=99ll send a fo=
r-next series
(for-5.0, I suppose?) for the rest.

Max


--BL2njPCphUU67rxVfHBaxfsKnOT9uq1Sk--

--Q7LjPe7oGiWICUb3yfHenhNnTiAtJbZto
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl22x/gACgkQ9AfbAGHV
z0DOfAgAmn4Ip5DQOFEwr+IC3KMA/e2ssFFxKmfkGB5VrA56UzabBZeEuylT5RO4
Qa8pd7TGxn/SIataBUPnlPGxuGnw5nSy9SIExuuHrtlvMHyWwxVd/qKR1BqXjzMT
7kjlUw2VcNZkiGXbJ+2C9ETeWpUxNrj3PZGBBdozXCv1PILfd07bHP7Gv0ocIKNg
jG/ILTbvILzBSkLqQHV2p3x+fOluBOZfTJ7/icx9WYwQz/zbi1s3HT5MM54lrtRm
YPMrND8ymJm8prOmNSKocwldPXfskZ1z4IAOL4eohcFqrBPWgioySAAWW8K9hSp9
hZ+tHrkddH0Pr30t6IXQfOlsnkf3aQ==
=3lUp
-----END PGP SIGNATURE-----

--Q7LjPe7oGiWICUb3yfHenhNnTiAtJbZto--


