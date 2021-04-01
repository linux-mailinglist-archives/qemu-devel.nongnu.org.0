Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2388351131
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:53:44 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRt5D-0005cT-UN
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt3Z-0003jQ-Bb
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:52:01 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57284
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt3X-0005F7-Mp
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:52:01 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lRt3c-0004jk-6y; Thu, 01 Apr 2021 09:52:08 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, alxndr@bu.edu, laurent@vivier.eu, pbonzini@redhat.com
References: <20210401074933.9923-1-mark.cave-ayland@ilande.co.uk>
 <20210401074933.9923-8-mark.cave-ayland@ilande.co.uk>
 <2c2f7f50-a4bd-916f-6c71-a61dd4b566e9@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <8cd25d29-6442-9d10-63cb-58d165e944f1@ilande.co.uk>
Date: Thu, 1 Apr 2021 09:51:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <2c2f7f50-a4bd-916f-6c71-a61dd4b566e9@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 07/11] esp: don't underflow cmdfifo in do_cmd()
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
>> If the guest tries to execute a CDB when cmdfifo is not empty before the start
>> of the message out phase then clearing the message out phase data will cause
>> cmdfifo to underflow due to cmdfifo_cdb_offset being larger than the amount of
>> data within.
>>
>> Since this can only occur by issuing deliberately incorrect instruction
>> sequences, ensure that the maximum length of esp_fifo_pop_buf() is limited to
>> the size of the data within cmdfifo.
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1909247
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index 4decbbfc29..7f49522e1d 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -319,13 +319,15 @@ static void do_busid_cmd(ESPState *s, uint8_t busid)
>>   
>>   static void do_cmd(ESPState *s)
>>   {
>> -    uint8_t busid = fifo8_pop(&s->cmdfifo);
>> +    uint8_t busid = esp_fifo_pop(&s->cmdfifo);
>> +    int len;
>>   
>>       s->cmdfifo_cdb_offset--;
>>   
>>       /* Ignore extended messages for now */
>>       if (s->cmdfifo_cdb_offset) {
>> -        esp_fifo_pop_buf(&s->cmdfifo, NULL, s->cmdfifo_cdb_offset);
>> +        len = MIN(s->cmdfifo_cdb_offset, fifo8_num_used(&s->cmdfifo));
> 
> Do we want to log(GUEST_ERRORS) this?

Not for this case, since a guest OS may legitimately try a SDTR negotiation using 
extended messages which the ESP implementation currently ignores.

>> +        esp_fifo_pop_buf(&s->cmdfifo, NULL, len);
>>           s->cmdfifo_cdb_offset = 0;
>>       }
>>   
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


ATB,

Mark.

