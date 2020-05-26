Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274781CD5B1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 11:51:12 +0200 (CEST)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY55b-0005Hv-7T
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 05:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jY53o-00037c-AC
 for qemu-devel@nongnu.org; Mon, 11 May 2020 05:49:20 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57796
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jY53n-0003ey-C1
 for qemu-devel@nongnu.org; Mon, 11 May 2020 05:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589190558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hdC3RfKeg9SnJ0vitZcrHQa43RrkEUGWJLmnIc9TAZg=;
 b=XfXSlUsw69V/g5HbppjRsLI5CbOs0jWp6q/32y3Nh/K96VntvgSdpK5DbE4Dfv2cUS8kVx
 p92X8QrrBfNStSjX8jaa7H91vQo3BNkwsirCBDCsTVGZgzDUgns3ZvGmcWWZzupsQ2Zzy3
 kpur9b2GkWYjOkimDU/RPlH7ZTKc/Pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-edELrsfLNDyBvQfey4D9YQ-1; Mon, 11 May 2020 05:49:16 -0400
X-MC-Unique: edELrsfLNDyBvQfey4D9YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 860AA8005B7;
 Mon, 11 May 2020 09:49:15 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-247.ams2.redhat.com
 [10.36.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BB71002382;
 Mon, 11 May 2020 09:49:07 +0000 (UTC)
Subject: Re: [PATCH v3 4/9] blockdev: Promote several bitmap functions to
 non-static
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20200508180340.675712-1-eblake@redhat.com>
 <20200508180340.675712-5-eblake@redhat.com>
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
Message-ID: <94418e74-606c-6ab1-f4fc-1e691f80f5f4@redhat.com>
Date: Mon, 11 May 2020 11:48:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508180340.675712-5-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PyG3AH4JQhq1kVr6P2QI8DPb4WokEthFD"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 01:43:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PyG3AH4JQhq1kVr6P2QI8DPb4WokEthFD
Content-Type: multipart/mixed; boundary="Ai1z3pIJd2dH8rOqsIBeywHfcSh58GHIP"

--Ai1z3pIJd2dH8rOqsIBeywHfcSh58GHIP
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08.05.20 20:03, Eric Blake wrote:
> The next patch will split blockdev.c, which will require accessing
> some previously-static functions from more than one .c file.  But part
> of promoting a function to public is picking a naming scheme that does
> not reek of exposing too many internals (two of the three functions
> were named starting with 'do_').  To make future code motion easier,
> perform the function rename and non-static promotion into its own
> patch.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/block/block_int.h | 12 +++++++++++
>  blockdev.c                | 45 ++++++++++++++++-----------------------
>  2 files changed, 30 insertions(+), 27 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

> diff --git a/blockdev.c b/blockdev.c
> index b3c840ec0312..fbeb38437869 100644
> --- a/blockdev.c
> +++ b/blockdev.c

[...]

> @@ -2504,9 +2495,10 @@ out:
>      aio_context_release(aio_context);
>  }
>=20
> -static BdrvDirtyBitmap *do_block_dirty_bitmap_remove(
> -        const char *node, const char *name, bool release,
> -        BlockDriverState **bitmap_bs, Error **errp)
> +BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char =
*name,
> +                                           bool release,
> +                                           BlockDriverState **bitmap_bs,

I=E2=80=99m not entirely sure what this parameter is even used for, but it
obviously doesn=E2=80=99t concern this patch.

Max

> +                                           Error **errp)
>  {
>      BlockDriverState *bs;
>      BdrvDirtyBitmap *bitmap;


--Ai1z3pIJd2dH8rOqsIBeywHfcSh58GHIP--

--PyG3AH4JQhq1kVr6P2QI8DPb4WokEthFD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl65H4oACgkQ9AfbAGHV
z0DjZwf/dwhtfZzIVAG5W/MSI7ukxUjlpMPbocXyyjkMvcV1LNIvQM/1mt6oKxEH
+h1+2VMMrgrUH6bFZmVkXfnjzWMberQ8acMIyrrSZbl2OM1xXsAFxrQ+jEEm9ThW
+Y4TJjqjcXJ6EfL3beHgQyx4Nj5e0SXC5ehsnvvVHAnO4B/fM30aIDmIJ/xwJtSf
Cb6euOZHV0OS90j0d3L0xxr2ubk9/oPquPLZASARZn2gay94AFEV84YW23TvkQ3l
JNGMSe93hI1Dc+OKcx83RW7imNXvba5l38dhnoaBput4+wGBP2OXbz5IkbicAW91
dPVaREVjnrqm8lNR11+yO3q9x3WQMA==
=oqEP
-----END PGP SIGNATURE-----

--PyG3AH4JQhq1kVr6P2QI8DPb4WokEthFD--


