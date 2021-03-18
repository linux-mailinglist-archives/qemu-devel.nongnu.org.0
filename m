Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6629340A4A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:36:37 +0100 (CET)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvdU-000803-Sj
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvVe-0001cj-Py
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMvVc-00070b-Da
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:28:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616084907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leIeRNRQyl7uFsIGkIVjHuMThC4CMmUdbW2PELNOH8w=;
 b=AN2nsasHnF6c4CrJuPWaeDhnf6oSGKbEi71MgFBcFiasTWHrxiayov/XcO0hysWJG9eAee
 mbkkAv5MgWlowgCBYIi4mErgBwYFXgHDX7IryCbpenpe7KnTSFRr0g0Of5kSviOW4m8qQ7
 2lenvv1+7ZO7FZC2reHTWrnlhhF4M8Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-oksjvLsENbW7pLT6GtG-jw-1; Thu, 18 Mar 2021 12:28:25 -0400
X-MC-Unique: oksjvLsENbW7pLT6GtG-jw-1
Received: by mail-wr1-f69.google.com with SMTP id n17so20396386wrq.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=leIeRNRQyl7uFsIGkIVjHuMThC4CMmUdbW2PELNOH8w=;
 b=L9Db5KKqCxEU627L781eU3vd+NKjYXZIWTiHB/Xiq712UT1UFZX1z1hfespu77CuFJ
 AxW1Xvf1Bhk/dFqf4H0OPQ3oDae3BEvsM4u+9nq1sp0HaJSgFsDUKCZcZBUzQgZ2JAKi
 Fkudx4HTy/G0rFhakjTUQUJkNU+oEHGuzOy/Ep+SR8i7QkvGeUI6X3SlwqXw4bYvA06a
 FoHTiRW/gkf0eezV/ghcrgGwWYPHuhIuTo+7ZPbfXKUdwecIsVwyOm4AXLOQIdzQNIWA
 /L0amtNHEWrDBuW4IaaWh5Ouhz1fKSF5SFAO6xyUGyQd1c080OlrFII+GtJe5n6nb19E
 Z+5g==
X-Gm-Message-State: AOAM531Lk0B3VUNLNpy6ATQavJALfWi5fznJwQADAlTCevf15szliKfx
 whWo95vvBnHBNn4QI5FvXBB9G0LRb7mFPHas6/xjh413l8wPhRcmFrqRx5h+J2/PjqT91k916Cs
 vGRp04qDNAWegHLg=
X-Received: by 2002:a7b:c047:: with SMTP id u7mr26678wmc.98.1616084904680;
 Thu, 18 Mar 2021 09:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9bNVEuGylHPCSqTCJgfJeS/bKizvUgM76Lp3YAXkJ4Ne07/bySCLQR6S4UJqAKHMbzquxGA==
X-Received: by 2002:a7b:c047:: with SMTP id u7mr26663wmc.98.1616084904555;
 Thu, 18 Mar 2021 09:28:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i11sm3601715wro.53.2021.03.18.09.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:28:24 -0700 (PDT)
Subject: Re: [PATCH for 6.0 v2] hw/intc/i8259: Refactor pic_read_irq() to
 avoid uninitialized variable
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210318160949.3681463-1-philmd@redhat.com>
 <e71d95de-a1ce-a8e5-78e-1751210329e@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <99adc22b-295c-b68c-8aef-940baa88a372@redhat.com>
Date: Thu, 18 Mar 2021 17:28:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e71d95de-a1ce-a8e5-78e-1751210329e@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 5:24 PM, BALATON Zoltan wrote:
> On Thu, 18 Mar 2021, Philippe Mathieu-Daudé wrote:
>> Some compiler versions are smart enough to detect a potentially
>> uninitialized variable, but are not smart enough to detect that this
>> cannot happen due to the code flow:
>>
>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in
>> this function [-Werror=maybe-uninitialized]
>>   203 |         irq = irq2 + 8;
>>       |         ~~~~^~~~~~~~~~
>>
>> Restrict irq2 variable use to the inner statement.
>>
>> Fixes: 78ef2b6989f ("i8259: Reorder intack in pic_read_irq")
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Supersedes: <20210318154738.27094-1-borntraeger@de.ibm.com>
>> ---
>> hw/intc/i8259.c | 11 ++++++-----
>> 1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>> index 344fd04db14..52c039c6c03 100644
>> --- a/hw/intc/i8259.c
>> +++ b/hw/intc/i8259.c
>> @@ -176,10 +176,12 @@ static void pic_intack(PICCommonState *s, int irq)
>> int pic_read_irq(DeviceState *d)
>> {
>>     PICCommonState *s = PIC_COMMON(d);
>> -    int irq, irq2, intno;
>> +    int irq, intno;
>>
>>     irq = pic_get_irq(s);
>>     if (irq >= 0) {
>> +        int irq2;
>> +
>>         if (irq == 2) {
>>             irq2 = pic_get_irq(slave_pic);
>>             if (irq2 >= 0) {
>> @@ -189,8 +191,11 @@ int pic_read_irq(DeviceState *d)
>>                 irq2 = 7;
>>             }
>>             intno = slave_pic->irq_base + irq2;
>> +            pic_intack(s, irq);
>> +            irq = irq2 + 8;
>>         } else {
>>             intno = s->irq_base + irq;
>> +            pic_intack(s, irq);
>>         }
>>         pic_intack(s, irq);
> 
> Do you still need this pic_intack() here or did you intend to move it in
> the if above?

I forgot to remove it indeed, thanks!

>>     } else {
>> @@ -199,10 +204,6 @@ int pic_read_irq(DeviceState *d)
>>         intno = s->irq_base + irq;
>>     }
>>
>> -    if (irq == 2) {
>> -        irq = irq2 + 8;
>> -    }
>> -
>> #ifdef DEBUG_IRQ_LATENCY
>>     printf("IRQ%d latency=%0.3fus\n",
>>            irq,
>>


