Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12E16624E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 17:23:00 +0100 (CET)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4obL-00014b-Rb
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 11:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4oUA-0007OL-U1
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:15:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4oU9-000832-TD
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:15:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30930
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4oU9-00082r-OK
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582215333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=U2FwcoQKBMHTaQKpN84zEckAUwZTDF32vXFSQFtFSv8=;
 b=Qa0T3b2Inie22/Oq6RrYWDCk6rg6/ZFHpszMXUb5s2EQW9me480HjHt6A6SwOZSQUeWZLM
 +NFWDM4KTcNJgbRdeTibhV6RL62IG0zt5BxYjqXt+vf464kO+P/EZYM5YQmpUB5khYuBIn
 nIhDWkxbuJPvx3EW9RGBxTlzTQezq9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-IjmbBwCyM3KkL2Hp3kRYWA-1; Thu, 20 Feb 2020 11:15:28 -0500
X-MC-Unique: IjmbBwCyM3KkL2Hp3kRYWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A2D4800D53;
 Thu, 20 Feb 2020 16:15:23 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C52FA10001AE;
 Thu, 20 Feb 2020 16:15:19 +0000 (UTC)
Subject: Re: [RFC PATCH v3 07/27] qcow2: Add subcluster-related fields to
 BDRVQcow2State
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <b04e7e26cea16892a7f209b37d931c489ef17bd9.1577014346.git.berto@igalia.com>
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
Message-ID: <8b53e7d5-0b08-e85a-8717-b44a32be0ba3@redhat.com>
Date: Thu, 20 Feb 2020 17:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <b04e7e26cea16892a7f209b37d931c489ef17bd9.1577014346.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FmF76ah0FKn6TbEYVUolKkwyjXQZNuGMU"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FmF76ah0FKn6TbEYVUolKkwyjXQZNuGMU
Content-Type: multipart/mixed; boundary="0acINBkF85fSrEqsygn0QP0crynhO01T0"

--0acINBkF85fSrEqsygn0QP0crynhO01T0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.12.19 12:36, Alberto Garcia wrote:
> This patch adds the following new fields to BDRVQcow2State:
>=20
> - subclusters_per_cluster: Number of subclusters in a cluster
> - subcluster_size: The size of each subcluster, in bytes
> - subcluster_bits: No. of bits so 1 << subcluster_bits =3D subcluster_siz=
e
>=20
> Images without subclusters are treated as if they had exactly one,
> with subcluster_size =3D cluster_size.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2.c | 5 +++++
>  block/qcow2.h | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--0acINBkF85fSrEqsygn0QP0crynhO01T0--

--FmF76ah0FKn6TbEYVUolKkwyjXQZNuGMU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5OsJEACgkQ9AfbAGHV
z0AFrgf9FlEa84OmJ//ByGF4ijq3D4zE78Z8Vouz5qHJ6bbliNuSYyuiFNMVl/i8
dYu+/JIfT2rX2Y+BnGhPjKnDkC7ayrIq7fDG1S2DXf4cv0zkC+3C7CkI4mV7GHBs
mwWWpsdiTbSg322ts2EERWBvcwCubkRvPcMgLj04SDV6IH/OsjdfZOM+MEI1SgXM
pogt69kB+8PbuzdAy/V10fe/KlQoP7ObRb/zze+qaU6B/O7FRdq8YsDuGteff3IY
y3bNtvoRad2wGpO1XAvsb+hGpCNcUxzN/n0JUA1eWqLSfoRUvZB37qunnervO+8m
kBQjczMxJj6FeYi/CUi7JnJ55vCB6A==
=YYZb
-----END PGP SIGNATURE-----

--FmF76ah0FKn6TbEYVUolKkwyjXQZNuGMU--


