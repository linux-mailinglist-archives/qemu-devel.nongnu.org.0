Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E01A0ADE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 12:13:22 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLlEP-0002aX-Em
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 06:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jLlDX-00024g-2H
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:12:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jLlDW-0004s1-4W
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:12:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58671
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jLlDW-0004rP-15
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586254345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jpLqhR8mHG+/5zyroAiolBMKF96sybM3c7otLvkcIV0=;
 b=dcSXKKVgEhHJHZrYuqZEnvLOS9l86geXT+owwa+QcgZ2NiflU7C1jAzf6ahcE2Uq83I5H0
 Qo8b7gQQzmfn4F2S+3DOBU05GFGt12mJRZnDW5YLnDeoOD+ETan2GEuyeCxoRt1849EyJC
 pZuEMbpeUhroyLNb5lcSFSri3A78agc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-vC5A1XMFOvi5Sa-L7BAopQ-1; Tue, 07 Apr 2020 06:12:20 -0400
X-MC-Unique: vC5A1XMFOvi5Sa-L7BAopQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F29A21005509;
 Tue,  7 Apr 2020 10:12:18 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-84.ams2.redhat.com
 [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F14119583;
 Tue,  7 Apr 2020 10:12:13 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v2 3/3] block: Fix blk->in_flight during
 blk_wait_while_drained()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200406171403.6761-1-kwolf@redhat.com>
 <20200406171403.6761-4-kwolf@redhat.com>
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
Message-ID: <b96851fa-0fcb-d2d2-ef7d-0ab69933eee3@redhat.com>
Date: Tue, 7 Apr 2020 12:12:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406171403.6761-4-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xQs6bSLl2sh9m2EAPlzbOvsFSYfJTZD7C"
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
Cc: vsementsov@virtuozzo.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 t.lamprecht@proxmox.com, stefanha@redhat.com, dietmar@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xQs6bSLl2sh9m2EAPlzbOvsFSYfJTZD7C
Content-Type: multipart/mixed; boundary="MGRDRYf9LS5qWrv7IQLApRRp3OgvF2Yqg"

--MGRDRYf9LS5qWrv7IQLApRRp3OgvF2Yqg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.04.20 19:14, Kevin Wolf wrote:
> Waiting in blk_wait_while_drained() while blk->in_flight is increased
> for the current request is wrong because it will cause the drain
> operation to deadlock.
>=20
> This patch makes sure that blk_wait_while_drained() is called with
> blk->in_flight increased exactly once for the current request, and that
> it temporarily decreases the counter while it waits.
>=20
> Fixes: cf3129323f900ef5ddbccbe86e4fa801e88c566e
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  block/block-backend.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--MGRDRYf9LS5qWrv7IQLApRRp3OgvF2Yqg--

--xQs6bSLl2sh9m2EAPlzbOvsFSYfJTZD7C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6MUfsACgkQ9AfbAGHV
z0DK6wgAjx9AAGKiriIJYBfizsM9Xl6aetRPAZ/RdkzckYAQF1eu39iKzsU0whu2
PP9trnswGrSlqkN+pmw6gpW4kTKq1GihtTHAzQ/v8qbccWJlmQvWbfam5BPkvjBW
nuTX6XMmrjcfCymsJdXrpj8GM0iX904DmT4yp2WYqlxuipFf3f06q9OfgnU+CVwC
Yodrxv9PEodAul1OfvdnLENj6TK22MTl8D/NqKlI1Yj41n8l0RU/V520DdKRS/Y8
+b+d/d06c9U5Dj3pX40trD54WezMHkeyiDXJxnBqN2jcxp3KghQ5DaUY/cgFVXnc
OiYYzPPnP7NSMiV3bFNw/1zvdAW0gg==
=eJTT
-----END PGP SIGNATURE-----

--xQs6bSLl2sh9m2EAPlzbOvsFSYfJTZD7C--


