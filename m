Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CC4216BC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:41:57 +0200 (CEST)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXSuS-0007bi-OO
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSsP-0005dE-7M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:39:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35636
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSsN-0006kj-Ms
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:39:48 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mXSs9-0007oU-2w; Mon, 04 Oct 2021 19:39:37 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-2-mark.cave-ayland@ilande.co.uk>
 <68e66972-90da-58c9-8a06-1249f8c69576@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4262be04-61ae-caef-3872-eaa4dc973eae@ilande.co.uk>
Date: Mon, 4 Oct 2021 19:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <68e66972-90da-58c9-8a06-1249f8c69576@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 01/12] macfb: handle errors that occur during realize
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

On 02/10/2021 14:47, Philippe Mathieu-Daudé wrote:

> On 10/2/21 12:59, Mark Cave-Ayland wrote:
>> Make sure any errors that occur within the macfb realize chain are detected
>> and handled correctly to prevent crashes and to ensure that error messages are
>> reported back to the user.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/display/macfb.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 76808b69cc..2b747a8de8 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -379,6 +379,10 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>>       MacfbState *ms = &s->macfb;
>>   
>>       macfb_common_realize(dev, ms, errp);
>> +    if (*errp) {
>> +        return;
>> +    }
> 
> See a related discussion:
> https://lore.kernel.org/qemu-devel/87bl47ll9l.fsf@dusky.pond.sub.org/

Interesting, thanks for the link. I will update macfb_common_realize() to return a 
boolean for v2.


ATB,

Mark.

