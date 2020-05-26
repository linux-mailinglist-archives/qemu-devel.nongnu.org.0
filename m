Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E1D1B7154
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 11:58:12 +0200 (CEST)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRv63-00047c-IR
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 05:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jRv53-0003Lv-Ja
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 05:57:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jRv51-0003Or-QZ
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 05:57:09 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28437
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jRv51-0003KH-D9
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 05:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587722226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1tund0S9wU5SpGCQljwTn3Cihvn7Ky7peTkk6GIDedg=;
 b=F99Gi2s3m7KY26EZGmkC1fgm88GaCl+BgUvSDq//fOJGC6LBf2pdlx5GMtadYSbU9t0eQi
 Zn9uaQk6igKcqZcEe3i3GdnsEIVvW1vA/HXRJWhGLaH7INYRRVH0sUri0a0mVL5Hsm1HDJ
 uGjDluSqsKGZDo0EgjgLKRtiFoYH9r4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-S2vHHNAIMeeYAJnxMogAJQ-1; Fri, 24 Apr 2020 05:57:02 -0400
X-MC-Unique: S2vHHNAIMeeYAJnxMogAJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E7284B8A6;
 Fri, 24 Apr 2020 09:57:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86780600F5;
 Fri, 24 Apr 2020 09:56:57 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] block: Add blk_new_with_bs() helper
From: Max Reitz <mreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20200423221707.477404-1-eblake@redhat.com>
 <20200423221707.477404-2-eblake@redhat.com>
 <307f7619-5e4a-10c1-7d49-8ee6bb8d650c@redhat.com>
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
Message-ID: <f3808938-8b27-3af0-c2da-996459a5c921@redhat.com>
Date: Fri, 24 Apr 2020 11:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <307f7619-5e4a-10c1-7d49-8ee6bb8d650c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yQxxgHbTaS5rGw9xFvFNQYcyeWcDZLEq5"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:11:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>,
 "open list:Sheepdog" <sheepdog@lists.wpkg.org>, qemu-block@nongnu.org,
 Jeff Cody <codyprime@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Liu Yuan <namei.unix@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yQxxgHbTaS5rGw9xFvFNQYcyeWcDZLEq5
Content-Type: multipart/mixed; boundary="LolDqW20lmxroJzyXmI30ZkgYxioRKvB3"

--LolDqW20lmxroJzyXmI30ZkgYxioRKvB3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 24.04.20 11:53, Max Reitz wrote:
> On 24.04.20 00:17, Eric Blake wrote:
>> There are several callers that need to create a new block backend from
>> an existing BDS; make the task slightly easier with a common helper
>> routine.
>>
>> Suggested-by: Max Reitz <mreitz@redhat.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  include/sysemu/block-backend.h |  2 ++
>>  block/block-backend.c          | 23 +++++++++++++++++++++++
>>  block/crypto.c                 |  8 +++-----
>>  block/parallels.c              |  7 +++----
>>  block/qcow.c                   |  7 +++----
>>  block/qcow2.c                  | 15 ++++++---------
>>  block/qed.c                    |  7 +++----
>>  block/sheepdog.c               |  9 ++++-----
>>  block/vdi.c                    |  7 +++----
>>  block/vhdx.c                   |  7 +++----
>>  block/vmdk.c                   |  9 ++++-----
>>  block/vpc.c                    |  7 +++----
>>  blockdev.c                     |  8 +++-----
>>  blockjob.c                     |  7 ++-----
>>  14 files changed, 65 insertions(+), 58 deletions(-)
>=20
> Reviewed-by: Max Reitz <mreitz@redhat.com>

(With the Patchew warning fixed, of course (i.e., we should set ret to
-EPERM or something in qcow.c))

>> diff --git a/blockdev.c b/blockdev.c
>> index 5faddaa7052f..f43426ed5fbc 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>=20
> [...]
>=20
>> @@ -2734,14 +2733,13 @@ void qmp_block_resize(bool has_device, const cha=
r *device,
>>          goto out;
>>      }
>>
>> -    blk =3D blk_new(bdrv_get_aio_context(bs), BLK_PERM_RESIZE, BLK_PERM=
_ALL);
>> -    ret =3D blk_insert_bs(blk, bs, errp);
>> -    if (ret < 0) {
>> +    blk =3D blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
>> +    if (!blk) {
>>          goto out;
>>      }
>>
>>      bdrv_drained_begin(bs);
>> -    ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
>> +    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
>=20
> This is also addressed by
> https://lists.nongnu.org/archive/html/qemu-devel/2020-04/msg03656.html,
> but it does make sense to fix it here, too.  Well, whichever lands first
> lands first, I suppose (so @ret can be dropped).

I intended to affix the =E2=80=9C(so @ret can be dropped)=E2=80=9D to the f=
irst
sentence, not the second one...

Max


--LolDqW20lmxroJzyXmI30ZkgYxioRKvB3--

--yQxxgHbTaS5rGw9xFvFNQYcyeWcDZLEq5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6it+cACgkQ9AfbAGHV
z0DgSwgAu7NmWYppBhxcsbp1MQRWTxvnw1m4KpnfOxhGfqEBm9snpDbW+nYTh94a
rANDvlVT3oSsWNn3uUGod389kdd9HpXQivbyywSaEHVLX/MgRmhAGZTyYyPQ9c4V
F6B4EhMI1GZUgjL/dJkylyRP7dY5cqd8TZPsB42LmIJYSqdJ1mpu4ON/zlziv5Sx
jbDV/Z4y6jlqEig2oYu7vo483jIToUp3rks0odjoZt+yV3h5agdU/WJwBryC+Ig7
1VAECoGYnqt0Hrfa4ppuWXpQugzwqGSnL9kr0lD/4OO8SwXPkpf9aj7dgZ+EPECP
gAN8y4BHailk50C/LLspQ09NyS2+Pw==
=ckWT
-----END PGP SIGNATURE-----

--yQxxgHbTaS5rGw9xFvFNQYcyeWcDZLEq5--


