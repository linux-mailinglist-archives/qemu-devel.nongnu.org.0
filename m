Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C918240B93B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 22:25:04 +0200 (CEST)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQEzH-0004b1-My
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 16:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQExy-0003v9-JE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:23:42 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38424
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQExs-0003Tl-Km
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 16:23:41 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mQExg-0000tn-3z; Tue, 14 Sep 2021 21:23:28 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-12-mark.cave-ayland@ilande.co.uk>
 <a6134e89-962a-f4ac-8a20-30d26992b237@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <72dd46cf-2d9c-228c-05c7-e4f5d03df191@ilande.co.uk>
Date: Tue, 14 Sep 2021 21:23:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a6134e89-962a-f4ac-8a20-30d26992b237@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 11/20] nubus-device: add romfile property for loading
 declaration ROMs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) KHOP_HELO_FCRDNS=0.399, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 12/09/2021 18:39, Philippe Mathieu-Daudé wrote:

> On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
>> The declaration ROM is located at the top-most address of the standard slot
>> space.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/nubus/nubus-device.c  | 43 +++++++++++++++++++++++++++++++++++++++-
>>   include/hw/nubus/nubus.h |  5 +++++
>>   2 files changed, 47 insertions(+), 1 deletion(-)
> 
>> +    /* Declaration ROM */
> 
>> +        } else if (size > NUBUS_DECL_ROM_MAX_SIZE) {
> 
> I'd check for >= and define as (64 * KiB).

That's a good idea - I'll update this for the v2.

>> +            error_setg(errp, "romfile \"%s\" too large (maximum size 64K)",
>> +                       nd->romfile);
>> +            g_free(path);
>> +            return;
>> +        }
> 
>> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
>> index 87a97516c7..42f4c9dbb8 100644
>> --- a/include/hw/nubus/nubus.h
>> +++ b/include/hw/nubus/nubus.h
>> @@ -39,12 +39,17 @@ struct NubusBus {
>>       uint32_t slot_available_mask;
>>   };
>>   
>> +#define NUBUS_DECL_ROM_MAX_SIZE    0xffff


ATB,

Mark.

