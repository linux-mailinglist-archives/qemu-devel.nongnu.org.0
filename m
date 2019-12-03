Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF5111BB0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 23:34:20 +0100 (CET)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icGkM-0000JW-FB
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 17:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56455)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1icGD7-0001YK-Sr
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 16:59:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1icGCz-0002x7-EW
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 16:59:51 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34030
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1icGCy-0002cw-Cw
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 16:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575410382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ockXEWL0ht1UhdaAknyv2Hjkp6iESzOpm5o+3FY4ryc=;
 b=QtWbeuOzX6lgqGgu1deEMp9RT1LWI9xBwNCsfI2otwEKJFvAPQgskjf9LT655SIsXXAKRZ
 bpXD1FEGE7DgZm1QFcC7wOHDLQjIYZcwGWeWbLc1lQKW7BUDFT+EWf8rWV9yr9PVYk6cNh
 TCM6fLVc/VwA1tvqSEPP1pGi90HGFRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-aNoFGWNcM_aicxoVvxqGog-1; Tue, 03 Dec 2019 16:59:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C663891219;
 Tue,  3 Dec 2019 21:59:37 +0000 (UTC)
Received: from [10.3.116.171] (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0DF19C69;
 Tue,  3 Dec 2019 21:59:36 +0000 (UTC)
Subject: Re: for 4.2 ??? Re: [PATCH V3 2/2] block/nbd: fix memory leak in
 nbd_open()
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "pannengyuan@huawei.com" <pannengyuan@huawei.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "mreitz@redhat.com"
 <mreitz@redhat.com>, "sgarzare@redhat.com" <sgarzare@redhat.com>
References: <1575012326-51324-1-git-send-email-pannengyuan@huawei.com>
 <1575012326-51324-2-git-send-email-pannengyuan@huawei.com>
 <1cff97de-303b-3b27-f737-3f69759746b0@virtuozzo.com>
 <08f0d51d-f352-5d64-26a4-9a741a4cf2e0@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ac646f3c-b3d2-b6c6-8d5e-f65e3d1402fc@redhat.com>
Date: Tue, 3 Dec 2019 15:59:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <08f0d51d-f352-5d64-26a4-9a741a4cf2e0@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: aNoFGWNcM_aicxoVvxqGog-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: "liyiting@huawei.com" <liyiting@huawei.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>,
 "kuhn.chenqun@huawei.com" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/19 12:54 PM, Eric Blake wrote:
> On 12/3/19 11:52 AM, Vladimir Sementsov-Ogievskiy wrote:
>> It's just a memory leak, but it's a regression in 4.2.
>>
>> Should we take it into 4.2?
>=20
> Sorry, I was on holiday and then jury service, so I missed any chance at=
=20
> getting this into -rc3.=C2=A0 The memory leak only happens on failure, an=
d=20
> you'd have to be pretty desperate to purposefully attempt to open a lot=
=20
> of NBD devices where you know you'll get a failure just to trigger=20
> enough of a leak to cause the OOM-killer to target qemu.=C2=A0 So I'm fin=
e if=20
> this is deferred to 5.0, and just cc's qemu-stable (now done).
>=20
> I'll queue this through my NBD tree for 5.0.

Actually, given the review comments on 1/2, we'll probably be better off=20
with a v4 for the series.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


