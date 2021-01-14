Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156F32F5E2E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:59:57 +0100 (CET)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzQ4-00018q-5E
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzzOW-0000j4-Cc
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:58:20 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41224
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzzOU-0003ni-ED
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:58:20 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kzzOZ-0007jC-EP; Thu, 14 Jan 2021 09:58:28 +0000
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210114083329.10494-1-mark.cave-ayland@ilande.co.uk>
 <c1190557-8959-3c41-ae53-72504243f109@suse.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ec32506f-ec83-d166-f444-efa33e2867e9@ilande.co.uk>
Date: Thu, 14 Jan 2021 09:58:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c1190557-8959-3c41-ae53-72504243f109@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] utils/fifo8: change fatal errors from abort() to assert()
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

On 14/01/2021 09:07, Claudio Fontana wrote:

> On 1/14/21 9:33 AM, Mark Cave-Ayland wrote:
>> Developer errors are better represented with assert() rather than abort().
> 
> ... "also, make the tests more strict"
> 
> I'd add this since the checks have been changed sometimes in the patch to be more strict.
> 
> Reviewed-by: Claudio Fontana <cfontana@suse.de>

Oh, that was not intentional on my part - I was aiming to keep the same logic but 
effectively invert the logic to keep the assert() happy. What did I miss?


ATB,

Mark.

>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>> This was suggested by Peter during a discussion on IRC yesterday.
>>
>> ---
>>   util/fifo8.c | 16 ++++------------
>>   1 file changed, 4 insertions(+), 12 deletions(-)
>>
>> diff --git a/util/fifo8.c b/util/fifo8.c
>> index a5dd789ce5..d4d1c135e0 100644
>> --- a/util/fifo8.c
>> +++ b/util/fifo8.c
>> @@ -31,9 +31,7 @@ void fifo8_destroy(Fifo8 *fifo)
>>   
>>   void fifo8_push(Fifo8 *fifo, uint8_t data)
>>   {
>> -    if (fifo->num == fifo->capacity) {
>> -        abort();
>> -    }
>> +    assert(fifo->num < fifo->capacity);
>>       fifo->data[(fifo->head + fifo->num) % fifo->capacity] = data;
>>       fifo->num++;
>>   }
>> @@ -42,9 +40,7 @@ void fifo8_push_all(Fifo8 *fifo, const uint8_t *data, uint32_t num)
>>   {
>>       uint32_t start, avail;
>>   
>> -    if (fifo->num + num > fifo->capacity) {
>> -        abort();
>> -    }
>> +    assert(fifo->num + num <= fifo->capacity);
>>   
>>       start = (fifo->head + fifo->num) % fifo->capacity;
>>   
>> @@ -63,9 +59,7 @@ uint8_t fifo8_pop(Fifo8 *fifo)
>>   {
>>       uint8_t ret;
>>   
>> -    if (fifo->num == 0) {
>> -        abort();
>> -    }
>> +    assert(fifo->num > 0);
>>       ret = fifo->data[fifo->head++];
>>       fifo->head %= fifo->capacity;
>>       fifo->num--;
>> @@ -76,9 +70,7 @@ const uint8_t *fifo8_pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
>>   {
>>       uint8_t *ret;
>>   
>> -    if (max == 0 || max > fifo->num) {
>> -        abort();
>> -    }
>> +    assert(max > 0 && max <= fifo->num);
>>       *num = MIN(fifo->capacity - fifo->head, max);
>>       ret = &fifo->data[fifo->head];
>>       fifo->head += *num;
>>
> 
> 


