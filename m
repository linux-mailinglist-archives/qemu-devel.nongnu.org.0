Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B511C20CF52
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 17:03:02 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpvJF-0000NJ-Da
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 11:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jpvHm-0008Ax-5L
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:01:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26380
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jpvHj-0004mT-27
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 11:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593442872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fiIs45L1BaaMySytovvzfbHFYwdZbWFS+HRYQuVrP9k=;
 b=PvSFN6KzUg1dwb8D6al2GvOn7Fc2kPNnfEdb88vHznPD4dndpuOyCx9TYyGIkiSxcY9zjG
 LmjfzW32S6OarpdLpKacNZTZsXq6a7sv9Ud+ycVOFriBXHfj8Ed7uzeX5Q/LV0vd4nuBuV
 1FgSZPQnkeFOf8jVczcGrXHzTqG0Sqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-7Nr0dFmeOEOCgJkap3qlwQ-1; Mon, 29 Jun 2020 11:01:05 -0400
X-MC-Unique: 7Nr0dFmeOEOCgJkap3qlwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1645464;
 Mon, 29 Jun 2020 15:01:02 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-124.ams2.redhat.com
 [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3867571670;
 Mon, 29 Jun 2020 15:00:58 +0000 (UTC)
Subject: Re: Properly quitting qemu immediately after failing migration
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <0dce6c63-4b83-8b1a-6d00-07235f637997@redhat.com>
 <92ce741d-ef67-fbf9-a889-27d9ae218681@virtuozzo.com>
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
Message-ID: <9eecca93-e7d9-d1da-7fcd-ee60978ec460@redhat.com>
Date: Mon, 29 Jun 2020 17:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <92ce741d-ef67-fbf9-a889-27d9ae218681@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KaxNwT54PM6akZLP0Gcngyx1lnvs1jwBS"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:03:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KaxNwT54PM6akZLP0Gcngyx1lnvs1jwBS
Content-Type: multipart/mixed; boundary="IcXWtQiHH4UK779pTbGphIRjpmEtA93ic"

--IcXWtQiHH4UK779pTbGphIRjpmEtA93ic
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 29.06.20 16:18, Vladimir Sementsov-Ogievskiy wrote:
> 29.06.2020 16:48, Max Reitz wrote:
>> Hi,
>>
>> In an iotest, I=E2=80=99m trying to quit qemu immediately after a migrat=
ion has
>> failed.=C2=A0 Unfortunately, that doesn=E2=80=99t seem to be possible in=
 a clean way:
>> migrate_fd_cleanup() runs only at some point after the migration state
>> is already =E2=80=9Cfailed=E2=80=9D, so if I just wait for that =E2=80=
=9Cfailed=E2=80=9D state and
>> immediately quit, some cleanup functions may not have been run yet.
>>
>> This is a problem with dirty bitmap migration at least, because it
>> increases the refcount on all block devices that are to be migrated, so
>> if we don=E2=80=99t call the cleanup function before quitting, the refco=
unt will
>> stay elevated and bdrv_close_all() will hit an assertion because those
>> block devices are still around after blk_remove_all_bs() and
>> blockdev_close_all_bdrv_states().
>>
>> In practice this particular issue might not be that big of a problem,
>> because it just means qemu aborts when the user intended to let it quit
>> anyway.=C2=A0 But on one hand I could imagine that there are other clean=
-up
>> paths that should definitely run before qemu quits (although I don=E2=80=
=99t
>> know), and on the other, it=E2=80=99s a problem for my test.
>>
>> I tried working around the problem for my test by waiting on =E2=80=9CUn=
able to
>> write=E2=80=9D appearing on stderr, because that indicates that
>> migrate_fd_cleanup()=E2=80=99s error_report_err() has been reached.=C2=
=A0 But on one
>> hand, that isn=E2=80=99t really nice, and on the other, it doesn=E2=80=
=99t even work
>> when the failure is on the source side (because then there is no
>> s->error for migrate_fd_cleanup() to report).

(I=E2=80=99ve now managed to work around it by invoking blockdev-del on a n=
ode
affected by bitmap migration until it succeeds, because blockdev-del can
only succeed once the bitmap migration code has dropped its reference to
it.)

>> In all, I=E2=80=99m asking:
>> (1) Is there a nice solution for me now to delay quitting qemu until the
>> failed migration has been fully resolved, including the clean-up?
>>
>> (2) Isn=E2=80=99t it a problem if qemu crashes when you issue =E2=80=9Cq=
uit=E2=80=9D via QMP at
>> the wrong time?=C2=A0 Like, maybe lingering subprocesses when using =E2=
=80=9Cexec=E2=80=9D?
>>
>>
>=20
> I'll look more closely tomorrow, but as a short answer: try my series
> "[PATCH v2 00/22] Fix error handling during bitmap postcopy" it
> handles different problems around migration failures & qemu shutdown,
> probably it will help.

Not, it doesn=E2=80=99t seem to.

I=E2=80=99m not sure what exactly that series addresses, but FWIW I=E2=80=
=99m hitting
the problem in non-postcopy migration.  What my simplest reproducer does is=
:

On the source VM:

blockdev-add node-name=3D'foo' driver=3D'null-co'
block-dirty-bitmap-add node=3D'foo' name=3D'bmap0'

(Launch destination VM with some -incoming, e.g.
-incoming 'exec: cat /tmp/mig_file')

Both on source and destination:

migrate-set-capabilities capabilities=3D[
    {capability=3D'events', state=3Dtrue},
    {capability=3D'dirty-bitmaps', state=3Dtrue}
]

On source:

migrate uri=3D'exec: cat > /tmp/mig_file'

Then wait for a MIGRATION event with data/status =3D=3D 'failed', and then
issue 'quit'.

Max


--IcXWtQiHH4UK779pTbGphIRjpmEtA93ic--

--KaxNwT54PM6akZLP0Gcngyx1lnvs1jwBS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl76AikACgkQ9AfbAGHV
z0AStggAul4nGQ9+rhXPMxBqCDCzBXhLenqnBGU1agNw+/gRPZzNwGNAB8d6tY7G
Sof10XXOMyooN2pb5QviGpWyL5V6jqO+1QpLFgGHLZHzj5QZq/IqFT3D3JIRg4rg
kKPjlnJI81uSOMy4HhL5+qrWJtBp1oG0gbrML+HbGOLawmfBtcIjOPoSL1LRFUyX
JY1eLcRUE7hqD5NwL3Sd38vXD/dbteGf7/qrzejOr01KDMvlK73bq9MzcekTqkGZ
id10UdNZcHQ89E92TgyExlqLakKe7L/nXJO2Hh2vKzHKZB9gn1lHKCLnT4akE88s
vxbAaEZtOQMwquGM2xh/bynRnBC46g==
=26nU
-----END PGP SIGNATURE-----

--KaxNwT54PM6akZLP0Gcngyx1lnvs1jwBS--


