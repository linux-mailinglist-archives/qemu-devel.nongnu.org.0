Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB362B538
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 09:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovDn0-0000v5-Mv; Wed, 16 Nov 2022 03:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ovDmr-0000uZ-Js
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ovDmp-0007MX-HF
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 03:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668587326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPGIMb8GTouu5ub1A/RwykK7aJogndOhaLMxUUZSvu8=;
 b=LSniZigWEbDmBfZvI55UrjOQFIbif/WlhYx532DprrkPb2UPNnK3UiSgQOj1HltnZZB871
 Vdkn7TKbg9UZjXPOq6SrcU+0cv847Acki/dmUw5Chg/53mN4ypLYbbWzexmg3lfuV61W82
 SEJanD3EEyapjOIdgN9oib18MW5cDqM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-6xbjudjDPj6cLcOmI6cXsA-1; Wed, 16 Nov 2022 03:28:41 -0500
X-MC-Unique: 6xbjudjDPj6cLcOmI6cXsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE1E63850E83;
 Wed, 16 Nov 2022 08:28:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A61AB140EBF3;
 Wed, 16 Nov 2022 08:28:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 870F121E6921; Wed, 16 Nov 2022 09:28:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: Alistair Francis <alistair@alistair23.me>,  Francisco Iglesias
 <frasse.iglesias@gmail.com>,  Kevin Wolf <kwolf@redhat.com>,  Hanna Reitz
 <hreitz@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Peter
 Maydell <peter.maydell@linaro.org>,  Peter Delevoryas <peter@pjd.dev>,
 <qemu-block@nongnu.org>,  <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size
 does not match the device
References: <20221115151000.2080833-1-clg@kaod.org>
 <87edu3o0ag.fsf@pond.sub.org>
 <1bc3c01f-ecff-28d9-c29f-64a11ffd0e9a@kaod.org>
Date: Wed, 16 Nov 2022 09:28:37 +0100
In-Reply-To: <1bc3c01f-ecff-28d9-c29f-64a11ffd0e9a@kaod.org>
 (=?utf-8?Q?=22C=C3=A9dric?= Le
 Goater"'s message of "Wed, 16 Nov 2022 08:12:27 +0100")
Message-ID: <87o7t7mhfu.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 11/16/22 07:56, Markus Armbruster wrote:
>> C=C3=A9dric Le Goater <clg@kaod.org> writes:
>>=20
>>> Currently, when a block backend is attached to a m25p80 device and the
>>> associated file size does not match the flash model, QEMU complains
>>> with the error message "failed to read the initial flash content".
>>> This is confusing for the user.
>>>
>>> Use blk_check_size_and_read_all() instead of blk_pread() to improve
>>> the reported error.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/block/m25p80.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>> index 02adc87527..68a757abf3 100644
>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -24,6 +24,7 @@
>>>  #include "qemu/osdep.h"
>>>  #include "qemu/units.h"
>>>  #include "sysemu/block-backend.h"
>>> +#include "hw/block/block.h"
>>>  #include "hw/qdev-properties.h"
>>>  #include "hw/qdev-properties-system.h"
>>>  #include "hw/ssi/ssi.h"
>>> @@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Err=
or **errp)
>>>          trace_m25p80_binding(s);
>>>          s->storage =3D blk_blockalign(s->blk, s->size);
>>>=20=20
>>> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
>>> -            error_setg(errp, "failed to read the initial flash content=
");
>>> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, =
errp)) {
>>>              return;
>>>          }
>>>      } else {
>>=20
>> Ignorant question: what does blk_pread() on short read?  Does it fail?
>
> an underlying call to blk_check_byte_request() makes it fail.

Thanks!

>> Or does it succeed, returning how much it read?  I tried to find an
>> answer in function comments, no luck.
>>=20
>> Are there more instances of "we fill some fixed-size memory (such as a
>> ROM or flash) from a block backend?"
>
> Yes. There are other similar devices :  nand, nvram, pnv_pnor, etc.

I think they should all be converted to blk_check_size_and_read_all().
Not a prerequisite for getting this patch merged.  Volunteers?


