Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACD4216D0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:49:27 +0200 (CEST)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXT1i-0005NR-EH
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXT0r-00042A-G7
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:48:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35662
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXT0q-0005Nz-3f
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:48:33 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXT0b-0007sG-Ab; Mon, 04 Oct 2021 19:48:21 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-4-mark.cave-ayland@ilande.co.uk>
 <ce177c34-4e97-a26f-1408-887e091195bf@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ae0bff82-ebed-e0c0-312f-3b1c9eda77d5@ilande.co.uk>
Date: Mon, 4 Oct 2021 19:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ce177c34-4e97-a26f-1408-887e091195bf@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 03/12] macfb: fix overflow of color_palette array
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
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

On 04/10/2021 09:53, Laurent Vivier wrote:

> Le 02/10/2021 à 12:59, Mark Cave-Ayland a écrit :
>> The palette_current index counter has a maximum size of 256 * 3 to cover a full
>> color palette of 256 RGB entries. Linux assumes that the palette_current index
>> wraps back around to zero after writing 256 RGB entries so ensure that
>> palette_current is reset at this point to prevent data corruption within
>> MacfbState.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 815870f2fe..f4e789d0d7 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -307,6 +307,9 @@ static void macfb_ctrl_write(void *opaque,
>>           if (s->palette_current % 3) {
>>               macfb_invalidate_display(s);
>>           }
>> +        if (s->palette_current >= sizeof(s->color_palette)) {
>> +            s->palette_current = 0;
>> +        }
>>           break;
>>       }
>>   }
>>
> 
> What about "s->palette_current = (s->palette_current + 1) % sizeof(s->color_palette)"?
> 
> Thanks,
> Laurent

Sure, I can update that for v2.


ATB,

Mark.

