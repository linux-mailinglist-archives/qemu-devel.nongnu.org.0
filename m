Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC4F181D91
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:17:25 +0100 (CET)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC42u-0001fY-Rt
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jC41k-0000l6-Kg
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jC41j-000556-5r
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:16:12 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43385
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jC41i-00054v-Eq
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583943369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ra4Qjq76Q5WVl1RY8HtSUrovxZWRO+7RMOSlbD42eP4=;
 b=bAWVF+Rpy1YGjsk0eUr44PPBuTOVZXkqkNSvxiK3KG9m9kX4EwMV15aa9rtsEx4ZoQm1s9
 XcH/SrobxVhpsvZokPV4WwABZ1fB6I+TcvWjojLx5I43yQUNrHS5EYPU/cNEkJrXOYSf3F
 WPhgn112y984Xwd5hQznHc6B3DQGOEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-kc3V_pU_NoODSioYU_LzGg-1; Wed, 11 Mar 2020 12:16:05 -0400
X-MC-Unique: kc3V_pU_NoODSioYU_LzGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69A58800D4E;
 Wed, 11 Mar 2020 16:16:04 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-216.ams2.redhat.com
 [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 302BE512F1;
 Wed, 11 Mar 2020 16:15:57 +0000 (UTC)
Subject: Re: [PATCH v5 2/5] qcow2: introduce compression type feature
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200304133538.9159-1-dplotnikov@virtuozzo.com>
 <20200304133538.9159-3-dplotnikov@virtuozzo.com>
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
Message-ID: <cc048132-b12c-74d6-381b-008705d6af3d@redhat.com>
Date: Wed, 11 Mar 2020 17:15:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304133538.9159-3-dplotnikov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XG8BWdvxsc541aHT6BDuujk9Lrqa1RFpo"
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-block@nongnu.org, armbru@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XG8BWdvxsc541aHT6BDuujk9Lrqa1RFpo
Content-Type: multipart/mixed; boundary="iDfekjLPUP7UM2wAJ0dCSlXSQo2xVSYep"

--iDfekjLPUP7UM2wAJ0dCSlXSQo2xVSYep
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04.03.20 14:35, Denis Plotnikov wrote:
> The patch adds some preparation parts for incompatible compression type
> feature to qcow2 allowing the use different compression methods for
> image clusters (de)compressing.
>=20
> It is implied that the compression type is set on the image creation and
> can be changed only later by image conversion, thus compression type
> defines the only compression algorithm used for the image, and thus,
> for all image clusters.
>=20
> The goal of the feature is to add support of other compression methods
> to qcow2. For example, ZSTD which is more effective on compression than Z=
LIB.
>=20
> The default compression is ZLIB. Images created with ZLIB compression typ=
e
> are backward compatible with older qemu versions.
>=20
> Adding of the compression type breaks a number of tests because now the
> compression type is reported on image creation and there are some changes
> in the qcow2 header in size and offsets.
>=20
> The tests are fixed in the following ways:
>     * filter out compression_type for all the tests
>     * fix header size, feature table size and backing file offset
>       affected tests: 031, 036, 061, 080
>       header_size +=3D8: 1 byte compression type
>                        7 bytes padding
>       feature_table +=3D 48: incompatible feture compression type
>       backing_file_offset +=3D 56 (8 + 48 -> header_change + fature_table=
_change)
>     * add "compression type" for test output matching when it isn't filte=
red
>       affected tests: 049, 060, 061, 065, 144, 182, 242, 255
>=20
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json             |  22 ++++++-
>  block/qcow2.h                    |  18 +++++-
>  include/block/block_int.h        |   1 +
>  block/qcow2.c                    | 101 ++++++++++++++++++++++++++++++
>  tests/qemu-iotests/031.out       |  14 ++---
>  tests/qemu-iotests/036.out       |   4 +-
>  tests/qemu-iotests/049.out       | 102 +++++++++++++++----------------
>  tests/qemu-iotests/060.out       |   1 +
>  tests/qemu-iotests/061.out       |  34 ++++++-----
>  tests/qemu-iotests/065           |  28 ++++++---
>  tests/qemu-iotests/080           |   2 +-
>  tests/qemu-iotests/144.out       |   4 +-
>  tests/qemu-iotests/182.out       |   2 +-
>  tests/qemu-iotests/242.out       |   5 ++
>  tests/qemu-iotests/255.out       |   8 +--
>  tests/qemu-iotests/common.filter |   3 +-
>  16 files changed, 253 insertions(+), 96 deletions(-)

Looks good, just mostly nit picks:

> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 85e27bb61f..a67eb8bff4 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json

[...]

> @@ -4392,6 +4395,18 @@
>    'data': [ 'v2', 'v3' ] }
> =20
> =20
> +##
> +# @Qcow2CompressionType:

As far as I can see, all other types beginning with /@qcow2/i use the
same capitalization, so it should be the correct way.

> +#
> +# Compression type used in qcow2 image file
> +#
> +# @zlib:  zlib compression, see <http://zlib.net/>

Are the two spaces after the colon intentional?

[...]

> diff --git a/block/qcow2.h b/block/qcow2.h
> index 0942126232..485effcb70 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -146,6 +146,12 @@ typedef struct QCowHeader {
> =20
>      uint32_t refcount_order;
>      uint32_t header_length;
> +
> +    /* Additional fields */
> +    uint8_t  compression_type;
> +
> +    /* header must be a multiple of 8 */

I like Berto=92s idea of adding a static assertion for that.

> +    uint8_t  padding[7];
>  } QEMU_PACKED QCowHeader;
> =20
>  typedef struct QEMU_PACKED QCowSnapshotHeader {

[...]

> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index 6f9fd5e20e..2c6bb9dc99 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h

[...]

> @@ -2720,6 +2770,12 @@ int qcow2_update_header(BlockDriverState *bs)
>      total_size =3D bs->total_sectors * BDRV_SECTOR_SIZE;
>      refcount_table_clusters =3D s->refcount_table_size >> (s->cluster_bi=
ts - 3);
> =20
> +    ret =3D validate_compression_type(s, NULL);
> +

Why this empty line?

> +    if (ret) {
> +        goto fail;
> +    }
> +
>      *header =3D (QCowHeader) {
>          /* Version 2 fields */
>          .magic                  =3D cpu_to_be32(QCOW_MAGIC),

[...]

> @@ -5248,6 +5340,9 @@ static int qcow2_amend_options(BlockDriverState *bs=
, QemuOpts *opts,
>                                   "images");
>                  return -EINVAL;
>              }
> +        } else if (!strcmp(desc->name, BLOCK_OPT_COMPRESSION_TYPE)) {
> +            error_setg(errp, "Changing the compression type is not suppo=
rted");
> +            return -ENOTSUP;

Most other branches check whether it=92s really a change (unless it=92d be
unreasonably complicated to do so), so maybe we should do the same here.

Max

>          } else {
>              /* if this point is reached, this probably means a new optio=
n was
>               * added without having it covered here */


--iDfekjLPUP7UM2wAJ0dCSlXSQo2xVSYep--

--XG8BWdvxsc541aHT6BDuujk9Lrqa1RFpo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5pDrsACgkQ9AfbAGHV
z0ChQQf/Z0F3kz9R71t5UiTpBEqoSvEoOigh7KuJCPFH2xFTpegeCaNd/CRYb48Q
nMi0tngvwDLNSigntop6WAn2jfFK8gDjqaxD2plAu+YDLcLWn05YELpWsvUSbqQM
8cdBah5zT4n9OES7U1i3mKpFQwBm9oLtmLFpkKMrrKi/kUbnrZAVlnwuZGXaGVeX
XfHNG5A3554fEIpBioD1IsXySaYNn1oS0WT8E1yGDgK+oNaah5dZTopotsogTT0M
XEiwjr56FzgjPS5Lt+lCOMZVpkRxhBVP+LbJKvXjSY+RlgSh3RzbsqnTJJ7qDtFR
2g5bYdwsxMMF5tVsOAN/LDcLSBzCDg==
=nhaU
-----END PGP SIGNATURE-----

--XG8BWdvxsc541aHT6BDuujk9Lrqa1RFpo--


