Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5135114B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:57:00 +0200 (CEST)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRt8N-0007vy-8p
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt7c-0007N7-Q9
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:56:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57304
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt7b-0007nw-2w
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:56:12 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt7e-0004lD-LV; Thu, 01 Apr 2021 09:56:19 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-9-mark.cave-ayland@ilande.co.uk>
 <1aa39496-e535-5e38-552b-1e314fcb9905@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <38050d91-e718-f9c9-c4da-8962f5c9d0ef@ilande.co.uk>
Date: Thu, 1 Apr 2021 09:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1aa39496-e535-5e38-552b-1e314fcb9905@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 08/11] esp: don't overflow cmdfifo in get_cmd()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/2021 09:19, Philippe Mathieu-Daudé wrote:

> On 4/1/21 9:49 AM, Mark Cave-Ayland wrote:
>> If the guest tries to read a CDB using DMA and cmdfifo is not empty then it is
>> possible to overflow cmdfifo.
>>
>> Since this can only occur by issuing deliberately incorrect instruction
>> sequences, ensure that the maximum length of the CDB transferred to cmdfifo is
>> limited to the available free space within cmdfifo.
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 7f49522e1d..c547c60395 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -243,6 +243,7 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>>           }
>>           if (s->dma_memory_read) {
>>               s->dma_memory_read(s->dma_opaque, buf, dmalen);
>> +            dmalen = MIN(fifo8_num_free(&s->fifo), dmalen);
> 
> Ditto, GUEST_ERRORS?

Possibly? But then there are several other places where this could also happen. The 
ESP uses the FIFO as a buffer for the SCSI bus in DMA mode, and so at the start of a 
DMA transfer the FIFO can contain leftover junk. This is why all the guest OSs I've 
seen send an explicit "Flush FIFO" command before each command to ensure that any 
junk is removed from the FIFO before sending the message out/CDB.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>>               fifo8_push_all(&s->cmdfifo, buf, dmalen);
>>           } else {
>>               if (esp_select(s) < 0) {
>>

ATB,

Mark.

