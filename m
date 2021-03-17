Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC44233EE6A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:39:32 +0100 (CET)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTaO-0003LQ-1W
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMTYi-0002ho-Av
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMTYg-0000GR-PF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615977466;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXe/aI00IfjQ+oW9XAtpH0jcpcz9cqfW4moJoURMAFc=;
 b=OVPCkhFuvi7FfcTLOZgQJyVhsiWNugnPTsz6qPGUegMar5TbsIlhjHTZOhCGzojB4C7KlZ
 W9SHc8CHrKK5qKF+SvgkB2WatvursDqmSLAv6ACvWRn1YrsMLwjhdAlpBOnUmHYehZqU5p
 wcpvg6Xs5F3WnP3Ws863XnM9O0pe1CI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-UuuLZ4Q0PlqkCWSR6SqQHQ-1; Wed, 17 Mar 2021 06:37:44 -0400
X-MC-Unique: UuuLZ4Q0PlqkCWSR6SqQHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5C9C190A7A2;
 Wed, 17 Mar 2021 10:37:42 +0000 (UTC)
Received: from [10.64.54.49] (vpn2-54-49.bne.redhat.com [10.64.54.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4BC16C330;
 Wed, 17 Mar 2021 10:37:36 +0000 (UTC)
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
Date: Wed, 17 Mar 2021 21:37:32 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/17/21 8:09 PM, Peter Maydell wrote:
> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>>
>> There is a added clock to trace buad rate change since v5.2.0 by
>> commit aac63e0e6ea3 ("hw/char/pl011: add a clock input"). The added
>> clock causes migration failure. For example, migration from v5.2.0
>> to v5.1.0 can fail with the following error messages:
>>
>>     qemu-system-aarch64: error while loading state for instance 0x0 \
>>                          of device 'pl011'
>>     qemu-system-aarch64: load of migration failed: No such file or \
>>                          directory
>>
>> This fixes the issue by reporting the baud rate change at post load
>> time so that the clock won't be migrated by sub-section to avoid the
>> migration failure.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/char/pl011.c | 22 +++++++++-------------
>>   1 file changed, 9 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index c5621a195f..401bd28536 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -322,20 +322,20 @@ static const MemoryRegionOps pl011_ops = {
>>       .endianness = DEVICE_NATIVE_ENDIAN,
>>   };
>>
>> -static const VMStateDescription vmstate_pl011_clock = {
>> -    .name = "pl011/clock",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> -    .fields = (VMStateField[]) {
>> -        VMSTATE_CLOCK(clk, PL011State),
>> -        VMSTATE_END_OF_LIST()
>> -    }
>> -};
>> +static int pl011_post_load(void *opaque, int version_id)
>> +{
>> +    PL011State *s = PL011(opaque);
>> +
>> +    pl011_trace_baudrate_change(s);
>> +
>> +    return 0;
>> +}
>>
>>   static const VMStateDescription vmstate_pl011 = {
>>       .name = "pl011",
>>       .version_id = 2,
>>       .minimum_version_id = 2,
>> +    .post_load = pl011_post_load,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINT32(readbuff, PL011State),
>>           VMSTATE_UINT32(flags, PL011State),
>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>>           VMSTATE_INT32(read_trigger, PL011State),
>>           VMSTATE_END_OF_LIST()
>>       },
>> -    .subsections = (const VMStateDescription * []) {
>> -        &vmstate_pl011_clock,
>> -        NULL
>> -    }
>>   };
> 
> Doesn't dropping the subsection break migration compat ?
> 

It's why this patch needs to be backported to stable branches.
In that way, we won't have migration compatible issue.

Thanks,
Gavin


