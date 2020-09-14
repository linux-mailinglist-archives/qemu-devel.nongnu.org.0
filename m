Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8302691AB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 18:34:02 +0200 (CEST)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHrQX-0003X6-LH
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 12:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kHppP-0004DJ-2U
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:51:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kHppM-0005SK-Co
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600095091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F27cPUZ7o8f2RUCCVesGHvyAjwvv91I/08cTBiGZuHY=;
 b=APHMjNU/TMt2QtrZMGdYaTqPlIMSR9XV+ce7Xnz5/qnz8BhxbL4OT7RD5y0vBRtPuQZUAy
 HaJO9HzN2f+uyloipNRdfm3sBstxcC/cFutYdZyOAD95uUD/Pqy+LgXAGS/tvzoJaAmP7/
 5MsT85hKxdpfDK94Qq1GnO/t2t0xGCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-MPJaWW--PnqpOsARTD5AGw-1; Mon, 14 Sep 2020 10:51:27 -0400
X-MC-Unique: MPJaWW--PnqpOsARTD5AGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29F38913120;
 Mon, 14 Sep 2020 14:51:25 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-80.ams2.redhat.com
 [10.36.114.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 828241002D46;
 Mon, 14 Sep 2020 14:51:23 +0000 (UTC)
Subject: Re: [PATCH v2] iotests: Work around failing readlink -f
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200914141730.90279-1-mreitz@redhat.com>
 <CAFEAcA9CruJdDK4JDgpod6oo6cN0cp9AxH=_n781NoxuqfMNuw@mail.gmail.com>
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
Message-ID: <85982576-284a-0de5-8e39-b96488c726e8@redhat.com>
Date: Mon, 14 Sep 2020 16:51:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CruJdDK4JDgpod6oo6cN0cp9AxH=_n781NoxuqfMNuw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JbQv3Zo9OSRscFf4FrrXsb7oHD8gwbRnx"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:55:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JbQv3Zo9OSRscFf4FrrXsb7oHD8gwbRnx
Content-Type: multipart/mixed; boundary="k026JQVEQDKZyymlu6xvb2FgrU0XVah8O"

--k026JQVEQDKZyymlu6xvb2FgrU0XVah8O
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 14.09.20 16:26, Peter Maydell wrote:
> On Mon, 14 Sep 2020 at 15:17, Max Reitz <mreitz@redhat.com> wrote:
>>
>> On macOS, (out of the box) readlink does not have -f.  If the recent
>> "readlink -f" call introduced by b1cbc33a397 fails, just fall back to
>> the old behavior (which means you can run the iotests only from the
>> build tree, but that worked fine for six years, so it should be fine
>> still).
>>
>> Suppress all error messages, so in case using $PWD works out, we do not
>> cause the user to worry.  If it does not work, we will end up printing
>> the following error message anyway:
>>
>>   check: failed to source common.env (make sure the qemu-iotests are run
>>   from tests/qemu-iotests in the build tree)
>>
>> Following that hint (running check from $build_tree/tests/qemu-iotests)
>> will make it work, and is probably even easier than obtaining a readlink
>> that understands -f.
>>
>> Fixes: b1cbc33a3971b6bb005d5ac3569feae35a71de0f
>>        ("iotests: Allow running from different directory")
>> Reported-by: Claudio Fontana <cfontana@suse.de>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>> v2: Suppress stderr (as requested and suggested by Peter)
>> ---
>>  tests/qemu-iotests/check | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
>> index e14a1f354d..3c9ccc117b 100755
>> --- a/tests/qemu-iotests/check
>> +++ b/tests/qemu-iotests/check
>> @@ -44,7 +44,11 @@ then
>>          _init_error "failed to obtain source tree name from check symli=
nk"
>>      fi
>>      source_iotests=3D$(cd "$source_iotests"; pwd) || _init_error "faile=
d to enter source tree"
>> -    build_iotests=3D$(readlink -f $(dirname "$0"))
>> +    build_iotests=3D$(readlink -f $(dirname "$0") 2>/dev/null)
>=20
>=20
> Having woken up and actually looked at the context for what
> we're doing with readlink here, my usual rune for "give me
> the absolute path that this script is in" is
>=20
> thisdir=3D"$(cd "$(dirname "$0")"; pwd)"
>=20
> which should be more portable than readlink. It doesn't
> give quite the same behaviour if it's run via a path which
> is a symlink to a directory, eg if bar/ is a symlink to
> foo/ and you run a script as bar/thescript then you'll get
> back /path/to/bar/ rather than /path/to/foo/, but do you
> really need the path with all the symlinks followed
> rather than just some valid absolute path to the build dir?

Interesting.  Sounds good.

The only reason we did use readlink here was because realpath wasn=E2=80=99=
t
available on the BSDs.  We don=E2=80=99t really need the symlink, we just n=
eed
the full absolute path to $(dirname $0).

Thanks!

Max


--k026JQVEQDKZyymlu6xvb2FgrU0XVah8O--

--JbQv3Zo9OSRscFf4FrrXsb7oHD8gwbRnx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl9fg2kACgkQ9AfbAGHV
z0AQiAf/b41oSlKMKYP2nTW6/PfsBpe+A0jU0MnD04kjumfgjxWEJYut0cXFhXlj
7dktX1AFJc19BU5v6EBpJxo5BfW36Ng678xnzWhjvjGmqkFbO7dpwxekSAu+rC9u
z0gQcFTe7IL64QssuyNct00Djnm+S/PDr7L0gybedNeDMu3cWjjpn+qPi4kkzTS9
NCGyOfst03WTG+4h8YHkJmZzxluI+b8BnFWPcUoPD4WX41q76+x1bVhT/5YVvP72
CitgPxzaqVYbvpc6M98iNJIrMgNhDKq5NWovjQzOPuVVwd7sTZfMjDAW88BaszYm
o/uVo5qw3ZWPXRm1PT/7qBiAn0lwqQ==
=Ollw
-----END PGP SIGNATURE-----

--JbQv3Zo9OSRscFf4FrrXsb7oHD8gwbRnx--


