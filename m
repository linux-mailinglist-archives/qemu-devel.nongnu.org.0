Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBA516427A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 11:44:38 +0100 (CET)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4MqL-0001HD-49
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 05:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4MpX-0000r7-By
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4MpW-0000pR-B5
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:43:47 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24339
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4MpW-0000ot-7L
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582109025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=giTDahXNVTHpLt5+HuZEJ6WOIzNf01lGJ9+dpH266aU=;
 b=D0HhNdNCLjYvhZQOOoFebtr+by99cfxoE/+Hsy3OrlY5myknmFfIs1eHiYVoJQq3a0XBBS
 QflRSD9JBtO93b84NWAXhtATXWkHGU1RgKyuR1jstD3akIUzlFtyq5bt1hYoRdzwod+AEX
 VBYkfcip/uOJf//z13OkldOfLB/+Bx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-2TAnoBLXNv60BRRTRcv3gQ-1; Wed, 19 Feb 2020 05:43:40 -0500
X-MC-Unique: 2TAnoBLXNv60BRRTRcv3gQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D558DB61;
 Wed, 19 Feb 2020 10:43:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-152.ams2.redhat.com
 [10.36.116.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3E49076C;
 Wed, 19 Feb 2020 10:43:36 +0000 (UTC)
Subject: Re: [PATCH 0/2] block: Fix VM size field width in snapshot dump
To: qemu-block@nongnu.org
References: <20200117105859.241818-1-mreitz@redhat.com>
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
Message-ID: <8b1657df-2339-d926-d197-25b2c5a93fa0@redhat.com>
Date: Wed, 19 Feb 2020 11:43:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117105859.241818-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BcDVZX719r77O4KU7IolHfZzhypxHMut1"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BcDVZX719r77O4KU7IolHfZzhypxHMut1
Content-Type: multipart/mixed; boundary="R8LzKB91KlNxLB0BdV6oXZXHxs1HmX3P0"

--R8LzKB91KlNxLB0BdV6oXZXHxs1HmX3P0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.01.20 11:58, Max Reitz wrote:
> Hi,
>=20
> https://bugs.launchpad.net/qemu/+bug/1859989 reports that fields in
> "qemu-img snapshot -l"s output are not always separated by spaces in
> 4.1.1.  Fix that.
>=20
>=20
> Branch: https://github.com/XanClic/qemu.git lp-1859989-v1
> Branch: https://git.xanclic.moe/XanClic/qemu.git lp-1859989-v1

Thanks for the review, I renamed the test from 284 to 286, and applied
the series to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


--R8LzKB91KlNxLB0BdV6oXZXHxs1HmX3P0--

--BcDVZX719r77O4KU7IolHfZzhypxHMut1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5NEVYACgkQ9AfbAGHV
z0BQ7ggAsJ1RWze5zAhAUWsojOzvc+IS7f2Pr7R/HvsfIMU1UodfLTPm4t2UDg5C
eBgyOT/lhMzJ/knN1tnMuj+O8H1N74xv+omV0Ow3+hdUX/WbWUatKPMnzYbaIPtO
vvSBxQP1qOmKyjT33LxqfcLnNcBg9R9MTIseKzQpSEmqEsygqKnuLTRpNQdcN8kW
fiuc2CDVi7XdHSRGCVSJmUC/FdR6AZRYlAa49iT1tLxsPdB2LzQpl2i92v1n1JLY
DPMWPoO9xFQ36AfZ7Olq5Xo3UDcGdZlC3kGDHJBffXtrX23HIeUYywqE1HhViK7c
pCuAGWfVQrQ4cy+6qoIec5SJdFK96A==
=ra/d
-----END PGP SIGNATURE-----

--BcDVZX719r77O4KU7IolHfZzhypxHMut1--


