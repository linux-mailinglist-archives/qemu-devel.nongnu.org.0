Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3FC1662B6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 17:29:42 +0100 (CET)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4ohp-0000lq-6b
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 11:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j4ogD-0007fH-Us
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:28:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j4ogC-0002W8-Q7
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:28:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30249
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j4ogC-0002Vr-KE
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 11:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582216080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5s+poj6yTXOBo681mohuPMZikNkOTx3VcFiN3nRl+vw=;
 b=U+rt1fURPNJOA45iJQesZoUvgR6CpEdTfgMELP55gw0sql30QTpZqHVO0bLbWqvFM3mk7/
 6QX/sm3jqCUFDYqjTgGlaDkS7Y/DWuz3pqzVY6EqKXhaZMvQiWhmIU67TdRHDb8vMbobV+
 c3QKvuyF6hqJK4Jq0MgO+en3r7rrHxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-mv9SIl5BOu6ygDTGs3yBfQ-1; Thu, 20 Feb 2020 11:27:54 -0500
X-MC-Unique: mv9SIl5BOu6ygDTGs3yBfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C09A0CBF;
 Thu, 20 Feb 2020 16:27:53 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.36.118.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 526718D540;
 Thu, 20 Feb 2020 16:27:44 +0000 (UTC)
Subject: Re: [RFC PATCH v3 10/27] qcow2: Update get/set_l2_entry() and add
 get/set_l2_bitmap()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1577014346.git.berto@igalia.com>
 <0229eca3c5199c5383b640f9a041a83ddfcf5b0c.1577014346.git.berto@igalia.com>
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
Message-ID: <cd7156e2-0400-7c2e-fd5e-65131e214355@redhat.com>
Date: Thu, 20 Feb 2020 17:27:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0229eca3c5199c5383b640f9a041a83ddfcf5b0c.1577014346.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="r8KqKUStA2QXxJvhdYuXVRTJ0ll1QXHt7"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--r8KqKUStA2QXxJvhdYuXVRTJ0ll1QXHt7
Content-Type: multipart/mixed; boundary="TMsZCjkk4yK8KaXZBvGJIiZvx3uKQ2Fea"

--TMsZCjkk4yK8KaXZBvGJIiZvx3uKQ2Fea
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 22.12.19 12:36, Alberto Garcia wrote:
> Extended L2 entries are 128-bit wide: 64 bits for the entry itself and
> 64 bits for the subcluster allocation bitmap.
>=20
> In order to support them correctly get/set_l2_entry() need to be
> updated so they take the entry width into account in order to
> calculate the correct offset.
>=20
> This patch also adds the get/set_l2_bitmap() functions that are
> used to access the bitmaps. For convenience we allow calling
> get_l2_bitmap() on images without subclusters, although the caller
> does not need and should ignore the returned value.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/block/qcow2.h b/block/qcow2.h
> index 8be020bb76..64b0a814f4 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -518,15 +518,37 @@ static inline size_t l2_entry_size(BDRVQcow2State *=
s)

[...]

> +static inline uint64_t get_l2_bitmap(BDRVQcow2State *s, uint64_t *l2_sli=
ce,
> +                                     int idx)
> +{
> +    if (has_subclusters(s)) {
> +        idx *=3D l2_entry_size(s) / sizeof(uint64_t);
> +        return be64_to_cpu(l2_slice[idx + 1]);
> +    } else {
> +        /* For convenience only; the caller should ignore this value. */
> +        return 0;

Is there a reason you decided not to return the first subcluster as
allocated?  (As you had proposed in v2)

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +    }
> +}


--TMsZCjkk4yK8KaXZBvGJIiZvx3uKQ2Fea--

--r8KqKUStA2QXxJvhdYuXVRTJ0ll1QXHt7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5Os3AACgkQ9AfbAGHV
z0AUIggAm0ncIGIP4INZVRuTssR4MBcGmy2W7qnASIYFxaT7RNkF/6xaD+aFbwry
qWNN03xIjzL1oZjVCAy85siB1vue4Ds2Iak9PTUbt2YV2/1Mj3cI24qWrG1dR69k
9toycFKg2vctqJobDNq8YKRVMR6PS73lur6cXjkzwp1WRT2KbDZYsdwxRFUA7lR/
bt6h4RFxSdtP04AzZ237LVN5vQo+aWrz0TOXy7+mSpxkeArx60GSRKSjDxF8B6E+
Kg+DVSdN24Z4W7+DdHPmkiT1PvpiPXf+TEBmeM9eb5TvWEjVDGFwHj7SNG2RxuRz
f1ycUmSYDyS/w6eB20T48qWC9/IGMA==
=039P
-----END PGP SIGNATURE-----

--r8KqKUStA2QXxJvhdYuXVRTJ0ll1QXHt7--


