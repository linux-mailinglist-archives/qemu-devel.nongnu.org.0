Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA9167C49
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 12:37:45 +0100 (CET)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j56cq-00081H-Ju
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 06:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j56bd-00076u-Pp
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 06:36:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j56bb-0005z8-Nr
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 06:36:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58938
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j56bG-0005vK-H9
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 06:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582284965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M9KtHKNUR2hUbjatGhgENU7kilQpfiHGeSSP9cCMxQw=;
 b=Nq5kUbLoGup8FybygGlOlOJEQmghB27Y2lFnah+ky3Dld40v5Z4ccut9PI4DHZf8T7L5hD
 vAWx3yY6y1Zym+4H2arKPkmkPbZ7XoWQYBHa9dgdGIXn7hE/7ANUQ1etI+kkseC90s1yqo
 dD+0ZU38i6iTqkaNOtcttLLe1nZ42mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-C0mLogJEN4Ws2zErCfM6-Q-1; Fri, 21 Feb 2020 06:36:02 -0500
X-MC-Unique: C0mLogJEN4Ws2zErCfM6-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C3A0800D48;
 Fri, 21 Feb 2020 11:36:01 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C62BE8B55C;
 Fri, 21 Feb 2020 11:35:58 +0000 (UTC)
Subject: Re: [RFC PATCH v3 12/27] qcow2: Replace QCOW2_CLUSTER_* with
 QCOW2_SUBCLUSTER_*
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <ed8f4e6adb5390e31c217a6d6c21b77ef202437a.1577014346.git.berto@igalia.com>
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
Message-ID: <fffa7706-d88e-2c81-4b48-72d7e2df4bf2@redhat.com>
Date: Fri, 21 Feb 2020 12:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ed8f4e6adb5390e31c217a6d6c21b77ef202437a.1577014346.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oxcXlLf5kb8NDc42GuZEjugcVz04WO4aU"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
--oxcXlLf5kb8NDc42GuZEjugcVz04WO4aU
Content-Type: multipart/mixed; boundary="h5jnfZD4ArzlrV1dESfRrh6JSMfJLCl60"

--h5jnfZD4ArzlrV1dESfRrh6JSMfJLCl60
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.12.19 12:36, Alberto Garcia wrote:
> In order to support extended L2 entries some functions of the qcow2
> driver need to start dealing with subclusters instead of clusters.
>=20
> qcow2_get_cluster_offset() is modified to return the subcluster
> type instead of the cluster type, and all callers are updated to
> replace all values of QCow2ClusterType with their QCow2SubclusterType
> equivalents (as returned by qcow2_cluster_to_subcluster_type()).
>=20
> This patch only changes the data types, there are no semantic changes.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2-cluster.c | 19 +++++-----
>  block/qcow2.c         | 82 +++++++++++++++++++++++++------------------
>  block/qcow2.h         |  3 +-
>  3 files changed, 60 insertions(+), 44 deletions(-)

[...]

> diff --git a/block/qcow2.c b/block/qcow2.c
> index e7607d90d4..9277d680ef 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c

[...]

> @@ -2223,22 +2227,23 @@ static coroutine_fn int qcow2_co_preadv_part(Bloc=
kDriverState *bs,
>          }
> =20
>          qemu_co_mutex_lock(&s->lock);
> -        ret =3D qcow2_get_cluster_offset(bs, offset, &cur_bytes, &cluste=
r_offset);
> +        ret =3D qcow2_get_cluster_offset(bs, offset, &cur_bytes,
> +                                       &cluster_offset, &type);

I wonder whether this is kind of a bug fix here.  It=E2=80=99s entirely pos=
sible
that @ret isn=E2=80=99t set after this, and then we get to the =E2=80=9Cout=
=E2=80=9D label,
which has a check on =E2=80=9Cif (ret =3D=3D 0)=E2=80=9D.

Reviewed-by: Max Reitz <mreitz@redhat.com>


--h5jnfZD4ArzlrV1dESfRrh6JSMfJLCl60--

--oxcXlLf5kb8NDc42GuZEjugcVz04WO4aU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5PwJwACgkQ9AfbAGHV
z0Bx3QgAtJ+nOswP1aui/lujvqziQvfi8V3W8RIz2wBubUWyYaY32tUGzLaCwJVd
rJybiI6zorki18zybv6qIAectVTl/ZVdikNOnSmzCb0Gar9bx9tCBl1okUvYknWJ
gZeA00y0w6UzHMEfDjlQR012IHiFyTf0sj9TiKTDQykxsj9SO0+YpPP1prXUSc+Z
rTarAVE4bKRtCoCnevKhzW5tWqA9XQkyLWKrHAnqF5OC5Xo0VCL5rWpGVigj8SRJ
TP/lIuiy2NXPL+1YDsMTVGwc46ZXdAYbrqIGZJ8hQiZ9zhfH1EQqGEaB/aaInQ9P
ykzTe5KK/ytuyHCNYnxXymWdnzPFqA==
=H/lB
-----END PGP SIGNATURE-----

--oxcXlLf5kb8NDc42GuZEjugcVz04WO4aU--


