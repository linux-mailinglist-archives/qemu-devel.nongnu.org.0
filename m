Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F76E9119
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:54:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRum-00028N-3D; Thu, 20 Apr 2023 06:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppRuk-00025t-34
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:53:22 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppRui-0003Rt-K2
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3Qs9BB5i8Q7+zDAJ+I/fZsM2wYV+iuLqieiAJb+Zdk=; b=VsmBO5JrxCLN5F0admMXeVALlQ
 SliPDAWbCkeFwVbA9DLJdbP0+a9P7odNgfskiF1N/jzbsqdEB6SKrKDHb+Jq/P0z/awY7HNHwfgfx
 UolE3gMcg+gp8m8rWfJpT27ICUgSowFhMd3D30msIWEf2MGsyZD3denHERhidt40l9BRnHG2F+P+n
 WLgQ/mxkZpoFI0n+mjYGTk25CdJQXSV+hzqwuvCfruJaemsfvFBwpkZnX1/bBrrF0E3PdsyvcdgkN
 nITgQlI4dcfB4jG5KzSH5uAsOn/tTuJQHDFdj4ZvE4Ks5wvMtj6dVuY5O7YgZcYIx8/I4yZ/OZ/iI
 5gY4IuZBMmnZnSgY9NMD9PtpWis9qwTSXe/MZInhHXgkNOX2wZhiOjGzhNhC22SzCozV9UCoZnXeF
 +Wfv5I4nWwUfEpm4RJhxCMtRCOpb0b24PPmQlC0KeGvj2wWvqv3EaBKRJEBnt5QbJzG6UA/lViqZe
 MsiEusVuBXO5332ToPrADxWvX7JRUfTxecPQ3gQRKwvuY+rE+DnunY2zDqU7Cip8g2kwk/QtUG17G
 0hG5Fr91+XKgyL1NjdfkaEHvq0oYQ8R1Jbqusoe5hoDty1Jkrzttufwbf2nDvMijiyA74SeeSnYYi
 f3/ilc/j/TE/Trw1D6t5Qp/K5BTiRZpBQ72y8nns8=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppRtn-000AXG-HQ; Thu, 20 Apr 2023 11:52:27 +0100
Message-ID: <c93ea57c-0737-9b11-128c-c02a4bcf74cf@ilande.co.uk>
Date: Thu, 20 Apr 2023 11:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
 <6c9b3360-e632-b41a-b890-288863f2c910@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <6c9b3360-e632-b41a-b890-288863f2c910@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/3] softmmu/ioport.c: QOMify MemoryRegionPortioList
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/04/2023 09:41, Philippe Mathieu-Daudé wrote:

> On 19/4/23 17:16, Mark Cave-Ayland wrote:
>> The aim of QOMification is so that the lifetime of the MemoryRegionPortioList
>> structure can be managed using QOM's in-built refcounting instead of having to
>> handle this manually.
>>
>> Due to the use of an opaque pointer it isn't possible to model the new
>> TYPE_MEMORY_REGION_PORTIO_LIST directly using QOM properties, however since
>> use of the new object is restricted to the portio API we can simply set the
>> opaque pointer (and the heap-allocated port list) internally.
> 
> In all uses this opaque pointer is a Object*. Almost all cases are
> a DeviceState* and one is a BusState* (IDEBus).
> 
> Could this opaque become 'Object *owner' (simplifying the next patch)?

I'm not sure that it does, since the opaque is part of the portio API and not related 
to this series which is focused on MemoryRegionPortioList i.e. the glue interface 
between the portio and memory APIs. Otherwise you end up changing the portio API and 
the associated callbacks which is orthogonal to the bug this series is trying to fix.

>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   softmmu/ioport.c | 25 ++++++++++++++++++++++---
>>   1 file changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/softmmu/ioport.c b/softmmu/ioport.c
>> index d0d5b0bcaa..238625a36f 100644
>> --- a/softmmu/ioport.c
>> +++ b/softmmu/ioport.c
>> @@ -32,11 +32,16 @@
>>   #include "exec/address-spaces.h"
>>   #include "trace.h"
>> -typedef struct MemoryRegionPortioList {
>> +struct MemoryRegionPortioList {
>> +    Object obj;
>> +
>>       MemoryRegion mr;
>>       void *portio_opaque;
>>       MemoryRegionPortio *ports;
>> -} MemoryRegionPortioList;
>> +};


ATB,

Mark.

