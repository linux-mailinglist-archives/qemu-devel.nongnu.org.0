Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C464931860B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:04:07 +0100 (CET)
Received: from localhost ([::1]:33374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA6xK-0000gP-GY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lA6vW-00005T-Uk
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:02:14 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59642
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lA6vM-0000C4-NA
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:02:14 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lA6vX-0003uA-VQ; Thu, 11 Feb 2021 08:02:20 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-16-mark.cave-ayland@ilande.co.uk>
 <fcaa4613-9b90-d41e-e00b-8b7e7e6081ff@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0830b4d4-2c7f-0f67-04f6-7141a987fa75@ilande.co.uk>
Date: Thu, 11 Feb 2021 08:01:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fcaa4613-9b90-d41e-e00b-8b7e7e6081ff@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 15/42] esp: introduce esp_pdma_read() and
 esp_pdma_write() functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.211,
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

On 10/02/2021 22:51, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 28 ++++++++++++++++++++--------
>>   1 file changed, 20 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index e7cf36f4b8..b0cba889a9 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -151,6 +151,20 @@ static uint8_t *get_pdma_buf(ESPState *s)
>>       return NULL;
>>   }
>>   
> 
> Can you add get_pdma_len() (similar to get_pdma_buf) and ...
> 
>> +static uint8_t esp_pdma_read(ESPState *s)
>> +{
>> +    uint8_t *buf = get_pdma_buf(s);
>> +
> 
>         assert(s->pdma_cur < get_pdma_len(s));
> 
>> +    return buf[s->pdma_cur++];
>> +}
>> +
>> +static void esp_pdma_write(ESPState *s, uint8_t val)
>> +{
>> +    uint8_t *buf = get_pdma_buf(s);
>> +
> 
> Ditto.
> 
>> +    buf[s->pdma_cur++] = val;
>> +}
> 
> Otherwise:
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

One of the main purposes of this patchset is actually to completely remove all of 
these pdma_* variables and integrate everything into the existing FIFO and cmd 
buffers, so if you continue reading through the patchset you'll see that this soon 
disappears.

Even better towards the end you can see that both of these buffers are eventually 
replaced with QEMU's Fifo8 which has in-built assert()s to protect from underflow and 
overflow which should protect against memory corruption.


ATB,

Mark.

