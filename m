Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB0F78EB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 17:37:00 +0100 (CET)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUCgV-0005JS-Gp
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 11:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iUCVN-0002Di-4Z
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iUCVM-0005Ym-0Q
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:25:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28973
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iUCVL-0005Xy-24
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 11:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573489526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Vvbi9HZm3SKQRBkIS83XZwIYMywaBsXfPJAaeEnG3a4=;
 b=dfyDY40a6E46zFse4KQKIGeiVuz/toXzeGfxRJEBFAQOkb+YtS5ta34O7gWW+CwW+AMXuV
 pArc69Z2Wyk0fLxSvC64R76mV1M/J/rMBuEs6qHs4mAGtz0XDVs9vFnyWvIiCn1JFwrP/z
 vM3wBo8b481UzcOG7H7mSttXRqkFoEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Js-FmxvQP4-BvpLYRlm7DQ-1; Mon, 11 Nov 2019 11:25:18 -0500
X-MC-Unique: Js-FmxvQP4-BvpLYRlm7DQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5731F101AF1F;
 Mon, 11 Nov 2019 16:25:17 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-117-116.ams2.redhat.com
 [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB6314B4;
 Mon, 11 Nov 2019 16:25:05 +0000 (UTC)
Subject: Re: [PATCH v2 03/15] block/block: add BDRV flag for io_uring
To: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20191025160444.31632-1-stefanha@redhat.com>
 <20191025160444.31632-4-stefanha@redhat.com>
 <20191111105759.GB7297@linux.fritz.box>
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
Message-ID: <6e8cf473-d3e9-c743-d2bd-75a0d955e6c6@redhat.com>
Date: Mon, 11 Nov 2019 17:25:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191111105759.GB7297@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wv1QQczEPh1MLbDCfJNuUsLnsNefdwFAk"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, oleksandr@redhat.com,
 Maxim Levitsky <maximlevitsky@gmail.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wv1QQczEPh1MLbDCfJNuUsLnsNefdwFAk
Content-Type: multipart/mixed; boundary="mTnm7e8iVeyIPpldY9ww7k1gXk60uVcjQ"

--mTnm7e8iVeyIPpldY9ww7k1gXk60uVcjQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11.11.19 11:57, Kevin Wolf wrote:
> Am 25.10.2019 um 18:04 hat Stefan Hajnoczi geschrieben:
>> From: Aarushi Mehta <mehta.aaru20@gmail.com>
>>
>> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
>> Reviewed-by: Maxim Levitsky <maximlevitsky@gmail.com>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  include/block/block.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/block/block.h b/include/block/block.h
>> index 89606bd9f8..bdb48dcd1b 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -126,6 +126,7 @@ typedef struct HDGeometry {
>>                                        ignoring the format layer */
>>  #define BDRV_O_NO_IO       0x10000 /* don't initialize for I/O */
>>  #define BDRV_O_AUTO_RDONLY 0x20000 /* degrade to read-only if opening r=
ead-write fails */
>> +#define BDRV_O_IO_URING    0x40000 /* use io_uring instead of the threa=
d pool */
>=20
> Why do we need a new (global!) flag rather than a driver-specific option
> for file-posix? This looks wrong to me, the flag has no sensible meaning
> for any other driver.
>=20
> (Yes, BDRV_O_NATIVE_AIO is wrong, too, but compatibility means we can't
> remove it easily.)

To add to that, Kevin and me had a short talk on IRC, and it seemed like
the reason would be that it=E2=80=99s easier to use this way than an option
would be.

To me, the problem seems to be that it=E2=80=99s only easier to use because=
 of
the option inheritance we have in the block layer (so you can set this
flag on a qcow2 node and its file node will have it, too).  But
naturally this inheritance is a bit of magic (because qemu has to guess
where you probably want the flag to end up), so I=E2=80=99d too rather avoi=
d
adding to it.

OTOH, I wonder whether ease of use is really that important here.  Would
people who want to use io_uring really care about a command line that=E2=80=
=99s
going to be a bit more complicated than just
-drive file=3Dfoo.img,format=3D$imgfmt,aio=3Dio_uring,if=3D$interface?  (Na=
mely
file.aio in this case, or maybe even a full-on block graph definition.)

Max


--mTnm7e8iVeyIPpldY9ww7k1gXk60uVcjQ--

--wv1QQczEPh1MLbDCfJNuUsLnsNefdwFAk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAl3Ji2AACgkQ9AfbAGHV
z0DvCQf/dKHfQwr8HCfFXmjwU2FYvMTlPQPdr+zAeCUCqZ/GZN0/jEyYXlNzeEAP
z68vOI/yFAW/TXTCS/xrS2upk4aBpZoaocP8fb7l+2x9qHDR77H2wIxZsS8YjL/G
StLwODzcvCcGyj5iv/4TUyl9wJVqH/PD0Fz1C6H0ZsaMfWJCuLXVJ6n6COqDrzbg
k+qwOjK4UxBL54RTfpa8cU4u6npb7Su45Vm6SfBv15IBC3et83txnbSKM5NAG5rH
iWXA00z+JgmuaGkEonDW2wlEBIEqWFi1NVZKOo2FvZU571HDEJIYy4mMAokbhOv/
nG3Q3nh5JRXs1rVy7z/5uB0mIMNJ3Q==
=Dbqd
-----END PGP SIGNATURE-----

--wv1QQczEPh1MLbDCfJNuUsLnsNefdwFAk--


