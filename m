Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E87219AB3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 10:22:23 +0200 (CEST)
Received: from localhost ([::1]:54826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtRp0-0001Vo-Ou
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 04:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtRnr-0000a2-Ss
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 04:21:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47948
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtRnp-00073y-TP
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 04:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594282865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fACF4Y1hxAJIg2fQfepcIGg3TyqIqmPxOtcf4/Im5SQ=;
 b=Em1Rj1z1d/23WbD1hnpdTmcR/ICuI6P/D5/7PP9L63Yq2n+e/lkDoydl8ekfkDHd6S9pSI
 jMgVzytLb2vccmH9jS7lfuFOl7uReC4hlLF20LJozacI3/wqnPuYdeC44/r1/B1x1q7UkH
 SfA0/AI5s9+ljA9FEFiV1WRB80WKCGE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-c27z7xV5PAmNjuT-JXMVwA-1; Thu, 09 Jul 2020 04:21:03 -0400
X-MC-Unique: c27z7xV5PAmNjuT-JXMVwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2149AA6B67;
 Thu,  9 Jul 2020 08:21:02 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-127.ams2.redhat.com
 [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE6C31A7CA;
 Thu,  9 Jul 2020 08:21:00 +0000 (UTC)
Subject: Re: [PATCH v7 00/47] block: Deal with filters
To: Eric Blake <eblake@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
References: <20200625152215.941773-1-mreitz@redhat.com>
 <4d7fa326-ef87-5753-cc2a-bb26fc555864@virtuozzo.com>
 <f36f56ba-1549-1612-8b24-4e93337b2f39@redhat.com>
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
Message-ID: <f9746566-1e3d-5b24-add0-aea49955a950@redhat.com>
Date: Thu, 9 Jul 2020 10:20:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <f36f56ba-1549-1612-8b24-4e93337b2f39@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DztaPVJcYxz5QPPGUnUqzjyOM4Rm5tayb"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 01:47:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DztaPVJcYxz5QPPGUnUqzjyOM4Rm5tayb
Content-Type: multipart/mixed; boundary="Mj4CoePhBzQVjDmG08ZIxMkxf7SpfvpuN"

--Mj4CoePhBzQVjDmG08ZIxMkxf7SpfvpuN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08.07.20 22:47, Eric Blake wrote:
> On 7/8/20 12:20 PM, Andrey Shinkevich wrote:
>> On 25.06.2020 18:21, Max Reitz wrote:
>>> v6:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg01715.html
>>>
>>> Branch: https://github.com/XanClic/qemu.git child-access-functions-v7
>>> Branch: https://git.xanclic.moe/XanClic/qemu.git
>>> child-access-functions-v7
>>>
>>>
>> I cloned the branch from the github and built successfully.
>>
>> Running the iotests reports multiple errors of such a kind:
>>
>> 128: readarray -td '' formatting_line < <(sed -e 's/, fmt=3D/\x0/')
>>
>> "./common.filter: line 128: readarray: -d: invalid option"
>>
>> introduced with the commit
>>
>> a7399eb iotests: Make _filter_img_create more active
>=20
> You appear to be staging off an unreleased preliminary tree.=C2=A0 a7399e=
b is
> not upstream; the upstream commit 'iotests: Make _filter_img_create more
> active' is commit 57ee95ed, and while it uses readarray, it does not use
> the problematic -d.=C2=A0 In other words, it looks like the problem was
> caught and fixed in between the original patch creation and the pull
> request.

Ah, sorry, my mail client=E2=80=99s threading layout hid this mail from me =
a bit.

Yes.  Well, no, it wasn=E2=80=99t fixed before the pull request, but it was
fixed in the second pull request.  But yes.

Max


--Mj4CoePhBzQVjDmG08ZIxMkxf7SpfvpuN--

--DztaPVJcYxz5QPPGUnUqzjyOM4Rm5tayb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl8G02sACgkQ9AfbAGHV
z0BXjwgAgnGzpI6R8EUh7zQtC9yVy5hDakMiI9GkPXN7WqWFuigPOLydiCVrh40z
6KWfT3zCR9D3FUHZpABBDHXm8YcqNfpr1RxKxbby5AVrgHJpiBVKFz1f6iCm9ijo
io8qG6MDMBBAOdT4qoJhr7tsYT0sBZeO/AdeWRph75KNh17oM8Ksf66LlmOj2zQo
hx/rcAdyWQPaJBHFBIDAKlEMJpuPaUdsLVmicBaaTu+4MPd33qwUsjPVFxWliwwT
RycPG9Es+PIEb97L2LA6zfO7e5iljSpYctohb1q2aJ1jtCzKg/2A2oZAkK2k0CaF
hY/DYkogIvZS8wjlfPNxuHyqcMqFIA==
=XfQS
-----END PGP SIGNATURE-----

--DztaPVJcYxz5QPPGUnUqzjyOM4Rm5tayb--


