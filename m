Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80381C54FB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 14:01:04 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVwFz-000107-Ez
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 08:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jVwEY-0000HZ-TS
 for qemu-devel@nongnu.org; Tue, 05 May 2020 07:59:34 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37716
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jVwEX-00064o-7r
 for qemu-devel@nongnu.org; Tue, 05 May 2020 07:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588679971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=R3f729CXfhlb7Pl5EibE+RjozL0/RgiifotmUuM3DzA=;
 b=JoUMdJOmIaO7jZBcP7wNYdC+FFsPL4epUdIE2MtyN7b2Z+R0btneLcuv0+Q1zvRm3tqIE5
 I7ecVtkou5s9ziXbBSguGpAhd7EBhvNv24YhM/IIMHaI9jEqvtThfShacpilWRIuch75Rb
 6ClNO295yiDaPagNCp3W0FXsaTqjK3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-dQFXyfi2NKKvDo91QsavyA-1; Tue, 05 May 2020 07:59:29 -0400
X-MC-Unique: dQFXyfi2NKKvDo91QsavyA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3349C460;
 Tue,  5 May 2020 11:59:28 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-206.ams2.redhat.com
 [10.36.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AFFC5C1B2;
 Tue,  5 May 2020 11:59:26 +0000 (UTC)
Subject: Re: [PATCH v3 03/33] block: Add BdrvChildRole and BdrvChildRoleBits
To: Kevin Wolf <kwolf@redhat.com>
References: <20200218124242.584644-1-mreitz@redhat.com>
 <20200218124242.584644-4-mreitz@redhat.com>
 <20200505111936.GJ5759@linux.fritz.box>
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
Message-ID: <aa2c60ac-0e41-bf3b-d81d-fe504c42c172@redhat.com>
Date: Tue, 5 May 2020 13:59:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505111936.GJ5759@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jRgtZzFxl90uOw65HL6ZHFJMeKClzx0az"
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jRgtZzFxl90uOw65HL6ZHFJMeKClzx0az
Content-Type: multipart/mixed; boundary="N8LWGs3Qj6Mp7Zs4f0xI604e8qjJ0ln9F"

--N8LWGs3Qj6Mp7Zs4f0xI604e8qjJ0ln9F
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05.05.20 13:19, Kevin Wolf wrote:
> Am 18.02.2020 um 13:42 hat Max Reitz geschrieben:
>> This mask will supplement BdrvChildClass when it comes to what role (or
>> combination of roles) a child takes for its parent.  It consists of
>> BdrvChildRoleBits values (which is an enum).
>>
>> Because empty enums are not allowed, let us just start with it filled.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>  include/block/block.h | 38 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/include/block/block.h b/include/block/block.h
>> index fd89eb6c75..8c23948d08 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -268,6 +268,44 @@ enum {
>>      DEFAULT_PERM_UNCHANGED      =3D BLK_PERM_ALL & ~DEFAULT_PERM_PASSTH=
ROUGH,
>>  };
>> =20
>> +enum BdrvChildRoleBits {
>> +    /* Child stores data */
>> +    BDRV_CHILD_DATA         =3D (1 << 0),
>> +
>> +    /* Child stores metadata */
>> +    BDRV_CHILD_METADATA     =3D (1 << 1),
>> +
>> +    /*
>> +     * A child to which the parent forwards all reads and writes.  It
>=20
> Is "_all_ reads and writes" really required? Imagine a caching block
> driver, should it not be considered a filter because it may just
> complete the requests from its cache rather than asking the child?

Hm.  The important thing is that parent and child always show exactly
the same data, which is the second part of the definition given here.
So maybe we should flip both sentences, e.g.:

=E2=80=9CA child which always presents exactly the same visibile data as th=
e
parent, e.g. by virtue of the parent forwarding all reads and writes.=E2=80=
=9D

?

>> +     * must present exactly the same visible data as the parent.
>> +     * Any node may have at most one filtered child at a time.
>> +     */
>> +    BDRV_CHILD_FILTERED     =3D (1 << 2),
>> +
>> +    /*
>> +     * Child from which to read all data that isn=E2=80=99t allocated i=
n the
>> +     * parent (i.e., the backing child); such data is copied to the
>> +     * parent through COW (and optionally COR).
>> +     */
>> +    BDRV_CHILD_COW          =3D (1 << 3),
>> +
>> +    /*
>> +     * The primary child.  For most drivers, this is the child whose
>> +     * filename applies best to the parent node.
>> +     * Each parent must give this flag to no more than one child at a
>> +     * time.
>> +     */
>> +    BDRV_CHILD_PRIMARY      =3D (1 << 4),
>=20
> And I assume some drivers like quorum don't set it on any child.

I thought =E2=80=9Cno more than one=E2=80=9D implies that.

>> +    /* Useful combination of flags */
>> +    BDRV_CHILD_IMAGE        =3D BDRV_CHILD_DATA
>> +                              | BDRV_CHILD_METADATA
>> +                              | BDRV_CHILD_PRIMARY,
>> +};
>> +
>> +/* Mask of BdrvChildRoleBits values */
>> +typedef unsigned int BdrvChildRole;
>> +
>>  char *bdrv_perm_names(uint64_t perm);
>>  uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm);
>=20
> The list intuitively makes sense to me. Let me try to think of some
> interesting cases to see whether the documentation is complete or
> whether it could be improved.
>=20
>=20
> qcow2 is what everyone has in mind, so it should be obvious:
>=20
> * Without a data file:
>   * file: BDRV_CHILD_IMAGE
>   * backing: BDRV_CHILD_COW
>=20
> * With a data file:
>   * file: BDRV_CHILD_PRIMARY | BDRV_CHILD_METADATA
>   * data-file: BDRV_CHILD_DATA
>   * backing: BDRV_CHILD_COW
>=20
>=20
> We can use VMDK to make things a bit more interesting:
>=20
> * file: BDRV_CHILD_PRIMARY | BDRV_CHILD_METADATA
> * extents.*: BDRV_CHILD_METADATA | BDRV_CHILD_DATA
> * backing: BDRV_CHILD_COW
>=20
> In other words, we can have multiple data and metadata children. Is this
> correct or should extents not be marked as metadata? (Checked the final
> code: yes we do have multiple of them in vmdk.) Should this be mentioned
> in the documentation?

If the extents contain metadata (I thought not, but I think I was just
wrong; sparse extents must contain their respective mapping structures),
then yes, they should all be marked as metadata children.

I=E2=80=99m not sure whether that needs to be mentioned explicitly in the d=
oc,
because =E2=80=9CChild stores metadata=E2=80=9D seems sufficient to me.

> Do we then also want to allow multiple BDRV_CHILD_COW children? We don't
> currently have a driver that needs it, but maybe it would be consistent
> with DATA and METADATA then. However, it would contradict the
> documentation that it's the "Child from which to read all data".

Yes.  I would revisit that problem when the need arises.

It seems to me like this would open a whole can of worms, just like
allowing multiple filtered children does.

> blkverify:
>=20
> * x-image: BDRV_CHILD_PRIMARY | BDRV_CHILD_DATA | BDRV_CHILD_FILTERED
> * x-raw: BDRV_CHILD_DATA | BDRV_CHILD_FILTERED
>=20
> Hm, according to the documentation, this doesn't work, FILTERED can be
> set only for one node. But the condition ("the parent forwards all reads
> and writes") applies to both children. I think the documentation should
> mention what needs to be done in such cases.

I don=E2=80=99t know.  blkverify is a rare exception by design, because it =
can
abort when both children don=E2=80=99t match.  (I suppose we could theoreti=
cally
have a quorum mode where a child gets ejected once a mismatch is
detected, but that isn=E2=80=99t the case now.)

Furthermore, I would argue that blkverify actually expects the formatted
image to sometimes differ from the raw image, if anything, because the
format driver is to be tested.  This is the reason why I chose x-raw to
be the filtered child.

So there is no general instruction on what to do in such cases that I
followed here, I specifically chose one child based on what blkverify is
and what it=E2=80=99s supposed to do.  Therefore, I can=E2=80=99t really gi=
ve a general
instruction on =E2=80=9Cwhat needs to be done in such cases=E2=80=9D.

> For blkverify, both
> children are not equal in intention, so I guess the "real" filtered
> child is x-image. But for quorum, you can't make any such distinction. I
> assume the recommendation should be not to set FILTERED for any child
> then.

Quorum just isn=E2=80=99t a filter driver.

> Looking at the final code... Hm, your choice looks quite different: You
> don't have DATA for x-raw, but you make it the PRIMARY and FILTERED
> child. I think PRIMARY/FILTERED is just a bug (e.g. getlength and flush
> being forwarded only to x-image show that it's primary).

I rather consider getlength() a special case.  Ideally, we=E2=80=99d forwar=
d
getlength() to both and compare the results; however, image formats
might have different size resolution than raw files, so there could be a
difference, but it=E2=80=99d be irrelevant.

It makes then sense to forward it to the formatted image, because
generally formats have byte resolution for the disk size, whereas for
raw files it depends on caching and the filesystem, I think.

As for flush, yes, why do we forward it only to x-image?  Why is =E2=80=9Ct=
he
raw file not important=E2=80=9D?

> I do wonder
> whether I have a different interpretation of DATA than you, though.

I never set DATA for FILTERED, because I consider FILTERED to be
stronger than DATA, so once FILTERED is set, it doesn=E2=80=99t matter whet=
her
DATA is set or not.  I suppose that should either be mentioned in the
documentation, or we decide that we should always set DATA regardless.

> Also, the comparison makes me wonder whether FILTERED always implies
> PRIMARY? Would there ever be a scenario where a child is FILTERED, but
> not PRIMARY?

I don=E2=80=99t know.  I suppose it does.  But what=E2=80=99s the implicati=
on?

Max


--N8LWGs3Qj6Mp7Zs4f0xI604e8qjJ0ln9F--

--jRgtZzFxl90uOw65HL6ZHFJMeKClzx0az
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl6xVR0ACgkQ9AfbAGHV
z0C/fAgAwIc33GIXUM+3rvjaUrwXW30qHZrXDpU+VGCPt9y8pr5gIFJwQkkmWMYt
aSRac4Oixp1uUmrUVV/HRjvXhKFDkM+a+NrgdOd39n1FuPlF8Jt08hNcYUqsRvd9
MCYM7z8yj7ZPN+xYusQQegmU8p0U1X1hy+pw6uxwD362qauT108DPB9m7HVCCnA2
x1PEbj/Zq/red2+fcpn7x4I+vS65Z6+3vg6ddy6nVCWXJGMK6mcnoyNg2N3RDmAu
TvqPGQCxAFbHafe/EBBinHURMlV8+cVveYMNnTIR2icPTNL0yaLI1o0TXg3tdQJb
bPW9k7nPdI4bg3Lh6mN9fQ7c8i10Mw==
=xnpQ
-----END PGP SIGNATURE-----

--jRgtZzFxl90uOw65HL6ZHFJMeKClzx0az--


