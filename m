Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0063E8AA0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 15:19:43 +0100 (CET)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPSLV-0001nr-Ns
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 10:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iPSFA-0003b4-AQ
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 10:13:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iPSF8-0007FN-Vh
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 10:13:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29965
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iPSF8-0007EI-Qy
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 10:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572358386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eZZbcy9mkifMZikzVwdxAfjJq91UFeNeHMeJxvfMP+0=;
 b=b7h7UuDRkTZ/4iIwkT9lcXAC4PyabA7+1XJEV4lYpCU9QubguMtWeAhFmbHmih7hskXyLW
 UH0fZ/MG9m6IEWKFSlT2t2YngYQZCCKG3XZ1rojUJ6o2Cb8wI1TJrtxDIPYydsJlwziGoC
 HSTcsoMm0YeHTbjTSyJp/RKMyEEXKMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-xbnf_3gsMGKMdW__JorFCw-1; Tue, 29 Oct 2019 10:13:00 -0400
X-MC-Unique: xbnf_3gsMGKMdW__JorFCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74ED31005509;
 Tue, 29 Oct 2019 14:12:59 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-124.ams2.redhat.com
 [10.36.116.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC313DB6;
 Tue, 29 Oct 2019 14:12:56 +0000 (UTC)
Subject: Re: [PATCH] nvme: fix NSSRS offset in CAP register
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20191023073315.446534-1-its@irrelevant.dk>
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
Message-ID: <9fdcdd2e-7c64-1788-6170-5304d35e3de6@redhat.com>
Date: Tue, 29 Oct 2019 15:12:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023073315.446534-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="h6iB1aOZxk3qAj71txJvjT5e2FD0deIAH"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Javier Gonzalez <javier@javigon.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--h6iB1aOZxk3qAj71txJvjT5e2FD0deIAH
Content-Type: multipart/mixed; boundary="76oiLEr0fDnY73sopRNF5Z9V3BNejyVQq"

--76oiLEr0fDnY73sopRNF5Z9V3BNejyVQq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 23.10.19 09:33, Klaus Jensen wrote:
> Fix the offset of the NSSRS field the CAP register.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> Reported-by: Javier Gonzalez <javier.gonz@samsung.com>
> ---
>  include/block/nvme.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks; added John=E2=80=99s note and applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Max


--76oiLEr0fDnY73sopRNF5Z9V3BNejyVQq--

--h6iB1aOZxk3qAj71txJvjT5e2FD0deIAH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl24SOYACgkQ9AfbAGHV
z0AVyQf/QD7FirXXtn/R+cVVpwPzVElqkjpFVOgdXvqVrIQ+gLEJxZc0wL7V2DIj
iXg7C+UHn0XXd3OC+jDqyVV4SIRa8+Vm8opYbs1GrvVDTTaapdhJLcM2K+n2vE+t
18gIuSpzWvoIKWo/OJQ6DAmzPbsO+QvNjGpnU06oyMFbM+gIndtn3DPUHuOB9T8L
B0SSJL3HwC5D6EyAq+LBeqTUuggQsTLJ7spBthywEDopOVPPReOSM7o7nrhSjVsJ
j9C+opzTMzwIfVuocreUJaOMjX+2NSEwJZk3gsbaYsryeY4e8wrfCOy5QXkv5B6f
hWVVD9kpLSUQtlwyjF4UBV5qOOzKFw==
=N0cL
-----END PGP SIGNATURE-----

--h6iB1aOZxk3qAj71txJvjT5e2FD0deIAH--


