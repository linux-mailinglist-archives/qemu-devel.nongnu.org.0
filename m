Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6BE6FDC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 11:48:43 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP2Zm-0001Jg-30
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 06:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP2Y4-0000UZ-2w
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:46:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP2Xx-000091-1W
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:46:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53781
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP2Xv-00007l-Vp
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572259607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wYc1rhNKYZHzz+g1uzf6e4YRxpSoIu7/tdkyhCLswO8=;
 b=XYScR7ZVAA/n3S7aTYixphgRHuNqbJnVtKvOTD2o8kTbq7h45V/iFG/WAGp/1sQhFidMth
 YsCstuQiGHzMlFXpF+oI6geCMzq+Vb0U5zpiXIgUvXufpB+blBOKFGEHb5QaMr4ru5Sg5s
 w+2TKAi1KhNlhjXIvnvVSNB+SYDHVUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-RRvW5u2xM1-n3gGahVqwZg-1; Mon, 28 Oct 2019 06:46:45 -0400
X-MC-Unique: RRvW5u2xM1-n3gGahVqwZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FB97476;
 Mon, 28 Oct 2019 10:46:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-83.ams2.redhat.com
 [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ACC35DA32;
 Mon, 28 Oct 2019 10:46:40 +0000 (UTC)
Subject: Re: [PATCH v3 2/4] blkdebug: Allow taking/unsharing permissions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
References: <20191014153931.20699-1-mreitz@redhat.com>
 <20191014153931.20699-3-mreitz@redhat.com>
 <2341e2c4-5a80-7995-dbbd-a43d75f43dcf@virtuozzo.com>
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
Message-ID: <acf6833b-4a4f-2c52-76c8-9e5da818202d@redhat.com>
Date: Mon, 28 Oct 2019 11:46:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2341e2c4-5a80-7995-dbbd-a43d75f43dcf@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KG6S7sbyHmSe4eCO6OWcRcIJ3EP5qU1lo"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KG6S7sbyHmSe4eCO6OWcRcIJ3EP5qU1lo
Content-Type: multipart/mixed; boundary="bXB9zminQuEKXm1ygDKEsqgtNDk1Xk7nz"

--bXB9zminQuEKXm1ygDKEsqgtNDk1Xk7nz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 16.10.19 13:13, Vladimir Sementsov-Ogievskiy wrote:
> 14.10.2019 18:39, Max Reitz wrote:
>> Sometimes it is useful to be able to add a node to the block graph that
>> takes or unshare a certain set of permissions for debugging purposes.
>> This patch adds this capability to blkdebug.
>>
>> (Note that you cannot make blkdebug release or share permissions that it
>> needs to take or cannot share, because this might result in assertion
>> failures in the block layer.  But if the blkdebug node has no parents,
>> it will not take any permissions and share everything by default, so you
>> can then freely choose what permissions to take and share.)
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   qapi/block-core.json | 14 ++++++-
>>   block/blkdebug.c     | 91 +++++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 103 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index f66553aac7..054ce651de 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -3453,6 +3453,16 @@
>>   #
>>   # @set-state:       array of state-change descriptions
>>   #
>> +# @take-child-perms: Permissions to take on @image in addition to what
>> +#                    is necessary anyway (which depends on how the
>> +#                    blkdebug node is used).  Defaults to none.
>> +#                    (since 4.2)
>> +#
>> +# @unshare-child-perms: Permissions not to share on @image in addition
>> +#                       to what cannot be shared anyway (which depends
>> +#                       on how the blkdebug node is used).  Defaults
>> +#                       to none.  (since 4.2)
>> +#
>>   # Since: 2.9
>>   ##
>>   { 'struct': 'BlockdevOptionsBlkdebug',
>> @@ -3462,7 +3472,9 @@
>>               '*opt-write-zero': 'int32', '*max-write-zero': 'int32',
>>               '*opt-discard': 'int32', '*max-discard': 'int32',
>>               '*inject-error': ['BlkdebugInjectErrorOptions'],
>> -            '*set-state': ['BlkdebugSetStateOptions'] } }
>> +            '*set-state': ['BlkdebugSetStateOptions'],
>> +            '*take-child-perms': ['BlockPermission'],
>> +            '*unshare-child-perms': ['BlockPermission'] } }
>>  =20
>>   ##
>>   # @BlockdevOptionsBlklogwrites:
>> diff --git a/block/blkdebug.c b/block/blkdebug.c
>> index 5ae96c52b0..6807c03065 100644
>> --- a/block/blkdebug.c
>> +++ b/block/blkdebug.c
>> @@ -28,10 +28,14 @@
>>   #include "qemu/cutils.h"
>>   #include "qemu/config-file.h"
>>   #include "block/block_int.h"
>> +#include "block/qdict.h"
>>   #include "qemu/module.h"
>>   #include "qemu/option.h"
>> +#include "qapi/qapi-visit-block-core.h"
>>   #include "qapi/qmp/qdict.h"
>> +#include "qapi/qmp/qlist.h"
>>   #include "qapi/qmp/qstring.h"
>> +#include "qapi/qobject-input-visitor.h"
>>   #include "sysemu/qtest.h"
>>  =20
>>   typedef struct BDRVBlkdebugState {
>> @@ -44,6 +48,9 @@ typedef struct BDRVBlkdebugState {
>>       uint64_t opt_discard;
>>       uint64_t max_discard;
>>  =20
>> +    uint64_t take_child_perms;
>> +    uint64_t unshare_child_perms;
>> +
>>       /* For blkdebug_refresh_filename() */
>>       char *config_file;
>>  =20
>> @@ -344,6 +351,67 @@ static void blkdebug_parse_filename(const char *fil=
ename, QDict *options,
>>       qdict_put_str(options, "x-image", filename);
>>   }
>>  =20
>> +static int blkdebug_parse_perm_list(uint64_t *dest, QDict *options,
>> +                                    const char *prefix, Error **errp)
>> +{
>> +    int ret =3D 0;
>> +    QDict *subqdict =3D NULL;
>> +    QObject *crumpled_subqdict =3D NULL;
>> +    Visitor *v =3D NULL;
>> +    BlockPermissionList *perm_list =3D NULL, *element;
>> +    Error *local_err =3D NULL;
>> +
>> +    qdict_extract_subqdict(options, &subqdict, prefix);
>> +    if (!qdict_size(subqdict)) {
>=20
>=20
> Hmm, you consider it as a success, so you mean default. Then, it's safer =
to
> set *dest =3D 0 here.

=E2=80=9CSafer=E2=80=9D depends on the purpose of this function, and right =
now it=E2=80=99s
simply to set all fields that are given in the options; not to reset any
that aren=E2=80=99t.

I suppose there=E2=80=99s no harm in changing the purpose of the function, =
though.

>> +        goto out;
>> +    }
>> +
>> +    crumpled_subqdict =3D qdict_crumple(subqdict, errp);
>> +    if (!crumpled_subqdict) {
>> +        ret =3D -EINVAL;
>> +        goto out;
>> +    }
>> +
>> +    v =3D qobject_input_visitor_new(crumpled_subqdict);
>> +    visit_type_BlockPermissionList(v, NULL, &perm_list, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        ret =3D -EINVAL;
>> +        goto out;
>> +    }
>> +
>=20
> I'd prefer explicitly set *dest =3D 0 here too.
>=20
>> +    for (element =3D perm_list; element; element =3D element->next) {
>> +        *dest |=3D UINT64_C(1) << element->value;
>=20
> Hmm, so, you rely on correct correspondence between generated BlockPermis=
sion enum
> and unnamed enum with BLK_PERM_* constants...
>=20
> I'm afraid it's unsafe, so, in xdbg_graph_add_edge() special mapping vari=
able is
> used + QEMU_BUILD_BUG_ON on BLK_PERM_ALL.
>=20
> I think something like this should be done here.

I don=E2=80=99t really like it because I think it=E2=80=99s cool to have a =
1-to-1
relationship between the BLK_PERM_* constants and what=E2=80=99s defined in
QAPI.  I don=E2=80=99t quite like assuming there isn=E2=80=99t, because the=
re=E2=80=99s no
reason why they wouldn=E2=80=99t correspond.

In fact, I=E2=80=99d rather define the BLK_PERM_* constants based on the QA=
PI
enum, but I don=E2=80=99t know whether we want to include the QAPI header i=
nto
block.h.  ...Well, judging from a quick test it looks like the header is
included into it recursively anyway.  So maybe I=E2=80=99ll do that instead=
.

Max


--bXB9zminQuEKXm1ygDKEsqgtNDk1Xk7nz--

--KG6S7sbyHmSe4eCO6OWcRcIJ3EP5qU1lo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl22xw8ACgkQ9AfbAGHV
z0CksggAryIIsdA/J1Gv+qE7rxrLo7eKNNosriuLJvqD8MA+W6WaXROphLhYLRxT
6VVXya+6xUVjjVDnKPkcBHCut7J1zY0qNCSsY9JF2bxHKHLASdWtvD7Njely+pHQ
/OyA7+1o8kE63kXVdLwpA6VmWu4+97Z7mYc1skRqSurtVAZDgDtDzi2ziFVgrFPu
0l+K+p6JIK4VEsAjP+zm3GQXGXt5djCuIrBqC0gHd7O3xvvZ83kl0RUWQJvAIzsN
moEJ447Jj2S4wkJGZyYM8+VflTCxmqnFvf0V1tKQiCmdF4vbb+xG8hrFnK/j+mnt
ZirAOIiihuOMiiEaWEN9YxNAuJGorQ==
=XPuU
-----END PGP SIGNATURE-----

--KG6S7sbyHmSe4eCO6OWcRcIJ3EP5qU1lo--


