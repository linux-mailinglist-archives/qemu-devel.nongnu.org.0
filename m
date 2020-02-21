Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1061682C8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:07:17 +0100 (CET)
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Apg-0007ha-E8
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43285)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j5AlH-00026i-7Z
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:02:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j5AlE-0003gF-Od
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:02:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59575
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j5AlE-0003fx-LB
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582300959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vfPyfR3zjNnmhR8+hPdT96FmHHcf0DyhqwervVy97ak=;
 b=aBbC+TkV+k1OLaZzLRlzcy2MQfYMhCeE54jBp4StPGT2nfwyLzxNIVlWcHwwJT0bagnNi5
 71mmv40ARY/2UE/Q3Y/XEnzM93l6KR8VUPR0hSq1jmwU4V8Wax1BXO1Pvw7SdRcVR3MNyO
 Sdyw5lqQUEavHs9c7Wf318xt5vmU1Wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-21mfnptcNdWDoSOHG19usA-1; Fri, 21 Feb 2020 11:02:35 -0500
X-MC-Unique: 21mfnptcNdWDoSOHG19usA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9D98E3318;
 Fri, 21 Feb 2020 16:02:34 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6B3919E9C;
 Fri, 21 Feb 2020 16:02:31 +0000 (UTC)
Subject: Re: [RFC PATCH v3 24/27] qcow2: Restrict qcow2_co_pwrite_zeroes() to
 full clusters only
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <7a68ff6b42f3d0c7e5118099d17934e08a6bb49f.1577014346.git.berto@igalia.com>
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
Message-ID: <1d92c42d-1afd-02b3-283b-5dcd917b90a4@redhat.com>
Date: Fri, 21 Feb 2020 17:02:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7a68ff6b42f3d0c7e5118099d17934e08a6bb49f.1577014346.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yXomjuDLJ6xOeZCCIatnvGIeF1qXHucd9"
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
--yXomjuDLJ6xOeZCCIatnvGIeF1qXHucd9
Content-Type: multipart/mixed; boundary="6t26IX4TuliLjo6ZKEE0rrVE5ZvAQS9ru"

--6t26IX4TuliLjo6ZKEE0rrVE5ZvAQS9ru
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.12.19 12:37, Alberto Garcia wrote:
> Ideally it should be possible to zero individual subclusters using
> this function, but this is currently not implemented.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--6t26IX4TuliLjo6ZKEE0rrVE5ZvAQS9ru--

--yXomjuDLJ6xOeZCCIatnvGIeF1qXHucd9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5P/xUACgkQ9AfbAGHV
z0AL8Af/V67+b52/r6WRZX1bLE58ATQVccwuHanlOo6mvZEr4bqEiAcFsUYtKMOb
C0WyFFAv03f3EdIPB6Lw2O1WyhLxy0UA1upK80vgt69kdy627B/uQvn/wznq1jW+
7f7zoPFTbRW2Ul+3QmZRwQw56xoKvPEA9eQKD1FVan9lZv4IYgqjQFK1t/xU+12D
IE9Q5FAoeAlAdOKBUJfXD6pIDAN6fwAsWFODZQmd59gV923obhqWG+xpE5xYQJx0
52w5Gbh0VLZRPIQPqJFvEZvL8ISE7GNoU+mr5ZStXteEuxcySqtzp40kABKwl4Ud
XJX8GxrJWpacTwf9Az9wLQ6P5XMkpA==
=6ow8
-----END PGP SIGNATURE-----

--yXomjuDLJ6xOeZCCIatnvGIeF1qXHucd9--


