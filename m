Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044DC1C85E2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 11:34:10 +0200 (CEST)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWcuv-0004qR-04
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 05:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jWcu1-0004LY-5g
 for qemu-devel@nongnu.org; Thu, 07 May 2020 05:33:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56831
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jWcty-0007Vh-5g
 for qemu-devel@nongnu.org; Thu, 07 May 2020 05:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588843989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3rW0oZFj3ph1i8R6l/ajEXQ583xgi4g7aKzy75z/mXE=;
 b=D5nRwi8NCnIOQd90TwYYvLN65afL9o5lpACqCcumJJC3Ye1r/MpZ+2zEzoJ9CL/P5kMKIY
 dWaRPM0ijIwXcTp5ESIYSdeKT+SeZV6di8H4yxaaXjyV4PNgtfbdqJtlUWjrwjd0+KF+5R
 SdYAFz9/hBHYr27gXq5nBLalrEb52Qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-EzmXPirJP9qkeXoLNzPI2A-1; Thu, 07 May 2020 05:33:07 -0400
X-MC-Unique: EzmXPirJP9qkeXoLNzPI2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4527B80058A;
 Thu,  7 May 2020 09:33:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-92.ams2.redhat.com
 [10.36.114.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E12962AA0;
 Thu,  7 May 2020 09:33:04 +0000 (UTC)
Subject: Re: [PATCH v3 26/33] block: Use child_of_bds in remaining places
To: Kevin Wolf <kwolf@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
 <20200218124242.584644-27-mreitz@redhat.com>
 <20200506170426.GI6333@linux.fritz.box>
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
Message-ID: <b05ff158-1c8c-4596-235a-1114ac0ff3a1@redhat.com>
Date: Thu, 7 May 2020 11:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506170426.GI6333@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YyzRBPStVlpZ2WLmnHg5hLqKStpEaHdyb"
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 02:00:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YyzRBPStVlpZ2WLmnHg5hLqKStpEaHdyb
Content-Type: multipart/mixed; boundary="07sPTXAdT6QtLpB01I4f4kxwXBFj4IV6r"

--07sPTXAdT6QtLpB01I4f4kxwXBFj4IV6r
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06.05.20 19:04, Kevin Wolf wrote:
> Am 18.02.2020 um 13:42 hat Max Reitz geschrieben:
>> Replace child_file by child_of_bds in all remaining places (excluding
>> tests).
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>=20
>> diff --git a/block/blkreplay.c b/block/blkreplay.c
>> index f97493f45a..71628f4d56 100644
>> --- a/block/blkreplay.c
>> +++ b/block/blkreplay.c
>> @@ -27,8 +27,9 @@ static int blkreplay_open(BlockDriverState *bs, QDict =
*options, int flags,
>>      int ret;
>> =20
>>      /* Open the image file */
>> -    bs->file =3D bdrv_open_child(NULL, options, "image",
>> -                               bs, &child_file, 0, false, &local_err);
>> +    bs->file =3D bdrv_open_child(NULL, options, "image", bs, &child_of_=
bds,
>> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
>> +                               false, &local_err);
>=20
> Why isn't blkreplay a filter?
I don=E2=80=99t know, but that=E2=80=99s pre-existing.  (It doesn=E2=80=99t=
 set .is_filter.)

I=E2=80=99m afraid I have little insight into what blkreplay actually does.=
  I
thought maybe in conjunction with the whole replay stuff it might turn
out not to be a filter.

So is it a filter?  If so, no problem.  I suppose we can fix it up in
the same patch that marks mirror-top and commit-top as filters.

Max


--07sPTXAdT6QtLpB01I4f4kxwXBFj4IV6r--

--YyzRBPStVlpZ2WLmnHg5hLqKStpEaHdyb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6z1c4ACgkQ9AfbAGHV
z0Dm2Qf+NG9JS7cOKKEkr/E+ByTGdNwhbNqQ48n4FHYLUjtWU4iG30plOl7ELPIl
nYpjMmK7vWWeJTNzx2iqq+nWTggJB5XZ9ahqtrhanOKhl9C7phFDp/ms69tpth6F
SO+2HfvKY4V0nzU86zjNKrKRNxXbUlBVK+0j5xvj6ZwofqjHxxkUuGASarwO3Jef
ew4a7ECNvngOhURFD1Ohi6clRdZDj82AxTXN74Mm5NrJXqGy+zaiuPup0EcMdvm/
49CJhGoVg2NWrqRIA+EvXibrMsWS24CsLWKS0l+Hf4fQEXz7EuIXfuDvBo/DHFaQ
DSym8a9D85U9XY7MFH1YYoqDu62FdQ==
=jg+r
-----END PGP SIGNATURE-----

--YyzRBPStVlpZ2WLmnHg5hLqKStpEaHdyb--


