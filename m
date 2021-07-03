Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227073BA8E8
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:23:36 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzgYR-0005ua-69
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgXA-0003ew-Pa
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:22:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzgX9-0001gy-1A
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:22:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso7126357wme.0
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dnWC6qKWoED5DC3C6tUA3mT2JBKEoX7cxPQAKRZ0M2o=;
 b=d7WYvhTGOrOa6vXNzVkyhYZGPRPL2e/m3SqlCnn59zTaYzNi/oo5MM+/tSjVOndn8y
 Yt3l0gxq7w+GJGrhF5WHUORVSwHU09B3kk2YdIiSPc3GepExyJsoi3b97O7+R6/1cgAx
 dQAtiqvOSg0A3jbSGHn4XXrfv8PJ0AbrQkmCNWoPJwza/83XMj/CXxcdTkp4iVhDFzPe
 ZabjfmLoG0xfLaI+7WJ0XLFhwGcUM76dQruvB1SzAtad9uMig69LoHPS+HCNjKNHcu3I
 w6MVzjKok8e1R9y3n+COfQuu6iX3AMgvTOZSyzhwsvM0jlNON4Jwz70h3U1PuPl7DLDU
 IcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnWC6qKWoED5DC3C6tUA3mT2JBKEoX7cxPQAKRZ0M2o=;
 b=Bn05hKDSiIUb1aE9B2vPRr6m4nw2S3watH0lIYH5eu/V9tP2HhbS/nTxaAQ6SJUaz9
 ZuDS6pgy9z7kCUrfnxJbusI2Dqk5Wlrx98AbpjRJMXFLY7Z8LQEndgOf257zCK3M2QxS
 LigC6UF2VtS4LNTPYZoq59rxRsgKbyhtp1U/1fZzfMBWC8RfhNhB/lfD8Kz8+6D7Mhva
 RT3PRc5ldwI/gPVAsgLHs3QDt80J4dD6QJHJV/t4GQFpHzuBRnFAI7RD1AiuxcAbfkI2
 ntsJMbHTVqMrKaABRgnTbBwm9YwLaYmIcNNFowrizIs6bYVt/8y0MzX/xGydyX7d5s5V
 sLSQ==
X-Gm-Message-State: AOAM533Z/oOpSCUpUI3wVweBrKmA4gfS75B61dyE8I4VbTL3JrFwyj+S
 MpY6ge2E1yx5p5nwVXOb680=
X-Google-Smtp-Source: ABdhPJzBslN+viHu0hVONG5zIsu0GGm2GiFhZwOzTMeDAuB32O3o8BhicejuNZCc4cgc40ny+WiboA==
X-Received: by 2002:a1c:f206:: with SMTP id s6mr4941203wmc.102.1625322133660; 
 Sat, 03 Jul 2021 07:22:13 -0700 (PDT)
Received: from [192.168.43.238] (184.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.184])
 by smtp.gmail.com with ESMTPSA id v15sm16233204wmj.39.2021.07.03.07.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 07:22:13 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Finn Thain <fthain@linux-m68k.org>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
 <a6fae6a6-4fbd-a75c-96b5-403ba3658217@amsat.org>
 <82eeaede-12e7-29f3-9084-33105f5cb61e@linux-m68k.org>
 <5d13cc8c-237c-83c8-bc0c-aecc1d531df5@ilande.co.uk>
 <d389779d-a63b-8ecb-b3a4-aed2f32d97d4@amsat.org>
 <1eb37600-7aa4-1803-562a-5a60500ed1dd@ilande.co.uk>
 <7a5c9aa3-6665-3b2e-9dc2-017647316e6e@amsat.org>
 <d173b067-00b7-c734-832f-cdf3c72728c1@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40f310f4-bb60-cb42-0d22-3d8e0d0d037a@amsat.org>
Date: Sat, 3 Jul 2021 16:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d173b067-00b7-c734-832f-cdf3c72728c1@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com, laurent@vivier.eu,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 4:16 PM, Mark Cave-Ayland wrote:
> On 03/07/2021 14:10, Philippe Mathieu-Daudé wrote:
>> On 7/3/21 2:04 PM, Mark Cave-Ayland wrote:

>>> I've tested this under Linux/m68k, NetBSD/arc and MacOS and networking
>>> seems fine after a quick test in each OS. The slight curiosity is that
>>> the 4 byte accesses used by MacOS are split into 2 x 2 byte accesses,
>>> but since MacOS only uses the bottom 16-bit of the result and ignores
>>> the top 16-bits then despite there being 2 accesses, everything still
>>> works as expected (see below).
>>>
>>>
>>> READ:
>>>
>>> dp8393x_read reg=0x28 [SR] val=0x0004 size=2
>>> memory_region_ops_read cpu 0 mr 0x55f210f44830 addr 0x5000a0a0 value 0x4
>>> size 2
>>> dp8393x_read reg=0x28 [SR] val=0x0004 size=2
>>> memory_region_ops_read cpu 0 mr 0x55f210f44830 addr 0x5000a0a2 value 0x4
>>> size 2
>>> memory_region_ops_read cpu 0 mr 0x55f210c9c330 addr 0x50f0a0a0 value
>>> 0x40004 size 4
>>>
>>> WRITE:
>>>
>>> memory_region_ops_write cpu 0 mr 0x55f210c9c330 addr 0x50f0a01c value
>>> 0x248fe8 size 4
>>> memory_region_ops_write cpu 0 mr 0x55f210f44830 addr 0x5000a01c value
>>> 0x24 size 2
>>> dp8393x_write reg=0x7 [CTDA] val=0x0024 size=2
>>> memory_region_ops_write cpu 0 mr 0x55f210f44830 addr 0x5000a01e value
>>> 0x8fe8 size 2
>>> dp8393x_write reg=0x7 [CTDA] val=0x8fe8 size=2
>>>
>>>
>>> If you're happy with this, I'll resubmit a revised version of the patch
>>> but with an updated commit message: the Fixes: tag is still the same,
>>> but the updated fix is to ensure that .impl.min_access_size and
>>> .impl.max_access_size match the real-life 16-bit register size.
>>
>> Hold on a bit more, I'm still reviewing the datasheet ;)
>>
>> My code note so far (untested) are:
>>
>> -- >8 --
>> @@ -219,34 +225,48 @@ static uint32_t dp8393x_wt(dp8393xState *s)
>>       return s->regs[SONIC_WT1] << 16 | s->regs[SONIC_WT0];
>>   }
>>
>> -static uint16_t dp8393x_get(dp8393xState *s, int width, int offset)
>> +static uint16_t dp8393x_get(dp8393xState *s, hwaddr addr, unsigned
>> ofs16)
>>   {
>> +    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>>       uint16_t val;
>>
>> -    if (s->big_endian) {
>> -        val = be16_to_cpu(s->data[offset * width + width - 1]);
>> +    if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
>> +        addr += 2 * ofs16;
>> +        if (s->big_endian) {
>> +            val = address_space_ldl_be(&s->as, addr, attrs, NULL);
>> +        } else {
>> +            val = address_space_ldl_le(&s->as, addr, attrs, NULL);
>> +        }
>>       } else {
>> -        val = le16_to_cpu(s->data[offset * width]);
>> +        addr += 1 * ofs16;
>> +        if (s->big_endian) {
>> +            val = address_space_lduw_be(&s->as, addr, attrs, NULL);
>> +        } else {
>> +            val = address_space_lduw_le(&s->as, addr, attrs, NULL);
>> +        }
>>       }
>> +
>>       return val;
>>   }

>>       /* Check link field */
>> -    size = sizeof(uint16_t) * width;
>> -    address_space_read(&s->as,
>> -                       dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
>> -                       MEMTXATTRS_UNSPECIFIED, s->data, size);
>> -    s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
>> +    s->regs[SONIC_LLFA] = dp8393x_get(s, dp8393x_crda(s), 5);
>>       if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
>>           /* EOL detected */
>>           s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
>>       } else {
>>           /* Clear in_use */
>> -        size = sizeof(uint16_t) * width;
>> -        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
>> -        dp8393x_put(s, width, 0, 0);
>> -        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
>> -                            s->data, size);
>> +        dp8393x_put(s, dp8393x_crda(s), 6, 0x0000);
>>
>>           /* Move to next descriptor */
>>           s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
>> ---
>>
>> Now I'll look at the CAM then the cksum.
> 
> I see, so you're also looking to consolidate all the address space
> accesses via the dp8393x_get() and dp8393x_put() functions instead of
> using s->data as an intermediatery - that makes sense to me. Once you
> have a patch that works for MIPS let me know and I can give a test on
> Linux/m68k and MacOS :)

Done and sent. Thanks for the testing :)

