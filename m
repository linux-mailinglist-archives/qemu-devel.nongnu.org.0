Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB656EC429
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 15:02:45 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQXVk-0000ks-6m
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 10:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iQXUK-00008Q-AS
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 10:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iQXUH-00087P-P9
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 10:01:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58414
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iQXUH-00080q-6h
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 10:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572616872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+A2Q1lIRvuGkDQupNOTrm9cmZ+poO4pm4cIb2bVihqs=;
 b=SuVsChEqUp+JWlyXFeIJVlWFsMqXKBO3Zrvn8toGK41X/laZ0cyn1fncRvqYRwAesOC4/U
 SiveeSr2faWY6NC6/j0VOnoRbITKStLvzkAsBPmn3x4YTW6XmE54N6p9VKzycVeRMVTjEj
 sJKdKtp64uOCa2HYFgvYQfZlB3Hmfzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-I9uwlWsWNCCbfCwwCrLEaA-1; Fri, 01 Nov 2019 10:01:08 -0400
X-MC-Unique: I9uwlWsWNCCbfCwwCrLEaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A8D8107ACC2;
 Fri,  1 Nov 2019 14:01:07 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-28.ams2.redhat.com
 [10.36.117.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3C845C28E;
 Fri,  1 Nov 2019 14:01:04 +0000 (UTC)
Subject: Re: [PATCH for-4.2 1/4] Revert "qcow2: skip writing zero buffers to
 empty COW areas"
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20191101100019.9512-1-mreitz@redhat.com>
 <20191101100019.9512-2-mreitz@redhat.com>
 <c4e21028-0321-20ea-21b8-31dec87fac97@redhat.com>
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
Message-ID: <e8f8ae20-b036-4330-4851-f099fc534f9b@redhat.com>
Date: Fri, 1 Nov 2019 15:01:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <c4e21028-0321-20ea-21b8-31dec87fac97@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TEypAhPXNjarWQ1iAPmjC13PFAKCCuEda"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TEypAhPXNjarWQ1iAPmjC13PFAKCCuEda
Content-Type: multipart/mixed; boundary="Ms7BYJ1fvZqURUh0mX06iL60AqIyyvjOt"

--Ms7BYJ1fvZqURUh0mX06iL60AqIyyvjOt
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01.11.19 13:40, Eric Blake wrote:
> On 11/1/19 11:00 AM, Max Reitz wrote:
>> This reverts commit c8bb23cbdbe32f5c326365e0a82e1b0e68cdcd8a.
>>
>> This commit causes fundamental performance problems on XFS (because
>> fallocate() stalls the AIO pipeline), and as such it is not clear that
>> we should unconditionally enable this behavior.
>>
>> We expect subclusters to alleviate the performance penalty of small
>> writes to newly allocated clusters, so when we get them, the originally
>> intended performance gain may actually no longer be significant.
>>
>> If we want to reintroduce something similar to c8bb23cbdbe, it will
>> require extensive benchmarking on various systems with subclusters
>> enabled.
>>
>> Cc: qemu-stable@nongnu.org
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>=20
>> +++ b/qapi/block-core.json
>> @@ -3304,8 +3304,6 @@
>> =A0 #
>> =A0 # @cor_write: a write due to copy-on-read (since 2.11)
>> =A0 #
>> -# @cluster_alloc_space: an allocation of file space for a cluster
>> (since 4.1)
>> -#
>> =A0 # @none: triggers once at creation of the blkdebug node (since 4.1)
>=20
> Deleting released qapi is not backwards-compatible.

Right. :-/

I=92ll just not make changes to the QAPI schema.  It doesn=92t hurt to leav=
e
this in.

Max

> However, given that
> the only known user of this interface is debug testing via iotests, I'm
> not too concerned that we would be impacting any external users.


--Ms7BYJ1fvZqURUh0mX06iL60AqIyyvjOt--

--TEypAhPXNjarWQ1iAPmjC13PFAKCCuEda
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl28Op4ACgkQ9AfbAGHV
z0CkvggAqroXft5pdXXLNgeEU9ypp9x6fvVXvIkha68LyNIh7Jp0f7v4BCbTPGOQ
keCFyq692E8/KRm7lOPaFCtPRZSFiudzWGY4BX+SCGsuzaR/swEA90USuaWtn/eG
yaH6Z63ol8OvsOMmkan/YYoVw4z1JBUoYaAg93/rwokYVBEy2hbwxbGTdNTBgLAb
IXdotLVCn47LIKpFUvIUf/9FyMqV9Z42U3LdrE0isgBcaMPXhG1TrF2vwqS6W7PQ
FtD5UJTQDFCtV/CPa+bukIBIDKeQI9cKK51c5CRdFXj4nAFnuTJCVTSzYukE86hE
6ToqzlpzSXA7Lq2cndm4HLUuQJr9ug==
=s3BU
-----END PGP SIGNATURE-----

--TEypAhPXNjarWQ1iAPmjC13PFAKCCuEda--


