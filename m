Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5456E4EEA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Oct 2019 16:25:39 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iO0X4-0007Fj-0I
	for lists+qemu-devel@lfdr.de; Fri, 25 Oct 2019 10:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iO0Oq-000436-QV
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:17:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iO0Op-0007lE-Hl
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:17:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23580
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iO0Op-0007eV-EL
 for qemu-devel@nongnu.org; Fri, 25 Oct 2019 10:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572013015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pk6c8xkypiG2hVJNflwjpQi7n3lTc20UsiM9BsOY/70=;
 b=bci/2u4JAyYokOSWsYbZCwyCojnigsV+zvkSqZiV7cIR1Xf7aFs82zNp7c289apujdRVui
 Wddn4/s/oHCmYO2VbvYoJIbIuqZGTR2MdaQi+Y8UiZvOwTuVUHS+IHbCO5jdrc8Uivhp8k
 edrH3ueF9Tv4r3RZO10nPlRw9mpC/OY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-yRxqG3tYN8-ZMLOXmbtTVA-1; Fri, 25 Oct 2019 10:16:35 -0400
X-MC-Unique: yRxqG3tYN8-ZMLOXmbtTVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09085476;
 Fri, 25 Oct 2019 14:16:33 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-230.ams2.redhat.com
 [10.36.117.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F6660BFB;
 Fri, 25 Oct 2019 14:16:25 +0000 (UTC)
Subject: Re: [RFC 0/3] block/file-posix: Work around XFS bug
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191025095849.25283-1-mreitz@redhat.com>
 <CAFEAcA8Y8fGKC3DkdM+wkU5Oe6ACZMtvWjpry9qFgPJc5KYjdA@mail.gmail.com>
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
Message-ID: <19d50c64-c07a-3122-dea3-a5d97a2d35da@redhat.com>
Date: Fri, 25 Oct 2019 16:16:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Y8fGKC3DkdM+wkU5Oe6ACZMtvWjpry9qFgPJc5KYjdA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A9MqMLkCNwZ2tVYlaSTkYYgNzZkfUqRjm"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A9MqMLkCNwZ2tVYlaSTkYYgNzZkfUqRjm
Content-Type: multipart/mixed; boundary="uunxsj7TC4jBsZez9zW9HTVGMOKuXI8mR"

--uunxsj7TC4jBsZez9zW9HTVGMOKuXI8mR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 25.10.19 15:46, Peter Maydell wrote:
> On Fri, 25 Oct 2019 at 11:09, Max Reitz <mreitz@redhat.com> wrote:
>>
>> Hi,
>>
>> It seems to me that there is a bug in Linux=E2=80=99s XFS kernel driver,=
 as
>> I=E2=80=99ve explained here:
>>
>> https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01429.html
>>
>> In combination with our commit c8bb23cbdbe32f, this may lead to guest
>> data corruption when using qcow2 images on XFS with aio=3Dnative.
>=20
> Have we reported that upstream to the xfs folks?

I=E2=80=99ve created an RH BZ here:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1765547

So at least some XFS folks are aware of it (and I trust them to inform
the others as necessary :-)).  (Eric Sandeen has been part of the
discussion for the last couple of days already.)

Max


--uunxsj7TC4jBsZez9zW9HTVGMOKuXI8mR--

--A9MqMLkCNwZ2tVYlaSTkYYgNzZkfUqRjm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl2zA7cACgkQ9AfbAGHV
z0C2Dwf8DiH4VkH2KV7SXkurXAJ8OFM/GXFRqiHfyGCPqXNcwRZ7gygcExVXme3f
XFuXi6zHXOVdju3sEITytIbQX8b4KGq2fjB43+MOb0M5qTVFhgQwW3Si+0YZeQlJ
w9uQjK/n3inS0FYrHG1adyJ8Adt19R7reebJtPxkveG9IpASheSwAoRoK+KhpjpW
/Sx7fxyxdmXrVtjNF9acjUKzp/xz3jRuiizqldi5a63gXTSPOjhnQQgmYOGjqkg+
0Yg8+kL73BzB7aHklEyVqgKOIk7T+y8zIiUs95tIgQz75GrCZSlXu8MNUtnCTiK/
4JvaI27AODBvRMkmiIks5JEyxIBanA==
=oHJV
-----END PGP SIGNATURE-----

--A9MqMLkCNwZ2tVYlaSTkYYgNzZkfUqRjm--


