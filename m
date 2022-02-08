Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9EF4ADB21
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:27:56 +0100 (CET)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRTH-0002op-N9
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:27:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPmS-0008Qg-72
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:39:38 -0500
Received: from [2001:41c9:1:41f::167] (port=51696
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPmM-0004A4-Ar
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:39:32 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPlX-00075Y-26; Tue, 08 Feb 2022 12:38:43 +0000
Message-ID: <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
Date: Tue, 8 Feb 2022 12:39:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YgJWPzFczlDBJV/I@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 11:38, Daniel P. Berrangé wrote:

> On Thu, Jan 27, 2022 at 08:54:02PM +0000, Mark Cave-Ayland wrote:
>> This displays detailed information about the device registers and timers to aid
>> debugging problems with timers and interrupts.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hmp-commands-info.hx | 12 ++++++
>>   hw/misc/mos6522.c    | 92 ++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 104 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index e90f20a107..4e714e79a2 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -879,3 +879,15 @@ SRST
>>     ``info sgx``
>>       Show intel SGX information.
>>   ERST
>> +
>> +    {
>> +        .name       = "via",
>> +        .args_type  = "",
>> +        .params     = "",
>> +        .help       = "show guest 6522 VIA devices",
>> +    },
>> +
>> +SRST
>> +  ``info via``
>> +    Show guest 6522 VIA devices.
>> +ERST
>> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
>> index aaae195d63..cfa6a9c44b 100644
>> --- a/hw/misc/mos6522.c
>> +++ b/hw/misc/mos6522.c
>> @@ -30,6 +30,8 @@
>>   #include "hw/misc/mos6522.h"
>>   #include "hw/qdev-properties.h"
>>   #include "migration/vmstate.h"
>> +#include "monitor/monitor.h"
>> +#include "qapi/type-helpers.h"
>>   #include "qemu/timer.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/log.h"
>> @@ -415,6 +417,95 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>>       }
>>   }
>>   
>> +static int qmp_x_query_via_foreach(Object *obj, void *opaque)
> 
> 
>> +
>> +static HumanReadableText *qmp_x_query_via(Error **errp)
>> +{
>> +    g_autoptr(GString) buf = g_string_new("");
>> +
>> +    object_child_foreach_recursive(object_get_root(),
>> +                                   qmp_x_query_via_foreach, buf);
>> +
>> +    return human_readable_text_from_str(buf);
>> +}
> 
> This provides a code handler for a QMP command which is good,
> but doesn't ever define the QMP command in the qapi/ schema.

First of all, thank you for writing the docs at 
https://www.qemu.org/docs/master/devel/writing-monitor-commands.html#writing-a-debugging-aid-returning-unstructured-text 
which were really useful when writing this patch.

I was under the impression that monitor_register_hmp_info_hrt() does all the magic 
here i.e. it declares the underlying QMP command with an x- prefix and effectively 
encapsulates the text field in a way that says "this is an unreliable text opaque for 
humans"?

If a qapi/ schema is needed could you explain what it should look like for this 
example and where it should go? Looking at the existing .json files I can't 
immediately see one which is the right place for this to live.

>>   static const MemoryRegionOps mos6522_ops = {
>>       .read = mos6522_read,
>>       .write = mos6522_write,
>> @@ -547,6 +638,7 @@ static const TypeInfo mos6522_type_info = {
>>   static void mos6522_register_types(void)
>>   {
>>       type_register_static(&mos6522_type_info);
>> +    monitor_register_hmp_info_hrt("via", qmp_x_query_via);
> 
> This only registers the HMP counterpart.
> 
> The idea of the HumanReadableText handler is that it is calling
> a QMP command that is exposed to apps.
> 
>>   }
> 
> Regards,
> Daniel


ATB,

Mark.

