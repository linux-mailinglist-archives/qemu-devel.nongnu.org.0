Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA522466C1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 14:57:26 +0200 (CEST)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7ehZ-0001e2-HD
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 08:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k7egb-0001A8-3x
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:56:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44929
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k7egW-0002Cn-JL
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 08:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597668979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=KLLx8mLuMswWF7p0milJxQBvjqp5X1NB5gWALyWcmu8=;
 b=FYsav9Fbu92gtBUDWAlqQ/oKTiS5DZYD2lciLRXNtfTOhjCGhlaLQq2VuscuXfs1w60PeA
 Azz4mCfwCIfyLQn85zTlnVvTqsrS5Fl0eE06Ih1Bcwd3LnwFSpxBpKUgArlqTyvvmALF/g
 Vj1MUCjsD2/xaT3TcJFq4WvMpIBM3cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-RzZUNxxwO8uMMH34oGvStw-1; Mon, 17 Aug 2020 08:56:14 -0400
X-MC-Unique: RzZUNxxwO8uMMH34oGvStw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80879185E52B;
 Mon, 17 Aug 2020 12:56:13 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-146.ams2.redhat.com
 [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C70F7A3B5;
 Mon, 17 Aug 2020 12:56:12 +0000 (UTC)
Subject: Re: [RFC PATCH 09/22] nbd: Add writethrough to block-export-add
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200813162935.210070-1-kwolf@redhat.com>
 <20200813162935.210070-10-kwolf@redhat.com>
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
Message-ID: <faa916e7-3c39-84f4-183f-808153abe12d@redhat.com>
Date: Mon, 17 Aug 2020 14:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813162935.210070-10-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Do6uDWcxBknsNfvClftG0uZ3b0ZF2yDmr"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 05:13:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Do6uDWcxBknsNfvClftG0uZ3b0ZF2yDmr
Content-Type: multipart/mixed; boundary="FNIdvyaFu8hPKaWUVp7XmORIIhMeiN8HR"

--FNIdvyaFu8hPKaWUVp7XmORIIhMeiN8HR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.08.20 18:29, Kevin Wolf wrote:
> qemu-nbd allows use of writethrough cache modes, which mean that write
> requests made through NBD will cause a flush before they complete.
> Expose the same functionality in block-export-add.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/block-export.json | 7 ++++++-
>  blockdev-nbd.c         | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index 1fdc55c53a..4ce163411f 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -167,10 +167,15 @@
>  # Describes a block export, i.e. how single node should be exported on a=
n
>  # external interface.
>  #
> +# @writethrough: If true, caches are flushed after every write request t=
o the
> +#                export before completion is signalled. (since: 5.2;
> +#                default: false)
> +#
>  # Since: 4.2
>  ##
>  { 'union': 'BlockExportOptions',
> -  'base': { 'type': 'BlockExportType' },
> +  'base': { 'type': 'BlockExportType',
> +            '*writethrough': 'bool' },
>    'discriminator': 'type',
>    'data': {
>        'nbd': 'BlockExportOptionsNbd'

Hm.  I find it weird to have @writethrough in the base but @device in
the specialized class.

I think everything that will be common to all block exports should be in
the base, and that probably includes a node-name.  I=E2=80=99m aware that w=
ill
make things more tedious in the code, but perhaps it would be a nicer
interface in the end.  Or is the real problem that that would create
problems in the storage daemon=E2=80=99s command line interface, because th=
en
the specialized (legacy) NBD interface would no longer be compatible
with the new generalized block export interface?

Anyway, @writable might be a similar story.  A @read-only may make sense
in general, I think.

Basically, I think that the export code should be separate from the code
setting up the BlockBackend that should be exported, so all options
regarding that BB should be common; and those options are @node-name,
@writethrough, and @read-only.  (And perhaps other things like
@resizable, too, even though that isn=E2=80=99t something to consider for N=
BD.)

Max


--FNIdvyaFu8hPKaWUVp7XmORIIhMeiN8HR--

--Do6uDWcxBknsNfvClftG0uZ3b0ZF2yDmr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl86fmoACgkQ9AfbAGHV
z0ChSwgAiB1Wl4kaSH/MH0KE20qv3AlXImFdzrNcP4MCfosQdE+GgaePkUgfYsNz
LaFx+Eggbb6GBxCZcG+3lRDDVio1jDa9B5VFGEt3mRUDXuVb1UlP9nmQP1V5tPtT
f617947yfqnXcbH3fsVNiuWYWy9Zqn780KiSaMxa+JA/rdsiiEux5DzsWE94SH1a
Scxn8jcSig0yIDo+SakHDMXh4j70GBJvu3ZccQT7sSw567169DsWbpMypFwmyCc6
gVwtihur+PF9nX0KHYabfwJfQyUrkbP0kRUKIzd8mobu6rwuglhpuGE1MwDw+pRQ
t4d7F8VP4HEaojO+Pz1iwPOB44c/yA==
=GE/J
-----END PGP SIGNATURE-----

--Do6uDWcxBknsNfvClftG0uZ3b0ZF2yDmr--


