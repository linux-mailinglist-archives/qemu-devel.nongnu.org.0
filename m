Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15476FF52C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7f9-0007pI-Rs; Thu, 11 May 2023 10:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px7f6-0007p3-12
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:52:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px7f3-00068s-Rn
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iSQe2j9VLKWZ8y2MpuFHv0KQU5zkBOWZn0ubJ2QputA=; b=kQGH/Mwpu7UHbyfZEY/RpbgJHM
 PGbsxPEnL8qQqlmloEbK0nRvShyMyx53JYGH0LtB9BP/oVUQozFqR6HRqOZz0QeJ5m45f7mwjw2zh
 prmknoa0yGtqttMXBeI/qR43dQiSd3TIjGKSg20w4CqGUp1sIt0IFEEdmHA62lBoKU2OygOh5Ydf8
 ZMj2iJ6su3I+qRcL3l6qOqex+dZtSwwZo8s9NYv9S2tAzGau9XW4anYL6XvuxZXqL5REcDIA5PDBM
 etb/R0rIiysoaCJKnPsHTmJ8j+4OuZuMmsQpNIHW4C8ePm/BAp4FnV8isH9re6Vl5PXGVNckoaTfM
 brJbNMoEmJdYDUHieArpDCD21bsCNio1lWucuYqbYomUCGnffTZ5ns7gNHB5uzJ4vPFmtZ/EDG23n
 6BZdFq+SfJ4wwA09quegxNRQy0Wj2emwTeVEBHrN+3rccVlSV/o8ypoAbL0+sl5b0tJIMU309m2+L
 IgBzFKQkG/pZ1pUjfEnJk0OFE/UZws3tijNWQSfBoHGNST8X2zWTzo11Kup1ww2nfO5ZO3VvHgEk9
 ym/4nRqU1ykAemgP/0q1vTufSmQwKXDIwhlJf9P/GIfeqWiJixz9xlSrMpWTdgCEJkFAKSpXrGHKj
 fStnECV5fqxXnfcWwHtD6Hi2Ojh2c8gbySx1b5da4=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px7e1-000BUs-Jy; Thu, 11 May 2023 15:51:53 +0100
Message-ID: <eb9774d3-cbbb-b415-4d84-2f36179ea062@ilande.co.uk>
Date: Thu, 11 May 2023 15:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
 <2d36555a-b5c6-ac21-c1d3-a8668a05a7eb@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <2d36555a-b5c6-ac21-c1d3-a8668a05a7eb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/3] softmmu/ioport.c: QOMify MemoryRegionPortioList
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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

On 11/05/2023 14:50, Philippe Mathieu-Daudé wrote:

> On 19/4/23 17:16, Mark Cave-Ayland wrote:
>> The aim of QOMification is so that the lifetime of the MemoryRegionPortioList
>> structure can be managed using QOM's in-built refcounting instead of having to
>> handle this manually.
>>
>> Due to the use of an opaque pointer it isn't possible to model the new
>> TYPE_MEMORY_REGION_PORTIO_LIST directly using QOM properties, however since
>> use of the new object is restricted to the portio API we can simply set the
>> opaque pointer (and the heap-allocated port list) internally.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   softmmu/ioport.c | 25 ++++++++++++++++++++++---
>>   1 file changed, 22 insertions(+), 3 deletions(-)
> 
> 
>>   static uint64_t unassigned_io_read(void *opaque, hwaddr addr, unsigned size)
>>   {
>> @@ -228,7 +233,8 @@ static void portio_list_add_1(PortioList *piolist,
>>       unsigned i;
>>       /* Copy the sub-list and null-terminate it.  */
>> -    mrpio = g_malloc0(sizeof(MemoryRegionPortioList));
>> +    mrpio = MEMORY_REGION_PORTIO_LIST(
>> +                object_new(TYPE_MEMORY_REGION_PORTIO_LIST));
> 
> Shouldn't we need to replace the g_free() call by object_unref()
> in portio_list_destroy()?

Both the existing g_free() call and replacing it with object_unref() cause QEMU to 
segfault if you call portio_list_destroy() before the final patch in this series. So 
in effect we'd end up causing more code churn just to replace one crash with another ;)

The real fix is in patch 3 which alters the refcounting/ownership in order to solve 
the underlying issue, which I hope I have described in enough detail in that commit 
message.

>>       mrpio->portio_opaque = piolist->opaque;
>>       mrpio->ports = g_malloc0(sizeof(MemoryRegionPortio) * (count + 1));
>>       memcpy(mrpio->ports, pio_init, sizeof(MemoryRegionPortio) * count);
>> @@ -298,3 +304,16 @@ void portio_list_del(PortioList *piolist)
>>           memory_region_del_subregion(piolist->address_space, &mrpio->mr);
>>       }
>>   }


ATB,

Mark.


