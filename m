Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F2108DE4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 13:31:53 +0100 (CET)
Received: from localhost ([::1]:43016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZDWu-00016g-27
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 07:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iZDNC-00007E-Al
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:21:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iZDNA-0000bt-FQ
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:21:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iZDN8-0000aL-Mc
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574684502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=m2bKZgh21qPmLIeEXnnceEm5+4m2Fui7uXCrCcuZj0k=;
 b=V3i1izOoxucT9chEyhQmFqpvVf75TEhkX5NXtDLg4LhUfvOTHnqL/NcNEUuXFLKAtqwC+s
 hUZpBKGldZyEkaJ5M0gEPAG9MrHpYOru3g+gysuFQnSeVy5yoAKC+DFG5liO3eUQkIUwaE
 7bsSpy6F3OcDDqcQiTNPOjihdS4AU2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-xWAh3EatPFyirj6hiSB_OQ-1; Mon, 25 Nov 2019 07:21:40 -0500
X-MC-Unique: xWAh3EatPFyirj6hiSB_OQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70EFD801E61;
 Mon, 25 Nov 2019 12:21:39 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15CE35C1D4;
 Mon, 25 Nov 2019 12:21:33 +0000 (UTC)
Subject: Re: [PATCH for-4.2? v3 0/8] block: Fix resize (extending) of short
 overlays
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
References: <20191122160511.8377-1-kwolf@redhat.com>
 <CAFEAcA_JU9GfNYDuD2K0MKmAD7GZ7vBUHsXU+WS-6mvPCvf8ig@mail.gmail.com>
 <713adac7-b997-6723-6b07-f527d0b804ac@redhat.com>
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
Message-ID: <0b865e2b-2318-2d14-2674-d33f84e05f65@redhat.com>
Date: Mon, 25 Nov 2019 13:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <713adac7-b997-6723-6b07-f527d0b804ac@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sXF6L5wLfezWlathVnFjFO0K1haYCzys0"
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
Cc: Qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sXF6L5wLfezWlathVnFjFO0K1haYCzys0
Content-Type: multipart/mixed; boundary="VGJHFxBOlfZQj0a7WJKWH5O3F4PrMNekc"

--VGJHFxBOlfZQj0a7WJKWH5O3F4PrMNekc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.11.19 17:41, Eric Blake wrote:
> On 11/22/19 10:17 AM, Peter Maydell wrote:

[...]

>> Eyeballing of the diffstat plus the fact we're on v4 of
>> the patchset already makes me a little uneasy about
>> putting it into rc3, but if the bug we're fixing matters
>> enough we can do it.
>=20
> In terms of diffstat, the v3 series was much smaller in impact.=C2=A0 Bot=
h
> versions add robustness, where the difference between v3 and v4 is
> whether we introduce a speed penalty on an unlikely setup (v3) or reject
> any operation where it would require a speed penalty to avoid data
> problems (v4).

I=E2=80=99d just like to add that this isn=E2=80=99t just about a speed pen=
alty, but
about the fact that the monitor is blocked while the operation is
running.  So the speed penalty has more impact than just some background
operation being slow.

Max


--VGJHFxBOlfZQj0a7WJKWH5O3F4PrMNekc--

--sXF6L5wLfezWlathVnFjFO0K1haYCzys0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl3bx0wACgkQ9AfbAGHV
z0ATJgf+Oac7gxHyGxoBUdcpNkD/kSUy0ztl8S/9Q+p3QSBGeX/DTDDTkYI45WP6
JqaHkm1nhjJC8OYPyqL3sOgKP9WqOGZcTLgTekz2HtGJNJmCYbaOlrp7Z3ty3Zto
uisZob14pjuLyFl5gwAgXTKIN17zrCSys/ZbvdKhR2gEEcSyqzB0oZ0cQXp/Fz1Z
NDkl2Y2NDL/8EutdmJw6oyPP8ylEsTnxEeDMzXa0GzVjQNSV3shPizC6AokZ47Ug
Lucel/HQD0HwAjkgz8S/C9dfMo+Bcxfn+XLJsu2RlfddVwWaulSuznp6I7w9V0Sc
nsKd4j68J45eQtDkNBE/mWHkCfGBHA==
=IBQK
-----END PGP SIGNATURE-----

--sXF6L5wLfezWlathVnFjFO0K1haYCzys0--


