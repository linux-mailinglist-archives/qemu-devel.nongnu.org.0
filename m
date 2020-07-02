Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4ED212073
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 11:58:46 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqvzR-0005tE-Mh
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 05:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jqvyf-0005Pr-FJ
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 05:57:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58132
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jqvyd-0008FG-V7
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 05:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593683875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eBxObTQVLaLR6b+x+NpJB30XM74uiz+qnSSAOOs/0i0=;
 b=f8ochZZuKGHOkAtwusmqIqmHJhwfFwSIkVSuLUhIIzjyLmKmFKCVpypxmhlgWVN14ouzCl
 a54gu3PiNsbvcYdORSa9gUHb89t+p8h3LVEJWZA3czXLKbnrFfONcFf70L5Sf9UKK9Hrh+
 nCCNOHvVgPaEzw7fYyUsxEzNuZg2qEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-X3zi-pg9P6Wd5R-eNoEXqQ-1; Thu, 02 Jul 2020 05:57:51 -0400
X-MC-Unique: X3zi-pg9P6Wd5R-eNoEXqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F32AD107ACF4;
 Thu,  2 Jul 2020 09:57:49 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-196.ams2.redhat.com
 [10.36.113.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12E9279231;
 Thu,  2 Jul 2020 09:57:47 +0000 (UTC)
Subject: Re: [PATCH v9 14/34] qcow2: Add QCow2SubclusterType and
 qcow2_get_subcluster_type()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1593342067.git.berto@igalia.com>
 <6ee75696d3eaed56b46e91fe242fdfab51feb066.1593342067.git.berto@igalia.com>
 <fae77394-92fd-d170-0ae6-051c0a024d04@redhat.com>
 <w51mu4jurqe.fsf@maestria.local.igalia.com>
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
Message-ID: <6c06d36e-c074-fff0-fad8-fa96962b4906@redhat.com>
Date: Thu, 2 Jul 2020 11:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <w51mu4jurqe.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3wi3PFeZ5yvi0QCn9ANfGGkLme5v4eGs4"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:00:43
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
--3wi3PFeZ5yvi0QCn9ANfGGkLme5v4eGs4
Content-Type: multipart/mixed; boundary="mcSag7eap2wCbJ8CbnZbXyuQg8vCpJ4L8"

--mcSag7eap2wCbJ8CbnZbXyuQg8vCpJ4L8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 01.07.20 18:26, Alberto Garcia wrote:
> On Wed 01 Jul 2020 02:52:14 PM CEST, Max Reitz wrote:
>>>      if (l2_entry & QCOW_OFLAG_COMPRESSED) {
>>>          return QCOW2_CLUSTER_COMPRESSED;
>>> -    } else if (l2_entry & QCOW_OFLAG_ZERO) {
>>> +    } else if ((l2_entry & QCOW_OFLAG_ZERO) && !has_subclusters(s)) {
>>
>> OK, so now qcow2_get_cluster_type() reports zero clusters to be normal
>> or unallocated clusters when there are subclusters.  Seems weird to
>> me, because zero clusters are invalid clusters then.
>=20
> I'm actually hesitant about this.
>=20
> In extended L2 entries QCOW_OFLAG_ZERO does not have any meaning so
> technically it doesn't need to be checked any more than the other
> reserved bits (1 to 8).

Good point.  That convinces me.

> The reason why we would want to check it is, of course, because that bit
> does have a meaning in regular L2 entries.
>=20
> But that bit is ignored in images with subclusters so the only reason
> why we would check it is to report corruption, not because we need to
> know its value.

Sure.  But isn=E2=80=99t that the whole point of having QCOW2_SUBCLUSTER_IN=
VALID
in the first place?

> It's true that we do check it in v2 images, although in that case the
> entries are otherwise identical and there is a way to convert between
> both types.
>=20
>> I preferred just reporting them as zero clusters and letting the
>> caller deal with it, because it does mean an error in the image and so
>> it should be reported.
>=20
> Another alternative would be to add QCOW2_CLUSTER_INVALID and we could
> even include there other cases like unaligned offsets and things like
> that. But that would also affect the code that repairs corrupted images.

Interesting.  Well, and that=E2=80=99d be definitely too much for this seri=
es,
as you already said.

So:

Reviewed-by: Max Reitz <mreitz@redhat.com>


--mcSag7eap2wCbJ8CbnZbXyuQg8vCpJ4L8--

--3wi3PFeZ5yvi0QCn9ANfGGkLme5v4eGs4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl79r5oACgkQ9AfbAGHV
z0CGJAf/Uy0zCamRYcFu5WQGEGgXd5zNo1J3g5YZ2oQ7oVPdzJuTBoC5z3+PIX4r
TLZ7X+4M5jYQZt1FxQqo9311cwZhC8zKcXW4XTawwtcurirr7/fb39VlLKumvHJJ
oWb7O3JvJmquwlqDj8B0nJoKNYGyxw44Zlr7dUcvJF3K0RhTyAOaELD5eR2+quj6
NYe77RPQ5TduO/Ij4gS5p7Z30Y2RmwFzucyCeS6+Lvc8nD8+0Z35N1i6WuoUssq9
P1ivcnCQ7YE9KdhjOgModdF8KJMruqSyMhF9nfzZHoF9Ofdcdta6KjpBWzPj1ohF
m4eEpAuviJZhTrbd4bsB5rGPsS36sQ==
=B3EN
-----END PGP SIGNATURE-----

--3wi3PFeZ5yvi0QCn9ANfGGkLme5v4eGs4--


