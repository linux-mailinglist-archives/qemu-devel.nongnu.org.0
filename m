Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C0E21F1FF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 14:58:11 +0200 (CEST)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvKVf-0001Kg-1o
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 08:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jvKUj-0000pB-EW
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 08:57:13 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29936
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jvKUh-0003dK-I6
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 08:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594731430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=hM4SskHi4B+9ZBfR/onSBH+8Gs8ITTY9Uzu0XBQ0Kko=;
 b=ift1fHL5Je33OpH0vnv60zZruu4NGdMhe9Kx/poY86sItuf7FpFpQ9uTF80+d4yQTyEd/3
 1UOSSCsEPcwj6HNF+i6yWwoVi7u0JyVfhd77/KX9s1hrq21JXXBxwZEzfaHT6yfLO/zXcT
 ReAKMIHZIuSbgdet0kyy28+wsSL4434=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-AzeRurNRN6eWop_GKaR47A-1; Tue, 14 Jul 2020 08:57:01 -0400
X-MC-Unique: AzeRurNRN6eWop_GKaR47A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C79DD107ACCA;
 Tue, 14 Jul 2020 12:57:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-179.ams2.redhat.com
 [10.36.113.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C54760BEC;
 Tue, 14 Jul 2020 12:56:58 +0000 (UTC)
Subject: Re: [PATCH v11 00/34] Add subcluster allocation to qcow2
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1594396418.git.berto@igalia.com>
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
Message-ID: <e428a843-f27a-4e8e-8be2-bf6566c76a2f@redhat.com>
Date: Tue, 14 Jul 2020 14:56:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1594396418.git.berto@igalia.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="P9tCDLgHt17PtVLGknt88pz94Zfctg54s"
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:57:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
--P9tCDLgHt17PtVLGknt88pz94Zfctg54s
Content-Type: multipart/mixed; boundary="zztbmGMezMaXebg6DpmffZT5s5IebGLS3"

--zztbmGMezMaXebg6DpmffZT5s5IebGLS3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10.07.20 18:12, Alberto Garcia wrote:
> Hi,
>=20
> here's the new version of the patches to add subcluster allocation
> support to qcow2.
>=20
> Please refer to the cover letter of the first version for a full
> description of the patches:
>=20
>    https://lists.gnu.org/archive/html/qemu-block/2019-10/msg00983.html
>=20
> This version is rebased on top of the latest master (f2a1cf9180),
> fixes the relevant conflicts (particularly after df373fb0a3) and
> updates the test expectations.
>=20
> Berto

Thanks, fixed up patch 21 (by initializing expected_type to just
anything, I chose QCOW2_SUBCLUSTER_NORMAL, which I preferred over just
using 0), resolved some iotest conflicts (I=E2=80=99m sure, more are to com=
e
before the release, but we=E2=80=99ll see), and applied the series to my
block-next branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block-next


--zztbmGMezMaXebg6DpmffZT5s5IebGLS3--

--P9tCDLgHt17PtVLGknt88pz94Zfctg54s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl8Nq5kACgkQ9AfbAGHV
z0Cz4AgArJ4e5y0IGSnnGGVMYEngNqsXVWs4ta6c6YVFUNRvMgHdmPSbeVb//dKi
wlaihe8bJes3Upcm15ZrJf4hzVBjp1VQsoVYBiQfam7WIj+/IvBFKnFVc3KL0Lv7
6MHx4no/DYZJXQp1pVFoOZa/5Vszn7k4l+y2/TEc6Rb7J5DIv4ZlOc6hG6/dybHW
0xtKTl3x1nJ0iBhegvXlaeGw5/47UUa0wpV1ZLN5HK1RGEcme4a2j5HBbjU3hzn7
ZjgmuJ5+m5vcNSwduKeFI7NiAk0vWTmm7xvLiIAiweQjvPITdYFs/YwYLuFxydHM
4FqB3t9MwVsMvteeU7hrR42pui/Nag==
=uR4f
-----END PGP SIGNATURE-----

--P9tCDLgHt17PtVLGknt88pz94Zfctg54s--


