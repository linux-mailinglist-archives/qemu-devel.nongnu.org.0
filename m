Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B653A5DDC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 09:45:46 +0200 (CEST)
Received: from localhost ([::1]:52112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshI1-0001FI-Kz
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 03:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lshGh-0000YW-VX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:44:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41836
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lshGg-0004Gv-6A
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:44:23 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lshGQ-0001rO-5U; Mon, 14 Jun 2021 08:44:10 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 pbonzini@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu,
 hpoussin@reactos.org
References: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
 <75bf9945-9953-ba75-048a-a1570c6746ac@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0940b4dd-563e-6c9b-fd66-91f5bc664ef3@ilande.co.uk>
Date: Mon, 14 Jun 2021 08:44:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <75bf9945-9953-ba75-048a-a1570c6746ac@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] esp: fix migration version check in esp_is_version_5()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.144,
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

On 14/06/2021 06:42, Philippe Mathieu-Daudé wrote:

> On 6/13/21 12:26 PM, Mark Cave-Ayland wrote:
>> Commit 4e78f3bf35 "esp: defer command completion interrupt on incoming data
>> transfers" added a version check for use with VMSTATE_*_TEST macros to allow
>> migration from older QEMU versions. Unfortunately the version check fails to
>> work in its current form since if the VMStateDescription version_id is
>> incremented, the test returns false and so the fields are not included in the
>> outgoing migration stream.
>>
>> Change the version check to use >= rather == to ensure that migration works
>> correctly when the ESPState VMStateDescription has version_id > 5.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on incoming data transfers")
>> ---
> Well, it is not buggy yet :)

:)

>>   hw/scsi/esp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
>> index bfdb94292b..39756ddd99 100644
>> --- a/hw/scsi/esp.c
>> +++ b/hw/scsi/esp.c
>> @@ -1120,7 +1120,7 @@ static bool esp_is_version_5(void *opaque, int version_id)
> 
> Can you rename esp_is_at_least_version_5()?

Sure, I can rename it if you like but it will of course make the diff noisier. 
esp_is_at_least_version_5() seems quite a mouthful though, what about 
esp_min_version_5() instead?

>>       ESPState *s = ESP(opaque);
>>   
>>       version_id = MIN(version_id, s->mig_version_id);
>> -    return version_id == 5;
>> +    return version_id >= 5;
>>   }
>>   
>>   int esp_pre_save(void *opaque)


ATB,

Mark.

