Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2620CEE3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 15:50:07 +0200 (CEST)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpuAg-0003MZ-GN
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 09:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jpu9c-0002wT-0p
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 09:49:00 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55968
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jpu9Z-0001LZ-TX
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 09:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593438536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=k6UOVrXT42HzQkSrqtTTLzaXmtk5D7/CPGnYCKXjuRE=;
 b=gDe96kYX7z+5zFJge0sgOdiCi9khq1ti0PR2vN3IDMCVPFZupENImnRk6tGkz64F4mcun2
 W52MhATrpdM65yukwYR7l3pCXIkJ+KGU6+viWgX2Zbk+9uevD+OkiUVZbfGatk6YpBQwry
 knANHME9wc43VyM3eRbCS6vwRc6w0P4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-Ch6NjJ8nMrSdmvSdoDifcA-1; Mon, 29 Jun 2020 09:48:53 -0400
X-MC-Unique: Ch6NjJ8nMrSdmvSdoDifcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7DB18FE876;
 Mon, 29 Jun 2020 13:48:38 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-124.ams2.redhat.com
 [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C827BEA1;
 Mon, 29 Jun 2020 13:48:37 +0000 (UTC)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Max Reitz <mreitz@redhat.com>
Subject: Properly quitting qemu immediately after failing migration
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
Message-ID: <0dce6c63-4b83-8b1a-6d00-07235f637997@redhat.com>
Date: Mon, 29 Jun 2020 15:48:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="B4jXxl8m24cCgVI6uzJNliuuiIlqgXVKt"
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
--B4jXxl8m24cCgVI6uzJNliuuiIlqgXVKt
Content-Type: multipart/mixed; boundary="DeDPYUaO4WfaFsDaD6hMukrdybTutS1XW"

--DeDPYUaO4WfaFsDaD6hMukrdybTutS1XW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

In an iotest, I=E2=80=99m trying to quit qemu immediately after a migration=
 has
failed.  Unfortunately, that doesn=E2=80=99t seem to be possible in a clean=
 way:
migrate_fd_cleanup() runs only at some point after the migration state
is already =E2=80=9Cfailed=E2=80=9D, so if I just wait for that =E2=80=9Cfa=
iled=E2=80=9D state and
immediately quit, some cleanup functions may not have been run yet.

This is a problem with dirty bitmap migration at least, because it
increases the refcount on all block devices that are to be migrated, so
if we don=E2=80=99t call the cleanup function before quitting, the refcount=
 will
stay elevated and bdrv_close_all() will hit an assertion because those
block devices are still around after blk_remove_all_bs() and
blockdev_close_all_bdrv_states().

In practice this particular issue might not be that big of a problem,
because it just means qemu aborts when the user intended to let it quit
anyway.  But on one hand I could imagine that there are other clean-up
paths that should definitely run before qemu quits (although I don=E2=80=99=
t
know), and on the other, it=E2=80=99s a problem for my test.

I tried working around the problem for my test by waiting on =E2=80=9CUnabl=
e to
write=E2=80=9D appearing on stderr, because that indicates that
migrate_fd_cleanup()=E2=80=99s error_report_err() has been reached.  But on=
 one
hand, that isn=E2=80=99t really nice, and on the other, it doesn=E2=80=99t =
even work
when the failure is on the source side (because then there is no
s->error for migrate_fd_cleanup() to report).

In all, I=E2=80=99m asking:
(1) Is there a nice solution for me now to delay quitting qemu until the
failed migration has been fully resolved, including the clean-up?

(2) Isn=E2=80=99t it a problem if qemu crashes when you issue =E2=80=9Cquit=
=E2=80=9D via QMP at
the wrong time?  Like, maybe lingering subprocesses when using =E2=80=9Cexe=
c=E2=80=9D?


Thanks,

Max


--DeDPYUaO4WfaFsDaD6hMukrdybTutS1XW--

--B4jXxl8m24cCgVI6uzJNliuuiIlqgXVKt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl758TMACgkQ9AfbAGHV
z0CgTQf9FkeOo1G1Hw9CYh3KQR8NpyDqxs2JPDgCQyz1GUFUysBCd/TO8RwqLXnw
hQdT3M253+Tu7U1cTkYi7npplytTR99XGa4LYeclhi8Az6q+mlPlcLlaj17wIRjo
3EpbJ07Evzean6QESVcTI/0j4nfUAmGhX34AxiOvBe6WVZ8a0gHN6+T7L4avL6FQ
mv6T9ukccX2CxUJzoN6u59yt3jBWgl2L3Ru263gLNrj0hfytYSa5OxcfTQW4zirA
38lJLYh8rP9DZ2yp4t7C0mB7fv0eqAw7ilNXGLJTxZD66asTJs5Bhv+QK50B62vI
W1IW/csgw0hZcKnOjvcAlUxRKsZ82A==
=Re5u
-----END PGP SIGNATURE-----

--B4jXxl8m24cCgVI6uzJNliuuiIlqgXVKt--


