Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B64216CF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:48:56 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXT1D-0003yE-2d
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSzU-0003H2-Fe
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:47:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35648
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSzS-0004J9-Dj
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:47:08 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSzD-0007rI-4h; Mon, 04 Oct 2021 19:46:55 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-8-mark.cave-ayland@ilande.co.uk>
 <7c8f79d6-b4e5-3105-81f7-57636affc9b7@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f61dfbad-8965-e737-94ea-82fab2245d8b@ilande.co.uk>
Date: Mon, 4 Oct 2021 19:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7c8f79d6-b4e5-3105-81f7-57636affc9b7@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 07/12] macfb: add qdev property to specify display type
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

On 02/10/2021 15:04, Philippe Mathieu-Daudé wrote:

> On 10/2/21 13:00, Mark Cave-Ayland wrote:
>> Since the available resolutions and colour depths are determined by the attached
>> display type, add a qdev property to allow the display type to be specified.
>>
>> The main resolutions of interest are high resolution 1152x870 with 8-bit colour
>> and SVGA resolution up to 800x600 with 32-bit colour so update the q800 machine
>> to allow high resolution mode if specified and otherwise fall back to SVGA.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c         | 6 +++++-
>>   hw/m68k/q800.c             | 5 +++++
>>   include/hw/display/macfb.h | 1 +
>>   3 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 5c95aa4a11..023d1f0cd1 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -316,7 +316,7 @@ static uint32_t macfb_sense_read(MacfbState *s)
>>       MacFbSense *macfb_sense;
>>       uint8_t sense;
>>   
> 
> What about:
> 
>         assert(s->type < ARRAY_SIZE(macfb_sense_table));
> 
>> -    macfb_sense = &macfb_sense_table[MACFB_DISPLAY_VGA];
>> +    macfb_sense = &macfb_sense_table[s->type];
> 
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Agreed, I will add this in for v2.


ATB,

Mark.

