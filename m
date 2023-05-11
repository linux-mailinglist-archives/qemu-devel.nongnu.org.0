Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9536FF4E0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:44:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px7W0-00036x-HM; Thu, 11 May 2023 10:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px7Vz-00036o-9E
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:43:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px7Vx-00030H-Ha
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=isXPyhica8sbpgB+Af971z7suXwiafBZBOeoXyVfVcw=; b=Ab/USa9MntQ27Mwlnu4M4JHOqS
 4x3T2osD8j6ORdk1DW5Lv9piG5JKsavQBIHTdmOiqjlP1RVI2E53lCobVFrfAk7fMzl+QbW4DmLdM
 sPt+r1a1MP/hzoqNrSShCpou/5xgSvjeGrTjLAX8k1tdvbaAFD8G6t8xN7sHOp6flY31yk0BDT1Yy
 N07fAWFQ+i6mR930Yc9UsRrDH7olQ61Ae+AT9JG31tV4zbER7mwQJ16YuH1Mvamsri+JpEKAW9HlS
 BQNyn+RmDnq4ul1O86yRTYkodZ4RfbqqUJ3WlAcuNxLXbN+09RqiRIYKGmUFu6U/17BT8OtFiwOx2
 jgwbbkjKDs4IoAX8F5UQto4HlhCh6UMuC6NgNqaKdULodYcRD0tQhBKlJ1gNEM8/jRsQakfzQC1SR
 iGllingk1xNhjHtxiycPUqYuFGavq1OAxpvB82s9EJB7OPwTHTsErHpHFbKGOUiXo2s73pcQdfh36
 E5OFEfyasM93xSU5xR0+x4g12N43o97KQYe7cCI129ioF1Vflspszx9ESooa2eQfn+/Oj76MUZ4PG
 0bDhlzTC7MdsaiINTtuXMEx9NU4JL3VTfR394J2teoixVvSlkMm3ezlvoL3Vml27cKlBeoC5hzxYt
 xoIg+Y/1JugafdllFTBSM2czJeBfs7PLoVyE6U1qo=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1px7Uu-000BSh-8F; Thu, 11 May 2023 15:42:28 +0100
Message-ID: <b03cac1d-33d9-5f2f-1f29-3fc566dcdf3f@ilande.co.uk>
Date: Thu, 11 May 2023 15:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
 <68cca2b7-a61f-325b-2a45-33d6f3bb0c24@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <68cca2b7-a61f-325b-2a45-33d6f3bb0c24@linaro.org>
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

On 11/05/2023 14:46, Philippe Mathieu-Daudé wrote:

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
>> +
>> +#define TYPE_MEMORY_REGION_PORTIO_LIST "memory-region-portio-list"
> 
> Possibly simpler as: TYPE_MEMORY_REGION_PORTIO "memory-region-portio"

I'm a little undecided about this one: the ports field contains an array of 
MemoryRegionPortio entries e.g. 
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/ide/ioport.c#L31 so I 
considered that the QOM object contains a list of MemoryRegionPortios. 
TYPE_MEMORY_REGION_PORTIO_LIST feels a better fit here since it reflects this whilst 
also matching the existing MemoryRegionPortioList struct name.

> Otherwise:
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


ATB,

Mark.


