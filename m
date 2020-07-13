Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7021A0B6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 15:22:35 +0200 (CEST)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtWVW-0003Wf-5B
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 09:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtWUa-000301-3q
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 09:21:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35038
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtWUY-0001t3-HW
 for qemu-devel@nongnu.org; Thu, 09 Jul 2020 09:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594300893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nohWBNQJxLDFveFzf7xLGBA1czeRfdxG/kGdca8ONzQ=;
 b=avKKe0HR2pVLZynym6+2avEUpwYEoA+zKJ/gleYPgf566wCog+MD1XavXN49MNrA038gvs
 R/s4p93TiePvABPCx9DGyvQ87j+cFxNPD0qO+9o13TQlYML6d8nOZFDY4HNXWdIJYmLg4i
 YnXlHJ4UP0a52hS9umAfvYUt4sA7JNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-FNTpWg67PZCtcINYOwX7vg-1; Thu, 09 Jul 2020 09:21:31 -0400
X-MC-Unique: FNTpWg67PZCtcINYOwX7vg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6351E800EB6;
 Thu,  9 Jul 2020 13:21:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-127.ams2.redhat.com
 [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2DF95D98A;
 Thu,  9 Jul 2020 13:21:28 +0000 (UTC)
Subject: Re: [PATCH v10 34/34] iotests: Add tests for qcow2 images with
 extended L2 entries
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1593791819.git.berto@igalia.com>
 <005fe0f46ca2fbcf1ee9a40a03e4bc6bc2112748.1593791819.git.berto@igalia.com>
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
Message-ID: <f2c621ad-b4be-0325-d0e2-4eec81e08e03@redhat.com>
Date: Thu, 9 Jul 2020 15:21:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <005fe0f46ca2fbcf1ee9a40a03e4bc6bc2112748.1593791819.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oYiNeQHRccoYjhUbPfSyIF6OnYk1P5pRp"
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 04:20:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Derek Su <dereksu@qnap.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oYiNeQHRccoYjhUbPfSyIF6OnYk1P5pRp
Content-Type: multipart/mixed; boundary="nJNnnZsTBHHCgdTWLOPz2PhJFUU0PvDuq"

--nJNnnZsTBHHCgdTWLOPz2PhJFUU0PvDuq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03.07.20 17:58, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  tests/qemu-iotests/271     | 901 +++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/271.out | 724 +++++++++++++++++++++++++++++
>  tests/qemu-iotests/group   |   1 +
>  3 files changed, 1626 insertions(+)
>  create mode 100755 tests/qemu-iotests/271
>  create mode 100644 tests/qemu-iotests/271.out

[...]

> diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
> new file mode 100644
> index 0000000000..07c1e7b46d
> --- /dev/null
> +++ b/tests/qemu-iotests/271.out
> @@ -0,0 +1,724 @@

[...]

> +### qemu-img amend ###
> +
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576
> +qemu-img: Toggling extended L2 entries is not supported
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1048576
> +qemu-img: Toggling extended L2 entries is not supported

With Maxim=E2=80=99s patches, this code in patch 31 became unnecessary, so =
it
should now read =E2=80=9Cqemu-img: Invalid parameter 'extended_l2'\nThis op=
tion
is only supported for image creation=E2=80=9D.

With that fixed:

Reviewed-by: Max Reitz <mreitz@redhat.com>


--nJNnnZsTBHHCgdTWLOPz2PhJFUU0PvDuq--

--oYiNeQHRccoYjhUbPfSyIF6OnYk1P5pRp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl8HGdcACgkQ9AfbAGHV
z0ABRQf9ESRDbqNvgIVmzFM/2I4TyVJpDVRg1eRu1uSo+PClQag/ZcnRHYXp0yeL
ygeJt7WRMv4XlQTvPLEM0OT34vd94QPIezethkLi+VA44O05uIPbrHPvnjn8j4/U
cC5fD8ZHdS5oaLDmfH8c/8PKVcKFZ0Btn15HgvEg6EPHdivseKbuCTTXCHRM1EY/
r5nLyMsfMGW+lUF/0WHv44yH7XdDZoC6LpvauJuSswwst/oTF4oF6IG08rDxN8Xz
6v59VwsPQn1ZDtSSG5aTCzZDmlSIiH8H3aCCJeEimbSixy7lr4Dgpe7JQcXkiVoN
AKYnfKOMZcQvNAOhVk76QBnbh7jWaA==
=Fe+J
-----END PGP SIGNATURE-----

--oYiNeQHRccoYjhUbPfSyIF6OnYk1P5pRp--


