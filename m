Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0434E20338D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 11:37:09 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnIt2-0007OR-3f
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 05:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnIs7-0006KQ-By
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:36:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28710
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jnIs4-0002wj-Al
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592818567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W4/WQVChYIKC4dNBwDYzCBPtQ50VXEnYVKIvz/t5JNE=;
 b=YogcXWk2VB4UJi+auAfuxIY6n1zfwVRUMkTu1EnHx1pyovfGKl2dzIX9RL///rwYEkX7Nt
 n4qoCP4eKZO7x8uTfA4KMRm6rvQbVJjionVl8doNdQuAkylpVLNXeRXxvQ1LX3/0ii86wd
 b6hRct804O2gd6i4g7+D4X/EahfrPTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-FDwl0Rp-PLWcPEWqAz9ABw-1; Mon, 22 Jun 2020 05:36:03 -0400
X-MC-Unique: FDwl0Rp-PLWcPEWqAz9ABw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1454A8005AD;
 Mon, 22 Jun 2020 09:36:02 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-85.ams2.redhat.com
 [10.36.114.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BF8910013D7;
 Mon, 22 Jun 2020 09:36:00 +0000 (UTC)
Subject: Re: [PATCH 1/2] qcow2: Force preallocation with data-file-raw
To: Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
References: <20200619104012.235977-1-mreitz@redhat.com>
 <20200619104012.235977-2-mreitz@redhat.com>
 <w51eeqb9f43.fsf@maestria.local.igalia.com>
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
Message-ID: <9c14c622-eb30-4619-d33a-b59395a397be@redhat.com>
Date: Mon, 22 Jun 2020 11:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <w51eeqb9f43.fsf@maestria.local.igalia.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BeAfxXwZQfghERXyozGwQ4Icu0DtWUrdy"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BeAfxXwZQfghERXyozGwQ4Icu0DtWUrdy
Content-Type: multipart/mixed; boundary="2NwBpEMxt8UHHI8qqPebGOLYhSuFSE7LY"

--2NwBpEMxt8UHHI8qqPebGOLYhSuFSE7LY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 19.06.20 18:47, Alberto Garcia wrote:
> On Fri 19 Jun 2020 12:40:11 PM CEST, Max Reitz wrote:
>> +    if (qcow2_opts->data_file_raw &&
>> +        qcow2_opts->preallocation =3D=3D PREALLOC_MODE_OFF)
>> +    {
>> +        /*
>> +         * data-file-raw means that "the external data file can be
>> +         * read as a consistent standalone raw image without looking
>> +         * at the qcow2 metadata."  It does not say that the metadata
>> +         * must be ignored, though (and the qcow2 driver in fact does
>> +         * not ignore it), so the L1/L2 tables must be present and
>> +         * give a 1:1 mapping, so you get the same result regardless
>> +         * of whether you look at the metadata or whether you ignore
>> +         * it.
>> +         */
>> +        qcow2_opts->preallocation =3D PREALLOC_MODE_METADATA;
>=20
> I'm not convinced by this,

Why not?

This is how I read the spec.  Furthermore, I see two problems that we
have right now that are fixed by this patch (namely (1) using a device
file as the external data file, which may have non-zero data at
creation; and (2) assigning a backing file at runtime must not show the
data).

> but your comment made me think of another
> possible alternative: in qcow2_get_cluster_offset(), if the cluster is
> unallocated and we are using a raw data file then we return _ZERO_PLAIN:
>=20
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -654,6 +654,10 @@ out:
>      assert(bytes_available - offset_in_cluster <=3D UINT_MAX);
>      *bytes =3D bytes_available - offset_in_cluster;
> =20
> +    if (type =3D=3D QCOW2_CLUSTER_UNALLOCATED && data_file_is_raw(bs)) {
> +        type =3D QCOW2_CLUSTER_ZERO_PLAIN;
> +    }
> +
>      return type;
>=20
> You could even add a '&& bs->backing' to the condition and emit a
> warning to make it more explicit.

No, this is wrong.  This still wouldn=E2=80=99t fix the problem of having a
device file as the external data file, when it already has non-zero data
during creation.  (Reading the qcow2 file would return zeroes, but
reading the device would not.)

So it would need to be QCOW2_CLUSTER_NORMAL.  Which is kind of the
point, when you think about it =E2=80=93 with data-file-raw, all clusters m=
ust
always effectively be QCOW2_CLUSTER_NORMAL and be mapped 1:1.

Well, and that=E2=80=99s in turn the point of this patch.

I interpret the spec in that the metadata can be ignored, but it does
not need to be ignored.  So the L1/L2 tables must be 1:1 mapping of
QCOW2_CLUSTER_NORMAL entries.

We could also choose to interpret it as =E2=80=9CWith data-file-raw, the L1=
/L2
tables must be ignored=E2=80=9D.  In that case, our qcow2 driver would need=
 to
be modified to indeed fully ignore the L1/L2 tables with data-file-raw.
 (I certainly don=E2=80=99t interpret the spec this way, but I suppose we c=
ould
call it a bug fix and amend it.)

Max


--2NwBpEMxt8UHHI8qqPebGOLYhSuFSE7LY--

--BeAfxXwZQfghERXyozGwQ4Icu0DtWUrdy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl7we38ACgkQ9AfbAGHV
z0ASgwf/Yrrzv5x92i239eXyD00vIDtxAxlCPxXANpPRWUPZIVyEOx8QXOqsWhaF
R94zKK8DIA3VTQlJ14sx+vmkv1ccWRIMfkzSsiS/6bD6eVR5b9DJTIMwF/WapKNa
wtwK+OAe1S3W6a5CB/pvxukNNm5HSOuLhc2bciDOp0TPTosuN4TcKpfeMiTpVBiO
omhikpfKtRn7Oa9/vvtLzZC2nSzfXbGC+3rrtFYa7coG3vA7iAYSZC7YNCfrIWTf
dxkT+DNRwtwNgZl76wiRykv3c5DI4j2nInE5bdMk++5hwUowtAiXWsCvV1xHRjKJ
l2kfSHgLWV7VgQXIC2SFheNbO53hMA==
=psJO
-----END PGP SIGNATURE-----

--BeAfxXwZQfghERXyozGwQ4Icu0DtWUrdy--


