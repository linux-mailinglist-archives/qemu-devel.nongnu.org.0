Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7BA143CA3
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:18:06 +0100 (CET)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itsTt-00087c-Qj
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1itsSX-0007Ex-0Y
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1itsSW-0004bU-2X
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:16:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53326
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1itsSV-0004bI-UF
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:16:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579608999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=y4Ls/1s5gtChI7/i6nlzIOb+McnT+V8tEvZ1idy+khA=;
 b=PLR6YnqbeuWLiuWiy2KAD1C3rTxWoTJ/ZUfw7hasuNIE2SnZWh5pdYwPm2AFC+CaMAUNf/
 ps9YcAVGAtAdEeDd3ZNeDVfKIyU4/wj1x436qxZ0jUlB8zA/mfraDICJDnRsL1y9ryCiAA
 ekjJao+vGZWsGgg1fUDOw3w+f7o1W8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-D3ykZ9owO_mz2EAlDntLRA-1; Tue, 21 Jan 2020 07:16:36 -0500
X-MC-Unique: D3ykZ9owO_mz2EAlDntLRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1450DB60;
 Tue, 21 Jan 2020 12:16:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-116.ams2.redhat.com
 [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60B355C28D;
 Tue, 21 Jan 2020 12:16:34 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] qcow2: Don't require aligned offsets in
 qcow2_co_copy_range_from()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1579374329.git.berto@igalia.com>
 <a4264aaee656910c84161a2965f7a501437379ca.1579374329.git.berto@igalia.com>
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
Message-ID: <12ffae66-3ed3-bb69-e324-089522e32025@redhat.com>
Date: Tue, 21 Jan 2020 13:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a4264aaee656910c84161a2965f7a501437379ca.1579374329.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2On1k3ciXLffINvn27lJz7jM9NVuCkbVb"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2On1k3ciXLffINvn27lJz7jM9NVuCkbVb
Content-Type: multipart/mixed; boundary="iOm2GWlsq90ShmU68GerreRElpKqayien"

--iOm2GWlsq90ShmU68GerreRElpKqayien
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 18.01.20 20:09, Alberto Garcia wrote:
> qemu-img's convert_co_copy_range() operates at the sector level and
> block_copy() operates at the cluster level so this condition is always
> true, but it is not necessary to restrict this here, so let's leave it
> to the driver implementation return an error if there is any.
>=20
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--iOm2GWlsq90ShmU68GerreRElpKqayien--

--2On1k3ciXLffINvn27lJz7jM9NVuCkbVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl4m66EACgkQ9AfbAGHV
z0CdPwgAogxNjLJs9Ehz3qySRsB78G4ybxsa06SXTG3oMJM47tiJMgpdDv+cjnCR
AmE5QPGOLYZ2BZyCj3frf5qtltqaJ/LtvqkixUSL/73mT+ceOgyRRUUc7+33OigH
niqQkaRpCetkHCccgOx26A7xeq7lkcirbWsVCcc25kC+hUME2Wg8fKNmUj2eWz3C
CaMZvPHxAkbkqiP3QxXOzAFHyTijvFNHw3GgYGr/qQL1OmSmwdqP5GTRmDnx7aCY
cb2Qlh72SU/kLHa6Az1tczYux3YJMveOz9KhVACPu9/DnuG9ahgnv+ZBtWS2buaf
y03zlZPzmOErflfMMAx/Qhd48x9bxQ==
=9q2e
-----END PGP SIGNATURE-----

--2On1k3ciXLffINvn27lJz7jM9NVuCkbVb--


