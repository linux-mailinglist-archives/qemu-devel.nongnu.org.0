Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804371B5951
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 12:35:52 +0200 (CEST)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRZCx-0005u7-2d
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 06:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jRZBk-00050b-3a
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 06:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jRZBj-0005n3-MD
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 06:34:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57748
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jRZBj-0005lR-3E
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 06:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587638073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yKrDmgK2jVJEhV5wT9cOkcixhyM3FZwwTPI6m2jtkN8=;
 b=Wcjq395u3A5PVhUQHiBVeBomfE81RU+vmGE5XGQnvKautEqP+oRBA8GPoiX3fMRCN40I76
 RXNvE8jASZiq/gsBduaM1tSxkj/AwVyiEq3FXPH4n9/7HvyoOcGu1cexwauYtnrgjkNp/9
 fwtMIz3wCbmziH3xLjJI7dUGksC8a5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10--Gf2e3zsOBeUjywAJ_Sqpg-1; Thu, 23 Apr 2020 06:34:29 -0400
X-MC-Unique: -Gf2e3zsOBeUjywAJ_Sqpg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F62818C35A0;
 Thu, 23 Apr 2020 10:34:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59044605CE;
 Thu, 23 Apr 2020 10:34:25 +0000 (UTC)
Subject: Re: [PATCH v5 3/9] block-backend: Add flags to blk_truncate()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200422152129.167074-1-kwolf@redhat.com>
 <20200422152129.167074-4-kwolf@redhat.com>
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
Message-ID: <df0b48ca-3bc2-859b-299a-090227013f54@redhat.com>
Date: Thu, 23 Apr 2020 12:34:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200422152129.167074-4-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZS7NVoTt3QgQxWNqiGUqGO8Sj6tMOsl3Z"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 05:42:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: berto@igalia.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZS7NVoTt3QgQxWNqiGUqGO8Sj6tMOsl3Z
Content-Type: multipart/mixed; boundary="fmuJtXsc3K9GOV8Zi4avknaSCa5s2BIsd"

--fmuJtXsc3K9GOV8Zi4avknaSCa5s2BIsd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.04.20 17:21, Kevin Wolf wrote:
> Now that node level interface bdrv_truncate() supports passing request
> flags to the block driver, expose this on the BlockBackend level, too.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> ---
>  include/sysemu/block-backend.h | 2 +-
>  block.c                        | 3 ++-
>  block/block-backend.c          | 4 ++--
>  block/commit.c                 | 4 ++--
>  block/crypto.c                 | 2 +-
>  block/mirror.c                 | 2 +-
>  block/qcow2.c                  | 4 ++--
>  block/qed.c                    | 2 +-
>  block/vdi.c                    | 2 +-
>  block/vhdx.c                   | 4 ++--
>  block/vmdk.c                   | 6 +++---
>  block/vpc.c                    | 2 +-
>  blockdev.c                     | 2 +-
>  qemu-img.c                     | 2 +-
>  qemu-io-cmds.c                 | 2 +-
>  15 files changed, 22 insertions(+), 21 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--fmuJtXsc3K9GOV8Zi4avknaSCa5s2BIsd--

--ZS7NVoTt3QgQxWNqiGUqGO8Sj6tMOsl3Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6hbzAACgkQ9AfbAGHV
z0DaYwf+LFUgKByPa5E+8X72cdeFxKXzPBahGBJFhvi+DLHzLaAvxxO+DnbX2qoF
yzgEyPq4jmvkfVee/HPq5HVEbW/V5YBYDggxmnrPKw4+3yefhBUDrG4UEvzojG77
VBBfdjtC8EVPXrLb9iDlDnV06fgQuYWEu2AdilZQ29q6fb+92MBzZTZUztLmpyp7
oBOlqfUpmgOl2Gp0Hi+qIUJmQGcaoUwZCeZyGEn6C7UTDrFl8OO1xv0bz6DnGaaZ
O2T+eT45OeFxowyMRgagk/Sxfr4UGwwVcMXp1NVz6xPg/8OoUzxmJBYn2DNpU+y0
JvScmaRp9hl3iqvdhTGOLYC45hpqnw==
=SwrF
-----END PGP SIGNATURE-----

--ZS7NVoTt3QgQxWNqiGUqGO8Sj6tMOsl3Z--


