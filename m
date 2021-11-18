Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0C34554FF
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 07:58:21 +0100 (CET)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnbNE-0006dq-BF
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 01:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnbLk-0005cX-8j
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:56:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnbLg-0006ev-Lz
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 01:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637218599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQh2nPzLZ0bpcJKCbWKLD+G2mdW+RE9UfMD39mUoAj0=;
 b=TE3dBwLh4774LkpUepujhGQ6aAdO3lleN0+VQW0X4pV/b6xOnAHPFwU29NONX2DmURXKhT
 bEgRK7VNkH8CPjJprRMy0mps+Oe4RSHbhxO1FjgopVUXLqzwT9mz0UNm5fg9sgUp0a9v7c
 CVjWym9rPzBGI7WMUxdGYIYMg/28Z9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-QP_jtTXnNsSW3ygJtVcDFg-1; Thu, 18 Nov 2021 01:56:36 -0500
X-MC-Unique: QP_jtTXnNsSW3ygJtVcDFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F64687D541;
 Thu, 18 Nov 2021 06:56:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81D0A604CC;
 Thu, 18 Nov 2021 06:56:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DB13311380A7; Thu, 18 Nov 2021 07:56:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Havard Skinnemoen <hskinnemoen@google.com>
Subject: Re: [PATCH v2 03/13] hw/arm/npcm7xx_boards: Replace
 drive_get_next() by drive_get()
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-4-armbru@redhat.com>
 <CAFQmdRaz9aa22KVHup15oquDrt+HviqqNtGvt9tb21=spTKHog@mail.gmail.com>
Date: Thu, 18 Nov 2021 07:56:32 +0100
In-Reply-To: <CAFQmdRaz9aa22KVHup15oquDrt+HviqqNtGvt9tb21=spTKHog@mail.gmail.com>
 (Havard Skinnemoen's message of "Wed, 17 Nov 2021 08:53:57 -0800")
Message-ID: <874k8ax87z.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>,
 Tyrone Ting <KFTING@nuvoton.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Havard Skinnemoen <hskinnemoen@google.com> writes:

> On Wed, Nov 17, 2021 at 8:34 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> drive_get_next() is basically a bad idea.  It returns the "next" block
>> backend of a certain interface type.  "Next" means bus=0,unit=N, where
>> subsequent calls count N up from zero, per interface type.
>>
>> This lets you define unit numbers implicitly by execution order.  If the
>> order changes, or new calls appear "in the middle", unit numbers change.
>> ABI break.  Hard to spot in review.
>>
>> Machine "quanta-gbs-bmc" connects just one backend with
>> drive_get_next(), but with a helper function.  Change it to use
>> drive_get() directly.  This makes the unit numbers explicit in the
>> code.
>>
>> Cc: Havard Skinnemoen <hskinnemoen@google.com>
>> Cc: Tyrone Ting <kfting@nuvoton.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/arm/npcm7xx_boards.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
>> index dec7d16ae5..d8a49e4e85 100644
>> --- a/hw/arm/npcm7xx_boards.c
>> +++ b/hw/arm/npcm7xx_boards.c
>> @@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
>>                               &error_abort);
>>  }
>>
>> -static void sdhci_attach_drive(SDHCIState *sdhci)
>> +static void sdhci_attach_drive(SDHCIState *sdhci, int unit)
>>  {
>> -        DriveInfo *di = drive_get_next(IF_SD);
>> +        DriveInfo *di = drive_get(IF_SD, 0, unit);
>
> +Hao Wu IIRC the chip has separate SD and eMMC buses. Would it make
> sense to take the bus number as a parameter as well? Is bus 0 the
> right one to use in this case?
>
> The existing code always uses bus 0, so this is an improvement either way.

Using separate buses for different kinds of devices would be neater, but
it also would be an incompatible change.  I can't judge whether
incompatible change is okay here.

This patch is just refactoring code.  An interface change, if desired,
should be a separate patch.

> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

Thanks!

>
>>          BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
>>
>>          BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
>> @@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
>>                            drive_get(IF_MTD, 0, 0));
>>
>>      quanta_gbs_i2c_init(soc);
>> -    sdhci_attach_drive(&soc->mmc.sdhci);
>> +    sdhci_attach_drive(&soc->mmc.sdhci, 0);
>>      npcm7xx_load_kernel(machine, soc);
>>  }
>>
>> --
>> 2.31.1
>>


