Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B411C3DB8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 16:57:02 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVcWj-00046k-FG
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 10:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jVcRa-0003AT-KV
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:51:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57716
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jVcRZ-0005WG-Rs
 for qemu-devel@nongnu.org; Mon, 04 May 2020 10:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588603901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hrLrQr+R/T9s03X9urIw7MWei7yBJ0eNzyIVI1Vhb1g=;
 b=AxLpYE1P3ml3VcYi5RUBFU0l1+6WHgSe6aOFlsVhG99g9WGkAzKoZO9u5rpLerr9uVqrB+
 0lL615Kx9VxYMatUEAAo0Ny/xwn3UBIUxavVqGS/guK7jA1uR1gJkD9KCxce10t49IZ12W
 RgB/UoMyOmZPwjksDGEV01BBu423Td0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-YgQuK88BMIypfIXmRb35CA-1; Mon, 04 May 2020 10:51:34 -0400
X-MC-Unique: YgQuK88BMIypfIXmRb35CA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79761054F9B;
 Mon,  4 May 2020 14:51:33 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EE1A1002389;
 Mon,  4 May 2020 14:51:33 +0000 (UTC)
Subject: Re: [PATCH] qcow2: Avoid integer wraparound in qcow2_co_truncate()
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <20200501131525.6745-1-berto@igalia.com>
 <5ba91898-9d3b-d55d-c360-83cca41d88f4@redhat.com>
 <101fcf8e-0352-9151-f25a-c8a38aa079ed@redhat.com>
 <w515zdbizgo.fsf@maestria.local.igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <de009c42-b886-0e30-44da-cfbeb7ccc49b@redhat.com>
Date: Mon, 4 May 2020 09:51:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <w515zdbizgo.fsf@maestria.local.igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 01:21:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/20 8:47 AM, Alberto Garcia wrote:

>> Drop this hunk (leave zero_start unchanged), and instead...
>>
>>>
>>> So, using your numbers, pre-patch, we have zero_start =3D 0x90000 (0x82=
000
>>> rounded up to 0x10000 alignment).=C2=A0 post-patch, the new MIN() lower=
s it
>>> back to 0x8dc00 (the new size), which is unaligned.
>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Use ze=
ro clusters as much as we can. qcow2_cluster_zeroize()
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * requir=
es a cluster-aligned start. The end may be
>>>> unaligned if it is
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * at the end of the =
image (which it is here).
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D qcow2_cluster_zero=
ize(bs, zero_start, offset -
>>> zero_start, 0);
>>
>> ...patch _this_ call to compute 'QEMU_ALIGN_UP(offset, s->cluster_size)
>> - zero_start' for the length.
>=20
> That would work, but then we would be writing zeroes beyond the end of
> the image (but still within the last cluster).
>=20
> The other solution is to keep my hunk and call qcow2_cluster_zeroize()
> only when offset > zero_start.

Yes, that would work, and probably less complicated.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


