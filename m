Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A113ABA6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 15:00:27 +0100 (CET)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irMk5-0001XY-Rh
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 09:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1irMiN-00089P-Q5
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 08:58:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1irMiJ-0001Cq-Ux
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 08:58:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22785
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1irMiJ-0001Ce-OY
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 08:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579010315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=GlTlkorgTyk3YhJhfUokjG4272cQwDrGTCgldOUYE8Y=;
 b=CBUktCt1nLgnQ9XPmpqrerRkTEIyd/uMiyGNjs9xNCcJWOIKFEVgoSy4GK3s6SIvtsaa3f
 Mg6D76JgBdFKw/zSRFYNqYWB+Om9v4Tty7g9JTcPJ46lYmy3jT9BOYwh5jgwCvORVQ8BqP
 jE2b7r3rUcPId/vpI+6r+Jz0k4LpYLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-eYXg-7D2OcGMWG_ZOMI4oQ-1; Tue, 14 Jan 2020 08:58:33 -0500
X-MC-Unique: eYXg-7D2OcGMWG_ZOMI4oQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E20F0DBB2;
 Tue, 14 Jan 2020 13:58:32 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2795DA32;
 Tue, 14 Jan 2020 13:58:31 +0000 (UTC)
Subject: Re: [PATCH v2 3/4] qcow2: Tighten cluster_offset alignment assertions
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1578596897.git.berto@igalia.com>
 <fe47feb4fc96cf1242ba9e9431f910aef575cf16.1578596897.git.berto@igalia.com>
 <w515zhjbj9m.fsf@maestria.local.igalia.com>
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
Message-ID: <cd41db3d-24c1-daa1-1b0b-bbcaeda9f163@redhat.com>
Date: Tue, 14 Jan 2020 14:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <w515zhjbj9m.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8S0xO94DFMJhHPDuveM2KurXs56vYuJQB"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8S0xO94DFMJhHPDuveM2KurXs56vYuJQB
Content-Type: multipart/mixed; boundary="iHsP45hjzL3TOCBNdHodgG5VvALX3eqPp"

--iHsP45hjzL3TOCBNdHodgG5VvALX3eqPp
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.01.20 13:14, Alberto Garcia wrote:
> On Thu 09 Jan 2020 08:13:01 PM CET, Alberto Garcia wrote:
>> -        assert((cluster_offset & 511) =3D=3D 0);
>> +        assert(QEMU_IS_ALIGNED(cluster_offset, s->cluster_size));
>=20
> On second thoughts this patch could also use the (probably more
> efficient) offset_into_cluster() call instead.
>=20
> I can resend it if you think it's a good idea.
Either way works for me.  (I don=92t think it=92s going to make any
difference in practice, but of course, why not.)

Max


--iHsP45hjzL3TOCBNdHodgG5VvALX3eqPp--

--8S0xO94DFMJhHPDuveM2KurXs56vYuJQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4dyQUACgkQ9AfbAGHV
z0DzCQf+OtcYiujAKjXoWLgkHTvcu1aPCwRdCadi9meeYImTrDTpgrVxXYm1fPWi
PCLZXrMk27f9f/NVcebOCLhVA76zMmIXhP2iYXrlohD+epFIs3MS+HAKPX2XE9Pl
SztHYliHAHVUvXRGBty+8E541O95gy7CRnPeZZrIzWGlYUDd+I2CTUxhUzc57dn4
FwNHdiT6gfbyGz/gignX4AsnpYE50FzTkACLKKrquzPooREhJTtRnc2KCrRaS55z
QHiuE4Hqs4fbnQDRePwjB01nzX8MyGR1vI6953IPZs3QfFhie9knFZu1oNNoKQI0
z1Sybt8aIDX5VT2BNaRKahwjInEkRQ==
=sft1
-----END PGP SIGNATURE-----

--8S0xO94DFMJhHPDuveM2KurXs56vYuJQB--


