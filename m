Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8B1C1D66
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 20:50:42 +0200 (CEST)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUakC-0007ky-7k
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 14:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUaiI-0005dt-OP
 for qemu-devel@nongnu.org; Fri, 01 May 2020 14:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jUaiG-0001RE-UI
 for qemu-devel@nongnu.org; Fri, 01 May 2020 14:48:41 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41132
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUaiG-0001Mu-FG
 for qemu-devel@nongnu.org; Fri, 01 May 2020 14:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588358919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOC9oU2P8ngcAhobwYH3f7+oHuKmV4ch5G1Z6b8NK14=;
 b=HWSp2B2eaXlQgLrDXDi4lqIRztV5lRfYR4DWjdLu/BYZUiz0cwSU6DZrCmUDdWa7VqPS0P
 R+pB5HbV4ql/Ym1O9d9ugev6mtYQWC6rLCltwe/mq5n9U27DcPtRABXkSJPzaCCIdiJC2I
 aP4puG/fq9BKcjdNDh985YBuEvH2XRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-se6aAAHwO3u4okTR4YTJrw-1; Fri, 01 May 2020 14:48:34 -0400
X-MC-Unique: se6aAAHwO3u4okTR4YTJrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 053F2107ACF4;
 Fri,  1 May 2020 18:48:33 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F88510013BD;
 Fri,  1 May 2020 18:48:32 +0000 (UTC)
Subject: Re: [PATCH] qcow2: Avoid integer wraparound in qcow2_co_truncate()
From: Eric Blake <eblake@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20200501131525.6745-1-berto@igalia.com>
 <5ba91898-9d3b-d55d-c360-83cca41d88f4@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <101fcf8e-0352-9151-f25a-c8a38aa079ed@redhat.com>
Date: Fri, 1 May 2020 13:48:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5ba91898-9d3b-d55d-c360-83cca41d88f4@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 12:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/20 12:12 PM, Eric Blake wrote:
> On 5/1/20 8:15 AM, Alberto Garcia wrote:
>> After commit f01643fb8b47e8a70c04bbf45e0f12a9e5bc54de when an image is
>> extended and BDRV_REQ_ZERO_WRITE is set then the new clusters are
>> zeroized.
>>
>> The code however does not detect correctly situations when the old and
>> the new end of the image are within the same cluster. The problem can
>> be reproduced with these steps:
>>
>> =C2=A0=C2=A0=C2=A0 qemu-img create -f qcow2 backing.qcow2 1M
>> =C2=A0=C2=A0=C2=A0 qemu-img create -f qcow2 -b backing.qcow2 top.qcow2
>=20
> We should get in the habit of documenting -F qcow2 (I have a series,=20
> still awaiting review, that would warn if you don't).
>=20
>> =C2=A0=C2=A0=C2=A0 qemu-img resize --shrink top.qcow2 520k
>> =C2=A0=C2=A0=C2=A0 qemu-img resize top.qcow2 567k
>>

Since your reproducer triggers assertion failure, I suggest doing this=20
instead:


>> +++ b/block/qcow2.c
>> @@ -4234,6 +4234,9 @@ static int coroutine_fn=20
>> qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((flags & BDRV_REQ_ZERO_WRITE) && offs=
et > old_length) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t zero_sta=
rt =3D QEMU_ALIGN_UP(old_length,=20
>> s->cluster_size);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* zero_start should not be =
after the new end of the image */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zero_start =3D MIN(zero_star=
t, offset);
>> +

Drop this hunk (leave zero_start unchanged), and instead...

>=20
> So, using your numbers, pre-patch, we have zero_start =3D 0x90000 (0x8200=
0=20
> rounded up to 0x10000 alignment).=C2=A0 post-patch, the new MIN() lowers =
it=20
> back to 0x8dc00 (the new size), which is unaligned.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Use zero =
clusters as much as we can. qcow2_cluster_zeroize()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * requires =
a cluster-aligned start. The end may be=20
>> unaligned if it is
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * at the end of the ima=
ge (which it is here).
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D qcow2_cluster_zeroize=
(bs, zero_start, offset -=20
> zero_start, 0);

...patch _this_ call to compute 'QEMU_ALIGN_UP(offset, s->cluster_size)=20
- zero_start' for the length.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


