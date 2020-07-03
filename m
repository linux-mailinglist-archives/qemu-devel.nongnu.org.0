Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE53213565
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 09:47:15 +0200 (CEST)
Received: from localhost ([::1]:56946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrGPi-0005XH-BY
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 03:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jrGOc-0004xs-1T
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 03:46:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59107
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jrGOa-0003cO-CF
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 03:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593762363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oh4ix7yF7kHSw6yR2JWHivmV9mK35kvyGsl9jYMIyd4=;
 b=CVN+EQzjBoUEBVAtxgPSOM8Z2t925KJCAHqRpFu3WrsKKF6IzLUbZvR4jmE0VNjAm0QKft
 bPkGbGpo20nclO+MUVTHK6kL3le8O6sJq2EJs9dqaZQYI1BSAZ7yMuQpFa9/jXk1Uo3U0P
 tfV6m/Y+KmmeMpp08w4BFgbeCY6vBlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-FUyawSvvOxycOzaNjXHKkg-1; Fri, 03 Jul 2020 03:46:01 -0400
X-MC-Unique: FUyawSvvOxycOzaNjXHKkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F02E8107ACCA;
 Fri,  3 Jul 2020 07:45:59 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-131.ams2.redhat.com
 [10.36.113.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77D0F73FF7;
 Fri,  3 Jul 2020 07:45:58 +0000 (UTC)
Subject: Re: [PATCH v9 32/34] qcow2: Allow preallocation and backing files if
 extended_l2 is set
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1593342067.git.berto@igalia.com>
 <7bc65fa80f741d90be50ab25ede29b8e27aad677.1593342067.git.berto@igalia.com>
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
Message-ID: <f0b2cf7d-be6c-b79b-6011-3f29d4518dbf@redhat.com>
Date: Fri, 3 Jul 2020 09:45:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7bc65fa80f741d90be50ab25ede29b8e27aad677.1593342067.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7sFLjr4NcRLXSEaXLPOgLRVu5v3bz5Rxp"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:38:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Derek Su <dereksu@qnap.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7sFLjr4NcRLXSEaXLPOgLRVu5v3bz5Rxp
Content-Type: multipart/mixed; boundary="lu8KbKsEc7CaxKQilxzwwgys6UcbEyRs4"

--lu8KbKsEc7CaxKQilxzwwgys6UcbEyRs4
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28.06.20 13:02, Alberto Garcia wrote:
> Traditional qcow2 images don't allow preallocation if a backing file
> is set. This is because once a cluster is allocated there is no way to
> tell that its data should be read from the backing file.
>=20
> Extended L2 entries have individual allocation bits for each
> subcluster, and therefore it is perfectly possible to have an
> allocated cluster with all its subclusters unallocated.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/qcow2.c              | 7 ++++---
>  tests/qemu-iotests/206.out | 2 +-
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--lu8KbKsEc7CaxKQilxzwwgys6UcbEyRs4--

--7sFLjr4NcRLXSEaXLPOgLRVu5v3bz5Rxp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl7+4jUACgkQ9AfbAGHV
z0BZRwf/dazMwoaQN8VASwrtEHfjq276yhcrhTRu0iNzL3ClGOC1b1S5G9x1dV1z
DQi2/anSj9pKTIN1EKK25r2Ev2fHqpkD7L9eyfaE+XlaSZZ+hUhoQLtjlEG80TtX
/4nnshFymUn0lMf8QwQHWk8qzG6BnxMS6RXCgoyxV7yMMdvXTj8dX+fOLS7XSiBn
eXhiKUlnPQcKUM84CfWMc92WRt3yKdlAGEcAHUZWBWJXeN/8kIqiA4tJoRwHPZHd
pLbI9fy752JwPwSJS+DadGEl3Z+gMRJOS71bAUI5uwd44tghTj7qhiSGKNfdpedU
UPBCYXnSPXMlk5k5AuGpMo3vVYW/ig==
=iGvl
-----END PGP SIGNATURE-----

--7sFLjr4NcRLXSEaXLPOgLRVu5v3bz5Rxp--


