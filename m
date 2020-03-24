Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC4A1915E7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 17:15:29 +0100 (CET)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGmDA-0001pp-5K
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 12:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46719)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jGmCI-0001LI-Ty
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:14:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jGmCH-0007ZU-JS
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:14:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:50436)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jGmCH-0007ZF-Fh
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585066473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=pPF44jG1x/DQ8x5IrhY4kqvU0fgJwONad4vAcKFk81s=;
 b=BuiUASTlrTzC+Hi7UYVAksiSjibh0Jy0kzJTK3VV28uAHmQFrOkJFpKZwmBuj6thLVYaSK
 I+WfPtBCvhFeoP23uo9CyAJscJUozdQr7XGtmSfPko4hxbVkurcHStvI8x2cFUTQuvj4ww
 HG3uGtu7YOA4YybMJLOviD8ikgGpJh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-41kIh5qwPT6LUazLxZLy9w-1; Tue, 24 Mar 2020 12:14:29 -0400
X-MC-Unique: 41kIh5qwPT6LUazLxZLy9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A47CDBA5;
 Tue, 24 Mar 2020 16:14:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-213.ams2.redhat.com
 [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 386728D576;
 Tue, 24 Mar 2020 16:14:22 +0000 (UTC)
Subject: Re: [PATCH v8 11/11] iotests: use python logging for iotests.log()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20200317004105.27059-1-jsnow@redhat.com>
 <20200317004105.27059-12-jsnow@redhat.com>
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
Message-ID: <8216a0c5-9570-f0e5-fee1-e3c7d7529725@redhat.com>
Date: Tue, 24 Mar 2020 17:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200317004105.27059-12-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W3NI67aYb0FTqlfaRp9e0MEjPFxgVNtAa"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, ehabkost@redhat.com, qemu-block@nongnu.org,
 philmd@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W3NI67aYb0FTqlfaRp9e0MEjPFxgVNtAa
Content-Type: multipart/mixed; boundary="9qyCzm0Hmsk227y8pH4c9KW5gRASTg59K"

--9qyCzm0Hmsk227y8pH4c9KW5gRASTg59K
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.03.20 01:41, John Snow wrote:
> We can turn logging on/off globally instead of per-function.
>=20
> Remove use_log from run_job, and use python logging to turn on
> diffable output when we run through a script entry point.
>=20
> iotest 245 changes output order due to buffering reasons.
>=20
>=20
> An extended note on python logging:

Thanks!

> A NullHandler is added to `qemu.iotests` to stop output from being
> generated if this code is used as a library without configuring logging.
> A NullHandler is only needed at the root, so a duplicate handler is not
> needed for `qemu.iotests.diff_io`.
>=20
> When logging is not configured, messages at the 'WARNING' levels or
> above are printed with default settings. The NullHandler stops this from
> occurring, which is considered good hygiene for code used as a library.
>=20
> See https://docs.python.org/3/howto/logging.html#library-config
>=20
> When logging is actually enabled (always at the behest of an explicit
> call by a client script), a root logger is implicitly created at the
> root, which allows messages to propagate upwards and be handled/emitted
> from the root logger with default settings.
>=20
> When we want iotest logging, we attach a handler to the
> qemu.iotests.diff_io logger and disable propagation to avoid possible
> double-printing.
>=20
> For more information on python logging infrastructure, I highly
> recommend downloading the pip package `logging_tree`, which provides
> convenient visualizations of the hierarchical logging configuration
> under different circumstances.
>=20
> See https://pypi.org/project/logging_tree/ for more information.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/030        |  4 +--
>  tests/qemu-iotests/155        |  2 +-
>  tests/qemu-iotests/245        |  1 +
>  tests/qemu-iotests/245.out    | 24 ++++++++--------
>  tests/qemu-iotests/iotests.py | 53 ++++++++++++++++++++---------------
>  5 files changed, 46 insertions(+), 38 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


--9qyCzm0Hmsk227y8pH4c9KW5gRASTg59K--

--W3NI67aYb0FTqlfaRp9e0MEjPFxgVNtAa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl56Md0ACgkQ9AfbAGHV
z0DGtQf9HV2DDF+MA2FTebEiohZ+nqb3NoaA4QJ2xhnHUr7U6+eFs5sl6T/VMzZb
f+DQK7JvD8j+bzOhZkzG2rK3CAPlYOLU1AfTViu/290OeHsWbQe6HmNb7lNNYhK0
ZxLxUjhgQVJ+L1uUCGcSPY1oM6a+S2Z0NPeUBiANkwW12/eg7iRcNvr4pLGz2hZI
oYSTKKiSvjlApBPX1gfxymO2xv4cPWF0OHNWhkBnBmaXiVchpqMzNmeCVCk9IsZv
3IwnX5Du7KMB1BMON9nWdqsZ1thp3tFyrRzYmjMp3ezpKDZLkiEjsPsaez523lQO
yNy/3IVq8niR+2VaNoyY/o7go4XDUQ==
=O521
-----END PGP SIGNATURE-----

--W3NI67aYb0FTqlfaRp9e0MEjPFxgVNtAa--


