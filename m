Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47E421225A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:32:47 +0200 (CEST)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqxSP-0005ZZ-QN
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jqxQQ-0003Je-SJ
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:30:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31290
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jqxQN-0001AZ-E3
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593689438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xdTj48wOCCSQvdOMkIxAXeO3zn0KZTpuVZBy3piIOM4=;
 b=bTCJ6QMZbjqhaekYG5Kom1Q/4QxoCGF90B+muCq4KMpfm2F+k11jlQ20jJp2a/ycZ+iQRw
 byaD5TeceBhoF6z32p4zl6QvKqs78a6qNuSbTeRfSglE2crYYYIt92ISFmn7txtxdqi9Hk
 ao96CQj7hZTwKZhMpatoJciSr2Tt0KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-P0idx3HuO4Wxm0wd9gNuKg-1; Thu, 02 Jul 2020 07:30:31 -0400
X-MC-Unique: P0idx3HuO4Wxm0wd9gNuKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC1A18FF660;
 Thu,  2 Jul 2020 11:30:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-196.ams2.redhat.com
 [10.36.113.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BFD5C1D0;
 Thu,  2 Jul 2020 11:30:28 +0000 (UTC)
Subject: Re: [PATCH v9 20/34] qcow2: Add subcluster support to
 calculate_l2_meta()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1593342067.git.berto@igalia.com>
 <12ee527c0e8a80694fd249a38f106927062e3b44.1593342067.git.berto@igalia.com>
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
Message-ID: <f863b949-16e0-d89a-f672-46760ddc172a@redhat.com>
Date: Thu, 2 Jul 2020 13:30:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <12ee527c0e8a80694fd249a38f106927062e3b44.1593342067.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Yd6xTUyvZ53jQcO7GWf6YoygiWLMpyOdN"
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
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
--Yd6xTUyvZ53jQcO7GWf6YoygiWLMpyOdN
Content-Type: multipart/mixed; boundary="69Wq9Jg3hXZ3vSoF0Uy7d6GdN0yP0iXES"

--69Wq9Jg3hXZ3vSoF0Uy7d6GdN0yP0iXES
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28.06.20 13:02, Alberto Garcia wrote:
> If an image has subclusters then there are more copy-on-write
> scenarios that we need to consider. Let's say we have a write request
> from the middle of subcluster #3 until the end of the cluster:
>=20
> 1) If we are writing to a newly allocated cluster then we need
>    copy-on-write. The previous contents of subclusters #0 to #3 must
>    be copied to the new cluster. We can optimize this process by
>    skipping all leading unallocated or zero subclusters (the status of
>    those skipped subclusters will be reflected in the new L2 bitmap).
>=20
> 2) If we are overwriting an existing cluster:
>=20
>    2.1) If subcluster #3 is unallocated or has the all-zeroes bit set
>         then we need copy-on-write (on subcluster #3 only).
>=20
>    2.2) If subcluster #3 was already allocated then there is no need
>         for any copy-on-write. However we still need to update the L2
>         bitmap to reflect possible changes in the allocation status of
>         subclusters #4 to #31. Because of this, this function checks
>         if all the overwritten subclusters are already allocated and
>         in this case it returns without creating a new QCowL2Meta
>         structure.
>=20
> After all these changes l2meta_cow_start() and l2meta_cow_end()
> are not necessarily cluster-aligned anymore. We need to update the
> calculation of old_start and old_end in handle_dependencies() to
> guarantee that no two requests try to write on the same cluster.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  block/qcow2-cluster.c | 163 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 131 insertions(+), 32 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--69Wq9Jg3hXZ3vSoF0Uy7d6GdN0yP0iXES--

--Yd6xTUyvZ53jQcO7GWf6YoygiWLMpyOdN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl79xVIACgkQ9AfbAGHV
z0DSgwf+PNuM4Tl3mJzA6pCnIY8WReX1F0lg8bTVqL485E9rYen1TCTqO1oludGD
KnSmED2QUERPCHalSUF6bN3CAu3OPvr1iHVNAkNQV0mV6MYNZBi03+Iyn+4YBFCx
ccyAP+MtWsRDujAT5XE70Yr7/cqtAyjR2Vmh0rsHXKdMPH967Q+Xt7Sb4yK0SUEm
QDRB8SXBXBAgRH7UdkRD8ErvYREuTdKA9BfkPxGR1Ec1+LyoU6o8zQlx/1t4ziXR
qINGTzsAY3y3YN38I9OiUKwemNM/TSTyPRMdklI3DJtkl5UYjRv1yfwNKvNUm0Na
qT5/GjHxH0lXmvA4nIppWisxCUMHsA==
=4Dci
-----END PGP SIGNATURE-----

--Yd6xTUyvZ53jQcO7GWf6YoygiWLMpyOdN--


