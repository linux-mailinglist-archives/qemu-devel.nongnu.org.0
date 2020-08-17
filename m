Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3544E2467B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 15:53:03 +0200 (CEST)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7fZN-00081S-Sa
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k7fYW-0007Ns-H1
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 09:52:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k7fYU-0000Hz-Hg
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 09:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597672325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5A5mz29ufpyluDNsT8ppfR93YX1EqMpr3TXnL3S2CDM=;
 b=JzyUvUdhAa48onVN2udWZ+KbZTf9KYNH74n54I+etbhk1PQp6g5XyH1dvhYqGYNOcOdl5D
 zSdXe87kXqqR6GJSflGjvq8TnCDC29uMULaD4hsFv1ht4yjIYtx3MmG2mCIf6Lttc3GyVG
 w2ZfuNBN0qSxO9maMvMZQsNkDXPn+Sg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Sqhk7IzjONuJF-r7ZuL-5g-1; Mon, 17 Aug 2020 09:52:01 -0400
X-MC-Unique: Sqhk7IzjONuJF-r7ZuL-5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 200D8100629F;
 Mon, 17 Aug 2020 13:52:00 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-146.ams2.redhat.com
 [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F128A5C3E1;
 Mon, 17 Aug 2020 13:51:57 +0000 (UTC)
Subject: Re: [RFC PATCH 09/22] nbd: Add writethrough to block-export-add
To: Kevin Wolf <kwolf@redhat.com>
References: <20200813162935.210070-1-kwolf@redhat.com>
 <20200813162935.210070-10-kwolf@redhat.com>
 <faa916e7-3c39-84f4-183f-808153abe12d@redhat.com>
 <20200817131359.GL11402@linux.fritz.box>
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
Message-ID: <6c07d929-d7f0-50d8-88b1-b9fa89209c7d@redhat.com>
Date: Mon, 17 Aug 2020 15:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817131359.GL11402@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rZkputpHyYjxECwuAQL2L6n1jrL3DJUZa"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 01:24:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
--rZkputpHyYjxECwuAQL2L6n1jrL3DJUZa
Content-Type: multipart/mixed; boundary="abinxBaPAhTJksYEVc5Ku9wXuvERn80PD"

--abinxBaPAhTJksYEVc5Ku9wXuvERn80PD
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 17.08.20 15:13, Kevin Wolf wrote:
> Am 17.08.2020 um 14:56 hat Max Reitz geschrieben:
>> On 13.08.20 18:29, Kevin Wolf wrote:
>>> qemu-nbd allows use of writethrough cache modes, which mean that write
>>> requests made through NBD will cause a flush before they complete.
>>> Expose the same functionality in block-export-add.
>>>
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> ---
>>>  qapi/block-export.json | 7 ++++++-
>>>  blockdev-nbd.c         | 2 +-
>>>  2 files changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/qapi/block-export.json b/qapi/block-export.json
>>> index 1fdc55c53a..4ce163411f 100644
>>> --- a/qapi/block-export.json
>>> +++ b/qapi/block-export.json
>>> @@ -167,10 +167,15 @@
>>>  # Describes a block export, i.e. how single node should be exported on=
 an
>>>  # external interface.
>>>  #
>>> +# @writethrough: If true, caches are flushed after every write request=
 to the
>>> +#                export before completion is signalled. (since: 5.2;
>>> +#                default: false)
>>> +#
>>>  # Since: 4.2
>>>  ##
>>>  { 'union': 'BlockExportOptions',
>>> -  'base': { 'type': 'BlockExportType' },
>>> +  'base': { 'type': 'BlockExportType',
>>> +            '*writethrough': 'bool' },
>>>    'discriminator': 'type',
>>>    'data': {
>>>        'nbd': 'BlockExportOptionsNbd'
>>
>> Hm.  I find it weird to have @writethrough in the base but @device in
>> the specialized class.
>>
>> I think everything that will be common to all block exports should be in
>> the base, and that probably includes a node-name.  I=E2=80=99m aware tha=
t will
>> make things more tedious in the code, but perhaps it would be a nicer
>> interface in the end.  Or is the real problem that that would create
>> problems in the storage daemon=E2=80=99s command line interface, because=
 then
>> the specialized (legacy) NBD interface would no longer be compatible
>> with the new generalized block export interface?
>=20
> Indeed. I think patch 15 has what you're looking for.

Great. :)

Discussions where both participants have the same opinion from the start
are the best ones.

>> Anyway, @writable might be a similar story.  A @read-only may make sense
>> in general, I think.
>=20
> Pulling @writable up is easier than a @read-only, but that's a naming
> detail.

Sure.

> In general I agree, but this part isn't addressed in this series yet.
> Part of the reason why this is an RFC was to find out if I should
> include things like this or if we'll do it when we add another export
> type or common functionality that needs the same option.

Sure, sure.


Meta: I personally don=E2=80=99t like RFC patches very much.  RFC to me mea=
ns
everything is fair game, and reviewers should be free to let their
thoughts wander and come up with perhaps wild ideas, just trying to
gauge what everyone thinks.

When I=E2=80=99m the submitter, I tend to get defensive then, because I=E2=
=80=99ve
invested time in writing the code already, so I tend to be biased
against fundamental changes.  (Horrible personal trait.  I=E2=80=99m workin=
g on it.)

As a reviewer, the code and thus some fleshed out design is there
already, so it=E2=80=99s difficult to break free from that and find complet=
ely
different solutions to the original problem.
(I kind of ventured in that direction for this patch, and it seems like
you immediately noticed that my response was different from usual and
pointed out the RFC status, perhaps to make me feel more comfortable in
questioning the fundamental design more.  Which I noticed, hence this
wall of text.)

Perhaps I=E2=80=99m wrong.  Perhaps it=E2=80=99s just myself (the points I=
=E2=80=99ve just
listed are definitely my own personal weaknesses), but I can=E2=80=99t help=
 but
project and assume that others may feel similar, at least in part.
So I feel like RFCs that consist of patches tend to at least lock me in
to the solution that=E2=80=99s present.  I find them difficult to handle, b=
oth
as a submitter and as a reviewer.

All in all, that means on either side I tend to handle patch RFCs as
=E2=80=9CStandard series, just tests missing=E2=80=9D.  Not sure if that=E2=
=80=99s ideal.  Or
maybe that=E2=80=99s exactly what patch RFCs are?

(Of course, it can and should be argued that even for standard series, I
shouldn=E2=80=99t be afraid of questioning the fundamental design still.  B=
ut
that=E2=80=99s hard...)


But, well.  The alternative is writing pure design RFCs, and then you
tend to get weeks of slow discussion, drawing everything out.  Which
isn=E2=80=99t ideal either.  Or is that just a baseless prejudice I have?

>> Basically, I think that the export code should be separate from the code
>> setting up the BlockBackend that should be exported, so all options
>> regarding that BB should be common; and those options are @node-name,
>> @writethrough, and @read-only.  (And perhaps other things like
>> @resizable, too, even though that isn=E2=80=99t something to consider fo=
r NBD.)
>=20
> Do you mean that the BlockBackend should already be created by the
> generic block export layer?

It would certainly be nice, if it were feasible, don=E2=80=99t you think?

We don=E2=80=99t have to bend backwards for it, but maybe it would force us=
 to
bring the natural separation of block device and export parameters to
the interface.

Max


--abinxBaPAhTJksYEVc5Ku9wXuvERn80PD--

--rZkputpHyYjxECwuAQL2L6n1jrL3DJUZa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl86i3wACgkQ9AfbAGHV
z0DiSQf/b2mKEmuSG8a+5PJn8iPJ4E9No3Q74Qjz6uoqQE+zU7gdZ8fsqcYgzHpi
KDYu18k16u7DFC9M++s0QCpd3GwTgFN6RHXus0pJvr50fDCKtwhGlvKLf5tj6AOk
YCvirGv5oY8MtjLfapYsQM+302kHeQKiZbmuP2SodEqUSEz5oLDr+jCI+rvZqhAq
gV36Y3IJNczJNX0AOF0K5IwY1TZyhzGDs7Wk0IiqWvdG2tcOrSXqgCFDELnSuFmI
ORcMRXK8XDgbr/dtzpDJB+PJwMzQr6ICW6Omkn3CbawdpDj+MjlSh76mMyXit3qh
w3ViQFtV/O3phX2CsLQjFkK3ERp2UQ==
=oasG
-----END PGP SIGNATURE-----

--rZkputpHyYjxECwuAQL2L6n1jrL3DJUZa--


