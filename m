Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841D181DDD
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:31:01 +0100 (CET)
Received: from localhost ([::1]:55432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC4G4-0003no-IU
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jC4EH-0000c2-E9
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jC4EG-0005eh-1D
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:29:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52518
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jC4EF-0005eO-SL
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 12:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583944147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SKNDDL/KmeDcOjOVcM4Sko2Hko8Qu80NncIEbc3sMqY=;
 b=S41WgJp87hEqsQ+ylnbxj+f20nM5Yc9Y6XgfNRZSMGhMEiJUoCKUrjh5rb2Pye+GeNs/SI
 nt3lZqYXknBOZnuQCUygUCsyVTw9158MOO7RoC+2xnBLofa42RmmR3fzibu66NCKUvhQWo
 u4a0flI2Jg5luIgIuYWs6ggNYgLfx0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-LYoMwBTJPQimLndKOjcwnw-1; Wed, 11 Mar 2020 12:28:55 -0400
X-MC-Unique: LYoMwBTJPQimLndKOjcwnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BD64DBA3;
 Wed, 11 Mar 2020 16:28:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-216.ams2.redhat.com
 [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A31885D9C5;
 Wed, 11 Mar 2020 16:28:51 +0000 (UTC)
Subject: Re: [PATCH v5 0/5] qcow2: Implement zstd cluster compression method
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200304133538.9159-1-dplotnikov@virtuozzo.com>
 <bbb15291-ffb5-80f1-ed27-583ac3cb98bb@virtuozzo.com>
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
Message-ID: <55afec29-1726-c36a-6d80-3dbd1839f0a6@redhat.com>
Date: Wed, 11 Mar 2020 17:28:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <bbb15291-ffb5-80f1-ed27-583ac3cb98bb@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Z43SBCmhgWMD1rltiMkZZzXglBOJpQlLW"
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-block@nongnu.org, armbru@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Z43SBCmhgWMD1rltiMkZZzXglBOJpQlLW
Content-Type: multipart/mixed; boundary="qA7N8sobKU7KbqV3vXE5Vv7tLLWayX3G8"

--qA7N8sobKU7KbqV3vXE5Vv7tLLWayX3G8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.03.20 08:31, Denis Plotnikov wrote:
> ping!
>=20
> Is there any other comments/concerns/objections/suggestions according to
> the series except the minor ones from Alberto and Vladimir?
> If not, please, let me know, so I can resend the series with the minor
> changes for applying to the corresponding branch.

Sounds good to me.

I=E2=80=99d like to note that most iotests that seem to do something with
compression (i.e., where grep finds a 'compress' somewhere; 013, 014,
023, 042, 046, 053, 055, ...) pass with -o compression_type=3Dzstd, too.
060 hangs somewhere.  112 complains about v2 incompatibility; and 214
relies on intricacies of zlib, I think.  So that looks good, too.

Well, one thing I did have to fix for this to work is to quote
everything in common.pattern that tries to echo something with brackets
(e.g. =E2=80=9CClusters to be compressed [1]=E2=80=9D).  I don=E2=80=99t qu=
ite know why the
brackets suddenly disappear when I run the tests with -o
compression_type, who knows.  But putting quotes around the echo
arguments fixes it, so...

Max


--qA7N8sobKU7KbqV3vXE5Vv7tLLWayX3G8--

--Z43SBCmhgWMD1rltiMkZZzXglBOJpQlLW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl5pEcEACgkQ9AfbAGHV
z0CFoggAnKgpbXqbVv/cM4pZfAORJQc7ZgKZnQHIVopNu7Q1UGL+aR+Ve195x0LY
M9jNiA9j4sdKNGJjOrnzCxTxWXs5wRodhMbqvI0gcrCM4p8im4NTte2B1KhWMSkm
HNYmZGffvdBVkycRaREDT0VzZgjMf2eBmekfQBILPCQLw1PYBvLDmS56TTFQ10dS
At2R5VMoW0rPpjHee8bi9pW+q4W71JqjYlXRmo28ksmhG9bCsxO+0O1xpkMdG7j8
qwozJlnDJcJq1TXIIXbPF5ki7ZDV/aPBr0VSaBfroEiIFyDmuGE3S+DGVPvoLP0/
iTmFaz3Svec4jXeIH3qZ2b0tA72Ejg==
=mrqA
-----END PGP SIGNATURE-----

--Z43SBCmhgWMD1rltiMkZZzXglBOJpQlLW--


